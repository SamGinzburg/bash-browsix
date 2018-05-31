; ModuleID = 'bind.c'
source_filename = "bind.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct._IO_FILE = type opaque
%struct.word_list = type { %struct.word_list*, %struct.word_desc* }
%struct.word_desc = type { i8*, i32 }
%struct._keymap_entry = type { i8, i32 (i32, i32)* }

@no_line_editing = external global i32, align 4
@.str = private unnamed_addr constant [25 x i8] c"line editing not enabled\00", align 1
@bash_readline_initialized = external global i32, align 4
@.str.1 = private unnamed_addr constant [13 x i8] c"bind_builtin\00", align 1
@rl_outstream = external global %struct._IO_FILE*, align 4
@stdout = external constant %struct._IO_FILE*, align 4
@.str.2 = private unnamed_addr constant [21 x i8] c"lvpVPsSXf:q:u:m:r:x:\00", align 1
@list_optarg = external global i8*, align 4
@loptend = external global %struct.word_list*, align 4
@.str.3 = private unnamed_addr constant [26 x i8] c"`%s': invalid keymap name\00", align 1
@.str.4 = private unnamed_addr constant [20 x i8] c"%s: cannot read: %s\00", align 1
@.str.5 = private unnamed_addr constant [11 x i8] c"./bind.def\00", align 1
@.str.6 = private unnamed_addr constant [20 x i8] c"`%s': cannot unbind\00", align 1
@.str.7 = private unnamed_addr constant [28 x i8] c"`%s': unknown function name\00", align 1
@.str.8 = private unnamed_addr constant [30 x i8] c"%s is not bound to any keys.\0A\00", align 1
@.str.9 = private unnamed_addr constant [23 x i8] c"%s can be invoked via \00", align 1
@.str.10 = private unnamed_addr constant [7 x i8] c"\22%s\22%s\00", align 1
@.str.11 = private unnamed_addr constant [3 x i8] c", \00", align 1
@.str.12 = private unnamed_addr constant [3 x i8] c".\0A\00", align 1
@.str.13 = private unnamed_addr constant [5 x i8] c"...\0A\00", align 1

; Function Attrs: noinline nounwind
define i32 @bind_builtin(%struct.word_list* %list) #0 {
entry:
  %retval = alloca i32, align 4
  %list.addr = alloca %struct.word_list*, align 4
  %return_code = alloca i32, align 4
  %kmap = alloca %struct._keymap_entry*, align 4
  %saved_keymap = alloca %struct._keymap_entry*, align 4
  %flags = alloca i32, align 4
  %opt = alloca i32, align 4
  %initfile = alloca i8*, align 4
  %map_name = alloca i8*, align 4
  %fun_name = alloca i8*, align 4
  %unbind_name = alloca i8*, align 4
  %remove_seq = alloca i8*, align 4
  %cmd_seq = alloca i8*, align 4
  %t = alloca i8*, align 4
  store %struct.word_list* %list, %struct.word_list** %list.addr, align 4
  %0 = load i32, i32* @no_line_editing, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call = call i8* @libintl_gettext(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str, i32 0, i32 0))
  call void (i8*, ...) @builtin_warning(i8* %call)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  store %struct._keymap_entry* null, %struct._keymap_entry** %saved_keymap, align 4
  store %struct._keymap_entry* null, %struct._keymap_entry** %kmap, align 4
  store i32 0, i32* %flags, align 4
  store i8* null, i8** %cmd_seq, align 4
  store i8* null, i8** %remove_seq, align 4
  store i8* null, i8** %unbind_name, align 4
  store i8* null, i8** %fun_name, align 4
  store i8* null, i8** %map_name, align 4
  store i8* null, i8** %initfile, align 4
  store i32 0, i32* %return_code, align 4
  %1 = load i32, i32* @bash_readline_initialized, align 4
  %cmp = icmp eq i32 %1, 0
  br i1 %cmp, label %if.then1, label %if.end2

