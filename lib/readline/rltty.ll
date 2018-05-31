; ModuleID = 'rltty.c'
source_filename = "rltty.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct._IO_FILE = type opaque
%struct.termios = type { i32, i32, i32, i32, i8, [32 x i8], i32, i32 }
%struct._keymap_entry = type { i8, i32 (i32, i32)* }
%struct._rl_tty_chars = type { i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8 }
%struct.winsize = type { i16, i16, i16, i16 }

@rl_prep_term_function = global void (i32)* @rl_prep_terminal, align 4
@rl_deprep_term_function = global void ()* @rl_deprep_terminal, align 4
@terminal_prepped = internal global i32 0, align 4
@rl_instream = external global %struct._IO_FILE*, align 4
@stdin = external constant %struct._IO_FILE*, align 4
@_rl_echoing_p = external global i32, align 4
@otio = internal global %struct.termios zeroinitializer, align 4
@_rl_bind_stty_chars = external global i32, align 4
@rl_editing_mode = external global i32, align 4
@vi_insertion_keymap = external global [257 x %struct._keymap_entry], align 4
@_rl_keymap = external global %struct._keymap_entry*, align 4
@rl_readline_state = external global i32, align 4
@_rl_enable_keypad = external global i32, align 4
@_rl_enable_bracketed_paste = external global i32, align 4
@rl_outstream = external global %struct._IO_FILE*, align 4
@.str = private unnamed_addr constant [9 x i8] c"\1B[?2004h\00", align 1
@.str.1 = private unnamed_addr constant [9 x i8] c"\1B[?2004l\00", align 1
@_rl_tty_chars = internal global %struct._rl_tty_chars zeroinitializer, align 1
@tty_sigs_disabled = internal global i32 0, align 4
@sigstty = internal global %struct.termios zeroinitializer, align 4
@nosigstty = internal global %struct.termios zeroinitializer, align 4
@_rl_last_tty_chars = internal global %struct._rl_tty_chars zeroinitializer, align 1
@_rl_intr_char = external global i32, align 4
@_rl_quit_char = external global i32, align 4
@_rl_susp_char = external global i32, align 4
@_rl_echoctl = external global i32, align 4
@_rl_eof_char = external global i32, align 4
@.str.2 = private unnamed_addr constant [37 x i8] c"warning: turning off output flushing\00", align 1

; Function Attrs: noinline nounwind
define void @rl_prep_terminal(i32 %meta_flag) #0 {
entry:
  %meta_flag.addr = alloca i32, align 4
  %tty = alloca i32, align 4
  %nprep = alloca i32, align 4
  %tio = alloca %struct.termios, align 4
  store i32 %meta_flag, i32* %meta_flag.addr, align 4
  %0 = load i32, i32* @terminal_prepped, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %return

if.end:                                           ; preds = %entry
  call void @_rl_block_sigint()
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @rl_instream, align 4
  %tobool1 = icmp ne %struct._IO_FILE* %1, null
  br i1 %tobool1, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @rl_instream, align 4
  %call = call i32 @fileno(%struct._IO_FILE* %2)
  br label %cond.end

cond.false:                                       ; preds = %if.end
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 4
  %call2 = call i32 @fileno(%struct._IO_FILE* %3)
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call, %cond.true ], [ %call2, %cond.false ]
  store i32 %cond, i32* %tty, align 4
  %4 = load i32, i32* %tty, align 4
  %call3 = call i32 @get_tty_settings(i32 %4, %struct.termios* %tio)
  %cmp = icmp slt i32 %call3, 0
  br i1 %cmp, label %if.then4, label %if.end14

if.then4:                                         ; preds = %cond.end
  %call5 = call i32* @__errno_location()
  %5 = load i32, i32* %call5, align 4
  %cmp6 = icmp eq i32 %5, 25
  br i1 %cmp6, label %if.then12, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.then4
  %call7 = call i32* @__errno_location()
  %6 = load i32, i32* %call7, align 4
  %cmp8 = icmp eq i32 %6, 22
  br i1 %cmp8, label %if.then12, label %lor.lhs.false9

lor.lhs.false9:                                   ; preds = %lor.lhs.false
  %call10 = call i32* @__errno_location()
  %7 = load i32, i32* %call10, align 4
  %cmp11 = icmp eq i32 %7, 95
  br i1 %cmp11, label %if.then12, label %if.end13

if.then12:                                        ; preds = %lor.lhs.false9, %lor.lhs.false, %if.then4
  store i32 1, i32* @_rl_echoing_p, align 4
  br label %if.end13

if.end13:                                         ; preds = %if.then12, %lor.lhs.false9
  call void @_rl_release_sigint()
  br label %return

if.end14:                                         ; preds = %cond.end
  %8 = bitcast %struct.termios* %tio to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* bitcast (%struct.termios* @otio to i8*), i8* %8, i32 60, i32 4, i1 false)
  %9 = load i32, i32* @_rl_bind_stty_chars, align 4
  %tobool15 = icmp ne i32 %9, 0
  br i1 %tobool15, label %if.then16, label %if.end20

if.then16:                                        ; preds = %if.end14
  %10 = load i32, i32* @rl_editing_mode, align 4
  %cmp17 = icmp eq i32 %10, 0
  br i1 %cmp17, label %if.then18, label %if.else

if.then18:                                        ; preds = %if.then16
  call void @rl_tty_unset_default_bindings(%struct._keymap_entry* getelementptr inbounds ([257 x %struct._keymap_entry], [257 x %struct._keymap_entry]* @vi_insertion_keymap, i32 0, i32 0))
  br label %if.end19

if.else:                                          ; preds = %if.then16
  %11 = load %struct._keymap_entry*, %struct._keymap_entry** @_rl_keymap, align 4
  call void @rl_tty_unset_default_bindings(%struct._keymap_entry* %11)
  br label %if.end19

if.end19:                                         ; preds = %if.else, %if.then18
  br label %if.end20

if.end20:                                         ; preds = %if.end19, %if.end14
  call void @save_tty_chars(%struct.termios* @otio)
  %12 = load i32, i32* @rl_readline_state, align 4
  %or = or i32 %12, 262144
  store i32 %or, i32* @rl_readline_state, align 4
  %13 = load i32, i32* @_rl_bind_stty_chars, align 4
  %tobool21 = icmp ne i32 %13, 0
  br i1 %tobool21, label %if.then22, label %if.end27

if.then22:                                        ; preds = %if.end20
  %14 = load i32, i32* @rl_editing_mode, align 4
  %cmp23 = icmp eq i32 %14, 0
  br i1 %cmp23, label %if.then24, label %if.else25

