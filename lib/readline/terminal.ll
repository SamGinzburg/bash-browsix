; ModuleID = 'terminal.c'
source_filename = "terminal.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct._IO_FILE = type opaque
%struct._keymap_entry = type { i8, i32 (i32, i32)* }
%struct._tc_string = type { i8*, i8** }
%struct.winsize = type { i16, i16, i16, i16 }

@rl_prefer_env_winsize = global i32 0, align 4
@rl_change_environment = global i32 1, align 4
@_rl_terminal_can_insert = global i32 0, align 4
@_rl_term_autowrap = global i32 -1, align 4
@_rl_enable_meta = global i32 1, align 4
@_rl_screenwidth = common global i32 0, align 4
@_rl_screenheight = common global i32 0, align 4
@.str = private unnamed_addr constant [8 x i8] c"COLUMNS\00", align 1
@term_string_buffer = internal global i8* null, align 4
@.str.1 = private unnamed_addr constant [3 x i8] c"co\00", align 1
@.str.2 = private unnamed_addr constant [6 x i8] c"LINES\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"li\00", align 1
@_rl_screenchars = common global i32 0, align 4
@rl_terminal_name = external global i8*, align 4
@rl_instream = external global %struct._IO_FILE*, align 4
@_rl_echoing_p = external global i32, align 4
@rl_redisplay_function = external global void ()*, align 4
@rl_readline_state = external global i32, align 4
@.str.4 = private unnamed_addr constant [5 x i8] c"TERM\00", align 1
@_rl_term_clreol = common global i8* null, align 4
@_rl_term_cr = common global i8* null, align 4
@_rl_term_clrpag = common global i8* null, align 4
@.str.5 = private unnamed_addr constant [5 x i8] c"dumb\00", align 1
@term_buffer = internal global i8* null, align 4
@.str.6 = private unnamed_addr constant [2 x i8] c"\0D\00", align 1
@_rl_term_IC = common global i8* null, align 4
@_rl_term_ic = common global i8* null, align 4
@_rl_term_ei = common global i8* null, align 4
@_rl_term_im = common global i8* null, align 4
@_rl_visible_bell = internal global i8* null, align 4
@_rl_term_DC = common global i8* null, align 4
@_rl_term_dc = common global i8* null, align 4
@_rl_term_up = common global i8* null, align 4
@_rl_term_kr = internal global i8* null, align 4
@_rl_term_kl = internal global i8* null, align 4
@_rl_term_kd = internal global i8* null, align 4
@_rl_term_ku = internal global i8* null, align 4
@_rl_term_kD = internal global i8* null, align 4
@_rl_term_kI = internal global i8* null, align 4
@_rl_term_kH = internal global i8* null, align 4
@_rl_term_kh = internal global i8* null, align 4
@_rl_term_at7 = internal global i8* null, align 4
@_rl_term_ke = internal global i8* null, align 4
@_rl_term_ks = internal global i8* null, align 4
@_rl_term_mo = internal global i8* null, align 4
@_rl_term_mm = internal global i8* null, align 4
@_rl_term_vs = internal global i8* null, align 4
@_rl_term_ve = internal global i8* null, align 4
@_rl_term_forward_char = common global i8* null, align 4
@term_has_meta = internal global i32 0, align 4
@PC = common global i8 0, align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"\08\00", align 1
@_rl_term_backspace = common global i8* null, align 4
@BC = common global i8* null, align 4
@UP = common global i8* null, align 4
@_rl_term_pc = common global i8* null, align 4
@.str.8 = private unnamed_addr constant [3 x i8] c"am\00", align 1
@.str.9 = private unnamed_addr constant [3 x i8] c"xn\00", align 1
@.str.10 = private unnamed_addr constant [3 x i8] c"km\00", align 1
@emacs_standard_keymap = external global [257 x %struct._keymap_entry], align 4
@vi_movement_keymap = external global [257 x %struct._keymap_entry], align 4
@vi_insertion_keymap = external global [257 x %struct._keymap_entry], align 4
@tcap_initialized = internal global i32 0, align 4
@tc_strings = internal constant [29 x %struct._tc_string] [%struct._tc_string { i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.12, i32 0, i32 0), i8** @_rl_term_at7 }, %struct._tc_string { i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.13, i32 0, i32 0), i8** @_rl_term_DC }, %struct._tc_string { i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.14, i32 0, i32 0), i8** @_rl_term_IC }, %struct._tc_string { i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.15, i32 0, i32 0), i8** @_rl_term_clreol }, %struct._tc_string { i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.16, i32 0, i32 0), i8** @_rl_term_clrpag }, %struct._tc_string { i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.17, i32 0, i32 0), i8** @_rl_term_cr }, %struct._tc_string { i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.18, i32 0, i32 0), i8** @_rl_term_dc }, %struct._tc_string { i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.19, i32 0, i32 0), i8** @_rl_term_ei }, %struct._tc_string { i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.20, i32 0, i32 0), i8** @_rl_term_ic }, %struct._tc_string { i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.21, i32 0, i32 0), i8** @_rl_term_im }, %struct._tc_string { i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.22, i32 0, i32 0), i8** @_rl_term_kD }, %struct._tc_string { i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.23, i32 0, i32 0), i8** @_rl_term_kH }, %struct._tc_string { i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.24, i32 0, i32 0), i8** @_rl_term_kI }, %struct._tc_string { i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.25, i32 0, i32 0), i8** @_rl_term_kd }, %struct._tc_string { i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.26, i32 0, i32 0), i8** @_rl_term_ke }, %struct._tc_string { i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.27, i32 0, i32 0), i8** @_rl_term_kh }, %struct._tc_string { i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.28, i32 0, i32 0), i8** @_rl_term_kl }, %struct._tc_string { i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.29, i32 0, i32 0), i8** @_rl_term_kr }, %struct._tc_string { i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.30, i32 0, i32 0), i8** @_rl_term_ks }, %struct._tc_string { i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.31, i32 0, i32 0), i8** @_rl_term_ku }, %struct._tc_string { i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.32, i32 0, i32 0), i8** @_rl_term_backspace }, %struct._tc_string { i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.33, i32 0, i32 0), i8** @_rl_term_mm }, %struct._tc_string { i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.34, i32 0, i32 0), i8** @_rl_term_mo }, %struct._tc_string { i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.35, i32 0, i32 0), i8** @_rl_term_forward_char }, %struct._tc_string { i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.36, i32 0, i32 0), i8** @_rl_term_pc }, %struct._tc_string { i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.37, i32 0, i32 0), i8** @_rl_term_up }, %struct._tc_string { i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.38, i32 0, i32 0), i8** @_rl_visible_bell }, %struct._tc_string { i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.39, i32 0, i32 0), i8** @_rl_term_vs }, %struct._tc_string { i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.40, i32 0, i32 0), i8** @_rl_term_ve }], align 4
@_rl_out_stream = external global %struct._IO_FILE*, align 4
@_rl_bell_preference = external global i32, align 4
@stderr = external constant %struct._IO_FILE*, align 4
@.str.11 = private unnamed_addr constant [2 x i8] c"\07\00", align 1
@enabled_meta = internal global i32 0, align 4
@rl_insert_mode = external global i32, align 4
@_rl_term_goto = common global i8* null, align 4
@_rl_term_ip = common global i8* null, align 4
@_rl_enable_keypad = common global i32 0, align 4
@_rl_keymap = external global %struct._keymap_entry*, align 4
@.str.12 = private unnamed_addr constant [3 x i8] c"@7\00", align 1
@.str.13 = private unnamed_addr constant [3 x i8] c"DC\00", align 1
@.str.14 = private unnamed_addr constant [3 x i8] c"IC\00", align 1
@.str.15 = private unnamed_addr constant [3 x i8] c"ce\00", align 1
@.str.16 = private unnamed_addr constant [3 x i8] c"cl\00", align 1
@.str.17 = private unnamed_addr constant [3 x i8] c"cr\00", align 1
@.str.18 = private unnamed_addr constant [3 x i8] c"dc\00", align 1
@.str.19 = private unnamed_addr constant [3 x i8] c"ei\00", align 1
@.str.20 = private unnamed_addr constant [3 x i8] c"ic\00", align 1
@.str.21 = private unnamed_addr constant [3 x i8] c"im\00", align 1
@.str.22 = private unnamed_addr constant [3 x i8] c"kD\00", align 1
@.str.23 = private unnamed_addr constant [3 x i8] c"kH\00", align 1
@.str.24 = private unnamed_addr constant [3 x i8] c"kI\00", align 1
@.str.25 = private unnamed_addr constant [3 x i8] c"kd\00", align 1
@.str.26 = private unnamed_addr constant [3 x i8] c"ke\00", align 1
@.str.27 = private unnamed_addr constant [3 x i8] c"kh\00", align 1
@.str.28 = private unnamed_addr constant [3 x i8] c"kl\00", align 1
@.str.29 = private unnamed_addr constant [3 x i8] c"kr\00", align 1
@.str.30 = private unnamed_addr constant [3 x i8] c"ks\00", align 1
@.str.31 = private unnamed_addr constant [3 x i8] c"ku\00", align 1
@.str.32 = private unnamed_addr constant [3 x i8] c"le\00", align 1
@.str.33 = private unnamed_addr constant [3 x i8] c"mm\00", align 1
@.str.34 = private unnamed_addr constant [3 x i8] c"mo\00", align 1
@.str.35 = private unnamed_addr constant [3 x i8] c"nd\00", align 1
@.str.36 = private unnamed_addr constant [3 x i8] c"pc\00", align 1
@.str.37 = private unnamed_addr constant [3 x i8] c"up\00", align 1
@.str.38 = private unnamed_addr constant [3 x i8] c"vb\00", align 1
@.str.39 = private unnamed_addr constant [3 x i8] c"vs\00", align 1
@.str.40 = private unnamed_addr constant [3 x i8] c"ve\00", align 1

