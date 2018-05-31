; ModuleID = 'display.c'
source_filename = "display.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.line_state = type { i8*, i32*, i32, i32, i32* }
%struct.undo_list = type { %struct.undo_list*, i32, i32, i8*, i32 }
%struct._IO_FILE = type opaque
%struct._keymap_entry = type { i8, i32 (i32, i32)* }
%struct.__mbstate_t = type { i32, i32 }
%struct._hist_entry = type { i8*, i8*, i8* }

@rl_redisplay_function = global void ()* @rl_redisplay, align 4
@rl_display_fixed = global i32 0, align 4
@_rl_suppress_redisplay = global i32 0, align 4
@_rl_want_redisplay = global i32 0, align 4
@rl_display_prompt = global i8* null, align 4
@_rl_last_c_pos = global i32 0, align 4
@_rl_last_v_pos = global i32 0, align 4
@_rl_vis_botlin = global i32 0, align 4
@rl_prompt = external global i8*, align 4
@rl_visible_prompt_length = external global i32, align 4
@local_prompt = internal global i8* null, align 4
@local_prompt_prefix = internal global i8* null, align 4
@local_prompt_len = internal global i32 0, align 4
@prompt_invis_chars_first_line = internal global i32 0, align 4
@prompt_last_invisible = internal global i32 0, align 4
@prompt_physical_chars = internal global i32 0, align 4
@prompt_visible_length = internal global i32 0, align 4
@prompt_prefix_length = internal global i32 0, align 4
@_rl_echoing_p = external global i32, align 4
@rl_readline_state = external global i32, align 4
@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@line_structures_initialized = internal global i32 0, align 4
@cpos_buffer_position = internal global i32 0, align 4
@prompt_multibyte_chars = internal global i32 0, align 4
@line_state_invisible = internal global %struct.line_state* bitcast (i8* getelementptr (i8, i8* bitcast ([2 x %struct.line_state]* @line_state_array to i8*), i64 20) to %struct.line_state*), align 4
@modmark = internal global i32 0, align 4
@_rl_mark_modified_lines = external global i32, align 4
@rl_undo_list = external global %struct.undo_list*, align 4
@line_state_visible = internal global %struct.line_state* getelementptr inbounds ([2 x %struct.line_state], [2 x %struct.line_state]* @line_state_array, i32 0, i32 0), align 4
@forced_display = internal global i32 0, align 4
@line_size = internal global i32 1024, align 4
@wrap_offset = internal global i32 0, align 4
@_rl_screenwidth = external global i32, align 4
@rl_byte_oriented = external global i32, align 4
@prompt_last_screen_line = internal global i32 0, align 4
@rl_line_buffer = external global i8*, align 4
@rl_end = external global i32, align 4
@rl_point = external global i32, align 4
@_rl_output_meta_chars = external global i32, align 4
@.str.1 = private unnamed_addr constant [4 x i8] c"\5C%o\00", align 1
@_rl_horizontal_scroll_mode = external global i32, align 4
@_rl_term_up = external global i8*, align 4
@_rl_inv_botlin = internal global i32 0, align 4
@displaying_prompt_first_line = internal global i32 0, align 4
@_rl_screenchars = external global i32, align 4
@cpos_adjusted = internal global i32 0, align 4
@visible_wrap_offset = internal global i32 0, align 4
@visible_first_line_len = internal global i32 0, align 4
@_rl_term_cr = external global i8*, align 4
@.str.2 = private unnamed_addr constant [2 x i8] c"*\00", align 1
@last_lmargin = internal global i32 0, align 4
@rl_outstream = external global %struct._IO_FILE*, align 4
@_rl_term_autowrap = external global i32, align 4
@.str.3 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@_rl_term_forward_char = external global i8*, align 4
@_rl_screenheight = external global i32, align 4
@.str.4 = private unnamed_addr constant [3 x i8] c"M-\00", align 1
@.str.5 = private unnamed_addr constant [3 x i8] c"C-\00", align 1
@msg_buf = internal global i8* null, align 4
@msg_bufsiz = internal global i32 0, align 4
@saved_local_prompt = internal global i8* null, align 4
@msg_saved_prompt = internal global i32 0, align 4
@saved_local_prefix = internal global i8* null, align 4
@saved_prefix_length = internal global i32 0, align 4
@saved_local_length = internal global i32 0, align 4
@saved_last_invisible = internal global i32 0, align 4
@saved_visible_length = internal global i32 0, align 4
@saved_invis_chars_first_line = internal global i32 0, align 4
@saved_physical_chars = internal global i32 0, align 4
@_rl_term_clreol = external global i8*, align 4
@_rl_term_clrpag = external global i8*, align 4
@_rl_emacs_mode_str = common global i8* null, align 4
@_rl_emacs_modestr_len = common global i32 0, align 4
@_rl_vi_ins_mode_str = common global i8* null, align 4
@_rl_vi_ins_modestr_len = common global i32 0, align 4
@_rl_vi_cmd_mode_str = common global i8* null, align 4
@_rl_vi_cmd_modestr_len = common global i32 0, align 4
@_rl_show_mode_in_prompt = external global i32, align 4
@rl_editing_mode = external global i32, align 4
@.str.6 = private unnamed_addr constant [2 x i8] c"@\00", align 1
@_rl_keymap = external global %struct._keymap_entry*, align 4
@vi_insertion_keymap = external global [257 x %struct._keymap_entry], align 4
@.str.7 = private unnamed_addr constant [6 x i8] c"(ins)\00", align 1
@.str.8 = private unnamed_addr constant [6 x i8] c"(cmd)\00", align 1
@line_state_array = internal global [2 x %struct.line_state] zeroinitializer, align 4
@_rl_utf8locale = external global i32, align 4
@_rl_terminal_can_insert = external global i32, align 4
@_rl_term_IC = external global i8*, align 4
@_rl_term_dc = external global i8*, align 4
@_rl_term_im = external global i8*, align 4
@_rl_term_ei = external global i8*, align 4
@_rl_term_ic = external global i8*, align 4
@_rl_term_DC = external global i8*, align 4

; Function Attrs: noinline nounwind
define void @rl_redisplay() #0 {
entry:
  %in = alloca i32, align 4
  %out = alloca i32, align 4
  %c = alloca i32, align 4
  %linenum = alloca i32, align 4
  %cursor_linenum = alloca i32, align 4
  %line = alloca i8*, align 4
  %inv_botlin = alloca i32, align 4
  %lb_botlin = alloca i32, align 4
  %lb_linenum = alloca i32, align 4
  %o_cpos = alloca i32, align 4
  %newlines = alloca i32, align 4
  %lpos = alloca i32, align 4
  %temp = alloca i32, align 4
  %n0 = alloca i32, align 4
  %num = alloca i32, align 4
  %prompt_lines_estimate = alloca i32, align 4
  %prompt_this_line = alloca i8*, align 4
  %mb_cur_max = alloca i32, align 4
  %wc = alloca i32, align 4
  %wc_bytes = alloca i32, align 4
  %wc_width = alloca i32, align 4
  %ps = alloca %struct.__mbstate_t, align 4
  %_rl_wrapped_multicolumn = alloca i32, align 4
  %pmtlen = alloca i32, align 4
  %z = alloca i32, align 4
  %p = alloca i32, align 4
  %nocorrect = alloca i32, align 4
  %wadjust = alloca i32, align 4
  %newout = alloca i32, align 4
  %temp2 = alloca i32, align 4
  %i = alloca i32, align 4
  %nleft = alloca i32, align 4
  %pos = alloca i32, align 4
  %changed_screen_line = alloca i32, align 4
  %tx = alloca i32, align 4
  %tt = alloca i8*, align 4
  %lmargin = alloca i32, align 4
  %ndisp = alloca i32, align 4
  %nleft1003 = alloca i32, align 4
  %phys_c_pos = alloca i32, align 4
  %t = alloca i32, align 4
  %vtemp = alloca %struct.line_state*, align 4
  %call = call i32 @__ctype_get_mb_cur_max()
  store i32 %call, i32* %mb_cur_max, align 4
  store i32 0, i32* %_rl_wrapped_multicolumn, align 4
  %0 = load i32, i32* @_rl_echoing_p, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %return

if.end:                                           ; preds = %entry
  call void @_rl_block_sigint()
  %1 = load i32, i32* @rl_readline_state, align 4
  %or = or i32 %1, 16777216
  store i32 %or, i32* @rl_readline_state, align 4
  %2 = load i8*, i8** @rl_display_prompt, align 4
  %tobool = icmp ne i8* %2, null
  br i1 %tobool, label %if.end2, label %if.then1

if.then1:                                         ; preds = %if.end
  store i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i32 0, i32 0), i8** @rl_display_prompt, align 4
  br label %if.end2

if.end2:                                          ; preds = %if.then1, %if.end
  %3 = load i32, i32* @line_structures_initialized, align 4
  %cmp3 = icmp eq i32 %3, 0
  br i1 %cmp3, label %if.then4, label %if.end6

if.then4:                                         ; preds = %if.end2
  call void @init_line_structures(i32 0)
  %call5 = call i32 @rl_on_new_line()
  br label %if.end6

if.end6:                                          ; preds = %if.then4, %if.end2
  store i32 -1, i32* @cpos_buffer_position, align 4
  %4 = load i32, i32* @prompt_visible_length, align 4
  %5 = load i32, i32* @prompt_physical_chars, align 4
  %sub = sub nsw i32 %4, %5
  store i32 %sub, i32* @prompt_multibyte_chars, align 4
  %6 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %line7 = getelementptr inbounds %struct.line_state, %struct.line_state* %6, i32 0, i32 0
  %7 = load i8*, i8** %line7, align 4
  store i8* %7, i8** %line, align 4
  store i32 0, i32* %inv_botlin, align 4
  store i32 0, i32* %out, align 4
  store i32 0, i32* @modmark, align 4
  %8 = load i32, i32* @_rl_mark_modified_lines, align 4
  %tobool8 = icmp ne i32 %8, 0
  br i1 %tobool8, label %land.lhs.true, label %if.end15

land.lhs.true:                                    ; preds = %if.end6
  %call9 = call %struct._hist_entry* @current_history()
  %tobool10 = icmp ne %struct._hist_entry* %call9, null
  br i1 %tobool10, label %land.lhs.true11, label %if.end15

land.lhs.true11:                                  ; preds = %land.lhs.true
  %9 = load %struct.undo_list*, %struct.undo_list** @rl_undo_list, align 4
  %tobool12 = icmp ne %struct.undo_list* %9, null
  br i1 %tobool12, label %if.then13, label %if.end15

if.then13:                                        ; preds = %land.lhs.true11
  %10 = load i8*, i8** %line, align 4
  %11 = load i32, i32* %out, align 4
  %inc = add nsw i32 %11, 1
  store i32 %inc, i32* %out, align 4
  %arrayidx = getelementptr inbounds i8, i8* %10, i32 %11
  store i8 42, i8* %arrayidx, align 1
  %12 = load i8*, i8** %line, align 4
  %13 = load i32, i32* %out, align 4
  %arrayidx14 = getelementptr inbounds i8, i8* %12, i32 %13
  store i8 0, i8* %arrayidx14, align 1
  store i32 1, i32* @modmark, align 4
  br label %if.end15

if.end15:                                         ; preds = %if.then13, %land.lhs.true11, %land.lhs.true, %if.end6
  %14 = load %struct.line_state*, %struct.line_state** @line_state_visible, align 4
  %line16 = getelementptr inbounds %struct.line_state, %struct.line_state* %14, i32 0, i32 0
  %15 = load i8*, i8** %line16, align 4
  %arrayidx17 = getelementptr inbounds i8, i8* %15, i32 0
  %16 = load i8, i8* %arrayidx17, align 1
  %conv = sext i8 %16 to i32
  %17 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %line18 = getelementptr inbounds %struct.line_state, %struct.line_state* %17, i32 0, i32 0
  %18 = load i8*, i8** %line18, align 4
  %arrayidx19 = getelementptr inbounds i8, i8* %18, i32 0
  %19 = load i8, i8* %arrayidx19, align 1
  %conv20 = sext i8 %19 to i32
  %cmp21 = icmp ne i32 %conv, %conv20
  br i1 %cmp21, label %if.then23, label %if.end24

if.then23:                                        ; preds = %if.end15
  store i32 0, i32* @rl_display_fixed, align 4
  br label %if.end24

if.end24:                                         ; preds = %if.then23, %if.end15
  %20 = load i8*, i8** @rl_display_prompt, align 4
  %21 = load i8*, i8** @rl_prompt, align 4
  %cmp25 = icmp eq i8* %20, %21
  br i1 %cmp25, label %if.then28, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end24
  %22 = load i8*, i8** @local_prompt, align 4
  %tobool27 = icmp ne i8* %22, null
  br i1 %tobool27, label %if.then28, label %if.else

if.then28:                                        ; preds = %lor.lhs.false, %if.end24
  %23 = load i8*, i8** @local_prompt_prefix, align 4
  %tobool29 = icmp ne i8* %23, null
  br i1 %tobool29, label %land.lhs.true30, label %if.end34

land.lhs.true30:                                  ; preds = %if.then28
  %24 = load i32, i32* @forced_display, align 4
  %tobool31 = icmp ne i32 %24, 0
  br i1 %tobool31, label %if.then32, label %if.end34

if.then32:                                        ; preds = %land.lhs.true30
  %25 = load i8*, i8** @local_prompt_prefix, align 4
  %26 = load i8*, i8** @local_prompt_prefix, align 4
  %call33 = call i32 @strlen(i8* %26)
  call void @_rl_output_some_chars(i8* %25, i32 %call33)
  br label %if.end34

if.end34:                                         ; preds = %if.then32, %land.lhs.true30, %if.then28
  %27 = load i32, i32* @local_prompt_len, align 4
  %cmp35 = icmp sgt i32 %27, 0
  br i1 %cmp35, label %if.then37, label %if.end53

if.then37:                                        ; preds = %if.end34
  %28 = load i32, i32* @local_prompt_len, align 4
  %29 = load i32, i32* %out, align 4
  %add = add nsw i32 %28, %29
  %add38 = add nsw i32 %add, 2
  store i32 %add38, i32* %temp, align 4
  %30 = load i32, i32* %temp, align 4
  %31 = load i32, i32* @line_size, align 4
  %cmp39 = icmp sge i32 %30, %31
  br i1 %cmp39, label %if.then41, label %if.end50

if.then41:                                        ; preds = %if.then37
  %32 = load i32, i32* %temp, align 4
  %add42 = add nsw i32 %32, 1024
  %33 = load i32, i32* %temp, align 4
  %rem = srem i32 %33, 1024
  %sub43 = sub nsw i32 %add42, %rem
  store i32 %sub43, i32* @line_size, align 4
  %34 = load %struct.line_state*, %struct.line_state** @line_state_visible, align 4
  %line44 = getelementptr inbounds %struct.line_state, %struct.line_state* %34, i32 0, i32 0
  %35 = load i8*, i8** %line44, align 4
  %36 = load i32, i32* @line_size, align 4
  %call45 = call i8* @xrealloc(i8* %35, i32 %36)
  %37 = load %struct.line_state*, %struct.line_state** @line_state_visible, align 4
  %line46 = getelementptr inbounds %struct.line_state, %struct.line_state* %37, i32 0, i32 0
  store i8* %call45, i8** %line46, align 4
  %38 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %line47 = getelementptr inbounds %struct.line_state, %struct.line_state* %38, i32 0, i32 0
  %39 = load i8*, i8** %line47, align 4
  %40 = load i32, i32* @line_size, align 4
  %call48 = call i8* @xrealloc(i8* %39, i32 %40)
  %41 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %line49 = getelementptr inbounds %struct.line_state, %struct.line_state* %41, i32 0, i32 0
  store i8* %call48, i8** %line49, align 4
  store i8* %call48, i8** %line, align 4
  br label %if.end50

if.end50:                                         ; preds = %if.then41, %if.then37
  %42 = load i8*, i8** %line, align 4
  %43 = load i32, i32* %out, align 4
  %add.ptr = getelementptr inbounds i8, i8* %42, i32 %43
  %44 = load i8*, i8** @local_prompt, align 4
  %45 = load i32, i32* @local_prompt_len, align 4
  %call51 = call i8* @strncpy(i8* %add.ptr, i8* %44, i32 %45)
  %46 = load i32, i32* @local_prompt_len, align 4
  %47 = load i32, i32* %out, align 4
  %add52 = add nsw i32 %47, %46
  store i32 %add52, i32* %out, align 4
  br label %if.end53

if.end53:                                         ; preds = %if.end50, %if.end34
  %48 = load i8*, i8** %line, align 4
  %49 = load i32, i32* %out, align 4
  %arrayidx54 = getelementptr inbounds i8, i8* %48, i32 %49
  store i8 0, i8* %arrayidx54, align 1
  %50 = load i32, i32* @local_prompt_len, align 4
  %51 = load i32, i32* @prompt_visible_length, align 4
  %sub55 = sub nsw i32 %50, %51
  store i32 %sub55, i32* @wrap_offset, align 4
  br label %if.end93

if.else:                                          ; preds = %lor.lhs.false
  %52 = load i8*, i8** @rl_display_prompt, align 4
  %call56 = call i8* @strrchr(i8* %52, i32 10)
  store i8* %call56, i8** %prompt_this_line, align 4
  %53 = load i8*, i8** %prompt_this_line, align 4
  %tobool57 = icmp ne i8* %53, null
  br i1 %tobool57, label %if.else59, label %if.then58

if.then58:                                        ; preds = %if.else
  %54 = load i8*, i8** @rl_display_prompt, align 4
  store i8* %54, i8** %prompt_this_line, align 4
  br label %if.end72

if.else59:                                        ; preds = %if.else
  %55 = load i8*, i8** %prompt_this_line, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %55, i32 1
  store i8* %incdec.ptr, i8** %prompt_this_line, align 4
  %56 = load i8*, i8** %prompt_this_line, align 4
  %57 = load i8*, i8** @rl_display_prompt, align 4
  %sub.ptr.lhs.cast = ptrtoint i8* %56 to i32
  %sub.ptr.rhs.cast = ptrtoint i8* %57 to i32
  %sub.ptr.sub = sub i32 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  store i32 %sub.ptr.sub, i32* %pmtlen, align 4
  %58 = load i32, i32* @forced_display, align 4
  %tobool60 = icmp ne i32 %58, 0
  br i1 %tobool60, label %if.then61, label %if.end71

if.then61:                                        ; preds = %if.else59
  %59 = load i8*, i8** @rl_display_prompt, align 4
  %60 = load i32, i32* %pmtlen, align 4
  call void @_rl_output_some_chars(i8* %59, i32 %60)
  %61 = load i32, i32* %pmtlen, align 4
  %cmp62 = icmp slt i32 %61, 2
  br i1 %cmp62, label %if.then69, label %lor.lhs.false64

lor.lhs.false64:                                  ; preds = %if.then61
  %62 = load i8*, i8** %prompt_this_line, align 4
  %arrayidx65 = getelementptr inbounds i8, i8* %62, i32 -2
  %63 = load i8, i8* %arrayidx65, align 1
  %conv66 = sext i8 %63 to i32
  %cmp67 = icmp ne i32 %conv66, 13
  br i1 %cmp67, label %if.then69, label %if.end70

if.then69:                                        ; preds = %lor.lhs.false64, %if.then61
  call void @cr()
  br label %if.end70

if.end70:                                         ; preds = %if.then69, %lor.lhs.false64
  br label %if.end71

if.end71:                                         ; preds = %if.end70, %if.else59
  br label %if.end72

if.end72:                                         ; preds = %if.end71, %if.then58
  %64 = load i8*, i8** %prompt_this_line, align 4
  %call73 = call i32 @strlen(i8* %64)
  store i32 %call73, i32* %pmtlen, align 4
  store i32 %call73, i32* @prompt_physical_chars, align 4
  %65 = load i32, i32* %pmtlen, align 4
  %66 = load i32, i32* %out, align 4
  %add74 = add nsw i32 %65, %66
  %add75 = add nsw i32 %add74, 2
  store i32 %add75, i32* %temp, align 4
  %67 = load i32, i32* %temp, align 4
  %68 = load i32, i32* @line_size, align 4
  %cmp76 = icmp sge i32 %67, %68
  br i1 %cmp76, label %if.then78, label %if.end88

if.then78:                                        ; preds = %if.end72
  %69 = load i32, i32* %temp, align 4
  %add79 = add nsw i32 %69, 1024
  %70 = load i32, i32* %temp, align 4
  %rem80 = srem i32 %70, 1024
  %sub81 = sub nsw i32 %add79, %rem80
  store i32 %sub81, i32* @line_size, align 4
  %71 = load %struct.line_state*, %struct.line_state** @line_state_visible, align 4
  %line82 = getelementptr inbounds %struct.line_state, %struct.line_state* %71, i32 0, i32 0
  %72 = load i8*, i8** %line82, align 4
  %73 = load i32, i32* @line_size, align 4
  %call83 = call i8* @xrealloc(i8* %72, i32 %73)
  %74 = load %struct.line_state*, %struct.line_state** @line_state_visible, align 4
  %line84 = getelementptr inbounds %struct.line_state, %struct.line_state* %74, i32 0, i32 0
  store i8* %call83, i8** %line84, align 4
  %75 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %line85 = getelementptr inbounds %struct.line_state, %struct.line_state* %75, i32 0, i32 0
  %76 = load i8*, i8** %line85, align 4
  %77 = load i32, i32* @line_size, align 4
  %call86 = call i8* @xrealloc(i8* %76, i32 %77)
  %78 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %line87 = getelementptr inbounds %struct.line_state, %struct.line_state* %78, i32 0, i32 0
  store i8* %call86, i8** %line87, align 4
  store i8* %call86, i8** %line, align 4
  br label %if.end88

if.end88:                                         ; preds = %if.then78, %if.end72
  %79 = load i8*, i8** %line, align 4
  %80 = load i32, i32* %out, align 4
  %add.ptr89 = getelementptr inbounds i8, i8* %79, i32 %80
  %81 = load i8*, i8** %prompt_this_line, align 4
  %82 = load i32, i32* %pmtlen, align 4
  %call90 = call i8* @strncpy(i8* %add.ptr89, i8* %81, i32 %82)
  %83 = load i32, i32* %pmtlen, align 4
  %84 = load i32, i32* %out, align 4
  %add91 = add nsw i32 %84, %83
  store i32 %add91, i32* %out, align 4
  %85 = load i8*, i8** %line, align 4
  %86 = load i32, i32* %out, align 4
  %arrayidx92 = getelementptr inbounds i8, i8* %85, i32 %86
  store i8 0, i8* %arrayidx92, align 1
  store i32 0, i32* @prompt_invis_chars_first_line, align 4
  store i32 0, i32* @wrap_offset, align 4
  br label %if.end93

if.end93:                                         ; preds = %if.end88, %if.end53
  %87 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %lbreaks = getelementptr inbounds %struct.line_state, %struct.line_state* %87, i32 0, i32 1
  %88 = load i32*, i32** %lbreaks, align 4
  store i32 0, i32* %newlines, align 4
  %arrayidx94 = getelementptr inbounds i32, i32* %88, i32 0
  store i32 0, i32* %arrayidx94, align 4
  %89 = load i32, i32* @prompt_physical_chars, align 4
  %90 = load i32, i32* @modmark, align 4
  %add95 = add nsw i32 %89, %90
  store i32 %add95, i32* %lpos, align 4
  %91 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %wrapped_line = getelementptr inbounds %struct.line_state, %struct.line_state* %91, i32 0, i32 4
  %92 = load i32*, i32** %wrapped_line, align 4
  %93 = bitcast i32* %92 to i8*
  %94 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %wbsize = getelementptr inbounds %struct.line_state, %struct.line_state* %94, i32 0, i32 3
  %95 = load i32, i32* %wbsize, align 4
  %mul = mul i32 %95, 4
  call void @llvm.memset.p0i8.i32(i8* %93, i8 0, i32 %mul, i32 4, i1 false)
  store i32 0, i32* %num, align 4
  %96 = load i32, i32* %lpos, align 4
  %97 = load i32, i32* @_rl_screenwidth, align 4
  %div = sdiv i32 %96, %97
  store i32 %div, i32* %prompt_lines_estimate, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end161, %if.end93
  %98 = load i32, i32* %lpos, align 4
  %99 = load i32, i32* @_rl_screenwidth, align 4
  %cmp96 = icmp sge i32 %98, %99
  br i1 %cmp96, label %while.body, label %while.end162

while.body:                                       ; preds = %while.cond
  store i32 0, i32* %nocorrect, align 4
  %100 = load i32, i32* %newlines, align 4
  %cmp98 = icmp eq i32 %100, 0
  br i1 %cmp98, label %cond.true, label %cond.false

cond.true:                                        ; preds = %while.body
  %101 = load i32, i32* @prompt_invis_chars_first_line, align 4
  br label %cond.end105

cond.false:                                       ; preds = %while.body
  %102 = load i32, i32* %newlines, align 4
  %103 = load i32, i32* %prompt_lines_estimate, align 4
  %cmp100 = icmp eq i32 %102, %103
  br i1 %cmp100, label %cond.true102, label %cond.false104

cond.true102:                                     ; preds = %cond.false
  %104 = load i32, i32* @wrap_offset, align 4
  %105 = load i32, i32* @prompt_invis_chars_first_line, align 4
  %sub103 = sub nsw i32 %104, %105
  br label %cond.end

cond.false104:                                    ; preds = %cond.false
  br label %cond.end

cond.end:                                         ; preds = %cond.false104, %cond.true102
  %cond = phi i32 [ %sub103, %cond.true102 ], [ 0, %cond.false104 ]
  br label %cond.end105

cond.end105:                                      ; preds = %cond.end, %cond.true
  %cond106 = phi i32 [ %101, %cond.true ], [ %cond, %cond.end ]
  store i32 %cond106, i32* %wadjust, align 4
  %106 = load i32, i32* %mb_cur_max, align 4
  %cmp107 = icmp sgt i32 %106, 1
  br i1 %cmp107, label %land.lhs.true109, label %if.else135

land.lhs.true109:                                 ; preds = %cond.end105
  %107 = load i32, i32* @rl_byte_oriented, align 4
  %cmp110 = icmp eq i32 %107, 0
  br i1 %cmp110, label %land.lhs.true112, label %if.else135

land.lhs.true112:                                 ; preds = %land.lhs.true109
  %108 = load i32, i32* @prompt_multibyte_chars, align 4
  %cmp113 = icmp sgt i32 %108, 0
  br i1 %cmp113, label %if.then115, label %if.else135

if.then115:                                       ; preds = %land.lhs.true112
  store i32 1, i32* %nocorrect, align 4
  %109 = load i32, i32* %num, align 4
  store i32 %109, i32* %n0, align 4
  %110 = load i32, i32* @local_prompt_len, align 4
  store i32 %110, i32* %temp, align 4
  br label %while.cond116

while.cond116:                                    ; preds = %if.end133, %if.then115
  %111 = load i32, i32* %num, align 4
  %112 = load i32, i32* %temp, align 4
  %cmp117 = icmp slt i32 %111, %112
  br i1 %cmp117, label %while.body119, label %while.end

while.body119:                                    ; preds = %while.cond116
  %113 = load i8*, i8** @local_prompt, align 4
  %114 = load i32, i32* %n0, align 4
  %115 = load i32, i32* %num, align 4
  %call120 = call i32 @_rl_col_width(i8* %113, i32 %114, i32 %115, i32 1)
  %116 = load i32, i32* %wadjust, align 4
  %sub121 = sub nsw i32 %call120, %116
  store i32 %sub121, i32* %z, align 4
  %117 = load i32, i32* %z, align 4
  %118 = load i32, i32* @_rl_screenwidth, align 4
  %cmp122 = icmp sgt i32 %117, %118
  br i1 %cmp122, label %if.then124, label %if.else126

if.then124:                                       ; preds = %while.body119
  %119 = load i8*, i8** @local_prompt, align 4
  %120 = load i32, i32* %num, align 4
  %call125 = call i32 @_rl_find_prev_mbchar(i8* %119, i32 %120, i32 0)
  store i32 %call125, i32* %num, align 4
  br label %while.end

if.else126:                                       ; preds = %while.body119
  %121 = load i32, i32* %z, align 4
  %122 = load i32, i32* @_rl_screenwidth, align 4
  %cmp127 = icmp eq i32 %121, %122
  br i1 %cmp127, label %if.then129, label %if.end132

if.then129:                                       ; preds = %if.else126
  %123 = load i8*, i8** @local_prompt, align 4
  %124 = load i32, i32* %num, align 4
  %call130 = call i32 @_rl_find_prev_mbchar(i8* %123, i32 %124, i32 0)
  store i32 %call130, i32* %p, align 4
  %125 = load i8*, i8** @local_prompt, align 4
  %126 = load i32, i32* %p, align 4
  %call131 = call i32 @_rl_find_next_mbchar(i8* %125, i32 %126, i32 1, i32 0)
  store i32 %call131, i32* %num, align 4
  br label %while.end

if.end132:                                        ; preds = %if.else126
  br label %if.end133

if.end133:                                        ; preds = %if.end132
  %127 = load i32, i32* %num, align 4
  %inc134 = add nsw i32 %127, 1
  store i32 %inc134, i32* %num, align 4
  br label %while.cond116

while.end:                                        ; preds = %if.then129, %if.then124, %while.cond116
  %128 = load i32, i32* %num, align 4
  store i32 %128, i32* %temp, align 4
  br label %if.end138

if.else135:                                       ; preds = %land.lhs.true112, %land.lhs.true109, %cond.end105
  %129 = load i32, i32* %newlines, align 4
  %add136 = add nsw i32 %129, 1
  %130 = load i32, i32* @_rl_screenwidth, align 4
  %mul137 = mul nsw i32 %add136, %130
  store i32 %mul137, i32* %temp, align 4
  br label %if.end138

if.end138:                                        ; preds = %if.else135, %while.end
  %131 = load i32, i32* %nocorrect, align 4
  %cmp139 = icmp eq i32 %131, 0
  br i1 %cmp139, label %if.then141, label %if.end143

if.then141:                                       ; preds = %if.end138
  %132 = load i32, i32* %wadjust, align 4
  %133 = load i32, i32* %temp, align 4
  %add142 = add nsw i32 %133, %132
  store i32 %add142, i32* %temp, align 4
  br label %if.end143

if.end143:                                        ; preds = %if.then141, %if.end138
  %134 = load i32, i32* %temp, align 4
  %135 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %lbreaks144 = getelementptr inbounds %struct.line_state, %struct.line_state* %135, i32 0, i32 1
  %136 = load i32*, i32** %lbreaks144, align 4
  %137 = load i32, i32* %newlines, align 4
  %inc145 = add nsw i32 %137, 1
  store i32 %inc145, i32* %newlines, align 4
  %arrayidx146 = getelementptr inbounds i32, i32* %136, i32 %inc145
  store i32 %134, i32* %arrayidx146, align 4
  %138 = load i32, i32* %mb_cur_max, align 4
  %cmp147 = icmp sgt i32 %138, 1
  br i1 %cmp147, label %land.lhs.true149, label %if.else159

land.lhs.true149:                                 ; preds = %if.end143
  %139 = load i32, i32* @rl_byte_oriented, align 4
  %cmp150 = icmp eq i32 %139, 0
  br i1 %cmp150, label %land.lhs.true152, label %if.else159

land.lhs.true152:                                 ; preds = %land.lhs.true149
  %140 = load i32, i32* @prompt_multibyte_chars, align 4
  %cmp153 = icmp sgt i32 %140, 0
  br i1 %cmp153, label %if.then155, label %if.else159

if.then155:                                       ; preds = %land.lhs.true152
  %141 = load i8*, i8** @local_prompt, align 4
  %142 = load i32, i32* %n0, align 4
  %143 = load i32, i32* %num, align 4
  %call156 = call i32 @_rl_col_width(i8* %141, i32 %142, i32 %143, i32 1)
  %144 = load i32, i32* %wadjust, align 4
  %sub157 = sub nsw i32 %call156, %144
  %145 = load i32, i32* %lpos, align 4
  %sub158 = sub nsw i32 %145, %sub157
  store i32 %sub158, i32* %lpos, align 4
  br label %if.end161

if.else159:                                       ; preds = %land.lhs.true152, %land.lhs.true149, %if.end143
  %146 = load i32, i32* @_rl_screenwidth, align 4
  %147 = load i32, i32* %lpos, align 4
  %sub160 = sub nsw i32 %147, %146
  store i32 %sub160, i32* %lpos, align 4
  br label %if.end161

if.end161:                                        ; preds = %if.else159, %if.then155
  br label %while.cond

while.end162:                                     ; preds = %while.cond
  %148 = load i32, i32* %newlines, align 4
  store i32 %148, i32* @prompt_last_screen_line, align 4
  store i32 0, i32* %lb_linenum, align 4
  store i32 0, i32* %in, align 4
  %149 = load i32, i32* %mb_cur_max, align 4
  %cmp163 = icmp sgt i32 %149, 1
  br i1 %cmp163, label %land.lhs.true165, label %if.else170

land.lhs.true165:                                 ; preds = %while.end162
  %150 = load i32, i32* @rl_byte_oriented, align 4
  %cmp166 = icmp eq i32 %150, 0
  br i1 %cmp166, label %if.then168, label %if.else170

if.then168:                                       ; preds = %land.lhs.true165
  %151 = bitcast %struct.__mbstate_t* %ps to i8*
  call void @llvm.memset.p0i8.i32(i8* %151, i8 0, i32 8, i32 4, i1 false)
  %152 = load i8*, i8** @rl_line_buffer, align 4
  %153 = load i32, i32* @rl_end, align 4
  %call169 = call i32 @mbrtowc(i32* %wc, i8* %152, i32 %153, %struct.__mbstate_t* %ps)
  store i32 %call169, i32* %wc_bytes, align 4
  br label %if.end171

if.else170:                                       ; preds = %land.lhs.true165, %while.end162
  store i32 1, i32* %wc_bytes, align 4
  br label %if.end171

if.end171:                                        ; preds = %if.else170, %if.then168
  br label %while.cond172

while.cond172:                                    ; preds = %if.end684, %if.end171
  %154 = load i32, i32* %in, align 4
  %155 = load i32, i32* @rl_end, align 4
  %cmp173 = icmp slt i32 %154, %155
  br i1 %cmp173, label %while.body175, label %while.end685

while.body175:                                    ; preds = %while.cond172
  %156 = load i8*, i8** @rl_line_buffer, align 4
  %157 = load i32, i32* %in, align 4
  %arrayidx176 = getelementptr inbounds i8, i8* %156, i32 %157
  %158 = load i8, i8* %arrayidx176, align 1
  %conv177 = zext i8 %158 to i32
  store i32 %conv177, i32* %c, align 4
  %159 = load i32, i32* %mb_cur_max, align 4
  %cmp178 = icmp sgt i32 %159, 1
  br i1 %cmp178, label %land.lhs.true180, label %if.end204

land.lhs.true180:                                 ; preds = %while.body175
  %160 = load i32, i32* @rl_byte_oriented, align 4
  %cmp181 = icmp eq i32 %160, 0
  br i1 %cmp181, label %if.then183, label %if.end204

if.then183:                                       ; preds = %land.lhs.true180
  %161 = load i32, i32* %wc_bytes, align 4
  %cmp184 = icmp eq i32 %161, -1
  br i1 %cmp184, label %if.then189, label %lor.lhs.false186

lor.lhs.false186:                                 ; preds = %if.then183
  %162 = load i32, i32* %wc_bytes, align 4
  %cmp187 = icmp eq i32 %162, -2
  br i1 %cmp187, label %if.then189, label %if.else190

if.then189:                                       ; preds = %lor.lhs.false186, %if.then183
  store i32 1, i32* %wc_bytes, align 4
  store i32 1, i32* %wc_width, align 4
  %163 = bitcast %struct.__mbstate_t* %ps to i8*
  call void @llvm.memset.p0i8.i32(i8* %163, i8 0, i32 8, i32 4, i1 false)
  br label %if.end203

if.else190:                                       ; preds = %lor.lhs.false186
  %164 = load i32, i32* %wc_bytes, align 4
  %cmp191 = icmp eq i32 %164, 0
  br i1 %cmp191, label %if.then193, label %if.else194

if.then193:                                       ; preds = %if.else190
  br label %while.end685

if.else194:                                       ; preds = %if.else190
  %165 = load i32, i32* %wc, align 4
  %call195 = call i32 @_rl_wcwidth(i32 %165)
  store i32 %call195, i32* %temp, align 4
  %166 = load i32, i32* %temp, align 4
  %cmp196 = icmp sge i32 %166, 0
  br i1 %cmp196, label %cond.true198, label %cond.false199

cond.true198:                                     ; preds = %if.else194
  %167 = load i32, i32* %temp, align 4
  br label %cond.end200

cond.false199:                                    ; preds = %if.else194
  br label %cond.end200

cond.end200:                                      ; preds = %cond.false199, %cond.true198
  %cond201 = phi i32 [ %167, %cond.true198 ], [ 1, %cond.false199 ]
  store i32 %cond201, i32* %wc_width, align 4
  br label %if.end202

if.end202:                                        ; preds = %cond.end200
  br label %if.end203

if.end203:                                        ; preds = %if.end202, %if.then189
  br label %if.end204

if.end204:                                        ; preds = %if.end203, %land.lhs.true180, %while.body175
  %168 = load i32, i32* %out, align 4
  %add205 = add nsw i32 %168, 8
  %169 = load i32, i32* @line_size, align 4
  %cmp206 = icmp sge i32 %add205, %169
  br i1 %cmp206, label %if.then208, label %if.end217

if.then208:                                       ; preds = %if.end204
  %170 = load i32, i32* @line_size, align 4
  %mul209 = mul nsw i32 %170, 2
  store i32 %mul209, i32* @line_size, align 4
  %171 = load %struct.line_state*, %struct.line_state** @line_state_visible, align 4
  %line210 = getelementptr inbounds %struct.line_state, %struct.line_state* %171, i32 0, i32 0
  %172 = load i8*, i8** %line210, align 4
  %173 = load i32, i32* @line_size, align 4
  %call211 = call i8* @xrealloc(i8* %172, i32 %173)
  %174 = load %struct.line_state*, %struct.line_state** @line_state_visible, align 4
  %line212 = getelementptr inbounds %struct.line_state, %struct.line_state* %174, i32 0, i32 0
  store i8* %call211, i8** %line212, align 4
  %175 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %line213 = getelementptr inbounds %struct.line_state, %struct.line_state* %175, i32 0, i32 0
  %176 = load i8*, i8** %line213, align 4
  %177 = load i32, i32* @line_size, align 4
  %call214 = call i8* @xrealloc(i8* %176, i32 %177)
  %178 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %line215 = getelementptr inbounds %struct.line_state, %struct.line_state* %178, i32 0, i32 0
  store i8* %call214, i8** %line215, align 4
  %179 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %line216 = getelementptr inbounds %struct.line_state, %struct.line_state* %179, i32 0, i32 0
  %180 = load i8*, i8** %line216, align 4
  store i8* %180, i8** %line, align 4
  br label %if.end217

if.end217:                                        ; preds = %if.then208, %if.end204
  %181 = load i32, i32* %in, align 4
  %182 = load i32, i32* @rl_point, align 4
  %cmp218 = icmp eq i32 %181, %182
  br i1 %cmp218, label %if.then220, label %if.end221

if.then220:                                       ; preds = %if.end217
  %183 = load i32, i32* %out, align 4
  store i32 %183, i32* @cpos_buffer_position, align 4
  %184 = load i32, i32* %newlines, align 4
  store i32 %184, i32* %lb_linenum, align 4
  br label %if.end221

if.end221:                                        ; preds = %if.then220, %if.end217
  %185 = load i32, i32* %c, align 4
  %cmp222 = icmp sgt i32 %185, 127
  br i1 %cmp222, label %land.lhs.true224, label %if.else305

land.lhs.true224:                                 ; preds = %if.end221
  %186 = load i32, i32* %c, align 4
  %cmp225 = icmp sle i32 %186, 255
  br i1 %cmp225, label %land.lhs.true227, label %if.else305

land.lhs.true227:                                 ; preds = %land.lhs.true224
  %187 = load i32, i32* @_rl_output_meta_chars, align 4
  %cmp228 = icmp eq i32 %187, 0
  br i1 %cmp228, label %if.then230, label %if.else305

if.then230:                                       ; preds = %land.lhs.true227
  %188 = load i32, i32* @_rl_output_meta_chars, align 4
  %cmp231 = icmp eq i32 %188, 0
  br i1 %cmp231, label %if.then233, label %if.else262

if.then233:                                       ; preds = %if.then230
  %189 = load i8*, i8** %line, align 4
  %190 = load i32, i32* %out, align 4
  %add.ptr234 = getelementptr inbounds i8, i8* %189, i32 %190
  %191 = load i32, i32* %c, align 4
  %call235 = call i32 (i8*, i8*, ...) @sprintf(i8* %add.ptr234, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i32 %191)
  %192 = load i32, i32* %lpos, align 4
  %add236 = add nsw i32 %192, 4
  %193 = load i32, i32* @_rl_screenwidth, align 4
  %cmp237 = icmp sge i32 %add236, %193
  br i1 %cmp237, label %if.then239, label %if.else258

if.then239:                                       ; preds = %if.then233
  %194 = load i32, i32* @_rl_screenwidth, align 4
  %195 = load i32, i32* %lpos, align 4
  %sub240 = sub nsw i32 %194, %195
  store i32 %sub240, i32* %temp, align 4
  br label %do.body

do.body:                                          ; preds = %if.then239
  %196 = load i32, i32* %newlines, align 4
  %197 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %lbsize = getelementptr inbounds %struct.line_state, %struct.line_state* %197, i32 0, i32 2
  %198 = load i32, i32* %lbsize, align 4
  %sub241 = sub nsw i32 %198, 2
  %cmp242 = icmp sge i32 %196, %sub241
  br i1 %cmp242, label %if.then244, label %if.end252

if.then244:                                       ; preds = %do.body
  %199 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %lbsize245 = getelementptr inbounds %struct.line_state, %struct.line_state* %199, i32 0, i32 2
  %200 = load i32, i32* %lbsize245, align 4
  %mul246 = mul nsw i32 %200, 2
  store i32 %mul246, i32* %lbsize245, align 4
  %201 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %lbreaks247 = getelementptr inbounds %struct.line_state, %struct.line_state* %201, i32 0, i32 1
  %202 = load i32*, i32** %lbreaks247, align 4
  %203 = bitcast i32* %202 to i8*
  %204 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %lbsize248 = getelementptr inbounds %struct.line_state, %struct.line_state* %204, i32 0, i32 2
  %205 = load i32, i32* %lbsize248, align 4
  %mul249 = mul i32 %205, 4
  %call250 = call i8* @xrealloc(i8* %203, i32 %mul249)
  %206 = bitcast i8* %call250 to i32*
  %207 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %lbreaks251 = getelementptr inbounds %struct.line_state, %struct.line_state* %207, i32 0, i32 1
  store i32* %206, i32** %lbreaks251, align 4
  br label %if.end252

if.end252:                                        ; preds = %if.then244, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end252
  %208 = load i32, i32* %out, align 4
  %209 = load i32, i32* %temp, align 4
  %add253 = add nsw i32 %208, %209
  %210 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %lbreaks254 = getelementptr inbounds %struct.line_state, %struct.line_state* %210, i32 0, i32 1
  %211 = load i32*, i32** %lbreaks254, align 4
  %212 = load i32, i32* %newlines, align 4
  %inc255 = add nsw i32 %212, 1
  store i32 %inc255, i32* %newlines, align 4
  %arrayidx256 = getelementptr inbounds i32, i32* %211, i32 %inc255
  store i32 %add253, i32* %arrayidx256, align 4
  %213 = load i32, i32* %temp, align 4
  %sub257 = sub nsw i32 4, %213
  store i32 %sub257, i32* %lpos, align 4
  br label %if.end260

if.else258:                                       ; preds = %if.then233
  %214 = load i32, i32* %lpos, align 4
  %add259 = add nsw i32 %214, 4
  store i32 %add259, i32* %lpos, align 4
  br label %if.end260

if.end260:                                        ; preds = %if.else258, %do.end
  %215 = load i32, i32* %out, align 4
  %add261 = add nsw i32 %215, 4
  store i32 %add261, i32* %out, align 4
  br label %if.end304

if.else262:                                       ; preds = %if.then230
  %216 = load i32, i32* %c, align 4
  %conv263 = trunc i32 %216 to i8
  %217 = load i8*, i8** %line, align 4
  %218 = load i32, i32* %out, align 4
  %inc264 = add nsw i32 %218, 1
  store i32 %inc264, i32* %out, align 4
  %arrayidx265 = getelementptr inbounds i8, i8* %217, i32 %218
  store i8 %conv263, i8* %arrayidx265, align 1
  br label %do.body266

do.body266:                                       ; preds = %if.else262
  %219 = load i32, i32* %lpos, align 4
  %inc267 = add nsw i32 %219, 1
  store i32 %inc267, i32* %lpos, align 4
  %220 = load i32, i32* %lpos, align 4
  %221 = load i32, i32* @_rl_screenwidth, align 4
  %cmp268 = icmp sge i32 %220, %221
  br i1 %cmp268, label %if.then270, label %if.end302

if.then270:                                       ; preds = %do.body266
  %222 = load i32, i32* %newlines, align 4
  %223 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %lbsize271 = getelementptr inbounds %struct.line_state, %struct.line_state* %223, i32 0, i32 2
  %224 = load i32, i32* %lbsize271, align 4
  %sub272 = sub nsw i32 %224, 2
  %cmp273 = icmp sge i32 %222, %sub272
  br i1 %cmp273, label %if.then275, label %if.end283

if.then275:                                       ; preds = %if.then270
  %225 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %lbsize276 = getelementptr inbounds %struct.line_state, %struct.line_state* %225, i32 0, i32 2
  %226 = load i32, i32* %lbsize276, align 4
  %mul277 = mul nsw i32 %226, 2
  store i32 %mul277, i32* %lbsize276, align 4
  %227 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %lbreaks278 = getelementptr inbounds %struct.line_state, %struct.line_state* %227, i32 0, i32 1
  %228 = load i32*, i32** %lbreaks278, align 4
  %229 = bitcast i32* %228 to i8*
  %230 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %lbsize279 = getelementptr inbounds %struct.line_state, %struct.line_state* %230, i32 0, i32 2
  %231 = load i32, i32* %lbsize279, align 4
  %mul280 = mul i32 %231, 4
  %call281 = call i8* @xrealloc(i8* %229, i32 %mul280)
  %232 = bitcast i8* %call281 to i32*
  %233 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %lbreaks282 = getelementptr inbounds %struct.line_state, %struct.line_state* %233, i32 0, i32 1
  store i32* %232, i32** %lbreaks282, align 4
  br label %if.end283

if.end283:                                        ; preds = %if.then275, %if.then270
  %234 = load i32, i32* %out, align 4
  %235 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %lbreaks284 = getelementptr inbounds %struct.line_state, %struct.line_state* %235, i32 0, i32 1
  %236 = load i32*, i32** %lbreaks284, align 4
  %237 = load i32, i32* %newlines, align 4
  %inc285 = add nsw i32 %237, 1
  store i32 %inc285, i32* %newlines, align 4
  %arrayidx286 = getelementptr inbounds i32, i32* %236, i32 %inc285
  store i32 %234, i32* %arrayidx286, align 4
  %238 = load i32, i32* %newlines, align 4
  %239 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %wbsize287 = getelementptr inbounds %struct.line_state, %struct.line_state* %239, i32 0, i32 3
  %240 = load i32, i32* %wbsize287, align 4
  %sub288 = sub nsw i32 %240, 1
  %cmp289 = icmp sge i32 %238, %sub288
  br i1 %cmp289, label %if.then291, label %if.end299

if.then291:                                       ; preds = %if.end283
  %241 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %wbsize292 = getelementptr inbounds %struct.line_state, %struct.line_state* %241, i32 0, i32 3
  %242 = load i32, i32* %wbsize292, align 4
  %mul293 = mul nsw i32 %242, 2
  store i32 %mul293, i32* %wbsize292, align 4
  %243 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %wrapped_line294 = getelementptr inbounds %struct.line_state, %struct.line_state* %243, i32 0, i32 4
  %244 = load i32*, i32** %wrapped_line294, align 4
  %245 = bitcast i32* %244 to i8*
  %246 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %wbsize295 = getelementptr inbounds %struct.line_state, %struct.line_state* %246, i32 0, i32 3
  %247 = load i32, i32* %wbsize295, align 4
  %mul296 = mul i32 %247, 4
  %call297 = call i8* @xrealloc(i8* %245, i32 %mul296)
  %248 = bitcast i8* %call297 to i32*
  %249 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %wrapped_line298 = getelementptr inbounds %struct.line_state, %struct.line_state* %249, i32 0, i32 4
  store i32* %248, i32** %wrapped_line298, align 4
  br label %if.end299

if.end299:                                        ; preds = %if.then291, %if.end283
  %250 = load i32, i32* %_rl_wrapped_multicolumn, align 4
  %251 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %wrapped_line300 = getelementptr inbounds %struct.line_state, %struct.line_state* %251, i32 0, i32 4
  %252 = load i32*, i32** %wrapped_line300, align 4
  %253 = load i32, i32* %newlines, align 4
  %arrayidx301 = getelementptr inbounds i32, i32* %252, i32 %253
  store i32 %250, i32* %arrayidx301, align 4
  store i32 0, i32* %lpos, align 4
  br label %if.end302

if.end302:                                        ; preds = %if.end299, %do.body266
  br label %do.end303

do.end303:                                        ; preds = %if.end302
  br label %if.end304

if.end304:                                        ; preds = %do.end303, %if.end260
  br label %if.end671

if.else305:                                       ; preds = %land.lhs.true227, %land.lhs.true224, %if.end221
  %254 = load i32, i32* %c, align 4
  %cmp306 = icmp eq i32 %254, 9
  br i1 %cmp306, label %if.then308, label %if.else355

if.then308:                                       ; preds = %if.else305
  %255 = load i32, i32* %out, align 4
  %add309 = add nsw i32 %255, 8
  %256 = load i32, i32* %lpos, align 4
  %rem310 = srem i32 %256, 8
  %sub311 = sub nsw i32 %add309, %rem310
  store i32 %sub311, i32* %newout, align 4
  %257 = load i32, i32* %newout, align 4
  %258 = load i32, i32* %out, align 4
  %sub312 = sub nsw i32 %257, %258
  store i32 %sub312, i32* %temp, align 4
  %259 = load i32, i32* %lpos, align 4
  %260 = load i32, i32* %temp, align 4
  %add313 = add nsw i32 %259, %260
  %261 = load i32, i32* @_rl_screenwidth, align 4
  %cmp314 = icmp sge i32 %add313, %261
  br i1 %cmp314, label %if.then316, label %if.else345

if.then316:                                       ; preds = %if.then308
  %262 = load i32, i32* @_rl_screenwidth, align 4
  %263 = load i32, i32* %lpos, align 4
  %sub317 = sub nsw i32 %262, %263
  store i32 %sub317, i32* %temp2, align 4
  br label %do.body318

do.body318:                                       ; preds = %if.then316
  %264 = load i32, i32* %newlines, align 4
  %265 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %lbsize319 = getelementptr inbounds %struct.line_state, %struct.line_state* %265, i32 0, i32 2
  %266 = load i32, i32* %lbsize319, align 4
  %sub320 = sub nsw i32 %266, 2
  %cmp321 = icmp sge i32 %264, %sub320
  br i1 %cmp321, label %if.then323, label %if.end331

if.then323:                                       ; preds = %do.body318
  %267 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %lbsize324 = getelementptr inbounds %struct.line_state, %struct.line_state* %267, i32 0, i32 2
  %268 = load i32, i32* %lbsize324, align 4
  %mul325 = mul nsw i32 %268, 2
  store i32 %mul325, i32* %lbsize324, align 4
  %269 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %lbreaks326 = getelementptr inbounds %struct.line_state, %struct.line_state* %269, i32 0, i32 1
  %270 = load i32*, i32** %lbreaks326, align 4
  %271 = bitcast i32* %270 to i8*
  %272 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %lbsize327 = getelementptr inbounds %struct.line_state, %struct.line_state* %272, i32 0, i32 2
  %273 = load i32, i32* %lbsize327, align 4
  %mul328 = mul i32 %273, 4
  %call329 = call i8* @xrealloc(i8* %271, i32 %mul328)
  %274 = bitcast i8* %call329 to i32*
  %275 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %lbreaks330 = getelementptr inbounds %struct.line_state, %struct.line_state* %275, i32 0, i32 1
  store i32* %274, i32** %lbreaks330, align 4
  br label %if.end331

if.end331:                                        ; preds = %if.then323, %do.body318
  br label %do.end332

do.end332:                                        ; preds = %if.end331
  %276 = load i32, i32* %out, align 4
  %277 = load i32, i32* %temp2, align 4
  %add333 = add nsw i32 %276, %277
  %278 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %lbreaks334 = getelementptr inbounds %struct.line_state, %struct.line_state* %278, i32 0, i32 1
  %279 = load i32*, i32** %lbreaks334, align 4
  %280 = load i32, i32* %newlines, align 4
  %inc335 = add nsw i32 %280, 1
  store i32 %inc335, i32* %newlines, align 4
  %arrayidx336 = getelementptr inbounds i32, i32* %279, i32 %inc335
  store i32 %add333, i32* %arrayidx336, align 4
  %281 = load i32, i32* %temp, align 4
  %282 = load i32, i32* %temp2, align 4
  %sub337 = sub nsw i32 %281, %282
  store i32 %sub337, i32* %lpos, align 4
  br label %while.cond338

while.cond338:                                    ; preds = %while.body341, %do.end332
  %283 = load i32, i32* %out, align 4
  %284 = load i32, i32* %newout, align 4
  %cmp339 = icmp slt i32 %283, %284
  br i1 %cmp339, label %while.body341, label %while.end344

while.body341:                                    ; preds = %while.cond338
  %285 = load i8*, i8** %line, align 4
  %286 = load i32, i32* %out, align 4
  %inc342 = add nsw i32 %286, 1
  store i32 %inc342, i32* %out, align 4
  %arrayidx343 = getelementptr inbounds i8, i8* %285, i32 %286
  store i8 32, i8* %arrayidx343, align 1
  br label %while.cond338

while.end344:                                     ; preds = %while.cond338
  br label %if.end354

if.else345:                                       ; preds = %if.then308
  br label %while.cond346

while.cond346:                                    ; preds = %while.body349, %if.else345
  %287 = load i32, i32* %out, align 4
  %288 = load i32, i32* %newout, align 4
  %cmp347 = icmp slt i32 %287, %288
  br i1 %cmp347, label %while.body349, label %while.end352

while.body349:                                    ; preds = %while.cond346
  %289 = load i8*, i8** %line, align 4
  %290 = load i32, i32* %out, align 4
  %inc350 = add nsw i32 %290, 1
  store i32 %inc350, i32* %out, align 4
  %arrayidx351 = getelementptr inbounds i8, i8* %289, i32 %290
  store i8 32, i8* %arrayidx351, align 1
  br label %while.cond346

while.end352:                                     ; preds = %while.cond346
  %291 = load i32, i32* %temp, align 4
  %292 = load i32, i32* %lpos, align 4
  %add353 = add nsw i32 %292, %291
  store i32 %add353, i32* %lpos, align 4
  br label %if.end354

if.end354:                                        ; preds = %while.end352, %while.end344
  br label %if.end670

if.else355:                                       ; preds = %if.else305
  %293 = load i32, i32* %c, align 4
  %cmp356 = icmp eq i32 %293, 10
  br i1 %cmp356, label %land.lhs.true358, label %if.else387

land.lhs.true358:                                 ; preds = %if.else355
  %294 = load i32, i32* @_rl_horizontal_scroll_mode, align 4
  %cmp359 = icmp eq i32 %294, 0
  br i1 %cmp359, label %land.lhs.true361, label %if.else387

land.lhs.true361:                                 ; preds = %land.lhs.true358
  %295 = load i8*, i8** @_rl_term_up, align 4
  %tobool362 = icmp ne i8* %295, null
  br i1 %tobool362, label %land.lhs.true363, label %if.else387

land.lhs.true363:                                 ; preds = %land.lhs.true361
  %296 = load i8*, i8** @_rl_term_up, align 4
  %297 = load i8, i8* %296, align 1
  %conv364 = sext i8 %297 to i32
  %tobool365 = icmp ne i32 %conv364, 0
  br i1 %tobool365, label %if.then366, label %if.else387

if.then366:                                       ; preds = %land.lhs.true363
  %298 = load i8*, i8** %line, align 4
  %299 = load i32, i32* %out, align 4
  %inc367 = add nsw i32 %299, 1
  store i32 %inc367, i32* %out, align 4
  %arrayidx368 = getelementptr inbounds i8, i8* %298, i32 %299
  store i8 0, i8* %arrayidx368, align 1
  br label %do.body369

do.body369:                                       ; preds = %if.then366
  %300 = load i32, i32* %newlines, align 4
  %301 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %lbsize370 = getelementptr inbounds %struct.line_state, %struct.line_state* %301, i32 0, i32 2
  %302 = load i32, i32* %lbsize370, align 4
  %sub371 = sub nsw i32 %302, 2
  %cmp372 = icmp sge i32 %300, %sub371
  br i1 %cmp372, label %if.then374, label %if.end382

if.then374:                                       ; preds = %do.body369
  %303 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %lbsize375 = getelementptr inbounds %struct.line_state, %struct.line_state* %303, i32 0, i32 2
  %304 = load i32, i32* %lbsize375, align 4
  %mul376 = mul nsw i32 %304, 2
  store i32 %mul376, i32* %lbsize375, align 4
  %305 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %lbreaks377 = getelementptr inbounds %struct.line_state, %struct.line_state* %305, i32 0, i32 1
  %306 = load i32*, i32** %lbreaks377, align 4
  %307 = bitcast i32* %306 to i8*
  %308 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %lbsize378 = getelementptr inbounds %struct.line_state, %struct.line_state* %308, i32 0, i32 2
  %309 = load i32, i32* %lbsize378, align 4
  %mul379 = mul i32 %309, 4
  %call380 = call i8* @xrealloc(i8* %307, i32 %mul379)
  %310 = bitcast i8* %call380 to i32*
  %311 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %lbreaks381 = getelementptr inbounds %struct.line_state, %struct.line_state* %311, i32 0, i32 1
  store i32* %310, i32** %lbreaks381, align 4
  br label %if.end382

if.end382:                                        ; preds = %if.then374, %do.body369
  br label %do.end383

do.end383:                                        ; preds = %if.end382
  %312 = load i32, i32* %out, align 4
  %313 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %lbreaks384 = getelementptr inbounds %struct.line_state, %struct.line_state* %313, i32 0, i32 1
  %314 = load i32*, i32** %lbreaks384, align 4
  %315 = load i32, i32* %newlines, align 4
  %inc385 = add nsw i32 %315, 1
  store i32 %inc385, i32* %newlines, align 4
  %arrayidx386 = getelementptr inbounds i32, i32* %314, i32 %inc385
  store i32 %312, i32* %arrayidx386, align 4
  store i32 0, i32* %lpos, align 4
  br label %if.end669

if.else387:                                       ; preds = %land.lhs.true363, %land.lhs.true361, %land.lhs.true358, %if.else355
  %316 = load i32, i32* %c, align 4
  %cmp388 = icmp slt i32 %316, 32
  br i1 %cmp388, label %land.lhs.true390, label %lor.lhs.false393

land.lhs.true390:                                 ; preds = %if.else387
  %317 = load i32, i32* %c, align 4
  %and = and i32 %317, 128
  %cmp391 = icmp eq i32 %and, 0
  br i1 %cmp391, label %if.then396, label %lor.lhs.false393

lor.lhs.false393:                                 ; preds = %land.lhs.true390, %if.else387
  %318 = load i32, i32* %c, align 4
  %cmp394 = icmp eq i32 %318, 127
  br i1 %cmp394, label %if.then396, label %if.else509

if.then396:                                       ; preds = %lor.lhs.false393, %land.lhs.true390
  %319 = load i8*, i8** %line, align 4
  %320 = load i32, i32* %out, align 4
  %inc397 = add nsw i32 %320, 1
  store i32 %inc397, i32* %out, align 4
  %arrayidx398 = getelementptr inbounds i8, i8* %319, i32 %320
  store i8 94, i8* %arrayidx398, align 1
  br label %do.body399

do.body399:                                       ; preds = %if.then396
  %321 = load i32, i32* %lpos, align 4
  %inc400 = add nsw i32 %321, 1
  store i32 %inc400, i32* %lpos, align 4
  %322 = load i32, i32* %lpos, align 4
  %323 = load i32, i32* @_rl_screenwidth, align 4
  %cmp401 = icmp sge i32 %322, %323
  br i1 %cmp401, label %if.then403, label %if.end435

if.then403:                                       ; preds = %do.body399
  %324 = load i32, i32* %newlines, align 4
  %325 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %lbsize404 = getelementptr inbounds %struct.line_state, %struct.line_state* %325, i32 0, i32 2
  %326 = load i32, i32* %lbsize404, align 4
  %sub405 = sub nsw i32 %326, 2
  %cmp406 = icmp sge i32 %324, %sub405
  br i1 %cmp406, label %if.then408, label %if.end416

if.then408:                                       ; preds = %if.then403
  %327 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %lbsize409 = getelementptr inbounds %struct.line_state, %struct.line_state* %327, i32 0, i32 2
  %328 = load i32, i32* %lbsize409, align 4
  %mul410 = mul nsw i32 %328, 2
  store i32 %mul410, i32* %lbsize409, align 4
  %329 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %lbreaks411 = getelementptr inbounds %struct.line_state, %struct.line_state* %329, i32 0, i32 1
  %330 = load i32*, i32** %lbreaks411, align 4
  %331 = bitcast i32* %330 to i8*
  %332 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %lbsize412 = getelementptr inbounds %struct.line_state, %struct.line_state* %332, i32 0, i32 2
  %333 = load i32, i32* %lbsize412, align 4
  %mul413 = mul i32 %333, 4
  %call414 = call i8* @xrealloc(i8* %331, i32 %mul413)
  %334 = bitcast i8* %call414 to i32*
  %335 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %lbreaks415 = getelementptr inbounds %struct.line_state, %struct.line_state* %335, i32 0, i32 1
  store i32* %334, i32** %lbreaks415, align 4
  br label %if.end416

if.end416:                                        ; preds = %if.then408, %if.then403
  %336 = load i32, i32* %out, align 4
  %337 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %lbreaks417 = getelementptr inbounds %struct.line_state, %struct.line_state* %337, i32 0, i32 1
  %338 = load i32*, i32** %lbreaks417, align 4
  %339 = load i32, i32* %newlines, align 4
  %inc418 = add nsw i32 %339, 1
  store i32 %inc418, i32* %newlines, align 4
  %arrayidx419 = getelementptr inbounds i32, i32* %338, i32 %inc418
  store i32 %336, i32* %arrayidx419, align 4
  %340 = load i32, i32* %newlines, align 4
  %341 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %wbsize420 = getelementptr inbounds %struct.line_state, %struct.line_state* %341, i32 0, i32 3
  %342 = load i32, i32* %wbsize420, align 4
  %sub421 = sub nsw i32 %342, 1
  %cmp422 = icmp sge i32 %340, %sub421
  br i1 %cmp422, label %if.then424, label %if.end432

if.then424:                                       ; preds = %if.end416
  %343 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %wbsize425 = getelementptr inbounds %struct.line_state, %struct.line_state* %343, i32 0, i32 3
  %344 = load i32, i32* %wbsize425, align 4
  %mul426 = mul nsw i32 %344, 2
  store i32 %mul426, i32* %wbsize425, align 4
  %345 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %wrapped_line427 = getelementptr inbounds %struct.line_state, %struct.line_state* %345, i32 0, i32 4
  %346 = load i32*, i32** %wrapped_line427, align 4
  %347 = bitcast i32* %346 to i8*
  %348 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %wbsize428 = getelementptr inbounds %struct.line_state, %struct.line_state* %348, i32 0, i32 3
  %349 = load i32, i32* %wbsize428, align 4
  %mul429 = mul i32 %349, 4
  %call430 = call i8* @xrealloc(i8* %347, i32 %mul429)
  %350 = bitcast i8* %call430 to i32*
  %351 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %wrapped_line431 = getelementptr inbounds %struct.line_state, %struct.line_state* %351, i32 0, i32 4
  store i32* %350, i32** %wrapped_line431, align 4
  br label %if.end432

if.end432:                                        ; preds = %if.then424, %if.end416
  %352 = load i32, i32* %_rl_wrapped_multicolumn, align 4
  %353 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %wrapped_line433 = getelementptr inbounds %struct.line_state, %struct.line_state* %353, i32 0, i32 4
  %354 = load i32*, i32** %wrapped_line433, align 4
  %355 = load i32, i32* %newlines, align 4
  %arrayidx434 = getelementptr inbounds i32, i32* %354, i32 %355
  store i32 %352, i32* %arrayidx434, align 4
  store i32 0, i32* %lpos, align 4
  br label %if.end435

if.end435:                                        ; preds = %if.end432, %do.body399
  br label %do.end436

do.end436:                                        ; preds = %if.end435
  %356 = load i32, i32* %c, align 4
  %cmp437 = icmp slt i32 %356, 32
  br i1 %cmp437, label %land.lhs.true439, label %cond.false465

land.lhs.true439:                                 ; preds = %do.end436
  %357 = load i32, i32* %c, align 4
  %and440 = and i32 %357, 128
  %cmp441 = icmp eq i32 %and440, 0
  br i1 %cmp441, label %cond.true443, label %cond.false465

cond.true443:                                     ; preds = %land.lhs.true439
  %358 = load i32, i32* %c, align 4
  %or444 = or i32 %358, 64
  %conv445 = trunc i32 %or444 to i8
  %conv446 = zext i8 %conv445 to i32
  %359 = load i32, i32* %c, align 4
  %or447 = or i32 %359, 64
  %cmp448 = icmp eq i32 %conv446, %or447
  br i1 %cmp448, label %land.lhs.true450, label %cond.false461

land.lhs.true450:                                 ; preds = %cond.true443
  %360 = load i32, i32* %c, align 4
  %or451 = or i32 %360, 64
  %conv452 = trunc i32 %or451 to i8
  %conv453 = zext i8 %conv452 to i32
  %call454 = call i32 @islower(i32 %conv453) #5
  %tobool455 = icmp ne i32 %call454, 0
  br i1 %tobool455, label %cond.true456, label %cond.false461

cond.true456:                                     ; preds = %land.lhs.true450
  %361 = load i32, i32* %c, align 4
  %or457 = or i32 %361, 64
  %conv458 = trunc i32 %or457 to i8
  %conv459 = zext i8 %conv458 to i32
  %call460 = call i32 @toupper(i32 %conv459) #5
  br label %cond.end463

cond.false461:                                    ; preds = %land.lhs.true450, %cond.true443
  %362 = load i32, i32* %c, align 4
  %or462 = or i32 %362, 64
  br label %cond.end463

cond.end463:                                      ; preds = %cond.false461, %cond.true456
  %cond464 = phi i32 [ %call460, %cond.true456 ], [ %or462, %cond.false461 ]
  br label %cond.end466

cond.false465:                                    ; preds = %land.lhs.true439, %do.end436
  br label %cond.end466

cond.end466:                                      ; preds = %cond.false465, %cond.end463
  %cond467 = phi i32 [ %cond464, %cond.end463 ], [ 63, %cond.false465 ]
  %conv468 = trunc i32 %cond467 to i8
  %363 = load i8*, i8** %line, align 4
  %364 = load i32, i32* %out, align 4
  %inc469 = add nsw i32 %364, 1
  store i32 %inc469, i32* %out, align 4
  %arrayidx470 = getelementptr inbounds i8, i8* %363, i32 %364
  store i8 %conv468, i8* %arrayidx470, align 1
  br label %do.body471

do.body471:                                       ; preds = %cond.end466
  %365 = load i32, i32* %lpos, align 4
  %inc472 = add nsw i32 %365, 1
  store i32 %inc472, i32* %lpos, align 4
  %366 = load i32, i32* %lpos, align 4
  %367 = load i32, i32* @_rl_screenwidth, align 4
  %cmp473 = icmp sge i32 %366, %367
  br i1 %cmp473, label %if.then475, label %if.end507

if.then475:                                       ; preds = %do.body471
  %368 = load i32, i32* %newlines, align 4
  %369 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %lbsize476 = getelementptr inbounds %struct.line_state, %struct.line_state* %369, i32 0, i32 2
  %370 = load i32, i32* %lbsize476, align 4
  %sub477 = sub nsw i32 %370, 2
  %cmp478 = icmp sge i32 %368, %sub477
  br i1 %cmp478, label %if.then480, label %if.end488

if.then480:                                       ; preds = %if.then475
  %371 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %lbsize481 = getelementptr inbounds %struct.line_state, %struct.line_state* %371, i32 0, i32 2
  %372 = load i32, i32* %lbsize481, align 4
  %mul482 = mul nsw i32 %372, 2
  store i32 %mul482, i32* %lbsize481, align 4
  %373 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %lbreaks483 = getelementptr inbounds %struct.line_state, %struct.line_state* %373, i32 0, i32 1
  %374 = load i32*, i32** %lbreaks483, align 4
  %375 = bitcast i32* %374 to i8*
  %376 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %lbsize484 = getelementptr inbounds %struct.line_state, %struct.line_state* %376, i32 0, i32 2
  %377 = load i32, i32* %lbsize484, align 4
  %mul485 = mul i32 %377, 4
  %call486 = call i8* @xrealloc(i8* %375, i32 %mul485)
  %378 = bitcast i8* %call486 to i32*
  %379 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %lbreaks487 = getelementptr inbounds %struct.line_state, %struct.line_state* %379, i32 0, i32 1
  store i32* %378, i32** %lbreaks487, align 4
  br label %if.end488

if.end488:                                        ; preds = %if.then480, %if.then475
  %380 = load i32, i32* %out, align 4
  %381 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %lbreaks489 = getelementptr inbounds %struct.line_state, %struct.line_state* %381, i32 0, i32 1
  %382 = load i32*, i32** %lbreaks489, align 4
  %383 = load i32, i32* %newlines, align 4
  %inc490 = add nsw i32 %383, 1
  store i32 %inc490, i32* %newlines, align 4
  %arrayidx491 = getelementptr inbounds i32, i32* %382, i32 %inc490
  store i32 %380, i32* %arrayidx491, align 4
  %384 = load i32, i32* %newlines, align 4
  %385 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %wbsize492 = getelementptr inbounds %struct.line_state, %struct.line_state* %385, i32 0, i32 3
  %386 = load i32, i32* %wbsize492, align 4
  %sub493 = sub nsw i32 %386, 1
  %cmp494 = icmp sge i32 %384, %sub493
  br i1 %cmp494, label %if.then496, label %if.end504

if.then496:                                       ; preds = %if.end488
  %387 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %wbsize497 = getelementptr inbounds %struct.line_state, %struct.line_state* %387, i32 0, i32 3
  %388 = load i32, i32* %wbsize497, align 4
  %mul498 = mul nsw i32 %388, 2
  store i32 %mul498, i32* %wbsize497, align 4
  %389 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %wrapped_line499 = getelementptr inbounds %struct.line_state, %struct.line_state* %389, i32 0, i32 4
  %390 = load i32*, i32** %wrapped_line499, align 4
  %391 = bitcast i32* %390 to i8*
  %392 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %wbsize500 = getelementptr inbounds %struct.line_state, %struct.line_state* %392, i32 0, i32 3
  %393 = load i32, i32* %wbsize500, align 4
  %mul501 = mul i32 %393, 4
  %call502 = call i8* @xrealloc(i8* %391, i32 %mul501)
  %394 = bitcast i8* %call502 to i32*
  %395 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %wrapped_line503 = getelementptr inbounds %struct.line_state, %struct.line_state* %395, i32 0, i32 4
  store i32* %394, i32** %wrapped_line503, align 4
  br label %if.end504

if.end504:                                        ; preds = %if.then496, %if.end488
  %396 = load i32, i32* %_rl_wrapped_multicolumn, align 4
  %397 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %wrapped_line505 = getelementptr inbounds %struct.line_state, %struct.line_state* %397, i32 0, i32 4
  %398 = load i32*, i32** %wrapped_line505, align 4
  %399 = load i32, i32* %newlines, align 4
  %arrayidx506 = getelementptr inbounds i32, i32* %398, i32 %399
  store i32 %396, i32* %arrayidx506, align 4
  store i32 0, i32* %lpos, align 4
  br label %if.end507

if.end507:                                        ; preds = %if.end504, %do.body471
  br label %do.end508

do.end508:                                        ; preds = %if.end507
  br label %if.end668

if.else509:                                       ; preds = %lor.lhs.false393
  %400 = load i32, i32* %mb_cur_max, align 4
  %cmp510 = icmp sgt i32 %400, 1
  br i1 %cmp510, label %land.lhs.true512, label %if.else625

land.lhs.true512:                                 ; preds = %if.else509
  %401 = load i32, i32* @rl_byte_oriented, align 4
  %cmp513 = icmp eq i32 %401, 0
  br i1 %cmp513, label %if.then515, label %if.else625

if.then515:                                       ; preds = %land.lhs.true512
  store i32 0, i32* %_rl_wrapped_multicolumn, align 4
  %402 = load i32, i32* @_rl_screenwidth, align 4
  %403 = load i32, i32* %lpos, align 4
  %404 = load i32, i32* %wc_width, align 4
  %add516 = add nsw i32 %403, %404
  %cmp517 = icmp slt i32 %402, %add516
  br i1 %cmp517, label %if.then519, label %if.end564

if.then519:                                       ; preds = %if.then515
  %405 = load i32, i32* %lpos, align 4
  store i32 %405, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then519
  %406 = load i32, i32* %i, align 4
  %407 = load i32, i32* @_rl_screenwidth, align 4
  %cmp520 = icmp slt i32 %406, %407
  br i1 %cmp520, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %408 = load i8*, i8** %line, align 4
  %409 = load i32, i32* %out, align 4
  %inc522 = add nsw i32 %409, 1
  store i32 %inc522, i32* %out, align 4
  %arrayidx523 = getelementptr inbounds i8, i8* %408, i32 %409
  store i8 32, i8* %arrayidx523, align 1
  %410 = load i32, i32* %_rl_wrapped_multicolumn, align 4
  %inc524 = add nsw i32 %410, 1
  store i32 %inc524, i32* %_rl_wrapped_multicolumn, align 4
  br label %do.body525

do.body525:                                       ; preds = %for.body
  %411 = load i32, i32* %lpos, align 4
  %inc526 = add nsw i32 %411, 1
  store i32 %inc526, i32* %lpos, align 4
  %412 = load i32, i32* %lpos, align 4
  %413 = load i32, i32* @_rl_screenwidth, align 4
  %cmp527 = icmp sge i32 %412, %413
  br i1 %cmp527, label %if.then529, label %if.end561

if.then529:                                       ; preds = %do.body525
  %414 = load i32, i32* %newlines, align 4
  %415 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %lbsize530 = getelementptr inbounds %struct.line_state, %struct.line_state* %415, i32 0, i32 2
  %416 = load i32, i32* %lbsize530, align 4
  %sub531 = sub nsw i32 %416, 2
  %cmp532 = icmp sge i32 %414, %sub531
  br i1 %cmp532, label %if.then534, label %if.end542

if.then534:                                       ; preds = %if.then529
  %417 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %lbsize535 = getelementptr inbounds %struct.line_state, %struct.line_state* %417, i32 0, i32 2
  %418 = load i32, i32* %lbsize535, align 4
  %mul536 = mul nsw i32 %418, 2
  store i32 %mul536, i32* %lbsize535, align 4
  %419 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %lbreaks537 = getelementptr inbounds %struct.line_state, %struct.line_state* %419, i32 0, i32 1
  %420 = load i32*, i32** %lbreaks537, align 4
  %421 = bitcast i32* %420 to i8*
  %422 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %lbsize538 = getelementptr inbounds %struct.line_state, %struct.line_state* %422, i32 0, i32 2
  %423 = load i32, i32* %lbsize538, align 4
  %mul539 = mul i32 %423, 4
  %call540 = call i8* @xrealloc(i8* %421, i32 %mul539)
  %424 = bitcast i8* %call540 to i32*
  %425 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %lbreaks541 = getelementptr inbounds %struct.line_state, %struct.line_state* %425, i32 0, i32 1
  store i32* %424, i32** %lbreaks541, align 4
  br label %if.end542

if.end542:                                        ; preds = %if.then534, %if.then529
  %426 = load i32, i32* %out, align 4
  %427 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %lbreaks543 = getelementptr inbounds %struct.line_state, %struct.line_state* %427, i32 0, i32 1
  %428 = load i32*, i32** %lbreaks543, align 4
  %429 = load i32, i32* %newlines, align 4
  %inc544 = add nsw i32 %429, 1
  store i32 %inc544, i32* %newlines, align 4
  %arrayidx545 = getelementptr inbounds i32, i32* %428, i32 %inc544
  store i32 %426, i32* %arrayidx545, align 4
  %430 = load i32, i32* %newlines, align 4
  %431 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %wbsize546 = getelementptr inbounds %struct.line_state, %struct.line_state* %431, i32 0, i32 3
  %432 = load i32, i32* %wbsize546, align 4
  %sub547 = sub nsw i32 %432, 1
  %cmp548 = icmp sge i32 %430, %sub547
  br i1 %cmp548, label %if.then550, label %if.end558

if.then550:                                       ; preds = %if.end542
  %433 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %wbsize551 = getelementptr inbounds %struct.line_state, %struct.line_state* %433, i32 0, i32 3
  %434 = load i32, i32* %wbsize551, align 4
  %mul552 = mul nsw i32 %434, 2
  store i32 %mul552, i32* %wbsize551, align 4
  %435 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %wrapped_line553 = getelementptr inbounds %struct.line_state, %struct.line_state* %435, i32 0, i32 4
  %436 = load i32*, i32** %wrapped_line553, align 4
  %437 = bitcast i32* %436 to i8*
  %438 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %wbsize554 = getelementptr inbounds %struct.line_state, %struct.line_state* %438, i32 0, i32 3
  %439 = load i32, i32* %wbsize554, align 4
  %mul555 = mul i32 %439, 4
  %call556 = call i8* @xrealloc(i8* %437, i32 %mul555)
  %440 = bitcast i8* %call556 to i32*
  %441 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %wrapped_line557 = getelementptr inbounds %struct.line_state, %struct.line_state* %441, i32 0, i32 4
  store i32* %440, i32** %wrapped_line557, align 4
  br label %if.end558

if.end558:                                        ; preds = %if.then550, %if.end542
  %442 = load i32, i32* %_rl_wrapped_multicolumn, align 4
  %443 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %wrapped_line559 = getelementptr inbounds %struct.line_state, %struct.line_state* %443, i32 0, i32 4
  %444 = load i32*, i32** %wrapped_line559, align 4
  %445 = load i32, i32* %newlines, align 4
  %arrayidx560 = getelementptr inbounds i32, i32* %444, i32 %445
  store i32 %442, i32* %arrayidx560, align 4
  store i32 0, i32* %lpos, align 4
  br label %if.end561

if.end561:                                        ; preds = %if.end558, %do.body525
  br label %do.end562

do.end562:                                        ; preds = %if.end561
  br label %for.inc

for.inc:                                          ; preds = %do.end562
  %446 = load i32, i32* %i, align 4
  %inc563 = add nsw i32 %446, 1
  store i32 %inc563, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  br label %if.end564

if.end564:                                        ; preds = %for.end, %if.then515
  %447 = load i32, i32* %in, align 4
  %448 = load i32, i32* @rl_point, align 4
  %cmp565 = icmp eq i32 %447, %448
  br i1 %cmp565, label %if.then567, label %if.end568

if.then567:                                       ; preds = %if.end564
  %449 = load i32, i32* %out, align 4
  store i32 %449, i32* @cpos_buffer_position, align 4
  %450 = load i32, i32* %newlines, align 4
  store i32 %450, i32* %lb_linenum, align 4
  br label %if.end568

if.end568:                                        ; preds = %if.then567, %if.end564
  %451 = load i32, i32* %in, align 4
  store i32 %451, i32* %i, align 4
  br label %for.cond569

for.cond569:                                      ; preds = %for.inc577, %if.end568
  %452 = load i32, i32* %i, align 4
  %453 = load i32, i32* %in, align 4
  %454 = load i32, i32* %wc_bytes, align 4
  %add570 = add i32 %453, %454
  %cmp571 = icmp ult i32 %452, %add570
  br i1 %cmp571, label %for.body573, label %for.end579

for.body573:                                      ; preds = %for.cond569
  %455 = load i8*, i8** @rl_line_buffer, align 4
  %456 = load i32, i32* %i, align 4
  %arrayidx574 = getelementptr inbounds i8, i8* %455, i32 %456
  %457 = load i8, i8* %arrayidx574, align 1
  %458 = load i8*, i8** %line, align 4
  %459 = load i32, i32* %out, align 4
  %inc575 = add nsw i32 %459, 1
  store i32 %inc575, i32* %out, align 4
  %arrayidx576 = getelementptr inbounds i8, i8* %458, i32 %459
  store i8 %457, i8* %arrayidx576, align 1
  br label %for.inc577

for.inc577:                                       ; preds = %for.body573
  %460 = load i32, i32* %i, align 4
  %inc578 = add nsw i32 %460, 1
  store i32 %inc578, i32* %i, align 4
  br label %for.cond569

for.end579:                                       ; preds = %for.cond569
  store i32 0, i32* %i, align 4
  br label %for.cond580

for.cond580:                                      ; preds = %for.inc622, %for.end579
  %461 = load i32, i32* %i, align 4
  %462 = load i32, i32* %wc_width, align 4
  %cmp581 = icmp slt i32 %461, %462
  br i1 %cmp581, label %for.body583, label %for.end624

for.body583:                                      ; preds = %for.cond580
  br label %do.body584

do.body584:                                       ; preds = %for.body583
  %463 = load i32, i32* %lpos, align 4
  %inc585 = add nsw i32 %463, 1
  store i32 %inc585, i32* %lpos, align 4
  %464 = load i32, i32* %lpos, align 4
  %465 = load i32, i32* @_rl_screenwidth, align 4
  %cmp586 = icmp sge i32 %464, %465
  br i1 %cmp586, label %if.then588, label %if.end620

if.then588:                                       ; preds = %do.body584
  %466 = load i32, i32* %newlines, align 4
  %467 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %lbsize589 = getelementptr inbounds %struct.line_state, %struct.line_state* %467, i32 0, i32 2
  %468 = load i32, i32* %lbsize589, align 4
  %sub590 = sub nsw i32 %468, 2
  %cmp591 = icmp sge i32 %466, %sub590
  br i1 %cmp591, label %if.then593, label %if.end601

if.then593:                                       ; preds = %if.then588
  %469 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %lbsize594 = getelementptr inbounds %struct.line_state, %struct.line_state* %469, i32 0, i32 2
  %470 = load i32, i32* %lbsize594, align 4
  %mul595 = mul nsw i32 %470, 2
  store i32 %mul595, i32* %lbsize594, align 4
  %471 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %lbreaks596 = getelementptr inbounds %struct.line_state, %struct.line_state* %471, i32 0, i32 1
  %472 = load i32*, i32** %lbreaks596, align 4
  %473 = bitcast i32* %472 to i8*
  %474 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %lbsize597 = getelementptr inbounds %struct.line_state, %struct.line_state* %474, i32 0, i32 2
  %475 = load i32, i32* %lbsize597, align 4
  %mul598 = mul i32 %475, 4
  %call599 = call i8* @xrealloc(i8* %473, i32 %mul598)
  %476 = bitcast i8* %call599 to i32*
  %477 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %lbreaks600 = getelementptr inbounds %struct.line_state, %struct.line_state* %477, i32 0, i32 1
  store i32* %476, i32** %lbreaks600, align 4
  br label %if.end601

if.end601:                                        ; preds = %if.then593, %if.then588
  %478 = load i32, i32* %out, align 4
  %479 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %lbreaks602 = getelementptr inbounds %struct.line_state, %struct.line_state* %479, i32 0, i32 1
  %480 = load i32*, i32** %lbreaks602, align 4
  %481 = load i32, i32* %newlines, align 4
  %inc603 = add nsw i32 %481, 1
  store i32 %inc603, i32* %newlines, align 4
  %arrayidx604 = getelementptr inbounds i32, i32* %480, i32 %inc603
  store i32 %478, i32* %arrayidx604, align 4
  %482 = load i32, i32* %newlines, align 4
  %483 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %wbsize605 = getelementptr inbounds %struct.line_state, %struct.line_state* %483, i32 0, i32 3
  %484 = load i32, i32* %wbsize605, align 4
  %sub606 = sub nsw i32 %484, 1
  %cmp607 = icmp sge i32 %482, %sub606
  br i1 %cmp607, label %if.then609, label %if.end617

if.then609:                                       ; preds = %if.end601
  %485 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %wbsize610 = getelementptr inbounds %struct.line_state, %struct.line_state* %485, i32 0, i32 3
  %486 = load i32, i32* %wbsize610, align 4
  %mul611 = mul nsw i32 %486, 2
  store i32 %mul611, i32* %wbsize610, align 4
  %487 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %wrapped_line612 = getelementptr inbounds %struct.line_state, %struct.line_state* %487, i32 0, i32 4
  %488 = load i32*, i32** %wrapped_line612, align 4
  %489 = bitcast i32* %488 to i8*
  %490 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %wbsize613 = getelementptr inbounds %struct.line_state, %struct.line_state* %490, i32 0, i32 3
  %491 = load i32, i32* %wbsize613, align 4
  %mul614 = mul i32 %491, 4
  %call615 = call i8* @xrealloc(i8* %489, i32 %mul614)
  %492 = bitcast i8* %call615 to i32*
  %493 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %wrapped_line616 = getelementptr inbounds %struct.line_state, %struct.line_state* %493, i32 0, i32 4
  store i32* %492, i32** %wrapped_line616, align 4
  br label %if.end617

if.end617:                                        ; preds = %if.then609, %if.end601
  %494 = load i32, i32* %_rl_wrapped_multicolumn, align 4
  %495 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %wrapped_line618 = getelementptr inbounds %struct.line_state, %struct.line_state* %495, i32 0, i32 4
  %496 = load i32*, i32** %wrapped_line618, align 4
  %497 = load i32, i32* %newlines, align 4
  %arrayidx619 = getelementptr inbounds i32, i32* %496, i32 %497
  store i32 %494, i32* %arrayidx619, align 4
  store i32 0, i32* %lpos, align 4
  br label %if.end620

if.end620:                                        ; preds = %if.end617, %do.body584
  br label %do.end621

do.end621:                                        ; preds = %if.end620
  br label %for.inc622

for.inc622:                                       ; preds = %do.end621
  %498 = load i32, i32* %i, align 4
  %inc623 = add nsw i32 %498, 1
  store i32 %inc623, i32* %i, align 4
  br label %for.cond580

for.end624:                                       ; preds = %for.cond580
  br label %if.end667

if.else625:                                       ; preds = %land.lhs.true512, %if.else509
  %499 = load i32, i32* %c, align 4
  %conv626 = trunc i32 %499 to i8
  %500 = load i8*, i8** %line, align 4
  %501 = load i32, i32* %out, align 4
  %inc627 = add nsw i32 %501, 1
  store i32 %inc627, i32* %out, align 4
  %arrayidx628 = getelementptr inbounds i8, i8* %500, i32 %501
  store i8 %conv626, i8* %arrayidx628, align 1
  br label %do.body629

do.body629:                                       ; preds = %if.else625
  %502 = load i32, i32* %lpos, align 4
  %inc630 = add nsw i32 %502, 1
  store i32 %inc630, i32* %lpos, align 4
  %503 = load i32, i32* %lpos, align 4
  %504 = load i32, i32* @_rl_screenwidth, align 4
  %cmp631 = icmp sge i32 %503, %504
  br i1 %cmp631, label %if.then633, label %if.end665

if.then633:                                       ; preds = %do.body629
  %505 = load i32, i32* %newlines, align 4
  %506 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %lbsize634 = getelementptr inbounds %struct.line_state, %struct.line_state* %506, i32 0, i32 2
  %507 = load i32, i32* %lbsize634, align 4
  %sub635 = sub nsw i32 %507, 2
  %cmp636 = icmp sge i32 %505, %sub635
  br i1 %cmp636, label %if.then638, label %if.end646

if.then638:                                       ; preds = %if.then633
  %508 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %lbsize639 = getelementptr inbounds %struct.line_state, %struct.line_state* %508, i32 0, i32 2
  %509 = load i32, i32* %lbsize639, align 4
  %mul640 = mul nsw i32 %509, 2
  store i32 %mul640, i32* %lbsize639, align 4
  %510 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %lbreaks641 = getelementptr inbounds %struct.line_state, %struct.line_state* %510, i32 0, i32 1
  %511 = load i32*, i32** %lbreaks641, align 4
  %512 = bitcast i32* %511 to i8*
  %513 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %lbsize642 = getelementptr inbounds %struct.line_state, %struct.line_state* %513, i32 0, i32 2
  %514 = load i32, i32* %lbsize642, align 4
  %mul643 = mul i32 %514, 4
  %call644 = call i8* @xrealloc(i8* %512, i32 %mul643)
  %515 = bitcast i8* %call644 to i32*
  %516 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %lbreaks645 = getelementptr inbounds %struct.line_state, %struct.line_state* %516, i32 0, i32 1
  store i32* %515, i32** %lbreaks645, align 4
  br label %if.end646

if.end646:                                        ; preds = %if.then638, %if.then633
  %517 = load i32, i32* %out, align 4
  %518 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %lbreaks647 = getelementptr inbounds %struct.line_state, %struct.line_state* %518, i32 0, i32 1
  %519 = load i32*, i32** %lbreaks647, align 4
  %520 = load i32, i32* %newlines, align 4
  %inc648 = add nsw i32 %520, 1
  store i32 %inc648, i32* %newlines, align 4
  %arrayidx649 = getelementptr inbounds i32, i32* %519, i32 %inc648
  store i32 %517, i32* %arrayidx649, align 4
  %521 = load i32, i32* %newlines, align 4
  %522 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %wbsize650 = getelementptr inbounds %struct.line_state, %struct.line_state* %522, i32 0, i32 3
  %523 = load i32, i32* %wbsize650, align 4
  %sub651 = sub nsw i32 %523, 1
  %cmp652 = icmp sge i32 %521, %sub651
  br i1 %cmp652, label %if.then654, label %if.end662

if.then654:                                       ; preds = %if.end646
  %524 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %wbsize655 = getelementptr inbounds %struct.line_state, %struct.line_state* %524, i32 0, i32 3
  %525 = load i32, i32* %wbsize655, align 4
  %mul656 = mul nsw i32 %525, 2
  store i32 %mul656, i32* %wbsize655, align 4
  %526 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %wrapped_line657 = getelementptr inbounds %struct.line_state, %struct.line_state* %526, i32 0, i32 4
  %527 = load i32*, i32** %wrapped_line657, align 4
  %528 = bitcast i32* %527 to i8*
  %529 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %wbsize658 = getelementptr inbounds %struct.line_state, %struct.line_state* %529, i32 0, i32 3
  %530 = load i32, i32* %wbsize658, align 4
  %mul659 = mul i32 %530, 4
  %call660 = call i8* @xrealloc(i8* %528, i32 %mul659)
  %531 = bitcast i8* %call660 to i32*
  %532 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %wrapped_line661 = getelementptr inbounds %struct.line_state, %struct.line_state* %532, i32 0, i32 4
  store i32* %531, i32** %wrapped_line661, align 4
  br label %if.end662

if.end662:                                        ; preds = %if.then654, %if.end646
  %533 = load i32, i32* %_rl_wrapped_multicolumn, align 4
  %534 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %wrapped_line663 = getelementptr inbounds %struct.line_state, %struct.line_state* %534, i32 0, i32 4
  %535 = load i32*, i32** %wrapped_line663, align 4
  %536 = load i32, i32* %newlines, align 4
  %arrayidx664 = getelementptr inbounds i32, i32* %535, i32 %536
  store i32 %533, i32* %arrayidx664, align 4
  store i32 0, i32* %lpos, align 4
  br label %if.end665

if.end665:                                        ; preds = %if.end662, %do.body629
  br label %do.end666

do.end666:                                        ; preds = %if.end665
  br label %if.end667

if.end667:                                        ; preds = %do.end666, %for.end624
  br label %if.end668

if.end668:                                        ; preds = %if.end667, %do.end508
  br label %if.end669

if.end669:                                        ; preds = %if.end668, %do.end383
  br label %if.end670

if.end670:                                        ; preds = %if.end669, %if.end354
  br label %if.end671

if.end671:                                        ; preds = %if.end670, %if.end304
  %537 = load i32, i32* %mb_cur_max, align 4
  %cmp672 = icmp sgt i32 %537, 1
  br i1 %cmp672, label %land.lhs.true674, label %if.else682

land.lhs.true674:                                 ; preds = %if.end671
  %538 = load i32, i32* @rl_byte_oriented, align 4
  %cmp675 = icmp eq i32 %538, 0
  br i1 %cmp675, label %if.then677, label %if.else682

if.then677:                                       ; preds = %land.lhs.true674
  %539 = load i32, i32* %wc_bytes, align 4
  %540 = load i32, i32* %in, align 4
  %add678 = add i32 %540, %539
  store i32 %add678, i32* %in, align 4
  %541 = load i8*, i8** @rl_line_buffer, align 4
  %542 = load i32, i32* %in, align 4
  %add.ptr679 = getelementptr inbounds i8, i8* %541, i32 %542
  %543 = load i32, i32* @rl_end, align 4
  %544 = load i32, i32* %in, align 4
  %sub680 = sub nsw i32 %543, %544
  %call681 = call i32 @mbrtowc(i32* %wc, i8* %add.ptr679, i32 %sub680, %struct.__mbstate_t* %ps)
  store i32 %call681, i32* %wc_bytes, align 4
  br label %if.end684

if.else682:                                       ; preds = %land.lhs.true674, %if.end671
  %545 = load i32, i32* %in, align 4
  %inc683 = add nsw i32 %545, 1
  store i32 %inc683, i32* %in, align 4
  br label %if.end684

if.end684:                                        ; preds = %if.else682, %if.then677
  br label %while.cond172

while.end685:                                     ; preds = %if.then193, %while.cond172
  %546 = load i8*, i8** %line, align 4
  %547 = load i32, i32* %out, align 4
  %arrayidx686 = getelementptr inbounds i8, i8* %546, i32 %547
  store i8 0, i8* %arrayidx686, align 1
  %548 = load i32, i32* @cpos_buffer_position, align 4
  %cmp687 = icmp slt i32 %548, 0
  br i1 %cmp687, label %if.then689, label %if.end690

if.then689:                                       ; preds = %while.end685
  %549 = load i32, i32* %out, align 4
  store i32 %549, i32* @cpos_buffer_position, align 4
  %550 = load i32, i32* %newlines, align 4
  store i32 %550, i32* %lb_linenum, align 4
  br label %if.end690

if.end690:                                        ; preds = %if.then689, %while.end685
  %551 = load i32, i32* %newlines, align 4
  store i32 %551, i32* @_rl_inv_botlin, align 4
  store i32 %551, i32* %lb_botlin, align 4
  store i32 %551, i32* %inv_botlin, align 4
  br label %do.body691

do.body691:                                       ; preds = %if.end690
  %552 = load i32, i32* %newlines, align 4
  %553 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %lbsize692 = getelementptr inbounds %struct.line_state, %struct.line_state* %553, i32 0, i32 2
  %554 = load i32, i32* %lbsize692, align 4
  %sub693 = sub nsw i32 %554, 2
  %cmp694 = icmp sge i32 %552, %sub693
  br i1 %cmp694, label %if.then696, label %if.end704

if.then696:                                       ; preds = %do.body691
  %555 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %lbsize697 = getelementptr inbounds %struct.line_state, %struct.line_state* %555, i32 0, i32 2
  %556 = load i32, i32* %lbsize697, align 4
  %mul698 = mul nsw i32 %556, 2
  store i32 %mul698, i32* %lbsize697, align 4
  %557 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %lbreaks699 = getelementptr inbounds %struct.line_state, %struct.line_state* %557, i32 0, i32 1
  %558 = load i32*, i32** %lbreaks699, align 4
  %559 = bitcast i32* %558 to i8*
  %560 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %lbsize700 = getelementptr inbounds %struct.line_state, %struct.line_state* %560, i32 0, i32 2
  %561 = load i32, i32* %lbsize700, align 4
  %mul701 = mul i32 %561, 4
  %call702 = call i8* @xrealloc(i8* %559, i32 %mul701)
  %562 = bitcast i8* %call702 to i32*
  %563 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %lbreaks703 = getelementptr inbounds %struct.line_state, %struct.line_state* %563, i32 0, i32 1
  store i32* %562, i32** %lbreaks703, align 4
  br label %if.end704

if.end704:                                        ; preds = %if.then696, %do.body691
  br label %do.end705

do.end705:                                        ; preds = %if.end704
  %564 = load i32, i32* %out, align 4
  %565 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %lbreaks706 = getelementptr inbounds %struct.line_state, %struct.line_state* %565, i32 0, i32 1
  %566 = load i32*, i32** %lbreaks706, align 4
  %567 = load i32, i32* %newlines, align 4
  %add707 = add nsw i32 %567, 1
  %arrayidx708 = getelementptr inbounds i32, i32* %566, i32 %add707
  store i32 %564, i32* %arrayidx708, align 4
  %568 = load i32, i32* %lb_linenum, align 4
  store i32 %568, i32* %cursor_linenum, align 4
  store i32 1, i32* @displaying_prompt_first_line, align 4
  %569 = load i32, i32* @_rl_horizontal_scroll_mode, align 4
  %cmp709 = icmp eq i32 %569, 0
  br i1 %cmp709, label %land.lhs.true711, label %if.else1002

land.lhs.true711:                                 ; preds = %do.end705
  %570 = load i8*, i8** @_rl_term_up, align 4
  %tobool712 = icmp ne i8* %570, null
  br i1 %tobool712, label %land.lhs.true713, label %if.else1002

land.lhs.true713:                                 ; preds = %land.lhs.true711
  %571 = load i8*, i8** @_rl_term_up, align 4
  %572 = load i8, i8* %571, align 1
  %conv714 = sext i8 %572 to i32
  %tobool715 = icmp ne i32 %conv714, 0
  br i1 %tobool715, label %if.then716, label %if.else1002

if.then716:                                       ; preds = %land.lhs.true713
  %573 = load i32, i32* @rl_display_fixed, align 4
  %tobool717 = icmp ne i32 %573, 0
  br i1 %tobool717, label %lor.lhs.false718, label %if.then720

lor.lhs.false718:                                 ; preds = %if.then716
  %574 = load i32, i32* @forced_display, align 4
  %tobool719 = icmp ne i32 %574, 0
  br i1 %tobool719, label %if.then720, label %if.end1001

if.then720:                                       ; preds = %lor.lhs.false718, %if.then716
  store i32 0, i32* @forced_display, align 4
  %575 = load i32, i32* %out, align 4
  %576 = load i32, i32* @_rl_screenchars, align 4
  %cmp721 = icmp sge i32 %575, %576
  br i1 %cmp721, label %if.then723, label %if.end734

if.then723:                                       ; preds = %if.then720
  %577 = load i32, i32* %mb_cur_max, align 4
  %cmp724 = icmp sgt i32 %577, 1
  br i1 %cmp724, label %land.lhs.true726, label %if.else731

land.lhs.true726:                                 ; preds = %if.then723
  %578 = load i32, i32* @rl_byte_oriented, align 4
  %cmp727 = icmp eq i32 %578, 0
  br i1 %cmp727, label %if.then729, label %if.else731

if.then729:                                       ; preds = %land.lhs.true726
  %579 = load i8*, i8** %line, align 4
  %580 = load i32, i32* @_rl_screenchars, align 4
  %call730 = call i32 @_rl_find_prev_mbchar(i8* %579, i32 %580, i32 0)
  store i32 %call730, i32* %out, align 4
  br label %if.end733

if.else731:                                       ; preds = %land.lhs.true726, %if.then723
  %581 = load i32, i32* @_rl_screenchars, align 4
  %sub732 = sub nsw i32 %581, 1
  store i32 %sub732, i32* %out, align 4
  br label %if.end733

if.end733:                                        ; preds = %if.else731, %if.then729
  br label %if.end734

if.end734:                                        ; preds = %if.end733, %if.then720
  store i32 0, i32* %linenum, align 4
  br label %for.cond735

for.cond735:                                      ; preds = %for.inc864, %if.end734
  %582 = load i32, i32* %linenum, align 4
  %583 = load i32, i32* %inv_botlin, align 4
  %cmp736 = icmp sle i32 %582, %583
  br i1 %cmp736, label %for.body738, label %for.end866

for.body738:                                      ; preds = %for.cond735
  %584 = load i32, i32* @_rl_last_c_pos, align 4
  store i32 %584, i32* %o_cpos, align 4
  store i32 0, i32* @cpos_adjusted, align 4
  %585 = load i32, i32* %linenum, align 4
  %586 = load i32, i32* @_rl_vis_botlin, align 4
  %cmp739 = icmp sgt i32 %585, %586
  br i1 %cmp739, label %cond.true741, label %cond.false742

cond.true741:                                     ; preds = %for.body738
  br label %cond.end747

cond.false742:                                    ; preds = %for.body738
  %587 = load %struct.line_state*, %struct.line_state** @line_state_visible, align 4
  %line743 = getelementptr inbounds %struct.line_state, %struct.line_state* %587, i32 0, i32 0
  %588 = load i8*, i8** %line743, align 4
  %589 = load %struct.line_state*, %struct.line_state** @line_state_visible, align 4
  %lbreaks744 = getelementptr inbounds %struct.line_state, %struct.line_state* %589, i32 0, i32 1
  %590 = load i32*, i32** %lbreaks744, align 4
  %591 = load i32, i32* %linenum, align 4
  %arrayidx745 = getelementptr inbounds i32, i32* %590, i32 %591
  %592 = load i32, i32* %arrayidx745, align 4
  %add.ptr746 = getelementptr inbounds i8, i8* %588, i32 %592
  br label %cond.end747

cond.end747:                                      ; preds = %cond.false742, %cond.true741
  %cond748 = phi i8* [ getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i32 0, i32 0), %cond.true741 ], [ %add.ptr746, %cond.false742 ]
  %593 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %line749 = getelementptr inbounds %struct.line_state, %struct.line_state* %593, i32 0, i32 0
  %594 = load i8*, i8** %line749, align 4
  %595 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %lbreaks750 = getelementptr inbounds %struct.line_state, %struct.line_state* %595, i32 0, i32 1
  %596 = load i32*, i32** %lbreaks750, align 4
  %597 = load i32, i32* %linenum, align 4
  %arrayidx751 = getelementptr inbounds i32, i32* %596, i32 %597
  %598 = load i32, i32* %arrayidx751, align 4
  %add.ptr752 = getelementptr inbounds i8, i8* %594, i32 %598
  %599 = load i32, i32* %linenum, align 4
  %600 = load i32, i32* %linenum, align 4
  %601 = load i32, i32* @_rl_vis_botlin, align 4
  %cmp753 = icmp sgt i32 %600, %601
  br i1 %cmp753, label %cond.true755, label %cond.false756

cond.true755:                                     ; preds = %cond.end747
  br label %cond.end763

cond.false756:                                    ; preds = %cond.end747
  %602 = load %struct.line_state*, %struct.line_state** @line_state_visible, align 4
  %lbreaks757 = getelementptr inbounds %struct.line_state, %struct.line_state* %602, i32 0, i32 1
  %603 = load i32*, i32** %lbreaks757, align 4
  %604 = load i32, i32* %linenum, align 4
  %add758 = add nsw i32 %604, 1
  %arrayidx759 = getelementptr inbounds i32, i32* %603, i32 %add758
  %605 = load i32, i32* %arrayidx759, align 4
  %606 = load %struct.line_state*, %struct.line_state** @line_state_visible, align 4
  %lbreaks760 = getelementptr inbounds %struct.line_state, %struct.line_state* %606, i32 0, i32 1
  %607 = load i32*, i32** %lbreaks760, align 4
  %608 = load i32, i32* %linenum, align 4
  %arrayidx761 = getelementptr inbounds i32, i32* %607, i32 %608
  %609 = load i32, i32* %arrayidx761, align 4
  %sub762 = sub nsw i32 %605, %609
  br label %cond.end763

cond.end763:                                      ; preds = %cond.false756, %cond.true755
  %cond764 = phi i32 [ 0, %cond.true755 ], [ %sub762, %cond.false756 ]
  %610 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %lbreaks765 = getelementptr inbounds %struct.line_state, %struct.line_state* %610, i32 0, i32 1
  %611 = load i32*, i32** %lbreaks765, align 4
  %612 = load i32, i32* %linenum, align 4
  %add766 = add nsw i32 %612, 1
  %arrayidx767 = getelementptr inbounds i32, i32* %611, i32 %add766
  %613 = load i32, i32* %arrayidx767, align 4
  %614 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %lbreaks768 = getelementptr inbounds %struct.line_state, %struct.line_state* %614, i32 0, i32 1
  %615 = load i32*, i32** %lbreaks768, align 4
  %616 = load i32, i32* %linenum, align 4
  %arrayidx769 = getelementptr inbounds i32, i32* %615, i32 %616
  %617 = load i32, i32* %arrayidx769, align 4
  %sub770 = sub nsw i32 %613, %617
  %618 = load i32, i32* %inv_botlin, align 4
  call void @update_line(i8* %cond748, i8* %add.ptr752, i32 %599, i32 %cond764, i32 %sub770, i32 %618)
  %619 = load i32, i32* %linenum, align 4
  %cmp771 = icmp eq i32 %619, 0
  br i1 %cmp771, label %land.lhs.true773, label %if.else793

land.lhs.true773:                                 ; preds = %cond.end763
  %620 = load i32, i32* %mb_cur_max, align 4
  %cmp774 = icmp sgt i32 %620, 1
  br i1 %cmp774, label %land.lhs.true776, label %if.else793

land.lhs.true776:                                 ; preds = %land.lhs.true773
  %621 = load i32, i32* @rl_byte_oriented, align 4
  %cmp777 = icmp eq i32 %621, 0
  br i1 %cmp777, label %land.lhs.true779, label %if.else793

land.lhs.true779:                                 ; preds = %land.lhs.true776
  %622 = load i32, i32* @cpos_adjusted, align 4
  %cmp780 = icmp eq i32 %622, 0
  br i1 %cmp780, label %land.lhs.true782, label %if.else793

land.lhs.true782:                                 ; preds = %land.lhs.true779
  %623 = load i32, i32* @_rl_last_c_pos, align 4
  %624 = load i32, i32* %o_cpos, align 4
  %cmp783 = icmp ne i32 %623, %624
  br i1 %cmp783, label %land.lhs.true785, label %if.else793

land.lhs.true785:                                 ; preds = %land.lhs.true782
  %625 = load i32, i32* @_rl_last_c_pos, align 4
  %626 = load i32, i32* @wrap_offset, align 4
  %cmp786 = icmp sgt i32 %625, %626
  br i1 %cmp786, label %land.lhs.true788, label %if.else793

land.lhs.true788:                                 ; preds = %land.lhs.true785
  %627 = load i32, i32* %o_cpos, align 4
  %628 = load i32, i32* @prompt_last_invisible, align 4
  %cmp789 = icmp slt i32 %627, %628
  br i1 %cmp789, label %if.then791, label %if.else793

if.then791:                                       ; preds = %land.lhs.true788
  %629 = load i32, i32* @prompt_invis_chars_first_line, align 4
  %630 = load i32, i32* @_rl_last_c_pos, align 4
  %sub792 = sub nsw i32 %630, %629
  store i32 %sub792, i32* @_rl_last_c_pos, align 4
  br label %if.end820

if.else793:                                       ; preds = %land.lhs.true788, %land.lhs.true785, %land.lhs.true782, %land.lhs.true779, %land.lhs.true776, %land.lhs.true773, %cond.end763
  %631 = load i32, i32* %linenum, align 4
  %632 = load i32, i32* @prompt_last_screen_line, align 4
  %cmp794 = icmp eq i32 %631, %632
  br i1 %cmp794, label %land.lhs.true796, label %if.end819

land.lhs.true796:                                 ; preds = %if.else793
  %633 = load i32, i32* @prompt_physical_chars, align 4
  %634 = load i32, i32* @_rl_screenwidth, align 4
  %cmp797 = icmp sgt i32 %633, %634
  br i1 %cmp797, label %land.lhs.true799, label %if.end819

land.lhs.true799:                                 ; preds = %land.lhs.true796
  %635 = load i32, i32* %mb_cur_max, align 4
  %cmp800 = icmp sgt i32 %635, 1
  br i1 %cmp800, label %land.lhs.true802, label %if.end819

land.lhs.true802:                                 ; preds = %land.lhs.true799
  %636 = load i32, i32* @rl_byte_oriented, align 4
  %cmp803 = icmp eq i32 %636, 0
  br i1 %cmp803, label %land.lhs.true805, label %if.end819

land.lhs.true805:                                 ; preds = %land.lhs.true802
  %637 = load i32, i32* @cpos_adjusted, align 4
  %cmp806 = icmp eq i32 %637, 0
  br i1 %cmp806, label %land.lhs.true808, label %if.end819

land.lhs.true808:                                 ; preds = %land.lhs.true805
  %638 = load i32, i32* @_rl_last_c_pos, align 4
  %639 = load i32, i32* %o_cpos, align 4
  %cmp809 = icmp ne i32 %638, %639
  br i1 %cmp809, label %land.lhs.true811, label %if.end819

land.lhs.true811:                                 ; preds = %land.lhs.true808
  %640 = load i32, i32* @_rl_last_c_pos, align 4
  %641 = load i32, i32* @prompt_last_invisible, align 4
  %642 = load i32, i32* @_rl_screenwidth, align 4
  %sub812 = sub nsw i32 %641, %642
  %643 = load i32, i32* @prompt_invis_chars_first_line, align 4
  %sub813 = sub nsw i32 %sub812, %643
  %cmp814 = icmp sgt i32 %640, %sub813
  br i1 %cmp814, label %if.then816, label %if.end819

if.then816:                                       ; preds = %land.lhs.true811
  %644 = load i32, i32* @wrap_offset, align 4
  %645 = load i32, i32* @prompt_invis_chars_first_line, align 4
  %sub817 = sub nsw i32 %644, %645
  %646 = load i32, i32* @_rl_last_c_pos, align 4
  %sub818 = sub nsw i32 %646, %sub817
  store i32 %sub818, i32* @_rl_last_c_pos, align 4
  br label %if.end819

if.end819:                                        ; preds = %if.then816, %land.lhs.true811, %land.lhs.true808, %land.lhs.true805, %land.lhs.true802, %land.lhs.true799, %land.lhs.true796, %if.else793
  br label %if.end820

if.end820:                                        ; preds = %if.end819, %if.then791
  %647 = load i32, i32* %linenum, align 4
  %cmp821 = icmp eq i32 %647, 0
  br i1 %cmp821, label %land.lhs.true823, label %if.end850

land.lhs.true823:                                 ; preds = %if.end820
  %648 = load i32, i32* %inv_botlin, align 4
  %cmp824 = icmp eq i32 %648, 0
  br i1 %cmp824, label %land.lhs.true826, label %if.end850

land.lhs.true826:                                 ; preds = %land.lhs.true823
  %649 = load i32, i32* @_rl_last_c_pos, align 4
  %650 = load i32, i32* %out, align 4
  %cmp827 = icmp eq i32 %649, %650
  br i1 %cmp827, label %land.lhs.true829, label %if.end850

land.lhs.true829:                                 ; preds = %land.lhs.true826
  %651 = load i32, i32* @wrap_offset, align 4
  %652 = load i32, i32* @visible_wrap_offset, align 4
  %cmp830 = icmp sgt i32 %651, %652
  br i1 %cmp830, label %land.lhs.true832, label %if.end850

land.lhs.true832:                                 ; preds = %land.lhs.true829
  %653 = load i32, i32* @_rl_last_c_pos, align 4
  %654 = load i32, i32* @visible_first_line_len, align 4
  %cmp833 = icmp slt i32 %653, %654
  br i1 %cmp833, label %if.then835, label %if.end850

if.then835:                                       ; preds = %land.lhs.true832
  %655 = load i32, i32* %mb_cur_max, align 4
  %cmp836 = icmp sgt i32 %655, 1
  br i1 %cmp836, label %land.lhs.true838, label %if.else843

land.lhs.true838:                                 ; preds = %if.then835
  %656 = load i32, i32* @rl_byte_oriented, align 4
  %cmp839 = icmp eq i32 %656, 0
  br i1 %cmp839, label %if.then841, label %if.else843

if.then841:                                       ; preds = %land.lhs.true838
  %657 = load i32, i32* @_rl_screenwidth, align 4
  %658 = load i32, i32* @_rl_last_c_pos, align 4
  %sub842 = sub nsw i32 %657, %658
  store i32 %sub842, i32* %nleft, align 4
  br label %if.end846

if.else843:                                       ; preds = %land.lhs.true838, %if.then835
  %659 = load i32, i32* @_rl_screenwidth, align 4
  %660 = load i32, i32* @wrap_offset, align 4
  %add844 = add nsw i32 %659, %660
  %661 = load i32, i32* @_rl_last_c_pos, align 4
  %sub845 = sub nsw i32 %add844, %661
  store i32 %sub845, i32* %nleft, align 4
  br label %if.end846

if.end846:                                        ; preds = %if.else843, %if.then841
  %662 = load i32, i32* %nleft, align 4
  %tobool847 = icmp ne i32 %662, 0
  br i1 %tobool847, label %if.then848, label %if.end849

if.then848:                                       ; preds = %if.end846
  %663 = load i32, i32* %nleft, align 4
  call void @_rl_clear_to_eol(i32 %663)
  br label %if.end849

if.end849:                                        ; preds = %if.then848, %if.end846
  br label %if.end850

if.end850:                                        ; preds = %if.end849, %land.lhs.true832, %land.lhs.true829, %land.lhs.true826, %land.lhs.true823, %if.end820
  %664 = load i32, i32* %linenum, align 4
  %cmp851 = icmp eq i32 %664, 0
  br i1 %cmp851, label %if.then853, label %if.end863

if.then853:                                       ; preds = %if.end850
  %665 = load i32, i32* %inv_botlin, align 4
  %cmp854 = icmp sgt i32 %665, 0
  br i1 %cmp854, label %cond.true856, label %cond.false859

cond.true856:                                     ; preds = %if.then853
  %666 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %lbreaks857 = getelementptr inbounds %struct.line_state, %struct.line_state* %666, i32 0, i32 1
  %667 = load i32*, i32** %lbreaks857, align 4
  %arrayidx858 = getelementptr inbounds i32, i32* %667, i32 1
  %668 = load i32, i32* %arrayidx858, align 4
  br label %cond.end861

cond.false859:                                    ; preds = %if.then853
  %669 = load i32, i32* %out, align 4
  %670 = load i32, i32* @wrap_offset, align 4
  %sub860 = sub nsw i32 %669, %670
  br label %cond.end861

cond.end861:                                      ; preds = %cond.false859, %cond.true856
  %cond862 = phi i32 [ %668, %cond.true856 ], [ %sub860, %cond.false859 ]
  store i32 %cond862, i32* @visible_first_line_len, align 4
  br label %if.end863

if.end863:                                        ; preds = %cond.end861, %if.end850
  br label %for.inc864

for.inc864:                                       ; preds = %if.end863
  %671 = load i32, i32* %linenum, align 4
  %inc865 = add nsw i32 %671, 1
  store i32 %inc865, i32* %linenum, align 4
  br label %for.cond735

for.end866:                                       ; preds = %for.cond735
  %672 = load i32, i32* @_rl_vis_botlin, align 4
  %673 = load i32, i32* %inv_botlin, align 4
  %cmp867 = icmp sgt i32 %672, %673
  br i1 %cmp867, label %if.then869, label %if.end888

if.then869:                                       ; preds = %for.end866
  br label %for.cond870

for.cond870:                                      ; preds = %for.inc885, %if.then869
  %674 = load i32, i32* %linenum, align 4
  %675 = load i32, i32* @_rl_vis_botlin, align 4
  %cmp871 = icmp sle i32 %674, %675
  br i1 %cmp871, label %for.body873, label %for.end887

for.body873:                                      ; preds = %for.cond870
  %676 = load %struct.line_state*, %struct.line_state** @line_state_visible, align 4
  %line874 = getelementptr inbounds %struct.line_state, %struct.line_state* %676, i32 0, i32 0
  %677 = load i8*, i8** %line874, align 4
  %678 = load %struct.line_state*, %struct.line_state** @line_state_visible, align 4
  %lbreaks875 = getelementptr inbounds %struct.line_state, %struct.line_state* %678, i32 0, i32 1
  %679 = load i32*, i32** %lbreaks875, align 4
  %680 = load i32, i32* %linenum, align 4
  %arrayidx876 = getelementptr inbounds i32, i32* %679, i32 %680
  %681 = load i32, i32* %arrayidx876, align 4
  %add.ptr877 = getelementptr inbounds i8, i8* %677, i32 %681
  store i8* %add.ptr877, i8** %tt, align 4
  %682 = load i32, i32* %linenum, align 4
  call void @_rl_move_vert(i32 %682)
  %683 = load i8*, i8** %tt, align 4
  call void @_rl_move_cursor_relative(i32 0, i8* %683)
  %684 = load i32, i32* %linenum, align 4
  %685 = load i32, i32* @_rl_vis_botlin, align 4
  %cmp878 = icmp eq i32 %684, %685
  br i1 %cmp878, label %cond.true880, label %cond.false882

cond.true880:                                     ; preds = %for.body873
  %686 = load i8*, i8** %tt, align 4
  %call881 = call i32 @strlen(i8* %686)
  br label %cond.end883

cond.false882:                                    ; preds = %for.body873
  %687 = load i32, i32* @_rl_screenwidth, align 4
  br label %cond.end883

cond.end883:                                      ; preds = %cond.false882, %cond.true880
  %cond884 = phi i32 [ %call881, %cond.true880 ], [ %687, %cond.false882 ]
  call void @_rl_clear_to_eol(i32 %cond884)
  br label %for.inc885

for.inc885:                                       ; preds = %cond.end883
  %688 = load i32, i32* %linenum, align 4
  %inc886 = add nsw i32 %688, 1
  store i32 %inc886, i32* %linenum, align 4
  br label %for.cond870

for.end887:                                       ; preds = %for.cond870
  br label %if.end888

if.end888:                                        ; preds = %for.end887, %for.end866
  %689 = load i32, i32* %inv_botlin, align 4
  store i32 %689, i32* @_rl_vis_botlin, align 4
  %690 = load i32, i32* @_rl_last_v_pos, align 4
  %691 = load i32, i32* %cursor_linenum, align 4
  %cmp889 = icmp ne i32 %690, %691
  %conv890 = zext i1 %cmp889 to i32
  store i32 %conv890, i32* %changed_screen_line, align 4
  %692 = load i32, i32* %changed_screen_line, align 4
  %tobool891 = icmp ne i32 %692, 0
  br i1 %tobool891, label %if.then892, label %if.end905

if.then892:                                       ; preds = %if.end888
  %693 = load i32, i32* %cursor_linenum, align 4
  call void @_rl_move_vert(i32 %693)
  %694 = load i32, i32* %mb_cur_max, align 4
  %cmp893 = icmp eq i32 %694, 1
  br i1 %cmp893, label %land.lhs.true897, label %lor.lhs.false895

lor.lhs.false895:                                 ; preds = %if.then892
  %695 = load i32, i32* @rl_byte_oriented, align 4
  %tobool896 = icmp ne i32 %695, 0
  br i1 %tobool896, label %land.lhs.true897, label %if.end904

land.lhs.true897:                                 ; preds = %lor.lhs.false895, %if.then892
  %696 = load i32, i32* %cursor_linenum, align 4
  %cmp898 = icmp eq i32 %696, 0
  br i1 %cmp898, label %land.lhs.true900, label %if.end904

land.lhs.true900:                                 ; preds = %land.lhs.true897
  %697 = load i32, i32* @wrap_offset, align 4
  %tobool901 = icmp ne i32 %697, 0
  br i1 %tobool901, label %if.then902, label %if.end904

if.then902:                                       ; preds = %land.lhs.true900
  %698 = load i32, i32* @wrap_offset, align 4
  %699 = load i32, i32* @_rl_last_c_pos, align 4
  %add903 = add nsw i32 %699, %698
  store i32 %add903, i32* @_rl_last_c_pos, align 4
  br label %if.end904

if.end904:                                        ; preds = %if.then902, %land.lhs.true900, %land.lhs.true897, %lor.lhs.false895
  br label %if.end905

if.end905:                                        ; preds = %if.end904, %if.end888
  %700 = load i32, i32* @prompt_visible_length, align 4
  %701 = load i32, i32* @wrap_offset, align 4
  %add906 = add nsw i32 %700, %701
  store i32 %add906, i32* %nleft, align 4
  %702 = load i32, i32* %cursor_linenum, align 4
  %cmp907 = icmp eq i32 %702, 0
  br i1 %cmp907, label %land.lhs.true909, label %if.end951

land.lhs.true909:                                 ; preds = %if.end905
  %703 = load i32, i32* @wrap_offset, align 4
  %cmp910 = icmp sgt i32 %703, 0
  br i1 %cmp910, label %land.lhs.true912, label %if.end951

land.lhs.true912:                                 ; preds = %land.lhs.true909
  %704 = load i32, i32* @_rl_last_c_pos, align 4
  %cmp913 = icmp sgt i32 %704, 0
  br i1 %cmp913, label %land.lhs.true915, label %if.end951

land.lhs.true915:                                 ; preds = %land.lhs.true912
  %705 = load i32, i32* @_rl_last_c_pos, align 4
  %call916 = call i32 @__ctype_get_mb_cur_max()
  %cmp917 = icmp ugt i32 %call916, 1
  br i1 %cmp917, label %land.lhs.true919, label %cond.false923

land.lhs.true919:                                 ; preds = %land.lhs.true915
  %706 = load i32, i32* @rl_byte_oriented, align 4
  %cmp920 = icmp eq i32 %706, 0
  br i1 %cmp920, label %cond.true922, label %cond.false923

cond.true922:                                     ; preds = %land.lhs.true919
  %707 = load i32, i32* @prompt_physical_chars, align 4
  br label %cond.end925

cond.false923:                                    ; preds = %land.lhs.true919, %land.lhs.true915
  %708 = load i32, i32* @prompt_last_invisible, align 4
  %add924 = add nsw i32 %708, 1
  br label %cond.end925

cond.end925:                                      ; preds = %cond.false923, %cond.true922
  %cond926 = phi i32 [ %707, %cond.true922 ], [ %add924, %cond.false923 ]
  %cmp927 = icmp slt i32 %705, %cond926
  br i1 %cmp927, label %land.lhs.true929, label %if.end951

land.lhs.true929:                                 ; preds = %cond.end925
  %709 = load i8*, i8** @local_prompt, align 4
  %tobool930 = icmp ne i8* %709, null
  br i1 %tobool930, label %if.then931, label %if.end951

if.then931:                                       ; preds = %land.lhs.true929
  %710 = load i8*, i8** @_rl_term_cr, align 4
  %tobool932 = icmp ne i8* %710, null
  br i1 %tobool932, label %if.then933, label %if.end935

if.then933:                                       ; preds = %if.then931
  %711 = load i8*, i8** @_rl_term_cr, align 4
  %call934 = call i32 bitcast (i32 (...)* @tputs to i32 (i8*, i32, i32 (i32)*)*)(i8* %711, i32 1, i32 (i32)* @_rl_output_character_function)
  br label %if.end935

if.end935:                                        ; preds = %if.then933, %if.then931
  %712 = load i32, i32* @modmark, align 4
  %tobool936 = icmp ne i32 %712, 0
  br i1 %tobool936, label %if.then937, label %if.end938

if.then937:                                       ; preds = %if.end935
  call void @_rl_output_some_chars(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i32 0, i32 0), i32 1)
  br label %if.end938

if.end938:                                        ; preds = %if.then937, %if.end935
  %713 = load i8*, i8** @local_prompt, align 4
  %714 = load i32, i32* %nleft, align 4
  call void @_rl_output_some_chars(i8* %713, i32 %714)
  %715 = load i32, i32* %mb_cur_max, align 4
  %cmp939 = icmp sgt i32 %715, 1
  br i1 %cmp939, label %land.lhs.true941, label %if.else948

land.lhs.true941:                                 ; preds = %if.end938
  %716 = load i32, i32* @rl_byte_oriented, align 4
  %cmp942 = icmp eq i32 %716, 0
  br i1 %cmp942, label %if.then944, label %if.else948

if.then944:                                       ; preds = %land.lhs.true941
  %717 = load i8*, i8** @local_prompt, align 4
  %718 = load i32, i32* %nleft, align 4
  %call945 = call i32 @_rl_col_width(i8* %717, i32 0, i32 %718, i32 1)
  %719 = load i32, i32* @wrap_offset, align 4
  %sub946 = sub nsw i32 %call945, %719
  %720 = load i32, i32* @modmark, align 4
  %add947 = add nsw i32 %sub946, %720
  store i32 %add947, i32* @_rl_last_c_pos, align 4
  br label %if.end950

if.else948:                                       ; preds = %land.lhs.true941, %if.end938
  %721 = load i32, i32* %nleft, align 4
  %722 = load i32, i32* @modmark, align 4
  %add949 = add nsw i32 %721, %722
  store i32 %add949, i32* @_rl_last_c_pos, align 4
  br label %if.end950

if.end950:                                        ; preds = %if.else948, %if.then944
  br label %if.end951

if.end951:                                        ; preds = %if.end950, %land.lhs.true929, %cond.end925, %land.lhs.true912, %land.lhs.true909, %if.end905
  %723 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %lbreaks952 = getelementptr inbounds %struct.line_state, %struct.line_state* %723, i32 0, i32 1
  %724 = load i32*, i32** %lbreaks952, align 4
  %725 = load i32, i32* %cursor_linenum, align 4
  %arrayidx953 = getelementptr inbounds i32, i32* %724, i32 %725
  %726 = load i32, i32* %arrayidx953, align 4
  store i32 %726, i32* %pos, align 4
  %727 = load i32, i32* @cpos_buffer_position, align 4
  %728 = load i32, i32* %pos, align 4
  %sub954 = sub nsw i32 %727, %728
  store i32 %sub954, i32* %nleft, align 4
  %729 = load i32, i32* @wrap_offset, align 4
  %tobool955 = icmp ne i32 %729, 0
  br i1 %tobool955, label %land.lhs.true956, label %if.end984

land.lhs.true956:                                 ; preds = %if.end951
  %730 = load i32, i32* %cursor_linenum, align 4
  %cmp957 = icmp eq i32 %730, 0
  br i1 %cmp957, label %land.lhs.true959, label %if.end984

land.lhs.true959:                                 ; preds = %land.lhs.true956
  %731 = load i32, i32* %nleft, align 4
  %732 = load i32, i32* @_rl_last_c_pos, align 4
  %cmp960 = icmp slt i32 %731, %732
  br i1 %cmp960, label %if.then962, label %if.end984

if.then962:                                       ; preds = %land.lhs.true959
  %733 = load i32, i32* %mb_cur_max, align 4
  %cmp963 = icmp sgt i32 %733, 1
  br i1 %cmp963, label %land.lhs.true965, label %if.else973

land.lhs.true965:                                 ; preds = %if.then962
  %734 = load i32, i32* @rl_byte_oriented, align 4
  %cmp966 = icmp eq i32 %734, 0
  br i1 %cmp966, label %if.then968, label %if.else973

if.then968:                                       ; preds = %land.lhs.true965
  %735 = load %struct.line_state*, %struct.line_state** @line_state_visible, align 4
  %line969 = getelementptr inbounds %struct.line_state, %struct.line_state* %735, i32 0, i32 0
  %736 = load i8*, i8** %line969, align 4
  %737 = load i32, i32* %pos, align 4
  %arrayidx970 = getelementptr inbounds i8, i8* %736, i32 %737
  %738 = load i32, i32* %nleft, align 4
  %call971 = call i32 @_rl_col_width(i8* %arrayidx970, i32 0, i32 %738, i32 1)
  %739 = load i32, i32* @visible_wrap_offset, align 4
  %sub972 = sub nsw i32 %call971, %739
  store i32 %sub972, i32* %tx, align 4
  br label %if.end974

if.else973:                                       ; preds = %land.lhs.true965, %if.then962
  %740 = load i32, i32* %nleft, align 4
  store i32 %740, i32* %tx, align 4
  br label %if.end974

if.end974:                                        ; preds = %if.else973, %if.then968
  %741 = load i32, i32* %tx, align 4
  %cmp975 = icmp sge i32 %741, 0
  br i1 %cmp975, label %land.lhs.true977, label %if.end983

land.lhs.true977:                                 ; preds = %if.end974
  %742 = load i32, i32* @_rl_last_c_pos, align 4
  %743 = load i32, i32* %tx, align 4
  %cmp978 = icmp sgt i32 %742, %743
  br i1 %cmp978, label %if.then980, label %if.end983

if.then980:                                       ; preds = %land.lhs.true977
  %744 = load i32, i32* @_rl_last_c_pos, align 4
  %745 = load i32, i32* %tx, align 4
  %sub981 = sub nsw i32 %744, %745
  %call982 = call i32 @_rl_backspace(i32 %sub981)
  %746 = load i32, i32* %tx, align 4
  store i32 %746, i32* @_rl_last_c_pos, align 4
  br label %if.end983

if.end983:                                        ; preds = %if.then980, %land.lhs.true977, %if.end974
  br label %if.end984

if.end984:                                        ; preds = %if.end983, %land.lhs.true959, %land.lhs.true956, %if.end951
  %747 = load i32, i32* %mb_cur_max, align 4
  %cmp985 = icmp sgt i32 %747, 1
  br i1 %cmp985, label %land.lhs.true987, label %if.else993

land.lhs.true987:                                 ; preds = %if.end984
  %748 = load i32, i32* @rl_byte_oriented, align 4
  %cmp988 = icmp eq i32 %748, 0
  br i1 %cmp988, label %if.then990, label %if.else993

if.then990:                                       ; preds = %land.lhs.true987
  %749 = load i32, i32* %nleft, align 4
  %750 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %line991 = getelementptr inbounds %struct.line_state, %struct.line_state* %750, i32 0, i32 0
  %751 = load i8*, i8** %line991, align 4
  %752 = load i32, i32* %pos, align 4
  %arrayidx992 = getelementptr inbounds i8, i8* %751, i32 %752
  call void @_rl_move_cursor_relative(i32 %749, i8* %arrayidx992)
  br label %if.end1000

if.else993:                                       ; preds = %land.lhs.true987, %if.end984
  %753 = load i32, i32* %nleft, align 4
  %754 = load i32, i32* @_rl_last_c_pos, align 4
  %cmp994 = icmp ne i32 %753, %754
  br i1 %cmp994, label %if.then996, label %if.end999

if.then996:                                       ; preds = %if.else993
  %755 = load i32, i32* %nleft, align 4
  %756 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %line997 = getelementptr inbounds %struct.line_state, %struct.line_state* %756, i32 0, i32 0
  %757 = load i8*, i8** %line997, align 4
  %758 = load i32, i32* %pos, align 4
  %arrayidx998 = getelementptr inbounds i8, i8* %757, i32 %758
  call void @_rl_move_cursor_relative(i32 %755, i8* %arrayidx998)
  br label %if.end999

if.end999:                                        ; preds = %if.then996, %if.else993
  br label %if.end1000

if.end1000:                                       ; preds = %if.end999, %if.then990
  br label %if.end1001

if.end1001:                                       ; preds = %if.end1000, %lor.lhs.false718
  br label %if.end1161

if.else1002:                                      ; preds = %land.lhs.true713, %land.lhs.true711, %do.end705
  store i32 0, i32* @_rl_last_v_pos, align 4
  %759 = load i32, i32* @cpos_buffer_position, align 4
  %760 = load i32, i32* @wrap_offset, align 4
  %sub1004 = sub nsw i32 %759, %760
  store i32 %sub1004, i32* %ndisp, align 4
  %761 = load i32, i32* @prompt_visible_length, align 4
  %762 = load i32, i32* @wrap_offset, align 4
  %add1005 = add nsw i32 %761, %762
  store i32 %add1005, i32* %nleft1003, align 4
  %763 = load i32, i32* @cpos_buffer_position, align 4
  %764 = load i32, i32* @last_lmargin, align 4
  %tobool1006 = icmp ne i32 %764, 0
  br i1 %tobool1006, label %cond.true1007, label %cond.false1008

cond.true1007:                                    ; preds = %if.else1002
  %765 = load i32, i32* @last_lmargin, align 4
  br label %cond.end1009

cond.false1008:                                   ; preds = %if.else1002
  %766 = load i32, i32* @wrap_offset, align 4
  br label %cond.end1009

cond.end1009:                                     ; preds = %cond.false1008, %cond.true1007
  %cond1010 = phi i32 [ %765, %cond.true1007 ], [ %766, %cond.false1008 ]
  %sub1011 = sub nsw i32 %763, %cond1010
  store i32 %sub1011, i32* %phys_c_pos, align 4
  %767 = load i32, i32* @_rl_screenwidth, align 4
  %div1012 = sdiv i32 %767, 3
  store i32 %div1012, i32* %t, align 4
  %768 = load i32, i32* %phys_c_pos, align 4
  %769 = load i32, i32* @_rl_screenwidth, align 4
  %sub1013 = sub nsw i32 %769, 2
  %cmp1014 = icmp sgt i32 %768, %sub1013
  br i1 %cmp1014, label %if.then1016, label %if.else1032

if.then1016:                                      ; preds = %cond.end1009
  %770 = load i32, i32* @cpos_buffer_position, align 4
  %771 = load i32, i32* %t, align 4
  %mul1017 = mul nsw i32 2, %771
  %sub1018 = sub nsw i32 %770, %mul1017
  store i32 %sub1018, i32* %lmargin, align 4
  %772 = load i32, i32* %lmargin, align 4
  %cmp1019 = icmp slt i32 %772, 0
  br i1 %cmp1019, label %if.then1021, label %if.end1022

if.then1021:                                      ; preds = %if.then1016
  store i32 0, i32* %lmargin, align 4
  br label %if.end1022

if.end1022:                                       ; preds = %if.then1021, %if.then1016
  %773 = load i32, i32* @wrap_offset, align 4
  %tobool1023 = icmp ne i32 %773, 0
  br i1 %tobool1023, label %land.lhs.true1024, label %if.end1031

land.lhs.true1024:                                ; preds = %if.end1022
  %774 = load i32, i32* %lmargin, align 4
  %cmp1025 = icmp sgt i32 %774, 0
  br i1 %cmp1025, label %land.lhs.true1027, label %if.end1031

land.lhs.true1027:                                ; preds = %land.lhs.true1024
  %775 = load i32, i32* %lmargin, align 4
  %776 = load i32, i32* %nleft1003, align 4
  %cmp1028 = icmp slt i32 %775, %776
  br i1 %cmp1028, label %if.then1030, label %if.end1031

if.then1030:                                      ; preds = %land.lhs.true1027
  %777 = load i32, i32* %nleft1003, align 4
  store i32 %777, i32* %lmargin, align 4
  br label %if.end1031

if.end1031:                                       ; preds = %if.then1030, %land.lhs.true1027, %land.lhs.true1024, %if.end1022
  br label %if.end1056

if.else1032:                                      ; preds = %cond.end1009
  %778 = load i32, i32* %ndisp, align 4
  %779 = load i32, i32* @_rl_screenwidth, align 4
  %sub1033 = sub nsw i32 %779, 2
  %cmp1034 = icmp slt i32 %778, %sub1033
  br i1 %cmp1034, label %if.then1036, label %if.else1037

if.then1036:                                      ; preds = %if.else1032
  store i32 0, i32* %lmargin, align 4
  br label %if.end1055

if.else1037:                                      ; preds = %if.else1032
  %780 = load i32, i32* %phys_c_pos, align 4
  %cmp1038 = icmp slt i32 %780, 1
  br i1 %cmp1038, label %if.then1040, label %if.else1053

if.then1040:                                      ; preds = %if.else1037
  %781 = load i32, i32* @cpos_buffer_position, align 4
  %sub1041 = sub nsw i32 %781, 1
  %782 = load i32, i32* %t, align 4
  %div1042 = sdiv i32 %sub1041, %782
  %783 = load i32, i32* %t, align 4
  %mul1043 = mul nsw i32 %div1042, %783
  store i32 %mul1043, i32* %lmargin, align 4
  %784 = load i32, i32* @wrap_offset, align 4
  %tobool1044 = icmp ne i32 %784, 0
  br i1 %tobool1044, label %land.lhs.true1045, label %if.end1052

land.lhs.true1045:                                ; preds = %if.then1040
  %785 = load i32, i32* %lmargin, align 4
  %cmp1046 = icmp sgt i32 %785, 0
  br i1 %cmp1046, label %land.lhs.true1048, label %if.end1052

land.lhs.true1048:                                ; preds = %land.lhs.true1045
  %786 = load i32, i32* %lmargin, align 4
  %787 = load i32, i32* %nleft1003, align 4
  %cmp1049 = icmp slt i32 %786, %787
  br i1 %cmp1049, label %if.then1051, label %if.end1052

if.then1051:                                      ; preds = %land.lhs.true1048
  %788 = load i32, i32* %nleft1003, align 4
  store i32 %788, i32* %lmargin, align 4
  br label %if.end1052

if.end1052:                                       ; preds = %if.then1051, %land.lhs.true1048, %land.lhs.true1045, %if.then1040
  br label %if.end1054

if.else1053:                                      ; preds = %if.else1037
  %789 = load i32, i32* @last_lmargin, align 4
  store i32 %789, i32* %lmargin, align 4
  br label %if.end1054

if.end1054:                                       ; preds = %if.else1053, %if.end1052
  br label %if.end1055

if.end1055:                                       ; preds = %if.end1054, %if.then1036
  br label %if.end1056

if.end1056:                                       ; preds = %if.end1055, %if.end1031
  %790 = load i32, i32* %lmargin, align 4
  %791 = load i32, i32* %nleft1003, align 4
  %cmp1057 = icmp slt i32 %790, %791
  %conv1058 = zext i1 %cmp1057 to i32
  store i32 %conv1058, i32* @displaying_prompt_first_line, align 4
  %792 = load i32, i32* %lmargin, align 4
  %cmp1059 = icmp sgt i32 %792, 0
  br i1 %cmp1059, label %if.then1061, label %if.end1063

if.then1061:                                      ; preds = %if.end1056
  %793 = load i8*, i8** %line, align 4
  %794 = load i32, i32* %lmargin, align 4
  %arrayidx1062 = getelementptr inbounds i8, i8* %793, i32 %794
  store i8 60, i8* %arrayidx1062, align 1
  br label %if.end1063

if.end1063:                                       ; preds = %if.then1061, %if.end1056
  %795 = load i32, i32* %lmargin, align 4
  %796 = load i32, i32* %lmargin, align 4
  %cmp1064 = icmp eq i32 %796, 0
  br i1 %cmp1064, label %cond.true1066, label %cond.false1067

cond.true1066:                                    ; preds = %if.end1063
  %797 = load i32, i32* @wrap_offset, align 4
  br label %cond.end1068

cond.false1067:                                   ; preds = %if.end1063
  br label %cond.end1068

cond.end1068:                                     ; preds = %cond.false1067, %cond.true1066
  %cond1069 = phi i32 [ %797, %cond.true1066 ], [ 0, %cond.false1067 ]
  %add1070 = add nsw i32 %795, %cond1069
  %798 = load i32, i32* @_rl_screenwidth, align 4
  %add1071 = add nsw i32 %add1070, %798
  store i32 %add1071, i32* %t, align 4
  %799 = load i32, i32* %t, align 4
  %800 = load i32, i32* %out, align 4
  %cmp1072 = icmp slt i32 %799, %800
  br i1 %cmp1072, label %if.then1074, label %if.end1077

if.then1074:                                      ; preds = %cond.end1068
  %801 = load i8*, i8** %line, align 4
  %802 = load i32, i32* %t, align 4
  %sub1075 = sub nsw i32 %802, 1
  %arrayidx1076 = getelementptr inbounds i8, i8* %801, i32 %sub1075
  store i8 62, i8* %arrayidx1076, align 1
  br label %if.end1077

if.end1077:                                       ; preds = %if.then1074, %cond.end1068
  %803 = load i32, i32* @rl_display_fixed, align 4
  %cmp1078 = icmp eq i32 %803, 0
  br i1 %cmp1078, label %if.then1085, label %lor.lhs.false1080

lor.lhs.false1080:                                ; preds = %if.end1077
  %804 = load i32, i32* @forced_display, align 4
  %tobool1081 = icmp ne i32 %804, 0
  br i1 %tobool1081, label %if.then1085, label %lor.lhs.false1082

lor.lhs.false1082:                                ; preds = %lor.lhs.false1080
  %805 = load i32, i32* %lmargin, align 4
  %806 = load i32, i32* @last_lmargin, align 4
  %cmp1083 = icmp ne i32 %805, %806
  br i1 %cmp1083, label %if.then1085, label %if.end1160

if.then1085:                                      ; preds = %lor.lhs.false1082, %lor.lhs.false1080, %if.end1077
  store i32 0, i32* @forced_display, align 4
  %807 = load i32, i32* @_rl_last_c_pos, align 4
  store i32 %807, i32* %o_cpos, align 4
  store i32 0, i32* @cpos_adjusted, align 4
  %808 = load %struct.line_state*, %struct.line_state** @line_state_visible, align 4
  %line1086 = getelementptr inbounds %struct.line_state, %struct.line_state* %808, i32 0, i32 0
  %809 = load i8*, i8** %line1086, align 4
  %810 = load i32, i32* @last_lmargin, align 4
  %arrayidx1087 = getelementptr inbounds i8, i8* %809, i32 %810
  %811 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %line1088 = getelementptr inbounds %struct.line_state, %struct.line_state* %811, i32 0, i32 0
  %812 = load i8*, i8** %line1088, align 4
  %813 = load i32, i32* %lmargin, align 4
  %arrayidx1089 = getelementptr inbounds i8, i8* %812, i32 %813
  %814 = load i32, i32* @_rl_screenwidth, align 4
  %815 = load i32, i32* @visible_wrap_offset, align 4
  %add1090 = add nsw i32 %814, %815
  %816 = load i32, i32* @_rl_screenwidth, align 4
  %817 = load i32, i32* %lmargin, align 4
  %tobool1091 = icmp ne i32 %817, 0
  br i1 %tobool1091, label %cond.true1092, label %cond.false1093

cond.true1092:                                    ; preds = %if.then1085
  br label %cond.end1094

cond.false1093:                                   ; preds = %if.then1085
  %818 = load i32, i32* @wrap_offset, align 4
  br label %cond.end1094

cond.end1094:                                     ; preds = %cond.false1093, %cond.true1092
  %cond1095 = phi i32 [ 0, %cond.true1092 ], [ %818, %cond.false1093 ]
  %add1096 = add nsw i32 %816, %cond1095
  call void @update_line(i8* %arrayidx1087, i8* %arrayidx1089, i32 0, i32 %add1090, i32 %add1096, i32 0)
  %819 = load i32, i32* %mb_cur_max, align 4
  %cmp1097 = icmp sgt i32 %819, 1
  br i1 %cmp1097, label %land.lhs.true1099, label %if.end1118

land.lhs.true1099:                                ; preds = %cond.end1094
  %820 = load i32, i32* @rl_byte_oriented, align 4
  %cmp1100 = icmp eq i32 %820, 0
  br i1 %cmp1100, label %land.lhs.true1102, label %if.end1118

land.lhs.true1102:                                ; preds = %land.lhs.true1099
  %821 = load i32, i32* @displaying_prompt_first_line, align 4
  %tobool1103 = icmp ne i32 %821, 0
  br i1 %tobool1103, label %land.lhs.true1104, label %if.end1118

land.lhs.true1104:                                ; preds = %land.lhs.true1102
  %822 = load i32, i32* @cpos_adjusted, align 4
  %cmp1105 = icmp eq i32 %822, 0
  br i1 %cmp1105, label %land.lhs.true1107, label %if.end1118

land.lhs.true1107:                                ; preds = %land.lhs.true1104
  %823 = load i32, i32* @_rl_last_c_pos, align 4
  %824 = load i32, i32* %o_cpos, align 4
  %cmp1108 = icmp ne i32 %823, %824
  br i1 %cmp1108, label %land.lhs.true1110, label %if.end1118

land.lhs.true1110:                                ; preds = %land.lhs.true1107
  %825 = load i32, i32* @_rl_last_c_pos, align 4
  %826 = load i32, i32* @wrap_offset, align 4
  %cmp1111 = icmp sgt i32 %825, %826
  br i1 %cmp1111, label %land.lhs.true1113, label %if.end1118

land.lhs.true1113:                                ; preds = %land.lhs.true1110
  %827 = load i32, i32* %o_cpos, align 4
  %828 = load i32, i32* @prompt_last_invisible, align 4
  %cmp1114 = icmp slt i32 %827, %828
  br i1 %cmp1114, label %if.then1116, label %if.end1118

if.then1116:                                      ; preds = %land.lhs.true1113
  %829 = load i32, i32* @prompt_invis_chars_first_line, align 4
  %830 = load i32, i32* @_rl_last_c_pos, align 4
  %sub1117 = sub nsw i32 %830, %829
  store i32 %sub1117, i32* @_rl_last_c_pos, align 4
  br label %if.end1118

if.end1118:                                       ; preds = %if.then1116, %land.lhs.true1113, %land.lhs.true1110, %land.lhs.true1107, %land.lhs.true1104, %land.lhs.true1102, %land.lhs.true1099, %cond.end1094
  %831 = load i32, i32* @_rl_last_c_pos, align 4
  %832 = load i32, i32* %lmargin, align 4
  %cmp1119 = icmp eq i32 %832, 0
  br i1 %cmp1119, label %cond.true1121, label %cond.false1122

cond.true1121:                                    ; preds = %if.end1118
  %833 = load i32, i32* @wrap_offset, align 4
  br label %cond.end1123

cond.false1122:                                   ; preds = %if.end1118
  br label %cond.end1123

cond.end1123:                                     ; preds = %cond.false1122, %cond.true1121
  %cond1124 = phi i32 [ %833, %cond.true1121 ], [ 0, %cond.false1122 ]
  %sub1125 = sub nsw i32 %831, %cond1124
  store i32 %sub1125, i32* %t, align 4
  %834 = load i32, i32* %lmargin, align 4
  %cmp1126 = icmp eq i32 %834, 0
  br i1 %cmp1126, label %cond.true1128, label %cond.false1129

cond.true1128:                                    ; preds = %cond.end1123
  %835 = load i32, i32* @wrap_offset, align 4
  br label %cond.end1130

cond.false1129:                                   ; preds = %cond.end1123
  br label %cond.end1130

cond.end1130:                                     ; preds = %cond.false1129, %cond.true1128
  %cond1131 = phi i32 [ %835, %cond.true1128 ], [ 0, %cond.false1129 ]
  %836 = load i32, i32* @visible_wrap_offset, align 4
  %cmp1132 = icmp sgt i32 %cond1131, %836
  br i1 %cmp1132, label %land.lhs.true1134, label %if.end1144

land.lhs.true1134:                                ; preds = %cond.end1130
  %837 = load i32, i32* @_rl_last_c_pos, align 4
  %838 = load i32, i32* %out, align 4
  %cmp1135 = icmp eq i32 %837, %838
  br i1 %cmp1135, label %land.lhs.true1137, label %if.end1144

land.lhs.true1137:                                ; preds = %land.lhs.true1134
  %839 = load i32, i32* @displaying_prompt_first_line, align 4
  %tobool1138 = icmp ne i32 %839, 0
  br i1 %tobool1138, label %land.lhs.true1139, label %if.end1144

land.lhs.true1139:                                ; preds = %land.lhs.true1137
  %840 = load i32, i32* %t, align 4
  %841 = load i32, i32* @visible_first_line_len, align 4
  %cmp1140 = icmp slt i32 %840, %841
  br i1 %cmp1140, label %if.then1142, label %if.end1144

if.then1142:                                      ; preds = %land.lhs.true1139
  %842 = load i32, i32* @_rl_screenwidth, align 4
  %843 = load i32, i32* %t, align 4
  %sub1143 = sub nsw i32 %842, %843
  store i32 %sub1143, i32* %nleft1003, align 4
  %844 = load i32, i32* %nleft1003, align 4
  call void @_rl_clear_to_eol(i32 %844)
  br label %if.end1144

if.end1144:                                       ; preds = %if.then1142, %land.lhs.true1139, %land.lhs.true1137, %land.lhs.true1134, %cond.end1130
  %845 = load i32, i32* %out, align 4
  %846 = load i32, i32* %lmargin, align 4
  %sub1145 = sub nsw i32 %845, %846
  %847 = load i32, i32* %lmargin, align 4
  %cmp1146 = icmp eq i32 %847, 0
  br i1 %cmp1146, label %cond.true1148, label %cond.false1149

cond.true1148:                                    ; preds = %if.end1144
  %848 = load i32, i32* @wrap_offset, align 4
  br label %cond.end1150

cond.false1149:                                   ; preds = %if.end1144
  br label %cond.end1150

cond.end1150:                                     ; preds = %cond.false1149, %cond.true1148
  %cond1151 = phi i32 [ %848, %cond.true1148 ], [ 0, %cond.false1149 ]
  %sub1152 = sub nsw i32 %sub1145, %cond1151
  store i32 %sub1152, i32* @visible_first_line_len, align 4
  %849 = load i32, i32* @visible_first_line_len, align 4
  %850 = load i32, i32* @_rl_screenwidth, align 4
  %cmp1153 = icmp sgt i32 %849, %850
  br i1 %cmp1153, label %if.then1155, label %if.end1156

if.then1155:                                      ; preds = %cond.end1150
  %851 = load i32, i32* @_rl_screenwidth, align 4
  store i32 %851, i32* @visible_first_line_len, align 4
  br label %if.end1156

if.end1156:                                       ; preds = %if.then1155, %cond.end1150
  %852 = load i32, i32* @cpos_buffer_position, align 4
  %853 = load i32, i32* %lmargin, align 4
  %sub1157 = sub nsw i32 %852, %853
  %854 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %line1158 = getelementptr inbounds %struct.line_state, %struct.line_state* %854, i32 0, i32 0
  %855 = load i8*, i8** %line1158, align 4
  %856 = load i32, i32* %lmargin, align 4
  %arrayidx1159 = getelementptr inbounds i8, i8* %855, i32 %856
  call void @_rl_move_cursor_relative(i32 %sub1157, i8* %arrayidx1159)
  %857 = load i32, i32* %lmargin, align 4
  store i32 %857, i32* @last_lmargin, align 4
  br label %if.end1160

if.end1160:                                       ; preds = %if.end1156, %lor.lhs.false1082
  br label %if.end1161

if.end1161:                                       ; preds = %if.end1160, %if.end1001
  %858 = load %struct._IO_FILE*, %struct._IO_FILE** @rl_outstream, align 4
  %call1162 = call i32 @fflush(%struct._IO_FILE* %858)
  %859 = load %struct.line_state*, %struct.line_state** @line_state_visible, align 4
  store %struct.line_state* %859, %struct.line_state** %vtemp, align 4
  %860 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  store %struct.line_state* %860, %struct.line_state** @line_state_visible, align 4
  %861 = load %struct.line_state*, %struct.line_state** %vtemp, align 4
  store %struct.line_state* %861, %struct.line_state** @line_state_invisible, align 4
  store i32 0, i32* @rl_display_fixed, align 4
  %862 = load i32, i32* @_rl_horizontal_scroll_mode, align 4
  %tobool1163 = icmp ne i32 %862, 0
  br i1 %tobool1163, label %land.lhs.true1164, label %if.else1167

land.lhs.true1164:                                ; preds = %if.end1161
  %863 = load i32, i32* @last_lmargin, align 4
  %tobool1165 = icmp ne i32 %863, 0
  br i1 %tobool1165, label %if.then1166, label %if.else1167

if.then1166:                                      ; preds = %land.lhs.true1164
  store i32 0, i32* @visible_wrap_offset, align 4
  br label %if.end1168

if.else1167:                                      ; preds = %land.lhs.true1164, %if.end1161
  %864 = load i32, i32* @wrap_offset, align 4
  store i32 %864, i32* @visible_wrap_offset, align 4
  br label %if.end1168

if.end1168:                                       ; preds = %if.else1167, %if.then1166
  %865 = load i32, i32* @rl_readline_state, align 4
  %and1169 = and i32 %865, -16777217
  store i32 %and1169, i32* @rl_readline_state, align 4
  call void @_rl_release_sigint()
  br label %return

return:                                           ; preds = %if.end1168, %if.then
  ret void
}

; Function Attrs: noinline nounwind
define i8* @_rl_strip_prompt(i8* %pmt) #0 {
entry:
  %pmt.addr = alloca i8*, align 4
  %ret = alloca i8*, align 4
  store i8* %pmt, i8** %pmt.addr, align 4
  %0 = load i8*, i8** %pmt.addr, align 4
  %call = call i8* @expand_prompt(i8* %0, i32 0, i32* null, i32* null, i32* null, i32* null)
  store i8* %call, i8** %ret, align 4
  %1 = load i8*, i8** %ret, align 4
  ret i8* %1
}

; Function Attrs: noinline nounwind
define internal i8* @expand_prompt(i8* %pmt, i32 %flags, i32* %lp, i32* %lip, i32* %niflp, i32* %vlp) #0 {
entry:
  %retval = alloca i8*, align 4
  %pmt.addr = alloca i8*, align 4
  %flags.addr = alloca i32, align 4
  %lp.addr = alloca i32*, align 4
  %lip.addr = alloca i32*, align 4
  %niflp.addr = alloca i32*, align 4
  %vlp.addr = alloca i32*, align 4
  %r = alloca i8*, align 4
  %ret = alloca i8*, align 4
  %p = alloca i8*, align 4
  %igstart = alloca i8*, align 4
  %nprompt = alloca i8*, align 4
  %ms = alloca i8*, align 4
  %l = alloca i32, align 4
  %rl = alloca i32, align 4
  %last = alloca i32, align 4
  %ignoring = alloca i32, align 4
  %ninvis = alloca i32, align 4
  %invfl = alloca i32, align 4
  %invflset = alloca i32, align 4
  %ind = alloca i32, align 4
  %pind = alloca i32, align 4
  %physchars = alloca i32, align 4
  %mlen = alloca i32, align 4
  store i8* %pmt, i8** %pmt.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  store i32* %lp, i32** %lp.addr, align 4
  store i32* %lip, i32** %lip.addr, align 4
  store i32* %niflp, i32** %niflp.addr, align 4
  store i32* %vlp, i32** %vlp.addr, align 4
  %0 = load i8*, i8** %pmt.addr, align 4
  %1 = load i8*, i8** @rl_prompt, align 4
  %cmp = icmp eq i8* %0, %1
  %conv = zext i1 %cmp to i32
  %2 = load i32, i32* %flags.addr, align 4
  %and = and i32 %2, 1
  %xor = xor i32 %conv, %and
  %tobool = icmp ne i32 %xor, 0
  br i1 %tobool, label %land.lhs.true, label %cond.false

land.lhs.true:                                    ; preds = %entry
  %3 = load i32, i32* @_rl_show_mode_in_prompt, align 4
  %tobool1 = icmp ne i32 %3, 0
  br i1 %tobool1, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true
  %call = call i8* @prompt_modestr(i32* %mlen)
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true, %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %call, %cond.true ], [ null, %cond.false ]
  store i8* %cond, i8** %ms, align 4
  %4 = load i8*, i8** %ms, align 4
  %tobool2 = icmp ne i8* %4, null
  br i1 %tobool2, label %if.then, label %if.else

if.then:                                          ; preds = %cond.end
  %5 = load i8*, i8** %pmt.addr, align 4
  %call3 = call i32 @strlen(i8* %5)
  store i32 %call3, i32* %l, align 4
  %6 = load i32, i32* %l, align 4
  %7 = load i32, i32* %mlen, align 4
  %add = add nsw i32 %6, %7
  %add4 = add nsw i32 %add, 1
  %call5 = call i8* @xmalloc(i32 %add4)
  store i8* %call5, i8** %nprompt, align 4
  %8 = load i8*, i8** %nprompt, align 4
  %9 = load i8*, i8** %ms, align 4
  %10 = load i32, i32* %mlen, align 4
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %8, i8* %9, i32 %10, i32 1, i1 false)
  %11 = load i8*, i8** %nprompt, align 4
  %12 = load i32, i32* %mlen, align 4
  %add.ptr = getelementptr inbounds i8, i8* %11, i32 %12
  %13 = load i8*, i8** %pmt.addr, align 4
  %call6 = call i8* @strcpy(i8* %add.ptr, i8* %13)
  br label %if.end

if.else:                                          ; preds = %cond.end
  %14 = load i8*, i8** %pmt.addr, align 4
  store i8* %14, i8** %nprompt, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %call7 = call i32 @__ctype_get_mb_cur_max()
  %cmp8 = icmp ule i32 %call7, 1
  br i1 %cmp8, label %land.lhs.true11, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end
  %15 = load i32, i32* @rl_byte_oriented, align 4
  %tobool10 = icmp ne i32 %15, 0
  br i1 %tobool10, label %land.lhs.true11, label %if.end45

land.lhs.true11:                                  ; preds = %lor.lhs.false, %if.end
  %16 = load i8*, i8** %nprompt, align 4
  %call12 = call i8* @strchr(i8* %16, i32 1)
  %cmp13 = icmp eq i8* %call12, null
  br i1 %cmp13, label %if.then15, label %if.end45

if.then15:                                        ; preds = %land.lhs.true11
  %17 = load i8*, i8** %nprompt, align 4
  %18 = load i8*, i8** %pmt.addr, align 4
  %cmp16 = icmp eq i8* %17, %18
  br i1 %cmp16, label %cond.true18, label %cond.false23

cond.true18:                                      ; preds = %if.then15
  %19 = load i8*, i8** %pmt.addr, align 4
  %call19 = call i32 @strlen(i8* %19)
  %add20 = add i32 1, %call19
  %call21 = call i8* @xmalloc(i32 %add20)
  %20 = load i8*, i8** %pmt.addr, align 4
  %call22 = call i8* @strcpy(i8* %call21, i8* %20)
  br label %cond.end24

cond.false23:                                     ; preds = %if.then15
  %21 = load i8*, i8** %nprompt, align 4
  br label %cond.end24

cond.end24:                                       ; preds = %cond.false23, %cond.true18
  %cond25 = phi i8* [ %call22, %cond.true18 ], [ %21, %cond.false23 ]
  store i8* %cond25, i8** %r, align 4
  %22 = load i32*, i32** %lp.addr, align 4
  %tobool26 = icmp ne i32* %22, null
  br i1 %tobool26, label %if.then27, label %if.end29

if.then27:                                        ; preds = %cond.end24
  %23 = load i8*, i8** %r, align 4
  %call28 = call i32 @strlen(i8* %23)
  %24 = load i32*, i32** %lp.addr, align 4
  store i32 %call28, i32* %24, align 4
  br label %if.end29

if.end29:                                         ; preds = %if.then27, %cond.end24
  %25 = load i32*, i32** %lip.addr, align 4
  %tobool30 = icmp ne i32* %25, null
  br i1 %tobool30, label %if.then31, label %if.end32

if.then31:                                        ; preds = %if.end29
  %26 = load i32*, i32** %lip.addr, align 4
  store i32 0, i32* %26, align 4
  br label %if.end32

if.end32:                                         ; preds = %if.then31, %if.end29
  %27 = load i32*, i32** %niflp.addr, align 4
  %tobool33 = icmp ne i32* %27, null
  br i1 %tobool33, label %if.then34, label %if.end35

if.then34:                                        ; preds = %if.end32
  %28 = load i32*, i32** %niflp.addr, align 4
  store i32 0, i32* %28, align 4
  br label %if.end35

if.end35:                                         ; preds = %if.then34, %if.end32
  %29 = load i32*, i32** %vlp.addr, align 4
  %tobool36 = icmp ne i32* %29, null
  br i1 %tobool36, label %if.then37, label %if.end44

if.then37:                                        ; preds = %if.end35
  %30 = load i32*, i32** %lp.addr, align 4
  %tobool38 = icmp ne i32* %30, null
  br i1 %tobool38, label %cond.true39, label %cond.false40

cond.true39:                                      ; preds = %if.then37
  %31 = load i32*, i32** %lp.addr, align 4
  %32 = load i32, i32* %31, align 4
  br label %cond.end42

cond.false40:                                     ; preds = %if.then37
  %33 = load i8*, i8** %r, align 4
  %call41 = call i32 @strlen(i8* %33)
  br label %cond.end42

cond.end42:                                       ; preds = %cond.false40, %cond.true39
  %cond43 = phi i32 [ %32, %cond.true39 ], [ %call41, %cond.false40 ]
  %34 = load i32*, i32** %vlp.addr, align 4
  store i32 %cond43, i32* %34, align 4
  br label %if.end44

if.end44:                                         ; preds = %cond.end42, %if.end35
  %35 = load i8*, i8** %r, align 4
  store i8* %35, i8** %retval, align 4
  br label %return

if.end45:                                         ; preds = %land.lhs.true11, %lor.lhs.false
  %36 = load i8*, i8** %nprompt, align 4
  %call46 = call i32 @strlen(i8* %36)
  store i32 %call46, i32* %l, align 4
  %37 = load i32, i32* %l, align 4
  %add47 = add nsw i32 %37, 1
  %call48 = call i8* @xmalloc(i32 %add47)
  store i8* %call48, i8** %ret, align 4
  store i8* %call48, i8** %r, align 4
  store i32 0, i32* %physchars, align 4
  store i32 0, i32* %rl, align 4
  store i32 0, i32* %invfl, align 4
  store i32 0, i32* %invflset, align 4
  store i8* null, i8** %igstart, align 4
  store i32 0, i32* %ninvis, align 4
  store i32 0, i32* %last, align 4
  store i32 0, i32* %ignoring, align 4
  %38 = load i8*, i8** %nprompt, align 4
  store i8* %38, i8** %p, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end45
  %39 = load i8*, i8** %p, align 4
  %tobool49 = icmp ne i8* %39, null
  br i1 %tobool49, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.cond
  %40 = load i8*, i8** %p, align 4
  %41 = load i8, i8* %40, align 1
  %conv50 = sext i8 %41 to i32
  %tobool51 = icmp ne i32 %conv50, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %42 = phi i1 [ false, %for.cond ], [ %tobool51, %land.rhs ]
  br i1 %42, label %for.body, label %for.end

for.body:                                         ; preds = %land.end
  %43 = load i32, i32* %ignoring, align 4
  %cmp52 = icmp eq i32 %43, 0
  br i1 %cmp52, label %land.lhs.true54, label %if.else59

land.lhs.true54:                                  ; preds = %for.body
  %44 = load i8*, i8** %p, align 4
  %45 = load i8, i8* %44, align 1
  %conv55 = sext i8 %45 to i32
  %cmp56 = icmp eq i32 %conv55, 1
  br i1 %cmp56, label %if.then58, label %if.else59

if.then58:                                        ; preds = %land.lhs.true54
  store i32 1, i32* %ignoring, align 4
  %46 = load i8*, i8** %p, align 4
  store i8* %46, i8** %igstart, align 4
  br label %for.inc

if.else59:                                        ; preds = %land.lhs.true54, %for.body
  %47 = load i32, i32* %ignoring, align 4
  %tobool60 = icmp ne i32 %47, 0
  br i1 %tobool60, label %land.lhs.true61, label %if.else71

land.lhs.true61:                                  ; preds = %if.else59
  %48 = load i8*, i8** %p, align 4
  %49 = load i8, i8* %48, align 1
  %conv62 = sext i8 %49 to i32
  %cmp63 = icmp eq i32 %conv62, 2
  br i1 %cmp63, label %if.then65, label %if.else71

if.then65:                                        ; preds = %land.lhs.true61
  store i32 0, i32* %ignoring, align 4
  %50 = load i8*, i8** %p, align 4
  %51 = load i8*, i8** %igstart, align 4
  %add.ptr66 = getelementptr inbounds i8, i8* %51, i32 1
  %cmp67 = icmp ne i8* %50, %add.ptr66
  br i1 %cmp67, label %if.then69, label %if.end70

if.then69:                                        ; preds = %if.then65
  %52 = load i8*, i8** %r, align 4
  %53 = load i8*, i8** %ret, align 4
  %sub.ptr.lhs.cast = ptrtoint i8* %52 to i32
  %sub.ptr.rhs.cast = ptrtoint i8* %53 to i32
  %sub.ptr.sub = sub i32 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub = sub nsw i32 %sub.ptr.sub, 1
  store i32 %sub, i32* %last, align 4
  br label %if.end70

if.end70:                                         ; preds = %if.then69, %if.then65
  br label %for.inc

if.else71:                                        ; preds = %land.lhs.true61, %if.else59
  %call72 = call i32 @__ctype_get_mb_cur_max()
  %cmp73 = icmp ugt i32 %call72, 1
  br i1 %cmp73, label %land.lhs.true75, label %if.else97

land.lhs.true75:                                  ; preds = %if.else71
  %54 = load i32, i32* @rl_byte_oriented, align 4
  %cmp76 = icmp eq i32 %54, 0
  br i1 %cmp76, label %if.then78, label %if.else97

if.then78:                                        ; preds = %land.lhs.true75
  %55 = load i8*, i8** %p, align 4
  %56 = load i8*, i8** %nprompt, align 4
  %sub.ptr.lhs.cast79 = ptrtoint i8* %55 to i32
  %sub.ptr.rhs.cast80 = ptrtoint i8* %56 to i32
  %sub.ptr.sub81 = sub i32 %sub.ptr.lhs.cast79, %sub.ptr.rhs.cast80
  store i32 %sub.ptr.sub81, i32* %pind, align 4
  %57 = load i8*, i8** %nprompt, align 4
  %58 = load i32, i32* %pind, align 4
  %call82 = call i32 @_rl_find_next_mbchar(i8* %57, i32 %58, i32 1, i32 1)
  store i32 %call82, i32* %ind, align 4
  %59 = load i32, i32* %ind, align 4
  %60 = load i32, i32* %pind, align 4
  %sub83 = sub nsw i32 %59, %60
  store i32 %sub83, i32* %l, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.then78
  %61 = load i32, i32* %l, align 4
  %dec = add nsw i32 %61, -1
  store i32 %dec, i32* %l, align 4
  %tobool84 = icmp ne i32 %61, 0
  br i1 %tobool84, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %62 = load i8*, i8** %p, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %62, i32 1
  store i8* %incdec.ptr, i8** %p, align 4
  %63 = load i8, i8* %62, align 1
  %64 = load i8*, i8** %r, align 4
  %incdec.ptr85 = getelementptr inbounds i8, i8* %64, i32 1
  store i8* %incdec.ptr85, i8** %r, align 4
  store i8 %63, i8* %64, align 1
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %65 = load i32, i32* %ignoring, align 4
  %tobool86 = icmp ne i32 %65, 0
  br i1 %tobool86, label %if.else92, label %if.then87

if.then87:                                        ; preds = %while.end
  %66 = load i32, i32* %ind, align 4
  %67 = load i32, i32* %pind, align 4
  %sub88 = sub nsw i32 %66, %67
  %68 = load i32, i32* %rl, align 4
  %add89 = add nsw i32 %68, %sub88
  store i32 %add89, i32* %rl, align 4
  %69 = load i8*, i8** %nprompt, align 4
  %70 = load i32, i32* %pind, align 4
  %71 = load i32, i32* %ind, align 4
  %call90 = call i32 @_rl_col_width(i8* %69, i32 %70, i32 %71, i32 0)
  %72 = load i32, i32* %physchars, align 4
  %add91 = add nsw i32 %72, %call90
  store i32 %add91, i32* %physchars, align 4
  br label %if.end95

if.else92:                                        ; preds = %while.end
  %73 = load i32, i32* %ind, align 4
  %74 = load i32, i32* %pind, align 4
  %sub93 = sub nsw i32 %73, %74
  %75 = load i32, i32* %ninvis, align 4
  %add94 = add nsw i32 %75, %sub93
  store i32 %add94, i32* %ninvis, align 4
  br label %if.end95

if.end95:                                         ; preds = %if.else92, %if.then87
  %76 = load i8*, i8** %p, align 4
  %incdec.ptr96 = getelementptr inbounds i8, i8* %76, i32 -1
  store i8* %incdec.ptr96, i8** %p, align 4
  br label %if.end105

if.else97:                                        ; preds = %land.lhs.true75, %if.else71
  %77 = load i8*, i8** %p, align 4
  %78 = load i8, i8* %77, align 1
  %79 = load i8*, i8** %r, align 4
  %incdec.ptr98 = getelementptr inbounds i8, i8* %79, i32 1
  store i8* %incdec.ptr98, i8** %r, align 4
  store i8 %78, i8* %79, align 1
  %80 = load i32, i32* %ignoring, align 4
  %tobool99 = icmp ne i32 %80, 0
  br i1 %tobool99, label %if.else102, label %if.then100

if.then100:                                       ; preds = %if.else97
  %81 = load i32, i32* %rl, align 4
  %inc = add nsw i32 %81, 1
  store i32 %inc, i32* %rl, align 4
  %82 = load i32, i32* %physchars, align 4
  %inc101 = add nsw i32 %82, 1
  store i32 %inc101, i32* %physchars, align 4
  br label %if.end104

if.else102:                                       ; preds = %if.else97
  %83 = load i32, i32* %ninvis, align 4
  %inc103 = add nsw i32 %83, 1
  store i32 %inc103, i32* %ninvis, align 4
  br label %if.end104

if.end104:                                        ; preds = %if.else102, %if.then100
  br label %if.end105

if.end105:                                        ; preds = %if.end104, %if.end95
  %84 = load i32, i32* %invflset, align 4
  %cmp106 = icmp eq i32 %84, 0
  br i1 %cmp106, label %land.lhs.true108, label %if.end112

land.lhs.true108:                                 ; preds = %if.end105
  %85 = load i32, i32* %rl, align 4
  %86 = load i32, i32* @_rl_screenwidth, align 4
  %cmp109 = icmp sge i32 %85, %86
  br i1 %cmp109, label %if.then111, label %if.end112

if.then111:                                       ; preds = %land.lhs.true108
  %87 = load i32, i32* %ninvis, align 4
  store i32 %87, i32* %invfl, align 4
  store i32 1, i32* %invflset, align 4
  br label %if.end112

if.end112:                                        ; preds = %if.then111, %land.lhs.true108, %if.end105
  br label %if.end113

if.end113:                                        ; preds = %if.end112
  br label %if.end114

if.end114:                                        ; preds = %if.end113
  br label %for.inc

for.inc:                                          ; preds = %if.end114, %if.end70, %if.then58
  %88 = load i8*, i8** %p, align 4
  %incdec.ptr115 = getelementptr inbounds i8, i8* %88, i32 1
  store i8* %incdec.ptr115, i8** %p, align 4
  br label %for.cond

for.end:                                          ; preds = %land.end
  %89 = load i32, i32* %rl, align 4
  %90 = load i32, i32* @_rl_screenwidth, align 4
  %cmp116 = icmp slt i32 %89, %90
  br i1 %cmp116, label %if.then118, label %if.end119

if.then118:                                       ; preds = %for.end
  %91 = load i32, i32* %ninvis, align 4
  store i32 %91, i32* %invfl, align 4
  br label %if.end119

if.end119:                                        ; preds = %if.then118, %for.end
  %92 = load i8*, i8** %r, align 4
  store i8 0, i8* %92, align 1
  %93 = load i32*, i32** %lp.addr, align 4
  %tobool120 = icmp ne i32* %93, null
  br i1 %tobool120, label %if.then121, label %if.end122

if.then121:                                       ; preds = %if.end119
  %94 = load i32, i32* %rl, align 4
  %95 = load i32*, i32** %lp.addr, align 4
  store i32 %94, i32* %95, align 4
  br label %if.end122

if.end122:                                        ; preds = %if.then121, %if.end119
  %96 = load i32*, i32** %lip.addr, align 4
  %tobool123 = icmp ne i32* %96, null
  br i1 %tobool123, label %if.then124, label %if.end125

if.then124:                                       ; preds = %if.end122
  %97 = load i32, i32* %last, align 4
  %98 = load i32*, i32** %lip.addr, align 4
  store i32 %97, i32* %98, align 4
  br label %if.end125

if.end125:                                        ; preds = %if.then124, %if.end122
  %99 = load i32*, i32** %niflp.addr, align 4
  %tobool126 = icmp ne i32* %99, null
  br i1 %tobool126, label %if.then127, label %if.end128

if.then127:                                       ; preds = %if.end125
  %100 = load i32, i32* %invfl, align 4
  %101 = load i32*, i32** %niflp.addr, align 4
  store i32 %100, i32* %101, align 4
  br label %if.end128

if.end128:                                        ; preds = %if.then127, %if.end125
  %102 = load i32*, i32** %vlp.addr, align 4
  %tobool129 = icmp ne i32* %102, null
  br i1 %tobool129, label %if.then130, label %if.end131

if.then130:                                       ; preds = %if.end128
  %103 = load i32, i32* %physchars, align 4
  %104 = load i32*, i32** %vlp.addr, align 4
  store i32 %103, i32* %104, align 4
  br label %if.end131

if.end131:                                        ; preds = %if.then130, %if.end128
  %105 = load i8*, i8** %nprompt, align 4
  %106 = load i8*, i8** %pmt.addr, align 4
  %cmp132 = icmp ne i8* %105, %106
  br i1 %cmp132, label %if.then134, label %if.end135

if.then134:                                       ; preds = %if.end131
  %107 = load i8*, i8** %nprompt, align 4
  call void @free(i8* %107)
  br label %if.end135

if.end135:                                        ; preds = %if.then134, %if.end131
  %108 = load i8*, i8** %ret, align 4
  store i8* %108, i8** %retval, align 4
  br label %return

return:                                           ; preds = %if.end135, %if.end44
  %109 = load i8*, i8** %retval, align 4
  ret i8* %109
}

; Function Attrs: noinline nounwind
define void @_rl_reset_prompt() #0 {
entry:
  %0 = load i8*, i8** @rl_prompt, align 4
  %call = call i32 @rl_expand_prompt(i8* %0)
  store i32 %call, i32* @rl_visible_prompt_length, align 4
  ret void
}

; Function Attrs: noinline nounwind
define i32 @rl_expand_prompt(i8* %prompt) #0 {
entry:
  %retval = alloca i32, align 4
  %prompt.addr = alloca i8*, align 4
  %p = alloca i8*, align 4
  %t = alloca i8*, align 4
  %c = alloca i32, align 4
  store i8* %prompt, i8** %prompt.addr, align 4
  %0 = load i8*, i8** @local_prompt, align 4
  %tobool = icmp ne i8* %0, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** @local_prompt, align 4
  call void @free(i8* %1)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %2 = load i8*, i8** @local_prompt_prefix, align 4
  %tobool1 = icmp ne i8* %2, null
  br i1 %tobool1, label %if.then2, label %if.end3

if.then2:                                         ; preds = %if.end
  %3 = load i8*, i8** @local_prompt_prefix, align 4
  call void @free(i8* %3)
  br label %if.end3

if.end3:                                          ; preds = %if.then2, %if.end
  store i8* null, i8** @local_prompt_prefix, align 4
  store i8* null, i8** @local_prompt, align 4
  store i32 0, i32* @local_prompt_len, align 4
  store i32 0, i32* @prompt_invis_chars_first_line, align 4
  store i32 0, i32* @prompt_last_invisible, align 4
  store i32 0, i32* @prompt_physical_chars, align 4
  store i32 0, i32* @prompt_visible_length, align 4
  %4 = load i8*, i8** %prompt.addr, align 4
  %cmp = icmp eq i8* %4, null
  br i1 %cmp, label %if.then6, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end3
  %5 = load i8*, i8** %prompt.addr, align 4
  %6 = load i8, i8* %5, align 1
  %conv = sext i8 %6 to i32
  %cmp4 = icmp eq i32 %conv, 0
  br i1 %cmp4, label %if.then6, label %if.end7

if.then6:                                         ; preds = %lor.lhs.false, %if.end3
  store i32 0, i32* %retval, align 4
  br label %return

if.end7:                                          ; preds = %lor.lhs.false
  %7 = load i8*, i8** %prompt.addr, align 4
  %call = call i8* @strrchr(i8* %7, i32 10)
  store i8* %call, i8** %p, align 4
  %8 = load i8*, i8** %p, align 4
  %cmp8 = icmp eq i8* %8, null
  br i1 %cmp8, label %if.then10, label %if.else

if.then10:                                        ; preds = %if.end7
  %9 = load i8*, i8** %prompt.addr, align 4
  %call11 = call i8* @expand_prompt(i8* %9, i32 0, i32* @prompt_visible_length, i32* @prompt_last_invisible, i32* @prompt_invis_chars_first_line, i32* @prompt_physical_chars)
  store i8* %call11, i8** @local_prompt, align 4
  store i8* null, i8** @local_prompt_prefix, align 4
  %10 = load i8*, i8** @local_prompt, align 4
  %tobool12 = icmp ne i8* %10, null
  br i1 %tobool12, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then10
  %11 = load i8*, i8** @local_prompt, align 4
  %call13 = call i32 @strlen(i8* %11)
  br label %cond.end

cond.false:                                       ; preds = %if.then10
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call13, %cond.true ], [ 0, %cond.false ]
  store i32 %cond, i32* @local_prompt_len, align 4
  %12 = load i32, i32* @prompt_visible_length, align 4
  store i32 %12, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %if.end7
  %13 = load i8*, i8** %p, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %13, i32 1
  store i8* %incdec.ptr, i8** %p, align 4
  store i8* %incdec.ptr, i8** %t, align 4
  %14 = load i8*, i8** %p, align 4
  %call14 = call i8* @expand_prompt(i8* %14, i32 1, i32* @prompt_visible_length, i32* @prompt_last_invisible, i32* @prompt_invis_chars_first_line, i32* @prompt_physical_chars)
  store i8* %call14, i8** @local_prompt, align 4
  %15 = load i8*, i8** %t, align 4
  %16 = load i8, i8* %15, align 1
  %conv15 = sext i8 %16 to i32
  store i32 %conv15, i32* %c, align 4
  %17 = load i8*, i8** %t, align 4
  store i8 0, i8* %17, align 1
  %18 = load i8*, i8** %prompt.addr, align 4
  %call16 = call i8* @expand_prompt(i8* %18, i32 1, i32* @prompt_prefix_length, i32* null, i32* null, i32* null)
  store i8* %call16, i8** @local_prompt_prefix, align 4
  %19 = load i32, i32* %c, align 4
  %conv17 = trunc i32 %19 to i8
  %20 = load i8*, i8** %t, align 4
  store i8 %conv17, i8* %20, align 1
  %21 = load i8*, i8** @local_prompt, align 4
  %tobool18 = icmp ne i8* %21, null
  br i1 %tobool18, label %cond.true19, label %cond.false21

cond.true19:                                      ; preds = %if.else
  %22 = load i8*, i8** @local_prompt, align 4
  %call20 = call i32 @strlen(i8* %22)
  br label %cond.end22

cond.false21:                                     ; preds = %if.else
  br label %cond.end22

cond.end22:                                       ; preds = %cond.false21, %cond.true19
  %cond23 = phi i32 [ %call20, %cond.true19 ], [ 0, %cond.false21 ]
  store i32 %cond23, i32* @local_prompt_len, align 4
  %23 = load i32, i32* @prompt_prefix_length, align 4
  store i32 %23, i32* %retval, align 4
  br label %return

return:                                           ; preds = %cond.end22, %cond.end, %if.then6
  %24 = load i32, i32* %retval, align 4
  ret i32 %24
}

declare void @free(i8*) #1

declare i8* @strrchr(i8*, i32) #1

declare i32 @strlen(i8*) #1

declare i32 @__ctype_get_mb_cur_max() #1

declare void @_rl_block_sigint() #1

; Function Attrs: noinline nounwind
define internal void @init_line_structures(i32 %minsize) #0 {
entry:
  %minsize.addr = alloca i32, align 4
  %n = alloca i32, align 4
  store i32 %minsize, i32* %minsize.addr, align 4
  %0 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %line = getelementptr inbounds %struct.line_state, %struct.line_state* %0, i32 0, i32 0
  %1 = load i8*, i8** %line, align 4
  %cmp = icmp eq i8* %1, null
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %2 = load i32, i32* @line_size, align 4
  %3 = load i32, i32* %minsize.addr, align 4
  %cmp1 = icmp slt i32 %2, %3
  br i1 %cmp1, label %if.then2, label %if.end

if.then2:                                         ; preds = %if.then
  %4 = load i32, i32* %minsize.addr, align 4
  store i32 %4, i32* @line_size, align 4
  br label %if.end

if.end:                                           ; preds = %if.then2, %if.then
  %5 = load i32, i32* @line_size, align 4
  %call = call i8* @xmalloc(i32 %5)
  %6 = load %struct.line_state*, %struct.line_state** @line_state_visible, align 4
  %line3 = getelementptr inbounds %struct.line_state, %struct.line_state* %6, i32 0, i32 0
  store i8* %call, i8** %line3, align 4
  %7 = load i32, i32* @line_size, align 4
  %call4 = call i8* @xmalloc(i32 %7)
  %8 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %line5 = getelementptr inbounds %struct.line_state, %struct.line_state* %8, i32 0, i32 0
  store i8* %call4, i8** %line5, align 4
  br label %if.end18

if.else:                                          ; preds = %entry
  %9 = load i32, i32* @line_size, align 4
  %10 = load i32, i32* %minsize.addr, align 4
  %cmp6 = icmp slt i32 %9, %10
  br i1 %cmp6, label %if.then7, label %if.end17

if.then7:                                         ; preds = %if.else
  %11 = load i32, i32* @line_size, align 4
  %mul = mul nsw i32 %11, 2
  store i32 %mul, i32* @line_size, align 4
  %12 = load i32, i32* @line_size, align 4
  %13 = load i32, i32* %minsize.addr, align 4
  %cmp8 = icmp slt i32 %12, %13
  br i1 %cmp8, label %if.then9, label %if.end10

if.then9:                                         ; preds = %if.then7
  %14 = load i32, i32* %minsize.addr, align 4
  store i32 %14, i32* @line_size, align 4
  br label %if.end10

if.end10:                                         ; preds = %if.then9, %if.then7
  %15 = load %struct.line_state*, %struct.line_state** @line_state_visible, align 4
  %line11 = getelementptr inbounds %struct.line_state, %struct.line_state* %15, i32 0, i32 0
  %16 = load i8*, i8** %line11, align 4
  %17 = load i32, i32* @line_size, align 4
  %call12 = call i8* @xrealloc(i8* %16, i32 %17)
  %18 = load %struct.line_state*, %struct.line_state** @line_state_visible, align 4
  %line13 = getelementptr inbounds %struct.line_state, %struct.line_state* %18, i32 0, i32 0
  store i8* %call12, i8** %line13, align 4
  %19 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %line14 = getelementptr inbounds %struct.line_state, %struct.line_state* %19, i32 0, i32 0
  %20 = load i8*, i8** %line14, align 4
  %21 = load i32, i32* @line_size, align 4
  %call15 = call i8* @xrealloc(i8* %20, i32 %21)
  %22 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %line16 = getelementptr inbounds %struct.line_state, %struct.line_state* %22, i32 0, i32 0
  store i8* %call15, i8** %line16, align 4
  br label %if.end17

if.end17:                                         ; preds = %if.end10, %if.else
  br label %if.end18

if.end18:                                         ; preds = %if.end17, %if.end
  %23 = load i32, i32* %minsize.addr, align 4
  store i32 %23, i32* %n, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end18
  %24 = load i32, i32* %n, align 4
  %25 = load i32, i32* @line_size, align 4
  %cmp19 = icmp slt i32 %24, %25
  br i1 %cmp19, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %26 = load %struct.line_state*, %struct.line_state** @line_state_visible, align 4
  %line20 = getelementptr inbounds %struct.line_state, %struct.line_state* %26, i32 0, i32 0
  %27 = load i8*, i8** %line20, align 4
  %28 = load i32, i32* %n, align 4
  %arrayidx = getelementptr inbounds i8, i8* %27, i32 %28
  store i8 0, i8* %arrayidx, align 1
  %29 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %line21 = getelementptr inbounds %struct.line_state, %struct.line_state* %29, i32 0, i32 0
  %30 = load i8*, i8** %line21, align 4
  %31 = load i32, i32* %n, align 4
  %arrayidx22 = getelementptr inbounds i8, i8* %30, i32 %31
  store i8 1, i8* %arrayidx22, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %32 = load i32, i32* %n, align 4
  %inc = add nsw i32 %32, 1
  store i32 %inc, i32* %n, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %33 = load %struct.line_state*, %struct.line_state** @line_state_visible, align 4
  %lbreaks = getelementptr inbounds %struct.line_state, %struct.line_state* %33, i32 0, i32 1
  %34 = load i32*, i32** %lbreaks, align 4
  %cmp23 = icmp eq i32* %34, null
  br i1 %cmp23, label %if.then24, label %if.end48

if.then24:                                        ; preds = %for.end
  %35 = load %struct.line_state*, %struct.line_state** @line_state_visible, align 4
  %lbsize = getelementptr inbounds %struct.line_state, %struct.line_state* %35, i32 0, i32 2
  store i32 256, i32* %lbsize, align 4
  %36 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %lbsize25 = getelementptr inbounds %struct.line_state, %struct.line_state* %36, i32 0, i32 2
  store i32 256, i32* %lbsize25, align 4
  %37 = load %struct.line_state*, %struct.line_state** @line_state_visible, align 4
  %lbsize26 = getelementptr inbounds %struct.line_state, %struct.line_state* %37, i32 0, i32 2
  %38 = load i32, i32* %lbsize26, align 4
  %39 = load %struct.line_state*, %struct.line_state** @line_state_visible, align 4
  %wbsize = getelementptr inbounds %struct.line_state, %struct.line_state* %39, i32 0, i32 3
  store i32 %38, i32* %wbsize, align 4
  %40 = load %struct.line_state*, %struct.line_state** @line_state_visible, align 4
  %wbsize27 = getelementptr inbounds %struct.line_state, %struct.line_state* %40, i32 0, i32 3
  %41 = load i32, i32* %wbsize27, align 4
  %mul28 = mul i32 %41, 4
  %call29 = call i8* @xmalloc(i32 %mul28)
  %42 = bitcast i8* %call29 to i32*
  %43 = load %struct.line_state*, %struct.line_state** @line_state_visible, align 4
  %wrapped_line = getelementptr inbounds %struct.line_state, %struct.line_state* %43, i32 0, i32 4
  store i32* %42, i32** %wrapped_line, align 4
  %44 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %lbsize30 = getelementptr inbounds %struct.line_state, %struct.line_state* %44, i32 0, i32 2
  %45 = load i32, i32* %lbsize30, align 4
  %46 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %wbsize31 = getelementptr inbounds %struct.line_state, %struct.line_state* %46, i32 0, i32 3
  store i32 %45, i32* %wbsize31, align 4
  %47 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %wbsize32 = getelementptr inbounds %struct.line_state, %struct.line_state* %47, i32 0, i32 3
  %48 = load i32, i32* %wbsize32, align 4
  %mul33 = mul i32 %48, 4
  %call34 = call i8* @xmalloc(i32 %mul33)
  %49 = bitcast i8* %call34 to i32*
  %50 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %wrapped_line35 = getelementptr inbounds %struct.line_state, %struct.line_state* %50, i32 0, i32 4
  store i32* %49, i32** %wrapped_line35, align 4
  %51 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %lbsize36 = getelementptr inbounds %struct.line_state, %struct.line_state* %51, i32 0, i32 2
  %52 = load i32, i32* %lbsize36, align 4
  %mul37 = mul i32 %52, 4
  %call38 = call i8* @xmalloc(i32 %mul37)
  %53 = bitcast i8* %call38 to i32*
  %54 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %lbreaks39 = getelementptr inbounds %struct.line_state, %struct.line_state* %54, i32 0, i32 1
  store i32* %53, i32** %lbreaks39, align 4
  %55 = load %struct.line_state*, %struct.line_state** @line_state_visible, align 4
  %lbsize40 = getelementptr inbounds %struct.line_state, %struct.line_state* %55, i32 0, i32 2
  %56 = load i32, i32* %lbsize40, align 4
  %mul41 = mul i32 %56, 4
  %call42 = call i8* @xmalloc(i32 %mul41)
  %57 = bitcast i8* %call42 to i32*
  %58 = load %struct.line_state*, %struct.line_state** @line_state_visible, align 4
  %lbreaks43 = getelementptr inbounds %struct.line_state, %struct.line_state* %58, i32 0, i32 1
  store i32* %57, i32** %lbreaks43, align 4
  %59 = load %struct.line_state*, %struct.line_state** @line_state_visible, align 4
  %lbreaks44 = getelementptr inbounds %struct.line_state, %struct.line_state* %59, i32 0, i32 1
  %60 = load i32*, i32** %lbreaks44, align 4
  %arrayidx45 = getelementptr inbounds i32, i32* %60, i32 0
  store i32 0, i32* %arrayidx45, align 4
  %61 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %lbreaks46 = getelementptr inbounds %struct.line_state, %struct.line_state* %61, i32 0, i32 1
  %62 = load i32*, i32** %lbreaks46, align 4
  %arrayidx47 = getelementptr inbounds i32, i32* %62, i32 0
  store i32 0, i32* %arrayidx47, align 4
  br label %if.end48

if.end48:                                         ; preds = %if.then24, %for.end
  store i32 1, i32* @line_structures_initialized, align 4
  ret void
}

; Function Attrs: noinline nounwind
define i32 @rl_on_new_line() #0 {
entry:
  %0 = load %struct.line_state*, %struct.line_state** @line_state_visible, align 4
  %line = getelementptr inbounds %struct.line_state, %struct.line_state* %0, i32 0, i32 0
  %1 = load i8*, i8** %line, align 4
  %tobool = icmp ne i8* %1, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load %struct.line_state*, %struct.line_state** @line_state_visible, align 4
  %line1 = getelementptr inbounds %struct.line_state, %struct.line_state* %2, i32 0, i32 0
  %3 = load i8*, i8** %line1, align 4
  %arrayidx = getelementptr inbounds i8, i8* %3, i32 0
  store i8 0, i8* %arrayidx, align 1
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  store i32 0, i32* @_rl_last_v_pos, align 4
  store i32 0, i32* @_rl_last_c_pos, align 4
  store i32 0, i32* @last_lmargin, align 4
  store i32 0, i32* @_rl_vis_botlin, align 4
  %4 = load %struct.line_state*, %struct.line_state** @line_state_visible, align 4
  %lbreaks = getelementptr inbounds %struct.line_state, %struct.line_state* %4, i32 0, i32 1
  %5 = load i32*, i32** %lbreaks, align 4
  %tobool2 = icmp ne i32* %5, null
  br i1 %tobool2, label %if.then3, label %if.end8

if.then3:                                         ; preds = %if.end
  %6 = load %struct.line_state*, %struct.line_state** @line_state_visible, align 4
  %lbreaks4 = getelementptr inbounds %struct.line_state, %struct.line_state* %6, i32 0, i32 1
  %7 = load i32*, i32** %lbreaks4, align 4
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i32 1
  store i32 0, i32* %arrayidx5, align 4
  %8 = load %struct.line_state*, %struct.line_state** @line_state_visible, align 4
  %lbreaks6 = getelementptr inbounds %struct.line_state, %struct.line_state* %8, i32 0, i32 1
  %9 = load i32*, i32** %lbreaks6, align 4
  %arrayidx7 = getelementptr inbounds i32, i32* %9, i32 0
  store i32 0, i32* %arrayidx7, align 4
  br label %if.end8

if.end8:                                          ; preds = %if.then3, %if.end
  store i32 0, i32* @visible_wrap_offset, align 4
  ret i32 0
}

declare %struct._hist_entry* @current_history() #1

declare void @_rl_output_some_chars(i8*, i32) #1

declare i8* @xrealloc(i8*, i32) #1

declare i8* @strncpy(i8*, i8*, i32) #1

; Function Attrs: noinline nounwind
define internal void @cr() #0 {
entry:
  %0 = load i8*, i8** @_rl_term_cr, align 4
  %tobool = icmp ne i8* %0, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** @_rl_term_cr, align 4
  %call = call i32 bitcast (i32 (...)* @tputs to i32 (i8*, i32, i32 (i32)*)*)(i8* %1, i32 1, i32 (i32)* @_rl_output_character_function)
  store i32 0, i32* @_rl_last_c_pos, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #2

; Function Attrs: noinline nounwind
define internal i32 @_rl_col_width(i8* %str, i32 %start, i32 %end, i32 %flags) #0 {
entry:
  %retval = alloca i32, align 4
  %str.addr = alloca i8*, align 4
  %start.addr = alloca i32, align 4
  %end.addr = alloca i32, align 4
  %flags.addr = alloca i32, align 4
  %wc = alloca i32, align 4
  %ps = alloca %struct.__mbstate_t, align 4
  %tmp = alloca i32, align 4
  %point = alloca i32, align 4
  %width = alloca i32, align 4
  %max = alloca i32, align 4
  store i8* %str, i8** %str.addr, align 4
  store i32 %start, i32* %start.addr, align 4
  store i32 %end, i32* %end.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %0 = load i32, i32* %end.addr, align 4
  %1 = load i32, i32* %start.addr, align 4
  %cmp = icmp sle i32 %0, %1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %call = call i32 @__ctype_get_mb_cur_max()
  %cmp4 = icmp eq i32 %call, 1
  br i1 %cmp4, label %if.then5, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end
  %2 = load i32, i32* @rl_byte_oriented, align 4
  %tobool = icmp ne i32 %2, 0
  br i1 %tobool, label %if.then5, label %if.end6

if.then5:                                         ; preds = %lor.lhs.false, %if.end
  %3 = load i32, i32* %end.addr, align 4
  %4 = load i32, i32* %start.addr, align 4
  %sub = sub nsw i32 %3, %4
  store i32 %sub, i32* %retval, align 4
  br label %return

if.end6:                                          ; preds = %lor.lhs.false
  %5 = bitcast %struct.__mbstate_t* %ps to i8*
  call void @llvm.memset.p0i8.i32(i8* %5, i8 0, i32 8, i32 4, i1 false)
  store i32 0, i32* %point, align 4
  %6 = load i32, i32* %end.addr, align 4
  store i32 %6, i32* %max, align 4
  %7 = load i32, i32* %flags.addr, align 4
  %tobool7 = icmp ne i32 %7, 0
  br i1 %tobool7, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %if.end6
  %8 = load i32, i32* %start.addr, align 4
  %cmp8 = icmp eq i32 %8, 0
  br i1 %cmp8, label %land.lhs.true9, label %if.else

land.lhs.true9:                                   ; preds = %land.lhs.true
  %9 = load i32, i32* %end.addr, align 4
  %10 = load i32, i32* @local_prompt_len, align 4
  %cmp10 = icmp eq i32 %9, %10
  br i1 %cmp10, label %land.lhs.true11, label %if.else

land.lhs.true11:                                  ; preds = %land.lhs.true9
  %11 = load i8*, i8** %str.addr, align 4
  %12 = load i8*, i8** @local_prompt, align 4
  %13 = load i32, i32* @local_prompt_len, align 4
  %call12 = call i32 @memcmp(i8* %11, i8* %12, i32 %13)
  %cmp13 = icmp eq i32 %call12, 0
  br i1 %cmp13, label %if.then14, label %if.else

if.then14:                                        ; preds = %land.lhs.true11
  %14 = load i32, i32* @prompt_physical_chars, align 4
  %15 = load i32, i32* @wrap_offset, align 4
  %add = add nsw i32 %14, %15
  store i32 %add, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %land.lhs.true11, %land.lhs.true9, %land.lhs.true, %if.end6
  %16 = load i32, i32* %flags.addr, align 4
  %tobool15 = icmp ne i32 %16, 0
  br i1 %tobool15, label %land.lhs.true16, label %if.end31

land.lhs.true16:                                  ; preds = %if.else
  %17 = load i32, i32* %start.addr, align 4
  %cmp17 = icmp eq i32 %17, 0
  br i1 %cmp17, label %land.lhs.true18, label %if.end31

land.lhs.true18:                                  ; preds = %land.lhs.true16
  %18 = load i32, i32* @local_prompt_len, align 4
  %cmp19 = icmp sgt i32 %18, 0
  br i1 %cmp19, label %land.lhs.true20, label %if.end31

land.lhs.true20:                                  ; preds = %land.lhs.true18
  %19 = load i32, i32* %end.addr, align 4
  %20 = load i32, i32* @local_prompt_len, align 4
  %cmp21 = icmp sgt i32 %19, %20
  br i1 %cmp21, label %land.lhs.true22, label %if.end31

land.lhs.true22:                                  ; preds = %land.lhs.true20
  %21 = load i8*, i8** @local_prompt, align 4
  %tobool23 = icmp ne i8* %21, null
  br i1 %tobool23, label %land.lhs.true24, label %if.end31

land.lhs.true24:                                  ; preds = %land.lhs.true22
  %22 = load i8*, i8** %str.addr, align 4
  %23 = load i8*, i8** @local_prompt, align 4
  %24 = load i32, i32* @local_prompt_len, align 4
  %call25 = call i32 @memcmp(i8* %22, i8* %23, i32 %24)
  %cmp26 = icmp eq i32 %call25, 0
  br i1 %cmp26, label %if.then27, label %if.end31

if.then27:                                        ; preds = %land.lhs.true24
  %25 = load i32, i32* @prompt_physical_chars, align 4
  %26 = load i32, i32* @wrap_offset, align 4
  %add28 = add nsw i32 %25, %26
  store i32 %add28, i32* %tmp, align 4
  %27 = load i8*, i8** %str.addr, align 4
  %28 = load i32, i32* @local_prompt_len, align 4
  %29 = load i32, i32* %end.addr, align 4
  %30 = load i32, i32* %flags.addr, align 4
  %call29 = call i32 @_rl_col_width(i8* %27, i32 %28, i32 %29, i32 %30)
  %31 = load i32, i32* %tmp, align 4
  %add30 = add nsw i32 %31, %call29
  store i32 %add30, i32* %tmp, align 4
  %32 = load i32, i32* %tmp, align 4
  store i32 %32, i32* %retval, align 4
  br label %return

if.end31:                                         ; preds = %land.lhs.true24, %land.lhs.true22, %land.lhs.true20, %land.lhs.true18, %land.lhs.true16, %if.else
  br label %if.end32

if.end32:                                         ; preds = %if.end31
  br label %while.cond

while.cond:                                       ; preds = %if.end46, %if.end32
  %33 = load i32, i32* %point, align 4
  %34 = load i32, i32* %start.addr, align 4
  %cmp33 = icmp slt i32 %33, %34
  br i1 %cmp33, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %35 = load i8*, i8** %str.addr, align 4
  %36 = load i32, i32* %point, align 4
  %add.ptr = getelementptr inbounds i8, i8* %35, i32 %36
  %37 = load i32, i32* %max, align 4
  %call34 = call i32 @mbrlen(i8* %add.ptr, i32 %37, %struct.__mbstate_t* %ps)
  store i32 %call34, i32* %tmp, align 4
  %38 = load i32, i32* %tmp, align 4
  %cmp35 = icmp eq i32 %38, -1
  br i1 %cmp35, label %if.then38, label %lor.lhs.false36

lor.lhs.false36:                                  ; preds = %while.body
  %39 = load i32, i32* %tmp, align 4
  %cmp37 = icmp eq i32 %39, -2
  br i1 %cmp37, label %if.then38, label %if.else39

if.then38:                                        ; preds = %lor.lhs.false36, %while.body
  %40 = load i32, i32* %point, align 4
  %inc = add nsw i32 %40, 1
  store i32 %inc, i32* %point, align 4
  %41 = load i32, i32* %max, align 4
  %dec = add nsw i32 %41, -1
  store i32 %dec, i32* %max, align 4
  %42 = bitcast %struct.__mbstate_t* %ps to i8*
  call void @llvm.memset.p0i8.i32(i8* %42, i8 0, i32 8, i32 4, i1 false)
  br label %if.end46

if.else39:                                        ; preds = %lor.lhs.false36
  %43 = load i32, i32* %tmp, align 4
  %cmp40 = icmp eq i32 %43, 0
  br i1 %cmp40, label %if.then41, label %if.else42

if.then41:                                        ; preds = %if.else39
  br label %while.end

if.else42:                                        ; preds = %if.else39
  %44 = load i32, i32* %tmp, align 4
  %45 = load i32, i32* %point, align 4
  %add43 = add nsw i32 %45, %44
  store i32 %add43, i32* %point, align 4
  %46 = load i32, i32* %tmp, align 4
  %47 = load i32, i32* %max, align 4
  %sub44 = sub nsw i32 %47, %46
  store i32 %sub44, i32* %max, align 4
  br label %if.end45

if.end45:                                         ; preds = %if.else42
  br label %if.end46

if.end46:                                         ; preds = %if.end45, %if.then38
  br label %while.cond

while.end:                                        ; preds = %if.then41, %while.cond
  %48 = load i32, i32* %point, align 4
  %49 = load i32, i32* %start.addr, align 4
  %sub47 = sub nsw i32 %48, %49
  store i32 %sub47, i32* %width, align 4
  br label %while.cond48

while.cond48:                                     ; preds = %if.end70, %while.end
  %50 = load i32, i32* %point, align 4
  %51 = load i32, i32* %end.addr, align 4
  %cmp49 = icmp slt i32 %50, %51
  br i1 %cmp49, label %while.body50, label %while.end71

while.body50:                                     ; preds = %while.cond48
  %52 = load i8*, i8** %str.addr, align 4
  %53 = load i32, i32* %point, align 4
  %add.ptr51 = getelementptr inbounds i8, i8* %52, i32 %53
  %54 = load i32, i32* %max, align 4
  %call52 = call i32 @mbrtowc(i32* %wc, i8* %add.ptr51, i32 %54, %struct.__mbstate_t* %ps)
  store i32 %call52, i32* %tmp, align 4
  %55 = load i32, i32* %tmp, align 4
  %cmp53 = icmp eq i32 %55, -1
  br i1 %cmp53, label %if.then56, label %lor.lhs.false54

lor.lhs.false54:                                  ; preds = %while.body50
  %56 = load i32, i32* %tmp, align 4
  %cmp55 = icmp eq i32 %56, -2
  br i1 %cmp55, label %if.then56, label %if.else60

if.then56:                                        ; preds = %lor.lhs.false54, %while.body50
  %57 = load i32, i32* %point, align 4
  %inc57 = add nsw i32 %57, 1
  store i32 %inc57, i32* %point, align 4
  %58 = load i32, i32* %max, align 4
  %dec58 = add nsw i32 %58, -1
  store i32 %dec58, i32* %max, align 4
  %59 = load i32, i32* %width, align 4
  %inc59 = add nsw i32 %59, 1
  store i32 %inc59, i32* %width, align 4
  %60 = bitcast %struct.__mbstate_t* %ps to i8*
  call void @llvm.memset.p0i8.i32(i8* %60, i8 0, i32 8, i32 4, i1 false)
  br label %if.end70

if.else60:                                        ; preds = %lor.lhs.false54
  %61 = load i32, i32* %tmp, align 4
  %cmp61 = icmp eq i32 %61, 0
  br i1 %cmp61, label %if.then62, label %if.else63

if.then62:                                        ; preds = %if.else60
  br label %while.end71

if.else63:                                        ; preds = %if.else60
  %62 = load i32, i32* %tmp, align 4
  %63 = load i32, i32* %point, align 4
  %add64 = add nsw i32 %63, %62
  store i32 %add64, i32* %point, align 4
  %64 = load i32, i32* %tmp, align 4
  %65 = load i32, i32* %max, align 4
  %sub65 = sub nsw i32 %65, %64
  store i32 %sub65, i32* %max, align 4
  %66 = load i32, i32* %wc, align 4
  %call66 = call i32 @_rl_wcwidth(i32 %66)
  store i32 %call66, i32* %tmp, align 4
  %67 = load i32, i32* %tmp, align 4
  %cmp67 = icmp sge i32 %67, 0
  br i1 %cmp67, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.else63
  %68 = load i32, i32* %tmp, align 4
  br label %cond.end

cond.false:                                       ; preds = %if.else63
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %68, %cond.true ], [ 1, %cond.false ]
  %69 = load i32, i32* %width, align 4
  %add68 = add nsw i32 %69, %cond
  store i32 %add68, i32* %width, align 4
  br label %if.end69

if.end69:                                         ; preds = %cond.end
  br label %if.end70

if.end70:                                         ; preds = %if.end69, %if.then56
  br label %while.cond48

while.end71:                                      ; preds = %if.then62, %while.cond48
  %70 = load i32, i32* %point, align 4
  %71 = load i32, i32* %end.addr, align 4
  %sub72 = sub nsw i32 %70, %71
  %72 = load i32, i32* %width, align 4
  %add73 = add nsw i32 %72, %sub72
  store i32 %add73, i32* %width, align 4
  %73 = load i32, i32* %width, align 4
  store i32 %73, i32* %retval, align 4
  br label %return

return:                                           ; preds = %while.end71, %if.then27, %if.then14, %if.then5, %if.then
  %74 = load i32, i32* %retval, align 4
  ret i32 %74
}

declare i32 @_rl_find_prev_mbchar(i8*, i32, i32) #1

declare i32 @_rl_find_next_mbchar(i8*, i32, i32, i32) #1

declare i32 @mbrtowc(i32*, i8*, i32, %struct.__mbstate_t*) #1

; Function Attrs: noinline nounwind
define internal i32 @_rl_wcwidth(i32 %wc) #0 {
entry:
  %retval = alloca i32, align 4
  %wc.addr = alloca i32, align 4
  store i32 %wc, i32* %wc.addr, align 4
  %0 = load i32, i32* %wc.addr, align 4
  switch i32 %0, label %sw.default [
    i32 32, label %sw.bb
    i32 33, label %sw.bb
    i32 34, label %sw.bb
    i32 35, label %sw.bb
    i32 37, label %sw.bb
    i32 38, label %sw.bb
    i32 39, label %sw.bb
    i32 40, label %sw.bb
    i32 41, label %sw.bb
    i32 42, label %sw.bb
    i32 43, label %sw.bb
    i32 44, label %sw.bb
    i32 45, label %sw.bb
    i32 46, label %sw.bb
    i32 47, label %sw.bb
    i32 48, label %sw.bb
    i32 49, label %sw.bb
    i32 50, label %sw.bb
    i32 51, label %sw.bb
    i32 52, label %sw.bb
    i32 53, label %sw.bb
    i32 54, label %sw.bb
    i32 55, label %sw.bb
    i32 56, label %sw.bb
    i32 57, label %sw.bb
    i32 58, label %sw.bb
    i32 59, label %sw.bb
    i32 60, label %sw.bb
    i32 61, label %sw.bb
    i32 62, label %sw.bb
    i32 63, label %sw.bb
    i32 65, label %sw.bb
    i32 66, label %sw.bb
    i32 67, label %sw.bb
    i32 68, label %sw.bb
    i32 69, label %sw.bb
    i32 70, label %sw.bb
    i32 71, label %sw.bb
    i32 72, label %sw.bb
    i32 73, label %sw.bb
    i32 74, label %sw.bb
    i32 75, label %sw.bb
    i32 76, label %sw.bb
    i32 77, label %sw.bb
    i32 78, label %sw.bb
    i32 79, label %sw.bb
    i32 80, label %sw.bb
    i32 81, label %sw.bb
    i32 82, label %sw.bb
    i32 83, label %sw.bb
    i32 84, label %sw.bb
    i32 85, label %sw.bb
    i32 86, label %sw.bb
    i32 87, label %sw.bb
    i32 88, label %sw.bb
    i32 89, label %sw.bb
    i32 90, label %sw.bb
    i32 91, label %sw.bb
    i32 92, label %sw.bb
    i32 93, label %sw.bb
    i32 94, label %sw.bb
    i32 95, label %sw.bb
    i32 97, label %sw.bb
    i32 98, label %sw.bb
    i32 99, label %sw.bb
    i32 100, label %sw.bb
    i32 101, label %sw.bb
    i32 102, label %sw.bb
    i32 103, label %sw.bb
    i32 104, label %sw.bb
    i32 105, label %sw.bb
    i32 106, label %sw.bb
    i32 107, label %sw.bb
    i32 108, label %sw.bb
    i32 109, label %sw.bb
    i32 110, label %sw.bb
    i32 111, label %sw.bb
    i32 112, label %sw.bb
    i32 113, label %sw.bb
    i32 114, label %sw.bb
    i32 115, label %sw.bb
    i32 116, label %sw.bb
    i32 117, label %sw.bb
    i32 118, label %sw.bb
    i32 119, label %sw.bb
    i32 120, label %sw.bb
    i32 121, label %sw.bb
    i32 122, label %sw.bb
    i32 123, label %sw.bb
    i32 124, label %sw.bb
    i32 125, label %sw.bb
    i32 126, label %sw.bb
  ]

sw.bb:                                            ; preds = %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry
  store i32 1, i32* %retval, align 4
  br label %return

sw.default:                                       ; preds = %entry
  %1 = load i32, i32* %wc.addr, align 4
  %call = call i32 @wcwidth(i32 %1)
  store i32 %call, i32* %retval, align 4
  br label %return

return:                                           ; preds = %sw.default, %sw.bb
  %2 = load i32, i32* %retval, align 4
  ret i32 %2
}

declare i32 @sprintf(i8*, i8*, ...) #1

; Function Attrs: nounwind readonly
declare i32 @islower(i32) #3

; Function Attrs: nounwind readonly
declare i32 @toupper(i32) #3

; Function Attrs: noinline nounwind
define internal void @update_line(i8* %old, i8* %new, i32 %current_line, i32 %omax, i32 %nmax, i32 %inv_botlin) #0 {
entry:
  %old.addr = alloca i8*, align 4
  %new.addr = alloca i8*, align 4
  %current_line.addr = alloca i32, align 4
  %omax.addr = alloca i32, align 4
  %nmax.addr = alloca i32, align 4
  %inv_botlin.addr = alloca i32, align 4
  %ofd = alloca i8*, align 4
  %ols = alloca i8*, align 4
  %oe = alloca i8*, align 4
  %nfd = alloca i8*, align 4
  %nls = alloca i8*, align 4
  %ne = alloca i8*, align 4
  %temp = alloca i32, align 4
  %lendiff = alloca i32, align 4
  %wsatend = alloca i32, align 4
  %od = alloca i32, align 4
  %nd = alloca i32, align 4
  %twidth = alloca i32, align 4
  %o_cpos = alloca i32, align 4
  %current_invis_chars = alloca i32, align 4
  %col_lendiff = alloca i32, align 4
  %col_temp = alloca i32, align 4
  %bytes_to_insert = alloca i32, align 4
  %mb_cur_max = alloca i32, align 4
  %ps_new = alloca %struct.__mbstate_t, align 4
  %ps_old = alloca %struct.__mbstate_t, align 4
  %new_offset = alloca i32, align 4
  %old_offset = alloca i32, align 4
  %wc = alloca i32, align 4
  %ps = alloca %struct.__mbstate_t, align 4
  %tempwidth = alloca i32, align 4
  %bytes = alloca i32, align 4
  %ret = alloca i32, align 4
  %count = alloca i32, align 4
  %i = alloca i32, align 4
  %wc247 = alloca i32, align 4
  %ps248 = alloca %struct.__mbstate_t, align 4
  %t = alloca i32, align 4
  %gl = alloca i32, align 4
  store i8* %old, i8** %old.addr, align 4
  store i8* %new, i8** %new.addr, align 4
  store i32 %current_line, i32* %current_line.addr, align 4
  store i32 %omax, i32* %omax.addr, align 4
  store i32 %nmax, i32* %nmax.addr, align 4
  store i32 %inv_botlin, i32* %inv_botlin.addr, align 4
  %call = call i32 @__ctype_get_mb_cur_max()
  store i32 %call, i32* %mb_cur_max, align 4
  %0 = load i32, i32* %mb_cur_max, align 4
  %cmp = icmp sgt i32 %0, 1
  br i1 %cmp, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %entry
  %1 = load i32, i32* @rl_byte_oriented, align 4
  %cmp1 = icmp eq i32 %1, 0
  br i1 %cmp1, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true
  %2 = load i32, i32* @_rl_last_c_pos, align 4
  store i32 %2, i32* %temp, align 4
  br label %if.end

if.else:                                          ; preds = %land.lhs.true, %entry
  %3 = load i32, i32* @_rl_last_c_pos, align 4
  %4 = load i32, i32* @_rl_last_v_pos, align 4
  %cmp2 = icmp eq i32 %4, 0
  br i1 %cmp2, label %cond.true, label %cond.false9

cond.true:                                        ; preds = %if.else
  %5 = load i32, i32* @visible_wrap_offset, align 4
  %tobool = icmp ne i32 %5, 0
  br i1 %tobool, label %cond.true3, label %cond.false6

cond.true3:                                       ; preds = %cond.true
  %6 = load i32, i32* @prompt_physical_chars, align 4
  %7 = load i32, i32* @_rl_screenwidth, align 4
  %cmp4 = icmp sgt i32 %6, %7
  br i1 %cmp4, label %cond.true5, label %cond.false

cond.true5:                                       ; preds = %cond.true3
  %8 = load i32, i32* @prompt_invis_chars_first_line, align 4
  br label %cond.end

cond.false:                                       ; preds = %cond.true3
  %9 = load i32, i32* @wrap_offset, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true5
  %cond = phi i32 [ %8, %cond.true5 ], [ %9, %cond.false ]
  br label %cond.end7

cond.false6:                                      ; preds = %cond.true
  br label %cond.end7

cond.end7:                                        ; preds = %cond.false6, %cond.end
  %cond8 = phi i32 [ %cond, %cond.end ], [ 0, %cond.false6 ]
  br label %cond.end15

cond.false9:                                      ; preds = %if.else
  %10 = load i32, i32* @_rl_last_v_pos, align 4
  %11 = load i32, i32* @prompt_last_screen_line, align 4
  %cmp10 = icmp eq i32 %10, %11
  br i1 %cmp10, label %cond.true11, label %cond.false12

cond.true11:                                      ; preds = %cond.false9
  %12 = load i32, i32* @wrap_offset, align 4
  %13 = load i32, i32* @prompt_invis_chars_first_line, align 4
  %sub = sub nsw i32 %12, %13
  br label %cond.end13

cond.false12:                                     ; preds = %cond.false9
  br label %cond.end13

cond.end13:                                       ; preds = %cond.false12, %cond.true11
  %cond14 = phi i32 [ %sub, %cond.true11 ], [ 0, %cond.false12 ]
  br label %cond.end15

cond.end15:                                       ; preds = %cond.end13, %cond.end7
  %cond16 = phi i32 [ %cond8, %cond.end7 ], [ %cond14, %cond.end13 ]
  %sub17 = sub nsw i32 %3, %cond16
  store i32 %sub17, i32* %temp, align 4
  br label %if.end

if.end:                                           ; preds = %cond.end15, %if.then
  %14 = load i32, i32* %temp, align 4
  %15 = load i32, i32* @_rl_screenwidth, align 4
  %cmp18 = icmp eq i32 %14, %15
  br i1 %cmp18, label %land.lhs.true19, label %if.end124

land.lhs.true19:                                  ; preds = %if.end
  %16 = load i32, i32* @_rl_term_autowrap, align 4
  %tobool20 = icmp ne i32 %16, 0
  br i1 %tobool20, label %land.lhs.true21, label %if.end124

land.lhs.true21:                                  ; preds = %land.lhs.true19
  %17 = load i32, i32* @_rl_horizontal_scroll_mode, align 4
  %tobool22 = icmp ne i32 %17, 0
  br i1 %tobool22, label %if.end124, label %land.lhs.true23

land.lhs.true23:                                  ; preds = %land.lhs.true21
  %18 = load i32, i32* @_rl_last_v_pos, align 4
  %19 = load i32, i32* %current_line.addr, align 4
  %sub24 = sub nsw i32 %19, 1
  %cmp25 = icmp eq i32 %18, %sub24
  br i1 %cmp25, label %if.then26, label %if.end124

if.then26:                                        ; preds = %land.lhs.true23
  %20 = load i32, i32* %mb_cur_max, align 4
  %cmp27 = icmp sgt i32 %20, 1
  br i1 %cmp27, label %land.lhs.true28, label %if.else101

land.lhs.true28:                                  ; preds = %if.then26
  %21 = load i32, i32* @rl_byte_oriented, align 4
  %cmp29 = icmp eq i32 %21, 0
  br i1 %cmp29, label %if.then30, label %if.else101

if.then30:                                        ; preds = %land.lhs.true28
  %22 = load i32, i32* %current_line.addr, align 4
  %23 = load %struct.line_state*, %struct.line_state** @line_state_visible, align 4
  %wbsize = getelementptr inbounds %struct.line_state, %struct.line_state* %23, i32 0, i32 3
  %24 = load i32, i32* %wbsize, align 4
  %cmp31 = icmp slt i32 %22, %24
  br i1 %cmp31, label %land.lhs.true32, label %if.end37

land.lhs.true32:                                  ; preds = %if.then30
  %25 = load %struct.line_state*, %struct.line_state** @line_state_visible, align 4
  %wrapped_line = getelementptr inbounds %struct.line_state, %struct.line_state* %25, i32 0, i32 4
  %26 = load i32*, i32** %wrapped_line, align 4
  %27 = load i32, i32* %current_line.addr, align 4
  %arrayidx = getelementptr inbounds i32, i32* %26, i32 %27
  %28 = load i32, i32* %arrayidx, align 4
  %cmp33 = icmp sgt i32 %28, 0
  br i1 %cmp33, label %if.then34, label %if.end37

if.then34:                                        ; preds = %land.lhs.true32
  %29 = load %struct.line_state*, %struct.line_state** @line_state_visible, align 4
  %wrapped_line35 = getelementptr inbounds %struct.line_state, %struct.line_state* %29, i32 0, i32 4
  %30 = load i32*, i32** %wrapped_line35, align 4
  %31 = load i32, i32* %current_line.addr, align 4
  %arrayidx36 = getelementptr inbounds i32, i32* %30, i32 %31
  %32 = load i32, i32* %arrayidx36, align 4
  call void @_rl_clear_to_eol(i32 %32)
  br label %if.end37

if.end37:                                         ; preds = %if.then34, %land.lhs.true32, %if.then30
  %33 = bitcast %struct.__mbstate_t* %ps to i8*
  call void @llvm.memset.p0i8.i32(i8* %33, i8 0, i32 8, i32 4, i1 false)
  %34 = load i8*, i8** %new.addr, align 4
  %35 = load i32, i32* %mb_cur_max, align 4
  %call38 = call i32 @mbrtowc(i32* %wc, i8* %34, i32 %35, %struct.__mbstate_t* %ps)
  store i32 %call38, i32* %ret, align 4
  %36 = load i32, i32* %ret, align 4
  %cmp39 = icmp eq i32 %36, -1
  br i1 %cmp39, label %if.then41, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end37
  %37 = load i32, i32* %ret, align 4
  %cmp40 = icmp eq i32 %37, -2
  br i1 %cmp40, label %if.then41, label %if.else42

if.then41:                                        ; preds = %lor.lhs.false, %if.end37
  store i32 1, i32* %tempwidth, align 4
  store i32 1, i32* %ret, align 4
  br label %if.end48

if.else42:                                        ; preds = %lor.lhs.false
  %38 = load i32, i32* %ret, align 4
  %cmp43 = icmp eq i32 %38, 0
  br i1 %cmp43, label %if.then44, label %if.else45

if.then44:                                        ; preds = %if.else42
  store i32 0, i32* %tempwidth, align 4
  br label %if.end47

if.else45:                                        ; preds = %if.else42
  %39 = load i32, i32* %wc, align 4
  %call46 = call i32 @_rl_wcwidth(i32 %39)
  store i32 %call46, i32* %tempwidth, align 4
  br label %if.end47

if.end47:                                         ; preds = %if.else45, %if.then44
  br label %if.end48

if.end48:                                         ; preds = %if.end47, %if.then41
  %40 = load i32, i32* %tempwidth, align 4
  %cmp49 = icmp sgt i32 %40, 0
  br i1 %cmp49, label %if.then50, label %if.else86

if.then50:                                        ; preds = %if.end48
  %41 = load i32, i32* %ret, align 4
  store i32 %41, i32* %bytes, align 4
  store i32 0, i32* %count, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then50
  %42 = load i32, i32* %count, align 4
  %43 = load i32, i32* %bytes, align 4
  %cmp51 = icmp slt i32 %42, %43
  br i1 %cmp51, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %44 = load i8*, i8** %new.addr, align 4
  %45 = load i32, i32* %count, align 4
  %arrayidx52 = getelementptr inbounds i8, i8* %44, i32 %45
  %46 = load i8, i8* %arrayidx52, align 1
  %conv = sext i8 %46 to i32
  %47 = load %struct._IO_FILE*, %struct._IO_FILE** @rl_outstream, align 4
  %call53 = call i32 @putc(i32 %conv, %struct._IO_FILE* %47)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %48 = load i32, i32* %count, align 4
  %inc = add nsw i32 %48, 1
  store i32 %inc, i32* %count, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %49 = load i32, i32* %tempwidth, align 4
  store i32 %49, i32* @_rl_last_c_pos, align 4
  %50 = load i32, i32* @_rl_last_v_pos, align 4
  %inc54 = add nsw i32 %50, 1
  store i32 %inc54, i32* @_rl_last_v_pos, align 4
  %51 = bitcast %struct.__mbstate_t* %ps to i8*
  call void @llvm.memset.p0i8.i32(i8* %51, i8 0, i32 8, i32 4, i1 false)
  %52 = load i8*, i8** %old.addr, align 4
  %53 = load i32, i32* %mb_cur_max, align 4
  %call55 = call i32 @mbrtowc(i32* %wc, i8* %52, i32 %53, %struct.__mbstate_t* %ps)
  store i32 %call55, i32* %ret, align 4
  %54 = load i32, i32* %ret, align 4
  %cmp56 = icmp ne i32 %54, 0
  br i1 %cmp56, label %land.lhs.true58, label %if.end85

land.lhs.true58:                                  ; preds = %for.end
  %55 = load i32, i32* %bytes, align 4
  %cmp59 = icmp ne i32 %55, 0
  br i1 %cmp59, label %if.then61, label %if.end85

if.then61:                                        ; preds = %land.lhs.true58
  %56 = load i32, i32* %ret, align 4
  %cmp62 = icmp eq i32 %56, -1
  br i1 %cmp62, label %if.then67, label %lor.lhs.false64

lor.lhs.false64:                                  ; preds = %if.then61
  %57 = load i32, i32* %ret, align 4
  %cmp65 = icmp eq i32 %57, -2
  br i1 %cmp65, label %if.then67, label %if.end68

if.then67:                                        ; preds = %lor.lhs.false64, %if.then61
  store i32 1, i32* %ret, align 4
  br label %if.end68

if.end68:                                         ; preds = %if.then67, %lor.lhs.false64
  %58 = load i8*, i8** %old.addr, align 4
  %59 = load i32, i32* %bytes, align 4
  %add.ptr = getelementptr inbounds i8, i8* %58, i32 %59
  %60 = load i8*, i8** %old.addr, align 4
  %61 = load i32, i32* %ret, align 4
  %add.ptr69 = getelementptr inbounds i8, i8* %60, i32 %61
  %62 = load i8*, i8** %old.addr, align 4
  %63 = load i32, i32* %ret, align 4
  %add.ptr70 = getelementptr inbounds i8, i8* %62, i32 %63
  %call71 = call i32 @strlen(i8* %add.ptr70)
  call void @llvm.memmove.p0i8.p0i8.i32(i8* %add.ptr, i8* %add.ptr69, i32 %call71, i32 1, i1 false)
  %64 = load i8*, i8** %old.addr, align 4
  %65 = load i8*, i8** %new.addr, align 4
  %66 = load i32, i32* %bytes, align 4
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %64, i8* %65, i32 %66, i32 1, i1 false)
  %67 = load i32, i32* %bytes, align 4
  %68 = load i32, i32* %ret, align 4
  %sub72 = sub i32 %67, %68
  %69 = load i32, i32* %omax.addr, align 4
  %add = add i32 %69, %sub72
  store i32 %add, i32* %omax.addr, align 4
  %70 = load i32, i32* %current_line.addr, align 4
  %add73 = add nsw i32 %70, 1
  store i32 %add73, i32* %i, align 4
  br label %for.cond74

for.cond74:                                       ; preds = %for.inc82, %if.end68
  %71 = load i32, i32* %i, align 4
  %72 = load i32, i32* %inv_botlin.addr, align 4
  %add75 = add nsw i32 %72, 1
  %cmp76 = icmp sle i32 %71, %add75
  br i1 %cmp76, label %for.body78, label %for.end84

for.body78:                                       ; preds = %for.cond74
  %73 = load i32, i32* %bytes, align 4
  %74 = load i32, i32* %ret, align 4
  %sub79 = sub i32 %73, %74
  %75 = load %struct.line_state*, %struct.line_state** @line_state_visible, align 4
  %lbreaks = getelementptr inbounds %struct.line_state, %struct.line_state* %75, i32 0, i32 1
  %76 = load i32*, i32** %lbreaks, align 4
  %77 = load i32, i32* %i, align 4
  %arrayidx80 = getelementptr inbounds i32, i32* %76, i32 %77
  %78 = load i32, i32* %arrayidx80, align 4
  %add81 = add i32 %78, %sub79
  store i32 %add81, i32* %arrayidx80, align 4
  br label %for.inc82

for.inc82:                                        ; preds = %for.body78
  %79 = load i32, i32* %i, align 4
  %inc83 = add nsw i32 %79, 1
  store i32 %inc83, i32* %i, align 4
  br label %for.cond74

for.end84:                                        ; preds = %for.cond74
  br label %if.end85

if.end85:                                         ; preds = %for.end84, %land.lhs.true58, %for.end
  br label %if.end100

if.else86:                                        ; preds = %if.end48
  %80 = load %struct._IO_FILE*, %struct._IO_FILE** @rl_outstream, align 4
  %call87 = call i32 @putc(i32 32, %struct._IO_FILE* %80)
  store i32 1, i32* @_rl_last_c_pos, align 4
  %81 = load i32, i32* @_rl_last_v_pos, align 4
  %inc88 = add nsw i32 %81, 1
  store i32 %inc88, i32* @_rl_last_v_pos, align 4
  %82 = load i8*, i8** %old.addr, align 4
  %arrayidx89 = getelementptr inbounds i8, i8* %82, i32 0
  %83 = load i8, i8* %arrayidx89, align 1
  %conv90 = sext i8 %83 to i32
  %tobool91 = icmp ne i32 %conv90, 0
  br i1 %tobool91, label %land.lhs.true92, label %if.end99

land.lhs.true92:                                  ; preds = %if.else86
  %84 = load i8*, i8** %new.addr, align 4
  %arrayidx93 = getelementptr inbounds i8, i8* %84, i32 0
  %85 = load i8, i8* %arrayidx93, align 1
  %conv94 = sext i8 %85 to i32
  %tobool95 = icmp ne i32 %conv94, 0
  br i1 %tobool95, label %if.then96, label %if.end99

if.then96:                                        ; preds = %land.lhs.true92
  %86 = load i8*, i8** %new.addr, align 4
  %arrayidx97 = getelementptr inbounds i8, i8* %86, i32 0
  %87 = load i8, i8* %arrayidx97, align 1
  %88 = load i8*, i8** %old.addr, align 4
  %arrayidx98 = getelementptr inbounds i8, i8* %88, i32 0
  store i8 %87, i8* %arrayidx98, align 1
  br label %if.end99

if.end99:                                         ; preds = %if.then96, %land.lhs.true92, %if.else86
  br label %if.end100

if.end100:                                        ; preds = %if.end99, %if.end85
  br label %if.end123

if.else101:                                       ; preds = %land.lhs.true28, %if.then26
  %89 = load i8*, i8** %new.addr, align 4
  %arrayidx102 = getelementptr inbounds i8, i8* %89, i32 0
  %90 = load i8, i8* %arrayidx102, align 1
  %tobool103 = icmp ne i8 %90, 0
  br i1 %tobool103, label %if.then104, label %if.else108

if.then104:                                       ; preds = %if.else101
  %91 = load i8*, i8** %new.addr, align 4
  %arrayidx105 = getelementptr inbounds i8, i8* %91, i32 0
  %92 = load i8, i8* %arrayidx105, align 1
  %conv106 = sext i8 %92 to i32
  %93 = load %struct._IO_FILE*, %struct._IO_FILE** @rl_outstream, align 4
  %call107 = call i32 @putc(i32 %conv106, %struct._IO_FILE* %93)
  br label %if.end110

if.else108:                                       ; preds = %if.else101
  %94 = load %struct._IO_FILE*, %struct._IO_FILE** @rl_outstream, align 4
  %call109 = call i32 @putc(i32 32, %struct._IO_FILE* %94)
  br label %if.end110

if.end110:                                        ; preds = %if.else108, %if.then104
  store i32 1, i32* @_rl_last_c_pos, align 4
  %95 = load i32, i32* @_rl_last_v_pos, align 4
  %inc111 = add nsw i32 %95, 1
  store i32 %inc111, i32* @_rl_last_v_pos, align 4
  %96 = load i8*, i8** %old.addr, align 4
  %arrayidx112 = getelementptr inbounds i8, i8* %96, i32 0
  %97 = load i8, i8* %arrayidx112, align 1
  %conv113 = sext i8 %97 to i32
  %tobool114 = icmp ne i32 %conv113, 0
  br i1 %tobool114, label %land.lhs.true115, label %if.end122

land.lhs.true115:                                 ; preds = %if.end110
  %98 = load i8*, i8** %new.addr, align 4
  %arrayidx116 = getelementptr inbounds i8, i8* %98, i32 0
  %99 = load i8, i8* %arrayidx116, align 1
  %conv117 = sext i8 %99 to i32
  %tobool118 = icmp ne i32 %conv117, 0
  br i1 %tobool118, label %if.then119, label %if.end122

if.then119:                                       ; preds = %land.lhs.true115
  %100 = load i8*, i8** %new.addr, align 4
  %arrayidx120 = getelementptr inbounds i8, i8* %100, i32 0
  %101 = load i8, i8* %arrayidx120, align 1
  %102 = load i8*, i8** %old.addr, align 4
  %arrayidx121 = getelementptr inbounds i8, i8* %102, i32 0
  store i8 %101, i8* %arrayidx121, align 1
  br label %if.end122

if.end122:                                        ; preds = %if.then119, %land.lhs.true115, %if.end110
  br label %if.end123

if.end123:                                        ; preds = %if.end122, %if.end100
  br label %if.end124

if.end124:                                        ; preds = %if.end123, %land.lhs.true23, %land.lhs.true21, %land.lhs.true19, %if.end
  %103 = load i32, i32* %mb_cur_max, align 4
  %cmp125 = icmp sgt i32 %103, 1
  br i1 %cmp125, label %land.lhs.true127, label %if.else181

land.lhs.true127:                                 ; preds = %if.end124
  %104 = load i32, i32* @rl_byte_oriented, align 4
  %cmp128 = icmp eq i32 %104, 0
  br i1 %cmp128, label %if.then130, label %if.else181

if.then130:                                       ; preds = %land.lhs.true127
  %105 = load i32, i32* %omax.addr, align 4
  %106 = load i32, i32* %nmax.addr, align 4
  %cmp131 = icmp slt i32 %105, %106
  br i1 %cmp131, label %cond.true133, label %cond.false134

cond.true133:                                     ; preds = %if.then130
  %107 = load i32, i32* %omax.addr, align 4
  br label %cond.end135

cond.false134:                                    ; preds = %if.then130
  %108 = load i32, i32* %nmax.addr, align 4
  br label %cond.end135

cond.end135:                                      ; preds = %cond.false134, %cond.true133
  %cond136 = phi i32 [ %107, %cond.true133 ], [ %108, %cond.false134 ]
  store i32 %cond136, i32* %temp, align 4
  %109 = load i8*, i8** %old.addr, align 4
  %110 = load i8*, i8** %new.addr, align 4
  %111 = load i32, i32* %temp, align 4
  %call137 = call i32 @memcmp(i8* %109, i8* %110, i32 %111)
  %cmp138 = icmp eq i32 %call137, 0
  br i1 %cmp138, label %if.then140, label %if.else143

if.then140:                                       ; preds = %cond.end135
  %112 = load i32, i32* %temp, align 4
  store i32 %112, i32* %old_offset, align 4
  store i32 %112, i32* %new_offset, align 4
  %113 = load i8*, i8** %old.addr, align 4
  %114 = load i32, i32* %temp, align 4
  %add.ptr141 = getelementptr inbounds i8, i8* %113, i32 %114
  store i8* %add.ptr141, i8** %ofd, align 4
  %115 = load i8*, i8** %new.addr, align 4
  %116 = load i32, i32* %temp, align 4
  %add.ptr142 = getelementptr inbounds i8, i8* %115, i32 %116
  store i8* %add.ptr142, i8** %nfd, align 4
  br label %if.end180

if.else143:                                       ; preds = %cond.end135
  %117 = bitcast %struct.__mbstate_t* %ps_new to i8*
  call void @llvm.memset.p0i8.i32(i8* %117, i8 0, i32 8, i32 4, i1 false)
  %118 = bitcast %struct.__mbstate_t* %ps_old to i8*
  call void @llvm.memset.p0i8.i32(i8* %118, i8 0, i32 8, i32 4, i1 false)
  %119 = load i32, i32* %omax.addr, align 4
  %120 = load i32, i32* %nmax.addr, align 4
  %cmp144 = icmp eq i32 %119, %120
  br i1 %cmp144, label %land.lhs.true146, label %if.else164

land.lhs.true146:                                 ; preds = %if.else143
  %121 = load i32, i32* %omax.addr, align 4
  %cmp147 = icmp eq i32 %121, 0
  br i1 %cmp147, label %cond.true149, label %cond.false150

cond.true149:                                     ; preds = %land.lhs.true146
  br i1 true, label %if.then161, label %if.else164

cond.false150:                                    ; preds = %land.lhs.true146
  %122 = load i8*, i8** %new.addr, align 4
  %arrayidx151 = getelementptr inbounds i8, i8* %122, i32 0
  %123 = load i8, i8* %arrayidx151, align 1
  %conv152 = sext i8 %123 to i32
  %124 = load i8*, i8** %old.addr, align 4
  %arrayidx153 = getelementptr inbounds i8, i8* %124, i32 0
  %125 = load i8, i8* %arrayidx153, align 1
  %conv154 = sext i8 %125 to i32
  %cmp155 = icmp eq i32 %conv152, %conv154
  br i1 %cmp155, label %land.lhs.true157, label %if.else164

land.lhs.true157:                                 ; preds = %cond.false150
  %126 = load i8*, i8** %new.addr, align 4
  %127 = load i8*, i8** %old.addr, align 4
  %128 = load i32, i32* %omax.addr, align 4
  %call158 = call i32 @strncmp(i8* %126, i8* %127, i32 %128)
  %cmp159 = icmp eq i32 %call158, 0
  br i1 %cmp159, label %if.then161, label %if.else164

if.then161:                                       ; preds = %land.lhs.true157, %cond.true149
  %129 = load i32, i32* %omax.addr, align 4
  store i32 %129, i32* %old_offset, align 4
  %130 = load i32, i32* %nmax.addr, align 4
  store i32 %130, i32* %new_offset, align 4
  %131 = load i8*, i8** %old.addr, align 4
  %132 = load i32, i32* %omax.addr, align 4
  %add.ptr162 = getelementptr inbounds i8, i8* %131, i32 %132
  store i8* %add.ptr162, i8** %ofd, align 4
  %133 = load i8*, i8** %new.addr, align 4
  %134 = load i32, i32* %nmax.addr, align 4
  %add.ptr163 = getelementptr inbounds i8, i8* %133, i32 %134
  store i8* %add.ptr163, i8** %nfd, align 4
  br label %if.end179

if.else164:                                       ; preds = %land.lhs.true157, %cond.false150, %cond.true149, %if.else143
  store i32 0, i32* %old_offset, align 4
  store i32 0, i32* %new_offset, align 4
  %135 = load i8*, i8** %old.addr, align 4
  store i8* %135, i8** %ofd, align 4
  %136 = load i8*, i8** %new.addr, align 4
  store i8* %136, i8** %nfd, align 4
  br label %for.cond165

for.cond165:                                      ; preds = %for.body173, %if.else164
  %137 = load i8*, i8** %ofd, align 4
  %138 = load i8*, i8** %old.addr, align 4
  %sub.ptr.lhs.cast = ptrtoint i8* %137 to i32
  %sub.ptr.rhs.cast = ptrtoint i8* %138 to i32
  %sub.ptr.sub = sub i32 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %139 = load i32, i32* %omax.addr, align 4
  %cmp166 = icmp slt i32 %sub.ptr.sub, %139
  br i1 %cmp166, label %land.lhs.true168, label %land.end

land.lhs.true168:                                 ; preds = %for.cond165
  %140 = load i8*, i8** %ofd, align 4
  %141 = load i8, i8* %140, align 1
  %conv169 = sext i8 %141 to i32
  %tobool170 = icmp ne i32 %conv169, 0
  br i1 %tobool170, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %land.lhs.true168
  %142 = load i8*, i8** %old.addr, align 4
  %143 = load i32, i32* %old_offset, align 4
  %144 = load i8*, i8** %new.addr, align 4
  %145 = load i32, i32* %new_offset, align 4
  %call171 = call i32 @_rl_compare_chars(i8* %142, i32 %143, %struct.__mbstate_t* %ps_old, i8* %144, i32 %145, %struct.__mbstate_t* %ps_new)
  %tobool172 = icmp ne i32 %call171, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %land.lhs.true168, %for.cond165
  %146 = phi i1 [ false, %land.lhs.true168 ], [ false, %for.cond165 ], [ %tobool172, %land.rhs ]
  br i1 %146, label %for.body173, label %for.end178

for.body173:                                      ; preds = %land.end
  %147 = load i8*, i8** %old.addr, align 4
  %148 = load i32, i32* %old_offset, align 4
  %call174 = call i32 @_rl_find_next_mbchar(i8* %147, i32 %148, i32 1, i32 0)
  store i32 %call174, i32* %old_offset, align 4
  %149 = load i8*, i8** %new.addr, align 4
  %150 = load i32, i32* %new_offset, align 4
  %call175 = call i32 @_rl_find_next_mbchar(i8* %149, i32 %150, i32 1, i32 0)
  store i32 %call175, i32* %new_offset, align 4
  %151 = load i8*, i8** %old.addr, align 4
  %152 = load i32, i32* %old_offset, align 4
  %add.ptr176 = getelementptr inbounds i8, i8* %151, i32 %152
  store i8* %add.ptr176, i8** %ofd, align 4
  %153 = load i8*, i8** %new.addr, align 4
  %154 = load i32, i32* %new_offset, align 4
  %add.ptr177 = getelementptr inbounds i8, i8* %153, i32 %154
  store i8* %add.ptr177, i8** %nfd, align 4
  br label %for.cond165

for.end178:                                       ; preds = %land.end
  br label %if.end179

if.end179:                                        ; preds = %for.end178, %if.then161
  br label %if.end180

if.end180:                                        ; preds = %if.end179, %if.then140
  br label %if.end201

if.else181:                                       ; preds = %land.lhs.true127, %if.end124
  %155 = load i8*, i8** %old.addr, align 4
  store i8* %155, i8** %ofd, align 4
  %156 = load i8*, i8** %new.addr, align 4
  store i8* %156, i8** %nfd, align 4
  br label %for.cond182

for.cond182:                                      ; preds = %for.inc198, %if.else181
  %157 = load i8*, i8** %ofd, align 4
  %158 = load i8*, i8** %old.addr, align 4
  %sub.ptr.lhs.cast183 = ptrtoint i8* %157 to i32
  %sub.ptr.rhs.cast184 = ptrtoint i8* %158 to i32
  %sub.ptr.sub185 = sub i32 %sub.ptr.lhs.cast183, %sub.ptr.rhs.cast184
  %159 = load i32, i32* %omax.addr, align 4
  %cmp186 = icmp slt i32 %sub.ptr.sub185, %159
  br i1 %cmp186, label %land.lhs.true188, label %land.end196

land.lhs.true188:                                 ; preds = %for.cond182
  %160 = load i8*, i8** %ofd, align 4
  %161 = load i8, i8* %160, align 1
  %conv189 = sext i8 %161 to i32
  %tobool190 = icmp ne i32 %conv189, 0
  br i1 %tobool190, label %land.rhs191, label %land.end196

land.rhs191:                                      ; preds = %land.lhs.true188
  %162 = load i8*, i8** %ofd, align 4
  %163 = load i8, i8* %162, align 1
  %conv192 = sext i8 %163 to i32
  %164 = load i8*, i8** %nfd, align 4
  %165 = load i8, i8* %164, align 1
  %conv193 = sext i8 %165 to i32
  %cmp194 = icmp eq i32 %conv192, %conv193
  br label %land.end196

land.end196:                                      ; preds = %land.rhs191, %land.lhs.true188, %for.cond182
  %166 = phi i1 [ false, %land.lhs.true188 ], [ false, %for.cond182 ], [ %cmp194, %land.rhs191 ]
  br i1 %166, label %for.body197, label %for.end200

for.body197:                                      ; preds = %land.end196
  br label %for.inc198

for.inc198:                                       ; preds = %for.body197
  %167 = load i8*, i8** %ofd, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %167, i32 1
  store i8* %incdec.ptr, i8** %ofd, align 4
  %168 = load i8*, i8** %nfd, align 4
  %incdec.ptr199 = getelementptr inbounds i8, i8* %168, i32 1
  store i8* %incdec.ptr199, i8** %nfd, align 4
  br label %for.cond182

for.end200:                                       ; preds = %land.end196
  br label %if.end201

if.end201:                                        ; preds = %for.end200, %if.end180
  %169 = load i8*, i8** %ofd, align 4
  %170 = load i8*, i8** %old.addr, align 4
  %sub.ptr.lhs.cast202 = ptrtoint i8* %169 to i32
  %sub.ptr.rhs.cast203 = ptrtoint i8* %170 to i32
  %sub.ptr.sub204 = sub i32 %sub.ptr.lhs.cast202, %sub.ptr.rhs.cast203
  store i32 %sub.ptr.sub204, i32* %od, align 4
  %171 = load i8*, i8** %ofd, align 4
  store i8* %171, i8** %oe, align 4
  br label %for.cond205

for.cond205:                                      ; preds = %for.inc213, %if.end201
  %172 = load i32, i32* %od, align 4
  %173 = load i32, i32* %omax.addr, align 4
  %cmp206 = icmp slt i32 %172, %173
  br i1 %cmp206, label %land.rhs208, label %land.end211

land.rhs208:                                      ; preds = %for.cond205
  %174 = load i8*, i8** %oe, align 4
  %175 = load i8, i8* %174, align 1
  %conv209 = sext i8 %175 to i32
  %tobool210 = icmp ne i32 %conv209, 0
  br label %land.end211

land.end211:                                      ; preds = %land.rhs208, %for.cond205
  %176 = phi i1 [ false, %for.cond205 ], [ %tobool210, %land.rhs208 ]
  br i1 %176, label %for.body212, label %for.end216

for.body212:                                      ; preds = %land.end211
  br label %for.inc213

for.inc213:                                       ; preds = %for.body212
  %177 = load i8*, i8** %oe, align 4
  %incdec.ptr214 = getelementptr inbounds i8, i8* %177, i32 1
  store i8* %incdec.ptr214, i8** %oe, align 4
  %178 = load i32, i32* %od, align 4
  %inc215 = add nsw i32 %178, 1
  store i32 %inc215, i32* %od, align 4
  br label %for.cond205

for.end216:                                       ; preds = %land.end211
  %179 = load i8*, i8** %nfd, align 4
  %180 = load i8*, i8** %new.addr, align 4
  %sub.ptr.lhs.cast217 = ptrtoint i8* %179 to i32
  %sub.ptr.rhs.cast218 = ptrtoint i8* %180 to i32
  %sub.ptr.sub219 = sub i32 %sub.ptr.lhs.cast217, %sub.ptr.rhs.cast218
  store i32 %sub.ptr.sub219, i32* %nd, align 4
  %181 = load i8*, i8** %nfd, align 4
  store i8* %181, i8** %ne, align 4
  br label %for.cond220

for.cond220:                                      ; preds = %for.inc228, %for.end216
  %182 = load i32, i32* %nd, align 4
  %183 = load i32, i32* %nmax.addr, align 4
  %cmp221 = icmp slt i32 %182, %183
  br i1 %cmp221, label %land.rhs223, label %land.end226

land.rhs223:                                      ; preds = %for.cond220
  %184 = load i8*, i8** %ne, align 4
  %185 = load i8, i8* %184, align 1
  %conv224 = sext i8 %185 to i32
  %tobool225 = icmp ne i32 %conv224, 0
  br label %land.end226

land.end226:                                      ; preds = %land.rhs223, %for.cond220
  %186 = phi i1 [ false, %for.cond220 ], [ %tobool225, %land.rhs223 ]
  br i1 %186, label %for.body227, label %for.end231

for.body227:                                      ; preds = %land.end226
  br label %for.inc228

for.inc228:                                       ; preds = %for.body227
  %187 = load i8*, i8** %ne, align 4
  %incdec.ptr229 = getelementptr inbounds i8, i8* %187, i32 1
  store i8* %incdec.ptr229, i8** %ne, align 4
  %188 = load i32, i32* %nd, align 4
  %inc230 = add nsw i32 %188, 1
  store i32 %inc230, i32* %nd, align 4
  br label %for.cond220

for.end231:                                       ; preds = %land.end226
  %189 = load i8*, i8** %ofd, align 4
  %190 = load i8*, i8** %oe, align 4
  %cmp232 = icmp eq i8* %189, %190
  br i1 %cmp232, label %land.lhs.true234, label %if.end238

land.lhs.true234:                                 ; preds = %for.end231
  %191 = load i8*, i8** %nfd, align 4
  %192 = load i8*, i8** %ne, align 4
  %cmp235 = icmp eq i8* %191, %192
  br i1 %cmp235, label %if.then237, label %if.end238

if.then237:                                       ; preds = %land.lhs.true234
  br label %if.end982

if.end238:                                        ; preds = %land.lhs.true234, %for.end231
  %193 = load i32, i32* %mb_cur_max, align 4
  %cmp239 = icmp sgt i32 %193, 1
  br i1 %cmp239, label %land.lhs.true241, label %if.end274

land.lhs.true241:                                 ; preds = %if.end238
  %194 = load i32, i32* @rl_byte_oriented, align 4
  %cmp242 = icmp eq i32 %194, 0
  br i1 %cmp242, label %land.lhs.true244, label %if.end274

land.lhs.true244:                                 ; preds = %land.lhs.true241
  %195 = load i32, i32* @_rl_utf8locale, align 4
  %tobool245 = icmp ne i32 %195, 0
  br i1 %tobool245, label %if.then246, label %if.end274

if.then246:                                       ; preds = %land.lhs.true244
  %196 = bitcast %struct.__mbstate_t* %ps248 to i8*
  call void @llvm.memset.p0i8.i32(i8* %196, i8 0, i32 8, i32 4, i1 false)
  %197 = load i8*, i8** %ofd, align 4
  %198 = load i32, i32* %mb_cur_max, align 4
  %call249 = call i32 @mbrtowc(i32* %wc247, i8* %197, i32 %198, %struct.__mbstate_t* %ps248)
  store i32 %call249, i32* %t, align 4
  %199 = load i32, i32* %t, align 4
  %cmp250 = icmp sgt i32 %199, 0
  br i1 %cmp250, label %land.lhs.true252, label %if.end273

land.lhs.true252:                                 ; preds = %if.then246
  %200 = load i32, i32* %wc247, align 4
  %cmp253 = icmp sge i32 %200, 768
  br i1 %cmp253, label %land.lhs.true255, label %if.end273

land.lhs.true255:                                 ; preds = %land.lhs.true252
  %201 = load i32, i32* %wc247, align 4
  %cmp256 = icmp sle i32 %201, 879
  br i1 %cmp256, label %land.lhs.true258, label %if.end273

land.lhs.true258:                                 ; preds = %land.lhs.true255
  %202 = load i32, i32* %wc247, align 4
  %call259 = call i32 @_rl_wcwidth(i32 %202)
  %cmp260 = icmp eq i32 %call259, 0
  br i1 %cmp260, label %if.then262, label %if.end273

if.then262:                                       ; preds = %land.lhs.true258
  %203 = load i8*, i8** %old.addr, align 4
  %204 = load i8*, i8** %ofd, align 4
  %205 = load i8*, i8** %old.addr, align 4
  %sub.ptr.lhs.cast263 = ptrtoint i8* %204 to i32
  %sub.ptr.rhs.cast264 = ptrtoint i8* %205 to i32
  %sub.ptr.sub265 = sub i32 %sub.ptr.lhs.cast263, %sub.ptr.rhs.cast264
  %call266 = call i32 @_rl_find_prev_mbchar(i8* %203, i32 %sub.ptr.sub265, i32 0)
  store i32 %call266, i32* %old_offset, align 4
  %206 = load i8*, i8** %new.addr, align 4
  %207 = load i8*, i8** %nfd, align 4
  %208 = load i8*, i8** %new.addr, align 4
  %sub.ptr.lhs.cast267 = ptrtoint i8* %207 to i32
  %sub.ptr.rhs.cast268 = ptrtoint i8* %208 to i32
  %sub.ptr.sub269 = sub i32 %sub.ptr.lhs.cast267, %sub.ptr.rhs.cast268
  %call270 = call i32 @_rl_find_prev_mbchar(i8* %206, i32 %sub.ptr.sub269, i32 0)
  store i32 %call270, i32* %new_offset, align 4
  %209 = load i8*, i8** %old.addr, align 4
  %210 = load i32, i32* %old_offset, align 4
  %add.ptr271 = getelementptr inbounds i8, i8* %209, i32 %210
  store i8* %add.ptr271, i8** %ofd, align 4
  %211 = load i8*, i8** %new.addr, align 4
  %212 = load i32, i32* %new_offset, align 4
  %add.ptr272 = getelementptr inbounds i8, i8* %211, i32 %212
  store i8* %add.ptr272, i8** %nfd, align 4
  br label %if.end273

if.end273:                                        ; preds = %if.then262, %land.lhs.true258, %land.lhs.true255, %land.lhs.true252, %if.then246
  br label %if.end274

if.end274:                                        ; preds = %if.end273, %land.lhs.true244, %land.lhs.true241, %if.end238
  store i32 1, i32* %wsatend, align 4
  %213 = load i32, i32* %mb_cur_max, align 4
  %cmp275 = icmp sgt i32 %213, 1
  br i1 %cmp275, label %land.lhs.true277, label %if.else323

land.lhs.true277:                                 ; preds = %if.end274
  %214 = load i32, i32* @rl_byte_oriented, align 4
  %cmp278 = icmp eq i32 %214, 0
  br i1 %cmp278, label %if.then280, label %if.else323

if.then280:                                       ; preds = %land.lhs.true277
  %215 = load i8*, i8** %old.addr, align 4
  %216 = load i8*, i8** %old.addr, align 4
  %217 = load i8*, i8** %oe, align 4
  %218 = load i8*, i8** %old.addr, align 4
  %sub.ptr.lhs.cast281 = ptrtoint i8* %217 to i32
  %sub.ptr.rhs.cast282 = ptrtoint i8* %218 to i32
  %sub.ptr.sub283 = sub i32 %sub.ptr.lhs.cast281, %sub.ptr.rhs.cast282
  %call284 = call i32 @_rl_find_prev_mbchar(i8* %216, i32 %sub.ptr.sub283, i32 0)
  %add.ptr285 = getelementptr inbounds i8, i8* %215, i32 %call284
  store i8* %add.ptr285, i8** %ols, align 4
  %219 = load i8*, i8** %new.addr, align 4
  %220 = load i8*, i8** %new.addr, align 4
  %221 = load i8*, i8** %ne, align 4
  %222 = load i8*, i8** %new.addr, align 4
  %sub.ptr.lhs.cast286 = ptrtoint i8* %221 to i32
  %sub.ptr.rhs.cast287 = ptrtoint i8* %222 to i32
  %sub.ptr.sub288 = sub i32 %sub.ptr.lhs.cast286, %sub.ptr.rhs.cast287
  %call289 = call i32 @_rl_find_prev_mbchar(i8* %220, i32 %sub.ptr.sub288, i32 0)
  %add.ptr290 = getelementptr inbounds i8, i8* %219, i32 %call289
  store i8* %add.ptr290, i8** %nls, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end312, %if.then280
  %223 = load i8*, i8** %ols, align 4
  %224 = load i8*, i8** %ofd, align 4
  %cmp291 = icmp ugt i8* %223, %224
  br i1 %cmp291, label %land.rhs293, label %land.end296

land.rhs293:                                      ; preds = %while.cond
  %225 = load i8*, i8** %nls, align 4
  %226 = load i8*, i8** %nfd, align 4
  %cmp294 = icmp ugt i8* %225, %226
  br label %land.end296

land.end296:                                      ; preds = %land.rhs293, %while.cond
  %227 = phi i1 [ false, %while.cond ], [ %cmp294, %land.rhs293 ]
  br i1 %227, label %while.body, label %while.end

while.body:                                       ; preds = %land.end296
  %228 = bitcast %struct.__mbstate_t* %ps_old to i8*
  call void @llvm.memset.p0i8.i32(i8* %228, i8 0, i32 8, i32 4, i1 false)
  %229 = bitcast %struct.__mbstate_t* %ps_new to i8*
  call void @llvm.memset.p0i8.i32(i8* %229, i8 0, i32 8, i32 4, i1 false)
  %230 = load i8*, i8** %old.addr, align 4
  %231 = load i8*, i8** %ols, align 4
  %232 = load i8*, i8** %old.addr, align 4
  %sub.ptr.lhs.cast297 = ptrtoint i8* %231 to i32
  %sub.ptr.rhs.cast298 = ptrtoint i8* %232 to i32
  %sub.ptr.sub299 = sub i32 %sub.ptr.lhs.cast297, %sub.ptr.rhs.cast298
  %233 = load i8*, i8** %new.addr, align 4
  %234 = load i8*, i8** %nls, align 4
  %235 = load i8*, i8** %new.addr, align 4
  %sub.ptr.lhs.cast300 = ptrtoint i8* %234 to i32
  %sub.ptr.rhs.cast301 = ptrtoint i8* %235 to i32
  %sub.ptr.sub302 = sub i32 %sub.ptr.lhs.cast300, %sub.ptr.rhs.cast301
  %call303 = call i32 @_rl_compare_chars(i8* %230, i32 %sub.ptr.sub299, %struct.__mbstate_t* %ps_old, i8* %233, i32 %sub.ptr.sub302, %struct.__mbstate_t* %ps_new)
  %cmp304 = icmp eq i32 %call303, 0
  br i1 %cmp304, label %if.then306, label %if.end307

if.then306:                                       ; preds = %while.body
  br label %while.end

if.end307:                                        ; preds = %while.body
  %236 = load i8*, i8** %ols, align 4
  %237 = load i8, i8* %236, align 1
  %conv308 = sext i8 %237 to i32
  %cmp309 = icmp eq i32 %conv308, 32
  br i1 %cmp309, label %if.then311, label %if.end312

if.then311:                                       ; preds = %if.end307
  store i32 0, i32* %wsatend, align 4
  br label %if.end312

if.end312:                                        ; preds = %if.then311, %if.end307
  %238 = load i8*, i8** %old.addr, align 4
  %239 = load i8*, i8** %old.addr, align 4
  %240 = load i8*, i8** %ols, align 4
  %241 = load i8*, i8** %old.addr, align 4
  %sub.ptr.lhs.cast313 = ptrtoint i8* %240 to i32
  %sub.ptr.rhs.cast314 = ptrtoint i8* %241 to i32
  %sub.ptr.sub315 = sub i32 %sub.ptr.lhs.cast313, %sub.ptr.rhs.cast314
  %call316 = call i32 @_rl_find_prev_mbchar(i8* %239, i32 %sub.ptr.sub315, i32 0)
  %add.ptr317 = getelementptr inbounds i8, i8* %238, i32 %call316
  store i8* %add.ptr317, i8** %ols, align 4
  %242 = load i8*, i8** %new.addr, align 4
  %243 = load i8*, i8** %new.addr, align 4
  %244 = load i8*, i8** %nls, align 4
  %245 = load i8*, i8** %new.addr, align 4
  %sub.ptr.lhs.cast318 = ptrtoint i8* %244 to i32
  %sub.ptr.rhs.cast319 = ptrtoint i8* %245 to i32
  %sub.ptr.sub320 = sub i32 %sub.ptr.lhs.cast318, %sub.ptr.rhs.cast319
  %call321 = call i32 @_rl_find_prev_mbchar(i8* %243, i32 %sub.ptr.sub320, i32 0)
  %add.ptr322 = getelementptr inbounds i8, i8* %242, i32 %call321
  store i8* %add.ptr322, i8** %nls, align 4
  br label %while.cond

while.end:                                        ; preds = %if.then306, %land.end296
  br label %if.end347

if.else323:                                       ; preds = %land.lhs.true277, %if.end274
  %246 = load i8*, i8** %oe, align 4
  %add.ptr324 = getelementptr inbounds i8, i8* %246, i32 -1
  store i8* %add.ptr324, i8** %ols, align 4
  %247 = load i8*, i8** %ne, align 4
  %add.ptr325 = getelementptr inbounds i8, i8* %247, i32 -1
  store i8* %add.ptr325, i8** %nls, align 4
  br label %while.cond326

while.cond326:                                    ; preds = %if.end343, %if.else323
  %248 = load i8*, i8** %ols, align 4
  %249 = load i8*, i8** %ofd, align 4
  %cmp327 = icmp ugt i8* %248, %249
  br i1 %cmp327, label %land.lhs.true329, label %land.end337

land.lhs.true329:                                 ; preds = %while.cond326
  %250 = load i8*, i8** %nls, align 4
  %251 = load i8*, i8** %nfd, align 4
  %cmp330 = icmp ugt i8* %250, %251
  br i1 %cmp330, label %land.rhs332, label %land.end337

land.rhs332:                                      ; preds = %land.lhs.true329
  %252 = load i8*, i8** %ols, align 4
  %253 = load i8, i8* %252, align 1
  %conv333 = sext i8 %253 to i32
  %254 = load i8*, i8** %nls, align 4
  %255 = load i8, i8* %254, align 1
  %conv334 = sext i8 %255 to i32
  %cmp335 = icmp eq i32 %conv333, %conv334
  br label %land.end337

land.end337:                                      ; preds = %land.rhs332, %land.lhs.true329, %while.cond326
  %256 = phi i1 [ false, %land.lhs.true329 ], [ false, %while.cond326 ], [ %cmp335, %land.rhs332 ]
  br i1 %256, label %while.body338, label %while.end346

while.body338:                                    ; preds = %land.end337
  %257 = load i8*, i8** %ols, align 4
  %258 = load i8, i8* %257, align 1
  %conv339 = sext i8 %258 to i32
  %cmp340 = icmp ne i32 %conv339, 32
  br i1 %cmp340, label %if.then342, label %if.end343

if.then342:                                       ; preds = %while.body338
  store i32 0, i32* %wsatend, align 4
  br label %if.end343

if.end343:                                        ; preds = %if.then342, %while.body338
  %259 = load i8*, i8** %ols, align 4
  %incdec.ptr344 = getelementptr inbounds i8, i8* %259, i32 -1
  store i8* %incdec.ptr344, i8** %ols, align 4
  %260 = load i8*, i8** %nls, align 4
  %incdec.ptr345 = getelementptr inbounds i8, i8* %260, i32 -1
  store i8* %incdec.ptr345, i8** %nls, align 4
  br label %while.cond326

while.end346:                                     ; preds = %land.end337
  br label %if.end347

if.end347:                                        ; preds = %while.end346, %while.end
  %261 = load i32, i32* %wsatend, align 4
  %tobool348 = icmp ne i32 %261, 0
  br i1 %tobool348, label %if.then349, label %if.else350

if.then349:                                       ; preds = %if.end347
  %262 = load i8*, i8** %oe, align 4
  store i8* %262, i8** %ols, align 4
  %263 = load i8*, i8** %ne, align 4
  store i8* %263, i8** %nls, align 4
  br label %if.end390

if.else350:                                       ; preds = %if.end347
  %264 = load i8*, i8** %ols, align 4
  %265 = load i8*, i8** %nls, align 4
  %call351 = call i32 @_rl_compare_chars(i8* %264, i32 0, %struct.__mbstate_t* null, i8* %265, i32 0, %struct.__mbstate_t* null)
  %cmp352 = icmp eq i32 %call351, 0
  br i1 %cmp352, label %if.then354, label %if.end389

if.then354:                                       ; preds = %if.else350
  %266 = load i8*, i8** %ols, align 4
  %267 = load i8, i8* %266, align 1
  %tobool355 = icmp ne i8 %267, 0
  br i1 %tobool355, label %if.then356, label %if.end371

if.then356:                                       ; preds = %if.then354
  %268 = load i32, i32* %mb_cur_max, align 4
  %cmp357 = icmp sgt i32 %268, 1
  br i1 %cmp357, label %land.lhs.true359, label %if.else368

land.lhs.true359:                                 ; preds = %if.then356
  %269 = load i32, i32* @rl_byte_oriented, align 4
  %cmp360 = icmp eq i32 %269, 0
  br i1 %cmp360, label %if.then362, label %if.else368

if.then362:                                       ; preds = %land.lhs.true359
  %270 = load i8*, i8** %old.addr, align 4
  %271 = load i8*, i8** %old.addr, align 4
  %272 = load i8*, i8** %ols, align 4
  %273 = load i8*, i8** %old.addr, align 4
  %sub.ptr.lhs.cast363 = ptrtoint i8* %272 to i32
  %sub.ptr.rhs.cast364 = ptrtoint i8* %273 to i32
  %sub.ptr.sub365 = sub i32 %sub.ptr.lhs.cast363, %sub.ptr.rhs.cast364
  %call366 = call i32 @_rl_find_next_mbchar(i8* %271, i32 %sub.ptr.sub365, i32 1, i32 0)
  %add.ptr367 = getelementptr inbounds i8, i8* %270, i32 %call366
  store i8* %add.ptr367, i8** %ols, align 4
  br label %if.end370

if.else368:                                       ; preds = %land.lhs.true359, %if.then356
  %274 = load i8*, i8** %ols, align 4
  %incdec.ptr369 = getelementptr inbounds i8, i8* %274, i32 1
  store i8* %incdec.ptr369, i8** %ols, align 4
  br label %if.end370

if.end370:                                        ; preds = %if.else368, %if.then362
  br label %if.end371

if.end371:                                        ; preds = %if.end370, %if.then354
  %275 = load i8*, i8** %nls, align 4
  %276 = load i8, i8* %275, align 1
  %tobool372 = icmp ne i8 %276, 0
  br i1 %tobool372, label %if.then373, label %if.end388

if.then373:                                       ; preds = %if.end371
  %277 = load i32, i32* %mb_cur_max, align 4
  %cmp374 = icmp sgt i32 %277, 1
  br i1 %cmp374, label %land.lhs.true376, label %if.else385

land.lhs.true376:                                 ; preds = %if.then373
  %278 = load i32, i32* @rl_byte_oriented, align 4
  %cmp377 = icmp eq i32 %278, 0
  br i1 %cmp377, label %if.then379, label %if.else385

if.then379:                                       ; preds = %land.lhs.true376
  %279 = load i8*, i8** %new.addr, align 4
  %280 = load i8*, i8** %new.addr, align 4
  %281 = load i8*, i8** %nls, align 4
  %282 = load i8*, i8** %new.addr, align 4
  %sub.ptr.lhs.cast380 = ptrtoint i8* %281 to i32
  %sub.ptr.rhs.cast381 = ptrtoint i8* %282 to i32
  %sub.ptr.sub382 = sub i32 %sub.ptr.lhs.cast380, %sub.ptr.rhs.cast381
  %call383 = call i32 @_rl_find_next_mbchar(i8* %280, i32 %sub.ptr.sub382, i32 1, i32 0)
  %add.ptr384 = getelementptr inbounds i8, i8* %279, i32 %call383
  store i8* %add.ptr384, i8** %nls, align 4
  br label %if.end387

if.else385:                                       ; preds = %land.lhs.true376, %if.then373
  %283 = load i8*, i8** %nls, align 4
  %incdec.ptr386 = getelementptr inbounds i8, i8* %283, i32 1
  store i8* %incdec.ptr386, i8** %nls, align 4
  br label %if.end387

if.end387:                                        ; preds = %if.else385, %if.then379
  br label %if.end388

if.end388:                                        ; preds = %if.end387, %if.end371
  br label %if.end389

if.end389:                                        ; preds = %if.end388, %if.else350
  br label %if.end390

if.end390:                                        ; preds = %if.end389, %if.then349
  %284 = load i32, i32* %current_line.addr, align 4
  %cmp391 = icmp eq i32 %284, 0
  br i1 %cmp391, label %cond.true393, label %cond.false394

cond.true393:                                     ; preds = %if.end390
  %285 = load i32, i32* @wrap_offset, align 4
  br label %cond.end395

cond.false394:                                    ; preds = %if.end390
  br label %cond.end395

cond.end395:                                      ; preds = %cond.false394, %cond.true393
  %cond396 = phi i32 [ %285, %cond.true393 ], [ 0, %cond.false394 ]
  store i32 %cond396, i32* %current_invis_chars, align 4
  %286 = load i32, i32* @_rl_last_v_pos, align 4
  %287 = load i32, i32* %current_line.addr, align 4
  %cmp397 = icmp ne i32 %286, %287
  br i1 %cmp397, label %if.then399, label %if.end416

if.then399:                                       ; preds = %cond.end395
  %288 = load i32, i32* %current_line.addr, align 4
  call void @_rl_move_vert(i32 %288)
  %289 = load i32, i32* %current_line.addr, align 4
  %cmp400 = icmp eq i32 %289, 0
  br i1 %cmp400, label %if.then402, label %if.end403

if.then402:                                       ; preds = %if.then399
  %290 = load i32, i32* @prompt_invis_chars_first_line, align 4
  store i32 %290, i32* @visible_wrap_offset, align 4
  br label %if.end403

if.end403:                                        ; preds = %if.then402, %if.then399
  %291 = load i32, i32* %mb_cur_max, align 4
  %cmp404 = icmp eq i32 %291, 1
  br i1 %cmp404, label %land.lhs.true408, label %lor.lhs.false406

lor.lhs.false406:                                 ; preds = %if.end403
  %292 = load i32, i32* @rl_byte_oriented, align 4
  %tobool407 = icmp ne i32 %292, 0
  br i1 %tobool407, label %land.lhs.true408, label %if.end415

land.lhs.true408:                                 ; preds = %lor.lhs.false406, %if.end403
  %293 = load i32, i32* %current_line.addr, align 4
  %cmp409 = icmp eq i32 %293, 0
  br i1 %cmp409, label %land.lhs.true411, label %if.end415

land.lhs.true411:                                 ; preds = %land.lhs.true408
  %294 = load i32, i32* @visible_wrap_offset, align 4
  %tobool412 = icmp ne i32 %294, 0
  br i1 %tobool412, label %if.then413, label %if.end415

if.then413:                                       ; preds = %land.lhs.true411
  %295 = load i32, i32* @visible_wrap_offset, align 4
  %296 = load i32, i32* @_rl_last_c_pos, align 4
  %add414 = add nsw i32 %296, %295
  store i32 %add414, i32* @_rl_last_c_pos, align 4
  br label %if.end415

if.end415:                                        ; preds = %if.then413, %land.lhs.true411, %land.lhs.true408, %lor.lhs.false406
  br label %if.end416

if.end416:                                        ; preds = %if.end415, %cond.end395
  %297 = load i32, i32* @local_prompt_len, align 4
  store i32 %297, i32* %lendiff, align 4
  %298 = load i32, i32* %lendiff, align 4
  %299 = load i32, i32* %nmax.addr, align 4
  %cmp417 = icmp sgt i32 %298, %299
  br i1 %cmp417, label %if.then419, label %if.end420

if.then419:                                       ; preds = %if.end416
  %300 = load i32, i32* %nmax.addr, align 4
  store i32 %300, i32* %lendiff, align 4
  br label %if.end420

if.end420:                                        ; preds = %if.then419, %if.end416
  %301 = load i8*, i8** %ofd, align 4
  %302 = load i8*, i8** %old.addr, align 4
  %sub.ptr.lhs.cast421 = ptrtoint i8* %301 to i32
  %sub.ptr.rhs.cast422 = ptrtoint i8* %302 to i32
  %sub.ptr.sub423 = sub i32 %sub.ptr.lhs.cast421, %sub.ptr.rhs.cast422
  store i32 %sub.ptr.sub423, i32* %od, align 4
  %303 = load i8*, i8** %nfd, align 4
  %304 = load i8*, i8** %new.addr, align 4
  %sub.ptr.lhs.cast424 = ptrtoint i8* %303 to i32
  %sub.ptr.rhs.cast425 = ptrtoint i8* %304 to i32
  %sub.ptr.sub426 = sub i32 %sub.ptr.lhs.cast424, %sub.ptr.rhs.cast425
  store i32 %sub.ptr.sub426, i32* %nd, align 4
  %305 = load i32, i32* %current_line.addr, align 4
  %cmp427 = icmp eq i32 %305, 0
  br i1 %cmp427, label %land.lhs.true429, label %if.end540

land.lhs.true429:                                 ; preds = %if.end420
  %306 = load i32, i32* @_rl_horizontal_scroll_mode, align 4
  %tobool430 = icmp ne i32 %306, 0
  br i1 %tobool430, label %if.end540, label %land.lhs.true431

land.lhs.true431:                                 ; preds = %land.lhs.true429
  %307 = load i8*, i8** @_rl_term_cr, align 4
  %tobool432 = icmp ne i8* %307, null
  br i1 %tobool432, label %land.lhs.true433, label %if.end540

land.lhs.true433:                                 ; preds = %land.lhs.true431
  %308 = load i32, i32* %lendiff, align 4
  %309 = load i32, i32* @prompt_visible_length, align 4
  %cmp434 = icmp sgt i32 %308, %309
  br i1 %cmp434, label %land.lhs.true436, label %if.end540

land.lhs.true436:                                 ; preds = %land.lhs.true433
  %310 = load i32, i32* @_rl_last_c_pos, align 4
  %cmp437 = icmp sgt i32 %310, 0
  br i1 %cmp437, label %land.lhs.true439, label %if.end540

land.lhs.true439:                                 ; preds = %land.lhs.true436
  %311 = load i32, i32* %od, align 4
  %cmp440 = icmp sgt i32 %311, 0
  br i1 %cmp440, label %land.lhs.true445, label %lor.lhs.false442

lor.lhs.false442:                                 ; preds = %land.lhs.true439
  %312 = load i32, i32* %nd, align 4
  %cmp443 = icmp sgt i32 %312, 0
  br i1 %cmp443, label %land.lhs.true445, label %lor.lhs.false451

land.lhs.true445:                                 ; preds = %lor.lhs.false442, %land.lhs.true439
  %313 = load i32, i32* %od, align 4
  %314 = load i32, i32* @prompt_last_invisible, align 4
  %cmp446 = icmp sle i32 %313, %314
  br i1 %cmp446, label %if.then468, label %lor.lhs.false448

lor.lhs.false448:                                 ; preds = %land.lhs.true445
  %315 = load i32, i32* %nd, align 4
  %316 = load i32, i32* @prompt_last_invisible, align 4
  %cmp449 = icmp sle i32 %315, %316
  br i1 %cmp449, label %if.then468, label %lor.lhs.false451

lor.lhs.false451:                                 ; preds = %lor.lhs.false448, %lor.lhs.false442
  %317 = load i32, i32* %od, align 4
  %318 = load i32, i32* %lendiff, align 4
  %cmp452 = icmp sge i32 %317, %318
  br i1 %cmp452, label %land.lhs.true454, label %if.end540

land.lhs.true454:                                 ; preds = %lor.lhs.false451
  %319 = load i32, i32* @_rl_last_c_pos, align 4
  %call455 = call i32 @__ctype_get_mb_cur_max()
  %cmp456 = icmp ugt i32 %call455, 1
  br i1 %cmp456, label %land.lhs.true458, label %cond.false462

land.lhs.true458:                                 ; preds = %land.lhs.true454
  %320 = load i32, i32* @rl_byte_oriented, align 4
  %cmp459 = icmp eq i32 %320, 0
  br i1 %cmp459, label %cond.true461, label %cond.false462

cond.true461:                                     ; preds = %land.lhs.true458
  %321 = load i32, i32* @prompt_physical_chars, align 4
  br label %cond.end464

cond.false462:                                    ; preds = %land.lhs.true458, %land.lhs.true454
  %322 = load i32, i32* @prompt_last_invisible, align 4
  %add463 = add nsw i32 %322, 1
  br label %cond.end464

cond.end464:                                      ; preds = %cond.false462, %cond.true461
  %cond465 = phi i32 [ %321, %cond.true461 ], [ %add463, %cond.false462 ]
  %cmp466 = icmp slt i32 %319, %cond465
  br i1 %cmp466, label %if.then468, label %if.end540

if.then468:                                       ; preds = %cond.end464, %lor.lhs.false448, %land.lhs.true445
  %323 = load i8*, i8** @_rl_term_cr, align 4
  %call469 = call i32 bitcast (i32 (...)* @tputs to i32 (i8*, i32, i32 (i32)*)*)(i8* %323, i32 1, i32 (i32)* @_rl_output_character_function)
  %324 = load i32, i32* @modmark, align 4
  %tobool470 = icmp ne i32 %324, 0
  br i1 %tobool470, label %if.then471, label %if.end472

if.then471:                                       ; preds = %if.then468
  call void @_rl_output_some_chars(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i32 0, i32 0), i32 1)
  br label %if.end472

if.end472:                                        ; preds = %if.then471, %if.then468
  %325 = load i8*, i8** @local_prompt, align 4
  %326 = load i32, i32* %lendiff, align 4
  call void @_rl_output_some_chars(i8* %325, i32 %326)
  %327 = load i32, i32* %mb_cur_max, align 4
  %cmp473 = icmp sgt i32 %327, 1
  br i1 %cmp473, label %land.lhs.true475, label %if.else482

land.lhs.true475:                                 ; preds = %if.end472
  %328 = load i32, i32* @rl_byte_oriented, align 4
  %cmp476 = icmp eq i32 %328, 0
  br i1 %cmp476, label %if.then478, label %if.else482

if.then478:                                       ; preds = %land.lhs.true475
  %329 = load i8*, i8** @local_prompt, align 4
  %330 = load i32, i32* %lendiff, align 4
  %call479 = call i32 @_rl_col_width(i8* %329, i32 0, i32 %330, i32 1)
  %331 = load i32, i32* @wrap_offset, align 4
  %sub480 = sub nsw i32 %call479, %331
  %332 = load i32, i32* @modmark, align 4
  %add481 = add nsw i32 %sub480, %332
  store i32 %add481, i32* @_rl_last_c_pos, align 4
  store i32 1, i32* @cpos_adjusted, align 4
  br label %if.end484

if.else482:                                       ; preds = %land.lhs.true475, %if.end472
  %333 = load i32, i32* %lendiff, align 4
  %334 = load i32, i32* @modmark, align 4
  %add483 = add nsw i32 %333, %334
  store i32 %add483, i32* @_rl_last_c_pos, align 4
  br label %if.end484

if.end484:                                        ; preds = %if.else482, %if.then478
  %335 = load i32, i32* %od, align 4
  %336 = load i32, i32* @prompt_last_invisible, align 4
  %cmp485 = icmp sle i32 %335, %336
  br i1 %cmp485, label %land.lhs.true490, label %lor.lhs.false487

lor.lhs.false487:                                 ; preds = %if.end484
  %337 = load i32, i32* %nd, align 4
  %338 = load i32, i32* @prompt_last_invisible, align 4
  %cmp488 = icmp sle i32 %337, %338
  br i1 %cmp488, label %land.lhs.true490, label %if.end506

land.lhs.true490:                                 ; preds = %lor.lhs.false487, %if.end484
  %339 = load i32, i32* %omax.addr, align 4
  %340 = load i32, i32* %nmax.addr, align 4
  %cmp491 = icmp eq i32 %339, %340
  br i1 %cmp491, label %land.lhs.true493, label %if.end506

land.lhs.true493:                                 ; preds = %land.lhs.true490
  %341 = load i32, i32* %lendiff, align 4
  %342 = load i8*, i8** %ols, align 4
  %343 = load i8*, i8** %old.addr, align 4
  %sub.ptr.lhs.cast494 = ptrtoint i8* %342 to i32
  %sub.ptr.rhs.cast495 = ptrtoint i8* %343 to i32
  %sub.ptr.sub496 = sub i32 %sub.ptr.lhs.cast494, %sub.ptr.rhs.cast495
  %cmp497 = icmp sgt i32 %341, %sub.ptr.sub496
  br i1 %cmp497, label %land.lhs.true499, label %if.end506

land.lhs.true499:                                 ; preds = %land.lhs.true493
  %344 = load i32, i32* %lendiff, align 4
  %345 = load i8*, i8** %nls, align 4
  %346 = load i8*, i8** %new.addr, align 4
  %sub.ptr.lhs.cast500 = ptrtoint i8* %345 to i32
  %sub.ptr.rhs.cast501 = ptrtoint i8* %346 to i32
  %sub.ptr.sub502 = sub i32 %sub.ptr.lhs.cast500, %sub.ptr.rhs.cast501
  %cmp503 = icmp sgt i32 %344, %sub.ptr.sub502
  br i1 %cmp503, label %if.then505, label %if.end506

if.then505:                                       ; preds = %land.lhs.true499
  br label %if.end982

if.end506:                                        ; preds = %land.lhs.true499, %land.lhs.true493, %land.lhs.true490, %lor.lhs.false487
  %347 = load i32, i32* %od, align 4
  %348 = load i32, i32* @prompt_last_invisible, align 4
  %cmp507 = icmp sle i32 %347, %348
  br i1 %cmp507, label %if.then512, label %lor.lhs.false509

lor.lhs.false509:                                 ; preds = %if.end506
  %349 = load i32, i32* %nd, align 4
  %350 = load i32, i32* @prompt_last_invisible, align 4
  %cmp510 = icmp sle i32 %349, %350
  br i1 %cmp510, label %if.then512, label %if.end539

if.then512:                                       ; preds = %lor.lhs.false509, %if.end506
  %351 = load i8*, i8** %new.addr, align 4
  %352 = load i32, i32* %lendiff, align 4
  %add.ptr513 = getelementptr inbounds i8, i8* %351, i32 %352
  store i8* %add.ptr513, i8** %nfd, align 4
  %353 = load i32, i32* %lendiff, align 4
  store i32 %353, i32* %nd, align 4
  %354 = load i8*, i8** %ne, align 4
  %355 = load i8*, i8** %nfd, align 4
  %sub.ptr.lhs.cast514 = ptrtoint i8* %354 to i32
  %sub.ptr.rhs.cast515 = ptrtoint i8* %355 to i32
  %sub.ptr.sub516 = sub i32 %sub.ptr.lhs.cast514, %sub.ptr.rhs.cast515
  store i32 %sub.ptr.sub516, i32* %temp, align 4
  %356 = load i32, i32* %temp, align 4
  %cmp517 = icmp sgt i32 %356, 0
  br i1 %cmp517, label %if.then519, label %if.end534

if.then519:                                       ; preds = %if.then512
  %357 = load i8*, i8** %nfd, align 4
  %358 = load i32, i32* %temp, align 4
  call void @_rl_output_some_chars(i8* %357, i32 %358)
  %359 = load i32, i32* %mb_cur_max, align 4
  %cmp520 = icmp sgt i32 %359, 1
  br i1 %cmp520, label %land.lhs.true522, label %if.else531

land.lhs.true522:                                 ; preds = %if.then519
  %360 = load i32, i32* @rl_byte_oriented, align 4
  %cmp523 = icmp eq i32 %360, 0
  br i1 %cmp523, label %if.then525, label %if.else531

if.then525:                                       ; preds = %land.lhs.true522
  %361 = load i8*, i8** %new.addr, align 4
  %362 = load i32, i32* %nd, align 4
  %363 = load i8*, i8** %ne, align 4
  %364 = load i8*, i8** %new.addr, align 4
  %sub.ptr.lhs.cast526 = ptrtoint i8* %363 to i32
  %sub.ptr.rhs.cast527 = ptrtoint i8* %364 to i32
  %sub.ptr.sub528 = sub i32 %sub.ptr.lhs.cast526, %sub.ptr.rhs.cast527
  %call529 = call i32 @_rl_col_width(i8* %361, i32 %362, i32 %sub.ptr.sub528, i32 1)
  %365 = load i32, i32* @_rl_last_c_pos, align 4
  %add530 = add nsw i32 %365, %call529
  store i32 %add530, i32* @_rl_last_c_pos, align 4
  br label %if.end533

if.else531:                                       ; preds = %land.lhs.true522, %if.then519
  %366 = load i32, i32* %temp, align 4
  %367 = load i32, i32* @_rl_last_c_pos, align 4
  %add532 = add nsw i32 %367, %366
  store i32 %add532, i32* @_rl_last_c_pos, align 4
  br label %if.end533

if.end533:                                        ; preds = %if.else531, %if.then525
  br label %if.end534

if.end534:                                        ; preds = %if.end533, %if.then512
  %368 = load i32, i32* %nmax.addr, align 4
  %369 = load i32, i32* %omax.addr, align 4
  %cmp535 = icmp slt i32 %368, %369
  br i1 %cmp535, label %if.then537, label %if.else538

if.then537:                                       ; preds = %if.end534
  br label %clear_rest_of_line

if.else538:                                       ; preds = %if.end534
  br label %if.end982

if.end539:                                        ; preds = %lor.lhs.false509
  br label %if.end540

if.end540:                                        ; preds = %if.end539, %cond.end464, %lor.lhs.false451, %land.lhs.true436, %land.lhs.true433, %land.lhs.true431, %land.lhs.true429, %if.end420
  %370 = load i32, i32* @_rl_last_c_pos, align 4
  store i32 %370, i32* %o_cpos, align 4
  %371 = load i32, i32* %od, align 4
  %372 = load i8*, i8** %old.addr, align 4
  call void @_rl_move_cursor_relative(i32 %371, i8* %372)
  %373 = load i32, i32* %current_line.addr, align 4
  %cmp541 = icmp eq i32 %373, 0
  br i1 %cmp541, label %land.lhs.true543, label %if.end559

land.lhs.true543:                                 ; preds = %if.end540
  %374 = load i32, i32* %mb_cur_max, align 4
  %cmp544 = icmp sgt i32 %374, 1
  br i1 %cmp544, label %land.lhs.true546, label %if.end559

land.lhs.true546:                                 ; preds = %land.lhs.true543
  %375 = load i32, i32* @rl_byte_oriented, align 4
  %cmp547 = icmp eq i32 %375, 0
  br i1 %cmp547, label %land.lhs.true549, label %if.end559

land.lhs.true549:                                 ; preds = %land.lhs.true546
  %376 = load i32, i32* @_rl_last_c_pos, align 4
  %cmp550 = icmp sgt i32 %376, 0
  br i1 %cmp550, label %land.lhs.true555, label %lor.lhs.false552

lor.lhs.false552:                                 ; preds = %land.lhs.true549
  %377 = load i32, i32* %o_cpos, align 4
  %cmp553 = icmp sgt i32 %377, 0
  br i1 %cmp553, label %land.lhs.true555, label %if.end559

land.lhs.true555:                                 ; preds = %lor.lhs.false552, %land.lhs.true549
  %378 = load i32, i32* @_rl_last_c_pos, align 4
  %379 = load i32, i32* @prompt_physical_chars, align 4
  %cmp556 = icmp eq i32 %378, %379
  br i1 %cmp556, label %if.then558, label %if.end559

if.then558:                                       ; preds = %land.lhs.true555
  store i32 1, i32* @cpos_adjusted, align 4
  br label %if.end559

if.end559:                                        ; preds = %if.then558, %land.lhs.true555, %lor.lhs.false552, %land.lhs.true546, %land.lhs.true543, %if.end540
  %380 = load i8*, i8** %nls, align 4
  %381 = load i8*, i8** %nfd, align 4
  %sub.ptr.lhs.cast560 = ptrtoint i8* %380 to i32
  %sub.ptr.rhs.cast561 = ptrtoint i8* %381 to i32
  %sub.ptr.sub562 = sub i32 %sub.ptr.lhs.cast560, %sub.ptr.rhs.cast561
  %382 = load i8*, i8** %ols, align 4
  %383 = load i8*, i8** %ofd, align 4
  %sub.ptr.lhs.cast563 = ptrtoint i8* %382 to i32
  %sub.ptr.rhs.cast564 = ptrtoint i8* %383 to i32
  %sub.ptr.sub565 = sub i32 %sub.ptr.lhs.cast563, %sub.ptr.rhs.cast564
  %sub566 = sub nsw i32 %sub.ptr.sub562, %sub.ptr.sub565
  store i32 %sub566, i32* %lendiff, align 4
  %384 = load i32, i32* %mb_cur_max, align 4
  %cmp567 = icmp sgt i32 %384, 1
  br i1 %cmp567, label %land.lhs.true569, label %if.else588

land.lhs.true569:                                 ; preds = %if.end559
  %385 = load i32, i32* @rl_byte_oriented, align 4
  %cmp570 = icmp eq i32 %385, 0
  br i1 %cmp570, label %if.then572, label %if.else588

if.then572:                                       ; preds = %land.lhs.true569
  %386 = load i8*, i8** %new.addr, align 4
  %387 = load i8*, i8** %nfd, align 4
  %388 = load i8*, i8** %new.addr, align 4
  %sub.ptr.lhs.cast573 = ptrtoint i8* %387 to i32
  %sub.ptr.rhs.cast574 = ptrtoint i8* %388 to i32
  %sub.ptr.sub575 = sub i32 %sub.ptr.lhs.cast573, %sub.ptr.rhs.cast574
  %389 = load i8*, i8** %nls, align 4
  %390 = load i8*, i8** %new.addr, align 4
  %sub.ptr.lhs.cast576 = ptrtoint i8* %389 to i32
  %sub.ptr.rhs.cast577 = ptrtoint i8* %390 to i32
  %sub.ptr.sub578 = sub i32 %sub.ptr.lhs.cast576, %sub.ptr.rhs.cast577
  %call579 = call i32 @_rl_col_width(i8* %386, i32 %sub.ptr.sub575, i32 %sub.ptr.sub578, i32 1)
  %391 = load i8*, i8** %old.addr, align 4
  %392 = load i8*, i8** %ofd, align 4
  %393 = load i8*, i8** %old.addr, align 4
  %sub.ptr.lhs.cast580 = ptrtoint i8* %392 to i32
  %sub.ptr.rhs.cast581 = ptrtoint i8* %393 to i32
  %sub.ptr.sub582 = sub i32 %sub.ptr.lhs.cast580, %sub.ptr.rhs.cast581
  %394 = load i8*, i8** %ols, align 4
  %395 = load i8*, i8** %old.addr, align 4
  %sub.ptr.lhs.cast583 = ptrtoint i8* %394 to i32
  %sub.ptr.rhs.cast584 = ptrtoint i8* %395 to i32
  %sub.ptr.sub585 = sub i32 %sub.ptr.lhs.cast583, %sub.ptr.rhs.cast584
  %call586 = call i32 @_rl_col_width(i8* %391, i32 %sub.ptr.sub582, i32 %sub.ptr.sub585, i32 1)
  %sub587 = sub nsw i32 %call579, %call586
  store i32 %sub587, i32* %col_lendiff, align 4
  br label %if.end589

if.else588:                                       ; preds = %land.lhs.true569, %if.end559
  %396 = load i32, i32* %lendiff, align 4
  store i32 %396, i32* %col_lendiff, align 4
  br label %if.end589

if.end589:                                        ; preds = %if.else588, %if.then572
  %397 = load i32, i32* %current_line.addr, align 4
  %cmp590 = icmp eq i32 %397, 0
  br i1 %cmp590, label %land.lhs.true592, label %if.end610

land.lhs.true592:                                 ; preds = %if.end589
  %398 = load i32, i32* %current_invis_chars, align 4
  %399 = load i32, i32* @visible_wrap_offset, align 4
  %cmp593 = icmp ne i32 %398, %399
  br i1 %cmp593, label %if.then595, label %if.end610

if.then595:                                       ; preds = %land.lhs.true592
  %400 = load i32, i32* %mb_cur_max, align 4
  %cmp596 = icmp sgt i32 %400, 1
  br i1 %cmp596, label %land.lhs.true598, label %if.else606

land.lhs.true598:                                 ; preds = %if.then595
  %401 = load i32, i32* @rl_byte_oriented, align 4
  %cmp599 = icmp eq i32 %401, 0
  br i1 %cmp599, label %if.then601, label %if.else606

if.then601:                                       ; preds = %land.lhs.true598
  %402 = load i32, i32* @visible_wrap_offset, align 4
  %403 = load i32, i32* %current_invis_chars, align 4
  %sub602 = sub nsw i32 %402, %403
  %404 = load i32, i32* %lendiff, align 4
  %add603 = add nsw i32 %404, %sub602
  store i32 %add603, i32* %lendiff, align 4
  %405 = load i32, i32* @visible_wrap_offset, align 4
  %406 = load i32, i32* %current_invis_chars, align 4
  %sub604 = sub nsw i32 %405, %406
  %407 = load i32, i32* %col_lendiff, align 4
  %add605 = add nsw i32 %407, %sub604
  store i32 %add605, i32* %col_lendiff, align 4
  br label %if.end609

if.else606:                                       ; preds = %land.lhs.true598, %if.then595
  %408 = load i32, i32* @visible_wrap_offset, align 4
  %409 = load i32, i32* %current_invis_chars, align 4
  %sub607 = sub nsw i32 %408, %409
  %410 = load i32, i32* %lendiff, align 4
  %add608 = add nsw i32 %410, %sub607
  store i32 %add608, i32* %lendiff, align 4
  %411 = load i32, i32* %lendiff, align 4
  store i32 %411, i32* %col_lendiff, align 4
  br label %if.end609

if.end609:                                        ; preds = %if.else606, %if.then601
  br label %if.end610

if.end610:                                        ; preds = %if.end609, %land.lhs.true592, %if.end589
  %412 = load i8*, i8** %ne, align 4
  %413 = load i8*, i8** %nfd, align 4
  %sub.ptr.lhs.cast611 = ptrtoint i8* %412 to i32
  %sub.ptr.rhs.cast612 = ptrtoint i8* %413 to i32
  %sub.ptr.sub613 = sub i32 %sub.ptr.lhs.cast611, %sub.ptr.rhs.cast612
  store i32 %sub.ptr.sub613, i32* %temp, align 4
  %414 = load i32, i32* %mb_cur_max, align 4
  %cmp614 = icmp sgt i32 %414, 1
  br i1 %cmp614, label %land.lhs.true616, label %if.else627

land.lhs.true616:                                 ; preds = %if.end610
  %415 = load i32, i32* @rl_byte_oriented, align 4
  %cmp617 = icmp eq i32 %415, 0
  br i1 %cmp617, label %if.then619, label %if.else627

if.then619:                                       ; preds = %land.lhs.true616
  %416 = load i8*, i8** %new.addr, align 4
  %417 = load i8*, i8** %nfd, align 4
  %418 = load i8*, i8** %new.addr, align 4
  %sub.ptr.lhs.cast620 = ptrtoint i8* %417 to i32
  %sub.ptr.rhs.cast621 = ptrtoint i8* %418 to i32
  %sub.ptr.sub622 = sub i32 %sub.ptr.lhs.cast620, %sub.ptr.rhs.cast621
  %419 = load i8*, i8** %ne, align 4
  %420 = load i8*, i8** %new.addr, align 4
  %sub.ptr.lhs.cast623 = ptrtoint i8* %419 to i32
  %sub.ptr.rhs.cast624 = ptrtoint i8* %420 to i32
  %sub.ptr.sub625 = sub i32 %sub.ptr.lhs.cast623, %sub.ptr.rhs.cast624
  %call626 = call i32 @_rl_col_width(i8* %416, i32 %sub.ptr.sub622, i32 %sub.ptr.sub625, i32 1)
  store i32 %call626, i32* %col_temp, align 4
  br label %if.end628

if.else627:                                       ; preds = %land.lhs.true616, %if.end610
  %421 = load i32, i32* %temp, align 4
  store i32 %421, i32* %col_temp, align 4
  br label %if.end628

if.end628:                                        ; preds = %if.else627, %if.then619
  %422 = load i8*, i8** %nls, align 4
  %423 = load i8*, i8** %nfd, align 4
  %sub.ptr.lhs.cast629 = ptrtoint i8* %422 to i32
  %sub.ptr.rhs.cast630 = ptrtoint i8* %423 to i32
  %sub.ptr.sub631 = sub i32 %sub.ptr.lhs.cast629, %sub.ptr.rhs.cast630
  store i32 %sub.ptr.sub631, i32* %bytes_to_insert, align 4
  %424 = load i32, i32* %col_lendiff, align 4
  %cmp632 = icmp sgt i32 %424, 0
  br i1 %cmp632, label %if.then634, label %if.else824

if.then634:                                       ; preds = %if.end628
  %425 = load i32, i32* %current_line.addr, align 4
  %426 = load i32, i32* @_rl_vis_botlin, align 4
  %cmp635 = icmp sge i32 %425, %426
  br i1 %cmp635, label %land.rhs637, label %land.end640

land.rhs637:                                      ; preds = %if.then634
  %427 = load i32, i32* %inv_botlin.addr, align 4
  %428 = load i32, i32* @_rl_vis_botlin, align 4
  %cmp638 = icmp sgt i32 %427, %428
  br label %land.end640

land.end640:                                      ; preds = %land.rhs637, %if.then634
  %429 = phi i1 [ false, %if.then634 ], [ %cmp638, %land.rhs637 ]
  %land.ext = zext i1 %429 to i32
  store i32 %land.ext, i32* %gl, align 4
  %430 = load i32, i32* %lendiff, align 4
  %cmp641 = icmp slt i32 %430, 0
  br i1 %cmp641, label %if.then643, label %if.else660

if.then643:                                       ; preds = %land.end640
  %431 = load i8*, i8** %nfd, align 4
  %432 = load i32, i32* %temp, align 4
  call void @_rl_output_some_chars(i8* %431, i32 %432)
  %433 = load i32, i32* %col_temp, align 4
  %434 = load i32, i32* @_rl_last_c_pos, align 4
  %add644 = add nsw i32 %434, %433
  store i32 %add644, i32* @_rl_last_c_pos, align 4
  %435 = load i32, i32* %current_line.addr, align 4
  %cmp645 = icmp eq i32 %435, 0
  br i1 %cmp645, label %land.lhs.true647, label %if.end659

land.lhs.true647:                                 ; preds = %if.then643
  %436 = load i32, i32* @displaying_prompt_first_line, align 4
  %tobool648 = icmp ne i32 %436, 0
  br i1 %tobool648, label %land.lhs.true649, label %if.end659

land.lhs.true649:                                 ; preds = %land.lhs.true647
  %437 = load i32, i32* @wrap_offset, align 4
  %tobool650 = icmp ne i32 %437, 0
  br i1 %tobool650, label %land.lhs.true651, label %if.end659

land.lhs.true651:                                 ; preds = %land.lhs.true649
  %438 = load i8*, i8** %nfd, align 4
  %439 = load i8*, i8** %new.addr, align 4
  %sub.ptr.lhs.cast652 = ptrtoint i8* %438 to i32
  %sub.ptr.rhs.cast653 = ptrtoint i8* %439 to i32
  %sub.ptr.sub654 = sub i32 %sub.ptr.lhs.cast652, %sub.ptr.rhs.cast653
  %440 = load i32, i32* @prompt_last_invisible, align 4
  %cmp655 = icmp sle i32 %sub.ptr.sub654, %440
  br i1 %cmp655, label %if.then657, label %if.end659

if.then657:                                       ; preds = %land.lhs.true651
  %441 = load i32, i32* @wrap_offset, align 4
  %442 = load i32, i32* @_rl_last_c_pos, align 4
  %sub658 = sub nsw i32 %442, %441
  store i32 %sub658, i32* @_rl_last_c_pos, align 4
  store i32 1, i32* @cpos_adjusted, align 4
  br label %if.end659

if.end659:                                        ; preds = %if.then657, %land.lhs.true651, %land.lhs.true649, %land.lhs.true647, %if.then643
  br label %if.end982

if.else660:                                       ; preds = %land.end640
  %443 = load i32, i32* @_rl_terminal_can_insert, align 4
  %tobool661 = icmp ne i32 %443, 0
  br i1 %tobool661, label %land.lhs.true662, label %if.else792

land.lhs.true662:                                 ; preds = %if.else660
  %444 = load i32, i32* %col_temp, align 4
  %mul = mul nsw i32 2, %444
  %445 = load i32, i32* %col_lendiff, align 4
  %cmp663 = icmp sge i32 %mul, %445
  br i1 %cmp663, label %land.lhs.true667, label %lor.lhs.false665

lor.lhs.false665:                                 ; preds = %land.lhs.true662
  %446 = load i8*, i8** @_rl_term_IC, align 4
  %tobool666 = icmp ne i8* %446, null
  br i1 %tobool666, label %land.lhs.true667, label %if.else792

land.lhs.true667:                                 ; preds = %lor.lhs.false665, %land.lhs.true662
  %447 = load i32, i32* @_rl_term_autowrap, align 4
  %tobool668 = icmp ne i32 %447, 0
  br i1 %tobool668, label %lor.lhs.false669, label %if.then671

lor.lhs.false669:                                 ; preds = %land.lhs.true667
  %448 = load i32, i32* %gl, align 4
  %tobool670 = icmp ne i32 %448, 0
  br i1 %tobool670, label %if.else792, label %if.then671

if.then671:                                       ; preds = %lor.lhs.false669, %land.lhs.true667
  %449 = load i8*, i8** %ols, align 4
  %450 = load i8, i8* %449, align 1
  %conv672 = sext i8 %450 to i32
  %tobool673 = icmp ne i32 %conv672, 0
  br i1 %tobool673, label %land.lhs.true674, label %if.else728

land.lhs.true674:                                 ; preds = %if.then671
  %451 = load i32, i32* @_rl_horizontal_scroll_mode, align 4
  %tobool675 = icmp ne i32 %451, 0
  br i1 %tobool675, label %land.lhs.true676, label %land.end685

land.lhs.true676:                                 ; preds = %land.lhs.true674
  %452 = load i32, i32* @_rl_last_c_pos, align 4
  %cmp677 = icmp eq i32 %452, 0
  br i1 %cmp677, label %land.lhs.true679, label %land.end685

land.lhs.true679:                                 ; preds = %land.lhs.true676
  %453 = load i32, i32* %lendiff, align 4
  %454 = load i32, i32* @prompt_visible_length, align 4
  %cmp680 = icmp sgt i32 %453, %454
  br i1 %cmp680, label %land.rhs682, label %land.end685

land.rhs682:                                      ; preds = %land.lhs.true679
  %455 = load i32, i32* %current_invis_chars, align 4
  %cmp683 = icmp sgt i32 %455, 0
  br label %land.end685

land.end685:                                      ; preds = %land.rhs682, %land.lhs.true679, %land.lhs.true676, %land.lhs.true674
  %456 = phi i1 [ false, %land.lhs.true679 ], [ false, %land.lhs.true676 ], [ false, %land.lhs.true674 ], [ %cmp683, %land.rhs682 ]
  %land.ext686 = zext i1 %456 to i32
  %cmp687 = icmp eq i32 %land.ext686, 0
  br i1 %cmp687, label %land.lhs.true689, label %if.else728

land.lhs.true689:                                 ; preds = %land.end685
  %457 = load i32, i32* %mb_cur_max, align 4
  %cmp690 = icmp sgt i32 %457, 1
  br i1 %cmp690, label %land.lhs.true692, label %land.end709

land.lhs.true692:                                 ; preds = %land.lhs.true689
  %458 = load i32, i32* @rl_byte_oriented, align 4
  %cmp693 = icmp eq i32 %458, 0
  br i1 %cmp693, label %land.lhs.true695, label %land.end709

land.lhs.true695:                                 ; preds = %land.lhs.true692
  %459 = load i32, i32* %current_line.addr, align 4
  %cmp696 = icmp eq i32 %459, 0
  br i1 %cmp696, label %land.lhs.true698, label %land.end709

land.lhs.true698:                                 ; preds = %land.lhs.true695
  %460 = load i32, i32* @wrap_offset, align 4
  %tobool699 = icmp ne i32 %460, 0
  br i1 %tobool699, label %land.lhs.true700, label %land.end709

land.lhs.true700:                                 ; preds = %land.lhs.true698
  %461 = load i8*, i8** %nfd, align 4
  %462 = load i8*, i8** %new.addr, align 4
  %sub.ptr.lhs.cast701 = ptrtoint i8* %461 to i32
  %sub.ptr.rhs.cast702 = ptrtoint i8* %462 to i32
  %sub.ptr.sub703 = sub i32 %sub.ptr.lhs.cast701, %sub.ptr.rhs.cast702
  %463 = load i32, i32* @prompt_last_invisible, align 4
  %cmp704 = icmp sle i32 %sub.ptr.sub703, %463
  br i1 %cmp704, label %land.rhs706, label %land.end709

land.rhs706:                                      ; preds = %land.lhs.true700
  %464 = load i32, i32* %col_lendiff, align 4
  %465 = load i32, i32* @prompt_visible_length, align 4
  %cmp707 = icmp slt i32 %464, %465
  br label %land.end709

land.end709:                                      ; preds = %land.rhs706, %land.lhs.true700, %land.lhs.true698, %land.lhs.true695, %land.lhs.true692, %land.lhs.true689
  %466 = phi i1 [ false, %land.lhs.true700 ], [ false, %land.lhs.true698 ], [ false, %land.lhs.true695 ], [ false, %land.lhs.true692 ], [ false, %land.lhs.true689 ], [ %cmp707, %land.rhs706 ]
  %land.ext710 = zext i1 %466 to i32
  %cmp711 = icmp eq i32 %land.ext710, 0
  br i1 %cmp711, label %land.lhs.true713, label %if.else728

land.lhs.true713:                                 ; preds = %land.end709
  %467 = load i32, i32* @visible_wrap_offset, align 4
  %468 = load i32, i32* %current_invis_chars, align 4
  %cmp714 = icmp sge i32 %467, %468
  br i1 %cmp714, label %if.then716, label %if.else728

if.then716:                                       ; preds = %land.lhs.true713
  %469 = load i32, i32* %col_lendiff, align 4
  call void @open_some_spaces(i32 %469)
  %470 = load i8*, i8** %nfd, align 4
  %471 = load i32, i32* %bytes_to_insert, align 4
  call void @_rl_output_some_chars(i8* %470, i32 %471)
  %472 = load i32, i32* %mb_cur_max, align 4
  %cmp717 = icmp sgt i32 %472, 1
  br i1 %cmp717, label %land.lhs.true719, label %if.else725

land.lhs.true719:                                 ; preds = %if.then716
  %473 = load i32, i32* @rl_byte_oriented, align 4
  %cmp720 = icmp eq i32 %473, 0
  br i1 %cmp720, label %if.then722, label %if.else725

if.then722:                                       ; preds = %land.lhs.true719
  %474 = load i8*, i8** %nfd, align 4
  %475 = load i32, i32* %bytes_to_insert, align 4
  %call723 = call i32 @_rl_col_width(i8* %474, i32 0, i32 %475, i32 1)
  %476 = load i32, i32* @_rl_last_c_pos, align 4
  %add724 = add nsw i32 %476, %call723
  store i32 %add724, i32* @_rl_last_c_pos, align 4
  br label %if.end727

if.else725:                                       ; preds = %land.lhs.true719, %if.then716
  %477 = load i32, i32* %bytes_to_insert, align 4
  %478 = load i32, i32* @_rl_last_c_pos, align 4
  %add726 = add nsw i32 %478, %477
  store i32 %add726, i32* @_rl_last_c_pos, align 4
  br label %if.end727

if.end727:                                        ; preds = %if.else725, %if.then722
  br label %if.end766

if.else728:                                       ; preds = %land.lhs.true713, %land.end709, %land.end685, %if.then671
  %479 = load i32, i32* %mb_cur_max, align 4
  %cmp729 = icmp eq i32 %479, 1
  br i1 %cmp729, label %land.lhs.true734, label %lor.lhs.false731

lor.lhs.false731:                                 ; preds = %if.else728
  %480 = load i32, i32* @rl_byte_oriented, align 4
  %cmp732 = icmp ne i32 %480, 0
  br i1 %cmp732, label %land.lhs.true734, label %if.else743

land.lhs.true734:                                 ; preds = %lor.lhs.false731, %if.else728
  %481 = load i8*, i8** %ols, align 4
  %482 = load i8, i8* %481, align 1
  %conv735 = sext i8 %482 to i32
  %cmp736 = icmp eq i32 %conv735, 0
  br i1 %cmp736, label %land.lhs.true738, label %if.else743

land.lhs.true738:                                 ; preds = %land.lhs.true734
  %483 = load i32, i32* %lendiff, align 4
  %cmp739 = icmp sgt i32 %483, 0
  br i1 %cmp739, label %if.then741, label %if.else743

if.then741:                                       ; preds = %land.lhs.true738
  %484 = load i8*, i8** %nfd, align 4
  %485 = load i32, i32* %temp, align 4
  call void @_rl_output_some_chars(i8* %484, i32 %485)
  %486 = load i32, i32* %col_temp, align 4
  %487 = load i32, i32* @_rl_last_c_pos, align 4
  %add742 = add nsw i32 %487, %486
  store i32 %add742, i32* @_rl_last_c_pos, align 4
  br label %if.end982

if.else743:                                       ; preds = %land.lhs.true738, %land.lhs.true734, %lor.lhs.false731
  %488 = load i8*, i8** %nfd, align 4
  %489 = load i32, i32* %temp, align 4
  call void @_rl_output_some_chars(i8* %488, i32 %489)
  %490 = load i32, i32* %col_temp, align 4
  %491 = load i32, i32* @_rl_last_c_pos, align 4
  %add744 = add nsw i32 %491, %490
  store i32 %add744, i32* @_rl_last_c_pos, align 4
  %492 = load i32, i32* %mb_cur_max, align 4
  %cmp745 = icmp sgt i32 %492, 1
  br i1 %cmp745, label %land.lhs.true747, label %if.end765

land.lhs.true747:                                 ; preds = %if.else743
  %493 = load i32, i32* @rl_byte_oriented, align 4
  %cmp748 = icmp eq i32 %493, 0
  br i1 %cmp748, label %land.lhs.true750, label %if.end765

land.lhs.true750:                                 ; preds = %land.lhs.true747
  %494 = load i32, i32* %current_line.addr, align 4
  %cmp751 = icmp eq i32 %494, 0
  br i1 %cmp751, label %land.lhs.true753, label %if.end765

land.lhs.true753:                                 ; preds = %land.lhs.true750
  %495 = load i32, i32* @displaying_prompt_first_line, align 4
  %tobool754 = icmp ne i32 %495, 0
  br i1 %tobool754, label %land.lhs.true755, label %if.end765

land.lhs.true755:                                 ; preds = %land.lhs.true753
  %496 = load i32, i32* @wrap_offset, align 4
  %tobool756 = icmp ne i32 %496, 0
  br i1 %tobool756, label %land.lhs.true757, label %if.end765

land.lhs.true757:                                 ; preds = %land.lhs.true755
  %497 = load i8*, i8** %nfd, align 4
  %498 = load i8*, i8** %new.addr, align 4
  %sub.ptr.lhs.cast758 = ptrtoint i8* %497 to i32
  %sub.ptr.rhs.cast759 = ptrtoint i8* %498 to i32
  %sub.ptr.sub760 = sub i32 %sub.ptr.lhs.cast758, %sub.ptr.rhs.cast759
  %499 = load i32, i32* @prompt_last_invisible, align 4
  %cmp761 = icmp sle i32 %sub.ptr.sub760, %499
  br i1 %cmp761, label %if.then763, label %if.end765

if.then763:                                       ; preds = %land.lhs.true757
  %500 = load i32, i32* @wrap_offset, align 4
  %501 = load i32, i32* @_rl_last_c_pos, align 4
  %sub764 = sub nsw i32 %501, %500
  store i32 %sub764, i32* @_rl_last_c_pos, align 4
  store i32 1, i32* @cpos_adjusted, align 4
  br label %if.end765

if.end765:                                        ; preds = %if.then763, %land.lhs.true757, %land.lhs.true755, %land.lhs.true753, %land.lhs.true750, %land.lhs.true747, %if.else743
  br label %if.end982

if.end766:                                        ; preds = %if.end727
  %502 = load i32, i32* %bytes_to_insert, align 4
  %503 = load i32, i32* %lendiff, align 4
  %cmp767 = icmp sgt i32 %502, %503
  br i1 %cmp767, label %if.then769, label %if.end791

if.then769:                                       ; preds = %if.end766
  %504 = load i32, i32* %mb_cur_max, align 4
  %cmp770 = icmp sgt i32 %504, 1
  br i1 %cmp770, label %land.lhs.true772, label %if.end790

land.lhs.true772:                                 ; preds = %if.then769
  %505 = load i32, i32* @rl_byte_oriented, align 4
  %cmp773 = icmp eq i32 %505, 0
  br i1 %cmp773, label %land.lhs.true775, label %if.end790

land.lhs.true775:                                 ; preds = %land.lhs.true772
  %506 = load i32, i32* %current_line.addr, align 4
  %cmp776 = icmp eq i32 %506, 0
  br i1 %cmp776, label %land.lhs.true778, label %if.end790

land.lhs.true778:                                 ; preds = %land.lhs.true775
  %507 = load i32, i32* @displaying_prompt_first_line, align 4
  %tobool779 = icmp ne i32 %507, 0
  br i1 %tobool779, label %land.lhs.true780, label %if.end790

land.lhs.true780:                                 ; preds = %land.lhs.true778
  %508 = load i32, i32* @wrap_offset, align 4
  %tobool781 = icmp ne i32 %508, 0
  br i1 %tobool781, label %land.lhs.true782, label %if.end790

land.lhs.true782:                                 ; preds = %land.lhs.true780
  %509 = load i8*, i8** %nfd, align 4
  %510 = load i8*, i8** %new.addr, align 4
  %sub.ptr.lhs.cast783 = ptrtoint i8* %509 to i32
  %sub.ptr.rhs.cast784 = ptrtoint i8* %510 to i32
  %sub.ptr.sub785 = sub i32 %sub.ptr.lhs.cast783, %sub.ptr.rhs.cast784
  %511 = load i32, i32* @prompt_last_invisible, align 4
  %cmp786 = icmp sle i32 %sub.ptr.sub785, %511
  br i1 %cmp786, label %if.then788, label %if.end790

if.then788:                                       ; preds = %land.lhs.true782
  %512 = load i32, i32* @wrap_offset, align 4
  %513 = load i32, i32* @_rl_last_c_pos, align 4
  %sub789 = sub nsw i32 %513, %512
  store i32 %sub789, i32* @_rl_last_c_pos, align 4
  store i32 1, i32* @cpos_adjusted, align 4
  br label %if.end790

if.end790:                                        ; preds = %if.then788, %land.lhs.true782, %land.lhs.true780, %land.lhs.true778, %land.lhs.true775, %land.lhs.true772, %if.then769
  br label %if.end791

if.end791:                                        ; preds = %if.end790, %if.end766
  br label %if.end822

if.else792:                                       ; preds = %lor.lhs.false669, %lor.lhs.false665, %if.else660
  %514 = load i8*, i8** %nfd, align 4
  %515 = load i32, i32* %temp, align 4
  call void @_rl_output_some_chars(i8* %514, i32 %515)
  %516 = load i32, i32* %col_temp, align 4
  %517 = load i32, i32* @_rl_last_c_pos, align 4
  %add793 = add nsw i32 %517, %516
  store i32 %add793, i32* @_rl_last_c_pos, align 4
  %518 = load i32, i32* %mb_cur_max, align 4
  %cmp794 = icmp sgt i32 %518, 1
  br i1 %cmp794, label %land.lhs.true796, label %if.end821

land.lhs.true796:                                 ; preds = %if.else792
  %519 = load i32, i32* @rl_byte_oriented, align 4
  %cmp797 = icmp eq i32 %519, 0
  br i1 %cmp797, label %land.lhs.true799, label %if.end821

land.lhs.true799:                                 ; preds = %land.lhs.true796
  %520 = load i32, i32* %current_line.addr, align 4
  %521 = load i32, i32* @prompt_last_screen_line, align 4
  %cmp800 = icmp eq i32 %520, %521
  br i1 %cmp800, label %land.lhs.true802, label %if.end821

land.lhs.true802:                                 ; preds = %land.lhs.true799
  %522 = load i32, i32* @wrap_offset, align 4
  %tobool803 = icmp ne i32 %522, 0
  br i1 %tobool803, label %land.lhs.true804, label %if.end821

land.lhs.true804:                                 ; preds = %land.lhs.true802
  %523 = load i32, i32* @displaying_prompt_first_line, align 4
  %tobool805 = icmp ne i32 %523, 0
  br i1 %tobool805, label %land.lhs.true806, label %if.end821

land.lhs.true806:                                 ; preds = %land.lhs.true804
  %524 = load i32, i32* @wrap_offset, align 4
  %525 = load i32, i32* @prompt_invis_chars_first_line, align 4
  %cmp807 = icmp ne i32 %524, %525
  br i1 %cmp807, label %land.lhs.true809, label %if.end821

land.lhs.true809:                                 ; preds = %land.lhs.true806
  %526 = load i8*, i8** %nfd, align 4
  %527 = load i8*, i8** %new.addr, align 4
  %sub.ptr.lhs.cast810 = ptrtoint i8* %526 to i32
  %sub.ptr.rhs.cast811 = ptrtoint i8* %527 to i32
  %sub.ptr.sub812 = sub i32 %sub.ptr.lhs.cast810, %sub.ptr.rhs.cast811
  %528 = load i32, i32* @prompt_last_invisible, align 4
  %529 = load i32, i32* %current_line.addr, align 4
  %530 = load i32, i32* @_rl_screenwidth, align 4
  %mul813 = mul nsw i32 %529, %530
  %531 = load i32, i32* @prompt_invis_chars_first_line, align 4
  %add814 = add nsw i32 %mul813, %531
  %sub815 = sub nsw i32 %528, %add814
  %cmp816 = icmp slt i32 %sub.ptr.sub812, %sub815
  br i1 %cmp816, label %if.then818, label %if.end821

if.then818:                                       ; preds = %land.lhs.true809
  %532 = load i32, i32* @wrap_offset, align 4
  %533 = load i32, i32* @prompt_invis_chars_first_line, align 4
  %sub819 = sub nsw i32 %532, %533
  %534 = load i32, i32* @_rl_last_c_pos, align 4
  %sub820 = sub nsw i32 %534, %sub819
  store i32 %sub820, i32* @_rl_last_c_pos, align 4
  store i32 1, i32* @cpos_adjusted, align 4
  br label %if.end821

if.end821:                                        ; preds = %if.then818, %land.lhs.true809, %land.lhs.true806, %land.lhs.true804, %land.lhs.true802, %land.lhs.true799, %land.lhs.true796, %if.else792
  br label %if.end822

if.end822:                                        ; preds = %if.end821, %if.end791
  br label %if.end823

if.end823:                                        ; preds = %if.end822
  br label %if.end982

if.else824:                                       ; preds = %if.end628
  %535 = load i8*, i8** @_rl_term_dc, align 4
  %tobool825 = icmp ne i8* %535, null
  br i1 %tobool825, label %land.lhs.true826, label %if.else908

land.lhs.true826:                                 ; preds = %if.else824
  %536 = load i32, i32* %col_temp, align 4
  %mul827 = mul nsw i32 2, %536
  %537 = load i32, i32* %col_lendiff, align 4
  %sub828 = sub nsw i32 0, %537
  %cmp829 = icmp sge i32 %mul827, %sub828
  br i1 %cmp829, label %if.then831, label %if.else908

if.then831:                                       ; preds = %land.lhs.true826
  %538 = load i32, i32* @_rl_horizontal_scroll_mode, align 4
  %tobool832 = icmp ne i32 %538, 0
  br i1 %tobool832, label %land.lhs.true833, label %if.end843

land.lhs.true833:                                 ; preds = %if.then831
  %539 = load i32, i32* @_rl_last_c_pos, align 4
  %cmp834 = icmp eq i32 %539, 0
  br i1 %cmp834, label %land.lhs.true836, label %if.end843

land.lhs.true836:                                 ; preds = %land.lhs.true833
  %540 = load i32, i32* @displaying_prompt_first_line, align 4
  %tobool837 = icmp ne i32 %540, 0
  br i1 %tobool837, label %land.lhs.true838, label %if.end843

land.lhs.true838:                                 ; preds = %land.lhs.true836
  %541 = load i32, i32* %lendiff, align 4
  %sub839 = sub nsw i32 0, %541
  %542 = load i32, i32* @visible_wrap_offset, align 4
  %cmp840 = icmp eq i32 %sub839, %542
  br i1 %cmp840, label %if.then842, label %if.end843

if.then842:                                       ; preds = %land.lhs.true838
  store i32 0, i32* %col_lendiff, align 4
  br label %if.end843

if.end843:                                        ; preds = %if.then842, %land.lhs.true838, %land.lhs.true836, %land.lhs.true833, %if.then831
  %543 = load i32, i32* @_rl_horizontal_scroll_mode, align 4
  %tobool844 = icmp ne i32 %543, 0
  br i1 %tobool844, label %land.lhs.true845, label %if.end855

land.lhs.true845:                                 ; preds = %if.end843
  %544 = load i32, i32* @displaying_prompt_first_line, align 4
  %cmp846 = icmp eq i32 %544, 0
  br i1 %cmp846, label %land.lhs.true848, label %if.end855

land.lhs.true848:                                 ; preds = %land.lhs.true845
  %545 = load i32, i32* %col_lendiff, align 4
  %tobool849 = icmp ne i32 %545, 0
  br i1 %tobool849, label %land.lhs.true850, label %if.end855

land.lhs.true850:                                 ; preds = %land.lhs.true848
  %546 = load i32, i32* @_rl_last_c_pos, align 4
  %547 = load i32, i32* %col_lendiff, align 4
  %sub851 = sub nsw i32 0, %547
  %cmp852 = icmp slt i32 %546, %sub851
  br i1 %cmp852, label %if.then854, label %if.end855

if.then854:                                       ; preds = %land.lhs.true850
  store i32 0, i32* %col_lendiff, align 4
  br label %if.end855

if.end855:                                        ; preds = %if.then854, %land.lhs.true850, %land.lhs.true848, %land.lhs.true845, %if.end843
  %548 = load i32, i32* %col_lendiff, align 4
  %tobool856 = icmp ne i32 %548, 0
  br i1 %tobool856, label %if.then857, label %if.end859

if.then857:                                       ; preds = %if.end855
  %549 = load i32, i32* %col_lendiff, align 4
  %sub858 = sub nsw i32 0, %549
  call void @delete_chars(i32 %sub858)
  br label %if.end859

if.end859:                                        ; preds = %if.then857, %if.end855
  %550 = load i32, i32* %bytes_to_insert, align 4
  %cmp860 = icmp sgt i32 %550, 0
  br i1 %cmp860, label %if.then862, label %if.end907

if.then862:                                       ; preds = %if.end859
  %551 = load i8*, i8** %nfd, align 4
  %552 = load i32, i32* %bytes_to_insert, align 4
  call void @_rl_output_some_chars(i8* %551, i32 %552)
  %553 = load i32, i32* %mb_cur_max, align 4
  %cmp863 = icmp sgt i32 %553, 1
  br i1 %cmp863, label %land.lhs.true865, label %if.else889

land.lhs.true865:                                 ; preds = %if.then862
  %554 = load i32, i32* @rl_byte_oriented, align 4
  %cmp866 = icmp eq i32 %554, 0
  br i1 %cmp866, label %if.then868, label %if.else889

if.then868:                                       ; preds = %land.lhs.true865
  %555 = load i8*, i8** %nfd, align 4
  %556 = load i32, i32* %bytes_to_insert, align 4
  %call869 = call i32 @_rl_col_width(i8* %555, i32 0, i32 %556, i32 1)
  %557 = load i32, i32* @_rl_last_c_pos, align 4
  %add870 = add nsw i32 %557, %call869
  store i32 %add870, i32* @_rl_last_c_pos, align 4
  %558 = load i32, i32* %current_line.addr, align 4
  %cmp871 = icmp eq i32 %558, 0
  br i1 %cmp871, label %land.lhs.true873, label %if.end888

land.lhs.true873:                                 ; preds = %if.then868
  %559 = load i32, i32* @wrap_offset, align 4
  %tobool874 = icmp ne i32 %559, 0
  br i1 %tobool874, label %land.lhs.true875, label %if.end888

land.lhs.true875:                                 ; preds = %land.lhs.true873
  %560 = load i32, i32* @displaying_prompt_first_line, align 4
  %tobool876 = icmp ne i32 %560, 0
  br i1 %tobool876, label %land.lhs.true877, label %if.end888

land.lhs.true877:                                 ; preds = %land.lhs.true875
  %561 = load i32, i32* @_rl_last_c_pos, align 4
  %562 = load i32, i32* @wrap_offset, align 4
  %cmp878 = icmp sgt i32 %561, %562
  br i1 %cmp878, label %land.lhs.true880, label %if.end888

land.lhs.true880:                                 ; preds = %land.lhs.true877
  %563 = load i8*, i8** %nfd, align 4
  %564 = load i8*, i8** %new.addr, align 4
  %sub.ptr.lhs.cast881 = ptrtoint i8* %563 to i32
  %sub.ptr.rhs.cast882 = ptrtoint i8* %564 to i32
  %sub.ptr.sub883 = sub i32 %sub.ptr.lhs.cast881, %sub.ptr.rhs.cast882
  %565 = load i32, i32* @prompt_last_invisible, align 4
  %cmp884 = icmp sle i32 %sub.ptr.sub883, %565
  br i1 %cmp884, label %if.then886, label %if.end888

if.then886:                                       ; preds = %land.lhs.true880
  %566 = load i32, i32* @wrap_offset, align 4
  %567 = load i32, i32* @_rl_last_c_pos, align 4
  %sub887 = sub nsw i32 %567, %566
  store i32 %sub887, i32* @_rl_last_c_pos, align 4
  store i32 1, i32* @cpos_adjusted, align 4
  br label %if.end888

if.end888:                                        ; preds = %if.then886, %land.lhs.true880, %land.lhs.true877, %land.lhs.true875, %land.lhs.true873, %if.then868
  br label %if.end891

if.else889:                                       ; preds = %land.lhs.true865, %if.then862
  %568 = load i32, i32* %bytes_to_insert, align 4
  %569 = load i32, i32* @_rl_last_c_pos, align 4
  %add890 = add nsw i32 %569, %568
  store i32 %add890, i32* @_rl_last_c_pos, align 4
  br label %if.end891

if.end891:                                        ; preds = %if.else889, %if.end888
  %570 = load i32, i32* @_rl_horizontal_scroll_mode, align 4
  %tobool892 = icmp ne i32 %570, 0
  br i1 %tobool892, label %land.lhs.true893, label %if.end906

land.lhs.true893:                                 ; preds = %if.end891
  %571 = load i8*, i8** %oe, align 4
  %572 = load i8*, i8** %old.addr, align 4
  %sub.ptr.lhs.cast894 = ptrtoint i8* %571 to i32
  %sub.ptr.rhs.cast895 = ptrtoint i8* %572 to i32
  %sub.ptr.sub896 = sub i32 %sub.ptr.lhs.cast894, %sub.ptr.rhs.cast895
  %573 = load i8*, i8** %ne, align 4
  %574 = load i8*, i8** %new.addr, align 4
  %sub.ptr.lhs.cast897 = ptrtoint i8* %573 to i32
  %sub.ptr.rhs.cast898 = ptrtoint i8* %574 to i32
  %sub.ptr.sub899 = sub i32 %sub.ptr.lhs.cast897, %sub.ptr.rhs.cast898
  %cmp900 = icmp sgt i32 %sub.ptr.sub896, %sub.ptr.sub899
  br i1 %cmp900, label %if.then902, label %if.end906

if.then902:                                       ; preds = %land.lhs.true893
  %575 = load i8*, i8** %ne, align 4
  %576 = load i8*, i8** %new.addr, align 4
  %sub.ptr.lhs.cast903 = ptrtoint i8* %575 to i32
  %sub.ptr.rhs.cast904 = ptrtoint i8* %576 to i32
  %sub.ptr.sub905 = sub i32 %sub.ptr.lhs.cast903, %sub.ptr.rhs.cast904
  %577 = load i8*, i8** %new.addr, align 4
  call void @_rl_move_cursor_relative(i32 %sub.ptr.sub905, i8* %577)
  br label %clear_rest_of_line

if.end906:                                        ; preds = %land.lhs.true893, %if.end891
  br label %if.end907

if.end907:                                        ; preds = %if.end906, %if.end859
  br label %if.end981

if.else908:                                       ; preds = %land.lhs.true826, %if.else824
  %578 = load i32, i32* %temp, align 4
  %cmp909 = icmp sgt i32 %578, 0
  br i1 %cmp909, label %if.then911, label %if.end938

if.then911:                                       ; preds = %if.else908
  %579 = load i8*, i8** %nfd, align 4
  %580 = load i32, i32* %temp, align 4
  call void @_rl_output_some_chars(i8* %579, i32 %580)
  %581 = load i32, i32* %col_temp, align 4
  %582 = load i32, i32* @_rl_last_c_pos, align 4
  %add912 = add nsw i32 %582, %581
  store i32 %add912, i32* @_rl_last_c_pos, align 4
  %583 = load i32, i32* %mb_cur_max, align 4
  %cmp913 = icmp sgt i32 %583, 1
  br i1 %cmp913, label %land.lhs.true915, label %if.end937

land.lhs.true915:                                 ; preds = %if.then911
  %584 = load i32, i32* @rl_byte_oriented, align 4
  %cmp916 = icmp eq i32 %584, 0
  br i1 %cmp916, label %if.then918, label %if.end937

if.then918:                                       ; preds = %land.lhs.true915
  %585 = load i32, i32* %current_line.addr, align 4
  %cmp919 = icmp eq i32 %585, 0
  br i1 %cmp919, label %land.lhs.true921, label %if.end936

land.lhs.true921:                                 ; preds = %if.then918
  %586 = load i32, i32* @wrap_offset, align 4
  %tobool922 = icmp ne i32 %586, 0
  br i1 %tobool922, label %land.lhs.true923, label %if.end936

land.lhs.true923:                                 ; preds = %land.lhs.true921
  %587 = load i32, i32* @displaying_prompt_first_line, align 4
  %tobool924 = icmp ne i32 %587, 0
  br i1 %tobool924, label %land.lhs.true925, label %if.end936

land.lhs.true925:                                 ; preds = %land.lhs.true923
  %588 = load i32, i32* @_rl_last_c_pos, align 4
  %589 = load i32, i32* @wrap_offset, align 4
  %cmp926 = icmp sgt i32 %588, %589
  br i1 %cmp926, label %land.lhs.true928, label %if.end936

land.lhs.true928:                                 ; preds = %land.lhs.true925
  %590 = load i8*, i8** %nfd, align 4
  %591 = load i8*, i8** %new.addr, align 4
  %sub.ptr.lhs.cast929 = ptrtoint i8* %590 to i32
  %sub.ptr.rhs.cast930 = ptrtoint i8* %591 to i32
  %sub.ptr.sub931 = sub i32 %sub.ptr.lhs.cast929, %sub.ptr.rhs.cast930
  %592 = load i32, i32* @prompt_last_invisible, align 4
  %cmp932 = icmp sle i32 %sub.ptr.sub931, %592
  br i1 %cmp932, label %if.then934, label %if.end936

if.then934:                                       ; preds = %land.lhs.true928
  %593 = load i32, i32* @wrap_offset, align 4
  %594 = load i32, i32* @_rl_last_c_pos, align 4
  %sub935 = sub nsw i32 %594, %593
  store i32 %sub935, i32* @_rl_last_c_pos, align 4
  store i32 1, i32* @cpos_adjusted, align 4
  br label %if.end936

if.end936:                                        ; preds = %if.then934, %land.lhs.true928, %land.lhs.true925, %land.lhs.true923, %land.lhs.true921, %if.then918
  br label %if.end937

if.end937:                                        ; preds = %if.end936, %land.lhs.true915, %if.then911
  br label %if.end938

if.end938:                                        ; preds = %if.end937, %if.else908
  br label %clear_rest_of_line

clear_rest_of_line:                               ; preds = %if.end938, %if.then902, %if.then537
  %595 = load i8*, i8** %oe, align 4
  %596 = load i8*, i8** %old.addr, align 4
  %sub.ptr.lhs.cast939 = ptrtoint i8* %595 to i32
  %sub.ptr.rhs.cast940 = ptrtoint i8* %596 to i32
  %sub.ptr.sub941 = sub i32 %sub.ptr.lhs.cast939, %sub.ptr.rhs.cast940
  %597 = load i8*, i8** %ne, align 4
  %598 = load i8*, i8** %new.addr, align 4
  %sub.ptr.lhs.cast942 = ptrtoint i8* %597 to i32
  %sub.ptr.rhs.cast943 = ptrtoint i8* %598 to i32
  %sub.ptr.sub944 = sub i32 %sub.ptr.lhs.cast942, %sub.ptr.rhs.cast943
  %sub945 = sub nsw i32 %sub.ptr.sub941, %sub.ptr.sub944
  store i32 %sub945, i32* %lendiff, align 4
  %599 = load i32, i32* %mb_cur_max, align 4
  %cmp946 = icmp sgt i32 %599, 1
  br i1 %cmp946, label %land.lhs.true948, label %if.else961

land.lhs.true948:                                 ; preds = %clear_rest_of_line
  %600 = load i32, i32* @rl_byte_oriented, align 4
  %cmp949 = icmp eq i32 %600, 0
  br i1 %cmp949, label %if.then951, label %if.else961

if.then951:                                       ; preds = %land.lhs.true948
  %601 = load i8*, i8** %old.addr, align 4
  %602 = load i8*, i8** %oe, align 4
  %603 = load i8*, i8** %old.addr, align 4
  %sub.ptr.lhs.cast952 = ptrtoint i8* %602 to i32
  %sub.ptr.rhs.cast953 = ptrtoint i8* %603 to i32
  %sub.ptr.sub954 = sub i32 %sub.ptr.lhs.cast952, %sub.ptr.rhs.cast953
  %call955 = call i32 @_rl_col_width(i8* %601, i32 0, i32 %sub.ptr.sub954, i32 1)
  %604 = load i8*, i8** %new.addr, align 4
  %605 = load i8*, i8** %ne, align 4
  %606 = load i8*, i8** %new.addr, align 4
  %sub.ptr.lhs.cast956 = ptrtoint i8* %605 to i32
  %sub.ptr.rhs.cast957 = ptrtoint i8* %606 to i32
  %sub.ptr.sub958 = sub i32 %sub.ptr.lhs.cast956, %sub.ptr.rhs.cast957
  %call959 = call i32 @_rl_col_width(i8* %604, i32 0, i32 %sub.ptr.sub958, i32 1)
  %sub960 = sub nsw i32 %call955, %call959
  store i32 %sub960, i32* %col_lendiff, align 4
  br label %if.end962

if.else961:                                       ; preds = %land.lhs.true948, %clear_rest_of_line
  %607 = load i32, i32* %lendiff, align 4
  store i32 %607, i32* %col_lendiff, align 4
  br label %if.end962

if.end962:                                        ; preds = %if.else961, %if.then951
  %608 = load i32, i32* %col_lendiff, align 4
  %tobool963 = icmp ne i32 %608, 0
  br i1 %tobool963, label %land.lhs.true964, label %if.end980

land.lhs.true964:                                 ; preds = %if.end962
  %609 = load i32, i32* %mb_cur_max, align 4
  %cmp965 = icmp eq i32 %609, 1
  br i1 %cmp965, label %if.then972, label %lor.lhs.false967

lor.lhs.false967:                                 ; preds = %land.lhs.true964
  %610 = load i32, i32* @rl_byte_oriented, align 4
  %tobool968 = icmp ne i32 %610, 0
  br i1 %tobool968, label %if.then972, label %lor.lhs.false969

lor.lhs.false969:                                 ; preds = %lor.lhs.false967
  %611 = load i32, i32* @_rl_last_c_pos, align 4
  %612 = load i32, i32* @_rl_screenwidth, align 4
  %cmp970 = icmp slt i32 %611, %612
  br i1 %cmp970, label %if.then972, label %if.end980

if.then972:                                       ; preds = %lor.lhs.false969, %lor.lhs.false967, %land.lhs.true964
  %613 = load i32, i32* @_rl_term_autowrap, align 4
  %tobool973 = icmp ne i32 %613, 0
  br i1 %tobool973, label %land.lhs.true974, label %if.else978

land.lhs.true974:                                 ; preds = %if.then972
  %614 = load i32, i32* %current_line.addr, align 4
  %615 = load i32, i32* %inv_botlin.addr, align 4
  %cmp975 = icmp slt i32 %614, %615
  br i1 %cmp975, label %if.then977, label %if.else978

if.then977:                                       ; preds = %land.lhs.true974
  %616 = load i32, i32* %col_lendiff, align 4
  call void @space_to_eol(i32 %616)
  br label %if.end979

if.else978:                                       ; preds = %land.lhs.true974, %if.then972
  %617 = load i32, i32* %col_lendiff, align 4
  call void @_rl_clear_to_eol(i32 %617)
  br label %if.end979

if.end979:                                        ; preds = %if.else978, %if.then977
  br label %if.end980

if.end980:                                        ; preds = %if.end979, %lor.lhs.false969, %if.end962
  br label %if.end981

if.end981:                                        ; preds = %if.end980, %if.end907
  br label %if.end982

if.end982:                                        ; preds = %if.then237, %if.then505, %if.else538, %if.end659, %if.then741, %if.end765, %if.end981, %if.end823
  ret void
}

; Function Attrs: noinline nounwind
define void @_rl_clear_to_eol(i32 %count) #0 {
entry:
  %count.addr = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  %0 = load i8*, i8** @_rl_term_clreol, align 4
  %tobool = icmp ne i8* %0, null
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** @_rl_term_clreol, align 4
  %call = call i32 bitcast (i32 (...)* @tputs to i32 (i8*, i32, i32 (i32)*)*)(i8* %1, i32 1, i32 (i32)* @_rl_output_character_function)
  br label %if.end3

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %count.addr, align 4
  %tobool1 = icmp ne i32 %2, 0
  br i1 %tobool1, label %if.then2, label %if.end

if.then2:                                         ; preds = %if.else
  %3 = load i32, i32* %count.addr, align 4
  call void @space_to_eol(i32 %3)
  br label %if.end

if.end:                                           ; preds = %if.then2, %if.else
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  ret void
}

; Function Attrs: noinline nounwind
define void @_rl_move_vert(i32 %to) #0 {
entry:
  %to.addr = alloca i32, align 4
  %delta = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 %to, i32* %to.addr, align 4
  %0 = load i32, i32* @_rl_last_v_pos, align 4
  %1 = load i32, i32* %to.addr, align 4
  %cmp = icmp eq i32 %0, %1
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %2 = load i32, i32* %to.addr, align 4
  %3 = load i32, i32* @_rl_screenheight, align 4
  %cmp1 = icmp sgt i32 %2, %3
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %4 = load i32, i32* %to.addr, align 4
  %5 = load i32, i32* @_rl_last_v_pos, align 4
  %sub = sub nsw i32 %4, %5
  store i32 %sub, i32* %delta, align 4
  %cmp2 = icmp sgt i32 %sub, 0
  br i1 %cmp2, label %if.then3, label %if.else

if.then3:                                         ; preds = %if.end
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then3
  %6 = load i32, i32* %i, align 4
  %7 = load i32, i32* %delta, align 4
  %cmp4 = icmp slt i32 %6, %7
  br i1 %cmp4, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @rl_outstream, align 4
  %call = call i32 @putc(i32 10, %struct._IO_FILE* %8)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4
  %inc = add nsw i32 %9, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %10 = load i8*, i8** @_rl_term_cr, align 4
  %call5 = call i32 bitcast (i32 (...)* @tputs to i32 (i8*, i32, i32 (i32)*)*)(i8* %10, i32 1, i32 (i32)* @_rl_output_character_function)
  store i32 0, i32* @_rl_last_c_pos, align 4
  br label %if.end18

if.else:                                          ; preds = %if.end
  %11 = load i8*, i8** @_rl_term_up, align 4
  %tobool = icmp ne i8* %11, null
  br i1 %tobool, label %land.lhs.true, label %if.end17

land.lhs.true:                                    ; preds = %if.else
  %12 = load i8*, i8** @_rl_term_up, align 4
  %13 = load i8, i8* %12, align 1
  %conv = sext i8 %13 to i32
  %tobool6 = icmp ne i32 %conv, 0
  br i1 %tobool6, label %if.then7, label %if.end17

if.then7:                                         ; preds = %land.lhs.true
  store i32 0, i32* %i, align 4
  br label %for.cond8

for.cond8:                                        ; preds = %for.inc14, %if.then7
  %14 = load i32, i32* %i, align 4
  %15 = load i32, i32* %delta, align 4
  %sub9 = sub nsw i32 0, %15
  %cmp10 = icmp slt i32 %14, %sub9
  br i1 %cmp10, label %for.body12, label %for.end16

for.body12:                                       ; preds = %for.cond8
  %16 = load i8*, i8** @_rl_term_up, align 4
  %call13 = call i32 bitcast (i32 (...)* @tputs to i32 (i8*, i32, i32 (i32)*)*)(i8* %16, i32 1, i32 (i32)* @_rl_output_character_function)
  br label %for.inc14

for.inc14:                                        ; preds = %for.body12
  %17 = load i32, i32* %i, align 4
  %inc15 = add nsw i32 %17, 1
  store i32 %inc15, i32* %i, align 4
  br label %for.cond8

for.end16:                                        ; preds = %for.cond8
  br label %if.end17

if.end17:                                         ; preds = %for.end16, %land.lhs.true, %if.else
  br label %if.end18

if.end18:                                         ; preds = %if.end17, %for.end
  %18 = load i32, i32* %to.addr, align 4
  store i32 %18, i32* @_rl_last_v_pos, align 4
  br label %return

return:                                           ; preds = %if.end18, %if.then
  ret void
}

; Function Attrs: noinline nounwind
define void @_rl_move_cursor_relative(i32 %new, i8* %data) #0 {
entry:
  %new.addr = alloca i32, align 4
  %data.addr = alloca i8*, align 4
  %i = alloca i32, align 4
  %woff = alloca i32, align 4
  %cpos = alloca i32, align 4
  %dpos = alloca i32, align 4
  %adjust = alloca i32, align 4
  %in_invisline = alloca i32, align 4
  %mb_cur_max = alloca i32, align 4
  store i32 %new, i32* %new.addr, align 4
  store i8* %data, i8** %data.addr, align 4
  %call = call i32 @__ctype_get_mb_cur_max()
  store i32 %call, i32* %mb_cur_max, align 4
  %0 = load i32, i32* @_rl_last_v_pos, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %cond.true, label %cond.false7

cond.true:                                        ; preds = %entry
  %1 = load i32, i32* @wrap_offset, align 4
  %tobool = icmp ne i32 %1, 0
  br i1 %tobool, label %cond.true1, label %cond.false4

cond.true1:                                       ; preds = %cond.true
  %2 = load i32, i32* @prompt_physical_chars, align 4
  %3 = load i32, i32* @_rl_screenwidth, align 4
  %cmp2 = icmp sgt i32 %2, %3
  br i1 %cmp2, label %cond.true3, label %cond.false

cond.true3:                                       ; preds = %cond.true1
  %4 = load i32, i32* @prompt_invis_chars_first_line, align 4
  br label %cond.end

cond.false:                                       ; preds = %cond.true1
  %5 = load i32, i32* @wrap_offset, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true3
  %cond = phi i32 [ %4, %cond.true3 ], [ %5, %cond.false ]
  br label %cond.end5

cond.false4:                                      ; preds = %cond.true
  br label %cond.end5

cond.end5:                                        ; preds = %cond.false4, %cond.end
  %cond6 = phi i32 [ %cond, %cond.end ], [ 0, %cond.false4 ]
  br label %cond.end13

cond.false7:                                      ; preds = %entry
  %6 = load i32, i32* @_rl_last_v_pos, align 4
  %7 = load i32, i32* @prompt_last_screen_line, align 4
  %cmp8 = icmp eq i32 %6, %7
  br i1 %cmp8, label %cond.true9, label %cond.false10

cond.true9:                                       ; preds = %cond.false7
  %8 = load i32, i32* @wrap_offset, align 4
  %9 = load i32, i32* @prompt_invis_chars_first_line, align 4
  %sub = sub nsw i32 %8, %9
  br label %cond.end11

cond.false10:                                     ; preds = %cond.false7
  br label %cond.end11

cond.end11:                                       ; preds = %cond.false10, %cond.true9
  %cond12 = phi i32 [ %sub, %cond.true9 ], [ 0, %cond.false10 ]
  br label %cond.end13

cond.end13:                                       ; preds = %cond.end11, %cond.end5
  %cond14 = phi i32 [ %cond6, %cond.end5 ], [ %cond12, %cond.end11 ]
  store i32 %cond14, i32* %woff, align 4
  %10 = load i32, i32* @_rl_last_c_pos, align 4
  store i32 %10, i32* %cpos, align 4
  %11 = load i32, i32* %cpos, align 4
  %cmp15 = icmp eq i32 %11, 0
  br i1 %cmp15, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %cond.end13
  %12 = load i32, i32* %cpos, align 4
  %13 = load i32, i32* %new.addr, align 4
  %cmp16 = icmp eq i32 %12, %13
  br i1 %cmp16, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  br label %return

if.end:                                           ; preds = %land.lhs.true, %cond.end13
  %14 = load i32, i32* %mb_cur_max, align 4
  %cmp17 = icmp sgt i32 %14, 1
  br i1 %cmp17, label %land.lhs.true18, label %if.else71

land.lhs.true18:                                  ; preds = %if.end
  %15 = load i32, i32* @rl_byte_oriented, align 4
  %cmp19 = icmp eq i32 %15, 0
  br i1 %cmp19, label %if.then20, label %if.else71

if.then20:                                        ; preds = %land.lhs.true18
  store i32 1, i32* %adjust, align 4
  %16 = load i32, i32* %new.addr, align 4
  %17 = load i32, i32* @local_prompt_len, align 4
  %cmp21 = icmp eq i32 %16, %17
  br i1 %cmp21, label %land.lhs.true22, label %if.else

land.lhs.true22:                                  ; preds = %if.then20
  %18 = load i8*, i8** %data.addr, align 4
  %19 = load i8*, i8** @local_prompt, align 4
  %20 = load i32, i32* %new.addr, align 4
  %call23 = call i32 @memcmp(i8* %18, i8* %19, i32 %20)
  %cmp24 = icmp eq i32 %call23, 0
  br i1 %cmp24, label %if.then25, label %if.else

if.then25:                                        ; preds = %land.lhs.true22
  %21 = load i32, i32* @prompt_physical_chars, align 4
  store i32 %21, i32* %dpos, align 4
  store i32 1, i32* @cpos_adjusted, align 4
  store i32 0, i32* %adjust, align 4
  br label %if.end37

if.else:                                          ; preds = %land.lhs.true22, %if.then20
  %22 = load i32, i32* %new.addr, align 4
  %23 = load i32, i32* @local_prompt_len, align 4
  %cmp26 = icmp sgt i32 %22, %23
  br i1 %cmp26, label %land.lhs.true27, label %if.else34

land.lhs.true27:                                  ; preds = %if.else
  %24 = load i8*, i8** @local_prompt, align 4
  %tobool28 = icmp ne i8* %24, null
  br i1 %tobool28, label %land.lhs.true29, label %if.else34

land.lhs.true29:                                  ; preds = %land.lhs.true27
  %25 = load i8*, i8** %data.addr, align 4
  %26 = load i8*, i8** @local_prompt, align 4
  %27 = load i32, i32* @local_prompt_len, align 4
  %call30 = call i32 @memcmp(i8* %25, i8* %26, i32 %27)
  %cmp31 = icmp eq i32 %call30, 0
  br i1 %cmp31, label %if.then32, label %if.else34

if.then32:                                        ; preds = %land.lhs.true29
  %28 = load i32, i32* @prompt_physical_chars, align 4
  %29 = load i8*, i8** %data.addr, align 4
  %30 = load i32, i32* @local_prompt_len, align 4
  %31 = load i32, i32* %new.addr, align 4
  %call33 = call i32 @_rl_col_width(i8* %29, i32 %30, i32 %31, i32 1)
  %add = add nsw i32 %28, %call33
  store i32 %add, i32* %dpos, align 4
  store i32 1, i32* @cpos_adjusted, align 4
  store i32 0, i32* %adjust, align 4
  br label %if.end36

if.else34:                                        ; preds = %land.lhs.true29, %land.lhs.true27, %if.else
  %32 = load i8*, i8** %data.addr, align 4
  %33 = load i32, i32* %new.addr, align 4
  %call35 = call i32 @_rl_col_width(i8* %32, i32 0, i32 %33, i32 1)
  store i32 %call35, i32* %dpos, align 4
  br label %if.end36

if.end36:                                         ; preds = %if.else34, %if.then32
  br label %if.end37

if.end37:                                         ; preds = %if.end36, %if.then25
  %34 = load i32, i32* @displaying_prompt_first_line, align 4
  %cmp38 = icmp eq i32 %34, 0
  br i1 %cmp38, label %if.then39, label %if.end40

if.then39:                                        ; preds = %if.end37
  store i32 0, i32* %adjust, align 4
  br label %if.end40

if.end40:                                         ; preds = %if.then39, %if.end37
  store i32 0, i32* %in_invisline, align 4
  %35 = load i8*, i8** %data.addr, align 4
  %36 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %line = getelementptr inbounds %struct.line_state, %struct.line_state* %36, i32 0, i32 0
  %37 = load i8*, i8** %line, align 4
  %cmp41 = icmp ugt i8* %35, %37
  br i1 %cmp41, label %land.lhs.true42, label %if.end48

land.lhs.true42:                                  ; preds = %if.end40
  %38 = load i8*, i8** %data.addr, align 4
  %39 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %line43 = getelementptr inbounds %struct.line_state, %struct.line_state* %39, i32 0, i32 0
  %40 = load i8*, i8** %line43, align 4
  %41 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %lbreaks = getelementptr inbounds %struct.line_state, %struct.line_state* %41, i32 0, i32 1
  %42 = load i32*, i32** %lbreaks, align 4
  %43 = load i32, i32* @_rl_inv_botlin, align 4
  %add44 = add nsw i32 %43, 1
  %arrayidx = getelementptr inbounds i32, i32* %42, i32 %add44
  %44 = load i32, i32* %arrayidx, align 4
  %add.ptr = getelementptr inbounds i8, i8* %40, i32 %44
  %cmp45 = icmp ult i8* %38, %add.ptr
  br i1 %cmp45, label %if.then46, label %if.end48

if.then46:                                        ; preds = %land.lhs.true42
  %45 = load i8*, i8** %data.addr, align 4
  %46 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %line47 = getelementptr inbounds %struct.line_state, %struct.line_state* %46, i32 0, i32 0
  %47 = load i8*, i8** %line47, align 4
  %sub.ptr.lhs.cast = ptrtoint i8* %45 to i32
  %sub.ptr.rhs.cast = ptrtoint i8* %47 to i32
  %sub.ptr.sub = sub i32 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  store i32 %sub.ptr.sub, i32* %in_invisline, align 4
  br label %if.end48

if.end48:                                         ; preds = %if.then46, %land.lhs.true42, %if.end40
  %48 = load i32, i32* %adjust, align 4
  %tobool49 = icmp ne i32 %48, 0
  br i1 %tobool49, label %land.lhs.true50, label %if.end70

land.lhs.true50:                                  ; preds = %if.end48
  %49 = load i32, i32* %new.addr, align 4
  %50 = load i32, i32* @prompt_last_invisible, align 4
  %cmp51 = icmp sgt i32 %49, %50
  br i1 %cmp51, label %if.then68, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true50
  %51 = load i32, i32* %new.addr, align 4
  %52 = load i32, i32* %in_invisline, align 4
  %add52 = add nsw i32 %51, %52
  %53 = load i32, i32* @prompt_last_invisible, align 4
  %cmp53 = icmp sgt i32 %add52, %53
  br i1 %cmp53, label %if.then68, label %lor.lhs.false54

lor.lhs.false54:                                  ; preds = %lor.lhs.false
  %54 = load i32, i32* @prompt_physical_chars, align 4
  %55 = load i32, i32* @_rl_screenwidth, align 4
  %cmp55 = icmp sge i32 %54, %55
  br i1 %cmp55, label %land.lhs.true56, label %if.end70

land.lhs.true56:                                  ; preds = %lor.lhs.false54
  %56 = load i32, i32* @_rl_last_v_pos, align 4
  %57 = load i32, i32* @prompt_last_screen_line, align 4
  %cmp57 = icmp eq i32 %56, %57
  br i1 %cmp57, label %land.lhs.true58, label %if.end70

land.lhs.true58:                                  ; preds = %land.lhs.true56
  %58 = load i32, i32* @wrap_offset, align 4
  %59 = load i32, i32* %woff, align 4
  %cmp59 = icmp sge i32 %58, %59
  br i1 %cmp59, label %land.lhs.true60, label %if.end70

land.lhs.true60:                                  ; preds = %land.lhs.true58
  %60 = load i32, i32* %dpos, align 4
  %61 = load i32, i32* %woff, align 4
  %cmp61 = icmp sge i32 %60, %61
  br i1 %cmp61, label %land.lhs.true62, label %if.end70

land.lhs.true62:                                  ; preds = %land.lhs.true60
  %62 = load i32, i32* %new.addr, align 4
  %63 = load i32, i32* @prompt_last_invisible, align 4
  %64 = load %struct.line_state*, %struct.line_state** @line_state_visible, align 4
  %lbreaks63 = getelementptr inbounds %struct.line_state, %struct.line_state* %64, i32 0, i32 1
  %65 = load i32*, i32** %lbreaks63, align 4
  %66 = load i32, i32* @_rl_last_v_pos, align 4
  %arrayidx64 = getelementptr inbounds i32, i32* %65, i32 %66
  %67 = load i32, i32* %arrayidx64, align 4
  %sub65 = sub nsw i32 %63, %67
  %68 = load i32, i32* @wrap_offset, align 4
  %sub66 = sub nsw i32 %sub65, %68
  %cmp67 = icmp sgt i32 %62, %sub66
  br i1 %cmp67, label %if.then68, label %if.end70

if.then68:                                        ; preds = %land.lhs.true62, %lor.lhs.false, %land.lhs.true50
  %69 = load i32, i32* %woff, align 4
  %70 = load i32, i32* %dpos, align 4
  %sub69 = sub nsw i32 %70, %69
  store i32 %sub69, i32* %dpos, align 4
  store i32 1, i32* @cpos_adjusted, align 4
  br label %if.end70

if.end70:                                         ; preds = %if.then68, %land.lhs.true62, %land.lhs.true60, %land.lhs.true58, %land.lhs.true56, %lor.lhs.false54, %if.end48
  br label %if.end72

if.else71:                                        ; preds = %land.lhs.true18, %if.end
  %71 = load i32, i32* %new.addr, align 4
  store i32 %71, i32* %dpos, align 4
  br label %if.end72

if.end72:                                         ; preds = %if.else71, %if.end70
  %72 = load i32, i32* %cpos, align 4
  %73 = load i32, i32* %dpos, align 4
  %cmp73 = icmp eq i32 %72, %73
  br i1 %cmp73, label %if.then74, label %if.end75

if.then74:                                        ; preds = %if.end72
  br label %return

if.end75:                                         ; preds = %if.end72
  %74 = load i32, i32* %mb_cur_max, align 4
  %cmp76 = icmp sgt i32 %74, 1
  br i1 %cmp76, label %land.lhs.true77, label %if.else80

land.lhs.true77:                                  ; preds = %if.end75
  %75 = load i32, i32* @rl_byte_oriented, align 4
  %cmp78 = icmp eq i32 %75, 0
  br i1 %cmp78, label %if.then79, label %if.else80

if.then79:                                        ; preds = %land.lhs.true77
  %76 = load i32, i32* @_rl_last_c_pos, align 4
  store i32 %76, i32* %i, align 4
  br label %if.end82

if.else80:                                        ; preds = %land.lhs.true77, %if.end75
  %77 = load i32, i32* @_rl_last_c_pos, align 4
  %78 = load i32, i32* %woff, align 4
  %sub81 = sub nsw i32 %77, %78
  store i32 %sub81, i32* %i, align 4
  br label %if.end82

if.end82:                                         ; preds = %if.else80, %if.then79
  %79 = load i32, i32* %dpos, align 4
  %cmp83 = icmp eq i32 %79, 0
  br i1 %cmp83, label %if.then92, label %lor.lhs.false84

lor.lhs.false84:                                  ; preds = %if.end82
  %80 = load i32, i32* %dpos, align 4
  %add85 = add nsw i32 %80, 1
  %81 = load i32, i32* @_rl_last_c_pos, align 4
  %82 = load i32, i32* %dpos, align 4
  %sub86 = sub nsw i32 %81, %82
  %cmp87 = icmp slt i32 %add85, %sub86
  br i1 %cmp87, label %if.then92, label %lor.lhs.false88

lor.lhs.false88:                                  ; preds = %lor.lhs.false84
  %83 = load i32, i32* @_rl_term_autowrap, align 4
  %tobool89 = icmp ne i32 %83, 0
  br i1 %tobool89, label %land.lhs.true90, label %if.end94

land.lhs.true90:                                  ; preds = %lor.lhs.false88
  %84 = load i32, i32* %i, align 4
  %85 = load i32, i32* @_rl_screenwidth, align 4
  %cmp91 = icmp eq i32 %84, %85
  br i1 %cmp91, label %if.then92, label %if.end94

if.then92:                                        ; preds = %land.lhs.true90, %lor.lhs.false84, %if.end82
  %86 = load i8*, i8** @_rl_term_cr, align 4
  %call93 = call i32 bitcast (i32 (...)* @tputs to i32 (i8*, i32, i32 (i32)*)*)(i8* %86, i32 1, i32 (i32)* @_rl_output_character_function)
  store i32 0, i32* @_rl_last_c_pos, align 4
  store i32 0, i32* %cpos, align 4
  br label %if.end94

if.end94:                                         ; preds = %if.then92, %land.lhs.true90, %lor.lhs.false88
  %87 = load i32, i32* %cpos, align 4
  %88 = load i32, i32* %dpos, align 4
  %cmp95 = icmp slt i32 %87, %88
  br i1 %cmp95, label %if.then96, label %if.else128

if.then96:                                        ; preds = %if.end94
  %89 = load i32, i32* %mb_cur_max, align 4
  %cmp97 = icmp sgt i32 %89, 1
  br i1 %cmp97, label %land.lhs.true98, label %if.else116

land.lhs.true98:                                  ; preds = %if.then96
  %90 = load i32, i32* @rl_byte_oriented, align 4
  %cmp99 = icmp eq i32 %90, 0
  br i1 %cmp99, label %if.then100, label %if.else116

if.then100:                                       ; preds = %land.lhs.true98
  %91 = load i8*, i8** @_rl_term_forward_char, align 4
  %tobool101 = icmp ne i8* %91, null
  br i1 %tobool101, label %if.then102, label %if.else105

if.then102:                                       ; preds = %if.then100
  %92 = load i32, i32* %cpos, align 4
  store i32 %92, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then102
  %93 = load i32, i32* %i, align 4
  %94 = load i32, i32* %dpos, align 4
  %cmp103 = icmp slt i32 %93, %94
  br i1 %cmp103, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %95 = load i8*, i8** @_rl_term_forward_char, align 4
  %call104 = call i32 bitcast (i32 (...)* @tputs to i32 (i8*, i32, i32 (i32)*)*)(i8* %95, i32 1, i32 (i32)* @_rl_output_character_function)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %96 = load i32, i32* %i, align 4
  %inc = add nsw i32 %96, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  br label %if.end115

if.else105:                                       ; preds = %if.then100
  %97 = load i8*, i8** @_rl_term_cr, align 4
  %call106 = call i32 bitcast (i32 (...)* @tputs to i32 (i8*, i32, i32 (i32)*)*)(i8* %97, i32 1, i32 (i32)* @_rl_output_character_function)
  store i32 0, i32* %i, align 4
  br label %for.cond107

for.cond107:                                      ; preds = %for.inc112, %if.else105
  %98 = load i32, i32* %i, align 4
  %99 = load i32, i32* %new.addr, align 4
  %cmp108 = icmp slt i32 %98, %99
  br i1 %cmp108, label %for.body109, label %for.end114

for.body109:                                      ; preds = %for.cond107
  %100 = load i8*, i8** %data.addr, align 4
  %101 = load i32, i32* %i, align 4
  %arrayidx110 = getelementptr inbounds i8, i8* %100, i32 %101
  %102 = load i8, i8* %arrayidx110, align 1
  %conv = sext i8 %102 to i32
  %103 = load %struct._IO_FILE*, %struct._IO_FILE** @rl_outstream, align 4
  %call111 = call i32 @putc(i32 %conv, %struct._IO_FILE* %103)
  br label %for.inc112

for.inc112:                                       ; preds = %for.body109
  %104 = load i32, i32* %i, align 4
  %inc113 = add nsw i32 %104, 1
  store i32 %inc113, i32* %i, align 4
  br label %for.cond107

for.end114:                                       ; preds = %for.cond107
  br label %if.end115

if.end115:                                        ; preds = %for.end114, %for.end
  br label %if.end127

if.else116:                                       ; preds = %land.lhs.true98, %if.then96
  %105 = load i32, i32* %cpos, align 4
  store i32 %105, i32* %i, align 4
  br label %for.cond117

for.cond117:                                      ; preds = %for.inc124, %if.else116
  %106 = load i32, i32* %i, align 4
  %107 = load i32, i32* %new.addr, align 4
  %cmp118 = icmp slt i32 %106, %107
  br i1 %cmp118, label %for.body120, label %for.end126

for.body120:                                      ; preds = %for.cond117
  %108 = load i8*, i8** %data.addr, align 4
  %109 = load i32, i32* %i, align 4
  %arrayidx121 = getelementptr inbounds i8, i8* %108, i32 %109
  %110 = load i8, i8* %arrayidx121, align 1
  %conv122 = sext i8 %110 to i32
  %111 = load %struct._IO_FILE*, %struct._IO_FILE** @rl_outstream, align 4
  %call123 = call i32 @putc(i32 %conv122, %struct._IO_FILE* %111)
  br label %for.inc124

for.inc124:                                       ; preds = %for.body120
  %112 = load i32, i32* %i, align 4
  %inc125 = add nsw i32 %112, 1
  store i32 %inc125, i32* %i, align 4
  br label %for.cond117

for.end126:                                       ; preds = %for.cond117
  br label %if.end127

if.end127:                                        ; preds = %for.end126, %if.end115
  br label %if.end135

if.else128:                                       ; preds = %if.end94
  %113 = load i32, i32* %cpos, align 4
  %114 = load i32, i32* %dpos, align 4
  %cmp129 = icmp sgt i32 %113, %114
  br i1 %cmp129, label %if.then131, label %if.end134

if.then131:                                       ; preds = %if.else128
  %115 = load i32, i32* %cpos, align 4
  %116 = load i32, i32* %dpos, align 4
  %sub132 = sub nsw i32 %115, %116
  %call133 = call i32 @_rl_backspace(i32 %sub132)
  br label %if.end134

if.end134:                                        ; preds = %if.then131, %if.else128
  br label %if.end135

if.end135:                                        ; preds = %if.end134, %if.end127
  %117 = load i32, i32* %dpos, align 4
  store i32 %117, i32* @_rl_last_c_pos, align 4
  br label %return

return:                                           ; preds = %if.end135, %if.then74, %if.then
  ret void
}

declare i32 @tputs(...) #1

declare i32 @_rl_output_character_function(i32) #1

declare i32 @_rl_backspace(i32) #1

declare i32 @fflush(%struct._IO_FILE*) #1

declare void @_rl_release_sigint() #1

; Function Attrs: noinline nounwind
define i32 @rl_clear_visible_line() #0 {
entry:
  %curr_line = alloca i32, align 4
  %0 = load i8*, i8** @_rl_term_cr, align 4
  %call = call i32 bitcast (i32 (...)* @tputs to i32 (i8*, i32, i32 (i32)*)*)(i8* %0, i32 1, i32 (i32)* @_rl_output_character_function)
  store i32 0, i32* @_rl_last_c_pos, align 4
  %1 = load i32, i32* @_rl_vis_botlin, align 4
  call void @_rl_move_vert(i32 %1)
  %2 = load i32, i32* @_rl_last_v_pos, align 4
  store i32 %2, i32* %curr_line, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i32, i32* %curr_line, align 4
  %cmp = icmp sge i32 %3, 0
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %curr_line, align 4
  call void @_rl_move_vert(i32 %4)
  call void @_rl_clear_to_eol(i32 0)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %curr_line, align 4
  %dec = add nsw i32 %5, -1
  store i32 %dec, i32* %curr_line, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret i32 0
}

; Function Attrs: noinline nounwind
define i32 @rl_on_new_line_with_prompt() #0 {
entry:
  %prompt_size = alloca i32, align 4
  %i = alloca i32, align 4
  %l = alloca i32, align 4
  %real_screenwidth = alloca i32, align 4
  %newlines = alloca i32, align 4
  %prompt_last_line = alloca i8*, align 4
  %lprompt = alloca i8*, align 4
  %0 = load i8*, i8** @rl_prompt, align 4
  %call = call i32 @strlen(i8* %0)
  %add = add i32 %call, 1
  store i32 %add, i32* %prompt_size, align 4
  %1 = load i32, i32* %prompt_size, align 4
  call void @init_line_structures(i32 %1)
  %2 = load i8*, i8** @local_prompt, align 4
  %tobool = icmp ne i8* %2, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %3 = load i8*, i8** @local_prompt, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  %4 = load i8*, i8** @rl_prompt, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %3, %cond.true ], [ %4, %cond.false ]
  store i8* %cond, i8** %lprompt, align 4
  %5 = load %struct.line_state*, %struct.line_state** @line_state_visible, align 4
  %line = getelementptr inbounds %struct.line_state, %struct.line_state* %5, i32 0, i32 0
  %6 = load i8*, i8** %line, align 4
  %7 = load i8*, i8** %lprompt, align 4
  %call1 = call i8* @strcpy(i8* %6, i8* %7)
  %8 = load %struct.line_state*, %struct.line_state** @line_state_invisible, align 4
  %line2 = getelementptr inbounds %struct.line_state, %struct.line_state* %8, i32 0, i32 0
  %9 = load i8*, i8** %line2, align 4
  %10 = load i8*, i8** %lprompt, align 4
  %call3 = call i8* @strcpy(i8* %9, i8* %10)
  %11 = load i8*, i8** @rl_prompt, align 4
  %call4 = call i8* @strrchr(i8* %11, i32 10)
  store i8* %call4, i8** %prompt_last_line, align 4
  %12 = load i8*, i8** %prompt_last_line, align 4
  %tobool5 = icmp ne i8* %12, null
  br i1 %tobool5, label %if.end, label %if.then

if.then:                                          ; preds = %cond.end
  %13 = load i8*, i8** @rl_prompt, align 4
  store i8* %13, i8** %prompt_last_line, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %cond.end
  %14 = load i8*, i8** %prompt_last_line, align 4
  %call6 = call i32 @strlen(i8* %14)
  store i32 %call6, i32* %l, align 4
  %call7 = call i32 @__ctype_get_mb_cur_max()
  %cmp = icmp ugt i32 %call7, 1
  br i1 %cmp, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %if.end
  %15 = load i32, i32* @rl_byte_oriented, align 4
  %cmp8 = icmp eq i32 %15, 0
  br i1 %cmp8, label %if.then9, label %if.else

if.then9:                                         ; preds = %land.lhs.true
  %16 = load i8*, i8** %prompt_last_line, align 4
  %17 = load i32, i32* %l, align 4
  %call10 = call i32 @_rl_col_width(i8* %16, i32 0, i32 %17, i32 1)
  store i32 %call10, i32* @_rl_last_c_pos, align 4
  br label %if.end11

if.else:                                          ; preds = %land.lhs.true, %if.end
  %18 = load i32, i32* %l, align 4
  store i32 %18, i32* @_rl_last_c_pos, align 4
  br label %if.end11

if.end11:                                         ; preds = %if.else, %if.then9
  %19 = load i32, i32* @_rl_screenwidth, align 4
  %20 = load i32, i32* @_rl_term_autowrap, align 4
  %tobool12 = icmp ne i32 %20, 0
  %cond13 = select i1 %tobool12, i32 0, i32 1
  %add14 = add nsw i32 %19, %cond13
  store i32 %add14, i32* %real_screenwidth, align 4
  %21 = load i32, i32* %l, align 4
  %22 = load i32, i32* %real_screenwidth, align 4
  %div = sdiv i32 %21, %22
  store i32 %div, i32* @_rl_last_v_pos, align 4
  %23 = load i32, i32* %l, align 4
  %cmp15 = icmp sgt i32 %23, 0
  br i1 %cmp15, label %land.lhs.true16, label %if.end19

land.lhs.true16:                                  ; preds = %if.end11
  %24 = load i32, i32* %l, align 4
  %25 = load i32, i32* %real_screenwidth, align 4
  %rem = srem i32 %24, %25
  %cmp17 = icmp eq i32 %rem, 0
  br i1 %cmp17, label %if.then18, label %if.end19

if.then18:                                        ; preds = %land.lhs.true16
  call void @_rl_output_some_chars(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i32 0, i32 0), i32 1)
  br label %if.end19

if.end19:                                         ; preds = %if.then18, %land.lhs.true16, %if.end11
  store i32 0, i32* @last_lmargin, align 4
  store i32 0, i32* %newlines, align 4
  store i32 0, i32* %i, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.end19
  %26 = load i32, i32* %i, align 4
  %27 = load i32, i32* %l, align 4
  %cmp20 = icmp sle i32 %26, %27
  br i1 %cmp20, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %28 = load i32, i32* %newlines, align 4
  store i32 %28, i32* @_rl_vis_botlin, align 4
  %29 = load i32, i32* %i, align 4
  %30 = load %struct.line_state*, %struct.line_state** @line_state_visible, align 4
  %lbreaks = getelementptr inbounds %struct.line_state, %struct.line_state* %30, i32 0, i32 1
  %31 = load i32*, i32** %lbreaks, align 4
  %32 = load i32, i32* %newlines, align 4
  %inc = add nsw i32 %32, 1
  store i32 %inc, i32* %newlines, align 4
  %arrayidx = getelementptr inbounds i32, i32* %31, i32 %32
  store i32 %29, i32* %arrayidx, align 4
  %33 = load i32, i32* %real_screenwidth, align 4
  %34 = load i32, i32* %i, align 4
  %add21 = add nsw i32 %34, %33
  store i32 %add21, i32* %i, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %35 = load i32, i32* %l, align 4
  %36 = load %struct.line_state*, %struct.line_state** @line_state_visible, align 4
  %lbreaks22 = getelementptr inbounds %struct.line_state, %struct.line_state* %36, i32 0, i32 1
  %37 = load i32*, i32** %lbreaks22, align 4
  %38 = load i32, i32* %newlines, align 4
  %arrayidx23 = getelementptr inbounds i32, i32* %37, i32 %38
  store i32 %35, i32* %arrayidx23, align 4
  store i32 0, i32* @visible_wrap_offset, align 4
  %39 = load i8*, i8** @rl_prompt, align 4
  store i8* %39, i8** @rl_display_prompt, align 4
  ret i32 0
}

declare i8* @strcpy(i8*, i8*) #1

; Function Attrs: noinline nounwind
define i32 @rl_forced_update_display() #0 {
entry:
  %temp = alloca i8*, align 4
  %0 = load %struct.line_state*, %struct.line_state** @line_state_visible, align 4
  %line = getelementptr inbounds %struct.line_state, %struct.line_state* %0, i32 0, i32 0
  %1 = load i8*, i8** %line, align 4
  %tobool = icmp ne i8* %1, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load %struct.line_state*, %struct.line_state** @line_state_visible, align 4
  %line1 = getelementptr inbounds %struct.line_state, %struct.line_state* %2, i32 0, i32 0
  %3 = load i8*, i8** %line1, align 4
  store i8* %3, i8** %temp, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.then
  %4 = load i8*, i8** %temp, align 4
  %5 = load i8, i8* %4, align 1
  %tobool2 = icmp ne i8 %5, 0
  br i1 %tobool2, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %6 = load i8*, i8** %temp, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %6, i32 1
  store i8* %incdec.ptr, i8** %temp, align 4
  store i8 0, i8* %6, align 1
  br label %while.cond

while.end:                                        ; preds = %while.cond
  br label %if.end

if.end:                                           ; preds = %while.end, %entry
  %call = call i32 @rl_on_new_line()
  %7 = load i32, i32* @forced_display, align 4
  %inc = add nsw i32 %7, 1
  store i32 %inc, i32* @forced_display, align 4
  %8 = load void ()*, void ()** @rl_redisplay_function, align 4
  call void %8()
  ret i32 0
}

; Function Attrs: noinline nounwind
define void @rl_redraw_prompt_last_line() #0 {
entry:
  %t = alloca i8*, align 4
  %0 = load i8*, i8** @rl_display_prompt, align 4
  %call = call i8* @strrchr(i8* %0, i32 10)
  store i8* %call, i8** %t, align 4
  %1 = load i8*, i8** %t, align 4
  %tobool = icmp ne i8* %1, null
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %2 = load i8*, i8** %t, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %2, i32 1
  store i8* %incdec.ptr, i8** %t, align 4
  call void @redraw_prompt(i8* %incdec.ptr)
  br label %if.end

if.else:                                          ; preds = %entry
  %call1 = call i32 @rl_forced_update_display()
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void
}

; Function Attrs: noinline nounwind
define internal void @redraw_prompt(i8* %t) #0 {
entry:
  %t.addr = alloca i8*, align 4
  %oldp = alloca i8*, align 4
  store i8* %t, i8** %t.addr, align 4
  %0 = load i8*, i8** @rl_display_prompt, align 4
  store i8* %0, i8** %oldp, align 4
  call void @rl_save_prompt()
  %1 = load i8*, i8** %t.addr, align 4
  store i8* %1, i8** @rl_display_prompt, align 4
  %2 = load i8*, i8** %t.addr, align 4
  %call = call i8* @expand_prompt(i8* %2, i32 1, i32* @prompt_visible_length, i32* @prompt_last_invisible, i32* @prompt_invis_chars_first_line, i32* @prompt_physical_chars)
  store i8* %call, i8** @local_prompt, align 4
  store i8* null, i8** @local_prompt_prefix, align 4
  %3 = load i8*, i8** @local_prompt, align 4
  %tobool = icmp ne i8* %3, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %4 = load i8*, i8** @local_prompt, align 4
  %call1 = call i32 @strlen(i8* %4)
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call1, %cond.true ], [ 0, %cond.false ]
  store i32 %cond, i32* @local_prompt_len, align 4
  %call2 = call i32 @rl_forced_update_display()
  %5 = load i8*, i8** %oldp, align 4
  store i8* %5, i8** @rl_display_prompt, align 4
  call void @rl_restore_prompt()
  ret void
}

declare i32 @memcmp(i8*, i8*, i32) #1

declare i32 @putc(i32, %struct._IO_FILE*) #1

; Function Attrs: noinline nounwind
define i32 @rl_show_char(i32 %c) #0 {
entry:
  %c.addr = alloca i32, align 4
  %n = alloca i32, align 4
  store i32 %c, i32* %c.addr, align 4
  store i32 1, i32* %n, align 4
  %0 = load i32, i32* %c.addr, align 4
  %cmp = icmp sgt i32 %0, 127
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %1 = load i32, i32* %c.addr, align 4
  %cmp1 = icmp sle i32 %1, 255
  br i1 %cmp1, label %land.lhs.true2, label %if.end

land.lhs.true2:                                   ; preds = %land.lhs.true
  %2 = load i32, i32* @_rl_output_meta_chars, align 4
  %cmp3 = icmp eq i32 %2, 0
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true2
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @rl_outstream, align 4
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i32 0, i32 0))
  %4 = load i32, i32* %n, align 4
  %add = add nsw i32 %4, 2
  store i32 %add, i32* %n, align 4
  %5 = load i32, i32* %c.addr, align 4
  %and = and i32 %5, -129
  store i32 %and, i32* %c.addr, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true2, %land.lhs.true, %entry
  %6 = load i32, i32* %c.addr, align 4
  %cmp4 = icmp slt i32 %6, 32
  br i1 %cmp4, label %land.lhs.true5, label %lor.lhs.false

land.lhs.true5:                                   ; preds = %if.end
  %7 = load i32, i32* %c.addr, align 4
  %and6 = and i32 %7, 128
  %cmp7 = icmp eq i32 %and6, 0
  br i1 %cmp7, label %land.lhs.true8, label %lor.lhs.false

land.lhs.true8:                                   ; preds = %land.lhs.true5
  %8 = load i32, i32* %c.addr, align 4
  %cmp9 = icmp ne i32 %8, 9
  br i1 %cmp9, label %if.then11, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true8, %land.lhs.true5, %if.end
  %9 = load i32, i32* %c.addr, align 4
  %cmp10 = icmp eq i32 %9, 127
  br i1 %cmp10, label %if.then11, label %if.end36

if.then11:                                        ; preds = %lor.lhs.false, %land.lhs.true8
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @rl_outstream, align 4
  %call12 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.5, i32 0, i32 0))
  %11 = load i32, i32* %n, align 4
  %add13 = add nsw i32 %11, 2
  store i32 %add13, i32* %n, align 4
  %12 = load i32, i32* %c.addr, align 4
  %cmp14 = icmp slt i32 %12, 32
  br i1 %cmp14, label %land.lhs.true15, label %cond.false33

land.lhs.true15:                                  ; preds = %if.then11
  %13 = load i32, i32* %c.addr, align 4
  %and16 = and i32 %13, 128
  %cmp17 = icmp eq i32 %and16, 0
  br i1 %cmp17, label %cond.true, label %cond.false33

cond.true:                                        ; preds = %land.lhs.true15
  %14 = load i32, i32* %c.addr, align 4
  %or = or i32 %14, 64
  %conv = trunc i32 %or to i8
  %conv18 = zext i8 %conv to i32
  %15 = load i32, i32* %c.addr, align 4
  %or19 = or i32 %15, 64
  %cmp20 = icmp eq i32 %conv18, %or19
  br i1 %cmp20, label %land.lhs.true22, label %cond.false

land.lhs.true22:                                  ; preds = %cond.true
  %16 = load i32, i32* %c.addr, align 4
  %or23 = or i32 %16, 64
  %conv24 = trunc i32 %or23 to i8
  %conv25 = zext i8 %conv24 to i32
  %call26 = call i32 @islower(i32 %conv25) #5
  %tobool = icmp ne i32 %call26, 0
  br i1 %tobool, label %cond.true27, label %cond.false

cond.true27:                                      ; preds = %land.lhs.true22
  %17 = load i32, i32* %c.addr, align 4
  %or28 = or i32 %17, 64
  %conv29 = trunc i32 %or28 to i8
  %conv30 = zext i8 %conv29 to i32
  %call31 = call i32 @toupper(i32 %conv30) #5
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true22, %cond.true
  %18 = load i32, i32* %c.addr, align 4
  %or32 = or i32 %18, 64
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true27
  %cond = phi i32 [ %call31, %cond.true27 ], [ %or32, %cond.false ]
  br label %cond.end34

cond.false33:                                     ; preds = %land.lhs.true15, %if.then11
  br label %cond.end34

cond.end34:                                       ; preds = %cond.false33, %cond.end
  %cond35 = phi i32 [ %cond, %cond.end ], [ 63, %cond.false33 ]
  store i32 %cond35, i32* %c.addr, align 4
  br label %if.end36

if.end36:                                         ; preds = %cond.end34, %lor.lhs.false
  %19 = load i32, i32* %c.addr, align 4
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @rl_outstream, align 4
  %call37 = call i32 @putc(i32 %19, %struct._IO_FILE* %20)
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @rl_outstream, align 4
  %call38 = call i32 @fflush(%struct._IO_FILE* %21)
  %22 = load i32, i32* %n, align 4
  ret i32 %22
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: noinline nounwind
define i32 @rl_character_len(i32 %c, i32 %pos) #0 {
entry:
  %retval = alloca i32, align 4
  %c.addr = alloca i32, align 4
  %pos.addr = alloca i32, align 4
  %uc = alloca i8, align 1
  store i32 %c, i32* %c.addr, align 4
  store i32 %pos, i32* %pos.addr, align 4
  %0 = load i32, i32* %c.addr, align 4
  %conv = trunc i32 %0 to i8
  store i8 %conv, i8* %uc, align 1
  %1 = load i8, i8* %uc, align 1
  %conv1 = zext i8 %1 to i32
  %cmp = icmp sgt i32 %conv1, 127
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %2 = load i8, i8* %uc, align 1
  %conv3 = zext i8 %2 to i32
  %cmp4 = icmp sle i32 %conv3, 255
  br i1 %cmp4, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %3 = load i32, i32* @_rl_output_meta_chars, align 4
  %cmp6 = icmp eq i32 %3, 0
  %cond = select i1 %cmp6, i32 4, i32 1
  store i32 %cond, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %land.lhs.true, %entry
  %4 = load i8, i8* %uc, align 1
  %conv8 = zext i8 %4 to i32
  %cmp9 = icmp eq i32 %conv8, 9
  br i1 %cmp9, label %if.then11, label %if.end12

if.then11:                                        ; preds = %if.end
  %5 = load i32, i32* %pos.addr, align 4
  %or = or i32 %5, 7
  %add = add nsw i32 %or, 1
  %6 = load i32, i32* %pos.addr, align 4
  %sub = sub nsw i32 %add, %6
  store i32 %sub, i32* %retval, align 4
  br label %return

if.end12:                                         ; preds = %if.end
  %7 = load i32, i32* %c.addr, align 4
  %cmp13 = icmp slt i32 %7, 32
  br i1 %cmp13, label %land.lhs.true15, label %lor.lhs.false

land.lhs.true15:                                  ; preds = %if.end12
  %8 = load i32, i32* %c.addr, align 4
  %and = and i32 %8, 128
  %cmp16 = icmp eq i32 %and, 0
  br i1 %cmp16, label %if.then20, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true15, %if.end12
  %9 = load i32, i32* %c.addr, align 4
  %cmp18 = icmp eq i32 %9, 127
  br i1 %cmp18, label %if.then20, label %if.end21

if.then20:                                        ; preds = %lor.lhs.false, %land.lhs.true15
  store i32 2, i32* %retval, align 4
  br label %return

if.end21:                                         ; preds = %lor.lhs.false
  %10 = load i8, i8* %uc, align 1
  %conv22 = zext i8 %10 to i32
  %call = call i32 @isprint(i32 %conv22) #5
  %tobool = icmp ne i32 %call, 0
  %cond23 = select i1 %tobool, i32 1, i32 2
  store i32 %cond23, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end21, %if.then20, %if.then11, %if.then
  %11 = load i32, i32* %retval, align 4
  ret i32 %11
}

; Function Attrs: nounwind readonly
declare i32 @isprint(i32) #3

; Function Attrs: noinline nounwind
define i32 @rl_message(i8* %format, ...) #0 {
entry:
  %format.addr = alloca i8*, align 4
  %args = alloca [4 x i32], align 4
  %bneed = alloca i32, align 4
  store i8* %format, i8** %format.addr, align 4
  %arraydecay = getelementptr inbounds [4 x i32], [4 x i32]* %args, i32 0, i32 0
  %arraydecay1 = bitcast i32* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %0 = load i8*, i8** @msg_buf, align 4
  %cmp = icmp eq i8* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 128, i32* @msg_bufsiz, align 4
  %call = call i8* @xmalloc(i32 128)
  store i8* %call, i8** @msg_buf, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %1 = load i8*, i8** @msg_buf, align 4
  %2 = load i32, i32* @msg_bufsiz, align 4
  %3 = load i8*, i8** %format.addr, align 4
  %arraydecay2 = getelementptr inbounds [4 x i32], [4 x i32]* %args, i32 0, i32 0
  %call3 = call i32 @vsnprintf(i8* %1, i32 %2, i8* %3, i32* %arraydecay2)
  store i32 %call3, i32* %bneed, align 4
  %4 = load i32, i32* %bneed, align 4
  %5 = load i32, i32* @msg_bufsiz, align 4
  %sub = sub nsw i32 %5, 1
  %cmp4 = icmp sge i32 %4, %sub
  br i1 %cmp4, label %if.then5, label %if.end14

if.then5:                                         ; preds = %if.end
  %6 = load i32, i32* %bneed, align 4
  %add = add nsw i32 %6, 1
  store i32 %add, i32* @msg_bufsiz, align 4
  %7 = load i8*, i8** @msg_buf, align 4
  %8 = load i32, i32* @msg_bufsiz, align 4
  %call6 = call i8* @xrealloc(i8* %7, i32 %8)
  store i8* %call6, i8** @msg_buf, align 4
  %arraydecay7 = getelementptr inbounds [4 x i32], [4 x i32]* %args, i32 0, i32 0
  %arraydecay78 = bitcast i32* %arraydecay7 to i8*
  call void @llvm.va_end(i8* %arraydecay78)
  %arraydecay9 = getelementptr inbounds [4 x i32], [4 x i32]* %args, i32 0, i32 0
  %arraydecay910 = bitcast i32* %arraydecay9 to i8*
  call void @llvm.va_start(i8* %arraydecay910)
  %9 = load i8*, i8** @msg_buf, align 4
  %10 = load i32, i32* @msg_bufsiz, align 4
  %sub11 = sub nsw i32 %10, 1
  %11 = load i8*, i8** %format.addr, align 4
  %arraydecay12 = getelementptr inbounds [4 x i32], [4 x i32]* %args, i32 0, i32 0
  %call13 = call i32 @vsnprintf(i8* %9, i32 %sub11, i8* %11, i32* %arraydecay12)
  br label %if.end14

if.end14:                                         ; preds = %if.then5, %if.end
  %arraydecay15 = getelementptr inbounds [4 x i32], [4 x i32]* %args, i32 0, i32 0
  %arraydecay1516 = bitcast i32* %arraydecay15 to i8*
  call void @llvm.va_end(i8* %arraydecay1516)
  %12 = load i8*, i8** @saved_local_prompt, align 4
  %cmp17 = icmp eq i8* %12, null
  br i1 %cmp17, label %if.then18, label %if.else

if.then18:                                        ; preds = %if.end14
  call void @rl_save_prompt()
  store i32 1, i32* @msg_saved_prompt, align 4
  br label %if.end27

if.else:                                          ; preds = %if.end14
  %13 = load i8*, i8** @local_prompt, align 4
  %14 = load i8*, i8** @saved_local_prompt, align 4
  %cmp19 = icmp ne i8* %13, %14
  br i1 %cmp19, label %if.then20, label %if.end26

if.then20:                                        ; preds = %if.else
  %15 = load i8*, i8** @local_prompt, align 4
  %tobool = icmp ne i8* %15, null
  br i1 %tobool, label %if.then21, label %if.end22

if.then21:                                        ; preds = %if.then20
  %16 = load i8*, i8** @local_prompt, align 4
  call void @free(i8* %16)
  br label %if.end22

if.end22:                                         ; preds = %if.then21, %if.then20
  %17 = load i8*, i8** @local_prompt_prefix, align 4
  %tobool23 = icmp ne i8* %17, null
  br i1 %tobool23, label %if.then24, label %if.end25

if.then24:                                        ; preds = %if.end22
  %18 = load i8*, i8** @local_prompt_prefix, align 4
  call void @free(i8* %18)
  br label %if.end25

if.end25:                                         ; preds = %if.then24, %if.end22
  store i8* null, i8** @local_prompt, align 4
  br label %if.end26

if.end26:                                         ; preds = %if.end25, %if.else
  br label %if.end27

if.end27:                                         ; preds = %if.end26, %if.then18
  %19 = load i8*, i8** @msg_buf, align 4
  store i8* %19, i8** @rl_display_prompt, align 4
  %20 = load i8*, i8** @msg_buf, align 4
  %call28 = call i8* @expand_prompt(i8* %20, i32 0, i32* @prompt_visible_length, i32* @prompt_last_invisible, i32* @prompt_invis_chars_first_line, i32* @prompt_physical_chars)
  store i8* %call28, i8** @local_prompt, align 4
  store i8* null, i8** @local_prompt_prefix, align 4
  %21 = load i8*, i8** @local_prompt, align 4
  %tobool29 = icmp ne i8* %21, null
  br i1 %tobool29, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end27
  %22 = load i8*, i8** @local_prompt, align 4
  %call30 = call i32 @strlen(i8* %22)
  br label %cond.end

cond.false:                                       ; preds = %if.end27
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call30, %cond.true ], [ 0, %cond.false ]
  store i32 %cond, i32* @local_prompt_len, align 4
  %23 = load void ()*, void ()** @rl_redisplay_function, align 4
  call void %23()
  ret i32 0
}

; Function Attrs: nounwind
declare void @llvm.va_start(i8*) #4

declare i8* @xmalloc(i32) #1

declare i32 @vsnprintf(i8*, i32, i8*, i32*) #1

; Function Attrs: nounwind
declare void @llvm.va_end(i8*) #4

; Function Attrs: noinline nounwind
define void @rl_save_prompt() #0 {
entry:
  %0 = load i8*, i8** @local_prompt, align 4
  store i8* %0, i8** @saved_local_prompt, align 4
  %1 = load i8*, i8** @local_prompt_prefix, align 4
  store i8* %1, i8** @saved_local_prefix, align 4
  %2 = load i32, i32* @prompt_prefix_length, align 4
  store i32 %2, i32* @saved_prefix_length, align 4
  %3 = load i32, i32* @local_prompt_len, align 4
  store i32 %3, i32* @saved_local_length, align 4
  %4 = load i32, i32* @prompt_last_invisible, align 4
  store i32 %4, i32* @saved_last_invisible, align 4
  %5 = load i32, i32* @prompt_visible_length, align 4
  store i32 %5, i32* @saved_visible_length, align 4
  %6 = load i32, i32* @prompt_invis_chars_first_line, align 4
  store i32 %6, i32* @saved_invis_chars_first_line, align 4
  %7 = load i32, i32* @prompt_physical_chars, align 4
  store i32 %7, i32* @saved_physical_chars, align 4
  store i8* null, i8** @local_prompt_prefix, align 4
  store i8* null, i8** @local_prompt, align 4
  store i32 0, i32* @local_prompt_len, align 4
  store i32 0, i32* @prompt_prefix_length, align 4
  store i32 0, i32* @prompt_visible_length, align 4
  store i32 0, i32* @prompt_last_invisible, align 4
  store i32 0, i32* @prompt_physical_chars, align 4
  store i32 0, i32* @prompt_invis_chars_first_line, align 4
  ret void
}

; Function Attrs: noinline nounwind
define i32 @rl_clear_message() #0 {
entry:
  %0 = load i8*, i8** @rl_prompt, align 4
  store i8* %0, i8** @rl_display_prompt, align 4
  %1 = load i32, i32* @msg_saved_prompt, align 4
  %tobool = icmp ne i32 %1, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @rl_restore_prompt()
  store i32 0, i32* @msg_saved_prompt, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %2 = load void ()*, void ()** @rl_redisplay_function, align 4
  call void %2()
  ret i32 0
}

; Function Attrs: noinline nounwind
define void @rl_restore_prompt() #0 {
entry:
  %0 = load i8*, i8** @local_prompt, align 4
  %tobool = icmp ne i8* %0, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** @local_prompt, align 4
  call void @free(i8* %1)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %2 = load i8*, i8** @local_prompt_prefix, align 4
  %tobool1 = icmp ne i8* %2, null
  br i1 %tobool1, label %if.then2, label %if.end3

if.then2:                                         ; preds = %if.end
  %3 = load i8*, i8** @local_prompt_prefix, align 4
  call void @free(i8* %3)
  br label %if.end3

if.end3:                                          ; preds = %if.then2, %if.end
  %4 = load i8*, i8** @saved_local_prompt, align 4
  store i8* %4, i8** @local_prompt, align 4
  %5 = load i8*, i8** @saved_local_prefix, align 4
  store i8* %5, i8** @local_prompt_prefix, align 4
  %6 = load i32, i32* @saved_local_length, align 4
  store i32 %6, i32* @local_prompt_len, align 4
  %7 = load i32, i32* @saved_prefix_length, align 4
  store i32 %7, i32* @prompt_prefix_length, align 4
  %8 = load i32, i32* @saved_last_invisible, align 4
  store i32 %8, i32* @prompt_last_invisible, align 4
  %9 = load i32, i32* @saved_visible_length, align 4
  store i32 %9, i32* @prompt_visible_length, align 4
  %10 = load i32, i32* @saved_invis_chars_first_line, align 4
  store i32 %10, i32* @prompt_invis_chars_first_line, align 4
  %11 = load i32, i32* @saved_physical_chars, align 4
  store i32 %11, i32* @prompt_physical_chars, align 4
  store i8* null, i8** @saved_local_prefix, align 4
  store i8* null, i8** @saved_local_prompt, align 4
  store i32 0, i32* @saved_local_length, align 4
  store i32 0, i32* @saved_prefix_length, align 4
  store i32 0, i32* @saved_visible_length, align 4
  store i32 0, i32* @saved_last_invisible, align 4
  store i32 0, i32* @saved_physical_chars, align 4
  store i32 0, i32* @saved_invis_chars_first_line, align 4
  ret void
}

; Function Attrs: noinline nounwind
define i32 @rl_reset_line_state() #0 {
entry:
  %call = call i32 @rl_on_new_line()
  %0 = load i8*, i8** @rl_prompt, align 4
  %tobool = icmp ne i8* %0, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %1 = load i8*, i8** @rl_prompt, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %1, %cond.true ], [ getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i32 0, i32 0), %cond.false ]
  store i8* %cond, i8** @rl_display_prompt, align 4
  store i32 1, i32* @forced_display, align 4
  ret i32 0
}

; Function Attrs: noinline nounwind
define i8* @_rl_make_prompt_for_search(i32 %pchar) #0 {
entry:
  %pchar.addr = alloca i32, align 4
  %len = alloca i32, align 4
  %pmt = alloca i8*, align 4
  %p = alloca i8*, align 4
  store i32 %pchar, i32* %pchar.addr, align 4
  call void @rl_save_prompt()
  %0 = load i8*, i8** @rl_prompt, align 4
  %tobool = icmp ne i8* %0, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %1 = load i8*, i8** @rl_prompt, align 4
  %call = call i8* @strrchr(i8* %1, i32 10)
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %call, %cond.true ], [ null, %cond.false ]
  store i8* %cond, i8** %p, align 4
  %2 = load i8*, i8** %p, align 4
  %cmp = icmp eq i8* %2, null
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %cond.end
  %3 = load i8*, i8** @rl_prompt, align 4
  %tobool1 = icmp ne i8* %3, null
  br i1 %tobool1, label %land.lhs.true, label %cond.false5

land.lhs.true:                                    ; preds = %if.then
  %4 = load i8*, i8** @rl_prompt, align 4
  %5 = load i8, i8* %4, align 1
  %conv = sext i8 %5 to i32
  %tobool2 = icmp ne i32 %conv, 0
  br i1 %tobool2, label %cond.true3, label %cond.false5

cond.true3:                                       ; preds = %land.lhs.true
  %6 = load i8*, i8** @rl_prompt, align 4
  %call4 = call i32 @strlen(i8* %6)
  br label %cond.end6

cond.false5:                                      ; preds = %land.lhs.true, %if.then
  br label %cond.end6

cond.end6:                                        ; preds = %cond.false5, %cond.true3
  %cond7 = phi i32 [ %call4, %cond.true3 ], [ 0, %cond.false5 ]
  store i32 %cond7, i32* %len, align 4
  %7 = load i32, i32* %len, align 4
  %add = add nsw i32 %7, 2
  %call8 = call i8* @xmalloc(i32 %add)
  store i8* %call8, i8** %pmt, align 4
  %8 = load i32, i32* %len, align 4
  %tobool9 = icmp ne i32 %8, 0
  br i1 %tobool9, label %if.then10, label %if.end

if.then10:                                        ; preds = %cond.end6
  %9 = load i8*, i8** %pmt, align 4
  %10 = load i8*, i8** @rl_prompt, align 4
  %call11 = call i8* @strcpy(i8* %9, i8* %10)
  br label %if.end

if.end:                                           ; preds = %if.then10, %cond.end6
  %11 = load i32, i32* %pchar.addr, align 4
  %conv12 = trunc i32 %11 to i8
  %12 = load i8*, i8** %pmt, align 4
  %13 = load i32, i32* %len, align 4
  %arrayidx = getelementptr inbounds i8, i8* %12, i32 %13
  store i8 %conv12, i8* %arrayidx, align 1
  %14 = load i8*, i8** %pmt, align 4
  %15 = load i32, i32* %len, align 4
  %add13 = add nsw i32 %15, 1
  %arrayidx14 = getelementptr inbounds i8, i8* %14, i32 %add13
  store i8 0, i8* %arrayidx14, align 1
  br label %if.end26

if.else:                                          ; preds = %cond.end
  %16 = load i8*, i8** %p, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %16, i32 1
  store i8* %incdec.ptr, i8** %p, align 4
  %17 = load i8*, i8** %p, align 4
  %call15 = call i32 @strlen(i8* %17)
  store i32 %call15, i32* %len, align 4
  %18 = load i32, i32* %len, align 4
  %add16 = add nsw i32 %18, 2
  %call17 = call i8* @xmalloc(i32 %add16)
  store i8* %call17, i8** %pmt, align 4
  %19 = load i32, i32* %len, align 4
  %tobool18 = icmp ne i32 %19, 0
  br i1 %tobool18, label %if.then19, label %if.end21

if.then19:                                        ; preds = %if.else
  %20 = load i8*, i8** %pmt, align 4
  %21 = load i8*, i8** %p, align 4
  %call20 = call i8* @strcpy(i8* %20, i8* %21)
  br label %if.end21

if.end21:                                         ; preds = %if.then19, %if.else
  %22 = load i32, i32* %pchar.addr, align 4
  %conv22 = trunc i32 %22 to i8
  %23 = load i8*, i8** %pmt, align 4
  %24 = load i32, i32* %len, align 4
  %arrayidx23 = getelementptr inbounds i8, i8* %23, i32 %24
  store i8 %conv22, i8* %arrayidx23, align 1
  %25 = load i8*, i8** %pmt, align 4
  %26 = load i32, i32* %len, align 4
  %add24 = add nsw i32 %26, 1
  %arrayidx25 = getelementptr inbounds i8, i8* %25, i32 %add24
  store i8 0, i8* %arrayidx25, align 1
  br label %if.end26

if.end26:                                         ; preds = %if.end21, %if.end
  %27 = load i32, i32* @saved_physical_chars, align 4
  %add27 = add nsw i32 %27, 1
  store i32 %add27, i32* @prompt_physical_chars, align 4
  %28 = load i8*, i8** %pmt, align 4
  ret i8* %28
}

; Function Attrs: noinline nounwind
define void @_rl_erase_at_end_of_line(i32 %l) #0 {
entry:
  %l.addr = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 %l, i32* %l.addr, align 4
  %0 = load i32, i32* %l.addr, align 4
  %call = call i32 @_rl_backspace(i32 %0)
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32, i32* %i, align 4
  %2 = load i32, i32* %l.addr, align 4
  %cmp = icmp slt i32 %1, %2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @rl_outstream, align 4
  %call1 = call i32 @putc(i32 32, %struct._IO_FILE* %3)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %4 = load i32, i32* %i, align 4
  %inc = add nsw i32 %4, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %5 = load i32, i32* %l.addr, align 4
  %call2 = call i32 @_rl_backspace(i32 %5)
  store i32 0, i32* %i, align 4
  br label %for.cond3

for.cond3:                                        ; preds = %for.inc6, %for.end
  %6 = load i32, i32* %i, align 4
  %7 = load i32, i32* %l.addr, align 4
  %cmp4 = icmp slt i32 %6, %7
  br i1 %cmp4, label %for.body5, label %for.end8

for.body5:                                        ; preds = %for.cond3
  %8 = load %struct.line_state*, %struct.line_state** @line_state_visible, align 4
  %line = getelementptr inbounds %struct.line_state, %struct.line_state* %8, i32 0, i32 0
  %9 = load i8*, i8** %line, align 4
  %10 = load i32, i32* @_rl_last_c_pos, align 4
  %dec = add nsw i32 %10, -1
  store i32 %dec, i32* @_rl_last_c_pos, align 4
  %arrayidx = getelementptr inbounds i8, i8* %9, i32 %dec
  store i8 0, i8* %arrayidx, align 1
  br label %for.inc6

for.inc6:                                         ; preds = %for.body5
  %11 = load i32, i32* %i, align 4
  %inc7 = add nsw i32 %11, 1
  store i32 %inc7, i32* %i, align 4
  br label %for.cond3

for.end8:                                         ; preds = %for.cond3
  %12 = load i32, i32* @rl_display_fixed, align 4
  %inc9 = add nsw i32 %12, 1
  store i32 %inc9, i32* @rl_display_fixed, align 4
  ret void
}

; Function Attrs: noinline nounwind
define internal void @space_to_eol(i32 %count) #0 {
entry:
  %count.addr = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %1 = load i32, i32* %count.addr, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @rl_outstream, align 4
  %call = call i32 @putc(i32 32, %struct._IO_FILE* %2)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %3 = load i32, i32* %i, align 4
  %inc = add nsw i32 %3, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %4 = load i32, i32* %count.addr, align 4
  %5 = load i32, i32* @_rl_last_c_pos, align 4
  %add = add nsw i32 %5, %4
  store i32 %add, i32* @_rl_last_c_pos, align 4
  ret void
}

; Function Attrs: noinline nounwind
define void @_rl_clear_screen() #0 {
entry:
  %0 = load i8*, i8** @_rl_term_clrpag, align 4
  %tobool = icmp ne i8* %0, null
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** @_rl_term_clrpag, align 4
  %call = call i32 bitcast (i32 (...)* @tputs to i32 (i8*, i32, i32 (i32)*)*)(i8* %1, i32 1, i32 (i32)* @_rl_output_character_function)
  br label %if.end

if.else:                                          ; preds = %entry
  %call1 = call i32 @rl_crlf()
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void
}

declare i32 @rl_crlf() #1

; Function Attrs: noinline nounwind
define void @_rl_update_final() #0 {
entry:
  %full_lines = alloca i32, align 4
  %last_line = alloca i8*, align 4
  store i32 0, i32* %full_lines, align 4
  %0 = load i32, i32* @_rl_vis_botlin, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %1 = load i32, i32* @_rl_last_c_pos, align 4
  %cmp = icmp eq i32 %1, 0
  br i1 %cmp, label %land.lhs.true1, label %if.end

land.lhs.true1:                                   ; preds = %land.lhs.true
  %2 = load %struct.line_state*, %struct.line_state** @line_state_visible, align 4
  %line = getelementptr inbounds %struct.line_state, %struct.line_state* %2, i32 0, i32 0
  %3 = load i8*, i8** %line, align 4
  %4 = load %struct.line_state*, %struct.line_state** @line_state_visible, align 4
  %lbreaks = getelementptr inbounds %struct.line_state, %struct.line_state* %4, i32 0, i32 1
  %5 = load i32*, i32** %lbreaks, align 4
  %6 = load i32, i32* @_rl_vis_botlin, align 4
  %arrayidx = getelementptr inbounds i32, i32* %5, i32 %6
  %7 = load i32, i32* %arrayidx, align 4
  %arrayidx2 = getelementptr inbounds i8, i8* %3, i32 %7
  %8 = load i8, i8* %arrayidx2, align 1
  %conv = sext i8 %8 to i32
  %cmp3 = icmp eq i32 %conv, 0
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true1
  %9 = load i32, i32* @_rl_vis_botlin, align 4
  %dec = add nsw i32 %9, -1
  store i32 %dec, i32* @_rl_vis_botlin, align 4
  store i32 1, i32* %full_lines, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true1, %land.lhs.true, %entry
  %10 = load i32, i32* @_rl_vis_botlin, align 4
  call void @_rl_move_vert(i32 %10)
  %11 = load i32, i32* %full_lines, align 4
  %tobool5 = icmp ne i32 %11, 0
  br i1 %tobool5, label %land.lhs.true6, label %if.end26

land.lhs.true6:                                   ; preds = %if.end
  %12 = load i32, i32* @_rl_term_autowrap, align 4
  %tobool7 = icmp ne i32 %12, 0
  br i1 %tobool7, label %land.lhs.true8, label %if.end26

land.lhs.true8:                                   ; preds = %land.lhs.true6
  %13 = load i32, i32* @_rl_vis_botlin, align 4
  %14 = load i32, i32* @_rl_vis_botlin, align 4
  %cmp9 = icmp sgt i32 %13, %14
  br i1 %cmp9, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true8
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true8
  %15 = load %struct.line_state*, %struct.line_state** @line_state_visible, align 4
  %lbreaks11 = getelementptr inbounds %struct.line_state, %struct.line_state* %15, i32 0, i32 1
  %16 = load i32*, i32** %lbreaks11, align 4
  %17 = load i32, i32* @_rl_vis_botlin, align 4
  %add = add nsw i32 %17, 1
  %arrayidx12 = getelementptr inbounds i32, i32* %16, i32 %add
  %18 = load i32, i32* %arrayidx12, align 4
  %19 = load %struct.line_state*, %struct.line_state** @line_state_visible, align 4
  %lbreaks13 = getelementptr inbounds %struct.line_state, %struct.line_state* %19, i32 0, i32 1
  %20 = load i32*, i32** %lbreaks13, align 4
  %21 = load i32, i32* @_rl_vis_botlin, align 4
  %arrayidx14 = getelementptr inbounds i32, i32* %20, i32 %21
  %22 = load i32, i32* %arrayidx14, align 4
  %sub = sub nsw i32 %18, %22
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 0, %cond.true ], [ %sub, %cond.false ]
  %23 = load i32, i32* @_rl_screenwidth, align 4
  %cmp15 = icmp eq i32 %cond, %23
  br i1 %cmp15, label %if.then17, label %if.end26

if.then17:                                        ; preds = %cond.end
  %24 = load %struct.line_state*, %struct.line_state** @line_state_visible, align 4
  %line18 = getelementptr inbounds %struct.line_state, %struct.line_state* %24, i32 0, i32 0
  %25 = load i8*, i8** %line18, align 4
  %26 = load %struct.line_state*, %struct.line_state** @line_state_visible, align 4
  %lbreaks19 = getelementptr inbounds %struct.line_state, %struct.line_state* %26, i32 0, i32 1
  %27 = load i32*, i32** %lbreaks19, align 4
  %28 = load i32, i32* @_rl_vis_botlin, align 4
  %arrayidx20 = getelementptr inbounds i32, i32* %27, i32 %28
  %29 = load i32, i32* %arrayidx20, align 4
  %arrayidx21 = getelementptr inbounds i8, i8* %25, i32 %29
  store i8* %arrayidx21, i8** %last_line, align 4
  store i32 -1, i32* @cpos_buffer_position, align 4
  %30 = load i32, i32* @_rl_screenwidth, align 4
  %sub22 = sub nsw i32 %30, 1
  %31 = load i8*, i8** %last_line, align 4
  call void @_rl_move_cursor_relative(i32 %sub22, i8* %31)
  call void @_rl_clear_to_eol(i32 0)
  %32 = load i8*, i8** %last_line, align 4
  %33 = load i32, i32* @_rl_screenwidth, align 4
  %sub23 = sub nsw i32 %33, 1
  %arrayidx24 = getelementptr inbounds i8, i8* %32, i32 %sub23
  %34 = load i8, i8* %arrayidx24, align 1
  %conv25 = sext i8 %34 to i32
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @rl_outstream, align 4
  %call = call i32 @putc(i32 %conv25, %struct._IO_FILE* %35)
  br label %if.end26

if.end26:                                         ; preds = %if.then17, %cond.end, %land.lhs.true6, %if.end
  store i32 0, i32* @_rl_vis_botlin, align 4
  %call27 = call i32 @rl_crlf()
  %36 = load %struct._IO_FILE*, %struct._IO_FILE** @rl_outstream, align 4
  %call28 = call i32 @fflush(%struct._IO_FILE* %36)
  %37 = load i32, i32* @rl_display_fixed, align 4
  %inc = add nsw i32 %37, 1
  store i32 %inc, i32* @rl_display_fixed, align 4
  ret void
}

; Function Attrs: noinline nounwind
define void @_rl_redisplay_after_sigwinch() #0 {
entry:
  %t = alloca i8*, align 4
  %0 = load i8*, i8** @_rl_term_cr, align 4
  %tobool = icmp ne i8* %0, null
  br i1 %tobool, label %if.then, label %if.else7

if.then:                                          ; preds = %entry
  %1 = load i32, i32* @_rl_vis_botlin, align 4
  call void @_rl_move_vert(i32 %1)
  %2 = load i8*, i8** @_rl_term_cr, align 4
  %call = call i32 bitcast (i32 (...)* @tputs to i32 (i8*, i32, i32 (i32)*)*)(i8* %2, i32 1, i32 (i32)* @_rl_output_character_function)
  store i32 0, i32* @_rl_last_c_pos, align 4
  %3 = load i8*, i8** @_rl_term_clreol, align 4
  %tobool1 = icmp ne i8* %3, null
  br i1 %tobool1, label %if.then2, label %if.else

if.then2:                                         ; preds = %if.then
  %4 = load i8*, i8** @_rl_term_clreol, align 4
  %call3 = call i32 bitcast (i32 (...)* @tputs to i32 (i8*, i32, i32 (i32)*)*)(i8* %4, i32 1, i32 (i32)* @_rl_output_character_function)
  br label %if.end

if.else:                                          ; preds = %if.then
  %5 = load i32, i32* @_rl_screenwidth, align 4
  call void @space_to_eol(i32 %5)
  %6 = load i8*, i8** @_rl_term_cr, align 4
  %call4 = call i32 bitcast (i32 (...)* @tputs to i32 (i8*, i32, i32 (i32)*)*)(i8* %6, i32 1, i32 (i32)* @_rl_output_character_function)
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then2
  %7 = load i32, i32* @_rl_last_v_pos, align 4
  %cmp = icmp sgt i32 %7, 0
  br i1 %cmp, label %if.then5, label %if.end6

if.then5:                                         ; preds = %if.end
  call void @_rl_move_vert(i32 0)
  br label %if.end6

if.end6:                                          ; preds = %if.then5, %if.end
  br label %if.end9

if.else7:                                         ; preds = %entry
  %call8 = call i32 @rl_crlf()
  br label %if.end9

if.end9:                                          ; preds = %if.else7, %if.end6
  %8 = load i8*, i8** @rl_display_prompt, align 4
  %call10 = call i8* @strrchr(i8* %8, i32 10)
  store i8* %call10, i8** %t, align 4
  %9 = load i8*, i8** %t, align 4
  %tobool11 = icmp ne i8* %9, null
  br i1 %tobool11, label %if.then12, label %if.else13

if.then12:                                        ; preds = %if.end9
  %10 = load i8*, i8** %t, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %10, i32 1
  store i8* %incdec.ptr, i8** %t, align 4
  call void @redraw_prompt(i8* %incdec.ptr)
  br label %if.end15

if.else13:                                        ; preds = %if.end9
  %call14 = call i32 @rl_forced_update_display()
  br label %if.end15

if.end15:                                         ; preds = %if.else13, %if.then12
  ret void
}

; Function Attrs: noinline nounwind
define void @_rl_clean_up_for_exit() #0 {
entry:
  %0 = load i32, i32* @_rl_echoing_p, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.end3

if.then:                                          ; preds = %entry
  %1 = load i32, i32* @_rl_vis_botlin, align 4
  %cmp = icmp sgt i32 %1, 0
  br i1 %cmp, label %if.then1, label %if.end

if.then1:                                         ; preds = %if.then
  %2 = load i32, i32* @_rl_vis_botlin, align 4
  call void @_rl_move_vert(i32 %2)
  br label %if.end

if.end:                                           ; preds = %if.then1, %if.then
  store i32 0, i32* @_rl_vis_botlin, align 4
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @rl_outstream, align 4
  %call = call i32 @fflush(%struct._IO_FILE* %3)
  %call2 = call i32 @rl_restart_output(i32 1, i32 0)
  br label %if.end3

if.end3:                                          ; preds = %if.end, %entry
  ret void
}

declare i32 @rl_restart_output(i32, i32) #1

; Function Attrs: noinline nounwind
define void @_rl_erase_entire_line() #0 {
entry:
  call void @cr()
  call void @_rl_clear_to_eol(i32 0)
  call void @cr()
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @rl_outstream, align 4
  %call = call i32 @fflush(%struct._IO_FILE* %0)
  ret void
}

; Function Attrs: noinline nounwind
define void @_rl_ttyflush() #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @rl_outstream, align 4
  %call = call i32 @fflush(%struct._IO_FILE* %0)
  ret void
}

; Function Attrs: noinline nounwind
define i32 @_rl_current_display_line() #0 {
entry:
  %ret = alloca i32, align 4
  %nleft = alloca i32, align 4
  %0 = load i8*, i8** @rl_display_prompt, align 4
  %1 = load i8*, i8** @rl_prompt, align 4
  %cmp = icmp eq i8* %0, %1
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %2 = load i32, i32* @_rl_last_c_pos, align 4
  %3 = load i32, i32* @_rl_screenwidth, align 4
  %sub = sub nsw i32 %2, %3
  %4 = load i32, i32* @rl_visible_prompt_length, align 4
  %sub1 = sub nsw i32 %sub, %4
  store i32 %sub1, i32* %nleft, align 4
  br label %if.end

if.else:                                          ; preds = %entry
  %5 = load i32, i32* @_rl_last_c_pos, align 4
  %6 = load i32, i32* @_rl_screenwidth, align 4
  %sub2 = sub nsw i32 %5, %6
  store i32 %sub2, i32* %nleft, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %7 = load i32, i32* %nleft, align 4
  %cmp3 = icmp sgt i32 %7, 0
  br i1 %cmp3, label %if.then4, label %if.else5

if.then4:                                         ; preds = %if.end
  %8 = load i32, i32* %nleft, align 4
  %9 = load i32, i32* @_rl_screenwidth, align 4
  %div = sdiv i32 %8, %9
  %add = add nsw i32 1, %div
  store i32 %add, i32* %ret, align 4
  br label %if.end6

if.else5:                                         ; preds = %if.end
  store i32 0, i32* %ret, align 4
  br label %if.end6

if.end6:                                          ; preds = %if.else5, %if.then4
  %10 = load i32, i32* %ret, align 4
  ret i32 %10
}

; Function Attrs: noinline nounwind
define internal i8* @prompt_modestr(i32* %lenp) #0 {
entry:
  %retval = alloca i8*, align 4
  %lenp.addr = alloca i32*, align 4
  store i32* %lenp, i32** %lenp.addr, align 4
  %0 = load i32, i32* @rl_editing_mode, align 4
  %cmp = icmp eq i32 %0, 1
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %1 = load i32*, i32** %lenp.addr, align 4
  %tobool = icmp ne i32* %1, null
  br i1 %tobool, label %if.then1, label %if.end

if.then1:                                         ; preds = %if.then
  %2 = load i8*, i8** @_rl_emacs_mode_str, align 4
  %tobool2 = icmp ne i8* %2, null
  br i1 %tobool2, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then1
  %3 = load i32, i32* @_rl_emacs_modestr_len, align 4
  br label %cond.end

cond.false:                                       ; preds = %if.then1
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %3, %cond.true ], [ 1, %cond.false ]
  %4 = load i32*, i32** %lenp.addr, align 4
  store i32 %cond, i32* %4, align 4
  br label %if.end

if.end:                                           ; preds = %cond.end, %if.then
  %5 = load i8*, i8** @_rl_emacs_mode_str, align 4
  %tobool3 = icmp ne i8* %5, null
  br i1 %tobool3, label %cond.true4, label %cond.false5

cond.true4:                                       ; preds = %if.end
  %6 = load i8*, i8** @_rl_emacs_mode_str, align 4
  br label %cond.end6

cond.false5:                                      ; preds = %if.end
  br label %cond.end6

cond.end6:                                        ; preds = %cond.false5, %cond.true4
  %cond7 = phi i8* [ %6, %cond.true4 ], [ getelementptr inbounds ([2 x i8], [2 x i8]* @.str.6, i32 0, i32 0), %cond.false5 ]
  store i8* %cond7, i8** %retval, align 4
  br label %return

if.else:                                          ; preds = %entry
  %7 = load %struct._keymap_entry*, %struct._keymap_entry** @_rl_keymap, align 4
  %cmp8 = icmp eq %struct._keymap_entry* %7, getelementptr inbounds ([257 x %struct._keymap_entry], [257 x %struct._keymap_entry]* @vi_insertion_keymap, i32 0, i32 0)
  br i1 %cmp8, label %if.then9, label %if.else23

if.then9:                                         ; preds = %if.else
  %8 = load i32*, i32** %lenp.addr, align 4
  %tobool10 = icmp ne i32* %8, null
  br i1 %tobool10, label %if.then11, label %if.end17

if.then11:                                        ; preds = %if.then9
  %9 = load i8*, i8** @_rl_vi_ins_mode_str, align 4
  %tobool12 = icmp ne i8* %9, null
  br i1 %tobool12, label %cond.true13, label %cond.false14

cond.true13:                                      ; preds = %if.then11
  %10 = load i32, i32* @_rl_vi_ins_modestr_len, align 4
  br label %cond.end15

cond.false14:                                     ; preds = %if.then11
  br label %cond.end15

cond.end15:                                       ; preds = %cond.false14, %cond.true13
  %cond16 = phi i32 [ %10, %cond.true13 ], [ 5, %cond.false14 ]
  %11 = load i32*, i32** %lenp.addr, align 4
  store i32 %cond16, i32* %11, align 4
  br label %if.end17

if.end17:                                         ; preds = %cond.end15, %if.then9
  %12 = load i8*, i8** @_rl_vi_ins_mode_str, align 4
  %tobool18 = icmp ne i8* %12, null
  br i1 %tobool18, label %cond.true19, label %cond.false20

cond.true19:                                      ; preds = %if.end17
  %13 = load i8*, i8** @_rl_vi_ins_mode_str, align 4
  br label %cond.end21

cond.false20:                                     ; preds = %if.end17
  br label %cond.end21

cond.end21:                                       ; preds = %cond.false20, %cond.true19
  %cond22 = phi i8* [ %13, %cond.true19 ], [ getelementptr inbounds ([6 x i8], [6 x i8]* @.str.7, i32 0, i32 0), %cond.false20 ]
  store i8* %cond22, i8** %retval, align 4
  br label %return

if.else23:                                        ; preds = %if.else
  %14 = load i32*, i32** %lenp.addr, align 4
  %tobool24 = icmp ne i32* %14, null
  br i1 %tobool24, label %if.then25, label %if.end31

if.then25:                                        ; preds = %if.else23
  %15 = load i8*, i8** @_rl_vi_cmd_mode_str, align 4
  %tobool26 = icmp ne i8* %15, null
  br i1 %tobool26, label %cond.true27, label %cond.false28

cond.true27:                                      ; preds = %if.then25
  %16 = load i32, i32* @_rl_vi_cmd_modestr_len, align 4
  br label %cond.end29

cond.false28:                                     ; preds = %if.then25
  br label %cond.end29

cond.end29:                                       ; preds = %cond.false28, %cond.true27
  %cond30 = phi i32 [ %16, %cond.true27 ], [ 5, %cond.false28 ]
  %17 = load i32*, i32** %lenp.addr, align 4
  store i32 %cond30, i32* %17, align 4
  br label %if.end31

if.end31:                                         ; preds = %cond.end29, %if.else23
  %18 = load i8*, i8** @_rl_vi_cmd_mode_str, align 4
  %tobool32 = icmp ne i8* %18, null
  br i1 %tobool32, label %cond.true33, label %cond.false34

cond.true33:                                      ; preds = %if.end31
  %19 = load i8*, i8** @_rl_vi_cmd_mode_str, align 4
  br label %cond.end35

cond.false34:                                     ; preds = %if.end31
  br label %cond.end35

cond.end35:                                       ; preds = %cond.false34, %cond.true33
  %cond36 = phi i8* [ %19, %cond.true33 ], [ getelementptr inbounds ([6 x i8], [6 x i8]* @.str.8, i32 0, i32 0), %cond.false34 ]
  store i8* %cond36, i8** %retval, align 4
  br label %return

return:                                           ; preds = %cond.end35, %cond.end21, %cond.end6
  %20 = load i8*, i8** %retval, align 4
  ret i8* %20
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* nocapture writeonly, i8* nocapture readonly, i32, i32, i1) #2

declare i8* @strchr(i8*, i32) #1

declare i32 @wcwidth(i32) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memmove.p0i8.p0i8.i32(i8* nocapture, i8* nocapture readonly, i32, i32, i1) #2

declare i32 @strncmp(i8*, i8*, i32) #1

declare i32 @_rl_compare_chars(i8*, i32, %struct.__mbstate_t*, i8*, i32, %struct.__mbstate_t*) #1

; Function Attrs: noinline nounwind
define internal void @open_some_spaces(i32 %col) #0 {
entry:
  %col.addr = alloca i32, align 4
  %buffer = alloca i8*, align 4
  %i = alloca i32, align 4
  store i32 %col, i32* %col.addr, align 4
  %0 = load i8*, i8** @_rl_term_IC, align 4
  %tobool = icmp ne i8* %0, null
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** @_rl_term_IC, align 4
  %2 = load i32, i32* %col.addr, align 4
  %call = call i8* bitcast (i8* (...)* @tgoto to i8* (i8*, i32, i32)*)(i8* %1, i32 0, i32 %2)
  store i8* %call, i8** %buffer, align 4
  %3 = load i8*, i8** %buffer, align 4
  %call1 = call i32 bitcast (i32 (...)* @tputs to i32 (i8*, i32, i32 (i32)*)*)(i8* %3, i32 1, i32 (i32)* @_rl_output_character_function)
  br label %if.end29

if.else:                                          ; preds = %entry
  %4 = load i8*, i8** @_rl_term_im, align 4
  %tobool2 = icmp ne i8* %4, null
  br i1 %tobool2, label %land.lhs.true, label %if.else15

land.lhs.true:                                    ; preds = %if.else
  %5 = load i8*, i8** @_rl_term_im, align 4
  %6 = load i8, i8* %5, align 1
  %conv = sext i8 %6 to i32
  %tobool3 = icmp ne i32 %conv, 0
  br i1 %tobool3, label %if.then4, label %if.else15

if.then4:                                         ; preds = %land.lhs.true
  %7 = load i8*, i8** @_rl_term_im, align 4
  %call5 = call i32 bitcast (i32 (...)* @tputs to i32 (i8*, i32, i32 (i32)*)*)(i8* %7, i32 1, i32 (i32)* @_rl_output_character_function)
  %8 = load i32, i32* %col.addr, align 4
  store i32 %8, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.body, %if.then4
  %9 = load i32, i32* %i, align 4
  %dec = add nsw i32 %9, -1
  store i32 %dec, i32* %i, align 4
  %tobool6 = icmp ne i32 %9, 0
  br i1 %tobool6, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %call7 = call i32 @_rl_output_character_function(i32 32)
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %10 = load i8*, i8** @_rl_term_ei, align 4
  %tobool8 = icmp ne i8* %10, null
  br i1 %tobool8, label %land.lhs.true9, label %if.end

land.lhs.true9:                                   ; preds = %for.end
  %11 = load i8*, i8** @_rl_term_ei, align 4
  %12 = load i8, i8* %11, align 1
  %conv10 = sext i8 %12 to i32
  %tobool11 = icmp ne i32 %conv10, 0
  br i1 %tobool11, label %if.then12, label %if.end

if.then12:                                        ; preds = %land.lhs.true9
  %13 = load i8*, i8** @_rl_term_ei, align 4
  %call13 = call i32 bitcast (i32 (...)* @tputs to i32 (i8*, i32, i32 (i32)*)*)(i8* %13, i32 1, i32 (i32)* @_rl_output_character_function)
  br label %if.end

if.end:                                           ; preds = %if.then12, %land.lhs.true9, %for.end
  %14 = load i32, i32* %col.addr, align 4
  %call14 = call i32 @_rl_backspace(i32 %14)
  br label %if.end28

if.else15:                                        ; preds = %land.lhs.true, %if.else
  %15 = load i8*, i8** @_rl_term_ic, align 4
  %tobool16 = icmp ne i8* %15, null
  br i1 %tobool16, label %land.lhs.true17, label %if.end27

land.lhs.true17:                                  ; preds = %if.else15
  %16 = load i8*, i8** @_rl_term_ic, align 4
  %17 = load i8, i8* %16, align 1
  %conv18 = sext i8 %17 to i32
  %tobool19 = icmp ne i32 %conv18, 0
  br i1 %tobool19, label %if.then20, label %if.end27

if.then20:                                        ; preds = %land.lhs.true17
  %18 = load i32, i32* %col.addr, align 4
  store i32 %18, i32* %i, align 4
  br label %for.cond21

for.cond21:                                       ; preds = %for.body24, %if.then20
  %19 = load i32, i32* %i, align 4
  %dec22 = add nsw i32 %19, -1
  store i32 %dec22, i32* %i, align 4
  %tobool23 = icmp ne i32 %19, 0
  br i1 %tobool23, label %for.body24, label %for.end26

for.body24:                                       ; preds = %for.cond21
  %20 = load i8*, i8** @_rl_term_ic, align 4
  %call25 = call i32 bitcast (i32 (...)* @tputs to i32 (i8*, i32, i32 (i32)*)*)(i8* %20, i32 1, i32 (i32)* @_rl_output_character_function)
  br label %for.cond21

for.end26:                                        ; preds = %for.cond21
  br label %if.end27

if.end27:                                         ; preds = %for.end26, %land.lhs.true17, %if.else15
  br label %if.end28

if.end28:                                         ; preds = %if.end27, %if.end
  br label %if.end29

if.end29:                                         ; preds = %if.end28, %if.then
  ret void
}

; Function Attrs: noinline nounwind
define internal void @delete_chars(i32 %count) #0 {
entry:
  %count.addr = alloca i32, align 4
  %buffer = alloca i8*, align 4
  store i32 %count, i32* %count.addr, align 4
  %0 = load i32, i32* %count.addr, align 4
  %1 = load i32, i32* @_rl_screenwidth, align 4
  %cmp = icmp sgt i32 %0, %1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %if.end12

if.end:                                           ; preds = %entry
  %2 = load i8*, i8** @_rl_term_DC, align 4
  %tobool = icmp ne i8* %2, null
  br i1 %tobool, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %if.end
  %3 = load i8*, i8** @_rl_term_DC, align 4
  %4 = load i8, i8* %3, align 1
  %conv = sext i8 %4 to i32
  %tobool1 = icmp ne i32 %conv, 0
  br i1 %tobool1, label %if.then2, label %if.else

if.then2:                                         ; preds = %land.lhs.true
  %5 = load i8*, i8** @_rl_term_DC, align 4
  %6 = load i32, i32* %count.addr, align 4
  %7 = load i32, i32* %count.addr, align 4
  %call = call i8* bitcast (i8* (...)* @tgoto to i8* (i8*, i32, i32)*)(i8* %5, i32 %6, i32 %7)
  store i8* %call, i8** %buffer, align 4
  %8 = load i8*, i8** %buffer, align 4
  %9 = load i32, i32* %count.addr, align 4
  %call3 = call i32 bitcast (i32 (...)* @tputs to i32 (i8*, i32, i32 (i32)*)*)(i8* %8, i32 %9, i32 (i32)* @_rl_output_character_function)
  br label %if.end12

if.else:                                          ; preds = %land.lhs.true, %if.end
  %10 = load i8*, i8** @_rl_term_dc, align 4
  %tobool4 = icmp ne i8* %10, null
  br i1 %tobool4, label %land.lhs.true5, label %if.end11

land.lhs.true5:                                   ; preds = %if.else
  %11 = load i8*, i8** @_rl_term_dc, align 4
  %12 = load i8, i8* %11, align 1
  %conv6 = sext i8 %12 to i32
  %tobool7 = icmp ne i32 %conv6, 0
  br i1 %tobool7, label %if.then8, label %if.end11

if.then8:                                         ; preds = %land.lhs.true5
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.then8
  %13 = load i32, i32* %count.addr, align 4
  %dec = add nsw i32 %13, -1
  store i32 %dec, i32* %count.addr, align 4
  %tobool9 = icmp ne i32 %13, 0
  br i1 %tobool9, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %14 = load i8*, i8** @_rl_term_dc, align 4
  %call10 = call i32 bitcast (i32 (...)* @tputs to i32 (i8*, i32, i32 (i32)*)*)(i8* %14, i32 1, i32 (i32)* @_rl_output_character_function)
  br label %while.cond

while.end:                                        ; preds = %while.cond
  br label %if.end11

if.end11:                                         ; preds = %while.end, %land.lhs.true5, %if.else
  br label %if.end12

if.end12:                                         ; preds = %if.then, %if.end11, %if.then2
  ret void
}

declare i8* @tgoto(...) #1

declare i32 @mbrlen(i8*, i32, %struct.__mbstate_t*) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }
attributes #3 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