if.then24:                                        ; preds = %if.then22
  call void @_rl_bind_tty_special_chars(%struct._keymap_entry* getelementptr inbounds ([257 x %struct._keymap_entry], [257 x %struct._keymap_entry]* @vi_insertion_keymap, i32 0, i32 0), %struct.termios* byval align 4 %tio)
  br label %if.end26

if.else25:                                        ; preds = %if.then22
  %15 = load %struct._keymap_entry*, %struct._keymap_entry** @_rl_keymap, align 4
  call void @_rl_bind_tty_special_chars(%struct._keymap_entry* %15, %struct.termios* byval align 4 %tio)
  br label %if.end26

if.end26:                                         ; preds = %if.else25, %if.then24
  br label %if.end27

if.end27:                                         ; preds = %if.end26, %if.end20
  %16 = load i32, i32* %meta_flag.addr, align 4
  call void @prepare_terminal_settings(i32 %16, %struct.termios* byval align 4 @otio, %struct.termios* %tio)
  %17 = load i32, i32* %tty, align 4
  %call28 = call i32 @set_tty_settings(i32 %17, %struct.termios* %tio)
  %cmp29 = icmp slt i32 %call28, 0
  br i1 %cmp29, label %if.then30, label %if.end31

if.then30:                                        ; preds = %if.end27
  call void @_rl_release_sigint()
  br label %return

if.end31:                                         ; preds = %if.end27
  %18 = load i32, i32* @_rl_enable_keypad, align 4
  %tobool32 = icmp ne i32 %18, 0
  br i1 %tobool32, label %if.then33, label %if.end34

if.then33:                                        ; preds = %if.end31
  call void @_rl_control_keypad(i32 1)
  br label %if.end34

if.end34:                                         ; preds = %if.then33, %if.end31
  store i32 1, i32* %nprep, align 4
  %19 = load i32, i32* @_rl_enable_bracketed_paste, align 4
  %tobool35 = icmp ne i32 %19, 0
  br i1 %tobool35, label %if.then36, label %if.end39

if.then36:                                        ; preds = %if.end34
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @rl_outstream, align 4
  %call37 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i32 0, i32 0))
  %21 = load i32, i32* %nprep, align 4
  %or38 = or i32 %21, 2
  store i32 %or38, i32* %nprep, align 4
  br label %if.end39

if.end39:                                         ; preds = %if.then36, %if.end34
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @rl_outstream, align 4
  %call40 = call i32 @fflush(%struct._IO_FILE* %22)
  %23 = load i32, i32* %nprep, align 4
  store i32 %23, i32* @terminal_prepped, align 4
  %24 = load i32, i32* @rl_readline_state, align 4
  %or41 = or i32 %24, 4
  store i32 %or41, i32* @rl_readline_state, align 4
  call void @_rl_release_sigint()
  br label %return

return:                                           ; preds = %if.end39, %if.then30, %if.end13, %if.then
  ret void
}

; Function Attrs: noinline nounwind
define void @rl_deprep_terminal() #0 {
entry:
  %tty = alloca i32, align 4
  %0 = load i32, i32* @terminal_prepped, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %return

if.end:                                           ; preds = %entry
  call void @_rl_block_sigint()
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @rl_instream, align 4
  %tobool = icmp ne %struct._IO_FILE* %1, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @rl_instream, align 4
  %call = call i32 @fileno(%struct._IO_FILE* %2)
  br label %cond.end

cond.false:                                       ; preds = %if.end
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 4
  %call1 = call i32 @fileno(%struct._IO_FILE* %3)
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call, %cond.true ], [ %call1, %cond.false ]
  store i32 %cond, i32* %tty, align 4
  %4 = load i32, i32* @terminal_prepped, align 4
  %and = and i32 %4, 2
  %tobool2 = icmp ne i32 %and, 0
  br i1 %tobool2, label %if.then3, label %if.end5

if.then3:                                         ; preds = %cond.end
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @rl_outstream, align 4
  %call4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0))
  br label %if.end5

if.end5:                                          ; preds = %if.then3, %cond.end
  %6 = load i32, i32* @_rl_enable_keypad, align 4
  %tobool6 = icmp ne i32 %6, 0
  br i1 %tobool6, label %if.then7, label %if.end8

if.then7:                                         ; preds = %if.end5
  call void @_rl_control_keypad(i32 0)
  br label %if.end8

if.end8:                                          ; preds = %if.then7, %if.end5
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @rl_outstream, align 4
  %call9 = call i32 @fflush(%struct._IO_FILE* %7)
  %8 = load i32, i32* %tty, align 4
  %call10 = call i32 @set_tty_settings(i32 %8, %struct.termios* @otio)
  %cmp11 = icmp slt i32 %call10, 0
  br i1 %cmp11, label %if.then12, label %if.end13

if.then12:                                        ; preds = %if.end8
  call void @_rl_release_sigint()
  br label %return

if.end13:                                         ; preds = %if.end8
  store i32 0, i32* @terminal_prepped, align 4
  %9 = load i32, i32* @rl_readline_state, align 4
  %and14 = and i32 %9, -5
  store i32 %and14, i32* @rl_readline_state, align 4
  call void @_rl_release_sigint()
  br label %return

return:                                           ; preds = %if.end13, %if.then12, %if.then
  ret void
}

declare void @_rl_block_sigint() #1

declare i32 @fileno(%struct._IO_FILE*) #1

; Function Attrs: noinline nounwind
define internal i32 @get_tty_settings(i32 %tty, %struct.termios* %tiop) #0 {
entry:
  %retval = alloca i32, align 4
  %tty.addr = alloca i32, align 4
  %tiop.addr = alloca %struct.termios*, align 4
  store i32 %tty, i32* %tty.addr, align 4
  store %struct.termios* %tiop, %struct.termios** %tiop.addr, align 4
  %0 = load i32, i32* %tty.addr, align 4
  call void @set_winsize(i32 %0)
  %call = call i32* @__errno_location()
  store i32 0, i32* %call, align 4
  %1 = load i32, i32* %tty.addr, align 4
  %2 = load %struct.termios*, %struct.termios** %tiop.addr, align 4
  %call1 = call i32 @_get_tty_settings(i32 %1, %struct.termios* %2)
  %cmp = icmp slt i32 %call1, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %3 = load i32, i32* %retval, align 4
  ret i32 %3
}

declare i32* @__errno_location() #1

