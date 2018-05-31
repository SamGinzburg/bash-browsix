; ModuleID = 'input.c'
source_filename = "input.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.BASH_INPUT = type { i32, i8*, %union.INPUT_STREAM, i32 ()*, i32 (i32)* }
%union.INPUT_STREAM = type { %struct._IO_FILE* }
%struct._IO_FILE = type opaque
%struct.BSTREAM = type { i32, i8*, i32, i32, i32, i32 }
%struct.stat = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }
%struct.timespec = type { i32, i32 }

@terminating_signal = external global i32, align 4
@local_index = internal global i32 0, align 4
@local_bufused = internal global i32 0, align 4
@interrupt_state = external global i32, align 4
@localbuf = internal global [128 x i8] zeroinitializer, align 1
@.str = private unnamed_addr constant [36 x i8] c"cannot reset nodelay mode for fd %d\00", align 1
@bash_input = external global %struct.BASH_INPUT, align 4
@interactive_shell = external global i32, align 4
@default_buffered_input = external global i32, align 4
@buffers = internal global %struct.BSTREAM** null, align 4
@.str.1 = private unnamed_addr constant [62 x i8] c"cannot allocate new file descriptor for bash input from fd %d\00", align 1
@nbuffers = internal global i32 0, align 4
@.str.2 = private unnamed_addr constant [53 x i8] c"save_bash_input: buffer already exists for new fd %d\00", align 1
@bash_input_fd_changed = common global i32 0, align 4
@.str.3 = private unnamed_addr constant [8 x i8] c"input.c\00", align 1

; Function Attrs: noinline nounwind
define i32 @getc_with_restart(%struct._IO_FILE* %stream) #0 {
entry:
  %retval = alloca i32, align 4
  %stream.addr = alloca %struct._IO_FILE*, align 4
  %uc = alloca i8, align 1
  store %struct._IO_FILE* %stream, %struct._IO_FILE** %stream.addr, align 4
  br label %do.body

do.body:                                          ; preds = %entry
  %0 = load volatile i32, i32* @terminating_signal, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %do.body
  %1 = load volatile i32, i32* @terminating_signal, align 4
  call void @termsig_handler(i32 %1)
  br label %if.end

if.end:                                           ; preds = %if.then, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  %2 = load i32, i32* @local_index, align 4
  %3 = load i32, i32* @local_bufused, align 4
  %cmp = icmp eq i32 %2, %3
  br i1 %cmp, label %if.then2, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %do.end
  %4 = load i32, i32* @local_bufused, align 4
  %cmp1 = icmp eq i32 %4, 0
  br i1 %cmp1, label %if.then2, label %if.end44

if.then2:                                         ; preds = %lor.lhs.false, %do.end
  br label %while.body

while.body:                                       ; preds = %if.then2, %if.end29, %if.end43
  br label %do.body3

do.body3:                                         ; preds = %while.body
  %5 = load volatile i32, i32* @terminating_signal, align 4
  %tobool4 = icmp ne i32 %5, 0
  br i1 %tobool4, label %if.then5, label %if.end6

if.then5:                                         ; preds = %do.body3
  %6 = load volatile i32, i32* @terminating_signal, align 4
  call void @termsig_handler(i32 %6)
  br label %if.end6

if.end6:                                          ; preds = %if.then5, %do.body3
  %7 = load volatile i32, i32* @interrupt_state, align 4
  %tobool7 = icmp ne i32 %7, 0
  br i1 %tobool7, label %if.then8, label %if.end9

if.then8:                                         ; preds = %if.end6
  call void @throw_to_top_level()
  br label %if.end9

if.end9:                                          ; preds = %if.then8, %if.end6
  br label %do.end10

do.end10:                                         ; preds = %if.end9
  call void @run_pending_traps()
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** %stream.addr, align 4
  %call = call i32 @fileno(%struct._IO_FILE* %8)
  %call11 = call i32 @read(i32 %call, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @localbuf, i32 0, i32 0), i32 128)
  store i32 %call11, i32* @local_bufused, align 4
  %9 = load i32, i32* @local_bufused, align 4
  %cmp12 = icmp sgt i32 %9, 0
  br i1 %cmp12, label %if.then13, label %if.else

if.then13:                                        ; preds = %do.end10
  br label %while.end

if.else:                                          ; preds = %do.end10
  %10 = load i32, i32* @local_bufused, align 4
  %cmp14 = icmp eq i32 %10, 0
  br i1 %cmp14, label %if.then15, label %if.else16

if.then15:                                        ; preds = %if.else
  store i32 0, i32* @local_index, align 4
  store i32 -1, i32* %retval, align 4
  br label %return

if.else16:                                        ; preds = %if.else
  %call17 = call i32* @__errno_location()
  %11 = load i32, i32* %call17, align 4
  %cmp18 = icmp eq i32 %11, 11
  br i1 %cmp18, label %if.then22, label %lor.lhs.false19

lor.lhs.false19:                                  ; preds = %if.else16
  %call20 = call i32* @__errno_location()
  %12 = load i32, i32* %call20, align 4
  %cmp21 = icmp eq i32 %12, 11
  br i1 %cmp21, label %if.then22, label %if.else30

if.then22:                                        ; preds = %lor.lhs.false19, %if.else16
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** %stream.addr, align 4
  %call23 = call i32 @fileno(%struct._IO_FILE* %13)
  %call24 = call i32 @sh_unset_nodelay_mode(i32 %call23)
  %cmp25 = icmp slt i32 %call24, 0
  br i1 %cmp25, label %if.then26, label %if.end29

if.then26:                                        ; preds = %if.then22
  %call27 = call i8* @libintl_gettext(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str, i32 0, i32 0))
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** %stream.addr, align 4
  %call28 = call i32 @fileno(%struct._IO_FILE* %14)
  call void (i8*, ...) @sys_error(i8* %call27, i32 %call28)
  store i32 0, i32* @local_bufused, align 4
  store i32 0, i32* @local_index, align 4
  store i32 -1, i32* %retval, align 4
  br label %return

if.end29:                                         ; preds = %if.then22
  br label %while.body

if.else30:                                        ; preds = %lor.lhs.false19
  %call31 = call i32* @__errno_location()
  %15 = load i32, i32* %call31, align 4
  %cmp32 = icmp ne i32 %15, 4
  br i1 %cmp32, label %if.then33, label %if.else34

if.then33:                                        ; preds = %if.else30
  store i32 0, i32* @local_bufused, align 4
  store i32 0, i32* @local_index, align 4
  store i32 -1, i32* %retval, align 4
  br label %return

if.else34:                                        ; preds = %if.else30
  %16 = load volatile i32, i32* @interrupt_state, align 4
  %tobool35 = icmp ne i32 %16, 0
  br i1 %tobool35, label %if.then38, label %lor.lhs.false36

lor.lhs.false36:                                  ; preds = %if.else34
  %17 = load volatile i32, i32* @terminating_signal, align 4
  %tobool37 = icmp ne i32 %17, 0
  br i1 %tobool37, label %if.then38, label %if.end39

if.then38:                                        ; preds = %lor.lhs.false36, %if.else34
  store i32 0, i32* @local_bufused, align 4
  store i32 0, i32* @local_index, align 4
  br label %if.end39

if.end39:                                         ; preds = %if.then38, %lor.lhs.false36
  br label %if.end40

if.end40:                                         ; preds = %if.end39
  br label %if.end41

if.end41:                                         ; preds = %if.end40
  br label %if.end42

if.end42:                                         ; preds = %if.end41
  br label %if.end43

if.end43:                                         ; preds = %if.end42
  br label %while.body

while.end:                                        ; preds = %if.then13
  store i32 0, i32* @local_index, align 4
  br label %if.end44

if.end44:                                         ; preds = %while.end, %lor.lhs.false
  %18 = load i32, i32* @local_index, align 4
  %inc = add nsw i32 %18, 1
  store i32 %inc, i32* @local_index, align 4
  %arrayidx = getelementptr inbounds [128 x i8], [128 x i8]* @localbuf, i32 0, i32 %18
  %19 = load i8, i8* %arrayidx, align 1
  store i8 %19, i8* %uc, align 1
  %20 = load i8, i8* %uc, align 1
  %conv = zext i8 %20 to i32
  store i32 %conv, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end44, %if.then33, %if.then26, %if.then15
  %21 = load i32, i32* %retval, align 4
  ret i32 %21
}

declare void @termsig_handler(i32) #1

declare void @throw_to_top_level() #1

declare void @run_pending_traps() #1

declare i32 @read(i32, i8*, i32) #1

declare i32 @fileno(%struct._IO_FILE*) #1

declare i32* @__errno_location() #1

declare i32 @sh_unset_nodelay_mode(i32) #1

declare void @sys_error(i8*, ...) #1

declare i8* @libintl_gettext(i8*) #1

