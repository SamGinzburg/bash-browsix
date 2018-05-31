; ModuleID = 'callback.c'
source_filename = "callback.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.__rl_callback_generic_arg = type { i32, i32, i32 }
%struct.__jmp_buf_tag = type { [6 x i32], i32, [32 x i32] }
%struct.__rl_search_context = type { i32, i32, i8*, i32, i32, i8**, i8*, i32, i32, i32, i32, i32, i32, i8*, %struct.undo_list*, %struct._keymap_entry*, %struct._keymap_entry*, i32, i32, i32, i32, [16 x i8], [16 x i8], i8*, i32, i32, i8* }
%struct.undo_list = type { %struct.undo_list*, i32, i32, i8*, i32 }
%struct._keymap_entry = type { i8, i32 (i32, i32)* }
%struct.__rl_vimotion_context = type { i32, i32, i32, i32, i32, i32, i32, i32, i32 }
%struct.__rl_keyseq_context = type { i32, i32, i32, i32, %struct._keymap_entry*, %struct._keymap_entry*, %struct.__rl_keyseq_context*, i32 }

@_rl_callback_func = global i32 (%struct.__rl_callback_generic_arg*)* null, align 4
@_rl_callback_data = global %struct.__rl_callback_generic_arg* null, align 4
@rl_persistent_signal_handlers = global i32 0, align 4
@rl_readline_state = external global i32, align 4
@rl_linefunc = common global void (i8*)* null, align 4
@rl_callback_read_char.olevel = internal global [1 x %struct.__jmp_buf_tag] zeroinitializer, align 4
@.str = private unnamed_addr constant [54 x i8] c"readline_callback_read_char() called with no handler!\00", align 1
@_rl_top_level = external global [1 x %struct.__jmp_buf_tag], align 4
@rl_redisplay_function = external global void ()*, align 4
@_rl_want_redisplay = external global i32, align 4
@_rl_caught_signal = external global i32, align 4
@_rl_iscxt = external global %struct.__rl_search_context*, align 4
@_rl_nscxt = external global %struct.__rl_search_context*, align 4
@_rl_vimvcxt = external global %struct.__rl_vimotion_context*, align 4
@_rl_argcxt = external global i32, align 4
@_rl_kscxt = external global %struct.__rl_keyseq_context*, align 4
@rl_done = external global i32, align 4
@rl_deprep_term_function = external global void ()*, align 4
@in_handler = internal global i32 0, align 4
@rl_line_buffer = external global i8*, align 4
@rl_pending_input = external global i32, align 4
@rl_prep_term_function = external global void (i32)*, align 4
@_rl_meta_flag = external global i32, align 4

; Function Attrs: noinline nounwind
define void @rl_callback_handler_install(i8* %prompt, void (i8*)* %linefunc) #0 {
entry:
  %prompt.addr = alloca i8*, align 4
  %linefunc.addr = alloca void (i8*)*, align 4
  store i8* %prompt, i8** %prompt.addr, align 4
  store void (i8*)* %linefunc, void (i8*)** %linefunc.addr, align 4
  %0 = load i8*, i8** %prompt.addr, align 4
  %call = call i32 @rl_set_prompt(i8* %0)
  %1 = load i32, i32* @rl_readline_state, align 4
  %or = or i32 %1, 524288
  store i32 %or, i32* @rl_readline_state, align 4
  %2 = load void (i8*)*, void (i8*)** %linefunc.addr, align 4
  store void (i8*)* %2, void (i8*)** @rl_linefunc, align 4
  call void @_rl_callback_newline()
  ret void
}

declare i32 @rl_set_prompt(i8*) #1

; Function Attrs: noinline nounwind
define void @rl_callback_read_char() #0 {
entry:
  %line = alloca i8*, align 4
  %eof = alloca i32, align 4
  %jcode = alloca i32, align 4
  %k = alloca i32, align 4
  %0 = load void (i8*)*, void (i8*)** @rl_linefunc, align 4
  %cmp = icmp eq void (i8*)* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void (i8*, ...) @_rl_errmsg(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str, i32 0, i32 0))
  call void @abort() #5
  unreachable

if.end:                                           ; preds = %entry
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* bitcast ([1 x %struct.__jmp_buf_tag]* @rl_callback_read_char.olevel to i8*), i8* bitcast ([1 x %struct.__jmp_buf_tag]* @_rl_top_level to i8*), i32 156, i32 1, i1 false)
  %call = call i32 @setjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* @_rl_top_level, i32 0, i32 0)) #6
  store i32 %call, i32* %jcode, align 4
  %1 = load i32, i32* %jcode, align 4
  %tobool = icmp ne i32 %1, 0
  br i1 %tobool, label %if.then1, label %if.end6

if.then1:                                         ; preds = %if.end
  %2 = load void ()*, void ()** @rl_redisplay_function, align 4
  call void %2()
  store i32 0, i32* @_rl_want_redisplay, align 4
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* bitcast ([1 x %struct.__jmp_buf_tag]* @_rl_top_level to i8*), i8* bitcast ([1 x %struct.__jmp_buf_tag]* @rl_callback_read_char.olevel to i8*), i32 156, i32 1, i1 false)
  br label %do.body

