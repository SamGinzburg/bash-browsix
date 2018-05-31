; ModuleID = 'source.c'
source_filename = "source.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.word_list = type { %struct.word_list*, %struct.word_desc* }
%struct.word_desc = type { i8*, i32 }

@source_uses_path = global i32 1, align 4
@source_searches_cwd = global i32 1, align 4
@loptend = external global %struct.word_list*, align 4
@.str = private unnamed_addr constant [27 x i8] c"filename argument required\00", align 1
@restricted = external global i32, align 4
@posixly_correct = external global i32, align 4
@.str.1 = private unnamed_addr constant [13 x i8] c"./source.def\00", align 1
@.str.2 = private unnamed_addr constant [19 x i8] c"%s: file not found\00", align 1
@interactive_shell = external global i32, align 4
@executing_command_builtin = external global i32, align 4
@last_command_exit_value = external global i32, align 4
@.str.3 = private unnamed_addr constant [7 x i8] c"source\00", align 1
@debugging_mode = external global i32, align 4
@trap_list = external global [0 x i8*], align 4
@function_trace_mode = external global i32, align 4
@variable_context = external global i32, align 4

; Function Attrs: noinline nounwind
define i32 @source_builtin(%struct.word_list* %list) #0 {
entry:
  %retval = alloca i32, align 4
  %list.addr = alloca %struct.word_list*, align 4
  %result = alloca i32, align 4
  %filename = alloca i8*, align 4
  %debug_trap = alloca i8*, align 4
  %x = alloca i8*, align 4
  store %struct.word_list* %list, %struct.word_list** %list.addr, align 4
  %0 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %call = call i32 @no_options(%struct.word_list* %0)
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 258, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = load %struct.word_list*, %struct.word_list** @loptend, align 4
  store %struct.word_list* %1, %struct.word_list** %list.addr, align 4
  %2 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %cmp = icmp eq %struct.word_list* %2, null
  br i1 %cmp, label %if.then1, label %if.end3

if.then1:                                         ; preds = %if.end
  %call2 = call i8* @libintl_gettext(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str, i32 0, i32 0))
  call void (i8*, ...) @builtin_error(i8* %call2)
  call void @builtin_usage()
  store i32 258, i32* %retval, align 4
  br label %return

if.end3:                                          ; preds = %if.end
  %3 = load i32, i32* @restricted, align 4
  %tobool4 = icmp ne i32 %3, 0
  br i1 %tobool4, label %land.lhs.true, label %if.end11

land.lhs.true:                                    ; preds = %if.end3
  %4 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word = getelementptr inbounds %struct.word_list, %struct.word_list* %4, i32 0, i32 1
  %5 = load %struct.word_desc*, %struct.word_desc** %word, align 4
  %word5 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %5, i32 0, i32 0
  %6 = load i8*, i8** %word5, align 4
  %call6 = call i8* @strchr(i8* %6, i32 47)
  %tobool7 = icmp ne i8* %call6, null
  br i1 %tobool7, label %if.then8, label %if.end11

if.then8:                                         ; preds = %land.lhs.true
  %7 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word9 = getelementptr inbounds %struct.word_list, %struct.word_list* %7, i32 0, i32 1
  %8 = load %struct.word_desc*, %struct.word_desc** %word9, align 4
  %word10 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %8, i32 0, i32 0
  %9 = load i8*, i8** %word10, align 4
  call void @sh_restricted(i8* %9)
  store i32 1, i32* %retval, align 4
  br label %return

if.end11:                                         ; preds = %land.lhs.true, %if.end3
  store i8* null, i8** %filename, align 4
  %10 = load i32, i32* @posixly_correct, align 4
  %tobool12 = icmp ne i32 %10, 0
  br i1 %tobool12, label %land.lhs.true13, label %if.else