declare void @_rl_release_sigint() #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* nocapture writeonly, i8* nocapture readonly, i32, i32, i1) #2

; Function Attrs: noinline nounwind
define void @rl_tty_unset_default_bindings(%struct._keymap_entry* %kmap) #0 {
entry:
  %kmap.addr = alloca %struct._keymap_entry*, align 4
  store %struct._keymap_entry* %kmap, %struct._keymap_entry** %kmap.addr, align 4
  %0 = load i32, i32* @rl_readline_state, align 4
  %and = and i32 %0, 262144
  %cmp = icmp eq i32 %and, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %if.end54

if.end:                                           ; preds = %entry
  %1 = load i8, i8* getelementptr inbounds (%struct._rl_tty_chars, %struct._rl_tty_chars* @_rl_tty_chars, i32 0, i32 3), align 1
  %conv = zext i8 %1 to i32
  %cmp1 = icmp ne i32 %conv, 0
  br i1 %cmp1, label %land.lhs.true, label %if.end9

land.lhs.true:                                    ; preds = %if.end
  %2 = load %struct._keymap_entry*, %struct._keymap_entry** %kmap.addr, align 4
  %3 = load i8, i8* getelementptr inbounds (%struct._rl_tty_chars, %struct._rl_tty_chars* @_rl_tty_chars, i32 0, i32 3), align 1
  %idxprom = zext i8 %3 to i32
  %arrayidx = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %2, i32 %idxprom
  %type = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx, i32 0, i32 0
  %4 = load i8, i8* %type, align 4
  %conv3 = sext i8 %4 to i32
  %cmp4 = icmp eq i32 %conv3, 0
  br i1 %cmp4, label %if.then6, label %if.end9

if.then6:                                         ; preds = %land.lhs.true
  %5 = load %struct._keymap_entry*, %struct._keymap_entry** %kmap.addr, align 4
  %6 = load i8, i8* getelementptr inbounds (%struct._rl_tty_chars, %struct._rl_tty_chars* @_rl_tty_chars, i32 0, i32 3), align 1
  %idxprom7 = zext i8 %6 to i32
  %arrayidx8 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %5, i32 %idxprom7
  %function = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx8, i32 0, i32 1
  store i32 (i32, i32)* @rl_insert, i32 (i32, i32)** %function, align 4
  br label %if.end9

if.end9:                                          ; preds = %if.then6, %land.lhs.true, %if.end
  %7 = load i8, i8* getelementptr inbounds (%struct._rl_tty_chars, %struct._rl_tty_chars* @_rl_tty_chars, i32 0, i32 5), align 1
  %conv10 = zext i8 %7 to i32
  %cmp11 = icmp ne i32 %conv10, 0
  br i1 %cmp11, label %land.lhs.true13, label %if.end24

land.lhs.true13:                                  ; preds = %if.end9
  %8 = load %struct._keymap_entry*, %struct._keymap_entry** %kmap.addr, align 4
  %9 = load i8, i8* getelementptr inbounds (%struct._rl_tty_chars, %struct._rl_tty_chars* @_rl_tty_chars, i32 0, i32 5), align 1
  %idxprom14 = zext i8 %9 to i32
  %arrayidx15 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %8, i32 %idxprom14
  %type16 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx15, i32 0, i32 0
  %10 = load i8, i8* %type16, align 4
  %conv17 = sext i8 %10 to i32
  %cmp18 = icmp eq i32 %conv17, 0
  br i1 %cmp18, label %if.then20, label %if.end24

if.then20:                                        ; preds = %land.lhs.true13
  %11 = load %struct._keymap_entry*, %struct._keymap_entry** %kmap.addr, align 4
  %12 = load i8, i8* getelementptr inbounds (%struct._rl_tty_chars, %struct._rl_tty_chars* @_rl_tty_chars, i32 0, i32 5), align 1
  %idxprom21 = zext i8 %12 to i32
  %arrayidx22 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %11, i32 %idxprom21
  %function23 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx22, i32 0, i32 1
  store i32 (i32, i32)* @rl_insert, i32 (i32, i32)** %function23, align 4
  br label %if.end24

if.end24:                                         ; preds = %if.then20, %land.lhs.true13, %if.end9
  %13 = load i8, i8* getelementptr inbounds (%struct._rl_tty_chars, %struct._rl_tty_chars* @_rl_tty_chars, i32 0, i32 13), align 1
  %conv25 = zext i8 %13 to i32
  %cmp26 = icmp ne i32 %conv25, 0
  br i1 %cmp26, label %land.lhs.true28, label %if.end39

land.lhs.true28:                                  ; preds = %if.end24
  %14 = load %struct._keymap_entry*, %struct._keymap_entry** %kmap.addr, align 4
  %15 = load i8, i8* getelementptr inbounds (%struct._rl_tty_chars, %struct._rl_tty_chars* @_rl_tty_chars, i32 0, i32 13), align 1
  %idxprom29 = zext i8 %15 to i32
  %arrayidx30 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %14, i32 %idxprom29
  %type31 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx30, i32 0, i32 0
  %16 = load i8, i8* %type31, align 4
  %conv32 = sext i8 %16 to i32
  %cmp33 = icmp eq i32 %conv32, 0
  br i1 %cmp33, label %if.then35, label %if.end39

if.then35:                                        ; preds = %land.lhs.true28
  %17 = load %struct._keymap_entry*, %struct._keymap_entry** %kmap.addr, align 4
  %18 = load i8, i8* getelementptr inbounds (%struct._rl_tty_chars, %struct._rl_tty_chars* @_rl_tty_chars, i32 0, i32 13), align 1
  %idxprom36 = zext i8 %18 to i32
  %arrayidx37 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %17, i32 %idxprom36
  %function38 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx37, i32 0, i32 1
  store i32 (i32, i32)* @rl_insert, i32 (i32, i32)** %function38, align 4
  br label %if.end39

if.end39:                                         ; preds = %if.then35, %land.lhs.true28, %if.end24
  %19 = load i8, i8* getelementptr inbounds (%struct._rl_tty_chars, %struct._rl_tty_chars* @_rl_tty_chars, i32 0, i32 4), align 1
  %conv40 = zext i8 %19 to i32
  %cmp41 = icmp ne i32 %conv40, 0
  br i1 %cmp41, label %land.lhs.true43, label %if.end54