; Function Attrs: noinline nounwind
define i32 @ungetc_with_restart(i32 %c, %struct._IO_FILE* %stream) #0 {
entry:
  %retval = alloca i32, align 4
  %c.addr = alloca i32, align 4
  %stream.addr = alloca %struct._IO_FILE*, align 4
  store i32 %c, i32* %c.addr, align 4
  store %struct._IO_FILE* %stream, %struct._IO_FILE** %stream.addr, align 4
  %0 = load i32, i32* @local_index, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i32, i32* %c.addr, align 4
  %cmp1 = icmp eq i32 %1, -1
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i32 -1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %2 = load i32, i32* %c.addr, align 4
  %conv = trunc i32 %2 to i8
  %3 = load i32, i32* @local_index, align 4
  %dec = add nsw i32 %3, -1
  store i32 %dec, i32* @local_index, align 4
  %arrayidx = getelementptr inbounds [128 x i8], [128 x i8]* @localbuf, i32 0, i32 %dec
  store i8 %conv, i8* %arrayidx, align 1
  %4 = load i32, i32* %c.addr, align 4
  store i32 %4, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %5 = load i32, i32* %retval, align 4
  ret i32 %5
}

; Function Attrs: noinline nounwind
define i32 @set_bash_input_fd(i32 %fd) #0 {
entry:
  %fd.addr = alloca i32, align 4
  store i32 %fd, i32* %fd.addr, align 4
  %0 = load i32, i32* getelementptr inbounds (%struct.BASH_INPUT, %struct.BASH_INPUT* @bash_input, i32 0, i32 0), align 4
  %cmp = icmp eq i32 %0, 4
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %fd.addr, align 4
  store i32 %1, i32* bitcast (%union.INPUT_STREAM* getelementptr inbounds (%struct.BASH_INPUT, %struct.BASH_INPUT* @bash_input, i32 0, i32 2) to i32*), align 4
  br label %if.end3

if.else:                                          ; preds = %entry
  %2 = load i32, i32* @interactive_shell, align 4
  %cmp1 = icmp eq i32 %2, 0
  br i1 %cmp1, label %if.then2, label %if.end

if.then2:                                         ; preds = %if.else
  %3 = load i32, i32* %fd.addr, align 4
  store i32 %3, i32* @default_buffered_input, align 4
  br label %if.end

if.end:                                           ; preds = %if.then2, %if.else
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  ret i32 0
}

; Function Attrs: noinline nounwind
define i32 @fd_is_bash_input(i32 %fd) #0 {
entry:
  %retval = alloca i32, align 4
  %fd.addr = alloca i32, align 4
  store i32 %fd, i32* %fd.addr, align 4
  %0 = load i32, i32* getelementptr inbounds (%struct.BASH_INPUT, %struct.BASH_INPUT* @bash_input, i32 0, i32 0), align 4
  %cmp = icmp eq i32 %0, 4
  br i1 %cmp, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %entry
  %1 = load i32, i32* bitcast (%union.INPUT_STREAM* getelementptr inbounds (%struct.BASH_INPUT, %struct.BASH_INPUT* @bash_input, i32 0, i32 2) to i32*), align 4
  %2 = load i32, i32* %fd.addr, align 4
  %cmp1 = icmp eq i32 %1, %2
  br i1 %cmp1, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true
  store i32 1, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %land.lhs.true, %entry
  %3 = load i32, i32* @interactive_shell, align 4
  %cmp2 = icmp eq i32 %3, 0
  br i1 %cmp2, label %land.lhs.true3, label %if.end

land.lhs.true3:                                   ; preds = %if.else
  %4 = load i32, i32* @default_buffered_input, align 4
  %5 = load i32, i32* %fd.addr, align 4
  %cmp4 = icmp eq i32 %4, %5
  br i1 %cmp4, label %if.then5, label %if.end

if.then5:                                         ; preds = %land.lhs.true3
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %land.lhs.true3, %if.else
  br label %if.end6

if.end6:                                          ; preds = %if.end
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end6, %if.then5, %if.then
  %6 = load i32, i32* %retval, align 4
  ret i32 %6
}

; Function Attrs: noinline nounwind
define i32 @save_bash_input(i32 %fd, i32 %new_fd) #0 {
entry:
  %retval = alloca i32, align 4
  %fd.addr = alloca i32, align 4
  %new_fd.addr = alloca i32, align 4
  %nfd = alloca i32, align 4
  store i32 %fd, i32* %fd.addr, align 4
  store i32 %new_fd, i32* %new_fd.addr, align 4
  %0 = load %struct.BSTREAM**, %struct.BSTREAM*** @buffers, align 4
  %1 = load i32, i32* %fd.addr, align 4
  %arrayidx = getelementptr inbounds %struct.BSTREAM*, %struct.BSTREAM** %0, i32 %1
  %2 = load %struct.BSTREAM*, %struct.BSTREAM** %arrayidx, align 4
  %tobool = icmp ne %struct.BSTREAM* %2, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %fd.addr, align 4
  %call = call i32 @sync_buffered_stream(i32 %3)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %4 = load i32, i32* %new_fd.addr, align 4
  %cmp = icmp eq i32 %4, -1
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end
  %5 = load i32, i32* %fd.addr, align 4
  %call1 = call i32 (i32, i32, ...) @fcntl(i32 %5, i32 0, i32 10)
  br label %cond.end

cond.false:                                       ; preds = %if.end
  %6 = load i32, i32* %new_fd.addr, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call1, %cond.true ], [ %6, %cond.false ]
  store i32 %cond, i32* %nfd, align 4
  %7 = load i32, i32* %nfd, align 4
  %cmp2 = icmp eq i32 %7, -1
  br i1 %cmp2, label %if.then3, label %if.end9

if.then3:                                         ; preds = %cond.end
  %8 = load i32, i32* %fd.addr, align 4
  %call4 = call i32 (i32, i32, ...) @fcntl(i32 %8, i32 1, i32 0)
  %cmp5 = icmp eq i32 %call4, 0
  br i1 %cmp5, label %if.then6, label %if.end8

if.then6:                                         ; preds = %if.then3
  %call7 = call i8* @libintl_gettext(i8* getelementptr inbounds ([62 x i8], [62 x i8]* @.str.1, i32 0, i32 0))
  %9 = load i32, i32* %fd.addr, align 4
  call void (i8*, ...) @sys_error(i8* %call7, i32 %9)
  br label %if.end8

if.end8:                                          ; preds = %if.then6, %if.then3
  store i32 -1, i32* %retval, align 4
  br label %return

if.end9:                                          ; preds = %cond.end
  %10 = load i32, i32* %nfd, align 4
  %11 = load i32, i32* @nbuffers, align 4
  %cmp10 = icmp slt i32 %10, %11
  br i1 %cmp10, label %land.lhs.true, label %if.end16

land.lhs.true:                                    ; preds = %if.end9
  %12 = load %struct.BSTREAM**, %struct.BSTREAM*** @buffers, align 4
  %13 = load i32, i32* %nfd, align 4
  %arrayidx11 = getelementptr inbounds %struct.BSTREAM*, %struct.BSTREAM** %12, i32 %13
  %14 = load %struct.BSTREAM*, %struct.BSTREAM** %arrayidx11, align 4
  %tobool12 = icmp ne %struct.BSTREAM* %14, null
  br i1 %tobool12, label %if.then13, label %if.end16

if.then13:                                        ; preds = %land.lhs.true
  %call14 = call i8* @libintl_gettext(i8* getelementptr inbounds ([53 x i8], [53 x i8]* @.str.2, i32 0, i32 0))
  %15 = load i32, i32* %nfd, align 4
  call void (i8*, ...) @internal_error(i8* %call14, i32 %15)
  %16 = load %struct.BSTREAM**, %struct.BSTREAM*** @buffers, align 4
  %17 = load i32, i32* %nfd, align 4
  %arrayidx15 = getelementptr inbounds %struct.BSTREAM*, %struct.BSTREAM** %16, i32 %17
  %18 = load %struct.BSTREAM*, %struct.BSTREAM** %arrayidx15, align 4
  call void @free_buffered_stream(%struct.BSTREAM* %18)
  br label %if.end16

if.end16:                                         ; preds = %if.then13, %land.lhs.true, %if.end9
  %19 = load i32, i32* getelementptr inbounds (%struct.BASH_INPUT, %struct.BASH_INPUT* @bash_input, i32 0, i32 0), align 4
  %cmp17 = icmp eq i32 %19, 4
  br i1 %cmp17, label %if.then18, label %if.else

if.then18:                                        ; preds = %if.end16
  %20 = load i32, i32* %nfd, align 4
  store i32 %20, i32* bitcast (%union.INPUT_STREAM* getelementptr inbounds (%struct.BASH_INPUT, %struct.BASH_INPUT* @bash_input, i32 0, i32 2) to i32*), align 4
  %21 = load i32, i32* %nfd, align 4
  %call19 = call %struct.BSTREAM* @fd_to_buffered_stream(i32 %21)
  %22 = load i32, i32* %fd.addr, align 4
  %call20 = call i32 @close_buffered_fd(i32 %22)
  br label %if.end21

if.else:                                          ; preds = %if.end16
  %23 = load i32, i32* @bash_input_fd_changed, align 4
  %inc = add nsw i32 %23, 1
  store i32 %inc, i32* @bash_input_fd_changed, align 4
  br label %if.end21

if.end21:                                         ; preds = %if.else, %if.then18
  %24 = load i32, i32* @default_buffered_input, align 4
  %25 = load i32, i32* %fd.addr, align 4
  %cmp22 = icmp eq i32 %24, %25
  br i1 %cmp22, label %if.then23, label %if.end24

if.then23:                                        ; preds = %if.end21
  %26 = load i32, i32* %nfd, align 4
  store i32 %26, i32* @default_buffered_input, align 4
  br label %if.end24