; Function Attrs: noinline nounwind
define void @_rl_get_screen_size(i32 %tty, i32 %ignore_env) #0 {
entry:
  %tty.addr = alloca i32, align 4
  %ignore_env.addr = alloca i32, align 4
  %ss = alloca i8*, align 4
  %window_size = alloca %struct.winsize, align 2
  %wr = alloca i32, align 4
  %wc = alloca i32, align 4
  store i32 %tty, i32* %tty.addr, align 4
  store i32 %ignore_env, i32* %ignore_env.addr, align 4
  store i32 -1, i32* %wc, align 4
  store i32 -1, i32* %wr, align 4
  %0 = load i32, i32* %tty.addr, align 4
  %call = call i32 (i32, i32, ...) @ioctl(i32 %0, i32 21523, %struct.winsize* %window_size)
  %cmp = icmp eq i32 %call, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %ws_col = getelementptr inbounds %struct.winsize, %struct.winsize* %window_size, i32 0, i32 1
  %1 = load i16, i16* %ws_col, align 2
  %conv = zext i16 %1 to i32
  store i32 %conv, i32* %wc, align 4
  %ws_row = getelementptr inbounds %struct.winsize, %struct.winsize* %window_size, i32 0, i32 0
  %2 = load i16, i16* %ws_row, align 2
  %conv1 = zext i16 %2 to i32
  store i32 %conv1, i32* %wr, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %3 = load i32, i32* %ignore_env.addr, align 4
  %tobool = icmp ne i32 %3, 0
  br i1 %tobool, label %if.then4, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end
  %4 = load i32, i32* @rl_prefer_env_winsize, align 4
  %cmp2 = icmp eq i32 %4, 0
  br i1 %cmp2, label %if.then4, label %if.else

if.then4:                                         ; preds = %lor.lhs.false, %if.end
  %5 = load i32, i32* %wc, align 4
  store i32 %5, i32* @_rl_screenwidth, align 4
  %6 = load i32, i32* %wr, align 4
  store i32 %6, i32* @_rl_screenheight, align 4
  br label %if.end5

if.else:                                          ; preds = %lor.lhs.false
  store i32 -1, i32* @_rl_screenheight, align 4
  store i32 -1, i32* @_rl_screenwidth, align 4
  br label %if.end5

if.end5:                                          ; preds = %if.else, %if.then4
  %7 = load i32, i32* @_rl_screenwidth, align 4
  %cmp6 = icmp sle i32 %7, 0
  br i1 %cmp6, label %if.then8, label %if.end27

if.then8:                                         ; preds = %if.end5
  %8 = load i32, i32* %ignore_env.addr, align 4
  %cmp9 = icmp eq i32 %8, 0
  br i1 %cmp9, label %land.lhs.true, label %if.end15

land.lhs.true:                                    ; preds = %if.then8
  %call11 = call i8* @sh_get_env_value(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0))
  store i8* %call11, i8** %ss, align 4
  %tobool12 = icmp ne i8* %call11, null
  br i1 %tobool12, label %if.then13, label %if.end15

if.then13:                                        ; preds = %land.lhs.true
  %9 = load i8*, i8** %ss, align 4
  %call14 = call i32 @atoi(i8* %9)
  store i32 %call14, i32* @_rl_screenwidth, align 4
  br label %if.end15

if.end15:                                         ; preds = %if.then13, %land.lhs.true, %if.then8
  %10 = load i32, i32* @_rl_screenwidth, align 4
  %cmp16 = icmp sle i32 %10, 0
  br i1 %cmp16, label %if.then18, label %if.end19

if.then18:                                        ; preds = %if.end15
  %11 = load i32, i32* %wc, align 4
  store i32 %11, i32* @_rl_screenwidth, align 4
  br label %if.end19

if.end19:                                         ; preds = %if.then18, %if.end15
  %12 = load i32, i32* @_rl_screenwidth, align 4
  %cmp20 = icmp sle i32 %12, 0
  br i1 %cmp20, label %land.lhs.true22, label %if.end26

land.lhs.true22:                                  ; preds = %if.end19
  %13 = load i8*, i8** @term_string_buffer, align 4
  %tobool23 = icmp ne i8* %13, null
  br i1 %tobool23, label %if.then24, label %if.end26

if.then24:                                        ; preds = %land.lhs.true22
  %call25 = call i32 bitcast (i32 (...)* @tgetnum to i32 (i8*)*)(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i32 0, i32 0))
  store i32 %call25, i32* @_rl_screenwidth, align 4
  br label %if.end26

if.end26:                                         ; preds = %if.then24, %land.lhs.true22, %if.end19
  br label %if.end27