do.body:                                          ; preds = %if.then1
  %3 = load i32, i32* @rl_persistent_signal_handlers, align 4
  %cmp2 = icmp eq i32 %3, 0
  br i1 %cmp2, label %if.then3, label %if.end5

if.then3:                                         ; preds = %do.body
  %call4 = call i32 @rl_clear_signals()
  br label %if.end5

if.end5:                                          ; preds = %if.then3, %do.body
  br label %do.end183

do.end:                                           ; No predecessors!
  br label %if.end6

if.end6:                                          ; preds = %do.end, %if.end
  %4 = load i32, i32* @rl_persistent_signal_handlers, align 4
  %cmp7 = icmp eq i32 %4, 0
  br i1 %cmp7, label %if.then8, label %if.end10

if.then8:                                         ; preds = %if.end6
  %call9 = call i32 @rl_set_signals()
  br label %if.end10

if.end10:                                         ; preds = %if.then8, %if.end6
  br label %do.body11

do.body11:                                        ; preds = %lor.end, %if.end10
  br label %do.body12

do.body12:                                        ; preds = %do.body11
  %5 = load volatile i32, i32* @_rl_caught_signal, align 4
  %tobool13 = icmp ne i32 %5, 0
  br i1 %tobool13, label %if.then14, label %if.end15

if.then14:                                        ; preds = %do.body12
  %6 = load volatile i32, i32* @_rl_caught_signal, align 4
  call void @_rl_signal_handler(i32 %6)
  br label %if.end15

if.end15:                                         ; preds = %if.then14, %do.body12
  br label %do.end16

do.end16:                                         ; preds = %if.end15
  %7 = load i32, i32* @rl_readline_state, align 4
  %and = and i32 %7, 128
  %tobool17 = icmp ne i32 %and, 0
  br i1 %tobool17, label %if.then18, label %if.else

if.then18:                                        ; preds = %do.end16
  %8 = load %struct.__rl_search_context*, %struct.__rl_search_context** @_rl_iscxt, align 4
  %call19 = call i32 @_rl_isearch_callback(%struct.__rl_search_context* %8)
  store i32 %call19, i32* %eof, align 4
  %9 = load i32, i32* %eof, align 4
  %cmp20 = icmp eq i32 %9, 0
  br i1 %cmp20, label %land.lhs.true, label %if.end27

land.lhs.true:                                    ; preds = %if.then18
  %10 = load i32, i32* @rl_readline_state, align 4
  %and21 = and i32 %10, 128
  %cmp22 = icmp eq i32 %and21, 0
  br i1 %cmp22, label %land.lhs.true23, label %if.end27

land.lhs.true23:                                  ; preds = %land.lhs.true
  %11 = load i32, i32* @rl_readline_state, align 4
  %and24 = and i32 %11, 131072
  %tobool25 = icmp ne i32 %and24, 0
  br i1 %tobool25, label %if.then26, label %if.end27

if.then26:                                        ; preds = %land.lhs.true23
  call void @rl_callback_read_char()
  br label %if.end27

if.end27:                                         ; preds = %if.then26, %land.lhs.true23, %land.lhs.true, %if.then18
  br label %do.body28

do.body28:                                        ; preds = %if.end27
  %12 = load i32, i32* @rl_persistent_signal_handlers, align 4
  %cmp29 = icmp eq i32 %12, 0
  br i1 %cmp29, label %if.then30, label %if.end32

if.then30:                                        ; preds = %do.body28
  %call31 = call i32 @rl_clear_signals()
  br label %if.end32

if.end32:                                         ; preds = %if.then30, %do.body28
  br label %do.end183

do.end33:                                         ; No predecessors!
  br label %if.end143

if.else:                                          ; preds = %do.end16
  %13 = load i32, i32* @rl_readline_state, align 4
  %and34 = and i32 %13, 256
  %tobool35 = icmp ne i32 %and34, 0
  br i1 %tobool35, label %if.then36, label %if.else44

if.then36:                                        ; preds = %if.else
  %14 = load %struct.__rl_search_context*, %struct.__rl_search_context** @_rl_nscxt, align 4
  %call37 = call i32 @_rl_nsearch_callback(%struct.__rl_search_context* %14)
  store i32 %call37, i32* %eof, align 4
  br label %do.body38

do.body38:                                        ; preds = %if.then36
  %15 = load i32, i32* @rl_persistent_signal_handlers, align 4
  %cmp39 = icmp eq i32 %15, 0
  br i1 %cmp39, label %if.then40, label %if.end42

if.then40:                                        ; preds = %do.body38
  %call41 = call i32 @rl_clear_signals()
  br label %if.end42

if.end42:                                         ; preds = %if.then40, %do.body38
  br label %do.end183

do.end43:                                         ; No predecessors!
  br label %if.end142

if.else44:                                        ; preds = %if.else
  %16 = load i32, i32* @rl_readline_state, align 4
  %and45 = and i32 %16, 8388608
  %tobool46 = icmp ne i32 %and45, 0
  br i1 %tobool46, label %if.then47, label %if.else66