land.lhs.true13:                                  ; preds = %if.end11
  %11 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word14 = getelementptr inbounds %struct.word_list, %struct.word_list* %11, i32 0, i32 1
  %12 = load %struct.word_desc*, %struct.word_desc** %word14, align 4
  %word15 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %12, i32 0, i32 0
  %13 = load i8*, i8** %word15, align 4
  %call16 = call i8* @strchr(i8* %13, i32 47)
  %tobool17 = icmp ne i8* %call16, null
  br i1 %tobool17, label %if.then18, label %if.else

if.then18:                                        ; preds = %land.lhs.true13
  %14 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word19 = getelementptr inbounds %struct.word_list, %struct.word_list* %14, i32 0, i32 1
  %15 = load %struct.word_desc*, %struct.word_desc** %word19, align 4
  %word20 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %15, i32 0, i32 0
  %16 = load i8*, i8** %word20, align 4
  %call21 = call i32 @strlen(i8* %16)
  %add = add i32 1, %call21
  %call22 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.1, i32 0, i32 0), i32 147)
  %17 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word23 = getelementptr inbounds %struct.word_list, %struct.word_list* %17, i32 0, i32 1
  %18 = load %struct.word_desc*, %struct.word_desc** %word23, align 4
  %word24 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %18, i32 0, i32 0
  %19 = load i8*, i8** %word24, align 4
  %call25 = call i8* @strcpy(i8* %call22, i8* %19)
  store i8* %call25, i8** %filename, align 4
  br label %if.end47

if.else:                                          ; preds = %land.lhs.true13, %if.end11
  %20 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word26 = getelementptr inbounds %struct.word_list, %struct.word_list* %20, i32 0, i32 1
  %21 = load %struct.word_desc*, %struct.word_desc** %word26, align 4
  %word27 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %21, i32 0, i32 0
  %22 = load i8*, i8** %word27, align 4
  %call28 = call i32 @absolute_pathname(i8* %22)
  %tobool29 = icmp ne i32 %call28, 0
  br i1 %tobool29, label %if.then30, label %if.else39

if.then30:                                        ; preds = %if.else
  %23 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word31 = getelementptr inbounds %struct.word_list, %struct.word_list* %23, i32 0, i32 1
  %24 = load %struct.word_desc*, %struct.word_desc** %word31, align 4
  %word32 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %24, i32 0, i32 0
  %25 = load i8*, i8** %word32, align 4
  %call33 = call i32 @strlen(i8* %25)
  %add34 = add i32 1, %call33
  %call35 = call i8* @sh_xmalloc(i32 %add34, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.1, i32 0, i32 0), i32 149)
  %26 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word36 = getelementptr inbounds %struct.word_list, %struct.word_list* %26, i32 0, i32 1
  %27 = load %struct.word_desc*, %struct.word_desc** %word36, align 4
  %word37 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %27, i32 0, i32 0
  %28 = load i8*, i8** %word37, align 4
  %call38 = call i8* @strcpy(i8* %call35, i8* %28)
  store i8* %call38, i8** %filename, align 4
  br label %if.end46

if.else39:                                        ; preds = %if.else
  %29 = load i32, i32* @source_uses_path, align 4
  %tobool40 = icmp ne i32 %29, 0
  br i1 %tobool40, label %if.then41, label %if.end45

if.then41:                                        ; preds = %if.else39
  %30 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word42 = getelementptr inbounds %struct.word_list, %struct.word_list* %30, i32 0, i32 1
  %31 = load %struct.word_desc*, %struct.word_desc** %word42, align 4
  %word43 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %31, i32 0, i32 0
  %32 = load i8*, i8** %word43, align 4
  %call44 = call i8* @find_path_file(i8* %32)
  store i8* %call44, i8** %filename, align 4
  br label %if.end45

if.end45:                                         ; preds = %if.then41, %if.else39
  br label %if.end46

if.end46:                                         ; preds = %if.end45, %if.then30
  br label %if.end47

