; ModuleID = 'error.c'
source_filename = "error.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct._IO_FILE = type opaque
%struct.variable = type { i8*, i8*, i8*, %struct.variable* (%struct.variable*)*, %struct.variable* (%struct.variable*, i8*, i64, i8*)*, i32, i32 }
%struct.array = type { i32, i64, i32, %struct.array_element* }
%struct.array_element = type { i64, i8*, %struct.array_element*, %struct.array_element* }

@.str = private unnamed_addr constant [25 x i8] c"bash-maintainers@gnu.org\00", align 1
@the_current_maintainer = constant i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str, i32 0, i32 0), align 4
@gnu_error_format = global i32 0, align 4
@interactive_shell = external global i32, align 4
@.str.1 = private unnamed_addr constant [12 x i8] c"BASH_SOURCE\00", align 1
@dollar_vars = external global [0 x i8*], align 4
@shell_name = external global i8*, align 4
@.str.2 = private unnamed_addr constant [5 x i8] c"bash\00", align 1
@.str.3 = private unnamed_addr constant [7 x i8] c"%s: %s\00", align 1
@stderr = external constant %struct._IO_FILE*, align 4
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@remember_on_history = external global i32, align 4
@.str.5 = private unnamed_addr constant [18 x i8] c"last command: %s\0A\00", align 1
@.str.6 = private unnamed_addr constant [7 x i8] c"(null)\00", align 1
@.str.7 = private unnamed_addr constant [12 x i8] c"Aborting...\00", align 1
@exit_immediately_on_error = external global i32, align 4
@last_command_exit_value = external global i32, align 4
@.str.8 = private unnamed_addr constant [10 x i8] c"warning: \00", align 1
@.str.9 = private unnamed_addr constant [9 x i8] c"INFORM: \00", align 1
@.str.10 = private unnamed_addr constant [6 x i8] c": %s\0A\00", align 1
@interactive = external global i32, align 4
@.str.11 = private unnamed_addr constant [5 x i8] c"%s: \00", align 1
@.str.12 = private unnamed_addr constant [14 x i8] c"%s: %s:%s%d: \00", align 1
@.str.13 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.14 = private unnamed_addr constant [7 x i8] c" line \00", align 1
@.str.15 = private unnamed_addr constant [10 x i8] c"%s:%s%d: \00", align 1
@.str.16 = private unnamed_addr constant [11 x i8] c"%s: %s: %d\00", align 1
@cmd_error_table = internal constant [5 x i8*] [i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.19, i32 0, i32 0), i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.20, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.21, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.22, i32 0, i32 0), i8* null], align 4
@bash_badsub_errmsg = external constant i8*, align 4
@.str.17 = private unnamed_addr constant [21 x i8] c"%s: unbound variable\00", align 1
@.str.18 = private unnamed_addr constant [22 x i8] c"%s: readonly variable\00", align 1
@.str.19 = private unnamed_addr constant [22 x i8] c"unknown command error\00", align 1
@.str.20 = private unnamed_addr constant [17 x i8] c"bad command type\00", align 1
@.str.21 = private unnamed_addr constant [14 x i8] c"bad connector\00", align 1
@.str.22 = private unnamed_addr constant [9 x i8] c"bad jump\00", align 1

; Function Attrs: noinline nounwind
define i8* @get_name_for_error() #0 {
entry:
  %name = alloca i8*, align 4
  %bash_source_v = alloca %struct.variable*, align 4
  %bash_source_a = alloca %struct.array*, align 4
  store i8* null, i8** %name, align 4
  %0 = load i32, i32* @interactive_shell, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end11

if.then:                                          ; preds = %entry
  %call = call %struct.variable* @find_variable(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0))
  store %struct.variable* %call, %struct.variable** %bash_source_v, align 4
  %1 = load %struct.variable*, %struct.variable** %bash_source_v, align 4
  %tobool = icmp ne %struct.variable* %1, null
  br i1 %tobool, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %if.then
  %2 = load %struct.variable*, %struct.variable** %bash_source_v, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %2, i32 0, i32 5
  %3 = load i32, i32* %attributes, align 4
  %and = and i32 %3, 4
  %tobool1 = icmp ne i32 %and, 0
  br i1 %tobool1, label %land.lhs.true2, label %if.end