land.lhs.true43:                                  ; preds = %if.end39
  %20 = load %struct._keymap_entry*, %struct._keymap_entry** %kmap.addr, align 4
  %21 = load i8, i8* getelementptr inbounds (%struct._rl_tty_chars, %struct._rl_tty_chars* @_rl_tty_chars, i32 0, i32 4), align 1
  %idxprom44 = zext i8 %21 to i32
  %arrayidx45 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %20, i32 %idxprom44
  %type46 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx45, i32 0, i32 0
  %22 = load i8, i8* %type46, align 4
  %conv47 = sext i8 %22 to i32
  %cmp48 = icmp eq i32 %conv47, 0
  br i1 %cmp48, label %if.then50, label %if.end54

if.then50:                                        ; preds = %land.lhs.true43
  %23 = load %struct._keymap_entry*, %struct._keymap_entry** %kmap.addr, align 4
  %24 = load i8, i8* getelementptr inbounds (%struct._rl_tty_chars, %struct._rl_tty_chars* @_rl_tty_chars, i32 0, i32 4), align 1
  %idxprom51 = zext i8 %24 to i32
  %arrayidx52 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %23, i32 %idxprom51
  %function53 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx52, i32 0, i32 1
  store i32 (i32, i32)* @rl_insert, i32 (i32, i32)** %function53, align 4
  br label %if.end54

if.end54:                                         ; preds = %if.then, %if.then50, %land.lhs.true43, %if.end39
  ret void
}

; Function Attrs: noinline nounwind
define internal void @save_tty_chars(%struct.termios* %tiop) #0 {
entry:
  %tiop.addr = alloca %struct.termios*, align 4
  store %struct.termios* %tiop, %struct.termios** %tiop.addr, align 4
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* getelementptr inbounds (%struct._rl_tty_chars, %struct._rl_tty_chars* @_rl_last_tty_chars, i32 0, i32 0), i8* getelementptr inbounds (%struct._rl_tty_chars, %struct._rl_tty_chars* @_rl_tty_chars, i32 0, i32 0), i32 16, i32 1, i1 false)
  %0 = load %struct.termios*, %struct.termios** %tiop.addr, align 4
  %c_cc = getelementptr inbounds %struct.termios, %struct.termios* %0, i32 0, i32 5
  %arrayidx = getelementptr inbounds [32 x i8], [32 x i8]* %c_cc, i32 0, i32 4
  %1 = load i8, i8* %arrayidx, align 1
  store i8 %1, i8* getelementptr inbounds (%struct._rl_tty_chars, %struct._rl_tty_chars* @_rl_tty_chars, i32 0, i32 0), align 1
  %2 = load %struct.termios*, %struct.termios** %tiop.addr, align 4
  %c_cc1 = getelementptr inbounds %struct.termios, %struct.termios* %2, i32 0, i32 5
  %arrayidx2 = getelementptr inbounds [32 x i8], [32 x i8]* %c_cc1, i32 0, i32 11
  %3 = load i8, i8* %arrayidx2, align 1
  store i8 %3, i8* getelementptr inbounds (%struct._rl_tty_chars, %struct._rl_tty_chars* @_rl_tty_chars, i32 0, i32 1), align 1
  %4 = load %struct.termios*, %struct.termios** %tiop.addr, align 4
  %c_cc3 = getelementptr inbounds %struct.termios, %struct.termios* %4, i32 0, i32 5
  %arrayidx4 = getelementptr inbounds [32 x i8], [32 x i8]* %c_cc3, i32 0, i32 16
  %5 = load i8, i8* %arrayidx4, align 1
  store i8 %5, i8* getelementptr inbounds (%struct._rl_tty_chars, %struct._rl_tty_chars* @_rl_tty_chars, i32 0, i32 2), align 1
  %6 = load %struct.termios*, %struct.termios** %tiop.addr, align 4
  %c_cc5 = getelementptr inbounds %struct.termios, %struct.termios* %6, i32 0, i32 5
  %arrayidx6 = getelementptr inbounds [32 x i8], [32 x i8]* %c_cc5, i32 0, i32 2
  %7 = load i8, i8* %arrayidx6, align 1
  store i8 %7, i8* getelementptr inbounds (%struct._rl_tty_chars, %struct._rl_tty_chars* @_rl_tty_chars, i32 0, i32 3), align 1
  %8 = load %struct.termios*, %struct.termios** %tiop.addr, align 4
  %c_cc7 = getelementptr inbounds %struct.termios, %struct.termios* %8, i32 0, i32 5
  %arrayidx8 = getelementptr inbounds [32 x i8], [32 x i8]* %c_cc7, i32 0, i32 14
  %9 = load i8, i8* %arrayidx8, align 1
  store i8 %9, i8* getelementptr inbounds (%struct._rl_tty_chars, %struct._rl_tty_chars* @_rl_tty_chars, i32 0, i32 4), align 1
  %10 = load %struct.termios*, %struct.termios** %tiop.addr, align 4
  %c_cc9 = getelementptr inbounds %struct.termios, %struct.termios* %10, i32 0, i32 5
  %arrayidx10 = getelementptr inbounds [32 x i8], [32 x i8]* %c_cc9, i32 0, i32 3
  %11 = load i8, i8* %arrayidx10, align 1
  store i8 %11, i8* getelementptr inbounds (%struct._rl_tty_chars, %struct._rl_tty_chars* @_rl_tty_chars, i32 0, i32 5), align 1
  %12 = load %struct.termios*, %struct.termios** %tiop.addr, align 4
  %c_cc11 = getelementptr inbounds %struct.termios, %struct.termios* %12, i32 0, i32 5
  %arrayidx12 = getelementptr inbounds [32 x i8], [32 x i8]* %c_cc11, i32 0, i32 12
  %13 = load i8, i8* %arrayidx12, align 1
  store i8 %13, i8* getelementptr inbounds (%struct._rl_tty_chars, %struct._rl_tty_chars* @_rl_tty_chars, i32 0, i32 6), align 1
  %14 = load %struct.termios*, %struct.termios** %tiop.addr, align 4
  %c_cc13 = getelementptr inbounds %struct.termios, %struct.termios* %14, i32 0, i32 5
  %arrayidx14 = getelementptr inbounds [32 x i8], [32 x i8]* %c_cc13, i32 0, i32 0
  %15 = load i8, i8* %arrayidx14, align 1
  store i8 %15, i8* getelementptr inbounds (%struct._rl_tty_chars, %struct._rl_tty_chars* @_rl_tty_chars, i32 0, i32 7), align 1
  %conv = zext i8 %15 to i32
  store i32 %conv, i32* @_rl_intr_char, align 4
  %16 = load %struct.termios*, %struct.termios** %tiop.addr, align 4
  %c_cc15 = getelementptr inbounds %struct.termios, %struct.termios* %16, i32 0, i32 5
  %arrayidx16 = getelementptr inbounds [32 x i8], [32 x i8]* %c_cc15, i32 0, i32 1
  %17 = load i8, i8* %arrayidx16, align 1
  store i8 %17, i8* getelementptr inbounds (%struct._rl_tty_chars, %struct._rl_tty_chars* @_rl_tty_chars, i32 0, i32 8), align 1
  %conv17 = zext i8 %17 to i32
  store i32 %conv17, i32* @_rl_quit_char, align 4
  %18 = load %struct.termios*, %struct.termios** %tiop.addr, align 4
  %c_cc18 = getelementptr inbounds %struct.termios, %struct.termios* %18, i32 0, i32 5
  %arrayidx19 = getelementptr inbounds [32 x i8], [32 x i8]* %c_cc18, i32 0, i32 10
  %19 = load i8, i8* %arrayidx19, align 1
  store i8 %19, i8* getelementptr inbounds (%struct._rl_tty_chars, %struct._rl_tty_chars* @_rl_tty_chars, i32 0, i32 9), align 1
  %conv20 = zext i8 %19 to i32
  store i32 %conv20, i32* @_rl_susp_char, align 4
  %20 = load %struct.termios*, %struct.termios** %tiop.addr, align 4
  %c_cc21 = getelementptr inbounds %struct.termios, %struct.termios* %20, i32 0, i32 5
  %arrayidx22 = getelementptr inbounds [32 x i8], [32 x i8]* %c_cc21, i32 0, i32 8
  %21 = load i8, i8* %arrayidx22, align 1
  store i8 %21, i8* getelementptr inbounds (%struct._rl_tty_chars, %struct._rl_tty_chars* @_rl_tty_chars, i32 0, i32 11), align 1
  %22 = load %struct.termios*, %struct.termios** %tiop.addr, align 4
  %c_cc23 = getelementptr inbounds %struct.termios, %struct.termios* %22, i32 0, i32 5
  %arrayidx24 = getelementptr inbounds [32 x i8], [32 x i8]* %c_cc23, i32 0, i32 9
  %23 = load i8, i8* %arrayidx24, align 1
  store i8 %23, i8* getelementptr inbounds (%struct._rl_tty_chars, %struct._rl_tty_chars* @_rl_tty_chars, i32 0, i32 12), align 1
  %24 = load %struct.termios*, %struct.termios** %tiop.addr, align 4
  %c_cc25 = getelementptr inbounds %struct.termios, %struct.termios* %24, i32 0, i32 5
  %arrayidx26 = getelementptr inbounds [32 x i8], [32 x i8]* %c_cc25, i32 0, i32 15
  %25 = load i8, i8* %arrayidx26, align 1
  store i8 %25, i8* getelementptr inbounds (%struct._rl_tty_chars, %struct._rl_tty_chars* @_rl_tty_chars, i32 0, i32 13), align 1
  %26 = load %struct.termios*, %struct.termios** %tiop.addr, align 4
  %c_cc27 = getelementptr inbounds %struct.termios, %struct.termios* %26, i32 0, i32 5
  %arrayidx28 = getelementptr inbounds [32 x i8], [32 x i8]* %c_cc27, i32 0, i32 13
  %27 = load i8, i8* %arrayidx28, align 1
  store i8 %27, i8* getelementptr inbounds (%struct._rl_tty_chars, %struct._rl_tty_chars* @_rl_tty_chars, i32 0, i32 14), align 1
  ret void
}