if.end47:                                         ; preds = %if.end46, %if.then18
  %33 = load i8*, i8** %filename, align 4
  %cmp48 = icmp eq i8* %33, null
  br i1 %cmp48, label %if.then49, label %if.end78

if.then49:                                        ; preds = %if.end47
  %34 = load i32, i32* @source_searches_cwd, align 4
  %cmp50 = icmp eq i32 %34, 0
  br i1 %cmp50, label %if.then51, label %if.else68

if.then51:                                        ; preds = %if.then49
  %35 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word52 = getelementptr inbounds %struct.word_list, %struct.word_list* %35, i32 0, i32 1
  %36 = load %struct.word_desc*, %struct.word_desc** %word52, align 4
  %word53 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %36, i32 0, i32 0
  %37 = load i8*, i8** %word53, align 4
  %call54 = call i8* @printable_filename(i8* %37, i32 0)
  store i8* %call54, i8** %x, align 4
  %call55 = call i8* @libintl_gettext(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.2, i32 0, i32 0))
  %38 = load i8*, i8** %x, align 4
  call void (i8*, ...) @builtin_error(i8* %call55, i8* %38)
  %39 = load i8*, i8** %x, align 4
  %40 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word56 = getelementptr inbounds %struct.word_list, %struct.word_list* %40, i32 0, i32 1
  %41 = load %struct.word_desc*, %struct.word_desc** %word56, align 4
  %word57 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %41, i32 0, i32 0
  %42 = load i8*, i8** %word57, align 4
  %cmp58 = icmp ne i8* %39, %42
  br i1 %cmp58, label %if.then59, label %if.end60

if.then59:                                        ; preds = %if.then51
  %43 = load i8*, i8** %x, align 4
  call void @sh_xfree(i8* %43, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.1, i32 0, i32 0), i32 159)
  br label %if.end60

if.end60:                                         ; preds = %if.then59, %if.then51
  %44 = load i32, i32* @posixly_correct, align 4
  %tobool61 = icmp ne i32 %44, 0
  br i1 %tobool61, label %land.lhs.true62, label %if.end67

land.lhs.true62:                                  ; preds = %if.end60
  %45 = load i32, i32* @interactive_shell, align 4
  %cmp63 = icmp eq i32 %45, 0
  br i1 %cmp63, label %land.lhs.true64, label %if.end67

land.lhs.true64:                                  ; preds = %land.lhs.true62
  %46 = load i32, i32* @executing_command_builtin, align 4
  %cmp65 = icmp eq i32 %46, 0
  br i1 %cmp65, label %if.then66, label %if.end67

if.then66:                                        ; preds = %land.lhs.true64
  store i32 1, i32* @last_command_exit_value, align 4
  call void @jump_to_top_level(i32 3) #3
  unreachable

if.end67:                                         ; preds = %land.lhs.true64, %land.lhs.true62, %if.end60
  store i32 1, i32* %retval, align 4
  br label %return

if.else68:                                        ; preds = %if.then49
  %47 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word69 = getelementptr inbounds %struct.word_list, %struct.word_list* %47, i32 0, i32 1
  %48 = load %struct.word_desc*, %struct.word_desc** %word69, align 4
  %word70 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %48, i32 0, i32 0
  %49 = load i8*, i8** %word70, align 4
  %call71 = call i32 @strlen(i8* %49)
  %add72 = add i32 1, %call71
  %call73 = call i8* @sh_xmalloc(i32 %add72, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.1, i32 0, i32 0), i32 168)
  %50 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word74 = getelementptr inbounds %struct.word_list, %struct.word_list* %50, i32 0, i32 1
  %51 = load %struct.word_desc*, %struct.word_desc** %word74, align 4
  %word75 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %51, i32 0, i32 0
  %52 = load i8*, i8** %word75, align 4
  %call76 = call i8* @strcpy(i8* %call73, i8* %52)
  store i8* %call76, i8** %filename, align 4
  br label %if.end77

if.end77:                                         ; preds = %if.else68
  br label %if.end78