if.end27:                                         ; preds = %if.end26, %if.end5
  %14 = load i32, i32* @_rl_screenheight, align 4
  %cmp28 = icmp sle i32 %14, 0
  br i1 %cmp28, label %if.then30, label %if.end50

if.then30:                                        ; preds = %if.end27
  %15 = load i32, i32* %ignore_env.addr, align 4
  %cmp31 = icmp eq i32 %15, 0
  br i1 %cmp31, label %land.lhs.true33, label %if.end38

land.lhs.true33:                                  ; preds = %if.then30
  %call34 = call i8* @sh_get_env_value(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i32 0, i32 0))
  store i8* %call34, i8** %ss, align 4
  %tobool35 = icmp ne i8* %call34, null
  br i1 %tobool35, label %if.then36, label %if.end38

if.then36:                                        ; preds = %land.lhs.true33
  %16 = load i8*, i8** %ss, align 4
  %call37 = call i32 @atoi(i8* %16)
  store i32 %call37, i32* @_rl_screenheight, align 4
  br label %if.end38

if.end38:                                         ; preds = %if.then36, %land.lhs.true33, %if.then30
  %17 = load i32, i32* @_rl_screenheight, align 4
  %cmp39 = icmp sle i32 %17, 0
  br i1 %cmp39, label %if.then41, label %if.end42

if.then41:                                        ; preds = %if.end38
  %18 = load i32, i32* %wr, align 4
  store i32 %18, i32* @_rl_screenheight, align 4
  br label %if.end42

if.end42:                                         ; preds = %if.then41, %if.end38
  %19 = load i32, i32* @_rl_screenheight, align 4
  %cmp43 = icmp sle i32 %19, 0
  br i1 %cmp43, label %land.lhs.true45, label %if.end49

land.lhs.true45:                                  ; preds = %if.end42
  %20 = load i8*, i8** @term_string_buffer, align 4
  %tobool46 = icmp ne i8* %20, null
  br i1 %tobool46, label %if.then47, label %if.end49

if.then47:                                        ; preds = %land.lhs.true45
  %call48 = call i32 bitcast (i32 (...)* @tgetnum to i32 (i8*)*)(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i32 0, i32 0))
  store i32 %call48, i32* @_rl_screenheight, align 4
  br label %if.end49

if.end49:                                         ; preds = %if.then47, %land.lhs.true45, %if.end42
  br label %if.end50

if.end50:                                         ; preds = %if.end49, %if.end27
  %21 = load i32, i32* @_rl_screenwidth, align 4
  %cmp51 = icmp sle i32 %21, 1
  br i1 %cmp51, label %if.then53, label %if.end54

if.then53:                                        ; preds = %if.end50
  store i32 80, i32* @_rl_screenwidth, align 4
  br label %if.end54

if.end54:                                         ; preds = %if.then53, %if.end50
  %22 = load i32, i32* @_rl_screenheight, align 4
  %cmp55 = icmp sle i32 %22, 0
  br i1 %cmp55, label %if.then57, label %if.end58

if.then57:                                        ; preds = %if.end54
  store i32 24, i32* @_rl_screenheight, align 4
  br label %if.end58

if.end58:                                         ; preds = %if.then57, %if.end54
  %23 = load i32, i32* @rl_change_environment, align 4
  %tobool59 = icmp ne i32 %23, 0
  br i1 %tobool59, label %if.then60, label %if.end61

if.then60:                                        ; preds = %if.end58
  %24 = load i32, i32* @_rl_screenheight, align 4
  %25 = load i32, i32* @_rl_screenwidth, align 4
  call void @sh_set_lines_and_columns(i32 %24, i32 %25)
  br label %if.end61

if.end61:                                         ; preds = %if.then60, %if.end58
  %26 = load i32, i32* @_rl_term_autowrap, align 4
  %cmp62 = icmp eq i32 %26, 0
  br i1 %cmp62, label %if.then64, label %if.end65

if.then64:                                        ; preds = %if.end61
  %27 = load i32, i32* @_rl_screenwidth, align 4
  %dec = add nsw i32 %27, -1
  store i32 %dec, i32* @_rl_screenwidth, align 4
  br label %if.end65

if.end65:                                         ; preds = %if.then64, %if.end61
  %28 = load i32, i32* @_rl_screenwidth, align 4
  %29 = load i32, i32* @_rl_screenheight, align 4
  %mul = mul nsw i32 %28, %29
  store i32 %mul, i32* @_rl_screenchars, align 4
  ret void
}

declare i32 @ioctl(i32, i32, ...) #1

declare i8* @sh_get_env_value(i8*) #1

declare i32 @atoi(i8*) #1

declare i32 @tgetnum(...) #1

declare void @sh_set_lines_and_columns(i32, i32) #1

; Function Attrs: noinline nounwind
define void @_rl_set_screen_size(i32 %rows, i32 %cols) #0 {
entry:
  %rows.addr = alloca i32, align 4
  %cols.addr = alloca i32, align 4
  store i32 %rows, i32* %rows.addr, align 4
  store i32 %cols, i32* %cols.addr, align 4
  %0 = load i32, i32* @_rl_term_autowrap, align 4
  %cmp = icmp eq i32 %0, -1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** @rl_terminal_name, align 4
  %call = call i32 @_rl_init_terminal_io(i8* %1)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %2 = load i32, i32* %rows.addr, align 4
  %cmp1 = icmp sgt i32 %2, 0
  br i1 %cmp1, label %if.then2, label %if.end3

if.then2:                                         ; preds = %if.end
  %3 = load i32, i32* %rows.addr, align 4
  store i32 %3, i32* @_rl_screenheight, align 4
  br label %if.end3

if.end3:                                          ; preds = %if.then2, %if.end
  %4 = load i32, i32* %cols.addr, align 4
  %cmp4 = icmp sgt i32 %4, 0
  br i1 %cmp4, label %if.then5, label %if.end9

if.then5:                                         ; preds = %if.end3
  %5 = load i32, i32* %cols.addr, align 4
  store i32 %5, i32* @_rl_screenwidth, align 4
  %6 = load i32, i32* @_rl_term_autowrap, align 4
  %cmp6 = icmp eq i32 %6, 0
  br i1 %cmp6, label %if.then7, label %if.end8

if.then7:                                         ; preds = %if.then5
  %7 = load i32, i32* @_rl_screenwidth, align 4
  %dec = add nsw i32 %7, -1
  store i32 %dec, i32* @_rl_screenwidth, align 4
  br label %if.end8

if.end8:                                          ; preds = %if.then7, %if.then5
  br label %if.end9

if.end9:                                          ; preds = %if.end8, %if.end3
  %8 = load i32, i32* %rows.addr, align 4
  %cmp10 = icmp sgt i32 %8, 0
  br i1 %cmp10, label %if.then12, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end9
  %9 = load i32, i32* %cols.addr, align 4
  %cmp11 = icmp sgt i32 %9, 0
  br i1 %cmp11, label %if.then12, label %if.end13

if.then12:                                        ; preds = %lor.lhs.false, %if.end9
  %10 = load i32, i32* @_rl_screenwidth, align 4
  %11 = load i32, i32* @_rl_screenheight, align 4
  %mul = mul nsw i32 %10, %11
  store i32 %mul, i32* @_rl_screenchars, align 4
  br label %if.end13

