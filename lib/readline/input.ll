; ModuleID = 'input.c'
source_filename = "input.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct._IO_FILE = type opaque
%struct._keymap_entry = type { i8, i32 (i32, i32)* }
%struct.__sigset_t = type { [32 x i32] }
%struct.fd_set = type { [32 x i32] }
%struct.timespec = type { i32, i32 }
%struct.timeval = type { i32, i32 }
%struct.__mbstate_t = type { i32, i32 }

@rl_event_hook = global i32 ()* null, align 4
@rl_signal_event_hook = global i32 ()* null, align 4
@rl_input_available_hook = global i32 ()* null, align 4
@rl_getc_function = global i32 (%struct._IO_FILE*)* @rl_getc, align 4
@push_index = internal global i32 0, align 4
@pop_index = internal global i32 0, align 4
@ibuffer_len = internal global i32 511, align 4
@ibuffer = internal global [512 x i8] zeroinitializer, align 1
@_keyboard_input_timeout = internal global i32 100000, align 4
@rl_instream = external global %struct._IO_FILE*, align 4
@_rl_keymap = external global %struct._keymap_entry*, align 4
@rl_pending_input = external global i32, align 4
@rl_readline_state = external global i32, align 4
@rl_done = external global i32, align 4
@_rl_caught_signal = external global i32, align 4

; Function Attrs: noinline nounwind
define i32 @rl_getc(%struct._IO_FILE* %stream) #0 {
entry:
  %retval = alloca i32, align 4
  %stream.addr = alloca %struct._IO_FILE*, align 4
  %result = alloca i32, align 4
  %c = alloca i8, align 1
  %empty_set = alloca %struct.__sigset_t, align 4
  %readfds = alloca %struct.fd_set, align 4
  %__i = alloca i32, align 4
  %__b = alloca i32*, align 4
  store %struct._IO_FILE* %stream, %struct._IO_FILE** %stream.addr, align 4
  br label %while.body

while.body:                                       ; preds = %entry, %if.end32, %if.end89
  br label %do.body

do.body:                                          ; preds = %while.body
  %0 = load volatile i32, i32* @_rl_caught_signal, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %do.body
  %1 = load volatile i32, i32* @_rl_caught_signal, align 4
  call void @_rl_signal_handler(i32 %1)
  br label %if.end

if.end:                                           ; preds = %if.then, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  store i32 0, i32* %result, align 4
  %call = call i32 @sigemptyset(%struct.__sigset_t* %empty_set)
  br label %do.body1

do.body1:                                         ; preds = %do.end
  %fds_bits = getelementptr inbounds %struct.fd_set, %struct.fd_set* %readfds, i32 0, i32 0
  %arraydecay = getelementptr inbounds [32 x i32], [32 x i32]* %fds_bits, i32 0, i32 0
  store i32* %arraydecay, i32** %__b, align 4
  store i32 32, i32* %__i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %do.body1
  %2 = load i32, i32* %__i, align 4
  %tobool2 = icmp ne i32 %2, 0
  br i1 %tobool2, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %__b, align 4
  %incdec.ptr = getelementptr inbounds i32, i32* %3, i32 1
  store i32* %incdec.ptr, i32** %__b, align 4
  store i32 0, i32* %3, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %4 = load i32, i32* %__i, align 4
  %dec = add nsw i32 %4, -1
  store i32 %dec, i32* %__i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  br label %do.end3

do.end3:                                          ; preds = %for.end
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** %stream.addr, align 4
  %call4 = call i32 @fileno(%struct._IO_FILE* %5)
  %rem = urem i32 %call4, 32
  %shl = shl i32 1, %rem
  %fds_bits5 = getelementptr inbounds %struct.fd_set, %struct.fd_set* %readfds, i32 0, i32 0
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** %stream.addr, align 4
  %call6 = call i32 @fileno(%struct._IO_FILE* %6)
  %div = udiv i32 %call6, 32
  %arrayidx = getelementptr inbounds [32 x i32], [32 x i32]* %fds_bits5, i32 0, i32 %div
  %7 = load i32, i32* %arrayidx, align 4
  %or = or i32 %7, %shl
  store i32 %or, i32* %arrayidx, align 4
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** %stream.addr, align 4
  %call7 = call i32 @fileno(%struct._IO_FILE* %8)
  %add = add nsw i32 %call7, 1
  %call8 = call i32 @pselect(i32 %add, %struct.fd_set* %readfds, %struct.fd_set* null, %struct.fd_set* null, %struct.timespec* null, %struct.__sigset_t* %empty_set)
  store i32 %call8, i32* %result, align 4
  %9 = load i32, i32* %result, align 4
  %cmp = icmp sge i32 %9, 0
  br i1 %cmp, label %if.then9, label %if.end12

if.then9:                                         ; preds = %do.end3
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** %stream.addr, align 4
  %call10 = call i32 @fileno(%struct._IO_FILE* %10)
  %call11 = call i32 @read(i32 %call10, i8* %c, i32 1)
  store i32 %call11, i32* %result, align 4
  br label %if.end12

if.end12:                                         ; preds = %if.then9, %do.end3
  %11 = load i32, i32* %result, align 4
  %cmp13 = icmp eq i32 %11, 1
  br i1 %cmp13, label %if.then14, label %if.end15

if.then14:                                        ; preds = %if.end12
  %12 = load i8, i8* %c, align 1
  %conv = zext i8 %12 to i32
  store i32 %conv, i32* %retval, align 4
  br label %return

if.end15:                                         ; preds = %if.end12
  %13 = load i32, i32* %result, align 4
  %cmp16 = icmp eq i32 %13, 0
  br i1 %cmp16, label %if.then18, label %if.end19

if.then18:                                        ; preds = %if.end15
  store i32 -1, i32* %retval, align 4
  br label %return

if.end19:                                         ; preds = %if.end15
  %call20 = call i32* @__errno_location()
  %14 = load i32, i32* %call20, align 4
  %cmp21 = icmp eq i32 %14, 11
  br i1 %cmp21, label %if.then26, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end19
  %call23 = call i32* @__errno_location()
  %15 = load i32, i32* %call23, align 4
  %cmp24 = icmp eq i32 %15, 11
  br i1 %cmp24, label %if.then26, label %if.end33

if.then26:                                        ; preds = %lor.lhs.false, %if.end19
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** %stream.addr, align 4
  %call27 = call i32 @fileno(%struct._IO_FILE* %16)
  %call28 = call i32 @sh_unset_nodelay_mode(i32 %call27)
  %cmp29 = icmp slt i32 %call28, 0
  br i1 %cmp29, label %if.then31, label %if.end32

if.then31:                                        ; preds = %if.then26
  store i32 -1, i32* %retval, align 4
  br label %return

if.end32:                                         ; preds = %if.then26
  br label %while.body

if.end33:                                         ; preds = %lor.lhs.false
  br label %handle_error

handle_error:                                     ; preds = %if.end33
  %call34 = call i32* @__errno_location()
  %17 = load i32, i32* %call34, align 4
  %cmp35 = icmp ne i32 %17, 4
  br i1 %cmp35, label %if.then37, label %if.else