; Function Attrs: noinline nounwind
define internal void @_rl_bind_tty_special_chars(%struct._keymap_entry* %kmap, %struct.termios* byval align 4 %ttybuff) #0 {
entry:
  %kmap.addr = alloca %struct._keymap_entry*, align 4
  store %struct._keymap_entry* %kmap, %struct._keymap_entry** %kmap.addr, align 4
  %0 = load %struct._keymap_entry*, %struct._keymap_entry** %kmap.addr, align 4
  call void @set_special_char(%struct._keymap_entry* %0, %struct.termios* %ttybuff, i32 2, i32 (i32, i32)* @rl_rubout)
  %1 = load %struct._keymap_entry*, %struct._keymap_entry** %kmap.addr, align 4
  call void @set_special_char(%struct._keymap_entry* %1, %struct.termios* %ttybuff, i32 3, i32 (i32, i32)* @rl_unix_line_discard)
  %2 = load %struct._keymap_entry*, %struct._keymap_entry** %kmap.addr, align 4
  call void @set_special_char(%struct._keymap_entry* %2, %struct.termios* %ttybuff, i32 15, i32 (i32, i32)* @rl_quoted_insert)
  %3 = load i32, i32* @rl_editing_mode, align 4
  %cmp = icmp eq i32 %3, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %4 = load %struct._keymap_entry*, %struct._keymap_entry** %kmap.addr, align 4
  call void @set_special_char(%struct._keymap_entry* %4, %struct.termios* %ttybuff, i32 14, i32 (i32, i32)* @rl_vi_unix_word_rubout)
  br label %if.end

if.else:                                          ; preds = %entry
  %5 = load %struct._keymap_entry*, %struct._keymap_entry** %kmap.addr, align 4
  call void @set_special_char(%struct._keymap_entry* %5, %struct.termios* %ttybuff, i32 14, i32 (i32, i32)* @rl_unix_word_rubout)
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void
}