if.end13:                                         ; preds = %if.then12, %lor.lhs.false
  ret void
}

; Function Attrs: noinline nounwind
define i32 @_rl_init_terminal_io(i8* %terminal_name) #0 {
entry:
  %retval = alloca i32, align 4
  %terminal_name.addr = alloca i8*, align 4
  %term = alloca i8*, align 4
  %buffer = alloca i8*, align 4
  %tty = alloca i32, align 4
  %tgetent_ret = alloca i32, align 4
  store i8* %terminal_name, i8** %terminal_name.addr, align 4
  %0 = load i8*, i8** %terminal_name.addr, align 4
  %tobool = icmp ne i8* %0, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %1 = load i8*, i8** %terminal_name.addr, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  %call = call i8* @sh_get_env_value(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.4, i32 0, i32 0))
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %1, %cond.true ], [ %call, %cond.false ]
  store i8* %cond, i8** %term, align 4
  store i8* null, i8** @_rl_term_clreol, align 4
  store i8* null, i8** @_rl_term_cr, align 4
  store i8* null, i8** @_rl_term_clrpag, align 4
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @rl_instream, align 4
  %tobool1 = icmp ne %struct._IO_FILE* %2, null
  br i1 %tobool1, label %cond.true2, label %cond.false4

cond.true2:                                       ; preds = %cond.end
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @rl_instream, align 4
  %call3 = call i32 @fileno(%struct._IO_FILE* %3)
  br label %cond.end5

cond.false4:                                      ; preds = %cond.end
  br label %cond.end5

cond.end5:                                        ; preds = %cond.false4, %cond.true2
  %cond6 = phi i32 [ %call3, %cond.true2 ], [ 0, %cond.false4 ]
  store i32 %cond6, i32* %tty, align 4
  %4 = load i8*, i8** %term, align 4
  %cmp = icmp eq i8* %4, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %cond.end5
  store i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.5, i32 0, i32 0), i8** %term, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %cond.end5
  %5 = load void ()*, void ()** @rl_redisplay_function, align 4
  %cmp7 = icmp ne void ()* %5, @rl_redisplay
  br i1 %cmp7, label %if.then8, label %if.else

if.then8:                                         ; preds = %if.end
  store i32 -1, i32* %tgetent_ret, align 4
  br label %if.end18

if.else:                                          ; preds = %if.end
  %6 = load i8*, i8** @term_string_buffer, align 4
  %cmp9 = icmp eq i8* %6, null
  br i1 %cmp9, label %if.then10, label %if.end12

if.then10:                                        ; preds = %if.else
  %call11 = call i8* @xmalloc(i32 2032)
  store i8* %call11, i8** @term_string_buffer, align 4
  br label %if.end12

if.end12:                                         ; preds = %if.then10, %if.else
  %7 = load i8*, i8** @term_buffer, align 4
  %cmp13 = icmp eq i8* %7, null
  br i1 %cmp13, label %if.then14, label %if.end16

if.then14:                                        ; preds = %if.end12
  %call15 = call i8* @xmalloc(i32 4080)
  store i8* %call15, i8** @term_buffer, align 4
  br label %if.end16

if.end16:                                         ; preds = %if.then14, %if.end12
  %8 = load i8*, i8** @term_string_buffer, align 4
  store i8* %8, i8** %buffer, align 4
  %9 = load i8*, i8** @term_buffer, align 4
  %10 = load i8*, i8** %term, align 4
  %call17 = call i32 bitcast (i32 (...)* @tgetent to i32 (i8*, i8*)*)(i8* %9, i8* %10)
  store i32 %call17, i32* %tgetent_ret, align 4
  br label %if.end18

if.end18:                                         ; preds = %if.end16, %if.then8
  %11 = load i32, i32* %tgetent_ret, align 4
  %cmp19 = icmp sle i32 %11, 0
  br i1 %cmp19, label %if.then20, label %if.end36

if.then20:                                        ; preds = %if.end18
  %12 = load i8*, i8** @term_string_buffer, align 4
  %tobool21 = icmp ne i8* %12, null
  br i1 %tobool21, label %if.then22, label %if.end23

if.then22:                                        ; preds = %if.then20
  %13 = load i8*, i8** @term_string_buffer, align 4
  call void @free(i8* %13)
  br label %if.end23

if.end23:                                         ; preds = %if.then22, %if.then20
  %14 = load i8*, i8** @term_buffer, align 4
  %tobool24 = icmp ne i8* %14, null
  br i1 %tobool24, label %if.then25, label %if.end26

if.then25:                                        ; preds = %if.end23
  %15 = load i8*, i8** @term_buffer, align 4
  call void @free(i8* %15)
  br label %if.end26

if.end26:                                         ; preds = %if.then25, %if.end23
  store i8* null, i8** @term_string_buffer, align 4
  store i8* null, i8** @term_buffer, align 4
  store i8* null, i8** %buffer, align 4
  store i32 0, i32* @_rl_term_autowrap, align 4
  %16 = load i32, i32* @_rl_screenwidth, align 4
  %cmp27 = icmp sle i32 %16, 0
  br i1 %cmp27, label %if.then29, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end26
  %17 = load i32, i32* @_rl_screenheight, align 4
  %cmp28 = icmp sle i32 %17, 0
  br i1 %cmp28, label %if.then29, label %if.end30

if.then29:                                        ; preds = %lor.lhs.false, %if.end26
  %18 = load i32, i32* %tty, align 4
  call void @_rl_get_screen_size(i32 %18, i32 0)
  br label %if.end30

if.end30:                                         ; preds = %if.then29, %lor.lhs.false
  %19 = load i32, i32* @_rl_screenwidth, align 4
  %cmp31 = icmp sle i32 %19, 0
  br i1 %cmp31, label %if.then34, label %lor.lhs.false32

lor.lhs.false32:                                  ; preds = %if.end30
  %20 = load i32, i32* @_rl_screenheight, align 4
  %cmp33 = icmp sle i32 %20, 0
  br i1 %cmp33, label %if.then34, label %if.end35

if.then34:                                        ; preds = %lor.lhs.false32, %if.end30
  store i32 79, i32* @_rl_screenwidth, align 4
  store i32 24, i32* @_rl_screenheight, align 4
  br label %if.end35