if.then47:                                        ; preds = %if.else44
  %17 = load %struct.__rl_callback_generic_arg*, %struct.__rl_callback_generic_arg** @_rl_callback_data, align 4
  %i2 = getelementptr inbounds %struct.__rl_callback_generic_arg, %struct.__rl_callback_generic_arg* %17, i32 0, i32 2
  %18 = load i32, i32* %i2, align 4
  store i32 %18, i32* %k, align 4
  %19 = load i32 (%struct.__rl_callback_generic_arg*)*, i32 (%struct.__rl_callback_generic_arg*)** @_rl_callback_func, align 4
  %20 = load %struct.__rl_callback_generic_arg*, %struct.__rl_callback_generic_arg** @_rl_callback_data, align 4
  %call48 = call i32 %19(%struct.__rl_callback_generic_arg* %20)
  store i32 %call48, i32* %eof, align 4
  %21 = load i32 (%struct.__rl_callback_generic_arg*)*, i32 (%struct.__rl_callback_generic_arg*)** @_rl_callback_func, align 4
  %cmp49 = icmp eq i32 (%struct.__rl_callback_generic_arg*)* %21, null
  br i1 %cmp49, label %if.then50, label %if.end54

if.then50:                                        ; preds = %if.then47
  %22 = load %struct.__rl_callback_generic_arg*, %struct.__rl_callback_generic_arg** @_rl_callback_data, align 4
  %tobool51 = icmp ne %struct.__rl_callback_generic_arg* %22, null
  br i1 %tobool51, label %if.then52, label %if.end53

if.then52:                                        ; preds = %if.then50
  %23 = load %struct.__rl_callback_generic_arg*, %struct.__rl_callback_generic_arg** @_rl_callback_data, align 4
  call void @_rl_callback_data_dispose(%struct.__rl_callback_generic_arg* %23)
  store %struct.__rl_callback_generic_arg* null, %struct.__rl_callback_generic_arg** @_rl_callback_data, align 4
  br label %if.end53

if.end53:                                         ; preds = %if.then52, %if.then50
  br label %if.end54

if.end54:                                         ; preds = %if.end53, %if.then47
  %24 = load i32, i32* @rl_readline_state, align 4
  %and55 = and i32 %24, 1048576
  %tobool56 = icmp ne i32 %and55, 0
  br i1 %tobool56, label %if.then57, label %if.end65

if.then57:                                        ; preds = %if.end54
  %25 = load i32, i32* %k, align 4
  %26 = load %struct.__rl_vimotion_context*, %struct.__rl_vimotion_context** @_rl_vimvcxt, align 4
  %call58 = call i32 @_rl_vi_domove_motion_cleanup(i32 %25, %struct.__rl_vimotion_context* %26)
  call void @_rl_internal_char_cleanup()
  br label %do.body59

do.body59:                                        ; preds = %if.then57
  %27 = load i32, i32* @rl_persistent_signal_handlers, align 4
  %cmp60 = icmp eq i32 %27, 0
  br i1 %cmp60, label %if.then61, label %if.end63

if.then61:                                        ; preds = %do.body59
  %call62 = call i32 @rl_clear_signals()
  br label %if.end63

if.end63:                                         ; preds = %if.then61, %do.body59
  br label %do.end183

do.end64:                                         ; No predecessors!
  br label %if.end65

if.end65:                                         ; preds = %do.end64, %if.end54
  call void @_rl_internal_char_cleanup()
  br label %if.end141

if.else66:                                        ; preds = %if.else44
  %28 = load i32, i32* @rl_readline_state, align 4
  %and67 = and i32 %28, 1048576
  %tobool68 = icmp ne i32 %and67, 0
  br i1 %tobool68, label %if.then69, label %if.else81

if.then69:                                        ; preds = %if.else66
  %29 = load %struct.__rl_vimotion_context*, %struct.__rl_vimotion_context** @_rl_vimvcxt, align 4
  %call70 = call i32 @_rl_vi_domove_callback(%struct.__rl_vimotion_context* %29)
  store i32 %call70, i32* %eof, align 4
  %30 = load i32, i32* @rl_readline_state, align 4
  %and71 = and i32 %30, 1024
  %cmp72 = icmp eq i32 %and71, 0
  br i1 %cmp72, label %if.then73, label %if.end74

if.then73:                                        ; preds = %if.then69
  call void @_rl_internal_char_cleanup()
  br label %if.end74

if.end74:                                         ; preds = %if.then73, %if.then69
  br label %do.body75

do.body75:                                        ; preds = %if.end74
  %31 = load i32, i32* @rl_persistent_signal_handlers, align 4
  %cmp76 = icmp eq i32 %31, 0
  br i1 %cmp76, label %if.then77, label %if.end79

if.then77:                                        ; preds = %do.body75
  %call78 = call i32 @rl_clear_signals()
  br label %if.end79

if.end79:                                         ; preds = %if.then77, %do.body75
  br label %do.end183

do.end80:                                         ; No predecessors!
  br label %if.end140