if.then37:                                        ; preds = %handle_error
  %18 = load i32, i32* @rl_readline_state, align 4
  %and = and i32 %18, 8
  %tobool38 = icmp ne i32 %and, 0
  %cond = select i1 %tobool38, i32 -2, i32 -1
  store i32 %cond, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %handle_error
  %19 = load volatile i32, i32* @_rl_caught_signal, align 4
  %cmp39 = icmp eq i32 %19, 1
  br i1 %cmp39, label %if.then44, label %lor.lhs.false41

lor.lhs.false41:                                  ; preds = %if.else
  %20 = load volatile i32, i32* @_rl_caught_signal, align 4
  %cmp42 = icmp eq i32 %20, 15
  br i1 %cmp42, label %if.then44, label %if.else48

if.then44:                                        ; preds = %lor.lhs.false41, %if.else
  %21 = load i32, i32* @rl_readline_state, align 4
  %and45 = and i32 %21, 8
  %tobool46 = icmp ne i32 %and45, 0
  %cond47 = select i1 %tobool46, i32 -2, i32 -1
  store i32 %cond47, i32* %retval, align 4
  br label %return

if.else48:                                        ; preds = %lor.lhs.false41
  %22 = load volatile i32, i32* @_rl_caught_signal, align 4
  %cmp49 = icmp eq i32 %22, 2
  br i1 %cmp49, label %if.then54, label %lor.lhs.false51

lor.lhs.false51:                                  ; preds = %if.else48
  %23 = load volatile i32, i32* @_rl_caught_signal, align 4
  %cmp52 = icmp eq i32 %23, 3
  br i1 %cmp52, label %if.then54, label %if.else60

if.then54:                                        ; preds = %lor.lhs.false51, %if.else48
  br label %do.body55

do.body55:                                        ; preds = %if.then54
  %24 = load volatile i32, i32* @_rl_caught_signal, align 4
  %tobool56 = icmp ne i32 %24, 0
  br i1 %tobool56, label %if.then57, label %if.end58

if.then57:                                        ; preds = %do.body55
  %25 = load volatile i32, i32* @_rl_caught_signal, align 4
  call void @_rl_signal_handler(i32 %25)
  br label %if.end58

if.end58:                                         ; preds = %if.then57, %do.body55
  br label %do.end59

do.end59:                                         ; preds = %if.end58
  br label %if.end83

if.else60:                                        ; preds = %lor.lhs.false51
  %26 = load volatile i32, i32* @_rl_caught_signal, align 4
  %cmp61 = icmp eq i32 %26, 28
  br i1 %cmp61, label %if.then63, label %if.else69

if.then63:                                        ; preds = %if.else60
  br label %do.body64

do.body64:                                        ; preds = %if.then63
  %27 = load volatile i32, i32* @_rl_caught_signal, align 4
  %tobool65 = icmp ne i32 %27, 0
  br i1 %tobool65, label %if.then66, label %if.end67

if.then66:                                        ; preds = %do.body64
  %28 = load volatile i32, i32* @_rl_caught_signal, align 4
  call void @_rl_signal_handler(i32 %28)
  br label %if.end67

if.end67:                                         ; preds = %if.then66, %do.body64
  br label %do.end68

do.end68:                                         ; preds = %if.end67
  br label %if.end82

if.else69:                                        ; preds = %if.else60
  %29 = load volatile i32, i32* @_rl_caught_signal, align 4
  %cmp70 = icmp eq i32 %29, 14
  br i1 %cmp70, label %if.then75, label %lor.lhs.false72

lor.lhs.false72:                                  ; preds = %if.else69
  %30 = load volatile i32, i32* @_rl_caught_signal, align 4
  %cmp73 = icmp eq i32 %30, 26
  br i1 %cmp73, label %if.then75, label %if.end81

if.then75:                                        ; preds = %lor.lhs.false72, %if.else69
  br label %do.body76

do.body76:                                        ; preds = %if.then75
  %31 = load volatile i32, i32* @_rl_caught_signal, align 4
  %tobool77 = icmp ne i32 %31, 0
  br i1 %tobool77, label %if.then78, label %if.end79

if.then78:                                        ; preds = %do.body76
  %32 = load volatile i32, i32* @_rl_caught_signal, align 4
  call void @_rl_signal_handler(i32 %32)
  br label %if.end79

if.end79:                                         ; preds = %if.then78, %do.body76
  br label %do.end80

do.end80:                                         ; preds = %if.end79
  br label %if.end81

if.end81:                                         ; preds = %do.end80, %lor.lhs.false72
  br label %if.end82

if.end82:                                         ; preds = %if.end81, %do.end68
  br label %if.end83

if.end83:                                         ; preds = %if.end82, %do.end59
  br label %if.end84

if.end84:                                         ; preds = %if.end83
  br label %if.end85

if.end85:                                         ; preds = %if.end84
  %33 = load i32 ()*, i32 ()** @rl_signal_event_hook, align 4
  %tobool86 = icmp ne i32 ()* %33, null
  br i1 %tobool86, label %if.then87, label %if.end89

if.then87:                                        ; preds = %if.end85
  %34 = load i32 ()*, i32 ()** @rl_signal_event_hook, align 4
  %call88 = call i32 %34()
  br label %if.end89

if.end89:                                         ; preds = %if.then87, %if.end85
  br label %while.body

return:                                           ; preds = %if.then44, %if.then37, %if.then31, %if.then18, %if.then14
  %35 = load i32, i32* %retval, align 4
  ret i32 %35
}

; Function Attrs: noinline nounwind
define i32 @_rl_any_typein() #0 {
entry:
  %0 = load i32, i32* @push_index, align 4
  %1 = load i32, i32* @pop_index, align 4
  %cmp = icmp ne i32 %0, %1
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

; Function Attrs: noinline nounwind
define i32 @_rl_pushed_input_available() #0 {
entry:
  %0 = load i32, i32* @push_index, align 4
  %1 = load i32, i32* @pop_index, align 4
  %cmp = icmp ne i32 %0, %1
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

; Function Attrs: noinline nounwind
define i32 @_rl_unget_char(i32 %key) #0 {
entry:
  %retval = alloca i32, align 4
  %key.addr = alloca i32, align 4
  store i32 %key, i32* %key.addr, align 4
  %call = call i32 @ibuffer_space()
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %if.then, label %if.end2

if.then:                                          ; preds = %entry
  %0 = load i32, i32* @pop_index, align 4
  %dec = add nsw i32 %0, -1
  store i32 %dec, i32* @pop_index, align 4
  %1 = load i32, i32* @pop_index, align 4
  %cmp = icmp slt i32 %1, 0
  br i1 %cmp, label %if.then1, label %if.end

if.then1:                                         ; preds = %if.then
  %2 = load i32, i32* @ibuffer_len, align 4
  store i32 %2, i32* @pop_index, align 4
  br label %if.end

if.end:                                           ; preds = %if.then1, %if.then
  %3 = load i32, i32* %key.addr, align 4
  %conv = trunc i32 %3 to i8
  %4 = load i32, i32* @pop_index, align 4
  %arrayidx = getelementptr inbounds [512 x i8], [512 x i8]* @ibuffer, i32 0, i32 %4
  store i8 %conv, i8* %arrayidx, align 1
  store i32 1, i32* %retval, align 4
  br label %return

if.end2:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end2, %if.end
  %5 = load i32, i32* %retval, align 4
  ret i32 %5
}