if.end35:                                         ; preds = %if.then34, %lor.lhs.false32
  %21 = load i32, i32* @_rl_screenwidth, align 4
  %22 = load i32, i32* @_rl_screenheight, align 4
  %mul = mul nsw i32 %21, %22
  store i32 %mul, i32* @_rl_screenchars, align 4
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.6, i32 0, i32 0), i8** @_rl_term_cr, align 4
  store i8* null, i8** @_rl_term_IC, align 4
  store i8* null, i8** @_rl_term_ic, align 4
  store i8* null, i8** @_rl_term_ei, align 4
  store i8* null, i8** @_rl_term_im, align 4
  store i8* null, i8** @_rl_visible_bell, align 4
  store i8* null, i8** @_rl_term_DC, align 4
  store i8* null, i8** @_rl_term_dc, align 4
  store i8* null, i8** @_rl_term_up, align 4
  store i8* null, i8** @_rl_term_kr, align 4
  store i8* null, i8** @_rl_term_kl, align 4
  store i8* null, i8** @_rl_term_kd, align 4
  store i8* null, i8** @_rl_term_ku, align 4
  store i8* null, i8** @_rl_term_kD, align 4
  store i8* null, i8** @_rl_term_kI, align 4
  store i8* null, i8** @_rl_term_kH, align 4
  store i8* null, i8** @_rl_term_kh, align 4
  store i8* null, i8** @_rl_term_at7, align 4
  store i8* null, i8** @_rl_term_ke, align 4
  store i8* null, i8** @_rl_term_ks, align 4
  store i8* null, i8** @_rl_term_mo, align 4
  store i8* null, i8** @_rl_term_mm, align 4
  store i8* null, i8** @_rl_term_vs, align 4
  store i8* null, i8** @_rl_term_ve, align 4
  store i8* null, i8** @_rl_term_forward_char, align 4
  store i32 0, i32* @term_has_meta, align 4
  store i32 0, i32* @_rl_terminal_can_insert, align 4
  store i8 0, i8* @PC, align 1
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i32 0, i32 0), i8** @_rl_term_backspace, align 4
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i32 0, i32 0), i8** @BC, align 4
  %23 = load i8*, i8** @_rl_term_up, align 4
  store i8* %23, i8** @UP, align 4
  store i32 0, i32* %retval, align 4
  br label %return

if.end36:                                         ; preds = %if.end18
  call void @get_term_capabilities(i8** %buffer)
  %24 = load i8*, i8** @_rl_term_pc, align 4
  %tobool37 = icmp ne i8* %24, null
  br i1 %tobool37, label %cond.true38, label %cond.false39

cond.true38:                                      ; preds = %if.end36
  %25 = load i8*, i8** @_rl_term_pc, align 4
  %26 = load i8, i8* %25, align 1
  %conv = sext i8 %26 to i32
  br label %cond.end40

cond.false39:                                     ; preds = %if.end36
  br label %cond.end40

cond.end40:                                       ; preds = %cond.false39, %cond.true38
  %cond41 = phi i32 [ %conv, %cond.true38 ], [ 0, %cond.false39 ]
  %conv42 = trunc i32 %cond41 to i8
  store i8 %conv42, i8* @PC, align 1
  %27 = load i8*, i8** @_rl_term_backspace, align 4
  store i8* %27, i8** @BC, align 4
  %28 = load i8*, i8** @_rl_term_up, align 4
  store i8* %28, i8** @UP, align 4
  %29 = load i8*, i8** @_rl_term_cr, align 4
  %tobool43 = icmp ne i8* %29, null
  br i1 %tobool43, label %if.end45, label %if.then44

if.then44:                                        ; preds = %cond.end40
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.6, i32 0, i32 0), i8** @_rl_term_cr, align 4
  br label %if.end45

if.end45:                                         ; preds = %if.then44, %cond.end40
  %call46 = call i32 bitcast (i32 (...)* @tgetflag to i32 (i8*)*)(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i32 0, i32 0))
  %tobool47 = icmp ne i32 %call46, 0
  br i1 %tobool47, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %if.end45
  %call48 = call i32 bitcast (i32 (...)* @tgetflag to i32 (i8*)*)(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i32 0, i32 0))
  %tobool49 = icmp ne i32 %call48, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %if.end45
  %30 = phi i1 [ false, %if.end45 ], [ %tobool49, %land.rhs ]
  %land.ext = zext i1 %30 to i32
  store i32 %land.ext, i32* @_rl_term_autowrap, align 4
  %31 = load i32, i32* @_rl_screenwidth, align 4
  %cmp50 = icmp sle i32 %31, 0
  br i1 %cmp50, label %if.then55, label %lor.lhs.false52

lor.lhs.false52:                                  ; preds = %land.end
  %32 = load i32, i32* @_rl_screenheight, align 4
  %cmp53 = icmp sle i32 %32, 0
  br i1 %cmp53, label %if.then55, label %if.end56

if.then55:                                        ; preds = %lor.lhs.false52, %land.end
  %33 = load i32, i32* %tty, align 4
  call void @_rl_get_screen_size(i32 %33, i32 0)
  br label %if.end56

if.end56:                                         ; preds = %if.then55, %lor.lhs.false52
  %34 = load i8*, i8** @_rl_term_IC, align 4
  %tobool57 = icmp ne i8* %34, null
  br i1 %tobool57, label %lor.end, label %lor.lhs.false58

lor.lhs.false58:                                  ; preds = %if.end56
  %35 = load i8*, i8** @_rl_term_im, align 4
  %tobool59 = icmp ne i8* %35, null
  br i1 %tobool59, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %lor.lhs.false58
  %36 = load i8*, i8** @_rl_term_ic, align 4
  %tobool60 = icmp ne i8* %36, null
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %lor.lhs.false58, %if.end56
  %37 = phi i1 [ true, %lor.lhs.false58 ], [ true, %if.end56 ], [ %tobool60, %lor.rhs ]
  %lor.ext = zext i1 %37 to i32
  store i32 %lor.ext, i32* @_rl_terminal_can_insert, align 4
  %call61 = call i32 bitcast (i32 (...)* @tgetflag to i32 (i8*)*)(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.10, i32 0, i32 0))
  %cmp62 = icmp ne i32 %call61, 0
  %conv63 = zext i1 %cmp62 to i32
  store i32 %conv63, i32* @term_has_meta, align 4
  %38 = load i32, i32* @term_has_meta, align 4
  %cmp64 = icmp eq i32 %38, 0
  br i1 %cmp64, label %if.then66, label %if.end67

if.then66:                                        ; preds = %lor.end
  store i8* null, i8** @_rl_term_mo, align 4
  store i8* null, i8** @_rl_term_mm, align 4
  br label %if.end67

if.end67:                                         ; preds = %if.then66, %lor.end
  call void @bind_termcap_arrow_keys(%struct._keymap_entry* getelementptr inbounds ([257 x %struct._keymap_entry], [257 x %struct._keymap_entry]* @emacs_standard_keymap, i32 0, i32 0))
  call void @bind_termcap_arrow_keys(%struct._keymap_entry* getelementptr inbounds ([257 x %struct._keymap_entry], [257 x %struct._keymap_entry]* @vi_movement_keymap, i32 0, i32 0))
  call void @bind_termcap_arrow_keys(%struct._keymap_entry* getelementptr inbounds ([257 x %struct._keymap_entry], [257 x %struct._keymap_entry]* @vi_insertion_keymap, i32 0, i32 0))
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end67, %if.end35
  %39 = load i32, i32* %retval, align 4
  ret i32 %39
}

; Function Attrs: noinline nounwind
define void @rl_set_screen_size(i32 %rows, i32 %cols) #0 {
entry:
  %rows.addr = alloca i32, align 4
  %cols.addr = alloca i32, align 4
  store i32 %rows, i32* %rows.addr, align 4
  store i32 %cols, i32* %cols.addr, align 4
  %0 = load i32, i32* %rows.addr, align 4
  %1 = load i32, i32* %cols.addr, align 4
  call void @_rl_set_screen_size(i32 %0, i32 %1)
  ret void
}