if.else81:                                        ; preds = %if.else66
  %32 = load i32, i32* @rl_readline_state, align 4
  %and82 = and i32 %32, 1024
  %tobool83 = icmp ne i32 %and82, 0
  br i1 %tobool83, label %if.then84, label %if.else106

if.then84:                                        ; preds = %if.else81
  %33 = load i32, i32* @_rl_argcxt, align 4
  %call85 = call i32 @_rl_arg_callback(i32 %33)
  store i32 %call85, i32* %eof, align 4
  %34 = load i32, i32* %eof, align 4
  %cmp86 = icmp eq i32 %34, 0
  br i1 %cmp86, label %land.lhs.true87, label %if.else94

land.lhs.true87:                                  ; preds = %if.then84
  %35 = load i32, i32* @rl_readline_state, align 4
  %and88 = and i32 %35, 1024
  %cmp89 = icmp eq i32 %and88, 0
  br i1 %cmp89, label %land.lhs.true90, label %if.else94

land.lhs.true90:                                  ; preds = %land.lhs.true87
  %36 = load i32, i32* @rl_readline_state, align 4
  %and91 = and i32 %36, 131072
  %tobool92 = icmp ne i32 %and91, 0
  br i1 %tobool92, label %if.then93, label %if.else94

if.then93:                                        ; preds = %land.lhs.true90
  call void @rl_callback_read_char()
  br label %if.end99

if.else94:                                        ; preds = %land.lhs.true90, %land.lhs.true87, %if.then84
  %37 = load i32, i32* @rl_readline_state, align 4
  %and95 = and i32 %37, 1024
  %cmp96 = icmp eq i32 %and95, 0
  br i1 %cmp96, label %if.then97, label %if.end98

if.then97:                                        ; preds = %if.else94
  call void @_rl_internal_char_cleanup()
  br label %if.end98

if.end98:                                         ; preds = %if.then97, %if.else94
  br label %if.end99

if.end99:                                         ; preds = %if.end98, %if.then93
  br label %do.body100

do.body100:                                       ; preds = %if.end99
  %38 = load i32, i32* @rl_persistent_signal_handlers, align 4
  %cmp101 = icmp eq i32 %38, 0
  br i1 %cmp101, label %if.then102, label %if.end104

if.then102:                                       ; preds = %do.body100
  %call103 = call i32 @rl_clear_signals()
  br label %if.end104

if.end104:                                        ; preds = %if.then102, %do.body100
  br label %do.end183

do.end105:                                        ; No predecessors!
  br label %if.end139

if.else106:                                       ; preds = %if.else81
  %39 = load i32, i32* @rl_readline_state, align 4
  %and107 = and i32 %39, 2097152
  %tobool108 = icmp ne i32 %and107, 0
  br i1 %tobool108, label %if.then109, label %if.else125

if.then109:                                       ; preds = %if.else106
  %40 = load %struct.__rl_keyseq_context*, %struct.__rl_keyseq_context** @_rl_kscxt, align 4
  %call110 = call i32 @_rl_dispatch_callback(%struct.__rl_keyseq_context* %40)
  store i32 %call110, i32* %eof, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.then109
  %41 = load i32, i32* %eof, align 4
  %cmp111 = icmp eq i32 %41, -1
  br i1 %cmp111, label %land.lhs.true113, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %while.cond
  %42 = load i32, i32* %eof, align 4
  %cmp112 = icmp eq i32 %42, -2
  br i1 %cmp112, label %land.lhs.true113, label %land.end

land.lhs.true113:                                 ; preds = %lor.lhs.false, %while.cond
  %43 = load i32, i32* @rl_readline_state, align 4
  %and114 = and i32 %43, 2097152
  %tobool115 = icmp ne i32 %and114, 0
  br i1 %tobool115, label %land.lhs.true116, label %land.end

land.lhs.true116:                                 ; preds = %land.lhs.true113
  %44 = load %struct.__rl_keyseq_context*, %struct.__rl_keyseq_context** @_rl_kscxt, align 4
  %tobool117 = icmp ne %struct.__rl_keyseq_context* %44, null
  br i1 %tobool117, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %land.lhs.true116
  %45 = load %struct.__rl_keyseq_context*, %struct.__rl_keyseq_context** @_rl_kscxt, align 4
  %flags = getelementptr inbounds %struct.__rl_keyseq_context, %struct.__rl_keyseq_context* %45, i32 0, i32 0
  %46 = load i32, i32* %flags, align 4
  %and118 = and i32 %46, 1
  %tobool119 = icmp ne i32 %and118, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %land.lhs.true116, %land.lhs.true113, %lor.lhs.false
  %47 = phi i1 [ false, %land.lhs.true116 ], [ false, %land.lhs.true113 ], [ false, %lor.lhs.false ], [ %tobool119, %land.rhs ]
  br i1 %47, label %while.body, label %while.end

while.body:                                       ; preds = %land.end
  %48 = load %struct.__rl_keyseq_context*, %struct.__rl_keyseq_context** @_rl_kscxt, align 4
  %call120 = call i32 @_rl_dispatch_callback(%struct.__rl_keyseq_context* %48)
  store i32 %call120, i32* %eof, align 4
  br label %while.cond