land.lhs.true2:                                   ; preds = %land.lhs.true
  %4 = load %struct.variable*, %struct.variable** %bash_source_v, align 4
  %value = getelementptr inbounds %struct.variable, %struct.variable* %4, i32 0, i32 1
  %5 = load i8*, i8** %value, align 4
  %6 = bitcast i8* %5 to %struct.array*
  store %struct.array* %6, %struct.array** %bash_source_a, align 4
  %tobool3 = icmp ne %struct.array* %6, null
  br i1 %tobool3, label %if.then4, label %if.end

if.then4:                                         ; preds = %land.lhs.true2
  %7 = load %struct.array*, %struct.array** %bash_source_a, align 4
  %call5 = call i8* @array_reference(%struct.array* %7, i64 0)
  store i8* %call5, i8** %name, align 4
  br label %if.end

if.end:                                           ; preds = %if.then4, %land.lhs.true2, %land.lhs.true, %if.then
  %8 = load i8*, i8** %name, align 4
  %cmp6 = icmp eq i8* %8, null
  br i1 %cmp6, label %if.then9, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end
  %9 = load i8*, i8** %name, align 4
  %10 = load i8, i8* %9, align 1
  %conv = sext i8 %10 to i32
  %cmp7 = icmp eq i32 %conv, 0
  br i1 %cmp7, label %if.then9, label %if.end10

if.then9:                                         ; preds = %lor.lhs.false, %if.end
  %11 = load i8*, i8** getelementptr inbounds ([0 x i8*], [0 x i8*]* @dollar_vars, i32 0, i32 0), align 4
  store i8* %11, i8** %name, align 4
  br label %if.end10

if.end10:                                         ; preds = %if.then9, %lor.lhs.false
  br label %if.end11

if.end11:                                         ; preds = %if.end10, %entry
  %12 = load i8*, i8** %name, align 4
  %cmp12 = icmp eq i8* %12, null
  br i1 %cmp12, label %land.lhs.true14, label %if.end21

land.lhs.true14:                                  ; preds = %if.end11
  %13 = load i8*, i8** @shell_name, align 4
  %tobool15 = icmp ne i8* %13, null
  br i1 %tobool15, label %land.lhs.true16, label %if.end21

land.lhs.true16:                                  ; preds = %land.lhs.true14
  %14 = load i8*, i8** @shell_name, align 4
  %15 = load i8, i8* %14, align 1
  %conv17 = sext i8 %15 to i32
  %tobool18 = icmp ne i32 %conv17, 0
  br i1 %tobool18, label %if.then19, label %if.end21

if.then19:                                        ; preds = %land.lhs.true16
  %16 = load i8*, i8** @shell_name, align 4
  %call20 = call i8* @base_pathname(i8* %16)
  store i8* %call20, i8** %name, align 4
  br label %if.end21

if.end21:                                         ; preds = %if.then19, %land.lhs.true16, %land.lhs.true14, %if.end11
  %17 = load i8*, i8** %name, align 4
  %cmp22 = icmp eq i8* %17, null
  br i1 %cmp22, label %if.then24, label %if.end25

if.then24:                                        ; preds = %if.end21
  store i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i32 0, i32 0), i8** %name, align 4
  br label %if.end25

if.end25:                                         ; preds = %if.then24, %if.end21
  %18 = load i8*, i8** %name, align 4
  ret i8* %18
}

declare %struct.variable* @find_variable(i8*) #1

declare i8* @array_reference(%struct.array*, i64) #1

declare i8* @base_pathname(i8*) #1

; Function Attrs: noinline nounwind
define void @file_error(i8* %filename) #0 {
entry:
  %filename.addr = alloca i8*, align 4
  store i8* %filename, i8** %filename.addr, align 4
  %0 = load i8*, i8** %filename.addr, align 4
  %call = call i32* @__errno_location()
  %1 = load i32, i32* %call, align 4
  %call1 = call i8* @strerror(i32 %1)
  call void (i8*, ...) @report_error(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i32 0, i32 0), i8* %0, i8* %call1)
  ret void
}