if.then1:                                         ; preds = %if.end
  call void @initialize_readline()
  br label %if.end2

if.end2:                                          ; preds = %if.then1, %if.end
  call void @begin_unwind_frame(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.1, i32 0, i32 0))
  call void @unwind_protect_mem(i8* bitcast (%struct._IO_FILE** @rl_outstream to i8*), i32 4)
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  store %struct._IO_FILE* %2, %struct._IO_FILE** @rl_outstream, align 4
  call void @reset_internal_getopt()
  br label %while.cond

while.cond:                                       ; preds = %sw.epilog, %if.end2
  %3 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %call3 = call i32 @internal_getopt(%struct.word_list* %3, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.2, i32 0, i32 0))
  store i32 %call3, i32* %opt, align 4
  %cmp4 = icmp ne i32 %call3, -1
  br i1 %cmp4, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %4 = load i32, i32* %opt, align 4
  switch i32 %4, label %sw.default [
    i32 108, label %sw.bb
    i32 118, label %sw.bb5
    i32 112, label %sw.bb7
    i32 102, label %sw.bb9
    i32 109, label %sw.bb11
    i32 113, label %sw.bb13
    i32 117, label %sw.bb15
    i32 114, label %sw.bb17
    i32 86, label %sw.bb19
    i32 80, label %sw.bb21
    i32 115, label %sw.bb23
    i32 83, label %sw.bb25
    i32 120, label %sw.bb27
    i32 88, label %sw.bb29
    i32 -99, label %sw.bb31
  ]

sw.bb:                                            ; preds = %while.body
  %5 = load i32, i32* %flags, align 4
  %or = or i32 %5, 1
  store i32 %or, i32* %flags, align 4
  br label %sw.epilog

sw.bb5:                                           ; preds = %while.body
  %6 = load i32, i32* %flags, align 4
  %or6 = or i32 %6, 8
  store i32 %or6, i32* %flags, align 4
  br label %sw.epilog

sw.bb7:                                           ; preds = %while.body
  %7 = load i32, i32* %flags, align 4
  %or8 = or i32 %7, 2
  store i32 %or8, i32* %flags, align 4
  br label %sw.epilog

sw.bb9:                                           ; preds = %while.body
  %8 = load i32, i32* %flags, align 4
  %or10 = or i32 %8, 4
  store i32 %or10, i32* %flags, align 4
  %9 = load i8*, i8** @list_optarg, align 4
  store i8* %9, i8** %initfile, align 4
  br label %sw.epilog

sw.bb11:                                          ; preds = %while.body
  %10 = load i32, i32* %flags, align 4
  %or12 = or i32 %10, 32
  store i32 %or12, i32* %flags, align 4
  %11 = load i8*, i8** @list_optarg, align 4
  store i8* %11, i8** %map_name, align 4
  br label %sw.epilog

sw.bb13:                                          ; preds = %while.body
  %12 = load i32, i32* %flags, align 4
  %or14 = or i32 %12, 16
  store i32 %or14, i32* %flags, align 4
  %13 = load i8*, i8** @list_optarg, align 4
  store i8* %13, i8** %fun_name, align 4
  br label %sw.epilog

sw.bb15:                                          ; preds = %while.body
  %14 = load i32, i32* %flags, align 4
  %or16 = or i32 %14, 2048
  store i32 %or16, i32* %flags, align 4
  %15 = load i8*, i8** @list_optarg, align 4
  store i8* %15, i8** %unbind_name, align 4
  br label %sw.epilog

sw.bb17:                                          ; preds = %while.body
  %16 = load i32, i32* %flags, align 4
  %or18 = or i32 %16, 64
  store i32 %or18, i32* %flags, align 4
  %17 = load i8*, i8** @list_optarg, align 4
  store i8* %17, i8** %remove_seq, align 4
  br label %sw.epilog