while.end:                                        ; preds = %land.end
  %49 = load i32, i32* @rl_readline_state, align 4
  %and121 = and i32 %49, 2097152
  %cmp122 = icmp eq i32 %and121, 0
  br i1 %cmp122, label %if.then123, label %if.end124

if.then123:                                       ; preds = %while.end
  call void @_rl_internal_char_cleanup()
  store i32 1, i32* @_rl_want_redisplay, align 4
  br label %if.end124

if.end124:                                        ; preds = %if.then123, %while.end
  br label %if.end138

if.else125:                                       ; preds = %if.else106
  %50 = load i32 (%struct.__rl_callback_generic_arg*)*, i32 (%struct.__rl_callback_generic_arg*)** @_rl_callback_func, align 4
  %tobool126 = icmp ne i32 (%struct.__rl_callback_generic_arg*)* %50, null
  br i1 %tobool126, label %if.then127, label %if.else135

if.then127:                                       ; preds = %if.else125
  %51 = load i32 (%struct.__rl_callback_generic_arg*)*, i32 (%struct.__rl_callback_generic_arg*)** @_rl_callback_func, align 4
  %52 = load %struct.__rl_callback_generic_arg*, %struct.__rl_callback_generic_arg** @_rl_callback_data, align 4
  %call128 = call i32 %51(%struct.__rl_callback_generic_arg* %52)
  store i32 %call128, i32* %eof, align 4
  %53 = load i32 (%struct.__rl_callback_generic_arg*)*, i32 (%struct.__rl_callback_generic_arg*)** @_rl_callback_func, align 4
  %cmp129 = icmp eq i32 (%struct.__rl_callback_generic_arg*)* %53, null
  br i1 %cmp129, label %if.then130, label %if.end134

if.then130:                                       ; preds = %if.then127
  %54 = load %struct.__rl_callback_generic_arg*, %struct.__rl_callback_generic_arg** @_rl_callback_data, align 4
  %tobool131 = icmp ne %struct.__rl_callback_generic_arg* %54, null
  br i1 %tobool131, label %if.then132, label %if.end133

if.then132:                                       ; preds = %if.then130
  %55 = load %struct.__rl_callback_generic_arg*, %struct.__rl_callback_generic_arg** @_rl_callback_data, align 4
  call void @_rl_callback_data_dispose(%struct.__rl_callback_generic_arg* %55)
  store %struct.__rl_callback_generic_arg* null, %struct.__rl_callback_generic_arg** @_rl_callback_data, align 4
  br label %if.end133

if.end133:                                        ; preds = %if.then132, %if.then130
  call void @_rl_internal_char_cleanup()
  br label %if.end134

if.end134:                                        ; preds = %if.end133, %if.then127
  br label %if.end137

if.else135:                                       ; preds = %if.else125
  %call136 = call i32 @readline_internal_char()
  store i32 %call136, i32* %eof, align 4
  br label %if.end137

if.end137:                                        ; preds = %if.else135, %if.end134
  br label %if.end138

if.end138:                                        ; preds = %if.end137, %if.end124
  br label %if.end139

if.end139:                                        ; preds = %if.end138, %do.end105
  br label %if.end140

if.end140:                                        ; preds = %if.end139, %do.end80
  br label %if.end141

if.end141:                                        ; preds = %if.end140, %if.end65
  br label %if.end142

if.end142:                                        ; preds = %if.end141, %do.end43
  br label %if.end143

if.end143:                                        ; preds = %if.end142, %do.end33
  br label %do.body144

do.body144:                                       ; preds = %if.end143
  %56 = load volatile i32, i32* @_rl_caught_signal, align 4
  %tobool145 = icmp ne i32 %56, 0
  br i1 %tobool145, label %if.then146, label %if.end147

if.then146:                                       ; preds = %do.body144
  %57 = load volatile i32, i32* @_rl_caught_signal, align 4
  call void @_rl_signal_handler(i32 %57)
  br label %if.end147

if.end147:                                        ; preds = %if.then146, %do.body144
  br label %do.end148

do.end148:                                        ; preds = %if.end147
  %58 = load i32, i32* @rl_done, align 4
  %cmp149 = icmp eq i32 %58, 0
  br i1 %cmp149, label %land.lhs.true150, label %if.end153

land.lhs.true150:                                 ; preds = %do.end148
  %59 = load i32, i32* @_rl_want_redisplay, align 4
  %tobool151 = icmp ne i32 %59, 0
  br i1 %tobool151, label %if.then152, label %if.end153

if.then152:                                       ; preds = %land.lhs.true150
  %60 = load void ()*, void ()** @rl_redisplay_function, align 4
  call void %60()
  store i32 0, i32* @_rl_want_redisplay, align 4
  br label %if.end153

if.end153:                                        ; preds = %if.then152, %land.lhs.true150, %do.end148
  %61 = load i32, i32* @rl_done, align 4
  %tobool154 = icmp ne i32 %61, 0
  br i1 %tobool154, label %if.then155, label %if.end169