; Function Attrs: noinline nounwind
define void @report_error(i8* %format, ...) #0 {
entry:
  %format.addr = alloca i8*, align 4
  %args = alloca [4 x i32], align 4
  store i8* %format, i8** %format.addr, align 4
  call void @error_prolog(i32 1)
  %arraydecay = getelementptr inbounds [4 x i32], [4 x i32]* %args, i32 0, i32 0
  %arraydecay1 = bitcast i32* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %1 = load i8*, i8** %format.addr, align 4
  %arraydecay2 = getelementptr inbounds [4 x i32], [4 x i32]* %args, i32 0, i32 0
  %call = call i32 @vfprintf(%struct._IO_FILE* %0, i8* %1, i32* %arraydecay2)
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %call3 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0))
  %arraydecay4 = getelementptr inbounds [4 x i32], [4 x i32]* %args, i32 0, i32 0
  %arraydecay45 = bitcast i32* %arraydecay4 to i8*
  call void @llvm.va_end(i8* %arraydecay45)
  %3 = load i32, i32* @exit_immediately_on_error, align 4
  %tobool = icmp ne i32 %3, 0
  br i1 %tobool, label %if.then, label %if.end7

if.then:                                          ; preds = %entry
  %4 = load i32, i32* @last_command_exit_value, align 4
  %cmp = icmp eq i32 %4, 0
  br i1 %cmp, label %if.then6, label %if.end

if.then6:                                         ; preds = %if.then
  store i32 1, i32* @last_command_exit_value, align 4
  br label %if.end

if.end:                                           ; preds = %if.then6, %if.then
  %5 = load i32, i32* @last_command_exit_value, align 4
  call void @exit_shell(i32 %5) #4
  unreachable

if.end7:                                          ; preds = %entry
  ret void
}

declare i8* @strerror(i32) #1

declare i32* @__errno_location() #1

; Function Attrs: noinline nounwind
define void @programming_error(i8* %format, ...) #0 {
entry:
  %format.addr = alloca i8*, align 4
  %args = alloca [4 x i32], align 4
  %h = alloca i8*, align 4
  store i8* %format, i8** %format.addr, align 4
  %arraydecay = getelementptr inbounds [4 x i32], [4 x i32]* %args, i32 0, i32 0
  %arraydecay1 = bitcast i32* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %1 = load i8*, i8** %format.addr, align 4
  %arraydecay2 = getelementptr inbounds [4 x i32], [4 x i32]* %args, i32 0, i32 0
  %call = call i32 @vfprintf(%struct._IO_FILE* %0, i8* %1, i32* %arraydecay2)
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %call3 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0))
  %arraydecay4 = getelementptr inbounds [4 x i32], [4 x i32]* %args, i32 0, i32 0
  %arraydecay45 = bitcast i32* %arraydecay4 to i8*
  call void @llvm.va_end(i8* %arraydecay45)
  %3 = load i32, i32* @remember_on_history, align 4
  %tobool = icmp ne i32 %3, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call6 = call i8* @last_history_line()
  store i8* %call6, i8** %h, align 4
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %call7 = call i8* @libintl_gettext(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.5, i32 0, i32 0))
  %5 = load i8*, i8** %h, align 4
  %tobool8 = icmp ne i8* %5, null
  br i1 %tobool8, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then
  %6 = load i8*, i8** %h, align 4
  br label %cond.end

cond.false:                                       ; preds = %if.then
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %6, %cond.true ], [ getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i32 0, i32 0), %cond.false ]
  %call9 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* %call7, i8* %cond)
  br label %if.end

if.end:                                           ; preds = %cond.end, %entry
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %call10 = call i8* @libintl_gettext(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.7, i32 0, i32 0))
  %call11 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* %call10)
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %call12 = call i32 @fflush(%struct._IO_FILE* %8)
  call void @abort() #4
  unreachable

return:                                           ; No predecessors!
  ret void
}

; Function Attrs: nounwind
declare void @llvm.va_start(i8*) #2

declare i32 @vfprintf(%struct._IO_FILE*, i8*, i32*) #1

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind
declare void @llvm.va_end(i8*) #2

declare i8* @last_history_line() #1

declare i8* @libintl_gettext(i8*) #1

declare i32 @fflush(%struct._IO_FILE*) #1

; Function Attrs: noreturn
declare void @abort() #3

; Function Attrs: noinline nounwind
define internal void @error_prolog(i32 %print_lineno) #0 {
entry:
  %print_lineno.addr = alloca i32, align 4
  %ename = alloca i8*, align 4
  %line = alloca i32, align 4
  store i32 %print_lineno, i32* %print_lineno.addr, align 4
  %call = call i8* @get_name_for_error()
  store i8* %call, i8** %ename, align 4
  %0 = load i32, i32* %print_lineno.addr, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %land.lhs.true, label %cond.false