; Function Attrs: noinline nounwind
define internal i32 @ibuffer_space() #0 {
entry:
  %retval = alloca i32, align 4
  %0 = load i32, i32* @pop_index, align 4
  %1 = load i32, i32* @push_index, align 4
  %cmp = icmp sgt i32 %0, %1
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %2 = load i32, i32* @pop_index, align 4
  %3 = load i32, i32* @push_index, align 4
  %sub = sub nsw i32 %2, %3
  %sub1 = sub nsw i32 %sub, 1
  store i32 %sub1, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %entry
  %4 = load i32, i32* @ibuffer_len, align 4
  %5 = load i32, i32* @push_index, align 4
  %6 = load i32, i32* @pop_index, align 4
  %sub2 = sub nsw i32 %5, %6
  %sub3 = sub nsw i32 %4, %sub2
  store i32 %sub3, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.else, %if.then
  %7 = load i32, i32* %retval, align 4
  ret i32 %7
}

; Function Attrs: noinline nounwind
define i32 @rl_set_keyboard_input_timeout(i32 %u) #0 {
entry:
  %u.addr = alloca i32, align 4
  %o = alloca i32, align 4
  store i32 %u, i32* %u.addr, align 4
  %0 = load i32, i32* @_keyboard_input_timeout, align 4
  store i32 %0, i32* %o, align 4
  %1 = load i32, i32* %u.addr, align 4
  %cmp = icmp sge i32 %1, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %u.addr, align 4
  store i32 %2, i32* @_keyboard_input_timeout, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %3 = load i32, i32* %o, align 4
  ret i32 %3
}

; Function Attrs: noinline nounwind
define i32 @_rl_input_available() #0 {
entry:
  %retval = alloca i32, align 4
  %readfds = alloca %struct.fd_set, align 4
  %exceptfds = alloca %struct.fd_set, align 4
  %timeout = alloca %struct.timeval, align 4
  %tty = alloca i32, align 4
  %__i = alloca i32, align 4
  %__b = alloca i32*, align 4
  %__i4 = alloca i32, align 4
  %__b5 = alloca i32*, align 4
  %0 = load i32 ()*, i32 ()** @rl_input_available_hook, align 4
  %tobool = icmp ne i32 ()* %0, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i32 ()*, i32 ()** @rl_input_available_hook, align 4
  %call = call i32 %1()
  store i32 %call, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @rl_instream, align 4
  %call1 = call i32 @fileno(%struct._IO_FILE* %2)
  store i32 %call1, i32* %tty, align 4
  br label %do.body

do.body:                                          ; preds = %if.end
  %fds_bits = getelementptr inbounds %struct.fd_set, %struct.fd_set* %readfds, i32 0, i32 0
  %arraydecay = getelementptr inbounds [32 x i32], [32 x i32]* %fds_bits, i32 0, i32 0
  store i32* %arraydecay, i32** %__b, align 4
  store i32 32, i32* %__i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %do.body
  %3 = load i32, i32* %__i, align 4
  %tobool2 = icmp ne i32 %3, 0
  br i1 %tobool2, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %__b, align 4
  %incdec.ptr = getelementptr inbounds i32, i32* %4, i32 1
  store i32* %incdec.ptr, i32** %__b, align 4
  store i32 0, i32* %4, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %__i, align 4
  %dec = add nsw i32 %5, -1
  store i32 %dec, i32* %__i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  br label %do.end

do.end:                                           ; preds = %for.end
  br label %do.body3

do.body3:                                         ; preds = %do.end
  %fds_bits6 = getelementptr inbounds %struct.fd_set, %struct.fd_set* %exceptfds, i32 0, i32 0
  %arraydecay7 = getelementptr inbounds [32 x i32], [32 x i32]* %fds_bits6, i32 0, i32 0
  store i32* %arraydecay7, i32** %__b5, align 4
  store i32 32, i32* %__i4, align 4
  br label %for.cond8

for.cond8:                                        ; preds = %for.inc12, %do.body3
  %6 = load i32, i32* %__i4, align 4
  %tobool9 = icmp ne i32 %6, 0
  br i1 %tobool9, label %for.body10, label %for.end14

for.body10:                                       ; preds = %for.cond8
  %7 = load i32*, i32** %__b5, align 4
  %incdec.ptr11 = getelementptr inbounds i32, i32* %7, i32 1
  store i32* %incdec.ptr11, i32** %__b5, align 4
  store i32 0, i32* %7, align 4
  br label %for.inc12

for.inc12:                                        ; preds = %for.body10
  %8 = load i32, i32* %__i4, align 4
  %dec13 = add nsw i32 %8, -1
  store i32 %dec13, i32* %__i4, align 4
  br label %for.cond8

for.end14:                                        ; preds = %for.cond8
  br label %do.end15

do.end15:                                         ; preds = %for.end14
  %9 = load i32, i32* %tty, align 4
  %rem = urem i32 %9, 32
  %shl = shl i32 1, %rem
  %fds_bits16 = getelementptr inbounds %struct.fd_set, %struct.fd_set* %readfds, i32 0, i32 0
  %10 = load i32, i32* %tty, align 4
  %div = udiv i32 %10, 32
  %arrayidx = getelementptr inbounds [32 x i32], [32 x i32]* %fds_bits16, i32 0, i32 %div
  %11 = load i32, i32* %arrayidx, align 4
  %or = or i32 %11, %shl
  store i32 %or, i32* %arrayidx, align 4
  %12 = load i32, i32* %tty, align 4
  %rem17 = urem i32 %12, 32
  %shl18 = shl i32 1, %rem17
  %fds_bits19 = getelementptr inbounds %struct.fd_set, %struct.fd_set* %exceptfds, i32 0, i32 0
  %13 = load i32, i32* %tty, align 4
  %div20 = udiv i32 %13, 32
  %arrayidx21 = getelementptr inbounds [32 x i32], [32 x i32]* %fds_bits19, i32 0, i32 %div20
  %14 = load i32, i32* %arrayidx21, align 4
  %or22 = or i32 %14, %shl18
  store i32 %or22, i32* %arrayidx21, align 4
  %tv_sec = getelementptr inbounds %struct.timeval, %struct.timeval* %timeout, i32 0, i32 0
  store i32 0, i32* %tv_sec, align 4
  %15 = load i32, i32* @_keyboard_input_timeout, align 4
  %tv_usec = getelementptr inbounds %struct.timeval, %struct.timeval* %timeout, i32 0, i32 1
  store i32 %15, i32* %tv_usec, align 4
  %16 = load i32, i32* %tty, align 4
  %add = add nsw i32 %16, 1
  %call23 = call i32 @select(i32 %add, %struct.fd_set* %readfds, %struct.fd_set* null, %struct.fd_set* %exceptfds, %struct.timeval* %timeout)
  %cmp = icmp sgt i32 %call23, 0
  %conv = zext i1 %cmp to i32
  store i32 %conv, i32* %retval, align 4
  br label %return

return:                                           ; preds = %do.end15, %if.then
  %17 = load i32, i32* %retval, align 4
  ret i32 %17
}

declare i32 @fileno(%struct._IO_FILE*) #1

declare i32 @select(i32, %struct.fd_set*, %struct.fd_set*, %struct.fd_set*, %struct.timeval*) #1