if.then155:                                       ; preds = %if.end153
  %62 = load i32, i32* %eof, align 4
  %call156 = call i8* @readline_internal_teardown(i32 %62)
  store i8* %call156, i8** %line, align 4
  %63 = load void ()*, void ()** @rl_deprep_term_function, align 4
  %tobool157 = icmp ne void ()* %63, null
  br i1 %tobool157, label %if.then158, label %if.end159

if.then158:                                       ; preds = %if.then155
  %64 = load void ()*, void ()** @rl_deprep_term_function, align 4
  call void %64()
  br label %if.end159

if.end159:                                        ; preds = %if.then158, %if.then155
  %call160 = call i32 @rl_clear_signals()
  store i32 0, i32* @in_handler, align 4
  %65 = load void (i8*)*, void (i8*)** @rl_linefunc, align 4
  %66 = load i8*, i8** %line, align 4
  call void %65(i8* %66)
  %67 = load i8*, i8** @rl_line_buffer, align 4
  %arrayidx = getelementptr inbounds i8, i8* %67, i32 0
  %68 = load i8, i8* %arrayidx, align 1
  %tobool161 = icmp ne i8 %68, 0
  br i1 %tobool161, label %if.then162, label %if.end163

if.then162:                                       ; preds = %if.end159
  call void @_rl_init_line_state()
  br label %if.end163

if.end163:                                        ; preds = %if.then162, %if.end159
  %69 = load i32, i32* @in_handler, align 4
  %cmp164 = icmp eq i32 %69, 0
  br i1 %cmp164, label %land.lhs.true165, label %if.end168

land.lhs.true165:                                 ; preds = %if.end163
  %70 = load void (i8*)*, void (i8*)** @rl_linefunc, align 4
  %tobool166 = icmp ne void (i8*)* %70, null
  br i1 %tobool166, label %if.then167, label %if.end168

if.then167:                                       ; preds = %land.lhs.true165
  call void @_rl_callback_newline()
  br label %if.end168

if.end168:                                        ; preds = %if.then167, %land.lhs.true165, %if.end163
  br label %if.end169

if.end169:                                        ; preds = %if.end168, %if.end153
  br label %do.cond

do.cond:                                          ; preds = %if.end169
  %71 = load i32, i32* @rl_pending_input, align 4
  %tobool170 = icmp ne i32 %71, 0
  br i1 %tobool170, label %lor.end, label %lor.lhs.false171

lor.lhs.false171:                                 ; preds = %do.cond
  %call172 = call i32 @_rl_pushed_input_available()
  %tobool173 = icmp ne i32 %call172, 0
  br i1 %tobool173, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %lor.lhs.false171
  %72 = load i32, i32* @rl_readline_state, align 4
  %and174 = and i32 %72, 2048
  %tobool175 = icmp ne i32 %and174, 0
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %lor.lhs.false171, %do.cond
  %73 = phi i1 [ true, %lor.lhs.false171 ], [ true, %do.cond ], [ %tobool175, %lor.rhs ]
  br i1 %73, label %do.body11, label %do.end176

do.end176:                                        ; preds = %lor.end
  br label %do.body177

do.body177:                                       ; preds = %do.end176
  %74 = load i32, i32* @rl_persistent_signal_handlers, align 4
  %cmp178 = icmp eq i32 %74, 0
  br i1 %cmp178, label %if.then179, label %if.end181

if.then179:                                       ; preds = %do.body177
  %call180 = call i32 @rl_clear_signals()
  br label %if.end181

if.end181:                                        ; preds = %if.then179, %do.body177
  br label %do.end183

do.end183:                                        ; preds = %if.end5, %if.end32, %if.end42, %if.end63, %if.end79, %if.end104, %if.end181
  ret void
}

declare void @_rl_errmsg(i8*, ...) #1

; Function Attrs: noreturn
declare void @abort() #2

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* nocapture writeonly, i8* nocapture readonly, i32, i32, i1) #3

; Function Attrs: returns_twice
declare i32 @setjmp(%struct.__jmp_buf_tag*) #4

declare i32 @rl_clear_signals() #1

declare i32 @rl_set_signals() #1

declare void @_rl_signal_handler(i32) #1

declare i32 @_rl_isearch_callback(%struct.__rl_search_context*) #1

declare i32 @_rl_nsearch_callback(%struct.__rl_search_context*) #1

; Function Attrs: noinline nounwind
define void @_rl_callback_data_dispose(%struct.__rl_callback_generic_arg* %arg) #0 {
entry:
  %arg.addr = alloca %struct.__rl_callback_generic_arg*, align 4
  store %struct.__rl_callback_generic_arg* %arg, %struct.__rl_callback_generic_arg** %arg.addr, align 4
  %0 = load %struct.__rl_callback_generic_arg*, %struct.__rl_callback_generic_arg** %arg.addr, align 4
  %1 = bitcast %struct.__rl_callback_generic_arg* %0 to i8*
  call void @xfree(i8* %1)
  ret void
}

declare i32 @_rl_vi_domove_motion_cleanup(i32, %struct.__rl_vimotion_context*) #1