if.end24:                                         ; preds = %if.then23, %if.end21
  %27 = load i32, i32* %nfd, align 4
  %call25 = call i32 (i32, i32, ...) @fcntl(i32 %27, i32 2, i32 1)
  %28 = load i32, i32* %nfd, align 4
  store i32 %28, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end24, %if.end8
  %29 = load i32, i32* %retval, align 4
  ret i32 %29
}

; Function Attrs: noinline nounwind
define i32 @sync_buffered_stream(i32 %bfd) #0 {
entry:
  %retval = alloca i32, align 4
  %bfd.addr = alloca i32, align 4
  %bp = alloca %struct.BSTREAM*, align 4
  %chars_left = alloca i32, align 4
  store i32 %bfd, i32* %bfd.addr, align 4
  %0 = load %struct.BSTREAM**, %struct.BSTREAM*** @buffers, align 4
  %cmp = icmp eq %struct.BSTREAM** %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load %struct.BSTREAM**, %struct.BSTREAM*** @buffers, align 4
  %2 = load i32, i32* %bfd.addr, align 4
  %arrayidx = getelementptr inbounds %struct.BSTREAM*, %struct.BSTREAM** %1, i32 %2
  %3 = load %struct.BSTREAM*, %struct.BSTREAM** %arrayidx, align 4
  store %struct.BSTREAM* %3, %struct.BSTREAM** %bp, align 4
  %cmp1 = icmp eq %struct.BSTREAM* %3, null
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i32 -1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %4 = load %struct.BSTREAM*, %struct.BSTREAM** %bp, align 4
  %b_used = getelementptr inbounds %struct.BSTREAM, %struct.BSTREAM* %4, i32 0, i32 3
  %5 = load i32, i32* %b_used, align 4
  %6 = load %struct.BSTREAM*, %struct.BSTREAM** %bp, align 4
  %b_inputp = getelementptr inbounds %struct.BSTREAM, %struct.BSTREAM* %6, i32 0, i32 5
  %7 = load i32, i32* %b_inputp, align 4
  %sub = sub i32 %5, %7
  store i32 %sub, i32* %chars_left, align 4
  %8 = load i32, i32* %chars_left, align 4
  %tobool = icmp ne i32 %8, 0
  br i1 %tobool, label %if.then2, label %if.end4

if.then2:                                         ; preds = %if.end
  %9 = load %struct.BSTREAM*, %struct.BSTREAM** %bp, align 4
  %b_fd = getelementptr inbounds %struct.BSTREAM, %struct.BSTREAM* %9, i32 0, i32 0
  %10 = load i32, i32* %b_fd, align 4
  %11 = load i32, i32* %chars_left, align 4
  %sub3 = sub nsw i32 0, %11
  %call = call i32 @lseek(i32 %10, i32 %sub3, i32 1)
  br label %if.end4

if.end4:                                          ; preds = %if.then2, %if.end
  %12 = load %struct.BSTREAM*, %struct.BSTREAM** %bp, align 4
  %b_inputp5 = getelementptr inbounds %struct.BSTREAM, %struct.BSTREAM* %12, i32 0, i32 5
  store i32 0, i32* %b_inputp5, align 4
  %13 = load %struct.BSTREAM*, %struct.BSTREAM** %bp, align 4
  %b_used6 = getelementptr inbounds %struct.BSTREAM, %struct.BSTREAM* %13, i32 0, i32 3
  store i32 0, i32* %b_used6, align 4
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end4, %if.then
  %14 = load i32, i32* %retval, align 4
  ret i32 %14
}

declare i32 @fcntl(i32, i32, ...) #1

declare void @internal_error(i8*, ...) #1

; Function Attrs: noinline nounwind
define void @free_buffered_stream(%struct.BSTREAM* %bp) #0 {
entry:
  %bp.addr = alloca %struct.BSTREAM*, align 4
  %n = alloca i32, align 4
  store %struct.BSTREAM* %bp, %struct.BSTREAM** %bp.addr, align 4
  %0 = load %struct.BSTREAM*, %struct.BSTREAM** %bp.addr, align 4
  %tobool = icmp ne %struct.BSTREAM* %0, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  br label %return

if.end:                                           ; preds = %entry
  %1 = load %struct.BSTREAM*, %struct.BSTREAM** %bp.addr, align 4
  %b_fd = getelementptr inbounds %struct.BSTREAM, %struct.BSTREAM* %1, i32 0, i32 0
  %2 = load i32, i32* %b_fd, align 4
  store i32 %2, i32* %n, align 4
  %3 = load %struct.BSTREAM*, %struct.BSTREAM** %bp.addr, align 4
  %b_buffer = getelementptr inbounds %struct.BSTREAM, %struct.BSTREAM* %3, i32 0, i32 1
  %4 = load i8*, i8** %b_buffer, align 4
  %tobool1 = icmp ne i8* %4, null
  br i1 %tobool1, label %if.then2, label %if.end4

if.then2:                                         ; preds = %if.end
  %5 = load %struct.BSTREAM*, %struct.BSTREAM** %bp.addr, align 4
  %b_buffer3 = getelementptr inbounds %struct.BSTREAM, %struct.BSTREAM* %5, i32 0, i32 1
  %6 = load i8*, i8** %b_buffer3, align 4
  call void @sh_xfree(i8* %6, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.3, i32 0, i32 0), i32 428)
  br label %if.end4

if.end4:                                          ; preds = %if.then2, %if.end
  %7 = load %struct.BSTREAM*, %struct.BSTREAM** %bp.addr, align 4
  %8 = bitcast %struct.BSTREAM* %7 to i8*
  call void @sh_xfree(i8* %8, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.3, i32 0, i32 0), i32 429)
  %9 = load %struct.BSTREAM**, %struct.BSTREAM*** @buffers, align 4
  %10 = load i32, i32* %n, align 4
  %arrayidx = getelementptr inbounds %struct.BSTREAM*, %struct.BSTREAM** %9, i32 %10
  store %struct.BSTREAM* null, %struct.BSTREAM** %arrayidx, align 4
  br label %return

return:                                           ; preds = %if.end4, %if.then
  ret void
}

; Function Attrs: noinline nounwind
define %struct.BSTREAM* @fd_to_buffered_stream(i32 %fd) #0 {
entry:
  %retval = alloca %struct.BSTREAM*, align 4
  %fd.addr = alloca i32, align 4
  %buffer = alloca i8*, align 4
  %size = alloca i32, align 4
  %sb = alloca %struct.stat, align 8
  store i32 %fd, i32* %fd.addr, align 4
  %0 = load i32, i32* %fd.addr, align 4
  %call = call i32 @fstat(i32 %0, %struct.stat* %sb)
  %cmp = icmp slt i32 %call, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %fd.addr, align 4
  %call1 = call i32 @close(i32 %1)
  store %struct.BSTREAM* null, %struct.BSTREAM** %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %2 = load i32, i32* %fd.addr, align 4
  %call2 = call i32 @lseek(i32 %2, i32 0, i32 1)
  %cmp3 = icmp sge i32 %call2, 0
  br i1 %cmp3, label %cond.true, label %cond.false7

cond.true:                                        ; preds = %if.end
  %st_size = getelementptr inbounds %struct.stat, %struct.stat* %sb, i32 0, i32 12
  %3 = load i32, i32* %st_size, align 8
  %cmp4 = icmp sgt i32 %3, 8176
  br i1 %cmp4, label %cond.true5, label %cond.false

cond.true5:                                       ; preds = %cond.true
  br label %cond.end

cond.false:                                       ; preds = %cond.true
  %st_size6 = getelementptr inbounds %struct.stat, %struct.stat* %sb, i32 0, i32 12
  %4 = load i32, i32* %st_size6, align 8
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true5
  %cond = phi i32 [ 8176, %cond.true5 ], [ %4, %cond.false ]
  br label %cond.end8

cond.false7:                                      ; preds = %if.end
  br label %cond.end8

cond.end8:                                        ; preds = %cond.false7, %cond.end
  %cond9 = phi i32 [ %cond, %cond.end ], [ 1, %cond.false7 ]
  store i32 %cond9, i32* %size, align 4
  %5 = load i32, i32* %size, align 4
  %cmp10 = icmp eq i32 %5, 0
  br i1 %cmp10, label %if.then11, label %if.end12

if.then11:                                        ; preds = %cond.end8
  store i32 1, i32* %size, align 4
  br label %if.end12

if.end12:                                         ; preds = %if.then11, %cond.end8
  %6 = load i32, i32* %size, align 4
  %call13 = call i8* @sh_xmalloc(i32 %6, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.3, i32 0, i32 0), i32 399)
  store i8* %call13, i8** %buffer, align 4
  %7 = load i32, i32* %fd.addr, align 4
  %8 = load i8*, i8** %buffer, align 4
  %9 = load i32, i32* %size, align 4
  %call14 = call %struct.BSTREAM* @make_buffered_stream(i32 %7, i8* %8, i32 %9)
  store %struct.BSTREAM* %call14, %struct.BSTREAM** %retval, align 4
  br label %return

return:                                           ; preds = %if.end12, %if.then
  %10 = load %struct.BSTREAM*, %struct.BSTREAM** %retval, align 4
  ret %struct.BSTREAM* %10
}