if.end78:                                         ; preds = %if.end77, %if.end47
  call void @begin_unwind_frame(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i32 0, i32 0))
  %53 = load i8*, i8** %filename, align 4
  call void bitcast (void (...)* @add_unwind_protect to void (i32 (...)*, i8*)*)(i32 (...)* bitcast (void (i8*)* @xfree to i32 (...)*), i8* %53)
  %54 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next = getelementptr inbounds %struct.word_list, %struct.word_list* %54, i32 0, i32 0
  %55 = load %struct.word_list*, %struct.word_list** %next, align 4
  %tobool79 = icmp ne %struct.word_list* %55, null
  br i1 %tobool79, label %if.then80, label %if.end86

if.then80:                                        ; preds = %if.end78
  call void @push_dollar_vars()
  call void bitcast (void (...)* @add_unwind_protect to void (i32 (...)*, i8*)*)(i32 (...)* bitcast (void ()* @maybe_pop_dollar_vars to i32 (...)*), i8* null)
  %56 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next81 = getelementptr inbounds %struct.word_list, %struct.word_list* %56, i32 0, i32 0
  %57 = load %struct.word_list*, %struct.word_list** %next81, align 4
  call void @remember_args(%struct.word_list* %57, i32 1)
  %58 = load i32, i32* @debugging_mode, align 4
  %tobool82 = icmp ne i32 %58, 0
  br i1 %tobool82, label %if.then83, label %if.end85

if.then83:                                        ; preds = %if.then80
  %59 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next84 = getelementptr inbounds %struct.word_list, %struct.word_list* %59, i32 0, i32 0
  %60 = load %struct.word_list*, %struct.word_list** %next84, align 4
  call void @push_args(%struct.word_list* %60)
  br label %if.end85

if.end85:                                         ; preds = %if.then83, %if.then80
  br label %if.end86

if.end86:                                         ; preds = %if.end85, %if.end78
  call void @set_dollar_vars_unchanged()
  %call87 = call i32 @signal_is_trapped(i32 65)
  %tobool88 = icmp ne i32 %call87, 0
  br i1 %tobool88, label %land.lhs.true89, label %cond.false

land.lhs.true89:                                  ; preds = %if.end86
  %call90 = call i32 @signal_is_ignored(i32 65)
  %cmp91 = icmp eq i32 %call90, 0
  br i1 %cmp91, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true89
  %61 = load i8*, i8** getelementptr inbounds ([0 x i8*], [0 x i8*]* @trap_list, i32 0, i32 65), align 4
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true89, %if.end86
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %61, %cond.true ], [ null, %cond.false ]
  store i8* %cond, i8** %debug_trap, align 4
  %62 = load i8*, i8** %debug_trap, align 4
  %tobool92 = icmp ne i8* %62, null
  br i1 %tobool92, label %land.lhs.true93, label %if.end100

land.lhs.true93:                                  ; preds = %cond.end
  %63 = load i32, i32* @function_trace_mode, align 4
  %cmp94 = icmp eq i32 %63, 0
  br i1 %cmp94, label %if.then95, label %if.end100

if.then95:                                        ; preds = %land.lhs.true93
  %64 = load i8*, i8** %debug_trap, align 4
  %call96 = call i32 @strlen(i8* %64)
  %add97 = add i32 1, %call96
  %call98 = call i8* @sh_xmalloc(i32 %add97, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.1, i32 0, i32 0), i32 190)
  %65 = load i8*, i8** %debug_trap, align 4
  %call99 = call i8* @strcpy(i8* %call98, i8* %65)
  store i8* %call99, i8** %debug_trap, align 4
  %66 = load i8*, i8** %debug_trap, align 4
  call void bitcast (void (...)* @add_unwind_protect to void (void (i8*)*, i8*)*)(void (i8*)* @xfree, i8* %66)
  %67 = load i8*, i8** %debug_trap, align 4
  call void bitcast (void (...)* @add_unwind_protect to void (void (i8*)*, i8*)*)(void (i8*)* @maybe_set_debug_trap, i8* %67)
  call void @restore_default_signal(i32 65)
  br label %if.end100