; Function Attrs: noinline nounwind
define void @rl_get_screen_size(i32* %rows, i32* %cols) #0 {
entry:
  %rows.addr = alloca i32*, align 4
  %cols.addr = alloca i32*, align 4
  store i32* %rows, i32** %rows.addr, align 4
  store i32* %cols, i32** %cols.addr, align 4
  %0 = load i32*, i32** %rows.addr, align 4
  %tobool = icmp ne i32* %0, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i32, i32* @_rl_screenheight, align 4
  %2 = load i32*, i32** %rows.addr, align 4
  store i32 %1, i32* %2, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %3 = load i32*, i32** %cols.addr, align 4
  %tobool1 = icmp ne i32* %3, null
  br i1 %tobool1, label %if.then2, label %if.end3

if.then2:                                         ; preds = %if.end
  %4 = load i32, i32* @_rl_screenwidth, align 4
  %5 = load i32*, i32** %cols.addr, align 4
  store i32 %4, i32* %5, align 4
  br label %if.end3

if.end3:                                          ; preds = %if.then2, %if.end
  ret void
}

; Function Attrs: noinline nounwind
define void @rl_reset_screen_size() #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @rl_instream, align 4
  %call = call i32 @fileno(%struct._IO_FILE* %0)
  call void @_rl_get_screen_size(i32 %call, i32 0)
  ret void
}

declare i32 @fileno(%struct._IO_FILE*) #1

; Function Attrs: noinline nounwind
define void @_rl_sigwinch_resize_terminal() #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @rl_instream, align 4
  %call = call i32 @fileno(%struct._IO_FILE* %0)
  call void @_rl_get_screen_size(i32 %call, i32 1)
  ret void
}

; Function Attrs: noinline nounwind
define void @rl_resize_terminal() #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @rl_instream, align 4
  %call = call i32 @fileno(%struct._IO_FILE* %0)
  call void @_rl_get_screen_size(i32 %call, i32 1)
  %1 = load i32, i32* @_rl_echoing_p, align 4
  %tobool = icmp ne i32 %1, 0
  br i1 %tobool, label %if.then, label %if.end6

if.then:                                          ; preds = %entry
  %2 = load void ()*, void ()** @rl_redisplay_function, align 4
  %cmp = icmp ne void ()* %2, @rl_redisplay
  br i1 %cmp, label %if.then1, label %if.else

if.then1:                                         ; preds = %if.then
  %call2 = call i32 @rl_forced_update_display()
  br label %if.end5

if.else:                                          ; preds = %if.then
  %3 = load i32, i32* @rl_readline_state, align 4
  %and = and i32 %3, 16777216
  %cmp3 = icmp eq i32 %and, 0
  br i1 %cmp3, label %if.then4, label %if.end

if.then4:                                         ; preds = %if.else
  call void @_rl_redisplay_after_sigwinch()
  br label %if.end

if.end:                                           ; preds = %if.then4, %if.else
  br label %if.end5

if.end5:                                          ; preds = %if.end, %if.then1
  br label %if.end6

if.end6:                                          ; preds = %if.end5, %entry
  ret void
}

declare void @rl_redisplay() #1

declare i32 @rl_forced_update_display() #1

declare void @_rl_redisplay_after_sigwinch() #1

declare i8* @xmalloc(i32) #1

declare i32 @tgetent(...) #1

declare void @free(i8*) #1

; Function Attrs: noinline nounwind
define internal void @get_term_capabilities(i8** %bp) #0 {
entry:
  %bp.addr = alloca i8**, align 4
  %i = alloca i32, align 4
  store i8** %bp, i8*** %bp.addr, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %cmp = icmp ult i32 %0, 29
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds [29 x %struct._tc_string], [29 x %struct._tc_string]* @tc_strings, i32 0, i32 %1
  %tc_var = getelementptr inbounds %struct._tc_string, %struct._tc_string* %arrayidx, i32 0, i32 0
  %2 = load i8*, i8** %tc_var, align 4
  %3 = load i8**, i8*** %bp.addr, align 4
  %call = call i8* bitcast (i8* (...)* @tgetstr to i8* (i8*, i8**)*)(i8* %2, i8** %3)
  %4 = load i32, i32* %i, align 4
  %arrayidx1 = getelementptr inbounds [29 x %struct._tc_string], [29 x %struct._tc_string]* @tc_strings, i32 0, i32 %4
  %tc_value = getelementptr inbounds %struct._tc_string, %struct._tc_string* %arrayidx1, i32 0, i32 1
  %5 = load i8**, i8*** %tc_value, align 4
  store i8* %call, i8** %5, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4
  %inc = add nsw i32 %6, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 1, i32* @tcap_initialized, align 4
  ret void
}

declare i32 @tgetflag(...) #1

; Function Attrs: noinline nounwind
define internal void @bind_termcap_arrow_keys(%struct._keymap_entry* %map) #0 {
entry:
  %map.addr = alloca %struct._keymap_entry*, align 4
  %xkeymap = alloca %struct._keymap_entry*, align 4
  store %struct._keymap_entry* %map, %struct._keymap_entry** %map.addr, align 4
  %0 = load %struct._keymap_entry*, %struct._keymap_entry** @_rl_keymap, align 4
  store %struct._keymap_entry* %0, %struct._keymap_entry** %xkeymap, align 4
  %1 = load %struct._keymap_entry*, %struct._keymap_entry** %map.addr, align 4
  store %struct._keymap_entry* %1, %struct._keymap_entry** @_rl_keymap, align 4
  %2 = load i8*, i8** @_rl_term_ku, align 4
  %call = call i32 @rl_bind_keyseq_if_unbound(i8* %2, i32 (i32, i32)* @rl_get_previous_history)
  %3 = load i8*, i8** @_rl_term_kd, align 4
  %call1 = call i32 @rl_bind_keyseq_if_unbound(i8* %3, i32 (i32, i32)* @rl_get_next_history)
  %4 = load i8*, i8** @_rl_term_kr, align 4
  %call2 = call i32 @rl_bind_keyseq_if_unbound(i8* %4, i32 (i32, i32)* @rl_forward_char)
  %5 = load i8*, i8** @_rl_term_kl, align 4
  %call3 = call i32 @rl_bind_keyseq_if_unbound(i8* %5, i32 (i32, i32)* @rl_backward_char)
  %6 = load i8*, i8** @_rl_term_kh, align 4
  %call4 = call i32 @rl_bind_keyseq_if_unbound(i8* %6, i32 (i32, i32)* @rl_beg_of_line)
  %7 = load i8*, i8** @_rl_term_at7, align 4
  %call5 = call i32 @rl_bind_keyseq_if_unbound(i8* %7, i32 (i32, i32)* @rl_end_of_line)
  %8 = load i8*, i8** @_rl_term_kD, align 4
  %call6 = call i32 @rl_bind_keyseq_if_unbound(i8* %8, i32 (i32, i32)* @rl_delete)
  %9 = load %struct._keymap_entry*, %struct._keymap_entry** %xkeymap, align 4
  store %struct._keymap_entry* %9, %struct._keymap_entry** @_rl_keymap, align 4
  ret void
}