; Function Attrs: noinline nounwind
define i32 @close_buffered_fd(i32 %fd) #0 {
entry:
  %retval = alloca i32, align 4
  %fd.addr = alloca i32, align 4
  store i32 %fd, i32* %fd.addr, align 4
  %0 = load i32, i32* %fd.addr, align 4
  %cmp = icmp slt i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call = call i32* @__errno_location()
  store i32 9, i32* %call, align 4
  store i32 -1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i32, i32* %fd.addr, align 4
  %2 = load i32, i32* @nbuffers, align 4
  %cmp1 = icmp sge i32 %1, %2
  br i1 %cmp1, label %if.then4, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end
  %3 = load %struct.BSTREAM**, %struct.BSTREAM*** @buffers, align 4
  %tobool = icmp ne %struct.BSTREAM** %3, null
  br i1 %tobool, label %lor.lhs.false2, label %if.then4

lor.lhs.false2:                                   ; preds = %lor.lhs.false
  %4 = load %struct.BSTREAM**, %struct.BSTREAM*** @buffers, align 4
  %5 = load i32, i32* %fd.addr, align 4
  %arrayidx = getelementptr inbounds %struct.BSTREAM*, %struct.BSTREAM** %4, i32 %5
  %6 = load %struct.BSTREAM*, %struct.BSTREAM** %arrayidx, align 4
  %tobool3 = icmp ne %struct.BSTREAM* %6, null
  br i1 %tobool3, label %if.end6, label %if.then4

if.then4:                                         ; preds = %lor.lhs.false2, %lor.lhs.false, %if.end
  %7 = load i32, i32* %fd.addr, align 4
  %call5 = call i32 @close(i32 %7)
  store i32 %call5, i32* %retval, align 4
  br label %return

if.end6:                                          ; preds = %lor.lhs.false2
  %8 = load %struct.BSTREAM**, %struct.BSTREAM*** @buffers, align 4
  %9 = load i32, i32* %fd.addr, align 4
  %arrayidx7 = getelementptr inbounds %struct.BSTREAM*, %struct.BSTREAM** %8, i32 %9
  %10 = load %struct.BSTREAM*, %struct.BSTREAM** %arrayidx7, align 4
  %call8 = call i32 @close_buffered_stream(%struct.BSTREAM* %10)
  store i32 %call8, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end6, %if.then4, %if.then
  %11 = load i32, i32* %retval, align 4
  ret i32 %11
}

; Function Attrs: noinline nounwind
define i32 @check_bash_input(i32 %fd) #0 {
entry:
  %retval = alloca i32, align 4
  %fd.addr = alloca i32, align 4
  store i32 %fd, i32* %fd.addr, align 4
  %0 = load i32, i32* %fd.addr, align 4
  %call = call i32 @fd_is_bash_input(i32 %0)
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %if.then, label %if.end10

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %fd.addr, align 4
  %cmp = icmp sgt i32 %1, 0
  br i1 %cmp, label %if.then1, label %if.else

if.then1:                                         ; preds = %if.then
  %2 = load i32, i32* %fd.addr, align 4
  %call2 = call i32 @save_bash_input(i32 %2, i32 -1)
  %cmp3 = icmp eq i32 %call2, -1
  %cond = select i1 %cmp3, i32 -1, i32 0
  store i32 %cond, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %if.then
  %3 = load i32, i32* %fd.addr, align 4
  %cmp4 = icmp eq i32 %3, 0
  br i1 %cmp4, label %if.then5, label %if.end

if.then5:                                         ; preds = %if.else
  %4 = load i32, i32* %fd.addr, align 4
  %call6 = call i32 @sync_buffered_stream(i32 %4)
  %cmp7 = icmp eq i32 %call6, -1
  %cond8 = select i1 %cmp7, i32 -1, i32 0
  store i32 %cond8, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %if.else
  br label %if.end9

if.end9:                                          ; preds = %if.end
  br label %if.end10

if.end10:                                         ; preds = %if.end9, %entry
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end10, %if.then5, %if.then1
  %5 = load i32, i32* %retval, align 4
  ret i32 %5
}

; Function Attrs: noinline nounwind
define i32 @duplicate_buffered_stream(i32 %fd1, i32 %fd2) #0 {
entry:
  %retval = alloca i32, align 4
  %fd1.addr = alloca i32, align 4
  %fd2.addr = alloca i32, align 4
  %is_bash_input = alloca i32, align 4
  %m = alloca i32, align 4
  store i32 %fd1, i32* %fd1.addr, align 4
  store i32 %fd2, i32* %fd2.addr, align 4
  %0 = load i32, i32* %fd1.addr, align 4
  %1 = load i32, i32* %fd2.addr, align 4
  %cmp = icmp eq i32 %0, %1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %2 = load i32, i32* %fd1.addr, align 4
  %3 = load i32, i32* %fd2.addr, align 4
  %cmp1 = icmp sgt i32 %2, %3
  br i1 %cmp1, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end
  %4 = load i32, i32* %fd1.addr, align 4
  br label %cond.end

cond.false:                                       ; preds = %if.end
  %5 = load i32, i32* %fd2.addr, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %4, %cond.true ], [ %5, %cond.false ]
  store i32 %cond, i32* %m, align 4
  br label %do.body

do.body:                                          ; preds = %cond.end
  %6 = load i32, i32* %m, align 4
  %7 = load i32, i32* @nbuffers, align 4
  %cmp2 = icmp sge i32 %6, %7
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %do.body
  %8 = load i32, i32* %m, align 4
  call void @allocate_buffers(i32 %8)
  br label %if.end4

if.end4:                                          ; preds = %if.then3, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end4
  %9 = load i32, i32* getelementptr inbounds (%struct.BASH_INPUT, %struct.BASH_INPUT* @bash_input, i32 0, i32 0), align 4
  %cmp5 = icmp eq i32 %9, 4
  br i1 %cmp5, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %do.end
  %10 = load i32, i32* bitcast (%union.INPUT_STREAM* getelementptr inbounds (%struct.BASH_INPUT, %struct.BASH_INPUT* @bash_input, i32 0, i32 2) to i32*), align 4
  %11 = load i32, i32* %fd2.addr, align 4
  %cmp6 = icmp eq i32 %10, %11
  br label %land.end

land.end:                                         ; preds = %land.rhs, %do.end
  %12 = phi i1 [ false, %do.end ], [ %cmp6, %land.rhs ]
  %land.ext = zext i1 %12 to i32
  store i32 %land.ext, i32* %is_bash_input, align 4
  %13 = load %struct.BSTREAM**, %struct.BSTREAM*** @buffers, align 4
  %14 = load i32, i32* %fd2.addr, align 4
  %arrayidx = getelementptr inbounds %struct.BSTREAM*, %struct.BSTREAM** %13, i32 %14
  %15 = load %struct.BSTREAM*, %struct.BSTREAM** %arrayidx, align 4
  %tobool = icmp ne %struct.BSTREAM* %15, null
  br i1 %tobool, label %if.then7, label %if.end22

if.then7:                                         ; preds = %land.end
  %16 = load %struct.BSTREAM**, %struct.BSTREAM*** @buffers, align 4
  %17 = load i32, i32* %fd1.addr, align 4
  %arrayidx8 = getelementptr inbounds %struct.BSTREAM*, %struct.BSTREAM** %16, i32 %17
  %18 = load %struct.BSTREAM*, %struct.BSTREAM** %arrayidx8, align 4
  %tobool9 = icmp ne %struct.BSTREAM* %18, null
  br i1 %tobool9, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %if.then7
  %19 = load %struct.BSTREAM**, %struct.BSTREAM*** @buffers, align 4
  %20 = load i32, i32* %fd1.addr, align 4
  %arrayidx10 = getelementptr inbounds %struct.BSTREAM*, %struct.BSTREAM** %19, i32 %20
  %21 = load %struct.BSTREAM*, %struct.BSTREAM** %arrayidx10, align 4
  %b_buffer = getelementptr inbounds %struct.BSTREAM, %struct.BSTREAM* %21, i32 0, i32 1
  %22 = load i8*, i8** %b_buffer, align 4
  %tobool11 = icmp ne i8* %22, null
  br i1 %tobool11, label %land.lhs.true12, label %if.else

land.lhs.true12:                                  ; preds = %land.lhs.true
  %23 = load %struct.BSTREAM**, %struct.BSTREAM*** @buffers, align 4
  %24 = load i32, i32* %fd1.addr, align 4
  %arrayidx13 = getelementptr inbounds %struct.BSTREAM*, %struct.BSTREAM** %23, i32 %24
  %25 = load %struct.BSTREAM*, %struct.BSTREAM** %arrayidx13, align 4
  %b_buffer14 = getelementptr inbounds %struct.BSTREAM, %struct.BSTREAM* %25, i32 0, i32 1
  %26 = load i8*, i8** %b_buffer14, align 4
  %27 = load %struct.BSTREAM**, %struct.BSTREAM*** @buffers, align 4
  %28 = load i32, i32* %fd2.addr, align 4
  %arrayidx15 = getelementptr inbounds %struct.BSTREAM*, %struct.BSTREAM** %27, i32 %28
  %29 = load %struct.BSTREAM*, %struct.BSTREAM** %arrayidx15, align 4
  %b_buffer16 = getelementptr inbounds %struct.BSTREAM, %struct.BSTREAM* %29, i32 0, i32 1
  %30 = load i8*, i8** %b_buffer16, align 4
  %cmp17 = icmp eq i8* %26, %30
  br i1 %cmp17, label %if.then18, label %if.else