; Function Attrs: noinline nounwind
define i32 @_rl_input_queued(i32 %t) #0 {
entry:
  %t.addr = alloca i32, align 4
  %old_timeout = alloca i32, align 4
  %r = alloca i32, align 4
  store i32 %t, i32* %t.addr, align 4
  %0 = load i32, i32* %t.addr, align 4
  %call = call i32 @rl_set_keyboard_input_timeout(i32 %0)
  store i32 %call, i32* %old_timeout, align 4
  %call1 = call i32 @_rl_input_available()
  store i32 %call1, i32* %r, align 4
  %1 = load i32, i32* %old_timeout, align 4
  %call2 = call i32 @rl_set_keyboard_input_timeout(i32 %1)
  %2 = load i32, i32* %r, align 4
  ret i32 %2
}

; Function Attrs: noinline nounwind
define void @_rl_insert_typein(i32 %c) #0 {
entry:
  %c.addr = alloca i32, align 4
  %key = alloca i32, align 4
  %t = alloca i32, align 4
  %i = alloca i32, align 4
  %string = alloca i8*, align 4
  store i32 %c, i32* %c.addr, align 4
  store i32 0, i32* %key, align 4
  store i32 0, i32* %i, align 4
  %0 = load i32, i32* @ibuffer_len, align 4
  %add = add nsw i32 %0, 1
  %call = call i8* @xmalloc(i32 %add)
  store i8* %call, i8** %string, align 4
  %1 = load i32, i32* %c.addr, align 4
  %conv = trunc i32 %1 to i8
  %2 = load i8*, i8** %string, align 4
  %3 = load i32, i32* %i, align 4
  %inc = add nsw i32 %3, 1
  store i32 %inc, i32* %i, align 4
  %arrayidx = getelementptr inbounds i8, i8* %2, i32 %3
  store i8 %conv, i8* %arrayidx, align 1
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %call1 = call i32 @rl_get_char(i32* %key)
  store i32 %call1, i32* %t, align 4
  %tobool = icmp ne i32 %call1, 0
  br i1 %tobool, label %land.lhs.true, label %land.end

land.lhs.true:                                    ; preds = %while.cond
  %4 = load %struct._keymap_entry*, %struct._keymap_entry** @_rl_keymap, align 4
  %5 = load i32, i32* %key, align 4
  %arrayidx2 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %4, i32 %5
  %type = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx2, i32 0, i32 0
  %6 = load i8, i8* %type, align 4
  %conv3 = sext i8 %6 to i32
  %cmp = icmp eq i32 %conv3, 0
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %land.lhs.true
  %7 = load %struct._keymap_entry*, %struct._keymap_entry** @_rl_keymap, align 4
  %8 = load i32, i32* %key, align 4
  %arrayidx5 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %7, i32 %8
  %function = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx5, i32 0, i32 1
  %9 = load i32 (i32, i32)*, i32 (i32, i32)** %function, align 4
  %cmp6 = icmp eq i32 (i32, i32)* %9, @rl_insert
  br label %land.end

land.end:                                         ; preds = %land.rhs, %land.lhs.true, %while.cond
  %10 = phi i1 [ false, %land.lhs.true ], [ false, %while.cond ], [ %cmp6, %land.rhs ]
  br i1 %10, label %while.body, label %while.end

while.body:                                       ; preds = %land.end
  %11 = load i32, i32* %key, align 4
  %conv8 = trunc i32 %11 to i8
  %12 = load i8*, i8** %string, align 4
  %13 = load i32, i32* %i, align 4
  %inc9 = add nsw i32 %13, 1
  store i32 %inc9, i32* %i, align 4
  %arrayidx10 = getelementptr inbounds i8, i8* %12, i32 %13
  store i8 %conv8, i8* %arrayidx10, align 1
  br label %while.cond

while.end:                                        ; preds = %land.end
  %14 = load i32, i32* %t, align 4
  %tobool11 = icmp ne i32 %14, 0
  br i1 %tobool11, label %if.then, label %if.end

if.then:                                          ; preds = %while.end
  %15 = load i32, i32* %key, align 4
  %call12 = call i32 @_rl_unget_char(i32 %15)
  br label %if.end

if.end:                                           ; preds = %if.then, %while.end
  %16 = load i8*, i8** %string, align 4
  %17 = load i32, i32* %i, align 4
  %arrayidx13 = getelementptr inbounds i8, i8* %16, i32 %17
  store i8 0, i8* %arrayidx13, align 1
  %18 = load i8*, i8** %string, align 4
  %call14 = call i32 @rl_insert_text(i8* %18)
  %19 = load i8*, i8** %string, align 4
  call void @xfree(i8* %19)
  ret void
}

declare i8* @xmalloc(i32) #1

; Function Attrs: noinline nounwind
define internal i32 @rl_get_char(i32* %key) #0 {
entry:
  %retval = alloca i32, align 4
  %key.addr = alloca i32*, align 4
  store i32* %key, i32** %key.addr, align 4
  %0 = load i32, i32* @push_index, align 4
  %1 = load i32, i32* @pop_index, align 4
  %cmp = icmp eq i32 %0, %1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %2 = load i32, i32* @pop_index, align 4
  %inc = add nsw i32 %2, 1
  store i32 %inc, i32* @pop_index, align 4
  %arrayidx = getelementptr inbounds [512 x i8], [512 x i8]* @ibuffer, i32 0, i32 %2
  %3 = load i8, i8* %arrayidx, align 1
  %conv = zext i8 %3 to i32
  %4 = load i32*, i32** %key.addr, align 4
  store i32 %conv, i32* %4, align 4
  %5 = load i32, i32* @pop_index, align 4
  %6 = load i32, i32* @ibuffer_len, align 4
  %cmp1 = icmp sgt i32 %5, %6
  br i1 %cmp1, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  store i32 0, i32* @pop_index, align 4
  br label %if.end4

if.end4:                                          ; preds = %if.then3, %if.end
  store i32 1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end4, %if.then
  %7 = load i32, i32* %retval, align 4
  ret i32 %7
}

declare i32 @rl_insert(i32, i32) #1

declare i32 @rl_insert_text(i8*) #1

declare void @xfree(i8*) #1

; Function Attrs: noinline nounwind
define i32 @rl_stuff_char(i32 %key) #0 {
entry:
  %retval = alloca i32, align 4
  %key.addr = alloca i32, align 4
  store i32 %key, i32* %key.addr, align 4
  %call = call i32 @ibuffer_space()
  %cmp = icmp eq i32 %call, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %0 = load i32, i32* %key.addr, align 4
  %cmp1 = icmp eq i32 %0, -1
  br i1 %cmp1, label %if.then2, label %if.end3

if.then2:                                         ; preds = %if.end
  store i32 10, i32* %key.addr, align 4
  store i32 -1, i32* @rl_pending_input, align 4
  %1 = load i32, i32* @rl_readline_state, align 4
  %or = or i32 %1, 131072
  store i32 %or, i32* @rl_readline_state, align 4
  br label %if.end3

if.end3:                                          ; preds = %if.then2, %if.end
  %2 = load i32, i32* %key.addr, align 4
  %conv = trunc i32 %2 to i8
  %3 = load i32, i32* @push_index, align 4
  %inc = add nsw i32 %3, 1
  store i32 %inc, i32* @push_index, align 4
  %arrayidx = getelementptr inbounds [512 x i8], [512 x i8]* @ibuffer, i32 0, i32 %3
  store i8 %conv, i8* %arrayidx, align 1
  %4 = load i32, i32* @push_index, align 4
  %5 = load i32, i32* @ibuffer_len, align 4
  %cmp4 = icmp sgt i32 %4, %5
  br i1 %cmp4, label %if.then6, label %if.end7