; Function Attrs: noinline nounwind
define i8* @rl_get_termcap(i8* %cap) #0 {
entry:
  %retval = alloca i8*, align 4
  %cap.addr = alloca i8*, align 4
  %i = alloca i32, align 4
  store i8* %cap, i8** %cap.addr, align 4
  %0 = load i32, i32* @tcap_initialized, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i8* null, i8** %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i32, i32* %i, align 4
  %cmp1 = icmp ult i32 %1, 29
  br i1 %cmp1, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds [29 x %struct._tc_string], [29 x %struct._tc_string]* @tc_strings, i32 0, i32 %2
  %tc_var = getelementptr inbounds %struct._tc_string, %struct._tc_string* %arrayidx, i32 0, i32 0
  %3 = load i8*, i8** %tc_var, align 4
  %arrayidx2 = getelementptr inbounds i8, i8* %3, i32 0
  %4 = load i8, i8* %arrayidx2, align 1
  %conv = sext i8 %4 to i32
  %5 = load i8*, i8** %cap.addr, align 4
  %arrayidx3 = getelementptr inbounds i8, i8* %5, i32 0
  %6 = load i8, i8* %arrayidx3, align 1
  %conv4 = sext i8 %6 to i32
  %cmp5 = icmp eq i32 %conv, %conv4
  br i1 %cmp5, label %land.lhs.true, label %if.end13

land.lhs.true:                                    ; preds = %for.body
  %7 = load i32, i32* %i, align 4
  %arrayidx7 = getelementptr inbounds [29 x %struct._tc_string], [29 x %struct._tc_string]* @tc_strings, i32 0, i32 %7
  %tc_var8 = getelementptr inbounds %struct._tc_string, %struct._tc_string* %arrayidx7, i32 0, i32 0
  %8 = load i8*, i8** %tc_var8, align 4
  %9 = load i8*, i8** %cap.addr, align 4
  %call = call i32 @strcmp(i8* %8, i8* %9)
  %cmp9 = icmp eq i32 %call, 0
  br i1 %cmp9, label %if.then11, label %if.end13

if.then11:                                        ; preds = %land.lhs.true
  %10 = load i32, i32* %i, align 4
  %arrayidx12 = getelementptr inbounds [29 x %struct._tc_string], [29 x %struct._tc_string]* @tc_strings, i32 0, i32 %10
  %tc_value = getelementptr inbounds %struct._tc_string, %struct._tc_string* %arrayidx12, i32 0, i32 1
  %11 = load i8**, i8*** %tc_value, align 4
  %12 = load i8*, i8** %11, align 4
  store i8* %12, i8** %retval, align 4
  br label %return

if.end13:                                         ; preds = %land.lhs.true, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end13
  %13 = load i32, i32* %i, align 4
  %inc = add nsw i32 %13, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i8* null, i8** %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then11, %if.then
  %14 = load i8*, i8** %retval, align 4
  ret i8* %14
}

declare i32 @strcmp(i8*, i8*) #1

; Function Attrs: noinline nounwind
define i32 @rl_reset_terminal(i8* %terminal_name) #0 {
entry:
  %terminal_name.addr = alloca i8*, align 4
  store i8* %terminal_name, i8** %terminal_name.addr, align 4
  store i32 0, i32* @_rl_screenheight, align 4
  store i32 0, i32* @_rl_screenwidth, align 4
  %0 = load i8*, i8** %terminal_name.addr, align 4
  %call = call i32 @_rl_init_terminal_io(i8* %0)
  ret i32 0
}

; Function Attrs: noinline nounwind
define i32 @_rl_output_character_function(i32 %c) #0 {
entry:
  %c.addr = alloca i32, align 4
  store i32 %c, i32* %c.addr, align 4
  %0 = load i32, i32* %c.addr, align 4
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @_rl_out_stream, align 4
  %call = call i32 @putc(i32 %0, %struct._IO_FILE* %1)
  ret i32 %call
}

declare i32 @putc(i32, %struct._IO_FILE*) #1

; Function Attrs: noinline nounwind
define void @_rl_output_some_chars(i8* %string, i32 %count) #0 {
entry:
  %string.addr = alloca i8*, align 4
  %count.addr = alloca i32, align 4
  store i8* %string, i8** %string.addr, align 4
  store i32 %count, i32* %count.addr, align 4
  %0 = load i8*, i8** %string.addr, align 4
  %1 = load i32, i32* %count.addr, align 4
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @_rl_out_stream, align 4
  %call = call i32 @fwrite(i8* %0, i32 1, i32 %1, %struct._IO_FILE* %2)
  ret void
}

declare i32 @fwrite(i8*, i32, i32, %struct._IO_FILE*) #1

; Function Attrs: noinline nounwind
define i32 @_rl_backspace(i32 %count) #0 {
entry:
  %count.addr = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  %0 = load i8*, i8** @_rl_term_backspace, align 4
  %tobool = icmp ne i8* %0, null
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then
  %1 = load i32, i32* %i, align 4
  %2 = load i32, i32* %count.addr, align 4
  %cmp = icmp slt i32 %1, %2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load i8*, i8** @_rl_term_backspace, align 4
  %call = call i32 bitcast (i32 (...)* @tputs to i32 (i8*, i32, i32 (...)*)*)(i8* %3, i32 1, i32 (...)* bitcast (i32 (i32)* @_rl_output_character_function to i32 (...)*))
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %4 = load i32, i32* %i, align 4
  %inc = add nsw i32 %4, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  br label %if.end

if.else:                                          ; preds = %entry
  store i32 0, i32* %i, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc5, %if.else
  %5 = load i32, i32* %i, align 4
  %6 = load i32, i32* %count.addr, align 4
  %cmp2 = icmp slt i32 %5, %6
  br i1 %cmp2, label %for.body3, label %for.end7

for.body3:                                        ; preds = %for.cond1
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @_rl_out_stream, align 4
  %call4 = call i32 @putc(i32 8, %struct._IO_FILE* %7)
  br label %for.inc5

for.inc5:                                         ; preds = %for.body3
  %8 = load i32, i32* %i, align 4
  %inc6 = add nsw i32 %8, 1
  store i32 %inc6, i32* %i, align 4
  br label %for.cond1

for.end7:                                         ; preds = %for.cond1
  br label %if.end

if.end:                                           ; preds = %for.end7, %for.end
  ret i32 0
}

declare i32 @tputs(...) #1

; Function Attrs: noinline nounwind
define i32 @rl_crlf() #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @_rl_out_stream, align 4
  %call = call i32 @putc(i32 10, %struct._IO_FILE* %0)
  ret i32 0
}

; Function Attrs: noinline nounwind
define i32 @rl_ding() #0 {
entry:
  %retval = alloca i32, align 4
  %0 = load i32, i32* @_rl_echoing_p, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.end7

if.then:                                          ; preds = %entry
  %1 = load i32, i32* @_rl_bell_preference, align 4
  switch i32 %1, label %sw.default [
    i32 0, label %sw.bb
    i32 2, label %sw.bb1
    i32 1, label %sw.bb4
  ]

sw.bb:                                            ; preds = %if.then
  br label %sw.default

sw.default:                                       ; preds = %if.then, %sw.bb
  br label %sw.epilog

sw.bb1:                                           ; preds = %if.then
  %2 = load i8*, i8** @_rl_visible_bell, align 4
  %tobool2 = icmp ne i8* %2, null
  br i1 %tobool2, label %if.then3, label %if.end