if.then18:                                        ; preds = %land.lhs.true12
  %31 = load %struct.BSTREAM**, %struct.BSTREAM*** @buffers, align 4
  %32 = load i32, i32* %fd2.addr, align 4
  %arrayidx19 = getelementptr inbounds %struct.BSTREAM*, %struct.BSTREAM** %31, i32 %32
  store %struct.BSTREAM* null, %struct.BSTREAM** %arrayidx19, align 4
  br label %if.end21

if.else:                                          ; preds = %land.lhs.true12, %land.lhs.true, %if.then7
  %33 = load %struct.BSTREAM**, %struct.BSTREAM*** @buffers, align 4
  %34 = load i32, i32* %fd2.addr, align 4
  %arrayidx20 = getelementptr inbounds %struct.BSTREAM*, %struct.BSTREAM** %33, i32 %34
  %35 = load %struct.BSTREAM*, %struct.BSTREAM** %arrayidx20, align 4
  call void @free_buffered_stream(%struct.BSTREAM* %35)
  br label %if.end21

if.end21:                                         ; preds = %if.else, %if.then18
  br label %if.end22

if.end22:                                         ; preds = %if.end21, %land.end
  %36 = load %struct.BSTREAM**, %struct.BSTREAM*** @buffers, align 4
  %37 = load i32, i32* %fd1.addr, align 4
  %arrayidx23 = getelementptr inbounds %struct.BSTREAM*, %struct.BSTREAM** %36, i32 %37
  %38 = load %struct.BSTREAM*, %struct.BSTREAM** %arrayidx23, align 4
  %call = call %struct.BSTREAM* @copy_buffered_stream(%struct.BSTREAM* %38)
  %39 = load %struct.BSTREAM**, %struct.BSTREAM*** @buffers, align 4
  %40 = load i32, i32* %fd2.addr, align 4
  %arrayidx24 = getelementptr inbounds %struct.BSTREAM*, %struct.BSTREAM** %39, i32 %40
  store %struct.BSTREAM* %call, %struct.BSTREAM** %arrayidx24, align 4
  %41 = load %struct.BSTREAM**, %struct.BSTREAM*** @buffers, align 4
  %42 = load i32, i32* %fd2.addr, align 4
  %arrayidx25 = getelementptr inbounds %struct.BSTREAM*, %struct.BSTREAM** %41, i32 %42
  %43 = load %struct.BSTREAM*, %struct.BSTREAM** %arrayidx25, align 4
  %tobool26 = icmp ne %struct.BSTREAM* %43, null
  br i1 %tobool26, label %if.then27, label %if.end29

if.then27:                                        ; preds = %if.end22
  %44 = load i32, i32* %fd2.addr, align 4
  %45 = load %struct.BSTREAM**, %struct.BSTREAM*** @buffers, align 4
  %46 = load i32, i32* %fd2.addr, align 4
  %arrayidx28 = getelementptr inbounds %struct.BSTREAM*, %struct.BSTREAM** %45, i32 %46
  %47 = load %struct.BSTREAM*, %struct.BSTREAM** %arrayidx28, align 4
  %b_fd = getelementptr inbounds %struct.BSTREAM, %struct.BSTREAM* %47, i32 0, i32 0
  store i32 %44, i32* %b_fd, align 4
  br label %if.end29

if.end29:                                         ; preds = %if.then27, %if.end22
  %48 = load i32, i32* %is_bash_input, align 4
  %tobool30 = icmp ne i32 %48, 0
  br i1 %tobool30, label %if.then31, label %if.end38

if.then31:                                        ; preds = %if.end29
  %49 = load %struct.BSTREAM**, %struct.BSTREAM*** @buffers, align 4
  %50 = load i32, i32* %fd2.addr, align 4
  %arrayidx32 = getelementptr inbounds %struct.BSTREAM*, %struct.BSTREAM** %49, i32 %50
  %51 = load %struct.BSTREAM*, %struct.BSTREAM** %arrayidx32, align 4
  %tobool33 = icmp ne %struct.BSTREAM* %51, null
  br i1 %tobool33, label %if.end36, label %if.then34

if.then34:                                        ; preds = %if.then31
  %52 = load i32, i32* %fd2.addr, align 4
  %call35 = call %struct.BSTREAM* @fd_to_buffered_stream(i32 %52)
  br label %if.end36

if.end36:                                         ; preds = %if.then34, %if.then31
  %53 = load %struct.BSTREAM**, %struct.BSTREAM*** @buffers, align 4
  %54 = load i32, i32* %fd2.addr, align 4
  %arrayidx37 = getelementptr inbounds %struct.BSTREAM*, %struct.BSTREAM** %53, i32 %54
  %55 = load %struct.BSTREAM*, %struct.BSTREAM** %arrayidx37, align 4
  %b_flag = getelementptr inbounds %struct.BSTREAM, %struct.BSTREAM* %55, i32 0, i32 4
  %56 = load i32, i32* %b_flag, align 4
  %or = or i32 %56, 8
  store i32 %or, i32* %b_flag, align 4
  br label %if.end38

if.end38:                                         ; preds = %if.end36, %if.end29
  %57 = load i32, i32* %fd2.addr, align 4
  store i32 %57, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end38, %if.then
  %58 = load i32, i32* %retval, align 4
  ret i32 %58
}

; Function Attrs: noinline nounwind
define internal void @allocate_buffers(i32 %n) #0 {
entry:
  %n.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %orig_nbuffers = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %0 = load i32, i32* @nbuffers, align 4
  store i32 %0, i32* %orig_nbuffers, align 4
  %1 = load i32, i32* %n.addr, align 4
  %add = add nsw i32 %1, 20
  store i32 %add, i32* @nbuffers, align 4
  %2 = load %struct.BSTREAM**, %struct.BSTREAM*** @buffers, align 4
  %3 = bitcast %struct.BSTREAM** %2 to i8*
  %4 = load i32, i32* @nbuffers, align 4
  %mul = mul i32 %4, 4
  %call = call i8* @sh_xrealloc(i8* %3, i32 %mul, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.3, i32 0, i32 0), i32 181)
  %5 = bitcast i8* %call to %struct.BSTREAM**
  store %struct.BSTREAM** %5, %struct.BSTREAM*** @buffers, align 4
  %6 = load i32, i32* %orig_nbuffers, align 4
  store i32 %6, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %7 = load i32, i32* %i, align 4
  %8 = load i32, i32* @nbuffers, align 4
  %cmp = icmp slt i32 %7, %8
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %9 = load %struct.BSTREAM**, %struct.BSTREAM*** @buffers, align 4
  %10 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds %struct.BSTREAM*, %struct.BSTREAM** %9, i32 %10
  store %struct.BSTREAM* null, %struct.BSTREAM** %arrayidx, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %11 = load i32, i32* %i, align 4
  %inc = add nsw i32 %11, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

; Function Attrs: noinline nounwind
define internal %struct.BSTREAM* @copy_buffered_stream(%struct.BSTREAM* %bp) #0 {
entry:
  %retval = alloca %struct.BSTREAM*, align 4
  %bp.addr = alloca %struct.BSTREAM*, align 4
  %nbp = alloca %struct.BSTREAM*, align 4
  store %struct.BSTREAM* %bp, %struct.BSTREAM** %bp.addr, align 4
  %0 = load %struct.BSTREAM*, %struct.BSTREAM** %bp.addr, align 4
  %tobool = icmp ne %struct.BSTREAM* %0, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  store %struct.BSTREAM* null, %struct.BSTREAM** %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %call = call i8* @sh_xmalloc(i32 24, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.3, i32 0, i32 0), i32 222)
  %1 = bitcast i8* %call to %struct.BSTREAM*
  store %struct.BSTREAM* %1, %struct.BSTREAM** %nbp, align 4
  %2 = load %struct.BSTREAM*, %struct.BSTREAM** %bp.addr, align 4
  %3 = bitcast %struct.BSTREAM* %2 to i8*
  %4 = load %struct.BSTREAM*, %struct.BSTREAM** %nbp, align 4
  %5 = bitcast %struct.BSTREAM* %4 to i8*
  call void @xbcopy(i8* %3, i8* %5, i32 24)
  %6 = load %struct.BSTREAM*, %struct.BSTREAM** %nbp, align 4
  store %struct.BSTREAM* %6, %struct.BSTREAM** %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %7 = load %struct.BSTREAM*, %struct.BSTREAM** %retval, align 4
  ret %struct.BSTREAM* %7
}

declare i32 @fstat(i32, %struct.stat*) #1

declare i32 @close(i32) #1

declare i32 @lseek(i32, i32, i32) #1

declare i8* @sh_xmalloc(i32, i8*, i32) #1

; Function Attrs: noinline nounwind
define internal %struct.BSTREAM* @make_buffered_stream(i32 %fd, i8* %buffer, i32 %bufsize) #0 {
entry:
  %fd.addr = alloca i32, align 4
  %buffer.addr = alloca i8*, align 4
  %bufsize.addr = alloca i32, align 4
  %bp = alloca %struct.BSTREAM*, align 4
  store i32 %fd, i32* %fd.addr, align 4
  store i8* %buffer, i8** %buffer.addr, align 4
  store i32 %bufsize, i32* %bufsize.addr, align 4
  %call = call i8* @sh_xmalloc(i32 24, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.3, i32 0, i32 0), i32 198)
  %0 = bitcast i8* %call to %struct.BSTREAM*
  store %struct.BSTREAM* %0, %struct.BSTREAM** %bp, align 4
  br label %do.body