land.lhs.true:                                    ; preds = %entry
  %1 = load i32, i32* @interactive_shell, align 4
  %cmp = icmp eq i32 %1, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true
  %call1 = call i32 @executing_line_number()
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true, %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call1, %cond.true ], [ -1, %cond.false ]
  store i32 %cond, i32* %line, align 4
  %2 = load i32, i32* %line, align 4
  %cmp2 = icmp sgt i32 %2, 0
  br i1 %cmp2, label %if.then, label %if.else

if.then:                                          ; preds = %cond.end
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %4 = load i8*, i8** %ename, align 4
  %5 = load i32, i32* @gnu_error_format, align 4
  %tobool3 = icmp ne i32 %5, 0
  br i1 %tobool3, label %cond.true4, label %cond.false5

cond.true4:                                       ; preds = %if.then
  br label %cond.end7

cond.false5:                                      ; preds = %if.then
  %call6 = call i8* @libintl_gettext(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.14, i32 0, i32 0))
  br label %cond.end7

cond.end7:                                        ; preds = %cond.false5, %cond.true4
  %cond8 = phi i8* [ getelementptr inbounds ([1 x i8], [1 x i8]* @.str.13, i32 0, i32 0), %cond.true4 ], [ %call6, %cond.false5 ]
  %6 = load i32, i32* %line, align 4
  %call9 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.15, i32 0, i32 0), i8* %4, i8* %cond8, i32 %6)
  br label %if.end

if.else:                                          ; preds = %cond.end
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %8 = load i8*, i8** %ename, align 4
  %call10 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.11, i32 0, i32 0), i8* %8)
  br label %if.end

if.end:                                           ; preds = %if.else, %cond.end7
  ret void
}

; Function Attrs: noreturn
declare void @exit_shell(i32) #3

; Function Attrs: noinline nounwind
define void @fatal_error(i8* %format, ...) #0 {
entry:
  %format.addr = alloca i8*, align 4
  %args = alloca [4 x i32], align 4
  store i8* %format, i8** %format.addr, align 4
  call void @error_prolog(i32 0)
  %arraydecay = getelementptr inbounds [4 x i32], [4 x i32]* %args, i32 0, i32 0
  %arraydecay1 = bitcast i32* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %1 = load i8*, i8** %format.addr, align 4
  %arraydecay2 = getelementptr inbounds [4 x i32], [4 x i32]* %args, i32 0, i32 0
  %call = call i32 @vfprintf(%struct._IO_FILE* %0, i8* %1, i32* %arraydecay2)
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %call3 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0))
  %arraydecay4 = getelementptr inbounds [4 x i32], [4 x i32]* %args, i32 0, i32 0
  %arraydecay45 = bitcast i32* %arraydecay4 to i8*
  call void @llvm.va_end(i8* %arraydecay45)
  call void @sh_exit(i32 2) #4
  unreachable

return:                                           ; No predecessors!
  ret void
}

; Function Attrs: noreturn
declare void @sh_exit(i32) #3

; Function Attrs: noinline nounwind
define void @internal_error(i8* %format, ...) #0 {
entry:
  %format.addr = alloca i8*, align 4
  %args = alloca [4 x i32], align 4
  store i8* %format, i8** %format.addr, align 4
  call void @error_prolog(i32 1)
  %arraydecay = getelementptr inbounds [4 x i32], [4 x i32]* %args, i32 0, i32 0
  %arraydecay1 = bitcast i32* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %1 = load i8*, i8** %format.addr, align 4
  %arraydecay2 = getelementptr inbounds [4 x i32], [4 x i32]* %args, i32 0, i32 0
  %call = call i32 @vfprintf(%struct._IO_FILE* %0, i8* %1, i32* %arraydecay2)
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %call3 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0))
  %arraydecay4 = getelementptr inbounds [4 x i32], [4 x i32]* %args, i32 0, i32 0
  %arraydecay45 = bitcast i32* %arraydecay4 to i8*
  call void @llvm.va_end(i8* %arraydecay45)
  ret void
}