declare void @_rl_internal_char_cleanup() #1

declare i32 @_rl_vi_domove_callback(%struct.__rl_vimotion_context*) #1

declare i32 @_rl_arg_callback(i32) #1

declare i32 @_rl_dispatch_callback(%struct.__rl_keyseq_context*) #1

declare i32 @readline_internal_char() #1

declare i8* @readline_internal_teardown(i32) #1

declare void @_rl_init_line_state() #1

declare i32 @_rl_pushed_input_available() #1

; Function Attrs: noinline nounwind
define void @rl_callback_handler_remove() #0 {
entry:
  store void (i8*)* null, void (i8*)** @rl_linefunc, align 4
  %0 = load i32, i32* @rl_readline_state, align 4
  %and = and i32 %0, -524289
  store i32 %and, i32* @rl_readline_state, align 4
  br label %do.body

do.body:                                          ; preds = %entry
  %1 = load volatile i32, i32* @_rl_caught_signal, align 4
  %tobool = icmp ne i32 %1, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %do.body
  %2 = load volatile i32, i32* @_rl_caught_signal, align 4
  call void @_rl_signal_handler(i32 %2)
  br label %if.end

if.end:                                           ; preds = %if.then, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  %3 = load i32, i32* @in_handler, align 4
  %tobool1 = icmp ne i32 %3, 0
  br i1 %tobool1, label %if.then2, label %if.end6

if.then2:                                         ; preds = %do.end
  store i32 0, i32* @in_handler, align 4
  %4 = load void ()*, void ()** @rl_deprep_term_function, align 4
  %tobool3 = icmp ne void ()* %4, null
  br i1 %tobool3, label %if.then4, label %if.end5

if.then4:                                         ; preds = %if.then2
  %5 = load void ()*, void ()** @rl_deprep_term_function, align 4
  call void %5()
  br label %if.end5

if.end5:                                          ; preds = %if.then4, %if.then2
  %call = call i32 @rl_clear_signals()
  br label %if.end6

if.end6:                                          ; preds = %if.end5, %do.end
  ret void
}

; Function Attrs: noinline nounwind
define %struct.__rl_callback_generic_arg* @_rl_callback_data_alloc(i32 %count) #0 {
entry:
  %count.addr = alloca i32, align 4
  %arg = alloca %struct.__rl_callback_generic_arg*, align 4
  store i32 %count, i32* %count.addr, align 4
  %call = call i8* @xmalloc(i32 12)
  %0 = bitcast i8* %call to %struct.__rl_callback_generic_arg*
  store %struct.__rl_callback_generic_arg* %0, %struct.__rl_callback_generic_arg** %arg, align 4
  %1 = load i32, i32* %count.addr, align 4
  %2 = load %struct.__rl_callback_generic_arg*, %struct.__rl_callback_generic_arg** %arg, align 4
  %count1 = getelementptr inbounds %struct.__rl_callback_generic_arg, %struct.__rl_callback_generic_arg* %2, i32 0, i32 0
  store i32 %1, i32* %count1, align 4
  %3 = load %struct.__rl_callback_generic_arg*, %struct.__rl_callback_generic_arg** %arg, align 4
  %i2 = getelementptr inbounds %struct.__rl_callback_generic_arg, %struct.__rl_callback_generic_arg* %3, i32 0, i32 2
  store i32 0, i32* %i2, align 4
  %4 = load %struct.__rl_callback_generic_arg*, %struct.__rl_callback_generic_arg** %arg, align 4
  %i1 = getelementptr inbounds %struct.__rl_callback_generic_arg, %struct.__rl_callback_generic_arg* %4, i32 0, i32 1
  store i32 0, i32* %i1, align 4
  %5 = load %struct.__rl_callback_generic_arg*, %struct.__rl_callback_generic_arg** %arg, align 4
  ret %struct.__rl_callback_generic_arg* %5
}

declare i8* @xmalloc(i32) #1

declare void @xfree(i8*) #1

; Function Attrs: noinline nounwind
define void @rl_callback_sigcleanup() #0 {
entry:
  %0 = load i32, i32* @rl_readline_state, align 4
  %and = and i32 %0, 524288
  %cmp = icmp eq i32 %and, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i32, i32* @rl_readline_state, align 4
  %and1 = and i32 %1, 128
  %tobool = icmp ne i32 %and1, 0
  br i1 %tobool, label %if.then2, label %if.else

if.then2:                                         ; preds = %if.end
  %2 = load %struct.__rl_search_context*, %struct.__rl_search_context** @_rl_iscxt, align 4
  %call = call i32 @_rl_isearch_cleanup(%struct.__rl_search_context* %2, i32 0)
  br label %if.end26

if.else:                                          ; preds = %if.end
  %3 = load i32, i32* @rl_readline_state, align 4
  %and3 = and i32 %3, 256
  %tobool4 = icmp ne i32 %and3, 0
  br i1 %tobool4, label %if.then5, label %if.else7