sw.bb19:                                          ; preds = %while.body
  %18 = load i32, i32* %flags, align 4
  %or20 = or i32 %18, 256
  store i32 %or20, i32* %flags, align 4
  br label %sw.epilog

sw.bb21:                                          ; preds = %while.body
  %19 = load i32, i32* %flags, align 4
  %or22 = or i32 %19, 128
  store i32 %or22, i32* %flags, align 4
  br label %sw.epilog

sw.bb23:                                          ; preds = %while.body
  %20 = load i32, i32* %flags, align 4
  %or24 = or i32 %20, 512
  store i32 %or24, i32* %flags, align 4
  br label %sw.epilog

sw.bb25:                                          ; preds = %while.body
  %21 = load i32, i32* %flags, align 4
  %or26 = or i32 %21, 1024
  store i32 %or26, i32* %flags, align 4
  br label %sw.epilog

sw.bb27:                                          ; preds = %while.body
  %22 = load i32, i32* %flags, align 4
  %or28 = or i32 %22, 4096
  store i32 %or28, i32* %flags, align 4
  %23 = load i8*, i8** @list_optarg, align 4
  store i8* %23, i8** %cmd_seq, align 4
  br label %sw.epilog

sw.bb29:                                          ; preds = %while.body
  %24 = load i32, i32* %flags, align 4
  %or30 = or i32 %24, 8192
  store i32 %or30, i32* %flags, align 4
  br label %sw.epilog

sw.bb31:                                          ; preds = %while.body
  call void @builtin_help()
  store i32 258, i32* %retval, align 4
  br label %return

sw.default:                                       ; preds = %while.body
  call void @builtin_usage()
  br label %do.body

do.body:                                          ; preds = %sw.default
  store i32 258, i32* %return_code, align 4
  br label %bind_exit

do.end:                                           ; No predecessors!
  br label %sw.epilog

sw.epilog:                                        ; preds = %do.end, %sw.bb29, %sw.bb27, %sw.bb25, %sw.bb23, %sw.bb21, %sw.bb19, %sw.bb17, %sw.bb15, %sw.bb13, %sw.bb11, %sw.bb9, %sw.bb7, %sw.bb5, %sw.bb
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %25 = load %struct.word_list*, %struct.word_list** @loptend, align 4
  store %struct.word_list* %25, %struct.word_list** %list.addr, align 4
  %26 = load i32, i32* %flags, align 4
  %and = and i32 %26, 32
  %tobool32 = icmp ne i32 %and, 0
  br i1 %tobool32, label %land.lhs.true, label %if.end42

land.lhs.true:                                    ; preds = %while.end
  %27 = load i8*, i8** %map_name, align 4
  %tobool33 = icmp ne i8* %27, null
  br i1 %tobool33, label %if.then34, label %if.end42

if.then34:                                        ; preds = %land.lhs.true
  %28 = load i8*, i8** %map_name, align 4
  %call35 = call %struct._keymap_entry* @rl_get_keymap_by_name(i8* %28)
  store %struct._keymap_entry* %call35, %struct._keymap_entry** %kmap, align 4
  %29 = load %struct._keymap_entry*, %struct._keymap_entry** %kmap, align 4
  %cmp36 = icmp eq %struct._keymap_entry* %29, null
  br i1 %cmp36, label %if.then37, label %if.end41

if.then37:                                        ; preds = %if.then34
  %call38 = call i8* @libintl_gettext(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.3, i32 0, i32 0))
  %30 = load i8*, i8** %map_name, align 4
  call void (i8*, ...) @builtin_error(i8* %call38, i8* %30)
  br label %do.body39

do.body39:                                        ; preds = %if.then37
  store i32 1, i32* %return_code, align 4
  br label %bind_exit

do.end40:                                         ; No predecessors!
  br label %if.end41

if.end41:                                         ; preds = %do.end40, %if.then34
  br label %if.end42