if.then6:                                         ; preds = %if.end3
  store i32 0, i32* @push_index, align 4
  br label %if.end7

if.end7:                                          ; preds = %if.then6, %if.end3
  store i32 1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end7, %if.then
  %6 = load i32, i32* %retval, align 4
  ret i32 %6
}

; Function Attrs: noinline nounwind
define i32 @rl_execute_next(i32 %c) #0 {
entry:
  %c.addr = alloca i32, align 4
  store i32 %c, i32* %c.addr, align 4
  %0 = load i32, i32* %c.addr, align 4
  store i32 %0, i32* @rl_pending_input, align 4
  %1 = load i32, i32* @rl_readline_state, align 4
  %or = or i32 %1, 131072
  store i32 %or, i32* @rl_readline_state, align 4
  ret i32 0
}

; Function Attrs: noinline nounwind
define i32 @rl_clear_pending_input() #0 {
entry:
  store i32 0, i32* @rl_pending_input, align 4
  %0 = load i32, i32* @rl_readline_state, align 4
  %and = and i32 %0, -131073
  store i32 %and, i32* @rl_readline_state, align 4
  ret i32 0
}

; Function Attrs: noinline nounwind
define i32 @rl_read_key() #0 {
entry:
  %retval = alloca i32, align 4
  %c = alloca i32, align 4
  %r = alloca i32, align 4
  %0 = load i32, i32* @rl_pending_input, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %1 = load i32, i32* @rl_pending_input, align 4
  store i32 %1, i32* %c, align 4
  %call = call i32 @rl_clear_pending_input()
  br label %if.end41

if.else:                                          ; preds = %entry
  %call1 = call i32 @_rl_next_macro_key()
  store i32 %call1, i32* %c, align 4
  %tobool2 = icmp ne i32 %call1, 0
  br i1 %tobool2, label %if.then3, label %if.end

if.then3:                                         ; preds = %if.else
  %2 = load i32, i32* %c, align 4
  store i32 %2, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %if.else
  %3 = load i32 ()*, i32 ()** @rl_event_hook, align 4
  %tobool4 = icmp ne i32 ()* %3, null
  br i1 %tobool4, label %if.then5, label %if.else29

if.then5:                                         ; preds = %if.end
  br label %while.cond

while.cond:                                       ; preds = %if.end27, %if.then19, %if.then5
  %4 = load i32 ()*, i32 ()** @rl_event_hook, align 4
  %tobool6 = icmp ne i32 ()* %4, null
  br i1 %tobool6, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %call7 = call i32 @rl_get_char(i32* %c)
  %cmp = icmp ne i32 %call7, 0
  br i1 %cmp, label %if.then8, label %if.end9

if.then8:                                         ; preds = %while.body
  br label %while.end

if.end9:                                          ; preds = %while.body
  %call10 = call i32 @rl_gather_tyi()
  store i32 %call10, i32* %r, align 4
  %cmp11 = icmp slt i32 %call10, 0
  br i1 %cmp11, label %if.then12, label %if.else17

if.then12:                                        ; preds = %if.end9
  store i32 1, i32* @rl_done, align 4
  %call13 = call i32* @__errno_location()
  %5 = load i32, i32* %call13, align 4
  %cmp14 = icmp eq i32 %5, 5
  br i1 %cmp14, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then12
  %6 = load i32, i32* @rl_readline_state, align 4
  %and = and i32 %6, 8
  %tobool15 = icmp ne i32 %and, 0
  %cond = select i1 %tobool15, i32 -2, i32 -1
  br label %cond.end

cond.false:                                       ; preds = %if.then12
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond16 = phi i32 [ %cond, %cond.true ], [ 10, %cond.false ]
  store i32 %cond16, i32* %retval, align 4
  br label %return

if.else17:                                        ; preds = %if.end9
  %7 = load i32, i32* %r, align 4
  %cmp18 = icmp sgt i32 %7, 0
  br i1 %cmp18, label %if.then19, label %if.end20

if.then19:                                        ; preds = %if.else17
  br label %while.cond

if.end20:                                         ; preds = %if.else17
  br label %if.end21

if.end21:                                         ; preds = %if.end20
  br label %do.body

do.body:                                          ; preds = %if.end21
  %8 = load volatile i32, i32* @_rl_caught_signal, align 4
  %tobool22 = icmp ne i32 %8, 0
  br i1 %tobool22, label %if.then23, label %if.end24

if.then23:                                        ; preds = %do.body
  %9 = load volatile i32, i32* @_rl_caught_signal, align 4
  call void @_rl_signal_handler(i32 %9)
  br label %if.end24

if.end24:                                         ; preds = %if.then23, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end24
  %10 = load i32, i32* @rl_done, align 4
  %tobool25 = icmp ne i32 %10, 0
  br i1 %tobool25, label %if.then26, label %if.end27

if.then26:                                        ; preds = %do.end
  store i32 10, i32* %retval, align 4
  br label %return

if.end27:                                         ; preds = %do.end
  %11 = load i32 ()*, i32 ()** @rl_event_hook, align 4
  %call28 = call i32 %11()
  br label %while.cond

while.end:                                        ; preds = %if.then8, %while.cond
  br label %if.end40

if.else29:                                        ; preds = %if.end
  %call30 = call i32 @rl_get_char(i32* %c)
  %cmp31 = icmp eq i32 %call30, 0
  br i1 %cmp31, label %if.then32, label %if.end34

if.then32:                                        ; preds = %if.else29
  %12 = load i32 (%struct._IO_FILE*)*, i32 (%struct._IO_FILE*)** @rl_getc_function, align 4
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @rl_instream, align 4
  %call33 = call i32 %12(%struct._IO_FILE* %13)
  store i32 %call33, i32* %c, align 4
  br label %if.end34

if.end34:                                         ; preds = %if.then32, %if.else29
  br label %do.body35

do.body35:                                        ; preds = %if.end34
  %14 = load volatile i32, i32* @_rl_caught_signal, align 4
  %tobool36 = icmp ne i32 %14, 0
  br i1 %tobool36, label %if.then37, label %if.end38

if.then37:                                        ; preds = %do.body35
  %15 = load volatile i32, i32* @_rl_caught_signal, align 4
  call void @_rl_signal_handler(i32 %15)
  br label %if.end38

if.end38:                                         ; preds = %if.then37, %do.body35
  br label %do.end39

do.end39:                                         ; preds = %if.end38
  br label %if.end40

if.end40:                                         ; preds = %do.end39, %while.end
  br label %if.end41

if.end41:                                         ; preds = %if.end40, %if.then
  %16 = load i32, i32* %c, align 4
  store i32 %16, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end41, %if.then26, %cond.end, %if.then3
  %17 = load i32, i32* %retval, align 4
  ret i32 %17
}

declare i32 @_rl_next_macro_key() #1

; Function Attrs: noinline nounwind
define internal i32 @rl_gather_tyi() #0 {
entry:
  %retval = alloca i32, align 4
  %tty = alloca i32, align 4
  %tem = alloca i32, align 4
  %result = alloca i32, align 4
  %chars_avail = alloca i32, align 4
  %k = alloca i32, align 4
  %input = alloca i8, align 1
  %readfds = alloca %struct.fd_set, align 4
  %exceptfds = alloca %struct.fd_set, align 4
  %timeout = alloca %struct.timeval, align 4
  %__i = alloca i32, align 4
  %__b = alloca i32*, align 4
  %__i2 = alloca i32, align 4
  %__b3 = alloca i32*, align 4
  store i32 0, i32* %chars_avail, align 4
  store i8 0, i8* %input, align 1
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @rl_instream, align 4
  %call = call i32 @fileno(%struct._IO_FILE* %0)
  store i32 %call, i32* %tty, align 4
  br label %do.body