; Function Attrs: noinline nounwind
define void @internal_warning(i8* %format, ...) #0 {
entry:
  %format.addr = alloca i8*, align 4
  %args = alloca [4 x i32], align 4
  store i8* %format, i8** %format.addr, align 4
  call void @error_prolog(i32 1)
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %call = call i8* @libintl_gettext(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.8, i32 0, i32 0))
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %0, i8* %call)
  %arraydecay = getelementptr inbounds [4 x i32], [4 x i32]* %args, i32 0, i32 0
  %arraydecay2 = bitcast i32* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay2)
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %2 = load i8*, i8** %format.addr, align 4
  %arraydecay3 = getelementptr inbounds [4 x i32], [4 x i32]* %args, i32 0, i32 0
  %call4 = call i32 @vfprintf(%struct._IO_FILE* %1, i8* %2, i32* %arraydecay3)
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %call5 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0))
  %arraydecay6 = getelementptr inbounds [4 x i32], [4 x i32]* %args, i32 0, i32 0
  %arraydecay67 = bitcast i32* %arraydecay6 to i8*
  call void @llvm.va_end(i8* %arraydecay67)
  ret void
}

; Function Attrs: noinline nounwind
define void @internal_inform(i8* %format, ...) #0 {
entry:
  %format.addr = alloca i8*, align 4
  %args = alloca [4 x i32], align 4
  store i8* %format, i8** %format.addr, align 4
  call void @error_prolog(i32 1)
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %call = call i8* @libintl_gettext(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.9, i32 0, i32 0))
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %0, i8* %call)
  %arraydecay = getelementptr inbounds [4 x i32], [4 x i32]* %args, i32 0, i32 0
  %arraydecay2 = bitcast i32* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay2)
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %2 = load i8*, i8** %format.addr, align 4
  %arraydecay3 = getelementptr inbounds [4 x i32], [4 x i32]* %args, i32 0, i32 0
  %call4 = call i32 @vfprintf(%struct._IO_FILE* %1, i8* %2, i32* %arraydecay3)
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %call5 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0))
  %arraydecay6 = getelementptr inbounds [4 x i32], [4 x i32]* %args, i32 0, i32 0
  %arraydecay67 = bitcast i32* %arraydecay6 to i8*
  call void @llvm.va_end(i8* %arraydecay67)
  ret void
}

; Function Attrs: noinline nounwind
define void @sys_error(i8* %format, ...) #0 {
entry:
  %format.addr = alloca i8*, align 4
  %e = alloca i32, align 4
  %args = alloca [4 x i32], align 4
  store i8* %format, i8** %format.addr, align 4
  %call = call i32* @__errno_location()
  %0 = load i32, i32* %call, align 4
  store i32 %0, i32* %e, align 4
  call void @error_prolog(i32 0)
  %arraydecay = getelementptr inbounds [4 x i32], [4 x i32]* %args, i32 0, i32 0
  %arraydecay1 = bitcast i32* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %2 = load i8*, i8** %format.addr, align 4
  %arraydecay2 = getelementptr inbounds [4 x i32], [4 x i32]* %args, i32 0, i32 0
  %call3 = call i32 @vfprintf(%struct._IO_FILE* %1, i8* %2, i32* %arraydecay2)
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %4 = load i32, i32* %e, align 4
  %call4 = call i8* @strerror(i32 %4)
  %call5 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.10, i32 0, i32 0), i8* %call4)
  %arraydecay6 = getelementptr inbounds [4 x i32], [4 x i32]* %args, i32 0, i32 0
  %arraydecay67 = bitcast i32* %arraydecay6 to i8*
  call void @llvm.va_end(i8* %arraydecay67)
  ret void
}

; Function Attrs: noinline nounwind
define void @parser_error(i32 %lineno, i8* %format, ...) #0 {
entry:
  %lineno.addr = alloca i32, align 4
  %format.addr = alloca i8*, align 4
  %args = alloca [4 x i32], align 4
  %ename = alloca i8*, align 4
  %iname = alloca i8*, align 4
  store i32 %lineno, i32* %lineno.addr, align 4
  store i8* %format, i8** %format.addr, align 4
  %call = call i8* @get_name_for_error()
  store i8* %call, i8** %ename, align 4
  %call1 = call i8* @yy_input_name()
  store i8* %call1, i8** %iname, align 4
  %0 = load i32, i32* @interactive, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %2 = load i8*, i8** %ename, align 4
  %call2 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.11, i32 0, i32 0), i8* %2)
  br label %if.end32