; Function Attrs: noinline nounwind
define internal void @prepare_terminal_settings(i32 %meta_flag, %struct.termios* byval align 4 %oldtio, %struct.termios* %tiop) #0 {
entry:
  %meta_flag.addr = alloca i32, align 4
  %tiop.addr = alloca %struct.termios*, align 4
  store i32 %meta_flag, i32* %meta_flag.addr, align 4
  store %struct.termios* %tiop, %struct.termios** %tiop.addr, align 4
  %c_lflag = getelementptr inbounds %struct.termios, %struct.termios* %oldtio, i32 0, i32 3
  %0 = load i32, i32* %c_lflag, align 4
  %and = and i32 %0, 8
  store i32 %and, i32* @_rl_echoing_p, align 4
  %c_lflag1 = getelementptr inbounds %struct.termios, %struct.termios* %oldtio, i32 0, i32 3
  %1 = load i32, i32* %c_lflag1, align 4
  %and2 = and i32 %1, 512
  store i32 %and2, i32* @_rl_echoctl, align 4
  %2 = load %struct.termios*, %struct.termios** %tiop.addr, align 4
  %c_lflag3 = getelementptr inbounds %struct.termios, %struct.termios* %2, i32 0, i32 3
  %3 = load i32, i32* %c_lflag3, align 4
  %and4 = and i32 %3, -11
  store i32 %and4, i32* %c_lflag3, align 4
  %c_cc = getelementptr inbounds %struct.termios, %struct.termios* %oldtio, i32 0, i32 5
  %arrayidx = getelementptr inbounds [32 x i8], [32 x i8]* %c_cc, i32 0, i32 4
  %4 = load i8, i8* %arrayidx, align 1
  %conv = zext i8 %4 to i32
  %cmp = icmp ne i32 %conv, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %c_cc6 = getelementptr inbounds %struct.termios, %struct.termios* %oldtio, i32 0, i32 5
  %arrayidx7 = getelementptr inbounds [32 x i8], [32 x i8]* %c_cc6, i32 0, i32 4
  %5 = load i8, i8* %arrayidx7, align 1
  %conv8 = zext i8 %5 to i32
  store i32 %conv8, i32* @_rl_eof_char, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %6 = load %struct.termios*, %struct.termios** %tiop.addr, align 4
  %c_cflag = getelementptr inbounds %struct.termios, %struct.termios* %6, i32 0, i32 2
  %7 = load i32, i32* %c_cflag, align 4
  %and9 = and i32 %7, 48
  %cmp10 = icmp eq i32 %and9, 48
  br i1 %cmp10, label %if.then12, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end
  %8 = load i32, i32* %meta_flag.addr, align 4
  %tobool = icmp ne i32 %8, 0
  br i1 %tobool, label %if.then12, label %if.end14

if.then12:                                        ; preds = %lor.lhs.false, %if.end
  %9 = load %struct.termios*, %struct.termios** %tiop.addr, align 4
  %c_iflag = getelementptr inbounds %struct.termios, %struct.termios* %9, i32 0, i32 0
  %10 = load i32, i32* %c_iflag, align 4
  %and13 = and i32 %10, -49
  store i32 %and13, i32* %c_iflag, align 4
  br label %if.end14

if.end14:                                         ; preds = %if.then12, %lor.lhs.false
  %11 = load %struct.termios*, %struct.termios** %tiop.addr, align 4
  %c_iflag15 = getelementptr inbounds %struct.termios, %struct.termios* %11, i32 0, i32 0
  %12 = load i32, i32* %c_iflag15, align 4
  %and16 = and i32 %12, -321
  store i32 %and16, i32* %c_iflag15, align 4
  %13 = load %struct.termios*, %struct.termios** %tiop.addr, align 4
  %c_lflag17 = getelementptr inbounds %struct.termios, %struct.termios* %13, i32 0, i32 3
  %14 = load i32, i32* %c_lflag17, align 4
  %or = or i32 %14, 1
  store i32 %or, i32* %c_lflag17, align 4
  %15 = load %struct.termios*, %struct.termios** %tiop.addr, align 4
  %c_cc18 = getelementptr inbounds %struct.termios, %struct.termios* %15, i32 0, i32 5
  %arrayidx19 = getelementptr inbounds [32 x i8], [32 x i8]* %c_cc18, i32 0, i32 6
  store i8 1, i8* %arrayidx19, align 1
  %16 = load %struct.termios*, %struct.termios** %tiop.addr, align 4
  %c_cc20 = getelementptr inbounds %struct.termios, %struct.termios* %16, i32 0, i32 5
  %arrayidx21 = getelementptr inbounds [32 x i8], [32 x i8]* %c_cc20, i32 0, i32 5
  store i8 0, i8* %arrayidx21, align 1
  %17 = load %struct.termios*, %struct.termios** %tiop.addr, align 4
  %c_lflag22 = getelementptr inbounds %struct.termios, %struct.termios* %17, i32 0, i32 3
  %18 = load i32, i32* %c_lflag22, align 4
  %and23 = and i32 %18, 4096
  %tobool24 = icmp ne i32 %and23, 0
  br i1 %tobool24, label %if.then25, label %if.end30

if.then25:                                        ; preds = %if.end14
  %19 = load %struct.termios*, %struct.termios** %tiop.addr, align 4
  %c_lflag26 = getelementptr inbounds %struct.termios, %struct.termios* %19, i32 0, i32 3
  %20 = load i32, i32* %c_lflag26, align 4
  %and27 = and i32 %20, -4097
  store i32 %and27, i32* %c_lflag26, align 4
  %c_lflag28 = getelementptr inbounds %struct.termios, %struct.termios* %oldtio, i32 0, i32 3
  %21 = load i32, i32* %c_lflag28, align 4
  %and29 = and i32 %21, -4097
  store i32 %and29, i32* %c_lflag28, align 4
  br label %if.end30

if.end30:                                         ; preds = %if.then25, %if.end14
  %22 = load %struct.termios*, %struct.termios** %tiop.addr, align 4
  %c_cc31 = getelementptr inbounds %struct.termios, %struct.termios* %22, i32 0, i32 5
  %arrayidx32 = getelementptr inbounds [32 x i8], [32 x i8]* %c_cc31, i32 0, i32 15
  store i8 0, i8* %arrayidx32, align 1
  ret void
}

; Function Attrs: noinline nounwind
define internal i32 @set_tty_settings(i32 %tty, %struct.termios* %tiop) #0 {
entry:
  %retval = alloca i32, align 4
  %tty.addr = alloca i32, align 4
  %tiop.addr = alloca %struct.termios*, align 4
  store i32 %tty, i32* %tty.addr, align 4
  store %struct.termios* %tiop, %struct.termios** %tiop.addr, align 4
  %0 = load i32, i32* %tty.addr, align 4
  %1 = load %struct.termios*, %struct.termios** %tiop.addr, align 4
  %call = call i32 @_set_tty_settings(i32 %0, %struct.termios* %1)
  %cmp = icmp slt i32 %call, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %2 = load i32, i32* %retval, align 4
  ret i32 %2
}

declare void @_rl_control_keypad(i32) #1

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

declare i32 @fflush(%struct._IO_FILE*) #1

; Function Attrs: noinline nounwind
define i32 @rl_tty_set_echoing(i32 %u) #0 {
entry:
  %u.addr = alloca i32, align 4
  %o = alloca i32, align 4
  store i32 %u, i32* %u.addr, align 4
  %0 = load i32, i32* @_rl_echoing_p, align 4
  store i32 %0, i32* %o, align 4
  %1 = load i32, i32* %u.addr, align 4
  store i32 %1, i32* @_rl_echoing_p, align 4
  %2 = load i32, i32* %o, align 4
  ret i32 %2
}