do.body:                                          ; preds = %entry
  %1 = load i32, i32* %fd.addr, align 4
  %2 = load i32, i32* @nbuffers, align 4
  %cmp = icmp sge i32 %1, %2
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %do.body
  %3 = load i32, i32* %fd.addr, align 4
  call void @allocate_buffers(i32 %3)
  br label %if.end

if.end:                                           ; preds = %if.then, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  %4 = load %struct.BSTREAM*, %struct.BSTREAM** %bp, align 4
  %5 = load %struct.BSTREAM**, %struct.BSTREAM*** @buffers, align 4
  %6 = load i32, i32* %fd.addr, align 4
  %arrayidx = getelementptr inbounds %struct.BSTREAM*, %struct.BSTREAM** %5, i32 %6
  store %struct.BSTREAM* %4, %struct.BSTREAM** %arrayidx, align 4
  %7 = load i32, i32* %fd.addr, align 4
  %8 = load %struct.BSTREAM*, %struct.BSTREAM** %bp, align 4
  %b_fd = getelementptr inbounds %struct.BSTREAM, %struct.BSTREAM* %8, i32 0, i32 0
  store i32 %7, i32* %b_fd, align 4
  %9 = load i8*, i8** %buffer.addr, align 4
  %10 = load %struct.BSTREAM*, %struct.BSTREAM** %bp, align 4
  %b_buffer = getelementptr inbounds %struct.BSTREAM, %struct.BSTREAM* %10, i32 0, i32 1
  store i8* %9, i8** %b_buffer, align 4
  %11 = load i32, i32* %bufsize.addr, align 4
  %12 = load %struct.BSTREAM*, %struct.BSTREAM** %bp, align 4
  %b_size = getelementptr inbounds %struct.BSTREAM, %struct.BSTREAM* %12, i32 0, i32 2
  store i32 %11, i32* %b_size, align 4
  %13 = load %struct.BSTREAM*, %struct.BSTREAM** %bp, align 4
  %b_flag = getelementptr inbounds %struct.BSTREAM, %struct.BSTREAM* %13, i32 0, i32 4
  store i32 0, i32* %b_flag, align 4
  %14 = load %struct.BSTREAM*, %struct.BSTREAM** %bp, align 4
  %b_inputp = getelementptr inbounds %struct.BSTREAM, %struct.BSTREAM* %14, i32 0, i32 5
  store i32 0, i32* %b_inputp, align 4
  %15 = load %struct.BSTREAM*, %struct.BSTREAM** %bp, align 4
  %b_used = getelementptr inbounds %struct.BSTREAM, %struct.BSTREAM* %15, i32 0, i32 3
  store i32 0, i32* %b_used, align 4
  %16 = load i32, i32* %bufsize.addr, align 4
  %cmp1 = icmp eq i32 %16, 1
  br i1 %cmp1, label %if.then2, label %if.end4

if.then2:                                         ; preds = %do.end
  %17 = load %struct.BSTREAM*, %struct.BSTREAM** %bp, align 4
  %b_flag3 = getelementptr inbounds %struct.BSTREAM, %struct.BSTREAM* %17, i32 0, i32 4
  %18 = load i32, i32* %b_flag3, align 4
  %or = or i32 %18, 4
  store i32 %or, i32* %b_flag3, align 4
  br label %if.end4

if.end4:                                          ; preds = %if.then2, %do.end
  %19 = load %struct.BSTREAM*, %struct.BSTREAM** %bp, align 4
  ret %struct.BSTREAM* %19
}

; Function Attrs: noinline nounwind
define %struct.BSTREAM* @open_buffered_stream(i8* %file) #0 {
entry:
  %file.addr = alloca i8*, align 4
  %fd = alloca i32, align 4
  store i8* %file, i8** %file.addr, align 4
  %0 = load i8*, i8** %file.addr, align 4
  %call = call i32 (i8*, i32, ...) @open(i8* %0, i32 0)
  store i32 %call, i32* %fd, align 4
  %1 = load i32, i32* %fd, align 4
  %cmp = icmp sge i32 %1, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %2 = load i32, i32* %fd, align 4
  %call1 = call %struct.BSTREAM* @fd_to_buffered_stream(i32 %2)
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi %struct.BSTREAM* [ %call1, %cond.true ], [ null, %cond.false ]
  ret %struct.BSTREAM* %cond
}

declare i32 @open(i8*, i32, ...) #1

declare void @sh_xfree(i8*, i8*, i32) #1

; Function Attrs: noinline nounwind
define i32 @close_buffered_stream(%struct.BSTREAM* %bp) #0 {
entry:
  %retval = alloca i32, align 4
  %bp.addr = alloca %struct.BSTREAM*, align 4
  %fd = alloca i32, align 4
  store %struct.BSTREAM* %bp, %struct.BSTREAM** %bp.addr, align 4
  %0 = load %struct.BSTREAM*, %struct.BSTREAM** %bp.addr, align 4
  %tobool = icmp ne %struct.BSTREAM* %0, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = load %struct.BSTREAM*, %struct.BSTREAM** %bp.addr, align 4
  %b_fd = getelementptr inbounds %struct.BSTREAM, %struct.BSTREAM* %1, i32 0, i32 0
  %2 = load i32, i32* %b_fd, align 4
  store i32 %2, i32* %fd, align 4
  %3 = load %struct.BSTREAM*, %struct.BSTREAM** %bp.addr, align 4
  call void @free_buffered_stream(%struct.BSTREAM* %3)
  %4 = load i32, i32* %fd, align 4
  %call = call i32 @close(i32 %4)
  store i32 %call, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %5 = load i32, i32* %retval, align 4
  ret i32 %5
}

; Function Attrs: noinline nounwind
define %struct.BSTREAM* @set_buffered_stream(i32 %fd, %struct.BSTREAM* %bp) #0 {
entry:
  %fd.addr = alloca i32, align 4
  %bp.addr = alloca %struct.BSTREAM*, align 4
  %ret = alloca %struct.BSTREAM*, align 4
  store i32 %fd, i32* %fd.addr, align 4
  store %struct.BSTREAM* %bp, %struct.BSTREAM** %bp.addr, align 4
  %0 = load %struct.BSTREAM**, %struct.BSTREAM*** @buffers, align 4
  %1 = load i32, i32* %fd.addr, align 4
  %arrayidx = getelementptr inbounds %struct.BSTREAM*, %struct.BSTREAM** %0, i32 %1
  %2 = load %struct.BSTREAM*, %struct.BSTREAM** %arrayidx, align 4
  store %struct.BSTREAM* %2, %struct.BSTREAM** %ret, align 4
  %3 = load %struct.BSTREAM*, %struct.BSTREAM** %bp.addr, align 4
  %4 = load %struct.BSTREAM**, %struct.BSTREAM*** @buffers, align 4
  %5 = load i32, i32* %fd.addr, align 4
  %arrayidx1 = getelementptr inbounds %struct.BSTREAM*, %struct.BSTREAM** %4, i32 %5
  store %struct.BSTREAM* %3, %struct.BSTREAM** %arrayidx1, align 4
  %6 = load %struct.BSTREAM*, %struct.BSTREAM** %ret, align 4
  ret %struct.BSTREAM* %6
}

; Function Attrs: noinline nounwind
define i32 @buffered_getchar() #0 {
entry:
  br label %do.body

do.body:                                          ; preds = %entry
  %0 = load volatile i32, i32* @terminating_signal, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %do.body
  %1 = load volatile i32, i32* @terminating_signal, align 4
  call void @termsig_handler(i32 %1)
  br label %if.end

if.end:                                           ; preds = %if.then, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  %2 = load %struct.BSTREAM**, %struct.BSTREAM*** @buffers, align 4
  %3 = load i32, i32* bitcast (%union.INPUT_STREAM* getelementptr inbounds (%struct.BASH_INPUT, %struct.BASH_INPUT* @bash_input, i32 0, i32 2) to i32*), align 4
  %arrayidx = getelementptr inbounds %struct.BSTREAM*, %struct.BSTREAM** %2, i32 %3
  %4 = load %struct.BSTREAM*, %struct.BSTREAM** %arrayidx, align 4
  %b_inputp = getelementptr inbounds %struct.BSTREAM, %struct.BSTREAM* %4, i32 0, i32 5
  %5 = load i32, i32* %b_inputp, align 4
  %6 = load %struct.BSTREAM**, %struct.BSTREAM*** @buffers, align 4
  %7 = load i32, i32* bitcast (%union.INPUT_STREAM* getelementptr inbounds (%struct.BASH_INPUT, %struct.BASH_INPUT* @bash_input, i32 0, i32 2) to i32*), align 4
  %arrayidx1 = getelementptr inbounds %struct.BSTREAM*, %struct.BSTREAM** %6, i32 %7
  %8 = load %struct.BSTREAM*, %struct.BSTREAM** %arrayidx1, align 4
  %b_used = getelementptr inbounds %struct.BSTREAM, %struct.BSTREAM* %8, i32 0, i32 3
  %9 = load i32, i32* %b_used, align 4
  %cmp = icmp eq i32 %5, %9
  br i1 %cmp, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %do.end
  %10 = load %struct.BSTREAM**, %struct.BSTREAM*** @buffers, align 4
  %11 = load i32, i32* bitcast (%union.INPUT_STREAM* getelementptr inbounds (%struct.BASH_INPUT, %struct.BASH_INPUT* @bash_input, i32 0, i32 2) to i32*), align 4
  %arrayidx2 = getelementptr inbounds %struct.BSTREAM*, %struct.BSTREAM** %10, i32 %11
  %12 = load %struct.BSTREAM*, %struct.BSTREAM** %arrayidx2, align 4
  %b_used3 = getelementptr inbounds %struct.BSTREAM, %struct.BSTREAM* %12, i32 0, i32 3
  %13 = load i32, i32* %b_used3, align 4
  %tobool4 = icmp ne i32 %13, 0
  br i1 %tobool4, label %cond.false, label %cond.true