if.else:                                          ; preds = %entry
  %3 = load i32, i32* @interactive_shell, align 4
  %tobool3 = icmp ne i32 %3, 0
  br i1 %tobool3, label %if.then4, label %if.else8

if.then4:                                         ; preds = %if.else
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %5 = load i8*, i8** %ename, align 4
  %6 = load i8*, i8** %iname, align 4
  %7 = load i32, i32* @gnu_error_format, align 4
  %tobool5 = icmp ne i32 %7, 0
  br i1 %tobool5, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then4
  br label %cond.end

cond.false:                                       ; preds = %if.then4
  %call6 = call i8* @libintl_gettext(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.14, i32 0, i32 0))
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ getelementptr inbounds ([1 x i8], [1 x i8]* @.str.13, i32 0, i32 0), %cond.true ], [ %call6, %cond.false ]
  %8 = load i32, i32* %lineno.addr, align 4
  %call7 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.12, i32 0, i32 0), i8* %5, i8* %6, i8* %cond, i32 %8)
  br label %if.end31

if.else8:                                         ; preds = %if.else
  %9 = load i8*, i8** %ename, align 4
  %arrayidx = getelementptr inbounds i8, i8* %9, i32 0
  %10 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %10 to i32
  %11 = load i8*, i8** %iname, align 4
  %arrayidx9 = getelementptr inbounds i8, i8* %11, i32 0
  %12 = load i8, i8* %arrayidx9, align 1
  %conv10 = sext i8 %12 to i32
  %cmp = icmp eq i32 %conv, %conv10
  br i1 %cmp, label %land.lhs.true, label %if.else23

land.lhs.true:                                    ; preds = %if.else8
  %13 = load i8*, i8** %ename, align 4
  %14 = load i8*, i8** %iname, align 4
  %call12 = call i32 @strcmp(i8* %13, i8* %14)
  %cmp13 = icmp eq i32 %call12, 0
  br i1 %cmp13, label %if.then15, label %if.else23

if.then15:                                        ; preds = %land.lhs.true
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %16 = load i8*, i8** %ename, align 4
  %17 = load i32, i32* @gnu_error_format, align 4
  %tobool16 = icmp ne i32 %17, 0
  br i1 %tobool16, label %cond.true17, label %cond.false18

cond.true17:                                      ; preds = %if.then15
  br label %cond.end20

cond.false18:                                     ; preds = %if.then15
  %call19 = call i8* @libintl_gettext(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.14, i32 0, i32 0))
  br label %cond.end20

cond.end20:                                       ; preds = %cond.false18, %cond.true17
  %cond21 = phi i8* [ getelementptr inbounds ([1 x i8], [1 x i8]* @.str.13, i32 0, i32 0), %cond.true17 ], [ %call19, %cond.false18 ]
  %18 = load i32, i32* %lineno.addr, align 4
  %call22 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.15, i32 0, i32 0), i8* %16, i8* %cond21, i32 %18)
  br label %if.end

if.else23:                                        ; preds = %land.lhs.true, %if.else8
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %20 = load i8*, i8** %ename, align 4
  %21 = load i8*, i8** %iname, align 4
  %22 = load i32, i32* @gnu_error_format, align 4
  %tobool24 = icmp ne i32 %22, 0
  br i1 %tobool24, label %cond.true25, label %cond.false26

cond.true25:                                      ; preds = %if.else23
  br label %cond.end28

cond.false26:                                     ; preds = %if.else23
  %call27 = call i8* @libintl_gettext(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.14, i32 0, i32 0))
  br label %cond.end28

cond.end28:                                       ; preds = %cond.false26, %cond.true25
  %cond29 = phi i8* [ getelementptr inbounds ([1 x i8], [1 x i8]* @.str.13, i32 0, i32 0), %cond.true25 ], [ %call27, %cond.false26 ]
  %23 = load i32, i32* %lineno.addr, align 4
  %call30 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.12, i32 0, i32 0), i8* %20, i8* %21, i8* %cond29, i32 %23)
  br label %if.end

if.end:                                           ; preds = %cond.end28, %cond.end20
  br label %if.end31

if.end31:                                         ; preds = %if.end, %cond.end
  br label %if.end32