if.end42:                                         ; preds = %if.end41, %land.lhs.true, %while.end
  %31 = load %struct._keymap_entry*, %struct._keymap_entry** %kmap, align 4
  %tobool43 = icmp ne %struct._keymap_entry* %31, null
  br i1 %tobool43, label %if.then44, label %if.end46

if.then44:                                        ; preds = %if.end42
  %call45 = call %struct._keymap_entry* @rl_get_keymap()
  store %struct._keymap_entry* %call45, %struct._keymap_entry** %saved_keymap, align 4
  %32 = load %struct._keymap_entry*, %struct._keymap_entry** %kmap, align 4
  call void @rl_set_keymap(%struct._keymap_entry* %32)
  br label %if.end46

if.end46:                                         ; preds = %if.then44, %if.end42
  %33 = load i32, i32* %flags, align 4
  %and47 = and i32 %33, 1
  %tobool48 = icmp ne i32 %and47, 0
  br i1 %tobool48, label %if.then49, label %if.end50

if.then49:                                        ; preds = %if.end46
  call void @rl_list_funmap_names()
  br label %if.end50

if.end50:                                         ; preds = %if.then49, %if.end46
  %34 = load i32, i32* %flags, align 4
  %and51 = and i32 %34, 2
  %tobool52 = icmp ne i32 %and51, 0
  br i1 %tobool52, label %if.then53, label %if.end54

if.then53:                                        ; preds = %if.end50
  call void @rl_function_dumper(i32 1)
  br label %if.end54

if.end54:                                         ; preds = %if.then53, %if.end50
  %35 = load i32, i32* %flags, align 4
  %and55 = and i32 %35, 128
  %tobool56 = icmp ne i32 %and55, 0
  br i1 %tobool56, label %if.then57, label %if.end58

if.then57:                                        ; preds = %if.end54
  call void @rl_function_dumper(i32 0)
  br label %if.end58

if.end58:                                         ; preds = %if.then57, %if.end54
  %36 = load i32, i32* %flags, align 4
  %and59 = and i32 %36, 512
  %tobool60 = icmp ne i32 %and59, 0
  br i1 %tobool60, label %if.then61, label %if.end62

if.then61:                                        ; preds = %if.end58
  call void @rl_macro_dumper(i32 1)
  br label %if.end62

if.end62:                                         ; preds = %if.then61, %if.end58
  %37 = load i32, i32* %flags, align 4
  %and63 = and i32 %37, 1024
  %tobool64 = icmp ne i32 %and63, 0
  br i1 %tobool64, label %if.then65, label %if.end66

if.then65:                                        ; preds = %if.end62
  call void @rl_macro_dumper(i32 0)
  br label %if.end66

if.end66:                                         ; preds = %if.then65, %if.end62
  %38 = load i32, i32* %flags, align 4
  %and67 = and i32 %38, 8
  %tobool68 = icmp ne i32 %and67, 0
  br i1 %tobool68, label %if.then69, label %if.end70

if.then69:                                        ; preds = %if.end66
  call void @rl_variable_dumper(i32 1)
  br label %if.end70

if.end70:                                         ; preds = %if.then69, %if.end66
  %39 = load i32, i32* %flags, align 4
  %and71 = and i32 %39, 256
  %tobool72 = icmp ne i32 %and71, 0
  br i1 %tobool72, label %if.then73, label %if.end74

if.then73:                                        ; preds = %if.end70
  call void @rl_variable_dumper(i32 0)
  br label %if.end74

if.end74:                                         ; preds = %if.then73, %if.end70
  %40 = load i32, i32* %flags, align 4
  %and75 = and i32 %40, 4
  %tobool76 = icmp ne i32 %and75, 0
  br i1 %tobool76, label %land.lhs.true77, label %if.end93