cond.true:                                        ; preds = %lor.lhs.false, %do.end
  %14 = load %struct.BSTREAM**, %struct.BSTREAM*** @buffers, align 4
  %15 = load i32, i32* bitcast (%union.INPUT_STREAM* getelementptr inbounds (%struct.BASH_INPUT, %struct.BASH_INPUT* @bash_input, i32 0, i32 2) to i32*), align 4
  %arrayidx5 = getelementptr inbounds %struct.BSTREAM*, %struct.BSTREAM** %14, i32 %15
  %16 = load %struct.BSTREAM*, %struct.BSTREAM** %arrayidx5, align 4
  %call = call i32 @b_fill_buffer(%struct.BSTREAM* %16)
  br label %cond.end

cond.false:                                       ; preds = %lor.lhs.false
  %17 = load %struct.BSTREAM**, %struct.BSTREAM*** @buffers, align 4
  %18 = load i32, i32* bitcast (%union.INPUT_STREAM* getelementptr inbounds (%struct.BASH_INPUT, %struct.BASH_INPUT* @bash_input, i32 0, i32 2) to i32*), align 4
  %arrayidx6 = getelementptr inbounds %struct.BSTREAM*, %struct.BSTREAM** %17, i32 %18
  %19 = load %struct.BSTREAM*, %struct.BSTREAM** %arrayidx6, align 4
  %b_buffer = getelementptr inbounds %struct.BSTREAM, %struct.BSTREAM* %19, i32 0, i32 1
  %20 = load i8*, i8** %b_buffer, align 4
  %21 = load %struct.BSTREAM**, %struct.BSTREAM*** @buffers, align 4
  %22 = load i32, i32* bitcast (%union.INPUT_STREAM* getelementptr inbounds (%struct.BASH_INPUT, %struct.BASH_INPUT* @bash_input, i32 0, i32 2) to i32*), align 4
  %arrayidx7 = getelementptr inbounds %struct.BSTREAM*, %struct.BSTREAM** %21, i32 %22
  %23 = load %struct.BSTREAM*, %struct.BSTREAM** %arrayidx7, align 4
  %b_inputp8 = getelementptr inbounds %struct.BSTREAM, %struct.BSTREAM* %23, i32 0, i32 5
  %24 = load i32, i32* %b_inputp8, align 4
  %inc = add i32 %24, 1
  store i32 %inc, i32* %b_inputp8, align 4
  %arrayidx9 = getelementptr inbounds i8, i8* %20, i32 %24
  %25 = load i8, i8* %arrayidx9, align 1
  %conv = sext i8 %25 to i32
  %and = and i32 %conv, 255
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call, %cond.true ], [ %and, %cond.false ]
  ret i32 %cond
}

; Function Attrs: noinline nounwind
define internal i32 @b_fill_buffer(%struct.BSTREAM* %bp) #0 {
entry:
  %retval = alloca i32, align 4
  %bp.addr = alloca %struct.BSTREAM*, align 4
  %nr = alloca i32, align 4
  %o = alloca i32, align 4
  store %struct.BSTREAM* %bp, %struct.BSTREAM** %bp.addr, align 4
  br label %do.body

do.body:                                          ; preds = %entry
  %0 = load volatile i32, i32* @terminating_signal, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %do.body
  %1 = load volatile i32, i32* @terminating_signal, align 4
  call void @termsig_handler(i32 %1)
  br label %if.end

if.end:                                           ; preds = %if.then, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  %2 = load %struct.BSTREAM*, %struct.BSTREAM** %bp.addr, align 4
  %b_flag = getelementptr inbounds %struct.BSTREAM, %struct.BSTREAM* %2, i32 0, i32 4
  %3 = load i32, i32* %b_flag, align 4
  %and = and i32 %3, 20
  %cmp = icmp eq i32 %and, 16
  br i1 %cmp, label %if.then1, label %if.else

if.then1:                                         ; preds = %do.end
  %4 = load %struct.BSTREAM*, %struct.BSTREAM** %bp.addr, align 4
  %b_fd = getelementptr inbounds %struct.BSTREAM, %struct.BSTREAM* %4, i32 0, i32 0
  %5 = load i32, i32* %b_fd, align 4
  %call = call i32 @lseek(i32 %5, i32 0, i32 1)
  store i32 %call, i32* %o, align 4
  %6 = load %struct.BSTREAM*, %struct.BSTREAM** %bp.addr, align 4
  %b_fd2 = getelementptr inbounds %struct.BSTREAM, %struct.BSTREAM* %6, i32 0, i32 0
  %7 = load i32, i32* %b_fd2, align 4
  %8 = load %struct.BSTREAM*, %struct.BSTREAM** %bp.addr, align 4
  %b_buffer = getelementptr inbounds %struct.BSTREAM, %struct.BSTREAM* %8, i32 0, i32 1
  %9 = load i8*, i8** %b_buffer, align 4
  %10 = load %struct.BSTREAM*, %struct.BSTREAM** %bp.addr, align 4
  %b_size = getelementptr inbounds %struct.BSTREAM, %struct.BSTREAM* %10, i32 0, i32 2
  %11 = load i32, i32* %b_size, align 4
  %call3 = call i32 @zread(i32 %7, i8* %9, i32 %11)
  store i32 %call3, i32* %nr, align 4
  %12 = load i32, i32* %nr, align 4
  %cmp4 = icmp sgt i32 %12, 0
  br i1 %cmp4, label %land.lhs.true, label %if.end17

land.lhs.true:                                    ; preds = %if.then1
  %13 = load i32, i32* %nr, align 4
  %14 = load %struct.BSTREAM*, %struct.BSTREAM** %bp.addr, align 4
  %b_fd5 = getelementptr inbounds %struct.BSTREAM, %struct.BSTREAM* %14, i32 0, i32 0
  %15 = load i32, i32* %b_fd5, align 4
  %call6 = call i32 @lseek(i32 %15, i32 0, i32 1)
  %16 = load i32, i32* %o, align 4
  %sub = sub nsw i32 %call6, %16
  %cmp7 = icmp slt i32 %13, %sub
  br i1 %cmp7, label %if.then8, label %if.end17

if.then8:                                         ; preds = %land.lhs.true
  %17 = load %struct.BSTREAM*, %struct.BSTREAM** %bp.addr, align 4
  %b_fd9 = getelementptr inbounds %struct.BSTREAM, %struct.BSTREAM* %17, i32 0, i32 0
  %18 = load i32, i32* %b_fd9, align 4
  %19 = load i32, i32* %o, align 4
  %call10 = call i32 @lseek(i32 %18, i32 %19, i32 0)
  %20 = load %struct.BSTREAM*, %struct.BSTREAM** %bp.addr, align 4
  %b_flag11 = getelementptr inbounds %struct.BSTREAM, %struct.BSTREAM* %20, i32 0, i32 4
  %21 = load i32, i32* %b_flag11, align 4
  %or = or i32 %21, 4
  store i32 %or, i32* %b_flag11, align 4
  %22 = load %struct.BSTREAM*, %struct.BSTREAM** %bp.addr, align 4
  %b_size12 = getelementptr inbounds %struct.BSTREAM, %struct.BSTREAM* %22, i32 0, i32 2
  store i32 1, i32* %b_size12, align 4
  %23 = load %struct.BSTREAM*, %struct.BSTREAM** %bp.addr, align 4
  %b_fd13 = getelementptr inbounds %struct.BSTREAM, %struct.BSTREAM* %23, i32 0, i32 0
  %24 = load i32, i32* %b_fd13, align 4
  %25 = load %struct.BSTREAM*, %struct.BSTREAM** %bp.addr, align 4
  %b_buffer14 = getelementptr inbounds %struct.BSTREAM, %struct.BSTREAM* %25, i32 0, i32 1
  %26 = load i8*, i8** %b_buffer14, align 4
  %27 = load %struct.BSTREAM*, %struct.BSTREAM** %bp.addr, align 4
  %b_size15 = getelementptr inbounds %struct.BSTREAM, %struct.BSTREAM* %27, i32 0, i32 2
  %28 = load i32, i32* %b_size15, align 4
  %call16 = call i32 @zread(i32 %24, i8* %26, i32 %28)
  store i32 %call16, i32* %nr, align 4
  br label %if.end17

if.end17:                                         ; preds = %if.then8, %land.lhs.true, %if.then1
  br label %if.end22