do.body:                                          ; preds = %entry
  %fds_bits = getelementptr inbounds %struct.fd_set, %struct.fd_set* %readfds, i32 0, i32 0
  %arraydecay = getelementptr inbounds [32 x i32], [32 x i32]* %fds_bits, i32 0, i32 0
  store i32* %arraydecay, i32** %__b, align 4
  store i32 32, i32* %__i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %do.body
  %1 = load i32, i32* %__i, align 4
  %tobool = icmp ne i32 %1, 0
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i32*, i32** %__b, align 4
  %incdec.ptr = getelementptr inbounds i32, i32* %2, i32 1
  store i32* %incdec.ptr, i32** %__b, align 4
  store i32 0, i32* %2, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %3 = load i32, i32* %__i, align 4
  %dec = add nsw i32 %3, -1
  store i32 %dec, i32* %__i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  br label %do.end

do.end:                                           ; preds = %for.end
  br label %do.body1

do.body1:                                         ; preds = %do.end
  %fds_bits4 = getelementptr inbounds %struct.fd_set, %struct.fd_set* %exceptfds, i32 0, i32 0
  %arraydecay5 = getelementptr inbounds [32 x i32], [32 x i32]* %fds_bits4, i32 0, i32 0
  store i32* %arraydecay5, i32** %__b3, align 4
  store i32 32, i32* %__i2, align 4
  br label %for.cond6

for.cond6:                                        ; preds = %for.inc10, %do.body1
  %4 = load i32, i32* %__i2, align 4
  %tobool7 = icmp ne i32 %4, 0
  br i1 %tobool7, label %for.body8, label %for.end12

for.body8:                                        ; preds = %for.cond6
  %5 = load i32*, i32** %__b3, align 4
  %incdec.ptr9 = getelementptr inbounds i32, i32* %5, i32 1
  store i32* %incdec.ptr9, i32** %__b3, align 4
  store i32 0, i32* %5, align 4
  br label %for.inc10

for.inc10:                                        ; preds = %for.body8
  %6 = load i32, i32* %__i2, align 4
  %dec11 = add nsw i32 %6, -1
  store i32 %dec11, i32* %__i2, align 4
  br label %for.cond6

for.end12:                                        ; preds = %for.cond6
  br label %do.end13

do.end13:                                         ; preds = %for.end12
  %7 = load i32, i32* %tty, align 4
  %rem = urem i32 %7, 32
  %shl = shl i32 1, %rem
  %fds_bits14 = getelementptr inbounds %struct.fd_set, %struct.fd_set* %readfds, i32 0, i32 0
  %8 = load i32, i32* %tty, align 4
  %div = udiv i32 %8, 32
  %arrayidx = getelementptr inbounds [32 x i32], [32 x i32]* %fds_bits14, i32 0, i32 %div
  %9 = load i32, i32* %arrayidx, align 4
  %or = or i32 %9, %shl
  store i32 %or, i32* %arrayidx, align 4
  %10 = load i32, i32* %tty, align 4
  %rem15 = urem i32 %10, 32
  %shl16 = shl i32 1, %rem15
  %fds_bits17 = getelementptr inbounds %struct.fd_set, %struct.fd_set* %exceptfds, i32 0, i32 0
  %11 = load i32, i32* %tty, align 4
  %div18 = udiv i32 %11, 32
  %arrayidx19 = getelementptr inbounds [32 x i32], [32 x i32]* %fds_bits17, i32 0, i32 %div18
  %12 = load i32, i32* %arrayidx19, align 4
  %or20 = or i32 %12, %shl16
  store i32 %or20, i32* %arrayidx19, align 4
  br label %do.body21

do.body21:                                        ; preds = %do.end13
  %13 = load i32, i32* @_keyboard_input_timeout, align 4
  %div22 = sdiv i32 %13, 1000000
  %tv_sec = getelementptr inbounds %struct.timeval, %struct.timeval* %timeout, i32 0, i32 0
  store i32 %div22, i32* %tv_sec, align 4
  %14 = load i32, i32* @_keyboard_input_timeout, align 4
  %rem23 = srem i32 %14, 1000000
  %tv_usec = getelementptr inbounds %struct.timeval, %struct.timeval* %timeout, i32 0, i32 1
  store i32 %rem23, i32* %tv_usec, align 4
  br label %do.end24

do.end24:                                         ; preds = %do.body21
  %15 = load i32, i32* %tty, align 4
  %add = add nsw i32 %15, 1
  %call25 = call i32 @select(i32 %add, %struct.fd_set* %readfds, %struct.fd_set* null, %struct.fd_set* %exceptfds, %struct.timeval* %timeout)
  store i32 %call25, i32* %result, align 4
  %16 = load i32, i32* %result, align 4
  %cmp = icmp sle i32 %16, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %do.end24
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %do.end24
  store i32 -1, i32* %result, align 4
  %call26 = call i32* @__errno_location()
  store i32 0, i32* %call26, align 4
  %17 = load i32, i32* %tty, align 4
  %call27 = call i32 (i32, i32, ...) @ioctl(i32 %17, i32 21531, i32* %chars_avail)
  store i32 %call27, i32* %result, align 4
  %18 = load i32, i32* %result, align 4
  %cmp28 = icmp eq i32 %18, -1
  br i1 %cmp28, label %land.lhs.true, label %if.end32

land.lhs.true:                                    ; preds = %if.end
  %call29 = call i32* @__errno_location()
  %19 = load i32, i32* %call29, align 4
  %cmp30 = icmp eq i32 %19, 5
  br i1 %cmp30, label %if.then31, label %if.end32

if.then31:                                        ; preds = %land.lhs.true
  store i32 -1, i32* %retval, align 4
  br label %return

if.end32:                                         ; preds = %land.lhs.true, %if.end
  %20 = load i32, i32* %result, align 4
  %cmp33 = icmp eq i32 %20, -1
  br i1 %cmp33, label %if.then34, label %if.end35

if.then34:                                        ; preds = %if.end32
  store i32 0, i32* %chars_avail, align 4
  br label %if.end35

if.end35:                                         ; preds = %if.then34, %if.end32
  %21 = load i32, i32* %result, align 4
  %cmp36 = icmp eq i32 %21, -1
  br i1 %cmp36, label %if.then37, label %if.end59

if.then37:                                        ; preds = %if.end35
  %22 = load i32, i32* %tty, align 4
  %call38 = call i32 (i32, i32, ...) @fcntl(i32 %22, i32 3, i32 0)
  store i32 %call38, i32* %tem, align 4
  %23 = load i32, i32* %tty, align 4
  %24 = load i32, i32* %tem, align 4
  %or39 = or i32 %24, 2048
  %call40 = call i32 (i32, i32, ...) @fcntl(i32 %23, i32 4, i32 %or39)
  %25 = load i32, i32* %tty, align 4
  %call41 = call i32 @read(i32 %25, i8* %input, i32 1)
  store i32 %call41, i32* %chars_avail, align 4
  %26 = load i32, i32* %tty, align 4
  %27 = load i32, i32* %tem, align 4
  %call42 = call i32 (i32, i32, ...) @fcntl(i32 %26, i32 4, i32 %27)
  %28 = load i32, i32* %chars_avail, align 4
  %cmp43 = icmp eq i32 %28, -1
  br i1 %cmp43, label %land.lhs.true44, label %if.end48