if.end100:                                        ; preds = %if.then95, %land.lhs.true93, %cond.end
  %68 = load i8*, i8** %filename, align 4
  %69 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %tobool101 = icmp ne %struct.word_list* %69, null
  br i1 %tobool101, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %if.end100
  %70 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next102 = getelementptr inbounds %struct.word_list, %struct.word_list* %70, i32 0, i32 0
  %71 = load %struct.word_list*, %struct.word_list** %next102, align 4
  %tobool103 = icmp ne %struct.word_list* %71, null
  br label %land.end

land.end:                                         ; preds = %land.rhs, %if.end100
  %72 = phi i1 [ false, %if.end100 ], [ %tobool103, %land.rhs ]
  %land.ext = zext i1 %72 to i32
  %call104 = call i32 @source_file(i8* %68, i32 %land.ext)
  store i32 %call104, i32* %result, align 4
  call void @run_unwind_frame(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i32 0, i32 0))
  %73 = load i32, i32* %result, align 4
  store i32 %73, i32* %retval, align 4
  br label %return

return:                                           ; preds = %land.end, %if.end67, %if.then8, %if.then1, %if.then
  %74 = load i32, i32* %retval, align 4
  ret i32 %74
}

declare i32 @no_options(%struct.word_list*) #1

declare void @builtin_error(i8*, ...) #1

declare i8* @libintl_gettext(i8*) #1

declare void @builtin_usage() #1

declare i8* @strchr(i8*, i32) #1

declare void @sh_restricted(i8*) #1

declare i8* @strcpy(i8*, i8*) #1

declare i8* @sh_xmalloc(i32, i8*, i32) #1

declare i32 @strlen(i8*) #1

declare i32 @absolute_pathname(i8*) #1

declare i8* @find_path_file(i8*) #1

declare i8* @printable_filename(i8*, i32) #1

declare void @sh_xfree(i8*, i8*, i32) #1

; Function Attrs: noreturn
declare void @jump_to_top_level(i32) #2

declare void @begin_unwind_frame(i8*) #1

declare void @add_unwind_protect(...) #1

declare void @xfree(i8*) #1

declare void @push_dollar_vars() #1

; Function Attrs: noinline nounwind
define internal void @maybe_pop_dollar_vars() #0 {
entry:
  %0 = load i32, i32* @variable_context, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %entry
  %call = call i32 @dollar_vars_changed()
  %and = and i32 %call, 4
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true
  call void @dispose_saved_dollar_vars()
  br label %if.end

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @pop_dollar_vars()
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* @debugging_mode, align 4
  %tobool1 = icmp ne i32 %1, 0
  br i1 %tobool1, label %if.then2, label %if.end3

if.then2:                                         ; preds = %if.end
  call void @pop_args()
  br label %if.end3

if.end3:                                          ; preds = %if.then2, %if.end
  call void @set_dollar_vars_unchanged()
  call void @invalidate_cached_quoted_dollar_at()
  ret void
}

declare void @remember_args(%struct.word_list*, i32) #1

declare void @push_args(%struct.word_list*) #1

declare void @set_dollar_vars_unchanged() #1

declare i32 @signal_is_trapped(i32) #1

declare i32 @signal_is_ignored(i32) #1

declare void @maybe_set_debug_trap(i8*) #1

declare void @restore_default_signal(i32) #1

declare i32 @source_file(i8*, i32) #1

declare void @run_unwind_frame(i8*) #1

declare i32 @dollar_vars_changed() #1

declare void @dispose_saved_dollar_vars() #1

declare void @pop_dollar_vars() #1

declare void @pop_args() #1

declare void @invalidate_cached_quoted_dollar_at() #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