; Function Attrs: noinline nounwind
define i32 @rl_restart_output(i32 %count, i32 %key) #0 {
entry:
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  %fildes = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @rl_outstream, align 4
  %call = call i32 @fileno(%struct._IO_FILE* %0)
  store i32 %call, i32* %fildes, align 4
  %1 = load i32, i32* %fildes, align 4
  %call1 = call i32 @tcflow(i32 %1, i32 1)
  ret i32 0
}

declare i32 @tcflow(i32, i32) #1

; Function Attrs: noinline nounwind
define i32 @rl_stop_output(i32 %count, i32 %key) #0 {
entry:
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  %fildes = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @rl_instream, align 4
  %call = call i32 @fileno(%struct._IO_FILE* %0)
  store i32 %call, i32* %fildes, align 4
  %1 = load i32, i32* %fildes, align 4
  %call1 = call i32 @tcflow(i32 %1, i32 0)
  ret i32 0
}

; Function Attrs: noinline nounwind
define void @rltty_set_default_bindings(%struct._keymap_entry* %kmap) #0 {
entry:
  %kmap.addr = alloca %struct._keymap_entry*, align 4
  %ttybuff = alloca %struct.termios, align 4
  %tty = alloca i32, align 4
  store %struct._keymap_entry* %kmap, %struct._keymap_entry** %kmap.addr, align 4
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @rl_instream, align 4
  %call = call i32 @fileno(%struct._IO_FILE* %0)
  store i32 %call, i32* %tty, align 4
  %1 = load i32, i32* %tty, align 4
  %call1 = call i32 @get_tty_settings(i32 %1, %struct.termios* %ttybuff)
  %cmp = icmp eq i32 %call1, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load %struct._keymap_entry*, %struct._keymap_entry** %kmap.addr, align 4
  call void @_rl_bind_tty_special_chars(%struct._keymap_entry* %2, %struct.termios* byval align 4 %ttybuff)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

; Function Attrs: noinline nounwind
define void @rl_tty_set_default_bindings(%struct._keymap_entry* %kmap) #0 {
entry:
  %kmap.addr = alloca %struct._keymap_entry*, align 4
  store %struct._keymap_entry* %kmap, %struct._keymap_entry** %kmap.addr, align 4
  %0 = load %struct._keymap_entry*, %struct._keymap_entry** %kmap.addr, align 4
  call void @rltty_set_default_bindings(%struct._keymap_entry* %0)
  ret void
}

declare i32 @rl_insert(i32, i32) #1

; Function Attrs: noinline nounwind
define i32 @_rl_disable_tty_signals() #0 {
entry:
  %retval = alloca i32, align 4
  %0 = load i32, i32* @tty_sigs_disabled, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @rl_instream, align 4
  %call = call i32 @fileno(%struct._IO_FILE* %1)
  %call1 = call i32 @_get_tty_settings(i32 %call, %struct.termios* @sigstty)
  %cmp = icmp slt i32 %call1, 0
  br i1 %cmp, label %if.then2, label %if.end3

if.then2:                                         ; preds = %if.end
  store i32 -1, i32* %retval, align 4
  br label %return

if.end3:                                          ; preds = %if.end
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* bitcast (%struct.termios* @nosigstty to i8*), i8* bitcast (%struct.termios* @sigstty to i8*), i32 60, i32 4, i1 false)
  %2 = load i32, i32* getelementptr inbounds (%struct.termios, %struct.termios* @nosigstty, i32 0, i32 3), align 4
  %and = and i32 %2, -2
  store i32 %and, i32* getelementptr inbounds (%struct.termios, %struct.termios* @nosigstty, i32 0, i32 3), align 4
  %3 = load i32, i32* getelementptr inbounds (%struct.termios, %struct.termios* @nosigstty, i32 0, i32 0), align 4
  %and4 = and i32 %3, -1025
  store i32 %and4, i32* getelementptr inbounds (%struct.termios, %struct.termios* @nosigstty, i32 0, i32 0), align 4
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @rl_instream, align 4
  %call5 = call i32 @fileno(%struct._IO_FILE* %4)
  %call6 = call i32 @_set_tty_settings(i32 %call5, %struct.termios* @nosigstty)
  %cmp7 = icmp slt i32 %call6, 0
  br i1 %cmp7, label %if.then8, label %if.end11

if.then8:                                         ; preds = %if.end3
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @rl_instream, align 4
  %call9 = call i32 @fileno(%struct._IO_FILE* %5)
  %call10 = call i32 @_set_tty_settings(i32 %call9, %struct.termios* @sigstty)
  store i32 %call10, i32* %retval, align 4
  br label %return

if.end11:                                         ; preds = %if.end3
  store i32 1, i32* @tty_sigs_disabled, align 4
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end11, %if.then8, %if.then2, %if.then
  %6 = load i32, i32* %retval, align 4
  ret i32 %6
}

; Function Attrs: noinline nounwind
define internal i32 @_get_tty_settings(i32 %tty, %struct.termios* %tiop) #0 {
entry:
  %retval = alloca i32, align 4
  %tty.addr = alloca i32, align 4
  %tiop.addr = alloca %struct.termios*, align 4
  %ioctl_ret = alloca i32, align 4
  store i32 %tty, i32* %tty.addr, align 4
  store %struct.termios* %tiop, %struct.termios** %tiop.addr, align 4
  br label %while.body

while.body:                                       ; preds = %entry, %if.else
  %0 = load i32, i32* %tty.addr, align 4
  %1 = load %struct.termios*, %struct.termios** %tiop.addr, align 4
  %call = call i32 @tcgetattr(i32 %0, %struct.termios* %1)
  store i32 %call, i32* %ioctl_ret, align 4
  %2 = load i32, i32* %ioctl_ret, align 4
  %cmp = icmp slt i32 %2, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %while.body
  %call1 = call i32* @__errno_location()
  %3 = load i32, i32* %call1, align 4
  %cmp2 = icmp ne i32 %3, 4
  br i1 %cmp2, label %if.then3, label %if.else

if.then3:                                         ; preds = %if.then
  store i32 -1, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %if.then
  br label %while.body

if.end:                                           ; preds = %while.body
  %4 = load %struct.termios*, %struct.termios** %tiop.addr, align 4
  %c_lflag = getelementptr inbounds %struct.termios, %struct.termios* %4, i32 0, i32 3
  %5 = load i32, i32* %c_lflag, align 4
  %and = and i32 %5, 4096
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then4, label %if.end7