land.lhs.true77:                                  ; preds = %if.end74
  %41 = load i8*, i8** %initfile, align 4
  %tobool78 = icmp ne i8* %41, null
  br i1 %tobool78, label %if.then79, label %if.end93

if.then79:                                        ; preds = %land.lhs.true77
  %42 = load i8*, i8** %initfile, align 4
  %call80 = call i32 @rl_read_init_file(i8* %42)
  %cmp81 = icmp ne i32 %call80, 0
  br i1 %cmp81, label %if.then82, label %if.end92

if.then82:                                        ; preds = %if.then79
  %43 = load i8*, i8** %initfile, align 4
  %call83 = call i8* @printable_filename(i8* %43, i32 0)
  store i8* %call83, i8** %t, align 4
  %call84 = call i8* @libintl_gettext(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.4, i32 0, i32 0))
  %44 = load i8*, i8** %t, align 4
  %call85 = call i32* @__errno_location()
  %45 = load i32, i32* %call85, align 4
  %call86 = call i8* @strerror(i32 %45)
  call void (i8*, ...) @builtin_error(i8* %call84, i8* %44, i8* %call86)
  %46 = load i8*, i8** %t, align 4
  %47 = load i8*, i8** %initfile, align 4
  %cmp87 = icmp ne i8* %46, %47
  br i1 %cmp87, label %if.then88, label %if.end89

if.then88:                                        ; preds = %if.then82
  %48 = load i8*, i8** %t, align 4
  call void @sh_xfree(i8* %48, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.5, i32 0, i32 0), i32 255)
  br label %if.end89

if.end89:                                         ; preds = %if.then88, %if.then82
  br label %do.body90

do.body90:                                        ; preds = %if.end89
  store i32 1, i32* %return_code, align 4
  br label %bind_exit

do.end91:                                         ; No predecessors!
  br label %if.end92

if.end92:                                         ; preds = %do.end91, %if.then79
  br label %if.end93

if.end93:                                         ; preds = %if.end92, %land.lhs.true77, %if.end74
  %49 = load i32, i32* %flags, align 4
  %and94 = and i32 %49, 16
  %tobool95 = icmp ne i32 %and94, 0
  br i1 %tobool95, label %land.lhs.true96, label %if.end100

land.lhs.true96:                                  ; preds = %if.end93
  %50 = load i8*, i8** %fun_name, align 4
  %tobool97 = icmp ne i8* %50, null
  br i1 %tobool97, label %if.then98, label %if.end100

if.then98:                                        ; preds = %land.lhs.true96
  %51 = load i8*, i8** %fun_name, align 4
  %call99 = call i32 @query_bindings(i8* %51)
  store i32 %call99, i32* %return_code, align 4
  br label %if.end100

if.end100:                                        ; preds = %if.then98, %land.lhs.true96, %if.end93
  %52 = load i32, i32* %flags, align 4
  %and101 = and i32 %52, 2048
  %tobool102 = icmp ne i32 %and101, 0
  br i1 %tobool102, label %land.lhs.true103, label %if.end107

land.lhs.true103:                                 ; preds = %if.end100
  %53 = load i8*, i8** %unbind_name, align 4
  %tobool104 = icmp ne i8* %53, null
  br i1 %tobool104, label %if.then105, label %if.end107

if.then105:                                       ; preds = %land.lhs.true103
  %54 = load i8*, i8** %unbind_name, align 4
  %call106 = call i32 @unbind_command(i8* %54)
  store i32 %call106, i32* %return_code, align 4
  br label %if.end107

if.end107:                                        ; preds = %if.then105, %land.lhs.true103, %if.end100
  %55 = load i32, i32* %flags, align 4
  %and108 = and i32 %55, 64
  %tobool109 = icmp ne i32 %and108, 0
  br i1 %tobool109, label %land.lhs.true110, label %if.end120

land.lhs.true110:                                 ; preds = %if.end107
  %56 = load i8*, i8** %remove_seq, align 4
  %tobool111 = icmp ne i8* %56, null
  br i1 %tobool111, label %if.then112, label %if.end120