land.lhs.true44:                                  ; preds = %if.then37
  %call45 = call i32* @__errno_location()
  %29 = load i32, i32* %call45, align 4
  %cmp46 = icmp eq i32 %29, 11
  br i1 %cmp46, label %if.then47, label %if.end48

if.then47:                                        ; preds = %land.lhs.true44
  store i32 0, i32* %retval, align 4
  br label %return

if.end48:                                         ; preds = %land.lhs.true44, %if.then37
  %30 = load i32, i32* %chars_avail, align 4
  %cmp49 = icmp eq i32 %30, -1
  br i1 %cmp49, label %land.lhs.true50, label %if.end54

land.lhs.true50:                                  ; preds = %if.end48
  %call51 = call i32* @__errno_location()
  %31 = load i32, i32* %call51, align 4
  %cmp52 = icmp eq i32 %31, 5
  br i1 %cmp52, label %if.then53, label %if.end54

if.then53:                                        ; preds = %land.lhs.true50
  store i32 -1, i32* %retval, align 4
  br label %return

if.end54:                                         ; preds = %land.lhs.true50, %if.end48
  %32 = load i32, i32* %chars_avail, align 4
  %cmp55 = icmp eq i32 %32, 0
  br i1 %cmp55, label %if.then56, label %if.end58

if.then56:                                        ; preds = %if.end54
  %call57 = call i32 @rl_stuff_char(i32 -1)
  store i32 0, i32* %retval, align 4
  br label %return

if.end58:                                         ; preds = %if.end54
  br label %if.end59

if.end59:                                         ; preds = %if.end58, %if.end35
  %33 = load i32, i32* %chars_avail, align 4
  %cmp60 = icmp sle i32 %33, 0
  br i1 %cmp60, label %if.then61, label %if.end62

if.then61:                                        ; preds = %if.end59
  store i32 0, i32* %retval, align 4
  br label %return

if.end62:                                         ; preds = %if.end59
  %call63 = call i32 @ibuffer_space()
  store i32 %call63, i32* %tem, align 4
  %34 = load i32, i32* %chars_avail, align 4
  %35 = load i32, i32* %tem, align 4
  %cmp64 = icmp sgt i32 %34, %35
  br i1 %cmp64, label %if.then65, label %if.end66

if.then65:                                        ; preds = %if.end62
  %36 = load i32, i32* %tem, align 4
  store i32 %36, i32* %chars_avail, align 4
  br label %if.end66

if.end66:                                         ; preds = %if.then65, %if.end62
  %37 = load i32, i32* %tem, align 4
  %38 = load i32, i32* @ibuffer_len, align 4
  %cmp67 = icmp slt i32 %37, %38
  br i1 %cmp67, label %if.then68, label %if.end69

if.then68:                                        ; preds = %if.end66
  store i32 0, i32* %chars_avail, align 4
  br label %if.end69

if.end69:                                         ; preds = %if.then68, %if.end66
  %39 = load i32, i32* %result, align 4
  %cmp70 = icmp ne i32 %39, -1
  br i1 %cmp70, label %if.then71, label %if.else

if.then71:                                        ; preds = %if.end69
  br label %while.cond

while.cond:                                       ; preds = %if.end87, %if.then71
  %40 = load i32, i32* %chars_avail, align 4
  %dec72 = add nsw i32 %40, -1
  store i32 %dec72, i32* %chars_avail, align 4
  %tobool73 = icmp ne i32 %40, 0
  br i1 %tobool73, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  br label %do.body74

do.body74:                                        ; preds = %while.body
  %41 = load volatile i32, i32* @_rl_caught_signal, align 4
  %tobool75 = icmp ne i32 %41, 0
  br i1 %tobool75, label %if.then76, label %if.end77

if.then76:                                        ; preds = %do.body74
  %42 = load volatile i32, i32* @_rl_caught_signal, align 4
  call void @_rl_signal_handler(i32 %42)
  br label %if.end77

if.end77:                                         ; preds = %if.then76, %do.body74
  br label %do.end78

do.end78:                                         ; preds = %if.end77
  %43 = load i32 (%struct._IO_FILE*)*, i32 (%struct._IO_FILE*)** @rl_getc_function, align 4
  %44 = load %struct._IO_FILE*, %struct._IO_FILE** @rl_instream, align 4
  %call79 = call i32 %43(%struct._IO_FILE* %44)
  store i32 %call79, i32* %k, align 4
  %45 = load i32, i32* %k, align 4
  %call80 = call i32 @rl_stuff_char(i32 %45)
  %cmp81 = icmp eq i32 %call80, 0
  br i1 %cmp81, label %if.then82, label %if.end83

if.then82:                                        ; preds = %do.end78
  br label %while.end

if.end83:                                         ; preds = %do.end78
  %46 = load i32, i32* %k, align 4
  %cmp84 = icmp eq i32 %46, 10
  br i1 %cmp84, label %if.then86, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end83
  %47 = load i32, i32* %k, align 4
  %cmp85 = icmp eq i32 %47, 13
  br i1 %cmp85, label %if.then86, label %if.end87

if.then86:                                        ; preds = %lor.lhs.false, %if.end83
  br label %while.end

if.end87:                                         ; preds = %lor.lhs.false
  br label %while.cond

while.end:                                        ; preds = %if.then86, %if.then82, %while.cond
  br label %if.end92

if.else:                                          ; preds = %if.end69
  %48 = load i32, i32* %chars_avail, align 4
  %tobool88 = icmp ne i32 %48, 0
  br i1 %tobool88, label %if.then89, label %if.end91

if.then89:                                        ; preds = %if.else
  %49 = load i8, i8* %input, align 1
  %conv = sext i8 %49 to i32
  %call90 = call i32 @rl_stuff_char(i32 %conv)
  br label %if.end91

if.end91:                                         ; preds = %if.then89, %if.else
  br label %if.end92

if.end92:                                         ; preds = %if.end91, %while.end
  store i32 1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end92, %if.then61, %if.then56, %if.then53, %if.then47, %if.then31, %if.then
  %50 = load i32, i32* %retval, align 4
  ret i32 %50
}

declare i32* @__errno_location() #1

declare void @_rl_signal_handler(i32) #1

declare i32 @sigemptyset(%struct.__sigset_t*) #1

declare i32 @pselect(i32, %struct.fd_set*, %struct.fd_set*, %struct.fd_set*, %struct.timespec*, %struct.__sigset_t*) #1

declare i32 @read(i32, i8*, i32) #1

declare i32 @sh_unset_nodelay_mode(i32) #1