if.else:                                          ; preds = %do.end
  %29 = load %struct.BSTREAM*, %struct.BSTREAM** %bp.addr, align 4
  %b_fd18 = getelementptr inbounds %struct.BSTREAM, %struct.BSTREAM* %29, i32 0, i32 0
  %30 = load i32, i32* %b_fd18, align 4
  %31 = load %struct.BSTREAM*, %struct.BSTREAM** %bp.addr, align 4
  %b_buffer19 = getelementptr inbounds %struct.BSTREAM, %struct.BSTREAM* %31, i32 0, i32 1
  %32 = load i8*, i8** %b_buffer19, align 4
  %33 = load %struct.BSTREAM*, %struct.BSTREAM** %bp.addr, align 4
  %b_size20 = getelementptr inbounds %struct.BSTREAM, %struct.BSTREAM* %33, i32 0, i32 2
  %34 = load i32, i32* %b_size20, align 4
  %call21 = call i32 @zread(i32 %30, i8* %32, i32 %34)
  store i32 %call21, i32* %nr, align 4
  br label %if.end22

if.end22:                                         ; preds = %if.else, %if.end17
  %35 = load i32, i32* %nr, align 4
  %cmp23 = icmp sle i32 %35, 0
  br i1 %cmp23, label %if.then24, label %if.end34

if.then24:                                        ; preds = %if.end22
  %36 = load %struct.BSTREAM*, %struct.BSTREAM** %bp.addr, align 4
  %b_used = getelementptr inbounds %struct.BSTREAM, %struct.BSTREAM* %36, i32 0, i32 3
  store i32 0, i32* %b_used, align 4
  %37 = load %struct.BSTREAM*, %struct.BSTREAM** %bp.addr, align 4
  %b_buffer25 = getelementptr inbounds %struct.BSTREAM, %struct.BSTREAM* %37, i32 0, i32 1
  %38 = load i8*, i8** %b_buffer25, align 4
  %arrayidx = getelementptr inbounds i8, i8* %38, i32 0
  store i8 0, i8* %arrayidx, align 1
  %39 = load i32, i32* %nr, align 4
  %cmp26 = icmp eq i32 %39, 0
  br i1 %cmp26, label %if.then27, label %if.else30

if.then27:                                        ; preds = %if.then24
  %40 = load %struct.BSTREAM*, %struct.BSTREAM** %bp.addr, align 4
  %b_flag28 = getelementptr inbounds %struct.BSTREAM, %struct.BSTREAM* %40, i32 0, i32 4
  %41 = load i32, i32* %b_flag28, align 4
  %or29 = or i32 %41, 1
  store i32 %or29, i32* %b_flag28, align 4
  br label %if.end33

if.else30:                                        ; preds = %if.then24
  %42 = load %struct.BSTREAM*, %struct.BSTREAM** %bp.addr, align 4
  %b_flag31 = getelementptr inbounds %struct.BSTREAM, %struct.BSTREAM* %42, i32 0, i32 4
  %43 = load i32, i32* %b_flag31, align 4
  %or32 = or i32 %43, 2
  store i32 %or32, i32* %b_flag31, align 4
  br label %if.end33

if.end33:                                         ; preds = %if.else30, %if.then27
  store i32 -1, i32* %retval, align 4
  br label %return

if.end34:                                         ; preds = %if.end22
  %44 = load i32, i32* %nr, align 4
  %45 = load %struct.BSTREAM*, %struct.BSTREAM** %bp.addr, align 4
  %b_used35 = getelementptr inbounds %struct.BSTREAM, %struct.BSTREAM* %45, i32 0, i32 3
  store i32 %44, i32* %b_used35, align 4
  %46 = load %struct.BSTREAM*, %struct.BSTREAM** %bp.addr, align 4
  %b_inputp = getelementptr inbounds %struct.BSTREAM, %struct.BSTREAM* %46, i32 0, i32 5
  store i32 0, i32* %b_inputp, align 4
  %47 = load %struct.BSTREAM*, %struct.BSTREAM** %bp.addr, align 4
  %b_buffer36 = getelementptr inbounds %struct.BSTREAM, %struct.BSTREAM* %47, i32 0, i32 1
  %48 = load i8*, i8** %b_buffer36, align 4
  %49 = load %struct.BSTREAM*, %struct.BSTREAM** %bp.addr, align 4
  %b_inputp37 = getelementptr inbounds %struct.BSTREAM, %struct.BSTREAM* %49, i32 0, i32 5
  %50 = load i32, i32* %b_inputp37, align 4
  %inc = add i32 %50, 1
  store i32 %inc, i32* %b_inputp37, align 4
  %arrayidx38 = getelementptr inbounds i8, i8* %48, i32 %50
  %51 = load i8, i8* %arrayidx38, align 1
  %conv = sext i8 %51 to i32
  %and39 = and i32 %conv, 255
  store i32 %and39, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end34, %if.end33
  %52 = load i32, i32* %retval, align 4
  ret i32 %52
}

; Function Attrs: noinline nounwind
define i32 @buffered_ungetchar(i32 %c) #0 {
entry:
  %c.addr = alloca i32, align 4
  store i32 %c, i32* %c.addr, align 4
  %0 = load i32, i32* %c.addr, align 4
  %1 = load %struct.BSTREAM**, %struct.BSTREAM*** @buffers, align 4
  %2 = load i32, i32* bitcast (%union.INPUT_STREAM* getelementptr inbounds (%struct.BASH_INPUT, %struct.BASH_INPUT* @bash_input, i32 0, i32 2) to i32*), align 4
  %arrayidx = getelementptr inbounds %struct.BSTREAM*, %struct.BSTREAM** %1, i32 %2
  %3 = load %struct.BSTREAM*, %struct.BSTREAM** %arrayidx, align 4
  %call = call i32 @bufstream_ungetc(i32 %0, %struct.BSTREAM* %3)
  ret i32 %call
}

; Function Attrs: noinline nounwind
define internal i32 @bufstream_ungetc(i32 %c, %struct.BSTREAM* %bp) #0 {
entry:
  %retval = alloca i32, align 4
  %c.addr = alloca i32, align 4
  %bp.addr = alloca %struct.BSTREAM*, align 4
  store i32 %c, i32* %c.addr, align 4
  store %struct.BSTREAM* %bp, %struct.BSTREAM** %bp.addr, align 4
  %0 = load i32, i32* %c.addr, align 4
  %cmp = icmp eq i32 %0, -1
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load %struct.BSTREAM*, %struct.BSTREAM** %bp.addr, align 4
  %b_inputp = getelementptr inbounds %struct.BSTREAM, %struct.BSTREAM* %1, i32 0, i32 5
  %2 = load i32, i32* %b_inputp, align 4
  %cmp1 = icmp eq i32 %2, 0
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i32 -1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %3 = load i32, i32* %c.addr, align 4
  %conv = trunc i32 %3 to i8
  %4 = load %struct.BSTREAM*, %struct.BSTREAM** %bp.addr, align 4
  %b_buffer = getelementptr inbounds %struct.BSTREAM, %struct.BSTREAM* %4, i32 0, i32 1
  %5 = load i8*, i8** %b_buffer, align 4
  %6 = load %struct.BSTREAM*, %struct.BSTREAM** %bp.addr, align 4
  %b_inputp2 = getelementptr inbounds %struct.BSTREAM, %struct.BSTREAM* %6, i32 0, i32 5
  %7 = load i32, i32* %b_inputp2, align 4
  %dec = add i32 %7, -1
  store i32 %dec, i32* %b_inputp2, align 4
  %arrayidx = getelementptr inbounds i8, i8* %5, i32 %dec
  store i8 %conv, i8* %arrayidx, align 1
  %8 = load i32, i32* %c.addr, align 4
  store i32 %8, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %9 = load i32, i32* %retval, align 4
  ret i32 %9
}

; Function Attrs: noinline nounwind
define void @with_input_from_buffered_stream(i32 %bfd, i8* %name) #0 {
entry:
  %bfd.addr = alloca i32, align 4
  %name.addr = alloca i8*, align 4
  %location = alloca %union.INPUT_STREAM, align 4
  %bp = alloca %struct.BSTREAM*, align 4
  store i32 %bfd, i32* %bfd.addr, align 4
  store i8* %name, i8** %name.addr, align 4
  %0 = load i32, i32* %bfd.addr, align 4
  %buffered_fd = bitcast %union.INPUT_STREAM* %location to i32*
  store i32 %0, i32* %buffered_fd, align 4
  %1 = load i32, i32* %bfd.addr, align 4
  %call = call %struct.BSTREAM* @fd_to_buffered_stream(i32 %1)
  store %struct.BSTREAM* %call, %struct.BSTREAM** %bp, align 4
  %2 = load %struct.BSTREAM*, %struct.BSTREAM** %bp, align 4
  %cmp = icmp eq %struct.BSTREAM* %2, null
  %cond = select i1 %cmp, i32 ()* @return_EOF, i32 ()* @buffered_getchar
  %3 = load i8*, i8** %name.addr, align 4
  call void @init_yy_io(i32 ()* %cond, i32 (i32)* @buffered_ungetchar, i32 4, i8* %3, %union.INPUT_STREAM* byval align 4 %location)
  ret void
}

declare void @init_yy_io(i32 ()*, i32 (i32)*, i32, i8*, %union.INPUT_STREAM* byval align 4) #1

declare i32 @return_EOF() #1

declare i8* @sh_xrealloc(i8*, i32, i8*, i32) #1

declare void @xbcopy(i8*, i8*, i32) #1

declare i32 @zread(i32, i8*, i32) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