if.then112:                                       ; preds = %land.lhs.true110
  %57 = load i8*, i8** %remove_seq, align 4
  %call113 = call i32 @rl_bind_keyseq(i8* %57, i32 (i32, i32)* null)
  %cmp114 = icmp ne i32 %call113, 0
  br i1 %cmp114, label %if.then115, label %if.end119

if.then115:                                       ; preds = %if.then112
  %call116 = call i8* @libintl_gettext(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.6, i32 0, i32 0))
  %58 = load i8*, i8** %remove_seq, align 4
  call void (i8*, ...) @builtin_error(i8* %call116, i8* %58)
  br label %do.body117

do.body117:                                       ; preds = %if.then115
  store i32 1, i32* %return_code, align 4
  br label %bind_exit

do.end118:                                        ; No predecessors!
  br label %if.end119

if.end119:                                        ; preds = %do.end118, %if.then112
  br label %if.end120

if.end120:                                        ; preds = %if.end119, %land.lhs.true110, %if.end107
  %59 = load i32, i32* %flags, align 4
  %and121 = and i32 %59, 4096
  %tobool122 = icmp ne i32 %and121, 0
  br i1 %tobool122, label %if.then123, label %if.end125

if.then123:                                       ; preds = %if.end120
  %60 = load i8*, i8** %cmd_seq, align 4
  %call124 = call i32 @bind_keyseq_to_unix_command(i8* %60)
  store i32 %call124, i32* %return_code, align 4
  br label %if.end125

if.end125:                                        ; preds = %if.then123, %if.end120
  %61 = load i32, i32* %flags, align 4
  %and126 = and i32 %61, 8192
  %tobool127 = icmp ne i32 %and126, 0
  br i1 %tobool127, label %if.then128, label %if.end130

if.then128:                                       ; preds = %if.end125
  %call129 = call i32 @print_unix_command_map()
  store i32 %call129, i32* %return_code, align 4
  br label %if.end130

if.end130:                                        ; preds = %if.then128, %if.end125
  br label %while.cond131

while.cond131:                                    ; preds = %while.body133, %if.end130
  %62 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %tobool132 = icmp ne %struct.word_list* %62, null
  br i1 %tobool132, label %while.body133, label %while.end136

while.body133:                                    ; preds = %while.cond131
  %63 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word = getelementptr inbounds %struct.word_list, %struct.word_list* %63, i32 0, i32 1
  %64 = load %struct.word_desc*, %struct.word_desc** %word, align 4
  %word134 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %64, i32 0, i32 0
  %65 = load i8*, i8** %word134, align 4
  %call135 = call i32 @rl_parse_and_bind(i8* %65)
  %66 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next = getelementptr inbounds %struct.word_list, %struct.word_list* %66, i32 0, i32 0
  %67 = load %struct.word_list*, %struct.word_list** %next, align 4
  store %struct.word_list* %67, %struct.word_list** %list.addr, align 4
  br label %while.cond131

while.end136:                                     ; preds = %while.cond131
  br label %bind_exit

bind_exit:                                        ; preds = %while.end136, %do.body117, %do.body90, %do.body39, %do.body
  %68 = load %struct._keymap_entry*, %struct._keymap_entry** %saved_keymap, align 4
  %tobool137 = icmp ne %struct._keymap_entry* %68, null
  br i1 %tobool137, label %if.then138, label %if.end139

if.then138:                                       ; preds = %bind_exit
  %69 = load %struct._keymap_entry*, %struct._keymap_entry** %saved_keymap, align 4
  call void @rl_set_keymap(%struct._keymap_entry* %69)
  br label %if.end139