; Function Attrs: noinline nounwind
define i32 @_rl_read_mbchar(i8* %mbchar, i32 %size) #0 {
entry:
  %mbchar.addr = alloca i8*, align 4
  %size.addr = alloca i32, align 4
  %mb_len = alloca i32, align 4
  %c = alloca i32, align 4
  %mbchar_bytes_length = alloca i32, align 4
  %wc = alloca i32, align 4
  %ps = alloca %struct.__mbstate_t, align 4
  %ps_back = alloca %struct.__mbstate_t, align 4
  store i8* %mbchar, i8** %mbchar.addr, align 4
  store i32 %size, i32* %size.addr, align 4
  %0 = bitcast %struct.__mbstate_t* %ps to i8*
  call void @llvm.memset.p0i8.i32(i8* %0, i8 0, i32 8, i32 4, i1 false)
  %1 = bitcast %struct.__mbstate_t* %ps_back to i8*
  call void @llvm.memset.p0i8.i32(i8* %1, i8 0, i32 8, i32 4, i1 false)
  store i32 0, i32* %mb_len, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end21, %if.then8, %entry
  %2 = load i32, i32* %mb_len, align 4
  %3 = load i32, i32* %size.addr, align 4
  %cmp = icmp slt i32 %2, %3
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %4 = load i32, i32* @rl_readline_state, align 4
  %or = or i32 %4, 64
  store i32 %or, i32* @rl_readline_state, align 4
  %call = call i32 @rl_read_key()
  store i32 %call, i32* %c, align 4
  %5 = load i32, i32* @rl_readline_state, align 4
  %and = and i32 %5, -65
  store i32 %and, i32* @rl_readline_state, align 4
  %6 = load i32, i32* %c, align 4
  %cmp1 = icmp slt i32 %6, 0
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %while.body
  br label %while.end

if.end:                                           ; preds = %while.body
  %7 = load i32, i32* %c, align 4
  %conv = trunc i32 %7 to i8
  %8 = load i8*, i8** %mbchar.addr, align 4
  %9 = load i32, i32* %mb_len, align 4
  %inc = add nsw i32 %9, 1
  store i32 %inc, i32* %mb_len, align 4
  %arrayidx = getelementptr inbounds i8, i8* %8, i32 %9
  store i8 %conv, i8* %arrayidx, align 1
  %10 = load i8*, i8** %mbchar.addr, align 4
  %11 = load i32, i32* %mb_len, align 4
  %call2 = call i32 @mbrtowc(i32* %wc, i8* %10, i32 %11, %struct.__mbstate_t* %ps)
  store i32 %call2, i32* %mbchar_bytes_length, align 4
  %12 = load i32, i32* %mbchar_bytes_length, align 4
  %cmp3 = icmp eq i32 %12, -1
  br i1 %cmp3, label %if.then5, label %if.else

if.then5:                                         ; preds = %if.end
  br label %while.end

if.else:                                          ; preds = %if.end
  %13 = load i32, i32* %mbchar_bytes_length, align 4
  %cmp6 = icmp eq i32 %13, -2
  br i1 %cmp6, label %if.then8, label %if.else9

if.then8:                                         ; preds = %if.else
  %14 = bitcast %struct.__mbstate_t* %ps to i8*
  %15 = bitcast %struct.__mbstate_t* %ps_back to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %14, i8* %15, i32 8, i32 4, i1 false)
  br label %while.cond

if.else9:                                         ; preds = %if.else
  %16 = load i32, i32* %mbchar_bytes_length, align 4
  %cmp10 = icmp eq i32 %16, 0
  br i1 %cmp10, label %if.then12, label %if.else14

if.then12:                                        ; preds = %if.else9
  %17 = load i8*, i8** %mbchar.addr, align 4
  %arrayidx13 = getelementptr inbounds i8, i8* %17, i32 0
  store i8 0, i8* %arrayidx13, align 1
  store i32 1, i32* %mb_len, align 4
  br label %while.end

if.else14:                                        ; preds = %if.else9
  %18 = load i32, i32* %mbchar_bytes_length, align 4
  %cmp15 = icmp ugt i32 %18, 0
  br i1 %cmp15, label %if.then17, label %if.end18

if.then17:                                        ; preds = %if.else14
  br label %while.end

if.end18:                                         ; preds = %if.else14
  br label %if.end19

if.end19:                                         ; preds = %if.end18
  br label %if.end20

if.end20:                                         ; preds = %if.end19
  br label %if.end21

if.end21:                                         ; preds = %if.end20
  br label %while.cond

while.end:                                        ; preds = %if.then17, %if.then12, %if.then5, %if.then, %while.cond
  %19 = load i32, i32* %mb_len, align 4
  ret i32 %19
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #2

declare i32 @mbrtowc(i32*, i8*, i32, %struct.__mbstate_t*) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* nocapture writeonly, i8* nocapture readonly, i32, i32, i1) #2

; Function Attrs: noinline nounwind
define i32 @_rl_read_mbstring(i32 %first, i8* %mb, i32 %mlen) #0 {
entry:
  %first.addr = alloca i32, align 4
  %mb.addr = alloca i8*, align 4
  %mlen.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %c = alloca i32, align 4
  %ps = alloca %struct.__mbstate_t, align 4
  store i32 %first, i32* %first.addr, align 4
  store i8* %mb, i8** %mb.addr, align 4
  store i32 %mlen, i32* %mlen.addr, align 4
  %0 = load i32, i32* %first.addr, align 4
  store i32 %0, i32* %c, align 4
  %1 = load i8*, i8** %mb.addr, align 4
  %2 = load i32, i32* %mlen.addr, align 4
  call void @llvm.memset.p0i8.i32(i8* %1, i8 0, i32 %2, i32 1, i1 false)
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i32, i32* %c, align 4
  %cmp = icmp sge i32 %3, 0
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4
  %5 = load i32, i32* %mlen.addr, align 4
  %cmp1 = icmp slt i32 %4, %5
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %6 = phi i1 [ false, %for.cond ], [ %cmp1, %land.rhs ]
  br i1 %6, label %for.body, label %for.end

for.body:                                         ; preds = %land.end
  %7 = load i32, i32* %c, align 4
  %conv = trunc i32 %7 to i8
  %8 = load i8*, i8** %mb.addr, align 4
  %9 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds i8, i8* %8, i32 %9
  store i8 %conv, i8* %arrayidx, align 1
  %10 = bitcast %struct.__mbstate_t* %ps to i8*
  call void @llvm.memset.p0i8.i32(i8* %10, i8 0, i32 8, i32 4, i1 false)
  %11 = load i8*, i8** %mb.addr, align 4
  %call = call i32 @_rl_get_char_len(i8* %11, %struct.__mbstate_t* %ps)
  %cmp2 = icmp eq i32 %call, -2
  br i1 %cmp2, label %if.then, label %if.else

if.then:                                          ; preds = %for.body
  %12 = load i32, i32* @rl_readline_state, align 4
  %or = or i32 %12, 64
  store i32 %or, i32* @rl_readline_state, align 4
  %call4 = call i32 @rl_read_key()
  store i32 %call4, i32* %c, align 4
  %13 = load i32, i32* @rl_readline_state, align 4
  %and = and i32 %13, -65
  store i32 %and, i32* @rl_readline_state, align 4
  br label %if.end

if.else:                                          ; preds = %for.body
  br label %for.end

if.end:                                           ; preds = %if.then
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %14 = load i32, i32* %i, align 4
  %inc = add nsw i32 %14, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %if.else, %land.end
  %15 = load i32, i32* %c, align 4
  ret i32 %15
}

declare i32 @_rl_get_char_len(i8*, %struct.__mbstate_t*) #1

declare i32 @ioctl(i32, i32, ...) #1

declare i32 @fcntl(i32, i32, ...) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