if.then4:                                         ; preds = %if.end
  call void (i8*, ...) @_rl_errmsg(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.2, i32 0, i32 0))
  %6 = load %struct.termios*, %struct.termios** %tiop.addr, align 4
  %c_lflag5 = getelementptr inbounds %struct.termios, %struct.termios* %6, i32 0, i32 3
  %7 = load i32, i32* %c_lflag5, align 4
  %and6 = and i32 %7, -4097
  store i32 %and6, i32* %c_lflag5, align 4
  br label %while.end

if.end7:                                          ; preds = %if.end
  br label %while.end

while.end:                                        ; preds = %if.end7, %if.then4
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %while.end, %if.then3
  %8 = load i32, i32* %retval, align 4
  ret i32 %8
}

; Function Attrs: noinline nounwind
define internal i32 @_set_tty_settings(i32 %tty, %struct.termios* %tiop) #0 {
entry:
  %retval = alloca i32, align 4
  %tty.addr = alloca i32, align 4
  %tiop.addr = alloca %struct.termios*, align 4
  store i32 %tty, i32* %tty.addr, align 4
  store %struct.termios* %tiop, %struct.termios** %tiop.addr, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end, %entry
  %0 = load i32, i32* %tty.addr, align 4
  %1 = load %struct.termios*, %struct.termios** %tiop.addr, align 4
  %call = call i32 @tcsetattr(i32 %0, i32 1, %struct.termios* %1)
  %cmp = icmp slt i32 %call, 0
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %call1 = call i32* @__errno_location()
  %2 = load i32, i32* %call1, align 4
  %cmp2 = icmp ne i32 %2, 4
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %while.body
  store i32 -1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %while.body
  %call3 = call i32* @__errno_location()
  store i32 0, i32* %call3, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %while.end, %if.then
  %3 = load i32, i32* %retval, align 4
  ret i32 %3
}

; Function Attrs: noinline nounwind
define i32 @_rl_restore_tty_signals() #0 {
entry:
  %retval = alloca i32, align 4
  %r = alloca i32, align 4
  %0 = load i32, i32* @tty_sigs_disabled, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @rl_instream, align 4
  %call = call i32 @fileno(%struct._IO_FILE* %1)
  %call1 = call i32 @_set_tty_settings(i32 %call, %struct.termios* @sigstty)
  store i32 %call1, i32* %r, align 4
  %2 = load i32, i32* %r, align 4
  %cmp2 = icmp eq i32 %2, 0
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  store i32 0, i32* @tty_sigs_disabled, align 4
  br label %if.end4

if.end4:                                          ; preds = %if.then3, %if.end
  %3 = load i32, i32* %r, align 4
  store i32 %3, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end4, %if.then
  %4 = load i32, i32* %retval, align 4
  ret i32 %4
}

; Function Attrs: noinline nounwind
define internal void @set_winsize(i32 %tty) #0 {
entry:
  %tty.addr = alloca i32, align 4
  %w = alloca %struct.winsize, align 2
  store i32 %tty, i32* %tty.addr, align 4
  %0 = load i32, i32* %tty.addr, align 4
  %call = call i32 (i32, i32, ...) @ioctl(i32 %0, i32 21523, %struct.winsize* %w)
  %cmp = icmp eq i32 %call, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %tty.addr, align 4
  %call1 = call i32 (i32, i32, ...) @ioctl(i32 %1, i32 21524, %struct.winsize* %w)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

declare i32 @ioctl(i32, i32, ...) #1

; Function Attrs: noinline nounwind
define internal void @set_special_char(%struct._keymap_entry* %kmap, %struct.termios* %tiop, i32 %sc, i32 (i32, i32)* %func) #0 {
entry:
  %kmap.addr = alloca %struct._keymap_entry*, align 4
  %tiop.addr = alloca %struct.termios*, align 4
  %sc.addr = alloca i32, align 4
  %func.addr = alloca i32 (i32, i32)*, align 4
  %uc = alloca i8, align 1
  store %struct._keymap_entry* %kmap, %struct._keymap_entry** %kmap.addr, align 4
  store %struct.termios* %tiop, %struct.termios** %tiop.addr, align 4
  store i32 %sc, i32* %sc.addr, align 4
  store i32 (i32, i32)* %func, i32 (i32, i32)** %func.addr, align 4
  %0 = load %struct.termios*, %struct.termios** %tiop.addr, align 4
  %c_cc = getelementptr inbounds %struct.termios, %struct.termios* %0, i32 0, i32 5
  %1 = load i32, i32* %sc.addr, align 4
  %arrayidx = getelementptr inbounds [32 x i8], [32 x i8]* %c_cc, i32 0, i32 %1
  %2 = load i8, i8* %arrayidx, align 1
  store i8 %2, i8* %uc, align 1
  %3 = load i8, i8* %uc, align 1
  %conv = zext i8 %3 to i32
  %cmp = icmp ne i32 %conv, 0
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %4 = load %struct._keymap_entry*, %struct._keymap_entry** %kmap.addr, align 4
  %5 = load i8, i8* %uc, align 1
  %idxprom = zext i8 %5 to i32
  %arrayidx2 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %4, i32 %idxprom
  %type = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx2, i32 0, i32 0
  %6 = load i8, i8* %type, align 4
  %conv3 = sext i8 %6 to i32
  %cmp4 = icmp eq i32 %conv3, 0
  br i1 %cmp4, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %7 = load i32 (i32, i32)*, i32 (i32, i32)** %func.addr, align 4
  %8 = load %struct._keymap_entry*, %struct._keymap_entry** %kmap.addr, align 4
  %9 = load i8, i8* %uc, align 1
  %idxprom6 = zext i8 %9 to i32
  %arrayidx7 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %8, i32 %idxprom6
  %function = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx7, i32 0, i32 1
  store i32 (i32, i32)* %7, i32 (i32, i32)** %function, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  ret void
}

declare i32 @rl_rubout(i32, i32) #1

declare i32 @rl_unix_line_discard(i32, i32) #1

declare i32 @rl_quoted_insert(i32, i32) #1

declare i32 @rl_vi_unix_word_rubout(i32, i32) #1

declare i32 @rl_unix_word_rubout(i32, i32) #1

declare i32 @tcgetattr(i32, %struct.termios*) #1

declare void @_rl_errmsg(i8*, ...) #1

declare i32 @tcsetattr(i32, i32, %struct.termios*) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