if.then3:                                         ; preds = %sw.bb1
  %3 = load i8*, i8** @_rl_visible_bell, align 4
  %call = call i32 bitcast (i32 (...)* @tputs to i32 (i8*, i32, i32 (...)*)*)(i8* %3, i32 1, i32 (...)* bitcast (i32 (i32)* @_rl_output_character_function to i32 (...)*))
  br label %sw.epilog

if.end:                                           ; preds = %sw.bb1
  br label %sw.bb4

sw.bb4:                                           ; preds = %if.then, %if.end
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %call5 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.11, i32 0, i32 0))
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %call6 = call i32 @fflush(%struct._IO_FILE* %5)
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.bb4, %if.then3, %sw.default
  store i32 0, i32* %retval, align 4
  br label %return

if.end7:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end7, %sw.epilog
  %6 = load i32, i32* %retval, align 4
  ret i32 %6
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

declare i32 @fflush(%struct._IO_FILE*) #1

; Function Attrs: noinline nounwind
define void @_rl_enable_meta_key() #0 {
entry:
  %0 = load i32, i32* @term_has_meta, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %1 = load i8*, i8** @_rl_term_mm, align 4
  %tobool1 = icmp ne i8* %1, null
  br i1 %tobool1, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %2 = load i8*, i8** @_rl_term_mm, align 4
  %call = call i32 bitcast (i32 (...)* @tputs to i32 (i8*, i32, i32 (...)*)*)(i8* %2, i32 1, i32 (...)* bitcast (i32 (i32)* @_rl_output_character_function to i32 (...)*))
  store i32 1, i32* @enabled_meta, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  ret void
}

; Function Attrs: noinline nounwind
define void @_rl_disable_meta_key() #0 {
entry:
  %0 = load i32, i32* @term_has_meta, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %1 = load i8*, i8** @_rl_term_mo, align 4
  %tobool1 = icmp ne i8* %1, null
  br i1 %tobool1, label %land.lhs.true2, label %if.end

land.lhs.true2:                                   ; preds = %land.lhs.true
  %2 = load i32, i32* @enabled_meta, align 4
  %tobool3 = icmp ne i32 %2, 0
  br i1 %tobool3, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true2
  %3 = load i8*, i8** @_rl_term_mo, align 4
  %call = call i32 bitcast (i32 (...)* @tputs to i32 (i8*, i32, i32 (...)*)*)(i8* %3, i32 1, i32 (...)* bitcast (i32 (i32)* @_rl_output_character_function to i32 (...)*))
  store i32 0, i32* @enabled_meta, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true2, %land.lhs.true, %entry
  ret void
}

; Function Attrs: noinline nounwind
define void @_rl_control_keypad(i32 %on) #0 {
entry:
  %on.addr = alloca i32, align 4
  store i32 %on, i32* %on.addr, align 4
  %0 = load i32, i32* %on.addr, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %entry
  %1 = load i8*, i8** @_rl_term_ks, align 4
  %tobool1 = icmp ne i8* %1, null
  br i1 %tobool1, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true
  %2 = load i8*, i8** @_rl_term_ks, align 4
  %call = call i32 bitcast (i32 (...)* @tputs to i32 (i8*, i32, i32 (...)*)*)(i8* %2, i32 1, i32 (...)* bitcast (i32 (i32)* @_rl_output_character_function to i32 (...)*))
  br label %if.end7

if.else:                                          ; preds = %land.lhs.true, %entry
  %3 = load i32, i32* %on.addr, align 4
  %tobool2 = icmp ne i32 %3, 0
  br i1 %tobool2, label %if.end, label %land.lhs.true3

land.lhs.true3:                                   ; preds = %if.else
  %4 = load i8*, i8** @_rl_term_ke, align 4
  %tobool4 = icmp ne i8* %4, null
  br i1 %tobool4, label %if.then5, label %if.end

if.then5:                                         ; preds = %land.lhs.true3
  %5 = load i8*, i8** @_rl_term_ke, align 4
  %call6 = call i32 bitcast (i32 (...)* @tputs to i32 (i8*, i32, i32 (...)*)*)(i8* %5, i32 1, i32 (...)* bitcast (i32 (i32)* @_rl_output_character_function to i32 (...)*))
  br label %if.end

if.end:                                           ; preds = %if.then5, %land.lhs.true3, %if.else
  br label %if.end7

if.end7:                                          ; preds = %if.end, %if.then
  ret void
}

; Function Attrs: noinline nounwind
define void @_rl_set_cursor(i32 %im, i32 %force) #0 {
entry:
  %im.addr = alloca i32, align 4
  %force.addr = alloca i32, align 4
  store i32 %im, i32* %im.addr, align 4
  store i32 %force, i32* %force.addr, align 4
  %0 = load i8*, i8** @_rl_term_ve, align 4
  %tobool = icmp ne i8* %0, null
  br i1 %tobool, label %land.lhs.true, label %if.end8

land.lhs.true:                                    ; preds = %entry
  %1 = load i8*, i8** @_rl_term_vs, align 4
  %tobool1 = icmp ne i8* %1, null
  br i1 %tobool1, label %if.then, label %if.end8

if.then:                                          ; preds = %land.lhs.true
  %2 = load i32, i32* %force.addr, align 4
  %tobool2 = icmp ne i32 %2, 0
  br i1 %tobool2, label %if.then3, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.then
  %3 = load i32, i32* %im.addr, align 4
  %4 = load i32, i32* @rl_insert_mode, align 4
  %cmp = icmp ne i32 %3, %4
  br i1 %cmp, label %if.then3, label %if.end7

if.then3:                                         ; preds = %lor.lhs.false, %if.then
  %5 = load i32, i32* %im.addr, align 4
  %cmp4 = icmp eq i32 %5, 0
  br i1 %cmp4, label %if.then5, label %if.else

if.then5:                                         ; preds = %if.then3
  %6 = load i8*, i8** @_rl_term_vs, align 4
  %call = call i32 bitcast (i32 (...)* @tputs to i32 (i8*, i32, i32 (...)*)*)(i8* %6, i32 1, i32 (...)* bitcast (i32 (i32)* @_rl_output_character_function to i32 (...)*))
  br label %if.end

if.else:                                          ; preds = %if.then3
  %7 = load i8*, i8** @_rl_term_ve, align 4
  %call6 = call i32 bitcast (i32 (...)* @tputs to i32 (i8*, i32, i32 (...)*)*)(i8* %7, i32 1, i32 (...)* bitcast (i32 (i32)* @_rl_output_character_function to i32 (...)*))
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then5
  br label %if.end7

if.end7:                                          ; preds = %if.end, %lor.lhs.false
  br label %if.end8

if.end8:                                          ; preds = %if.end7, %land.lhs.true, %entry
  ret void
}

declare i8* @tgetstr(...) #1

declare i32 @rl_bind_keyseq_if_unbound(i8*, i32 (i32, i32)*) #1

declare i32 @rl_get_previous_history(i32, i32) #1

declare i32 @rl_get_next_history(i32, i32) #1

declare i32 @rl_forward_char(i32, i32) #1

declare i32 @rl_backward_char(i32, i32) #1

declare i32 @rl_beg_of_line(i32, i32) #1

declare i32 @rl_end_of_line(i32, i32) #1

declare i32 @rl_delete(i32, i32) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