if.then5:                                         ; preds = %if.else
  %4 = load %struct.__rl_search_context*, %struct.__rl_search_context** @_rl_nscxt, align 4
  %call6 = call i32 @_rl_nsearch_cleanup(%struct.__rl_search_context* %4, i32 0)
  br label %if.end25

if.else7:                                         ; preds = %if.else
  %5 = load i32, i32* @rl_readline_state, align 4
  %and8 = and i32 %5, 1048576
  %tobool9 = icmp ne i32 %and8, 0
  br i1 %tobool9, label %if.then10, label %if.else12

if.then10:                                        ; preds = %if.else7
  %6 = load i32, i32* @rl_readline_state, align 4
  %and11 = and i32 %6, -1048577
  store i32 %and11, i32* @rl_readline_state, align 4
  br label %if.end24

if.else12:                                        ; preds = %if.else7
  %7 = load i32, i32* @rl_readline_state, align 4
  %and13 = and i32 %7, 1024
  %tobool14 = icmp ne i32 %and13, 0
  br i1 %tobool14, label %if.then15, label %if.else17

if.then15:                                        ; preds = %if.else12
  store i32 0, i32* @_rl_argcxt, align 4
  %8 = load i32, i32* @rl_readline_state, align 4
  %and16 = and i32 %8, -1025
  store i32 %and16, i32* @rl_readline_state, align 4
  br label %if.end23

if.else17:                                        ; preds = %if.else12
  %9 = load i32, i32* @rl_readline_state, align 4
  %and18 = and i32 %9, 2097152
  %tobool19 = icmp ne i32 %and18, 0
  br i1 %tobool19, label %if.then20, label %if.end22

if.then20:                                        ; preds = %if.else17
  %10 = load i32, i32* @rl_readline_state, align 4
  %and21 = and i32 %10, -2097153
  store i32 %and21, i32* @rl_readline_state, align 4
  br label %if.end22

if.end22:                                         ; preds = %if.then20, %if.else17
  br label %if.end23

if.end23:                                         ; preds = %if.end22, %if.then15
  br label %if.end24

if.end24:                                         ; preds = %if.end23, %if.then10
  br label %if.end25

if.end25:                                         ; preds = %if.end24, %if.then5
  br label %if.end26

if.end26:                                         ; preds = %if.end25, %if.then2
  %11 = load i32, i32* @rl_readline_state, align 4
  %and27 = and i32 %11, 8388608
  %tobool28 = icmp ne i32 %and27, 0
  br i1 %tobool28, label %if.then29, label %if.end31

if.then29:                                        ; preds = %if.end26
  %12 = load i32, i32* @rl_readline_state, align 4
  %and30 = and i32 %12, -8388609
  store i32 %and30, i32* @rl_readline_state, align 4
  br label %if.end31

if.end31:                                         ; preds = %if.then29, %if.end26
  store i32 (%struct.__rl_callback_generic_arg*)* null, i32 (%struct.__rl_callback_generic_arg*)** @_rl_callback_func, align 4
  br label %return

return:                                           ; preds = %if.end31, %if.then
  ret void
}

declare i32 @_rl_isearch_cleanup(%struct.__rl_search_context*, i32) #1

declare i32 @_rl_nsearch_cleanup(%struct.__rl_search_context*, i32) #1

; Function Attrs: noinline nounwind
define internal void @_rl_callback_newline() #0 {
entry:
  %call = call i32 @rl_initialize()
  %0 = load i32, i32* @in_handler, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end6

if.then:                                          ; preds = %entry
  store i32 1, i32* @in_handler, align 4
  %1 = load void (i32)*, void (i32)** @rl_prep_term_function, align 4
  %tobool = icmp ne void (i32)* %1, null
  br i1 %tobool, label %if.then1, label %if.end

if.then1:                                         ; preds = %if.then
  %2 = load void (i32)*, void (i32)** @rl_prep_term_function, align 4
  %3 = load i32, i32* @_rl_meta_flag, align 4
  call void %2(i32 %3)
  br label %if.end

if.end:                                           ; preds = %if.then1, %if.then
  %4 = load i32, i32* @rl_persistent_signal_handlers, align 4
  %tobool2 = icmp ne i32 %4, 0
  br i1 %tobool2, label %if.then3, label %if.end5

if.then3:                                         ; preds = %if.end
  %call4 = call i32 @rl_set_signals()
  br label %if.end5

if.end5:                                          ; preds = %if.then3, %if.end
  br label %if.end6

if.end6:                                          ; preds = %if.end5, %entry
  call void @readline_internal_setup()
  br label %do.body

do.body:                                          ; preds = %if.end6
  %5 = load volatile i32, i32* @_rl_caught_signal, align 4
  %tobool7 = icmp ne i32 %5, 0
  br i1 %tobool7, label %if.then8, label %if.end9

if.then8:                                         ; preds = %do.body
  %6 = load volatile i32, i32* @_rl_caught_signal, align 4
  call void @_rl_signal_handler(i32 %6)
  br label %if.end9

if.end9:                                          ; preds = %if.then8, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end9
  ret void
}

declare i32 @rl_initialize() #1

declare void @readline_internal_setup() #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { returns_twice "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn }
attributes #6 = { returns_twice }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