if.end139:                                        ; preds = %if.then138, %bind_exit
  call void @run_unwind_frame(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.1, i32 0, i32 0))
  %70 = load i32, i32* %return_code, align 4
  %call140 = call i32 @sh_chkwrite(i32 %70)
  store i32 %call140, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end139, %sw.bb31
  %71 = load i32, i32* %retval, align 4
  ret i32 %71
}

declare void @builtin_warning(i8*, ...) #1

declare i8* @libintl_gettext(i8*) #1

declare void @initialize_readline() #1

declare void @begin_unwind_frame(i8*) #1

declare void @unwind_protect_mem(i8*, i32) #1

declare void @reset_internal_getopt() #1

declare i32 @internal_getopt(%struct.word_list*, i8*) #1

declare void @builtin_help() #1

declare void @builtin_usage() #1

declare %struct._keymap_entry* @rl_get_keymap_by_name(i8*) #1

declare void @builtin_error(i8*, ...) #1

declare %struct._keymap_entry* @rl_get_keymap() #1

declare void @rl_set_keymap(%struct._keymap_entry*) #1

declare void @rl_list_funmap_names() #1

declare void @rl_function_dumper(i32) #1

declare void @rl_macro_dumper(i32) #1

declare void @rl_variable_dumper(i32) #1

declare i32 @rl_read_init_file(i8*) #1

declare i8* @printable_filename(i8*, i32) #1

declare i8* @strerror(i32) #1

declare i32* @__errno_location() #1

declare void @sh_xfree(i8*, i8*, i32) #1

; Function Attrs: noinline nounwind
define internal i32 @query_bindings(i8* %name) #0 {
entry:
  %retval = alloca i32, align 4
  %name.addr = alloca i8*, align 4
  %function = alloca i32 (i32, i32)*, align 4
  %keyseqs = alloca i8**, align 4
  %j = alloca i32, align 4
  store i8* %name, i8** %name.addr, align 4
  %0 = load i8*, i8** %name.addr, align 4
  %call = call i32 (i32, i32)* @rl_named_function(i8* %0)
  store i32 (i32, i32)* %call, i32 (i32, i32)** %function, align 4
  %1 = load i32 (i32, i32)*, i32 (i32, i32)** %function, align 4
  %cmp = icmp eq i32 (i32, i32)* %1, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call1 = call i8* @libintl_gettext(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.7, i32 0, i32 0))
  %2 = load i8*, i8** %name.addr, align 4
  call void (i8*, ...) @builtin_error(i8* %call1, i8* %2)
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %3 = load i32 (i32, i32)*, i32 (i32, i32)** %function, align 4
  %call2 = call i8** @rl_invoking_keyseqs(i32 (i32, i32)* %3)
  store i8** %call2, i8*** %keyseqs, align 4
  %4 = load i8**, i8*** %keyseqs, align 4
  %tobool = icmp ne i8** %4, null
  br i1 %tobool, label %if.end6, label %if.then3

if.then3:                                         ; preds = %if.end
  %call4 = call i8* @libintl_gettext(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.8, i32 0, i32 0))
  %5 = load i8*, i8** %name.addr, align 4
  %call5 = call i32 (i8*, ...) @printf(i8* %call4, i8* %5)
  store i32 1, i32* %retval, align 4
  br label %return

if.end6:                                          ; preds = %if.end
  %call7 = call i8* @libintl_gettext(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.9, i32 0, i32 0))
  %6 = load i8*, i8** %name.addr, align 4
  %call8 = call i32 (i8*, ...) @printf(i8* %call7, i8* %6)
  store i32 0, i32* %j, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end6
  %7 = load i32, i32* %j, align 4
  %cmp9 = icmp slt i32 %7, 5
  br i1 %cmp9, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.cond
  %8 = load i8**, i8*** %keyseqs, align 4
  %9 = load i32, i32* %j, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %8, i32 %9
  %10 = load i8*, i8** %arrayidx, align 4
  %tobool10 = icmp ne i8* %10, null
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %11 = phi i1 [ false, %for.cond ], [ %tobool10, %land.rhs ]
  br i1 %11, label %for.body, label %for.end