if.end32:                                         ; preds = %if.end31, %if.then
  %arraydecay = getelementptr inbounds [4 x i32], [4 x i32]* %args, i32 0, i32 0
  %arraydecay33 = bitcast i32* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay33)
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %25 = load i8*, i8** %format.addr, align 4
  %arraydecay34 = getelementptr inbounds [4 x i32], [4 x i32]* %args, i32 0, i32 0
  %call35 = call i32 @vfprintf(%struct._IO_FILE* %24, i8* %25, i32* %arraydecay34)
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %call36 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %26, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0))
  %arraydecay37 = getelementptr inbounds [4 x i32], [4 x i32]* %args, i32 0, i32 0
  %arraydecay3738 = bitcast i32* %arraydecay37 to i8*
  call void @llvm.va_end(i8* %arraydecay3738)
  %27 = load i32, i32* @exit_immediately_on_error, align 4
  %tobool39 = icmp ne i32 %27, 0
  br i1 %tobool39, label %if.then40, label %if.end41

if.then40:                                        ; preds = %if.end32
  store i32 2, i32* @last_command_exit_value, align 4
  call void @exit_shell(i32 2) #4
  unreachable

if.end41:                                         ; preds = %if.end32
  ret void
}

declare i8* @yy_input_name() #1

declare i32 @strcmp(i8*, i8*) #1

; Function Attrs: noinline nounwind
define void @command_error(i8* %func, i32 %code, i32 %e, i32 %flags) #0 {
entry:
  %func.addr = alloca i8*, align 4
  %code.addr = alloca i32, align 4
  %e.addr = alloca i32, align 4
  %flags.addr = alloca i32, align 4
  store i8* %func, i8** %func.addr, align 4
  store i32 %code, i32* %code.addr, align 4
  store i32 %e, i32* %e.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %0 = load i32, i32* %code.addr, align 4
  %cmp = icmp sgt i32 %0, 3
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, i32* %code.addr, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %1 = load i8*, i8** %func.addr, align 4
  %2 = load i32, i32* %code.addr, align 4
  %arrayidx = getelementptr inbounds [5 x i8*], [5 x i8*]* @cmd_error_table, i32 0, i32 %2
  %3 = load i8*, i8** %arrayidx, align 4
  %call = call i8* @libintl_gettext(i8* %3)
  %4 = load i32, i32* %e.addr, align 4
  call void (i8*, ...) @programming_error(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.16, i32 0, i32 0), i8* %1, i8* %call, i32 %4)
  ret void
}

; Function Attrs: noinline nounwind
define i8* @command_errstr(i32 %code) #0 {
entry:
  %code.addr = alloca i32, align 4
  store i32 %code, i32* %code.addr, align 4
  %0 = load i32, i32* %code.addr, align 4
  %cmp = icmp sgt i32 %0, 3
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, i32* %code.addr, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* %code.addr, align 4
  %arrayidx = getelementptr inbounds [5 x i8*], [5 x i8*]* @cmd_error_table, i32 0, i32 %1
  %2 = load i8*, i8** %arrayidx, align 4
  %call = call i8* @libintl_gettext(i8* %2)
  ret i8* %call
}

; Function Attrs: noinline nounwind
define void @err_badarraysub(i8* %s) #0 {
entry:
  %s.addr = alloca i8*, align 4
  store i8* %s, i8** %s.addr, align 4
  %0 = load i8*, i8** %s.addr, align 4
  %1 = load i8*, i8** @bash_badsub_errmsg, align 4
  %call = call i8* @libintl_gettext(i8* %1)
  call void (i8*, ...) @report_error(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i32 0, i32 0), i8* %0, i8* %call)
  ret void
}

; Function Attrs: noinline nounwind
define void @err_unboundvar(i8* %s) #0 {
entry:
  %s.addr = alloca i8*, align 4
  store i8* %s, i8** %s.addr, align 4
  %call = call i8* @libintl_gettext(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.17, i32 0, i32 0))
  %0 = load i8*, i8** %s.addr, align 4
  call void (i8*, ...) @report_error(i8* %call, i8* %0)
  ret void
}

; Function Attrs: noinline nounwind
define void @err_readonly(i8* %s) #0 {
entry:
  %s.addr = alloca i8*, align 4
  store i8* %s, i8** %s.addr, align 4
  %call = call i8* @libintl_gettext(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.18, i32 0, i32 0))
  %0 = load i8*, i8** %s.addr, align 4
  call void (i8*, ...) @report_error(i8* %call, i8* %0)
  ret void
}

declare i32 @executing_line_number() #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }
attributes #3 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