for.body:                                         ; preds = %land.end
  %12 = load i8**, i8*** %keyseqs, align 4
  %13 = load i32, i32* %j, align 4
  %arrayidx11 = getelementptr inbounds i8*, i8** %12, i32 %13
  %14 = load i8*, i8** %arrayidx11, align 4
  %15 = load i8**, i8*** %keyseqs, align 4
  %16 = load i32, i32* %j, align 4
  %add = add nsw i32 %16, 1
  %arrayidx12 = getelementptr inbounds i8*, i8** %15, i32 %add
  %17 = load i8*, i8** %arrayidx12, align 4
  %tobool13 = icmp ne i8* %17, null
  %cond = select i1 %tobool13, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.11, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.12, i32 0, i32 0)
  %call14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.10, i32 0, i32 0), i8* %14, i8* %cond)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %18 = load i32, i32* %j, align 4
  %inc = add nsw i32 %18, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond

for.end:                                          ; preds = %land.end
  %19 = load i8**, i8*** %keyseqs, align 4
  %20 = load i32, i32* %j, align 4
  %arrayidx15 = getelementptr inbounds i8*, i8** %19, i32 %20
  %21 = load i8*, i8** %arrayidx15, align 4
  %tobool16 = icmp ne i8* %21, null
  br i1 %tobool16, label %if.then17, label %if.end19

if.then17:                                        ; preds = %for.end
  %call18 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.13, i32 0, i32 0))
  br label %if.end19

if.end19:                                         ; preds = %if.then17, %for.end
  %22 = load i8**, i8*** %keyseqs, align 4
  call void @strvec_dispose(i8** %22)
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end19, %if.then3, %if.then
  %23 = load i32, i32* %retval, align 4
  ret i32 %23
}

; Function Attrs: noinline nounwind
define internal i32 @unbind_command(i8* %name) #0 {
entry:
  %retval = alloca i32, align 4
  %name.addr = alloca i8*, align 4
  %function = alloca i32 (i32, i32)*, align 4
  store i8* %name, i8** %name.addr, align 4
  %0 = load i8*, i8** %name.addr, align 4
  %call = call i32 (i32, i32)* @rl_named_function(i8* %0)
  store i32 (i32, i32)* %call, i32 (i32, i32)** %function, align 4
  %1 = load i32 (i32, i32)*, i32 (i32, i32)** %function, align 4
  %cmp = icmp eq i32 (i32, i32)* %1, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call1 = call i8* @libintl_gettext(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.7, i32 0, i32 0))
  %2 = load i8*, i8** %name.addr, align 4
  call void (i8*, ...) @builtin_error(i8* %call1, i8* %2)
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %3 = load i32 (i32, i32)*, i32 (i32, i32)** %function, align 4
  %call2 = call %struct._keymap_entry* @rl_get_keymap()
  %call3 = call i32 @rl_unbind_function_in_map(i32 (i32, i32)* %3, %struct._keymap_entry* %call2)
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %4 = load i32, i32* %retval, align 4
  ret i32 %4
}

declare i32 @rl_bind_keyseq(i8*, i32 (i32, i32)*) #1

declare i32 @bind_keyseq_to_unix_command(i8*) #1

declare i32 @print_unix_command_map() #1

declare i32 @rl_parse_and_bind(i8*) #1

declare void @run_unwind_frame(i8*) #1

declare i32 @sh_chkwrite(i32) #1

declare i32 (i32, i32)* @rl_named_function(i8*) #1

declare i8** @rl_invoking_keyseqs(i32 (i32, i32)*) #1

declare i32 @printf(i8*, ...) #1

declare void @strvec_dispose(i8**) #1

declare i32 @rl_unbind_function_in_map(i32 (i32, i32)*, %struct._keymap_entry*) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
