; ModuleID = 'pcomplete.c'
source_filename = "pcomplete.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct._list_of_items = type { i32, {}*, %struct._list_of_strings*, %struct._list_of_strings*, i32 }
%struct._list_of_strings = type { i8**, i32, i32 }
%struct.compspec = type { i32, i32, i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8* }
%struct.builtin = type { i8*, i32 (%struct.word_list*)*, i32, i8**, i8*, i8* }
%struct.word_list = type { %struct.word_list*, %struct.word_desc* }
%struct.word_desc = type { i8*, i32 }
%struct.STRING_INT_ALIST = type { i8*, i32 }
%struct.alias = type { i8*, i8*, i8 }
%struct.variable = type { i8*, i8*, i8*, %struct.variable* (%struct.variable*)*, %struct.variable* (%struct.variable*, i8*, i64, i8*)*, i32, i32 }
%struct._sh_parser_state_t = type { i32, i32*, i8*, i32, i32, i32, i8**, i32, i32, i32, i32, %struct.array*, i32 (%struct.word_list*)*, i32 (%struct.word_list*)*, i32, i32, i32, i32, [16 x %struct.redirect*] }
%struct.array = type { i32, i64, i32, %struct.array_element* }
%struct.array_element = type { i64, i8*, %struct.array_element*, %struct.array_element* }
%struct.redirect = type { %struct.redirect*, %union.REDIRECTEE, i32, i32, i32, %union.REDIRECTEE, i8* }
%union.REDIRECTEE = type { i32 }

@prog_completion_enabled = global i32 1, align 4
@it_aliases = global { i32, i32 (%struct._list_of_items*)*, %struct._list_of_strings*, %struct._list_of_strings*, i32 } { i32 0, i32 (%struct._list_of_items*)* @it_init_aliases, %struct._list_of_strings* null, %struct._list_of_strings* null, i32 0 }, align 4
@it_arrayvars = global { i32, i32 (%struct._list_of_items*)*, %struct._list_of_strings*, %struct._list_of_strings*, i32 } { i32 1, i32 (%struct._list_of_items*)* @it_init_arrayvars, %struct._list_of_strings* null, %struct._list_of_strings* null, i32 0 }, align 4
@it_bindings = global { i32, i32 (%struct._list_of_items*)*, %struct._list_of_strings*, %struct._list_of_strings*, i32 } { i32 0, i32 (%struct._list_of_items*)* @it_init_bindings, %struct._list_of_strings* null, %struct._list_of_strings* null, i32 0 }, align 4
@it_builtins = global { i32, i32 (%struct._list_of_items*)*, %struct._list_of_strings*, %struct._list_of_strings*, i32 } { i32 0, i32 (%struct._list_of_items*)* @it_init_builtins, %struct._list_of_strings* null, %struct._list_of_strings* null, i32 0 }, align 4
@it_commands = global { i32, i32 (%struct._list_of_items*)*, %struct._list_of_strings*, %struct._list_of_strings*, i32 } { i32 1, i32 (%struct._list_of_items*)* null, %struct._list_of_strings* null, %struct._list_of_strings* null, i32 0 }, align 4
@it_directories = global { i32, i32 (%struct._list_of_items*)*, %struct._list_of_strings*, %struct._list_of_strings*, i32 } { i32 1, i32 (%struct._list_of_items*)* null, %struct._list_of_strings* null, %struct._list_of_strings* null, i32 0 }, align 4
@it_disabled = global { i32, i32 (%struct._list_of_items*)*, %struct._list_of_strings*, %struct._list_of_strings*, i32 } { i32 0, i32 (%struct._list_of_items*)* @it_init_disabled, %struct._list_of_strings* null, %struct._list_of_strings* null, i32 0 }, align 4
@it_enabled = global { i32, i32 (%struct._list_of_items*)*, %struct._list_of_strings*, %struct._list_of_strings*, i32 } { i32 0, i32 (%struct._list_of_items*)* @it_init_enabled, %struct._list_of_strings* null, %struct._list_of_strings* null, i32 0 }, align 4
@it_exports = global { i32, i32 (%struct._list_of_items*)*, %struct._list_of_strings*, %struct._list_of_strings*, i32 } { i32 1, i32 (%struct._list_of_items*)* @it_init_exported, %struct._list_of_strings* null, %struct._list_of_strings* null, i32 0 }, align 4
@it_files = global { i32, i32 (%struct._list_of_items*)*, %struct._list_of_strings*, %struct._list_of_strings*, i32 } { i32 1, i32 (%struct._list_of_items*)* null, %struct._list_of_strings* null, %struct._list_of_strings* null, i32 0 }, align 4
@it_functions = global { i32, i32 (%struct._list_of_items*)*, %struct._list_of_strings*, %struct._list_of_strings*, i32 } { i32 0, i32 (%struct._list_of_items*)* @it_init_functions, %struct._list_of_strings* null, %struct._list_of_strings* null, i32 0 }, align 4
@it_helptopics = global { i32, i32 (%struct._list_of_items*)*, %struct._list_of_strings*, %struct._list_of_strings*, i32 } { i32 0, i32 (%struct._list_of_items*)* @it_init_helptopics, %struct._list_of_strings* null, %struct._list_of_strings* null, i32 0 }, align 4
@it_hostnames = global { i32, i32 (%struct._list_of_items*)*, %struct._list_of_strings*, %struct._list_of_strings*, i32 } { i32 1, i32 (%struct._list_of_items*)* @it_init_hostnames, %struct._list_of_strings* null, %struct._list_of_strings* null, i32 0 }, align 4
@it_groups = global { i32, i32 (%struct._list_of_items*)*, %struct._list_of_strings*, %struct._list_of_strings*, i32 } { i32 1, i32 (%struct._list_of_items*)* null, %struct._list_of_strings* null, %struct._list_of_strings* null, i32 0 }, align 4
@it_jobs = global { i32, i32 (%struct._list_of_items*)*, %struct._list_of_strings*, %struct._list_of_strings*, i32 } { i32 1, i32 (%struct._list_of_items*)* @it_init_jobs, %struct._list_of_strings* null, %struct._list_of_strings* null, i32 0 }, align 4
@it_keywords = global { i32, i32 (%struct._list_of_items*)*, %struct._list_of_strings*, %struct._list_of_strings*, i32 } { i32 0, i32 (%struct._list_of_items*)* @it_init_keywords, %struct._list_of_strings* null, %struct._list_of_strings* null, i32 0 }, align 4
@it_running = global { i32, i32 (%struct._list_of_items*)*, %struct._list_of_strings*, %struct._list_of_strings*, i32 } { i32 1, i32 (%struct._list_of_items*)* @it_init_running, %struct._list_of_strings* null, %struct._list_of_strings* null, i32 0 }, align 4
@it_services = global { i32, i32 (%struct._list_of_items*)*, %struct._list_of_strings*, %struct._list_of_strings*, i32 } { i32 1, i32 (%struct._list_of_items*)* null, %struct._list_of_strings* null, %struct._list_of_strings* null, i32 0 }, align 4
@it_setopts = global { i32, i32 (%struct._list_of_items*)*, %struct._list_of_strings*, %struct._list_of_strings*, i32 } { i32 0, i32 (%struct._list_of_items*)* @it_init_setopts, %struct._list_of_strings* null, %struct._list_of_strings* null, i32 0 }, align 4
@it_shopts = global { i32, i32 (%struct._list_of_items*)*, %struct._list_of_strings*, %struct._list_of_strings*, i32 } { i32 0, i32 (%struct._list_of_items*)* @it_init_shopts, %struct._list_of_strings* null, %struct._list_of_strings* null, i32 0 }, align 4
@it_signals = global { i32, i32 (%struct._list_of_items*)*, %struct._list_of_strings*, %struct._list_of_strings*, i32 } { i32 0, i32 (%struct._list_of_items*)* @it_init_signals, %struct._list_of_strings* null, %struct._list_of_strings* null, i32 0 }, align 4
@it_stopped = global { i32, i32 (%struct._list_of_items*)*, %struct._list_of_strings*, %struct._list_of_strings*, i32 } { i32 1, i32 (%struct._list_of_items*)* @it_init_stopped, %struct._list_of_strings* null, %struct._list_of_strings* null, i32 0 }, align 4
@it_users = global { i32, i32 (%struct._list_of_items*)*, %struct._list_of_strings*, %struct._list_of_strings*, i32 } { i32 1, i32 (%struct._list_of_items*)* null, %struct._list_of_strings* null, %struct._list_of_strings* null, i32 0 }, align 4
@it_variables = global { i32, i32 (%struct._list_of_items*)*, %struct._list_of_strings*, %struct._list_of_strings*, i32 } { i32 1, i32 (%struct._list_of_items*)* @it_init_variables, %struct._list_of_strings* null, %struct._list_of_strings* null, i32 0 }, align 4
@.str = private unnamed_addr constant [12 x i8] c"pcomplete.c\00", align 1
@extended_glob = external global i32, align 4
@match_ignore_case = external global i32, align 4
@rl_filename_completion_desired = external global i32, align 4
@rl_line_buffer = external global i8*, align 4
@rl_point = external global i32, align 4
@rl_completion_suppress_append = external global i32, align 4
@rl_filename_quoting_desired = external global i32, align 4
@rl_sort_completion_matches = external global i32, align 4
@pcomp_curcs = common global %struct.compspec* null, align 4
@.str.1 = private unnamed_addr constant [13 x i8] c"_DefaultCmD_\00", align 1
@.str.2 = private unnamed_addr constant [49 x i8] c"programmable_completion: %s: possible retry loop\00", align 1
@pcomp_curcmd = common global i8* null, align 4
@pcomp_curtxt = common global i8* null, align 4
@num_shell_builtins = external global i32, align 4
@shell_builtins = external global %struct.builtin*, align 4
@word_token_alist = external global [0 x %struct.STRING_INT_ALIST], align 4
@signal_names = external global [0 x i8*], align 4
@rl_completion_mark_symlink_dirs = external global i32, align 4
@pcomp_filename_completion_function.dfn = internal global i8* null, align 4
@this_shell_builtin = external global i32 (%struct.word_list*)*, align 4
@rl_readline_state = external global i32, align 4
@rl_completion_found_quote = external global i32, align 4
@rl_filename_dequoting_function = external global i8* (i8*, i32)*, align 4
@rl_completion_quote_character = external global i32, align 4
@variable_context = external global i32, align 4
@glob_error_return = external global i8*, align 4
@rl_completer_word_break_characters = external global i8*, align 4
@.str.3 = private unnamed_addr constant [36 x i8] c"completion: function `%s' not found\00", align 1
@.str.4 = private unnamed_addr constant [27 x i8] c"gen-shell-function-matches\00", align 1
@.str.5 = private unnamed_addr constant [10 x i8] c"COMPREPLY\00", align 1
@.str.6 = private unnamed_addr constant [10 x i8] c"COMP_LINE\00", align 1
@.str.7 = private unnamed_addr constant [11 x i8] c"COMP_POINT\00", align 1
@rl_completion_type = external global i32, align 4
@.str.8 = private unnamed_addr constant [10 x i8] c"COMP_TYPE\00", align 1
@rl_completion_invoking_key = external global i32, align 4
@.str.9 = private unnamed_addr constant [9 x i8] c"COMP_KEY\00", align 1
@.str.10 = private unnamed_addr constant [11 x i8] c"COMP_CWORD\00", align 1
@array_needs_making = external global i32, align 4
@.str.11 = private unnamed_addr constant [11 x i8] c"COMP_WORDS\00", align 1
@.str.12 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1

; Function Attrs: noinline nounwind
define internal i32 @it_init_aliases(%struct._list_of_items* %itp) #0 {
entry:
  %retval = alloca i32, align 4
  %itp.addr = alloca %struct._list_of_items*, align 4
  %alias_list = alloca %struct.alias**, align 4
  %i = alloca i32, align 4
  %n = alloca i32, align 4
  %sl = alloca %struct._list_of_strings*, align 4
  store %struct._list_of_items* %itp, %struct._list_of_items** %itp.addr, align 4
  %call = call %struct.alias** @all_aliases()
  store %struct.alias** %call, %struct.alias*** %alias_list, align 4
  %0 = load %struct.alias**, %struct.alias*** %alias_list, align 4
  %cmp = icmp eq %struct.alias** %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load %struct._list_of_items*, %struct._list_of_items** %itp.addr, align 4
  %slist = getelementptr inbounds %struct._list_of_items, %struct._list_of_items* %1, i32 0, i32 2
  store %struct._list_of_strings* null, %struct._list_of_strings** %slist, align 4
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  store i32 0, i32* %n, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load %struct.alias**, %struct.alias*** %alias_list, align 4
  %3 = load i32, i32* %n, align 4
  %arrayidx = getelementptr inbounds %struct.alias*, %struct.alias** %2, i32 %3
  %4 = load %struct.alias*, %struct.alias** %arrayidx, align 4
  %tobool = icmp ne %struct.alias* %4, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %n, align 4
  %inc = add nsw i32 %5, 1
  store i32 %inc, i32* %n, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %n, align 4
  %add = add nsw i32 %6, 1
  %call1 = call %struct._list_of_strings* @strlist_create(i32 %add)
  store %struct._list_of_strings* %call1, %struct._list_of_strings** %sl, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond2

for.cond2:                                        ; preds = %for.inc16, %for.end
  %7 = load i32, i32* %i, align 4
  %8 = load i32, i32* %n, align 4
  %cmp3 = icmp slt i32 %7, %8
  br i1 %cmp3, label %for.body4, label %for.end18

for.body4:                                        ; preds = %for.cond2
  %9 = load %struct.alias**, %struct.alias*** %alias_list, align 4
  %10 = load i32, i32* %i, align 4
  %arrayidx5 = getelementptr inbounds %struct.alias*, %struct.alias** %9, i32 %10
  %11 = load %struct.alias*, %struct.alias** %arrayidx5, align 4
  %name = getelementptr inbounds %struct.alias, %struct.alias* %11, i32 0, i32 0
  %12 = load i8*, i8** %name, align 4
  %tobool6 = icmp ne i8* %12, null
  br i1 %tobool6, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.body4
  %13 = load %struct.alias**, %struct.alias*** %alias_list, align 4
  %14 = load i32, i32* %i, align 4
  %arrayidx7 = getelementptr inbounds %struct.alias*, %struct.alias** %13, i32 %14
  %15 = load %struct.alias*, %struct.alias** %arrayidx7, align 4
  %name8 = getelementptr inbounds %struct.alias, %struct.alias* %15, i32 0, i32 0
  %16 = load i8*, i8** %name8, align 4
  %call9 = call i32 @strlen(i8* %16)
  %add10 = add i32 1, %call9
  %call11 = call i8* @sh_xmalloc(i32 %add10, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i32 381)
  %17 = load %struct.alias**, %struct.alias*** %alias_list, align 4
  %18 = load i32, i32* %i, align 4
  %arrayidx12 = getelementptr inbounds %struct.alias*, %struct.alias** %17, i32 %18
  %19 = load %struct.alias*, %struct.alias** %arrayidx12, align 4
  %name13 = getelementptr inbounds %struct.alias, %struct.alias* %19, i32 0, i32 0
  %20 = load i8*, i8** %name13, align 4
  %call14 = call i8* @strcpy(i8* %call11, i8* %20)
  br label %cond.end

cond.false:                                       ; preds = %for.body4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %call14, %cond.true ], [ null, %cond.false ]
  %21 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %list = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %21, i32 0, i32 0
  %22 = load i8**, i8*** %list, align 4
  %23 = load i32, i32* %i, align 4
  %arrayidx15 = getelementptr inbounds i8*, i8** %22, i32 %23
  store i8* %cond, i8** %arrayidx15, align 4
  br label %for.inc16

for.inc16:                                        ; preds = %cond.end
  %24 = load i32, i32* %i, align 4
  %inc17 = add nsw i32 %24, 1
  store i32 %inc17, i32* %i, align 4
  br label %for.cond2

for.end18:                                        ; preds = %for.cond2
  %25 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %list19 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %25, i32 0, i32 0
  %26 = load i8**, i8*** %list19, align 4
  %27 = load i32, i32* %n, align 4
  %arrayidx20 = getelementptr inbounds i8*, i8** %26, i32 %27
  store i8* null, i8** %arrayidx20, align 4
  %28 = load i32, i32* %n, align 4
  %29 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %list_len = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %29, i32 0, i32 2
  store i32 %28, i32* %list_len, align 4
  %30 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %list_size = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %30, i32 0, i32 1
  store i32 %28, i32* %list_size, align 4
  %31 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %32 = load %struct._list_of_items*, %struct._list_of_items** %itp.addr, align 4
  %slist21 = getelementptr inbounds %struct._list_of_items, %struct._list_of_items* %32, i32 0, i32 2
  store %struct._list_of_strings* %31, %struct._list_of_strings** %slist21, align 4
  %33 = load %struct.alias**, %struct.alias*** %alias_list, align 4
  %34 = bitcast %struct.alias** %33 to i8*
  call void @sh_xfree(i8* %34, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i32 388)
  store i32 1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %for.end18, %if.then
  %35 = load i32, i32* %retval, align 4
  ret i32 %35
}

; Function Attrs: noinline nounwind
define internal i32 @it_init_arrayvars(%struct._list_of_items* %itp) #0 {
entry:
  %itp.addr = alloca %struct._list_of_items*, align 4
  store %struct._list_of_items* %itp, %struct._list_of_items** %itp.addr, align 4
  %0 = load %struct._list_of_items*, %struct._list_of_items** %itp.addr, align 4
  call void @init_itemlist_from_varlist(%struct._list_of_items* %0, %struct.variable** (...)* bitcast (%struct.variable** ()* @all_array_variables to %struct.variable** (...)*))
  ret i32 1
}

; Function Attrs: noinline nounwind
define internal i32 @it_init_bindings(%struct._list_of_items* %itp) #0 {
entry:
  %itp.addr = alloca %struct._list_of_items*, align 4
  %blist = alloca i8**, align 4
  %sl = alloca %struct._list_of_strings*, align 4
  store %struct._list_of_items* %itp, %struct._list_of_items** %itp.addr, align 4
  %call = call i8** @rl_funmap_names()
  store i8** %call, i8*** %blist, align 4
  %call1 = call %struct._list_of_strings* @strlist_create(i32 0)
  store %struct._list_of_strings* %call1, %struct._list_of_strings** %sl, align 4
  %0 = load i8**, i8*** %blist, align 4
  %1 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %list = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %1, i32 0, i32 0
  store i8** %0, i8*** %list, align 4
  %2 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %list_size = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %2, i32 0, i32 1
  store i32 0, i32* %list_size, align 4
  %3 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %list2 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %3, i32 0, i32 0
  %4 = load i8**, i8*** %list2, align 4
  %call3 = call i32 @strvec_len(i8** %4)
  %5 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %list_len = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %5, i32 0, i32 2
  store i32 %call3, i32* %list_len, align 4
  %6 = load %struct._list_of_items*, %struct._list_of_items** %itp.addr, align 4
  %flags = getelementptr inbounds %struct._list_of_items, %struct._list_of_items* %6, i32 0, i32 0
  %7 = load i32, i32* %flags, align 4
  %or = or i32 %7, 32
  store i32 %or, i32* %flags, align 4
  %8 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %9 = load %struct._list_of_items*, %struct._list_of_items** %itp.addr, align 4
  %slist = getelementptr inbounds %struct._list_of_items, %struct._list_of_items* %9, i32 0, i32 2
  store %struct._list_of_strings* %8, %struct._list_of_strings** %slist, align 4
  ret i32 0
}

; Function Attrs: noinline nounwind
define internal i32 @it_init_builtins(%struct._list_of_items* %itp) #0 {
entry:
  %itp.addr = alloca %struct._list_of_items*, align 4
  %sl = alloca %struct._list_of_strings*, align 4
  %i = alloca i32, align 4
  %n = alloca i32, align 4
  store %struct._list_of_items* %itp, %struct._list_of_items** %itp.addr, align 4
  %0 = load i32, i32* @num_shell_builtins, align 4
  %call = call %struct._list_of_strings* @strlist_create(i32 %0)
  store %struct._list_of_strings* %call, %struct._list_of_strings** %sl, align 4
  store i32 0, i32* %n, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32, i32* %i, align 4
  %2 = load i32, i32* @num_shell_builtins, align 4
  %cmp = icmp slt i32 %1, %2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load %struct.builtin*, %struct.builtin** @shell_builtins, align 4
  %4 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds %struct.builtin, %struct.builtin* %3, i32 %4
  %function = getelementptr inbounds %struct.builtin, %struct.builtin* %arrayidx, i32 0, i32 1
  %5 = load i32 (%struct.word_list*)*, i32 (%struct.word_list*)** %function, align 4
  %tobool = icmp ne i32 (%struct.word_list*)* %5, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %6 = load %struct.builtin*, %struct.builtin** @shell_builtins, align 4
  %7 = load i32, i32* %i, align 4
  %arrayidx1 = getelementptr inbounds %struct.builtin, %struct.builtin* %6, i32 %7
  %name = getelementptr inbounds %struct.builtin, %struct.builtin* %arrayidx1, i32 0, i32 0
  %8 = load i8*, i8** %name, align 4
  %9 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %list = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %9, i32 0, i32 0
  %10 = load i8**, i8*** %list, align 4
  %11 = load i32, i32* %n, align 4
  %inc = add nsw i32 %11, 1
  store i32 %inc, i32* %n, align 4
  %arrayidx2 = getelementptr inbounds i8*, i8** %10, i32 %11
  store i8* %8, i8** %arrayidx2, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %12 = load i32, i32* %i, align 4
  %inc3 = add nsw i32 %12, 1
  store i32 %inc3, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %13 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %list4 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %13, i32 0, i32 0
  %14 = load i8**, i8*** %list4, align 4
  %15 = load i32, i32* %n, align 4
  %16 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %list_len = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %16, i32 0, i32 2
  store i32 %15, i32* %list_len, align 4
  %arrayidx5 = getelementptr inbounds i8*, i8** %14, i32 %15
  store i8* null, i8** %arrayidx5, align 4
  %17 = load %struct._list_of_items*, %struct._list_of_items** %itp.addr, align 4
  %flags = getelementptr inbounds %struct._list_of_items, %struct._list_of_items* %17, i32 0, i32 0
  %18 = load i32, i32* %flags, align 4
  %or = or i32 %18, 32
  store i32 %or, i32* %flags, align 4
  %19 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %20 = load %struct._list_of_items*, %struct._list_of_items** %itp.addr, align 4
  %slist = getelementptr inbounds %struct._list_of_items, %struct._list_of_items* %20, i32 0, i32 2
  store %struct._list_of_strings* %19, %struct._list_of_strings** %slist, align 4
  ret i32 0
}

; Function Attrs: noinline nounwind
define internal i32 @it_init_disabled(%struct._list_of_items* %itp) #0 {
entry:
  %itp.addr = alloca %struct._list_of_items*, align 4
  %sl = alloca %struct._list_of_strings*, align 4
  %i = alloca i32, align 4
  %n = alloca i32, align 4
  store %struct._list_of_items* %itp, %struct._list_of_items** %itp.addr, align 4
  %0 = load i32, i32* @num_shell_builtins, align 4
  %call = call %struct._list_of_strings* @strlist_create(i32 %0)
  store %struct._list_of_strings* %call, %struct._list_of_strings** %sl, align 4
  store i32 0, i32* %n, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32, i32* %i, align 4
  %2 = load i32, i32* @num_shell_builtins, align 4
  %cmp = icmp slt i32 %1, %2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load %struct.builtin*, %struct.builtin** @shell_builtins, align 4
  %4 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds %struct.builtin, %struct.builtin* %3, i32 %4
  %function = getelementptr inbounds %struct.builtin, %struct.builtin* %arrayidx, i32 0, i32 1
  %5 = load i32 (%struct.word_list*)*, i32 (%struct.word_list*)** %function, align 4
  %tobool = icmp ne i32 (%struct.word_list*)* %5, null
  br i1 %tobool, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %for.body
  %6 = load %struct.builtin*, %struct.builtin** @shell_builtins, align 4
  %7 = load i32, i32* %i, align 4
  %arrayidx1 = getelementptr inbounds %struct.builtin, %struct.builtin* %6, i32 %7
  %flags = getelementptr inbounds %struct.builtin, %struct.builtin* %arrayidx1, i32 0, i32 2
  %8 = load i32, i32* %flags, align 4
  %and = and i32 %8, 1
  %cmp2 = icmp eq i32 %and, 0
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %9 = load %struct.builtin*, %struct.builtin** @shell_builtins, align 4
  %10 = load i32, i32* %i, align 4
  %arrayidx3 = getelementptr inbounds %struct.builtin, %struct.builtin* %9, i32 %10
  %name = getelementptr inbounds %struct.builtin, %struct.builtin* %arrayidx3, i32 0, i32 0
  %11 = load i8*, i8** %name, align 4
  %12 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %list = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %12, i32 0, i32 0
  %13 = load i8**, i8*** %list, align 4
  %14 = load i32, i32* %n, align 4
  %inc = add nsw i32 %14, 1
  store i32 %inc, i32* %n, align 4
  %arrayidx4 = getelementptr inbounds i8*, i8** %13, i32 %14
  store i8* %11, i8** %arrayidx4, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %15 = load i32, i32* %i, align 4
  %inc5 = add nsw i32 %15, 1
  store i32 %inc5, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %16 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %list6 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %16, i32 0, i32 0
  %17 = load i8**, i8*** %list6, align 4
  %18 = load i32, i32* %n, align 4
  %19 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %list_len = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %19, i32 0, i32 2
  store i32 %18, i32* %list_len, align 4
  %arrayidx7 = getelementptr inbounds i8*, i8** %17, i32 %18
  store i8* null, i8** %arrayidx7, align 4
  %20 = load %struct._list_of_items*, %struct._list_of_items** %itp.addr, align 4
  %flags8 = getelementptr inbounds %struct._list_of_items, %struct._list_of_items* %20, i32 0, i32 0
  %21 = load i32, i32* %flags8, align 4
  %or = or i32 %21, 32
  store i32 %or, i32* %flags8, align 4
  %22 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %23 = load %struct._list_of_items*, %struct._list_of_items** %itp.addr, align 4
  %slist = getelementptr inbounds %struct._list_of_items, %struct._list_of_items* %23, i32 0, i32 2
  store %struct._list_of_strings* %22, %struct._list_of_strings** %slist, align 4
  ret i32 0
}

; Function Attrs: noinline nounwind
define internal i32 @it_init_enabled(%struct._list_of_items* %itp) #0 {
entry:
  %itp.addr = alloca %struct._list_of_items*, align 4
  %sl = alloca %struct._list_of_strings*, align 4
  %i = alloca i32, align 4
  %n = alloca i32, align 4
  store %struct._list_of_items* %itp, %struct._list_of_items** %itp.addr, align 4
  %0 = load i32, i32* @num_shell_builtins, align 4
  %call = call %struct._list_of_strings* @strlist_create(i32 %0)
  store %struct._list_of_strings* %call, %struct._list_of_strings** %sl, align 4
  store i32 0, i32* %n, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32, i32* %i, align 4
  %2 = load i32, i32* @num_shell_builtins, align 4
  %cmp = icmp slt i32 %1, %2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load %struct.builtin*, %struct.builtin** @shell_builtins, align 4
  %4 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds %struct.builtin, %struct.builtin* %3, i32 %4
  %function = getelementptr inbounds %struct.builtin, %struct.builtin* %arrayidx, i32 0, i32 1
  %5 = load i32 (%struct.word_list*)*, i32 (%struct.word_list*)** %function, align 4
  %tobool = icmp ne i32 (%struct.word_list*)* %5, null
  br i1 %tobool, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %for.body
  %6 = load %struct.builtin*, %struct.builtin** @shell_builtins, align 4
  %7 = load i32, i32* %i, align 4
  %arrayidx1 = getelementptr inbounds %struct.builtin, %struct.builtin* %6, i32 %7
  %flags = getelementptr inbounds %struct.builtin, %struct.builtin* %arrayidx1, i32 0, i32 2
  %8 = load i32, i32* %flags, align 4
  %and = and i32 %8, 1
  %tobool2 = icmp ne i32 %and, 0
  br i1 %tobool2, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %9 = load %struct.builtin*, %struct.builtin** @shell_builtins, align 4
  %10 = load i32, i32* %i, align 4
  %arrayidx3 = getelementptr inbounds %struct.builtin, %struct.builtin* %9, i32 %10
  %name = getelementptr inbounds %struct.builtin, %struct.builtin* %arrayidx3, i32 0, i32 0
  %11 = load i8*, i8** %name, align 4
  %12 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %list = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %12, i32 0, i32 0
  %13 = load i8**, i8*** %list, align 4
  %14 = load i32, i32* %n, align 4
  %inc = add nsw i32 %14, 1
  store i32 %inc, i32* %n, align 4
  %arrayidx4 = getelementptr inbounds i8*, i8** %13, i32 %14
  store i8* %11, i8** %arrayidx4, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %15 = load i32, i32* %i, align 4
  %inc5 = add nsw i32 %15, 1
  store i32 %inc5, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %16 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %list6 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %16, i32 0, i32 0
  %17 = load i8**, i8*** %list6, align 4
  %18 = load i32, i32* %n, align 4
  %19 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %list_len = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %19, i32 0, i32 2
  store i32 %18, i32* %list_len, align 4
  %arrayidx7 = getelementptr inbounds i8*, i8** %17, i32 %18
  store i8* null, i8** %arrayidx7, align 4
  %20 = load %struct._list_of_items*, %struct._list_of_items** %itp.addr, align 4
  %flags8 = getelementptr inbounds %struct._list_of_items, %struct._list_of_items* %20, i32 0, i32 0
  %21 = load i32, i32* %flags8, align 4
  %or = or i32 %21, 32
  store i32 %or, i32* %flags8, align 4
  %22 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %23 = load %struct._list_of_items*, %struct._list_of_items** %itp.addr, align 4
  %slist = getelementptr inbounds %struct._list_of_items, %struct._list_of_items* %23, i32 0, i32 2
  store %struct._list_of_strings* %22, %struct._list_of_strings** %slist, align 4
  ret i32 0
}

; Function Attrs: noinline nounwind
define internal i32 @it_init_exported(%struct._list_of_items* %itp) #0 {
entry:
  %itp.addr = alloca %struct._list_of_items*, align 4
  store %struct._list_of_items* %itp, %struct._list_of_items** %itp.addr, align 4
  %0 = load %struct._list_of_items*, %struct._list_of_items** %itp.addr, align 4
  call void @init_itemlist_from_varlist(%struct._list_of_items* %0, %struct.variable** (...)* bitcast (%struct.variable** ()* @all_exported_variables to %struct.variable** (...)*))
  ret i32 0
}

; Function Attrs: noinline nounwind
define internal i32 @it_init_functions(%struct._list_of_items* %itp) #0 {
entry:
  %itp.addr = alloca %struct._list_of_items*, align 4
  store %struct._list_of_items* %itp, %struct._list_of_items** %itp.addr, align 4
  %0 = load %struct._list_of_items*, %struct._list_of_items** %itp.addr, align 4
  call void @init_itemlist_from_varlist(%struct._list_of_items* %0, %struct.variable** (...)* bitcast (%struct.variable** ()* @all_visible_functions to %struct.variable** (...)*))
  ret i32 0
}

; Function Attrs: noinline nounwind
define internal i32 @it_init_helptopics(%struct._list_of_items* %itp) #0 {
entry:
  %itp.addr = alloca %struct._list_of_items*, align 4
  %sl = alloca %struct._list_of_strings*, align 4
  %i = alloca i32, align 4
  %n = alloca i32, align 4
  store %struct._list_of_items* %itp, %struct._list_of_items** %itp.addr, align 4
  %0 = load i32, i32* @num_shell_builtins, align 4
  %call = call %struct._list_of_strings* @strlist_create(i32 %0)
  store %struct._list_of_strings* %call, %struct._list_of_strings** %sl, align 4
  store i32 0, i32* %n, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32, i32* %i, align 4
  %2 = load i32, i32* @num_shell_builtins, align 4
  %cmp = icmp slt i32 %1, %2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load %struct.builtin*, %struct.builtin** @shell_builtins, align 4
  %4 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds %struct.builtin, %struct.builtin* %3, i32 %4
  %name = getelementptr inbounds %struct.builtin, %struct.builtin* %arrayidx, i32 0, i32 0
  %5 = load i8*, i8** %name, align 4
  %6 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %list = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %6, i32 0, i32 0
  %7 = load i8**, i8*** %list, align 4
  %8 = load i32, i32* %n, align 4
  %inc = add nsw i32 %8, 1
  store i32 %inc, i32* %n, align 4
  %arrayidx1 = getelementptr inbounds i8*, i8** %7, i32 %8
  store i8* %5, i8** %arrayidx1, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4
  %inc2 = add nsw i32 %9, 1
  store i32 %inc2, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %10 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %list3 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %10, i32 0, i32 0
  %11 = load i8**, i8*** %list3, align 4
  %12 = load i32, i32* %n, align 4
  %13 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %list_len = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %13, i32 0, i32 2
  store i32 %12, i32* %list_len, align 4
  %arrayidx4 = getelementptr inbounds i8*, i8** %11, i32 %12
  store i8* null, i8** %arrayidx4, align 4
  %14 = load %struct._list_of_items*, %struct._list_of_items** %itp.addr, align 4
  %flags = getelementptr inbounds %struct._list_of_items, %struct._list_of_items* %14, i32 0, i32 0
  %15 = load i32, i32* %flags, align 4
  %or = or i32 %15, 32
  store i32 %or, i32* %flags, align 4
  %16 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %17 = load %struct._list_of_items*, %struct._list_of_items** %itp.addr, align 4
  %slist = getelementptr inbounds %struct._list_of_items, %struct._list_of_items* %17, i32 0, i32 2
  store %struct._list_of_strings* %16, %struct._list_of_strings** %slist, align 4
  ret i32 0
}

; Function Attrs: noinline nounwind
define internal i32 @it_init_hostnames(%struct._list_of_items* %itp) #0 {
entry:
  %itp.addr = alloca %struct._list_of_items*, align 4
  %sl = alloca %struct._list_of_strings*, align 4
  store %struct._list_of_items* %itp, %struct._list_of_items** %itp.addr, align 4
  %call = call %struct._list_of_strings* @strlist_create(i32 0)
  store %struct._list_of_strings* %call, %struct._list_of_strings** %sl, align 4
  %call1 = call i8** @get_hostname_list()
  %0 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %list = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %0, i32 0, i32 0
  store i8** %call1, i8*** %list, align 4
  %1 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %list2 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %1, i32 0, i32 0
  %2 = load i8**, i8*** %list2, align 4
  %tobool = icmp ne i8** %2, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %3 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %list3 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %3, i32 0, i32 0
  %4 = load i8**, i8*** %list3, align 4
  %call4 = call i32 @strvec_len(i8** %4)
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call4, %cond.true ], [ 0, %cond.false ]
  %5 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %list_len = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %5, i32 0, i32 2
  store i32 %cond, i32* %list_len, align 4
  %6 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %list_len5 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %6, i32 0, i32 2
  %7 = load i32, i32* %list_len5, align 4
  %8 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %list_size = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %8, i32 0, i32 1
  store i32 %7, i32* %list_size, align 4
  %9 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %10 = load %struct._list_of_items*, %struct._list_of_items** %itp.addr, align 4
  %slist = getelementptr inbounds %struct._list_of_items, %struct._list_of_items* %10, i32 0, i32 2
  store %struct._list_of_strings* %9, %struct._list_of_strings** %slist, align 4
  %11 = load %struct._list_of_items*, %struct._list_of_items** %itp.addr, align 4
  %flags = getelementptr inbounds %struct._list_of_items, %struct._list_of_items* %11, i32 0, i32 0
  %12 = load i32, i32* %flags, align 4
  %or = or i32 %12, 48
  store i32 %or, i32* %flags, align 4
  ret i32 0
}

; Function Attrs: noinline nounwind
define internal i32 @it_init_jobs(%struct._list_of_items* %itp) #0 {
entry:
  %itp.addr = alloca %struct._list_of_items*, align 4
  store %struct._list_of_items* %itp, %struct._list_of_items** %itp.addr, align 4
  %0 = load %struct._list_of_items*, %struct._list_of_items** %itp.addr, align 4
  %call = call i32 @it_init_joblist(%struct._list_of_items* %0, i32 -1)
  ret i32 %call
}

; Function Attrs: noinline nounwind
define internal i32 @it_init_keywords(%struct._list_of_items* %itp) #0 {
entry:
  %itp.addr = alloca %struct._list_of_items*, align 4
  %sl = alloca %struct._list_of_strings*, align 4
  %i = alloca i32, align 4
  %n = alloca i32, align 4
  store %struct._list_of_items* %itp, %struct._list_of_items** %itp.addr, align 4
  store i32 0, i32* %n, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %n, align 4
  %arrayidx = getelementptr inbounds [0 x %struct.STRING_INT_ALIST], [0 x %struct.STRING_INT_ALIST]* @word_token_alist, i32 0, i32 %0
  %word = getelementptr inbounds %struct.STRING_INT_ALIST, %struct.STRING_INT_ALIST* %arrayidx, i32 0, i32 0
  %1 = load i8*, i8** %word, align 4
  %tobool = icmp ne i8* %1, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %2 = load i32, i32* %n, align 4
  %inc = add nsw i32 %2, 1
  store i32 %inc, i32* %n, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %3 = load i32, i32* %n, align 4
  %call = call %struct._list_of_strings* @strlist_create(i32 %3)
  store %struct._list_of_strings* %call, %struct._list_of_strings** %sl, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc6, %for.end
  %4 = load i32, i32* %i, align 4
  %5 = load i32, i32* %n, align 4
  %cmp = icmp slt i32 %4, %5
  br i1 %cmp, label %for.body2, label %for.end8

for.body2:                                        ; preds = %for.cond1
  %6 = load i32, i32* %i, align 4
  %arrayidx3 = getelementptr inbounds [0 x %struct.STRING_INT_ALIST], [0 x %struct.STRING_INT_ALIST]* @word_token_alist, i32 0, i32 %6
  %word4 = getelementptr inbounds %struct.STRING_INT_ALIST, %struct.STRING_INT_ALIST* %arrayidx3, i32 0, i32 0
  %7 = load i8*, i8** %word4, align 4
  %8 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %list = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %8, i32 0, i32 0
  %9 = load i8**, i8*** %list, align 4
  %10 = load i32, i32* %i, align 4
  %arrayidx5 = getelementptr inbounds i8*, i8** %9, i32 %10
  store i8* %7, i8** %arrayidx5, align 4
  br label %for.inc6

for.inc6:                                         ; preds = %for.body2
  %11 = load i32, i32* %i, align 4
  %inc7 = add nsw i32 %11, 1
  store i32 %inc7, i32* %i, align 4
  br label %for.cond1

for.end8:                                         ; preds = %for.cond1
  %12 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %list9 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %12, i32 0, i32 0
  %13 = load i8**, i8*** %list9, align 4
  %14 = load i32, i32* %i, align 4
  %15 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %list_len = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %15, i32 0, i32 2
  store i32 %14, i32* %list_len, align 4
  %arrayidx10 = getelementptr inbounds i8*, i8** %13, i32 %14
  store i8* null, i8** %arrayidx10, align 4
  %16 = load %struct._list_of_items*, %struct._list_of_items** %itp.addr, align 4
  %flags = getelementptr inbounds %struct._list_of_items, %struct._list_of_items* %16, i32 0, i32 0
  %17 = load i32, i32* %flags, align 4
  %or = or i32 %17, 32
  store i32 %or, i32* %flags, align 4
  %18 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %19 = load %struct._list_of_items*, %struct._list_of_items** %itp.addr, align 4
  %slist = getelementptr inbounds %struct._list_of_items, %struct._list_of_items* %19, i32 0, i32 2
  store %struct._list_of_strings* %18, %struct._list_of_strings** %slist, align 4
  ret i32 0
}

; Function Attrs: noinline nounwind
define internal i32 @it_init_running(%struct._list_of_items* %itp) #0 {
entry:
  %itp.addr = alloca %struct._list_of_items*, align 4
  store %struct._list_of_items* %itp, %struct._list_of_items** %itp.addr, align 4
  %0 = load %struct._list_of_items*, %struct._list_of_items** %itp.addr, align 4
  %call = call i32 @it_init_joblist(%struct._list_of_items* %0, i32 0)
  ret i32 %call
}

; Function Attrs: noinline nounwind
define internal i32 @it_init_setopts(%struct._list_of_items* %itp) #0 {
entry:
  %itp.addr = alloca %struct._list_of_items*, align 4
  %sl = alloca %struct._list_of_strings*, align 4
  store %struct._list_of_items* %itp, %struct._list_of_items** %itp.addr, align 4
  %call = call %struct._list_of_strings* @strlist_create(i32 0)
  store %struct._list_of_strings* %call, %struct._list_of_strings** %sl, align 4
  %call1 = call i8** @get_minus_o_opts()
  %0 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %list = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %0, i32 0, i32 0
  store i8** %call1, i8*** %list, align 4
  %1 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %list2 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %1, i32 0, i32 0
  %2 = load i8**, i8*** %list2, align 4
  %call3 = call i32 @strvec_len(i8** %2)
  %3 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %list_len = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %3, i32 0, i32 2
  store i32 %call3, i32* %list_len, align 4
  %4 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %5 = load %struct._list_of_items*, %struct._list_of_items** %itp.addr, align 4
  %slist = getelementptr inbounds %struct._list_of_items, %struct._list_of_items* %5, i32 0, i32 2
  store %struct._list_of_strings* %4, %struct._list_of_strings** %slist, align 4
  %6 = load %struct._list_of_items*, %struct._list_of_items** %itp.addr, align 4
  %flags = getelementptr inbounds %struct._list_of_items, %struct._list_of_items* %6, i32 0, i32 0
  %7 = load i32, i32* %flags, align 4
  %or = or i32 %7, 32
  store i32 %or, i32* %flags, align 4
  ret i32 0
}

; Function Attrs: noinline nounwind
define internal i32 @it_init_shopts(%struct._list_of_items* %itp) #0 {
entry:
  %itp.addr = alloca %struct._list_of_items*, align 4
  %sl = alloca %struct._list_of_strings*, align 4
  store %struct._list_of_items* %itp, %struct._list_of_items** %itp.addr, align 4
  %call = call %struct._list_of_strings* @strlist_create(i32 0)
  store %struct._list_of_strings* %call, %struct._list_of_strings** %sl, align 4
  %call1 = call i8** @get_shopt_options()
  %0 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %list = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %0, i32 0, i32 0
  store i8** %call1, i8*** %list, align 4
  %1 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %list2 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %1, i32 0, i32 0
  %2 = load i8**, i8*** %list2, align 4
  %call3 = call i32 @strvec_len(i8** %2)
  %3 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %list_len = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %3, i32 0, i32 2
  store i32 %call3, i32* %list_len, align 4
  %4 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %5 = load %struct._list_of_items*, %struct._list_of_items** %itp.addr, align 4
  %slist = getelementptr inbounds %struct._list_of_items, %struct._list_of_items* %5, i32 0, i32 2
  store %struct._list_of_strings* %4, %struct._list_of_strings** %slist, align 4
  %6 = load %struct._list_of_items*, %struct._list_of_items** %itp.addr, align 4
  %flags = getelementptr inbounds %struct._list_of_items, %struct._list_of_items* %6, i32 0, i32 0
  %7 = load i32, i32* %flags, align 4
  %or = or i32 %7, 32
  store i32 %or, i32* %flags, align 4
  ret i32 0
}

; Function Attrs: noinline nounwind
define internal i32 @it_init_signals(%struct._list_of_items* %itp) #0 {
entry:
  %itp.addr = alloca %struct._list_of_items*, align 4
  %sl = alloca %struct._list_of_strings*, align 4
  store %struct._list_of_items* %itp, %struct._list_of_items** %itp.addr, align 4
  %call = call %struct._list_of_strings* @strlist_create(i32 0)
  store %struct._list_of_strings* %call, %struct._list_of_strings** %sl, align 4
  %0 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %list = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %0, i32 0, i32 0
  store i8** getelementptr inbounds ([0 x i8*], [0 x i8*]* @signal_names, i32 0, i32 0), i8*** %list, align 4
  %1 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %list1 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %1, i32 0, i32 0
  %2 = load i8**, i8*** %list1, align 4
  %call2 = call i32 @strvec_len(i8** %2)
  %3 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %list_len = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %3, i32 0, i32 2
  store i32 %call2, i32* %list_len, align 4
  %4 = load %struct._list_of_items*, %struct._list_of_items** %itp.addr, align 4
  %flags = getelementptr inbounds %struct._list_of_items, %struct._list_of_items* %4, i32 0, i32 0
  %5 = load i32, i32* %flags, align 4
  %or = or i32 %5, 16
  store i32 %or, i32* %flags, align 4
  %6 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %7 = load %struct._list_of_items*, %struct._list_of_items** %itp.addr, align 4
  %slist = getelementptr inbounds %struct._list_of_items, %struct._list_of_items* %7, i32 0, i32 2
  store %struct._list_of_strings* %6, %struct._list_of_strings** %slist, align 4
  ret i32 0
}

; Function Attrs: noinline nounwind
define internal i32 @it_init_stopped(%struct._list_of_items* %itp) #0 {
entry:
  %itp.addr = alloca %struct._list_of_items*, align 4
  store %struct._list_of_items* %itp, %struct._list_of_items** %itp.addr, align 4
  %0 = load %struct._list_of_items*, %struct._list_of_items** %itp.addr, align 4
  %call = call i32 @it_init_joblist(%struct._list_of_items* %0, i32 1)
  ret i32 %call
}

; Function Attrs: noinline nounwind
define internal i32 @it_init_variables(%struct._list_of_items* %itp) #0 {
entry:
  %itp.addr = alloca %struct._list_of_items*, align 4
  store %struct._list_of_items* %itp, %struct._list_of_items** %itp.addr, align 4
  %0 = load %struct._list_of_items*, %struct._list_of_items** %itp.addr, align 4
  call void @init_itemlist_from_varlist(%struct._list_of_items* %0, %struct.variable** (...)* bitcast (%struct.variable** ()* @all_visible_variables to %struct.variable** (...)*))
  ret i32 0
}

; Function Attrs: noinline nounwind
define void @set_itemlist_dirty(%struct._list_of_items* %it) #0 {
entry:
  %it.addr = alloca %struct._list_of_items*, align 4
  store %struct._list_of_items* %it, %struct._list_of_items** %it.addr, align 4
  %0 = load %struct._list_of_items*, %struct._list_of_items** %it.addr, align 4
  %flags = getelementptr inbounds %struct._list_of_items, %struct._list_of_items* %0, i32 0, i32 0
  %1 = load i32, i32* %flags, align 4
  %or = or i32 %1, 2
  store i32 %or, i32* %flags, align 4
  ret void
}

; Function Attrs: noinline nounwind
define void @initialize_itemlist(%struct._list_of_items* %itp) #0 {
entry:
  %itp.addr = alloca %struct._list_of_items*, align 4
  store %struct._list_of_items* %itp, %struct._list_of_items** %itp.addr, align 4
  %0 = load %struct._list_of_items*, %struct._list_of_items** %itp.addr, align 4
  %list_getter = getelementptr inbounds %struct._list_of_items, %struct._list_of_items* %0, i32 0, i32 1
  %list_getter1 = bitcast {}** %list_getter to i32 (%struct._list_of_items*)**
  %1 = load i32 (%struct._list_of_items*)*, i32 (%struct._list_of_items*)** %list_getter1, align 4
  %2 = load %struct._list_of_items*, %struct._list_of_items** %itp.addr, align 4
  %call = call i32 %1(%struct._list_of_items* %2)
  %3 = load %struct._list_of_items*, %struct._list_of_items** %itp.addr, align 4
  %flags = getelementptr inbounds %struct._list_of_items, %struct._list_of_items* %3, i32 0, i32 0
  %4 = load i32, i32* %flags, align 4
  %or = or i32 %4, 4
  store i32 %or, i32* %flags, align 4
  %5 = load %struct._list_of_items*, %struct._list_of_items** %itp.addr, align 4
  %flags2 = getelementptr inbounds %struct._list_of_items, %struct._list_of_items* %5, i32 0, i32 0
  %6 = load i32, i32* %flags2, align 4
  %and = and i32 %6, -3
  store i32 %and, i32* %flags2, align 4
  ret void
}

; Function Attrs: noinline nounwind
define void @clean_itemlist(%struct._list_of_items* %itp) #0 {
entry:
  %itp.addr = alloca %struct._list_of_items*, align 4
  %sl = alloca %struct._list_of_strings*, align 4
  store %struct._list_of_items* %itp, %struct._list_of_items** %itp.addr, align 4
  %0 = load %struct._list_of_items*, %struct._list_of_items** %itp.addr, align 4
  %slist = getelementptr inbounds %struct._list_of_items, %struct._list_of_items* %0, i32 0, i32 2
  %1 = load %struct._list_of_strings*, %struct._list_of_strings** %slist, align 4
  store %struct._list_of_strings* %1, %struct._list_of_strings** %sl, align 4
  %2 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %tobool = icmp ne %struct._list_of_strings* %2, null
  br i1 %tobool, label %if.then, label %if.end8

if.then:                                          ; preds = %entry
  %3 = load %struct._list_of_items*, %struct._list_of_items** %itp.addr, align 4
  %flags = getelementptr inbounds %struct._list_of_items, %struct._list_of_items* %3, i32 0, i32 0
  %4 = load i32, i32* %flags, align 4
  %and = and i32 %4, 48
  %cmp = icmp eq i32 %and, 0
  br i1 %cmp, label %if.then1, label %if.end

if.then1:                                         ; preds = %if.then
  %5 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %list = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %5, i32 0, i32 0
  %6 = load i8**, i8*** %list, align 4
  call void @strvec_flush(i8** %6)
  br label %if.end

if.end:                                           ; preds = %if.then1, %if.then
  %7 = load %struct._list_of_items*, %struct._list_of_items** %itp.addr, align 4
  %flags2 = getelementptr inbounds %struct._list_of_items, %struct._list_of_items* %7, i32 0, i32 0
  %8 = load i32, i32* %flags2, align 4
  %and3 = and i32 %8, 16
  %cmp4 = icmp eq i32 %and3, 0
  br i1 %cmp4, label %if.then5, label %if.end7

if.then5:                                         ; preds = %if.end
  %9 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %list6 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %9, i32 0, i32 0
  %10 = load i8**, i8*** %list6, align 4
  %11 = bitcast i8** %10 to i8*
  call void @sh_xfree(i8* %11, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i32 246)
  br label %if.end7

if.end7:                                          ; preds = %if.then5, %if.end
  %12 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %13 = bitcast %struct._list_of_strings* %12 to i8*
  call void @sh_xfree(i8* %13, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i32 247)
  br label %if.end8

if.end8:                                          ; preds = %if.end7, %entry
  %14 = load %struct._list_of_items*, %struct._list_of_items** %itp.addr, align 4
  %slist9 = getelementptr inbounds %struct._list_of_items, %struct._list_of_items* %14, i32 0, i32 2
  store %struct._list_of_strings* null, %struct._list_of_strings** %slist9, align 4
  %15 = load %struct._list_of_items*, %struct._list_of_items** %itp.addr, align 4
  %flags10 = getelementptr inbounds %struct._list_of_items, %struct._list_of_items* %15, i32 0, i32 0
  %16 = load i32, i32* %flags10, align 4
  %and11 = and i32 %16, -55
  store i32 %and11, i32* %flags10, align 4
  ret void
}

declare void @strvec_flush(i8**) #1

declare void @sh_xfree(i8*, i8*, i32) #1

; Function Attrs: noinline nounwind
define %struct._list_of_strings* @filter_stringlist(%struct._list_of_strings* %sl, i8* %filterpat, i8* %text) #0 {
entry:
  %retval = alloca %struct._list_of_strings*, align 4
  %sl.addr = alloca %struct._list_of_strings*, align 4
  %filterpat.addr = alloca i8*, align 4
  %text.addr = alloca i8*, align 4
  %i = alloca i32, align 4
  %m = alloca i32, align 4
  %not = alloca i32, align 4
  %ret = alloca %struct._list_of_strings*, align 4
  %npat = alloca i8*, align 4
  %t = alloca i8*, align 4
  store %struct._list_of_strings* %sl, %struct._list_of_strings** %sl.addr, align 4
  store i8* %filterpat, i8** %filterpat.addr, align 4
  store i8* %text, i8** %text.addr, align 4
  %0 = load %struct._list_of_strings*, %struct._list_of_strings** %sl.addr, align 4
  %cmp = icmp eq %struct._list_of_strings* %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load %struct._list_of_strings*, %struct._list_of_strings** %sl.addr, align 4
  %list = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %1, i32 0, i32 0
  %2 = load i8**, i8*** %list, align 4
  %cmp1 = icmp eq i8** %2, null
  br i1 %cmp1, label %if.then, label %lor.lhs.false2

lor.lhs.false2:                                   ; preds = %lor.lhs.false
  %3 = load %struct._list_of_strings*, %struct._list_of_strings** %sl.addr, align 4
  %list_len = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %3, i32 0, i32 2
  %4 = load i32, i32* %list_len, align 4
  %cmp3 = icmp eq i32 %4, 0
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false2, %lor.lhs.false, %entry
  %5 = load %struct._list_of_strings*, %struct._list_of_strings** %sl.addr, align 4
  store %struct._list_of_strings* %5, %struct._list_of_strings** %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false2
  %6 = load i8*, i8** %filterpat.addr, align 4
  %call = call i32 @shouldexp_filterpat(i8* %6)
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end
  %7 = load i8*, i8** %filterpat.addr, align 4
  %8 = load i8*, i8** %text.addr, align 4
  %call4 = call i8* @preproc_filterpat(i8* %7, i8* %8)
  br label %cond.end

cond.false:                                       ; preds = %if.end
  %9 = load i8*, i8** %filterpat.addr, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %call4, %cond.true ], [ %9, %cond.false ]
  store i8* %cond, i8** %npat, align 4
  %10 = load i8*, i8** %npat, align 4
  %arrayidx = getelementptr inbounds i8, i8* %10, i32 0
  %11 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %11 to i32
  %cmp5 = icmp eq i32 %conv, 33
  br i1 %cmp5, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %cond.end
  %12 = load i32, i32* @extended_glob, align 4
  %cmp7 = icmp eq i32 %12, 0
  br i1 %cmp7, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %land.rhs
  %13 = load i8*, i8** %npat, align 4
  %arrayidx9 = getelementptr inbounds i8, i8* %13, i32 1
  %14 = load i8, i8* %arrayidx9, align 1
  %conv10 = sext i8 %14 to i32
  %cmp11 = icmp ne i32 %conv10, 40
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %land.rhs
  %15 = phi i1 [ true, %land.rhs ], [ %cmp11, %lor.rhs ]
  br label %land.end

land.end:                                         ; preds = %lor.end, %cond.end
  %16 = phi i1 [ false, %cond.end ], [ %15, %lor.end ]
  %land.ext = zext i1 %16 to i32
  store i32 %land.ext, i32* %not, align 4
  %17 = load i32, i32* %not, align 4
  %tobool13 = icmp ne i32 %17, 0
  br i1 %tobool13, label %cond.true14, label %cond.false15

cond.true14:                                      ; preds = %land.end
  %18 = load i8*, i8** %npat, align 4
  %add.ptr = getelementptr inbounds i8, i8* %18, i32 1
  br label %cond.end16

cond.false15:                                     ; preds = %land.end
  %19 = load i8*, i8** %npat, align 4
  br label %cond.end16

cond.end16:                                       ; preds = %cond.false15, %cond.true14
  %cond17 = phi i8* [ %add.ptr, %cond.true14 ], [ %19, %cond.false15 ]
  store i8* %cond17, i8** %t, align 4
  %20 = load %struct._list_of_strings*, %struct._list_of_strings** %sl.addr, align 4
  %list_size = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %20, i32 0, i32 1
  %21 = load i32, i32* %list_size, align 4
  %call18 = call %struct._list_of_strings* @strlist_create(i32 %21)
  store %struct._list_of_strings* %call18, %struct._list_of_strings** %ret, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %cond.end16
  %22 = load i32, i32* %i, align 4
  %23 = load %struct._list_of_strings*, %struct._list_of_strings** %sl.addr, align 4
  %list_len19 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %23, i32 0, i32 2
  %24 = load i32, i32* %list_len19, align 4
  %cmp20 = icmp slt i32 %22, %24
  br i1 %cmp20, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %25 = load i8*, i8** %t, align 4
  %26 = load %struct._list_of_strings*, %struct._list_of_strings** %sl.addr, align 4
  %list22 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %26, i32 0, i32 0
  %27 = load i8**, i8*** %list22, align 4
  %28 = load i32, i32* %i, align 4
  %arrayidx23 = getelementptr inbounds i8*, i8** %27, i32 %28
  %29 = load i8*, i8** %arrayidx23, align 4
  %30 = load i32, i32* @extended_glob, align 4
  %tobool24 = icmp ne i32 %30, 0
  %cond25 = select i1 %tobool24, i32 32, i32 0
  %31 = load i32, i32* @match_ignore_case, align 4
  %tobool26 = icmp ne i32 %31, 0
  %cond27 = select i1 %tobool26, i32 16, i32 0
  %or = or i32 %cond25, %cond27
  %call28 = call i32 @strmatch(i8* %25, i8* %29, i32 %or)
  store i32 %call28, i32* %m, align 4
  %32 = load i32, i32* %not, align 4
  %tobool29 = icmp ne i32 %32, 0
  br i1 %tobool29, label %land.lhs.true, label %lor.lhs.false32

land.lhs.true:                                    ; preds = %for.body
  %33 = load i32, i32* %m, align 4
  %cmp30 = icmp eq i32 %33, 1
  br i1 %cmp30, label %if.then38, label %lor.lhs.false32

lor.lhs.false32:                                  ; preds = %land.lhs.true, %for.body
  %34 = load i32, i32* %not, align 4
  %cmp33 = icmp eq i32 %34, 0
  br i1 %cmp33, label %land.lhs.true35, label %if.else

land.lhs.true35:                                  ; preds = %lor.lhs.false32
  %35 = load i32, i32* %m, align 4
  %cmp36 = icmp ne i32 %35, 1
  br i1 %cmp36, label %if.then38, label %if.else

if.then38:                                        ; preds = %land.lhs.true35, %land.lhs.true
  %36 = load %struct._list_of_strings*, %struct._list_of_strings** %sl.addr, align 4
  %list39 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %36, i32 0, i32 0
  %37 = load i8**, i8*** %list39, align 4
  %38 = load i32, i32* %i, align 4
  %arrayidx40 = getelementptr inbounds i8*, i8** %37, i32 %38
  %39 = load i8*, i8** %arrayidx40, align 4
  call void @sh_xfree(i8* %39, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i32 316)
  br label %if.end46

if.else:                                          ; preds = %land.lhs.true35, %lor.lhs.false32
  %40 = load %struct._list_of_strings*, %struct._list_of_strings** %sl.addr, align 4
  %list41 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %40, i32 0, i32 0
  %41 = load i8**, i8*** %list41, align 4
  %42 = load i32, i32* %i, align 4
  %arrayidx42 = getelementptr inbounds i8*, i8** %41, i32 %42
  %43 = load i8*, i8** %arrayidx42, align 4
  %44 = load %struct._list_of_strings*, %struct._list_of_strings** %ret, align 4
  %list43 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %44, i32 0, i32 0
  %45 = load i8**, i8*** %list43, align 4
  %46 = load %struct._list_of_strings*, %struct._list_of_strings** %ret, align 4
  %list_len44 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %46, i32 0, i32 2
  %47 = load i32, i32* %list_len44, align 4
  %inc = add nsw i32 %47, 1
  store i32 %inc, i32* %list_len44, align 4
  %arrayidx45 = getelementptr inbounds i8*, i8** %45, i32 %47
  store i8* %43, i8** %arrayidx45, align 4
  br label %if.end46

if.end46:                                         ; preds = %if.else, %if.then38
  br label %for.inc

for.inc:                                          ; preds = %if.end46
  %48 = load i32, i32* %i, align 4
  %inc47 = add nsw i32 %48, 1
  store i32 %inc47, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %49 = load %struct._list_of_strings*, %struct._list_of_strings** %ret, align 4
  %list48 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %49, i32 0, i32 0
  %50 = load i8**, i8*** %list48, align 4
  %51 = load %struct._list_of_strings*, %struct._list_of_strings** %ret, align 4
  %list_len49 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %51, i32 0, i32 2
  %52 = load i32, i32* %list_len49, align 4
  %arrayidx50 = getelementptr inbounds i8*, i8** %50, i32 %52
  store i8* null, i8** %arrayidx50, align 4
  %53 = load i8*, i8** %npat, align 4
  %54 = load i8*, i8** %filterpat.addr, align 4
  %cmp51 = icmp ne i8* %53, %54
  br i1 %cmp51, label %if.then53, label %if.end54

if.then53:                                        ; preds = %for.end
  %55 = load i8*, i8** %npat, align 4
  call void @sh_xfree(i8* %55, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i32 323)
  br label %if.end54

if.end54:                                         ; preds = %if.then53, %for.end
  %56 = load %struct._list_of_strings*, %struct._list_of_strings** %ret, align 4
  store %struct._list_of_strings* %56, %struct._list_of_strings** %retval, align 4
  br label %return

return:                                           ; preds = %if.end54, %if.then
  %57 = load %struct._list_of_strings*, %struct._list_of_strings** %retval, align 4
  ret %struct._list_of_strings* %57
}

; Function Attrs: noinline nounwind
define internal i32 @shouldexp_filterpat(i8* %s) #0 {
entry:
  %retval = alloca i32, align 4
  %s.addr = alloca i8*, align 4
  %p = alloca i8*, align 4
  store i8* %s, i8** %s.addr, align 4
  %0 = load i8*, i8** %s.addr, align 4
  store i8* %0, i8** %p, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i8*, i8** %p, align 4
  %tobool = icmp ne i8* %1, null
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.cond
  %2 = load i8*, i8** %p, align 4
  %3 = load i8, i8* %2, align 1
  %conv = sext i8 %3 to i32
  %tobool1 = icmp ne i32 %conv, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %4 = phi i1 [ false, %for.cond ], [ %tobool1, %land.rhs ]
  br i1 %4, label %for.body, label %for.end

for.body:                                         ; preds = %land.end
  %5 = load i8*, i8** %p, align 4
  %6 = load i8, i8* %5, align 1
  %conv2 = sext i8 %6 to i32
  %cmp = icmp eq i32 %conv2, 92
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %for.body
  %7 = load i8*, i8** %p, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %7, i32 1
  store i8* %incdec.ptr, i8** %p, align 4
  br label %if.end8

if.else:                                          ; preds = %for.body
  %8 = load i8*, i8** %p, align 4
  %9 = load i8, i8* %8, align 1
  %conv4 = sext i8 %9 to i32
  %cmp5 = icmp eq i32 %conv4, 38
  br i1 %cmp5, label %if.then7, label %if.end

if.then7:                                         ; preds = %if.else
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %if.else
  br label %if.end8

if.end8:                                          ; preds = %if.end, %if.then
  br label %for.inc

for.inc:                                          ; preds = %if.end8
  %10 = load i8*, i8** %p, align 4
  %incdec.ptr9 = getelementptr inbounds i8, i8* %10, i32 1
  store i8* %incdec.ptr9, i8** %p, align 4
  br label %for.cond

for.end:                                          ; preds = %land.end
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then7
  %11 = load i32, i32* %retval, align 4
  ret i32 %11
}

; Function Attrs: noinline nounwind
define internal i8* @preproc_filterpat(i8* %pat, i8* %text) #0 {
entry:
  %pat.addr = alloca i8*, align 4
  %text.addr = alloca i8*, align 4
  %ret = alloca i8*, align 4
  store i8* %pat, i8** %pat.addr, align 4
  store i8* %text, i8** %text.addr, align 4
  %0 = load i8*, i8** %pat.addr, align 4
  %1 = load i8*, i8** %text.addr, align 4
  %call = call i8* @strcreplace(i8* %0, i32 38, i8* %1, i32 1)
  store i8* %call, i8** %ret, align 4
  %2 = load i8*, i8** %ret, align 4
  ret i8* %2
}

declare %struct._list_of_strings* @strlist_create(i32) #1

declare i32 @strmatch(i8*, i8*, i32) #1

; Function Attrs: noinline nounwind
define %struct._list_of_strings* @completions_to_stringlist(i8** %matches) #0 {
entry:
  %retval = alloca %struct._list_of_strings*, align 4
  %matches.addr = alloca i8**, align 4
  %sl = alloca %struct._list_of_strings*, align 4
  %mlen = alloca i32, align 4
  %i = alloca i32, align 4
  %n = alloca i32, align 4
  store i8** %matches, i8*** %matches.addr, align 4
  %0 = load i8**, i8*** %matches.addr, align 4
  %cmp = icmp eq i8** %0, null
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  br label %cond.end

cond.false:                                       ; preds = %entry
  %1 = load i8**, i8*** %matches.addr, align 4
  %call = call i32 @strvec_len(i8** %1)
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 0, %cond.true ], [ %call, %cond.false ]
  store i32 %cond, i32* %mlen, align 4
  %2 = load i32, i32* %mlen, align 4
  %add = add nsw i32 %2, 1
  %call1 = call %struct._list_of_strings* @strlist_create(i32 %add)
  store %struct._list_of_strings* %call1, %struct._list_of_strings** %sl, align 4
  %3 = load i8**, i8*** %matches.addr, align 4
  %cmp2 = icmp eq i8** %3, null
  br i1 %cmp2, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %cond.end
  %4 = load i8**, i8*** %matches.addr, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %4, i32 0
  %5 = load i8*, i8** %arrayidx, align 4
  %cmp3 = icmp eq i8* %5, null
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %cond.end
  %6 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  store %struct._list_of_strings* %6, %struct._list_of_strings** %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %7 = load i8**, i8*** %matches.addr, align 4
  %arrayidx4 = getelementptr inbounds i8*, i8** %7, i32 1
  %8 = load i8*, i8** %arrayidx4, align 4
  %cmp5 = icmp eq i8* %8, null
  br i1 %cmp5, label %if.then6, label %if.end21

if.then6:                                         ; preds = %if.end
  %9 = load i8**, i8*** %matches.addr, align 4
  %arrayidx7 = getelementptr inbounds i8*, i8** %9, i32 0
  %10 = load i8*, i8** %arrayidx7, align 4
  %tobool = icmp ne i8* %10, null
  br i1 %tobool, label %cond.true8, label %cond.false15

cond.true8:                                       ; preds = %if.then6
  %11 = load i8**, i8*** %matches.addr, align 4
  %arrayidx9 = getelementptr inbounds i8*, i8** %11, i32 0
  %12 = load i8*, i8** %arrayidx9, align 4
  %call10 = call i32 @strlen(i8* %12)
  %add11 = add i32 1, %call10
  %call12 = call i8* @sh_xmalloc(i32 %add11, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i32 346)
  %13 = load i8**, i8*** %matches.addr, align 4
  %arrayidx13 = getelementptr inbounds i8*, i8** %13, i32 0
  %14 = load i8*, i8** %arrayidx13, align 4
  %call14 = call i8* @strcpy(i8* %call12, i8* %14)
  br label %cond.end16

cond.false15:                                     ; preds = %if.then6
  br label %cond.end16

cond.end16:                                       ; preds = %cond.false15, %cond.true8
  %cond17 = phi i8* [ %call14, %cond.true8 ], [ null, %cond.false15 ]
  %15 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %list = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %15, i32 0, i32 0
  %16 = load i8**, i8*** %list, align 4
  %arrayidx18 = getelementptr inbounds i8*, i8** %16, i32 0
  store i8* %cond17, i8** %arrayidx18, align 4
  %17 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %list19 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %17, i32 0, i32 0
  %18 = load i8**, i8*** %list19, align 4
  %19 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %list_len = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %19, i32 0, i32 2
  store i32 1, i32* %list_len, align 4
  %arrayidx20 = getelementptr inbounds i8*, i8** %18, i32 1
  store i8* null, i8** %arrayidx20, align 4
  %20 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  store %struct._list_of_strings* %20, %struct._list_of_strings** %retval, align 4
  br label %return

if.end21:                                         ; preds = %if.end
  store i32 1, i32* %i, align 4
  store i32 0, i32* %n, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end21
  %21 = load i32, i32* %i, align 4
  %22 = load i32, i32* %mlen, align 4
  %cmp22 = icmp slt i32 %21, %22
  br i1 %cmp22, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %23 = load i8**, i8*** %matches.addr, align 4
  %24 = load i32, i32* %i, align 4
  %arrayidx23 = getelementptr inbounds i8*, i8** %23, i32 %24
  %25 = load i8*, i8** %arrayidx23, align 4
  %tobool24 = icmp ne i8* %25, null
  br i1 %tobool24, label %cond.true25, label %cond.false32

cond.true25:                                      ; preds = %for.body
  %26 = load i8**, i8*** %matches.addr, align 4
  %27 = load i32, i32* %i, align 4
  %arrayidx26 = getelementptr inbounds i8*, i8** %26, i32 %27
  %28 = load i8*, i8** %arrayidx26, align 4
  %call27 = call i32 @strlen(i8* %28)
  %add28 = add i32 1, %call27
  %call29 = call i8* @sh_xmalloc(i32 %add28, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i32 352)
  %29 = load i8**, i8*** %matches.addr, align 4
  %30 = load i32, i32* %i, align 4
  %arrayidx30 = getelementptr inbounds i8*, i8** %29, i32 %30
  %31 = load i8*, i8** %arrayidx30, align 4
  %call31 = call i8* @strcpy(i8* %call29, i8* %31)
  br label %cond.end33

cond.false32:                                     ; preds = %for.body
  br label %cond.end33

cond.end33:                                       ; preds = %cond.false32, %cond.true25
  %cond34 = phi i8* [ %call31, %cond.true25 ], [ null, %cond.false32 ]
  %32 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %list35 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %32, i32 0, i32 0
  %33 = load i8**, i8*** %list35, align 4
  %34 = load i32, i32* %n, align 4
  %arrayidx36 = getelementptr inbounds i8*, i8** %33, i32 %34
  store i8* %cond34, i8** %arrayidx36, align 4
  br label %for.inc

for.inc:                                          ; preds = %cond.end33
  %35 = load i32, i32* %i, align 4
  %inc = add nsw i32 %35, 1
  store i32 %inc, i32* %i, align 4
  %36 = load i32, i32* %n, align 4
  %inc37 = add nsw i32 %36, 1
  store i32 %inc37, i32* %n, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %37 = load i32, i32* %n, align 4
  %38 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %list_len38 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %38, i32 0, i32 2
  store i32 %37, i32* %list_len38, align 4
  %39 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %list39 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %39, i32 0, i32 0
  %40 = load i8**, i8*** %list39, align 4
  %41 = load i32, i32* %n, align 4
  %arrayidx40 = getelementptr inbounds i8*, i8** %40, i32 %41
  store i8* null, i8** %arrayidx40, align 4
  %42 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  store %struct._list_of_strings* %42, %struct._list_of_strings** %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %cond.end16, %if.then
  %43 = load %struct._list_of_strings*, %struct._list_of_strings** %retval, align 4
  ret %struct._list_of_strings* %43
}

declare i32 @strvec_len(i8**) #1

declare i8* @strcpy(i8*, i8*) #1

declare i8* @sh_xmalloc(i32, i8*, i32) #1

declare i32 @strlen(i8*) #1

; Function Attrs: noinline nounwind
define %struct._list_of_strings* @gen_compspec_completions(%struct.compspec* %cs, i8* %cmd, i8* %word, i32 %start, i32 %end, i32* %foundp) #0 {
entry:
  %retval = alloca %struct._list_of_strings*, align 4
  %cs.addr = alloca %struct.compspec*, align 4
  %cmd.addr = alloca i8*, align 4
  %word.addr = alloca i8*, align 4
  %start.addr = alloca i32, align 4
  %end.addr = alloca i32, align 4
  %foundp.addr = alloca i32*, align 4
  %ret = alloca %struct._list_of_strings*, align 4
  %tmatches = alloca %struct._list_of_strings*, align 4
  %line = alloca i8*, align 4
  %llen = alloca i32, align 4
  %nw = alloca i32, align 4
  %cw = alloca i32, align 4
  %found = alloca i32, align 4
  %foundf = alloca i32, align 4
  %lwords = alloca %struct.word_list*, align 4
  %lw = alloca %struct.word_desc*, align 4
  %tcs = alloca %struct.compspec*, align 4
  store %struct.compspec* %cs, %struct.compspec** %cs.addr, align 4
  store i8* %cmd, i8** %cmd.addr, align 4
  store i8* %word, i8** %word.addr, align 4
  store i32 %start, i32* %start.addr, align 4
  store i32 %end, i32* %end.addr, align 4
  store i32* %foundp, i32** %foundp.addr, align 4
  store i32 1, i32* %found, align 4
  %0 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %1 = load i8*, i8** %word.addr, align 4
  %call = call %struct._list_of_strings* @gen_action_completions(%struct.compspec* %0, i8* %1)
  store %struct._list_of_strings* %call, %struct._list_of_strings** %ret, align 4
  %2 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %globpat = getelementptr inbounds %struct.compspec, %struct.compspec* %2, i32 0, i32 3
  %3 = load i8*, i8** %globpat, align 4
  %tobool = icmp ne i8* %3, null
  br i1 %tobool, label %if.then, label %if.end5

if.then:                                          ; preds = %entry
  %4 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %5 = load i8*, i8** %word.addr, align 4
  %call1 = call %struct._list_of_strings* @gen_globpat_matches(%struct.compspec* %4, i8* %5)
  store %struct._list_of_strings* %call1, %struct._list_of_strings** %tmatches, align 4
  %6 = load %struct._list_of_strings*, %struct._list_of_strings** %tmatches, align 4
  %tobool2 = icmp ne %struct._list_of_strings* %6, null
  br i1 %tobool2, label %if.then3, label %if.end

if.then3:                                         ; preds = %if.then
  %7 = load %struct._list_of_strings*, %struct._list_of_strings** %ret, align 4
  %8 = load %struct._list_of_strings*, %struct._list_of_strings** %tmatches, align 4
  %call4 = call %struct._list_of_strings* @strlist_append(%struct._list_of_strings* %7, %struct._list_of_strings* %8)
  store %struct._list_of_strings* %call4, %struct._list_of_strings** %ret, align 4
  %9 = load %struct._list_of_strings*, %struct._list_of_strings** %tmatches, align 4
  call void @strlist_dispose(%struct._list_of_strings* %9)
  store i32 1, i32* @rl_filename_completion_desired, align 4
  br label %if.end

if.end:                                           ; preds = %if.then3, %if.then
  br label %if.end5

if.end5:                                          ; preds = %if.end, %entry
  %10 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %words = getelementptr inbounds %struct.compspec, %struct.compspec* %10, i32 0, i32 4
  %11 = load i8*, i8** %words, align 4
  %tobool6 = icmp ne i8* %11, null
  br i1 %tobool6, label %if.then7, label %if.end13

if.then7:                                         ; preds = %if.end5
  %12 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %13 = load i8*, i8** %word.addr, align 4
  %call8 = call %struct._list_of_strings* @gen_wordlist_matches(%struct.compspec* %12, i8* %13)
  store %struct._list_of_strings* %call8, %struct._list_of_strings** %tmatches, align 4
  %14 = load %struct._list_of_strings*, %struct._list_of_strings** %tmatches, align 4
  %tobool9 = icmp ne %struct._list_of_strings* %14, null
  br i1 %tobool9, label %if.then10, label %if.end12

if.then10:                                        ; preds = %if.then7
  %15 = load %struct._list_of_strings*, %struct._list_of_strings** %ret, align 4
  %16 = load %struct._list_of_strings*, %struct._list_of_strings** %tmatches, align 4
  %call11 = call %struct._list_of_strings* @strlist_append(%struct._list_of_strings* %15, %struct._list_of_strings* %16)
  store %struct._list_of_strings* %call11, %struct._list_of_strings** %ret, align 4
  %17 = load %struct._list_of_strings*, %struct._list_of_strings** %tmatches, align 4
  call void @strlist_dispose(%struct._list_of_strings* %17)
  br label %if.end12

if.end12:                                         ; preds = %if.then10, %if.then7
  br label %if.end13

if.end13:                                         ; preds = %if.end12, %if.end5
  store %struct.word_list* null, %struct.word_list** %lwords, align 4
  store i8* null, i8** %line, align 4
  %18 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %command = getelementptr inbounds %struct.compspec, %struct.compspec* %18, i32 0, i32 8
  %19 = load i8*, i8** %command, align 4
  %tobool14 = icmp ne i8* %19, null
  br i1 %tobool14, label %if.then16, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end13
  %20 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %funcname = getelementptr inbounds %struct.compspec, %struct.compspec* %20, i32 0, i32 7
  %21 = load i8*, i8** %funcname, align 4
  %tobool15 = icmp ne i8* %21, null
  br i1 %tobool15, label %if.then16, label %if.end37

if.then16:                                        ; preds = %lor.lhs.false, %if.end13
  %22 = load i8*, i8** @rl_line_buffer, align 4
  %23 = load i32, i32* %start.addr, align 4
  %24 = load i32, i32* %end.addr, align 4
  %call17 = call i8* @substring(i8* %22, i32 %23, i32 %24)
  store i8* %call17, i8** %line, align 4
  %25 = load i32, i32* %end.addr, align 4
  %26 = load i32, i32* %start.addr, align 4
  %sub = sub nsw i32 %25, %26
  store i32 %sub, i32* %llen, align 4
  %27 = load i8*, i8** %line, align 4
  %28 = load i32, i32* %llen, align 4
  %29 = load i32, i32* @rl_point, align 4
  %30 = load i32, i32* %start.addr, align 4
  %sub18 = sub nsw i32 %29, %30
  %call19 = call %struct.word_list* @command_line_to_word_list(i8* %27, i32 %28, i32 %sub18, i32* %nw, i32* %cw)
  store %struct.word_list* %call19, %struct.word_list** %lwords, align 4
  %31 = load %struct.word_list*, %struct.word_list** %lwords, align 4
  %tobool20 = icmp ne %struct.word_list* %31, null
  br i1 %tobool20, label %land.lhs.true, label %if.end36

land.lhs.true:                                    ; preds = %if.then16
  %32 = load %struct.word_list*, %struct.word_list** %lwords, align 4
  %word21 = getelementptr inbounds %struct.word_list, %struct.word_list* %32, i32 0, i32 1
  %33 = load %struct.word_desc*, %struct.word_desc** %word21, align 4
  %tobool22 = icmp ne %struct.word_desc* %33, null
  br i1 %tobool22, label %land.lhs.true23, label %if.end36

land.lhs.true23:                                  ; preds = %land.lhs.true
  %34 = load i8*, i8** %cmd.addr, align 4
  %arrayidx = getelementptr inbounds i8, i8* %34, i32 0
  %35 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %35 to i32
  %cmp = icmp eq i32 %conv, 0
  br i1 %cmp, label %land.lhs.true25, label %if.end36

land.lhs.true25:                                  ; preds = %land.lhs.true23
  %36 = load %struct.word_list*, %struct.word_list** %lwords, align 4
  %word26 = getelementptr inbounds %struct.word_list, %struct.word_list* %36, i32 0, i32 1
  %37 = load %struct.word_desc*, %struct.word_desc** %word26, align 4
  %word27 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %37, i32 0, i32 0
  %38 = load i8*, i8** %word27, align 4
  %arrayidx28 = getelementptr inbounds i8, i8* %38, i32 0
  %39 = load i8, i8* %arrayidx28, align 1
  %conv29 = sext i8 %39 to i32
  %cmp30 = icmp ne i32 %conv29, 0
  br i1 %cmp30, label %if.then32, label %if.end36

if.then32:                                        ; preds = %land.lhs.true25
  %40 = load i8*, i8** %cmd.addr, align 4
  %call33 = call %struct.word_desc* @make_bare_word(i8* %40)
  store %struct.word_desc* %call33, %struct.word_desc** %lw, align 4
  %41 = load %struct.word_desc*, %struct.word_desc** %lw, align 4
  %42 = load %struct.word_list*, %struct.word_list** %lwords, align 4
  %call34 = call %struct.word_list* @make_word_list(%struct.word_desc* %41, %struct.word_list* %42)
  store %struct.word_list* %call34, %struct.word_list** %lwords, align 4
  %43 = load i32, i32* %nw, align 4
  %inc = add nsw i32 %43, 1
  store i32 %inc, i32* %nw, align 4
  %44 = load i32, i32* %cw, align 4
  %inc35 = add nsw i32 %44, 1
  store i32 %inc35, i32* %cw, align 4
  br label %if.end36

if.end36:                                         ; preds = %if.then32, %land.lhs.true25, %land.lhs.true23, %land.lhs.true, %if.then16
  br label %if.end37

if.end37:                                         ; preds = %if.end36, %lor.lhs.false
  %45 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %funcname38 = getelementptr inbounds %struct.compspec, %struct.compspec* %45, i32 0, i32 7
  %46 = load i8*, i8** %funcname38, align 4
  %tobool39 = icmp ne i8* %46, null
  br i1 %tobool39, label %if.then40, label %if.end51

if.then40:                                        ; preds = %if.end37
  store i32 0, i32* %foundf, align 4
  %47 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %48 = load i8*, i8** %cmd.addr, align 4
  %49 = load i8*, i8** %word.addr, align 4
  %50 = load i8*, i8** %line, align 4
  %51 = load i32, i32* @rl_point, align 4
  %52 = load i32, i32* %start.addr, align 4
  %sub41 = sub nsw i32 %51, %52
  %53 = load %struct.word_list*, %struct.word_list** %lwords, align 4
  %54 = load i32, i32* %nw, align 4
  %55 = load i32, i32* %cw, align 4
  %call42 = call %struct._list_of_strings* @gen_shell_function_matches(%struct.compspec* %47, i8* %48, i8* %49, i8* %50, i32 %sub41, %struct.word_list* %53, i32 %54, i32 %55, i32* %foundf)
  store %struct._list_of_strings* %call42, %struct._list_of_strings** %tmatches, align 4
  %56 = load i32, i32* %foundf, align 4
  %cmp43 = icmp ne i32 %56, 0
  br i1 %cmp43, label %if.then45, label %if.end46

if.then45:                                        ; preds = %if.then40
  %57 = load i32, i32* %foundf, align 4
  store i32 %57, i32* %found, align 4
  br label %if.end46

if.end46:                                         ; preds = %if.then45, %if.then40
  %58 = load %struct._list_of_strings*, %struct._list_of_strings** %tmatches, align 4
  %tobool47 = icmp ne %struct._list_of_strings* %58, null
  br i1 %tobool47, label %if.then48, label %if.end50

if.then48:                                        ; preds = %if.end46
  %59 = load %struct._list_of_strings*, %struct._list_of_strings** %ret, align 4
  %60 = load %struct._list_of_strings*, %struct._list_of_strings** %tmatches, align 4
  %call49 = call %struct._list_of_strings* @strlist_append(%struct._list_of_strings* %59, %struct._list_of_strings* %60)
  store %struct._list_of_strings* %call49, %struct._list_of_strings** %ret, align 4
  %61 = load %struct._list_of_strings*, %struct._list_of_strings** %tmatches, align 4
  call void @strlist_dispose(%struct._list_of_strings* %61)
  br label %if.end50

if.end50:                                         ; preds = %if.then48, %if.end46
  br label %if.end51

if.end51:                                         ; preds = %if.end50, %if.end37
  %62 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %command52 = getelementptr inbounds %struct.compspec, %struct.compspec* %62, i32 0, i32 8
  %63 = load i8*, i8** %command52, align 4
  %tobool53 = icmp ne i8* %63, null
  br i1 %tobool53, label %if.then54, label %if.end61

if.then54:                                        ; preds = %if.end51
  %64 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %65 = load i8*, i8** %cmd.addr, align 4
  %66 = load i8*, i8** %word.addr, align 4
  %67 = load i8*, i8** %line, align 4
  %68 = load i32, i32* @rl_point, align 4
  %69 = load i32, i32* %start.addr, align 4
  %sub55 = sub nsw i32 %68, %69
  %70 = load %struct.word_list*, %struct.word_list** %lwords, align 4
  %71 = load i32, i32* %nw, align 4
  %72 = load i32, i32* %cw, align 4
  %call56 = call %struct._list_of_strings* @gen_command_matches(%struct.compspec* %64, i8* %65, i8* %66, i8* %67, i32 %sub55, %struct.word_list* %70, i32 %71, i32 %72)
  store %struct._list_of_strings* %call56, %struct._list_of_strings** %tmatches, align 4
  %73 = load %struct._list_of_strings*, %struct._list_of_strings** %tmatches, align 4
  %tobool57 = icmp ne %struct._list_of_strings* %73, null
  br i1 %tobool57, label %if.then58, label %if.end60

if.then58:                                        ; preds = %if.then54
  %74 = load %struct._list_of_strings*, %struct._list_of_strings** %ret, align 4
  %75 = load %struct._list_of_strings*, %struct._list_of_strings** %tmatches, align 4
  %call59 = call %struct._list_of_strings* @strlist_append(%struct._list_of_strings* %74, %struct._list_of_strings* %75)
  store %struct._list_of_strings* %call59, %struct._list_of_strings** %ret, align 4
  %76 = load %struct._list_of_strings*, %struct._list_of_strings** %tmatches, align 4
  call void @strlist_dispose(%struct._list_of_strings* %76)
  br label %if.end60

if.end60:                                         ; preds = %if.then58, %if.then54
  br label %if.end61

if.end61:                                         ; preds = %if.end60, %if.end51
  %77 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %command62 = getelementptr inbounds %struct.compspec, %struct.compspec* %77, i32 0, i32 8
  %78 = load i8*, i8** %command62, align 4
  %tobool63 = icmp ne i8* %78, null
  br i1 %tobool63, label %if.then67, label %lor.lhs.false64

lor.lhs.false64:                                  ; preds = %if.end61
  %79 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %funcname65 = getelementptr inbounds %struct.compspec, %struct.compspec* %79, i32 0, i32 7
  %80 = load i8*, i8** %funcname65, align 4
  %tobool66 = icmp ne i8* %80, null
  br i1 %tobool66, label %if.then67, label %if.end74

if.then67:                                        ; preds = %lor.lhs.false64, %if.end61
  %81 = load %struct.word_list*, %struct.word_list** %lwords, align 4
  %tobool68 = icmp ne %struct.word_list* %81, null
  br i1 %tobool68, label %if.then69, label %if.end70

if.then69:                                        ; preds = %if.then67
  %82 = load %struct.word_list*, %struct.word_list** %lwords, align 4
  call void @dispose_words(%struct.word_list* %82)
  br label %if.end70

if.end70:                                         ; preds = %if.then69, %if.then67
  br label %do.body

do.body:                                          ; preds = %if.end70
  %83 = load i8*, i8** %line, align 4
  %tobool71 = icmp ne i8* %83, null
  br i1 %tobool71, label %if.then72, label %if.end73

if.then72:                                        ; preds = %do.body
  %84 = load i8*, i8** %line, align 4
  call void @sh_xfree(i8* %84, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i32 1456)
  br label %if.end73

if.end73:                                         ; preds = %if.then72, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end73
  br label %if.end74

if.end74:                                         ; preds = %do.end, %lor.lhs.false64
  %85 = load i32*, i32** %foundp.addr, align 4
  %tobool75 = icmp ne i32* %85, null
  br i1 %tobool75, label %if.then76, label %if.end77

if.then76:                                        ; preds = %if.end74
  %86 = load i32, i32* %found, align 4
  %87 = load i32*, i32** %foundp.addr, align 4
  store i32 %86, i32* %87, align 4
  br label %if.end77

if.end77:                                         ; preds = %if.then76, %if.end74
  %88 = load i32, i32* %found, align 4
  %cmp78 = icmp eq i32 %88, 0
  br i1 %cmp78, label %if.then82, label %lor.lhs.false80

lor.lhs.false80:                                  ; preds = %if.end77
  %89 = load i32, i32* %found, align 4
  %and = and i32 %89, 256
  %tobool81 = icmp ne i32 %and, 0
  br i1 %tobool81, label %if.then82, label %if.end83

if.then82:                                        ; preds = %lor.lhs.false80, %if.end77
  %90 = load %struct._list_of_strings*, %struct._list_of_strings** %ret, align 4
  call void @strlist_dispose(%struct._list_of_strings* %90)
  store %struct._list_of_strings* null, %struct._list_of_strings** %retval, align 4
  br label %return

if.end83:                                         ; preds = %lor.lhs.false80
  %91 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %filterpat = getelementptr inbounds %struct.compspec, %struct.compspec* %91, i32 0, i32 10
  %92 = load i8*, i8** %filterpat, align 4
  %tobool84 = icmp ne i8* %92, null
  br i1 %tobool84, label %if.then85, label %if.end100

if.then85:                                        ; preds = %if.end83
  %93 = load %struct._list_of_strings*, %struct._list_of_strings** %ret, align 4
  %94 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %filterpat86 = getelementptr inbounds %struct.compspec, %struct.compspec* %94, i32 0, i32 10
  %95 = load i8*, i8** %filterpat86, align 4
  %96 = load i8*, i8** %word.addr, align 4
  %call87 = call %struct._list_of_strings* @filter_stringlist(%struct._list_of_strings* %93, i8* %95, i8* %96)
  store %struct._list_of_strings* %call87, %struct._list_of_strings** %tmatches, align 4
  %97 = load %struct._list_of_strings*, %struct._list_of_strings** %ret, align 4
  %tobool88 = icmp ne %struct._list_of_strings* %97, null
  br i1 %tobool88, label %land.lhs.true89, label %if.end99

land.lhs.true89:                                  ; preds = %if.then85
  %98 = load %struct._list_of_strings*, %struct._list_of_strings** %ret, align 4
  %99 = load %struct._list_of_strings*, %struct._list_of_strings** %tmatches, align 4
  %cmp90 = icmp ne %struct._list_of_strings* %98, %99
  br i1 %cmp90, label %if.then92, label %if.end99

if.then92:                                        ; preds = %land.lhs.true89
  br label %do.body93

do.body93:                                        ; preds = %if.then92
  %100 = load %struct._list_of_strings*, %struct._list_of_strings** %ret, align 4
  %list = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %100, i32 0, i32 0
  %101 = load i8**, i8*** %list, align 4
  %tobool94 = icmp ne i8** %101, null
  br i1 %tobool94, label %if.then95, label %if.end97

if.then95:                                        ; preds = %do.body93
  %102 = load %struct._list_of_strings*, %struct._list_of_strings** %ret, align 4
  %list96 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %102, i32 0, i32 0
  %103 = load i8**, i8*** %list96, align 4
  %104 = bitcast i8** %103 to i8*
  call void @sh_xfree(i8* %104, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i32 1481)
  br label %if.end97

if.end97:                                         ; preds = %if.then95, %do.body93
  br label %do.end98

do.end98:                                         ; preds = %if.end97
  %105 = load %struct._list_of_strings*, %struct._list_of_strings** %ret, align 4
  %106 = bitcast %struct._list_of_strings* %105 to i8*
  call void @sh_xfree(i8* %106, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i32 1482)
  br label %if.end99

if.end99:                                         ; preds = %do.end98, %land.lhs.true89, %if.then85
  %107 = load %struct._list_of_strings*, %struct._list_of_strings** %tmatches, align 4
  store %struct._list_of_strings* %107, %struct._list_of_strings** %ret, align 4
  br label %if.end100

if.end100:                                        ; preds = %if.end99, %if.end83
  %108 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %prefix = getelementptr inbounds %struct.compspec, %struct.compspec* %108, i32 0, i32 5
  %109 = load i8*, i8** %prefix, align 4
  %tobool101 = icmp ne i8* %109, null
  br i1 %tobool101, label %if.then104, label %lor.lhs.false102

lor.lhs.false102:                                 ; preds = %if.end100
  %110 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %suffix = getelementptr inbounds %struct.compspec, %struct.compspec* %110, i32 0, i32 6
  %111 = load i8*, i8** %suffix, align 4
  %tobool103 = icmp ne i8* %111, null
  br i1 %tobool103, label %if.then104, label %if.end108

if.then104:                                       ; preds = %lor.lhs.false102, %if.end100
  %112 = load %struct._list_of_strings*, %struct._list_of_strings** %ret, align 4
  %113 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %prefix105 = getelementptr inbounds %struct.compspec, %struct.compspec* %113, i32 0, i32 5
  %114 = load i8*, i8** %prefix105, align 4
  %115 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %suffix106 = getelementptr inbounds %struct.compspec, %struct.compspec* %115, i32 0, i32 6
  %116 = load i8*, i8** %suffix106, align 4
  %call107 = call %struct._list_of_strings* @strlist_prefix_suffix(%struct._list_of_strings* %112, i8* %114, i8* %116)
  store %struct._list_of_strings* %call107, %struct._list_of_strings** %ret, align 4
  br label %if.end108

if.end108:                                        ; preds = %if.then104, %lor.lhs.false102
  %117 = load %struct._list_of_strings*, %struct._list_of_strings** %ret, align 4
  %cmp109 = icmp eq %struct._list_of_strings* %117, null
  br i1 %cmp109, label %land.lhs.true114, label %lor.lhs.false111

lor.lhs.false111:                                 ; preds = %if.end108
  %118 = load %struct._list_of_strings*, %struct._list_of_strings** %ret, align 4
  %list_len = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %118, i32 0, i32 2
  %119 = load i32, i32* %list_len, align 4
  %cmp112 = icmp eq i32 %119, 0
  br i1 %cmp112, label %land.lhs.true114, label %if.else

land.lhs.true114:                                 ; preds = %lor.lhs.false111, %if.end108
  %120 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %options = getelementptr inbounds %struct.compspec, %struct.compspec* %120, i32 0, i32 2
  %121 = load i32, i32* %options, align 4
  %and115 = and i32 %121, 8
  %tobool116 = icmp ne i32 %and115, 0
  br i1 %tobool116, label %if.then117, label %if.else

if.then117:                                       ; preds = %land.lhs.true114
  %call118 = call %struct.compspec* @compspec_create()
  store %struct.compspec* %call118, %struct.compspec** %tcs, align 4
  %122 = load %struct.compspec*, %struct.compspec** %tcs, align 4
  %actions = getelementptr inbounds %struct.compspec, %struct.compspec* %122, i32 0, i32 1
  store i32 32, i32* %actions, align 4
  br label %do.body119

do.body119:                                       ; preds = %if.then117
  %123 = load %struct._list_of_strings*, %struct._list_of_strings** %ret, align 4
  %tobool120 = icmp ne %struct._list_of_strings* %123, null
  br i1 %tobool120, label %if.then121, label %if.end122

if.then121:                                       ; preds = %do.body119
  %124 = load %struct._list_of_strings*, %struct._list_of_strings** %ret, align 4
  %125 = bitcast %struct._list_of_strings* %124 to i8*
  call void @sh_xfree(i8* %125, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i32 1498)
  br label %if.end122

if.end122:                                        ; preds = %if.then121, %do.body119
  br label %do.end123

do.end123:                                        ; preds = %if.end122
  %126 = load %struct.compspec*, %struct.compspec** %tcs, align 4
  %127 = load i8*, i8** %word.addr, align 4
  %call124 = call %struct._list_of_strings* @gen_action_completions(%struct.compspec* %126, i8* %127)
  store %struct._list_of_strings* %call124, %struct._list_of_strings** %ret, align 4
  %128 = load %struct.compspec*, %struct.compspec** %tcs, align 4
  call void @compspec_dispose(%struct.compspec* %128)
  br label %if.end134

if.else:                                          ; preds = %land.lhs.true114, %lor.lhs.false111
  %129 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %options125 = getelementptr inbounds %struct.compspec, %struct.compspec* %129, i32 0, i32 2
  %130 = load i32, i32* %options125, align 4
  %and126 = and i32 %130, 128
  %tobool127 = icmp ne i32 %and126, 0
  br i1 %tobool127, label %if.then128, label %if.end133

if.then128:                                       ; preds = %if.else
  %call129 = call %struct.compspec* @compspec_create()
  store %struct.compspec* %call129, %struct.compspec** %tcs, align 4
  %131 = load %struct.compspec*, %struct.compspec** %tcs, align 4
  %actions130 = getelementptr inbounds %struct.compspec, %struct.compspec* %131, i32 0, i32 1
  store i32 32, i32* %actions130, align 4
  %132 = load %struct.compspec*, %struct.compspec** %tcs, align 4
  %133 = load i8*, i8** %word.addr, align 4
  %call131 = call %struct._list_of_strings* @gen_action_completions(%struct.compspec* %132, i8* %133)
  store %struct._list_of_strings* %call131, %struct._list_of_strings** %tmatches, align 4
  %134 = load %struct._list_of_strings*, %struct._list_of_strings** %ret, align 4
  %135 = load %struct._list_of_strings*, %struct._list_of_strings** %tmatches, align 4
  %call132 = call %struct._list_of_strings* @strlist_append(%struct._list_of_strings* %134, %struct._list_of_strings* %135)
  store %struct._list_of_strings* %call132, %struct._list_of_strings** %ret, align 4
  %136 = load %struct._list_of_strings*, %struct._list_of_strings** %tmatches, align 4
  call void @strlist_dispose(%struct._list_of_strings* %136)
  %137 = load %struct.compspec*, %struct.compspec** %tcs, align 4
  call void @compspec_dispose(%struct.compspec* %137)
  br label %if.end133

if.end133:                                        ; preds = %if.then128, %if.else
  br label %if.end134

if.end134:                                        ; preds = %if.end133, %do.end123
  %138 = load %struct._list_of_strings*, %struct._list_of_strings** %ret, align 4
  store %struct._list_of_strings* %138, %struct._list_of_strings** %retval, align 4
  br label %return

return:                                           ; preds = %if.end134, %if.then82
  %139 = load %struct._list_of_strings*, %struct._list_of_strings** %retval, align 4
  ret %struct._list_of_strings* %139
}

; Function Attrs: noinline nounwind
define internal %struct._list_of_strings* @gen_action_completions(%struct.compspec* %cs, i8* %text) #0 {
entry:
  %cs.addr = alloca %struct.compspec*, align 4
  %text.addr = alloca i8*, align 4
  %ret = alloca %struct._list_of_strings*, align 4
  %tmatches = alloca %struct._list_of_strings*, align 4
  %cmatches = alloca i8**, align 4
  %flags = alloca i32, align 4
  %t = alloca i32, align 4
  store %struct.compspec* %cs, %struct.compspec** %cs.addr, align 4
  store i8* %text, i8** %text.addr, align 4
  store %struct._list_of_strings* null, %struct._list_of_strings** %tmatches, align 4
  store %struct._list_of_strings* null, %struct._list_of_strings** %ret, align 4
  %0 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %actions = getelementptr inbounds %struct.compspec, %struct.compspec* %0, i32 0, i32 1
  %1 = load i32, i32* %actions, align 4
  store i32 %1, i32* %flags, align 4
  br label %do.body

do.body:                                          ; preds = %entry
  %2 = load i32, i32* %flags, align 4
  %and = and i32 %2, 1
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then, label %if.end4

if.then:                                          ; preds = %do.body
  %3 = load i8*, i8** %text.addr, align 4
  %call = call %struct._list_of_strings* @gen_matches_from_itemlist(%struct._list_of_items* bitcast ({ i32, i32 (%struct._list_of_items*)*, %struct._list_of_strings*, %struct._list_of_strings*, i32 }* @it_aliases to %struct._list_of_items*), i8* %3)
  store %struct._list_of_strings* %call, %struct._list_of_strings** %tmatches, align 4
  %4 = load %struct._list_of_strings*, %struct._list_of_strings** %tmatches, align 4
  %tobool1 = icmp ne %struct._list_of_strings* %4, null
  br i1 %tobool1, label %if.then2, label %if.end

if.then2:                                         ; preds = %if.then
  %5 = load %struct._list_of_strings*, %struct._list_of_strings** %ret, align 4
  %6 = load %struct._list_of_strings*, %struct._list_of_strings** %tmatches, align 4
  %call3 = call %struct._list_of_strings* @strlist_append(%struct._list_of_strings* %5, %struct._list_of_strings* %6)
  store %struct._list_of_strings* %call3, %struct._list_of_strings** %ret, align 4
  %7 = load %struct._list_of_strings*, %struct._list_of_strings** %tmatches, align 4
  call void @strlist_dispose(%struct._list_of_strings* %7)
  br label %if.end

if.end:                                           ; preds = %if.then2, %if.then
  br label %if.end4

if.end4:                                          ; preds = %if.end, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end4
  br label %do.body5

do.body5:                                         ; preds = %do.end
  %8 = load i32, i32* %flags, align 4
  %and6 = and i32 %8, 2
  %tobool7 = icmp ne i32 %and6, 0
  br i1 %tobool7, label %if.then8, label %if.end14

if.then8:                                         ; preds = %do.body5
  %9 = load i8*, i8** %text.addr, align 4
  %call9 = call %struct._list_of_strings* @gen_matches_from_itemlist(%struct._list_of_items* bitcast ({ i32, i32 (%struct._list_of_items*)*, %struct._list_of_strings*, %struct._list_of_strings*, i32 }* @it_arrayvars to %struct._list_of_items*), i8* %9)
  store %struct._list_of_strings* %call9, %struct._list_of_strings** %tmatches, align 4
  %10 = load %struct._list_of_strings*, %struct._list_of_strings** %tmatches, align 4
  %tobool10 = icmp ne %struct._list_of_strings* %10, null
  br i1 %tobool10, label %if.then11, label %if.end13

if.then11:                                        ; preds = %if.then8
  %11 = load %struct._list_of_strings*, %struct._list_of_strings** %ret, align 4
  %12 = load %struct._list_of_strings*, %struct._list_of_strings** %tmatches, align 4
  %call12 = call %struct._list_of_strings* @strlist_append(%struct._list_of_strings* %11, %struct._list_of_strings* %12)
  store %struct._list_of_strings* %call12, %struct._list_of_strings** %ret, align 4
  %13 = load %struct._list_of_strings*, %struct._list_of_strings** %tmatches, align 4
  call void @strlist_dispose(%struct._list_of_strings* %13)
  br label %if.end13

if.end13:                                         ; preds = %if.then11, %if.then8
  br label %if.end14

if.end14:                                         ; preds = %if.end13, %do.body5
  br label %do.end15

do.end15:                                         ; preds = %if.end14
  br label %do.body16

do.body16:                                        ; preds = %do.end15
  %14 = load i32, i32* %flags, align 4
  %and17 = and i32 %14, 4
  %tobool18 = icmp ne i32 %and17, 0
  br i1 %tobool18, label %if.then19, label %if.end25

if.then19:                                        ; preds = %do.body16
  %15 = load i8*, i8** %text.addr, align 4
  %call20 = call %struct._list_of_strings* @gen_matches_from_itemlist(%struct._list_of_items* bitcast ({ i32, i32 (%struct._list_of_items*)*, %struct._list_of_strings*, %struct._list_of_strings*, i32 }* @it_bindings to %struct._list_of_items*), i8* %15)
  store %struct._list_of_strings* %call20, %struct._list_of_strings** %tmatches, align 4
  %16 = load %struct._list_of_strings*, %struct._list_of_strings** %tmatches, align 4
  %tobool21 = icmp ne %struct._list_of_strings* %16, null
  br i1 %tobool21, label %if.then22, label %if.end24

if.then22:                                        ; preds = %if.then19
  %17 = load %struct._list_of_strings*, %struct._list_of_strings** %ret, align 4
  %18 = load %struct._list_of_strings*, %struct._list_of_strings** %tmatches, align 4
  %call23 = call %struct._list_of_strings* @strlist_append(%struct._list_of_strings* %17, %struct._list_of_strings* %18)
  store %struct._list_of_strings* %call23, %struct._list_of_strings** %ret, align 4
  %19 = load %struct._list_of_strings*, %struct._list_of_strings** %tmatches, align 4
  call void @strlist_dispose(%struct._list_of_strings* %19)
  br label %if.end24

if.end24:                                         ; preds = %if.then22, %if.then19
  br label %if.end25

if.end25:                                         ; preds = %if.end24, %do.body16
  br label %do.end26

do.end26:                                         ; preds = %if.end25
  br label %do.body27

do.body27:                                        ; preds = %do.end26
  %20 = load i32, i32* %flags, align 4
  %and28 = and i32 %20, 8
  %tobool29 = icmp ne i32 %and28, 0
  br i1 %tobool29, label %if.then30, label %if.end36

if.then30:                                        ; preds = %do.body27
  %21 = load i8*, i8** %text.addr, align 4
  %call31 = call %struct._list_of_strings* @gen_matches_from_itemlist(%struct._list_of_items* bitcast ({ i32, i32 (%struct._list_of_items*)*, %struct._list_of_strings*, %struct._list_of_strings*, i32 }* @it_builtins to %struct._list_of_items*), i8* %21)
  store %struct._list_of_strings* %call31, %struct._list_of_strings** %tmatches, align 4
  %22 = load %struct._list_of_strings*, %struct._list_of_strings** %tmatches, align 4
  %tobool32 = icmp ne %struct._list_of_strings* %22, null
  br i1 %tobool32, label %if.then33, label %if.end35

if.then33:                                        ; preds = %if.then30
  %23 = load %struct._list_of_strings*, %struct._list_of_strings** %ret, align 4
  %24 = load %struct._list_of_strings*, %struct._list_of_strings** %tmatches, align 4
  %call34 = call %struct._list_of_strings* @strlist_append(%struct._list_of_strings* %23, %struct._list_of_strings* %24)
  store %struct._list_of_strings* %call34, %struct._list_of_strings** %ret, align 4
  %25 = load %struct._list_of_strings*, %struct._list_of_strings** %tmatches, align 4
  call void @strlist_dispose(%struct._list_of_strings* %25)
  br label %if.end35

if.end35:                                         ; preds = %if.then33, %if.then30
  br label %if.end36

if.end36:                                         ; preds = %if.end35, %do.body27
  br label %do.end37

do.end37:                                         ; preds = %if.end36
  br label %do.body38

do.body38:                                        ; preds = %do.end37
  %26 = load i32, i32* %flags, align 4
  %and39 = and i32 %26, 64
  %tobool40 = icmp ne i32 %and39, 0
  br i1 %tobool40, label %if.then41, label %if.end47

if.then41:                                        ; preds = %do.body38
  %27 = load i8*, i8** %text.addr, align 4
  %call42 = call %struct._list_of_strings* @gen_matches_from_itemlist(%struct._list_of_items* bitcast ({ i32, i32 (%struct._list_of_items*)*, %struct._list_of_strings*, %struct._list_of_strings*, i32 }* @it_disabled to %struct._list_of_items*), i8* %27)
  store %struct._list_of_strings* %call42, %struct._list_of_strings** %tmatches, align 4
  %28 = load %struct._list_of_strings*, %struct._list_of_strings** %tmatches, align 4
  %tobool43 = icmp ne %struct._list_of_strings* %28, null
  br i1 %tobool43, label %if.then44, label %if.end46

if.then44:                                        ; preds = %if.then41
  %29 = load %struct._list_of_strings*, %struct._list_of_strings** %ret, align 4
  %30 = load %struct._list_of_strings*, %struct._list_of_strings** %tmatches, align 4
  %call45 = call %struct._list_of_strings* @strlist_append(%struct._list_of_strings* %29, %struct._list_of_strings* %30)
  store %struct._list_of_strings* %call45, %struct._list_of_strings** %ret, align 4
  %31 = load %struct._list_of_strings*, %struct._list_of_strings** %tmatches, align 4
  call void @strlist_dispose(%struct._list_of_strings* %31)
  br label %if.end46

if.end46:                                         ; preds = %if.then44, %if.then41
  br label %if.end47

if.end47:                                         ; preds = %if.end46, %do.body38
  br label %do.end48

do.end48:                                         ; preds = %if.end47
  br label %do.body49

do.body49:                                        ; preds = %do.end48
  %32 = load i32, i32* %flags, align 4
  %and50 = and i32 %32, 128
  %tobool51 = icmp ne i32 %and50, 0
  br i1 %tobool51, label %if.then52, label %if.end58

if.then52:                                        ; preds = %do.body49
  %33 = load i8*, i8** %text.addr, align 4
  %call53 = call %struct._list_of_strings* @gen_matches_from_itemlist(%struct._list_of_items* bitcast ({ i32, i32 (%struct._list_of_items*)*, %struct._list_of_strings*, %struct._list_of_strings*, i32 }* @it_enabled to %struct._list_of_items*), i8* %33)
  store %struct._list_of_strings* %call53, %struct._list_of_strings** %tmatches, align 4
  %34 = load %struct._list_of_strings*, %struct._list_of_strings** %tmatches, align 4
  %tobool54 = icmp ne %struct._list_of_strings* %34, null
  br i1 %tobool54, label %if.then55, label %if.end57

if.then55:                                        ; preds = %if.then52
  %35 = load %struct._list_of_strings*, %struct._list_of_strings** %ret, align 4
  %36 = load %struct._list_of_strings*, %struct._list_of_strings** %tmatches, align 4
  %call56 = call %struct._list_of_strings* @strlist_append(%struct._list_of_strings* %35, %struct._list_of_strings* %36)
  store %struct._list_of_strings* %call56, %struct._list_of_strings** %ret, align 4
  %37 = load %struct._list_of_strings*, %struct._list_of_strings** %tmatches, align 4
  call void @strlist_dispose(%struct._list_of_strings* %37)
  br label %if.end57

if.end57:                                         ; preds = %if.then55, %if.then52
  br label %if.end58

if.end58:                                         ; preds = %if.end57, %do.body49
  br label %do.end59

do.end59:                                         ; preds = %if.end58
  br label %do.body60

do.body60:                                        ; preds = %do.end59
  %38 = load i32, i32* %flags, align 4
  %and61 = and i32 %38, 256
  %tobool62 = icmp ne i32 %and61, 0
  br i1 %tobool62, label %if.then63, label %if.end69

if.then63:                                        ; preds = %do.body60
  %39 = load i8*, i8** %text.addr, align 4
  %call64 = call %struct._list_of_strings* @gen_matches_from_itemlist(%struct._list_of_items* bitcast ({ i32, i32 (%struct._list_of_items*)*, %struct._list_of_strings*, %struct._list_of_strings*, i32 }* @it_exports to %struct._list_of_items*), i8* %39)
  store %struct._list_of_strings* %call64, %struct._list_of_strings** %tmatches, align 4
  %40 = load %struct._list_of_strings*, %struct._list_of_strings** %tmatches, align 4
  %tobool65 = icmp ne %struct._list_of_strings* %40, null
  br i1 %tobool65, label %if.then66, label %if.end68

if.then66:                                        ; preds = %if.then63
  %41 = load %struct._list_of_strings*, %struct._list_of_strings** %ret, align 4
  %42 = load %struct._list_of_strings*, %struct._list_of_strings** %tmatches, align 4
  %call67 = call %struct._list_of_strings* @strlist_append(%struct._list_of_strings* %41, %struct._list_of_strings* %42)
  store %struct._list_of_strings* %call67, %struct._list_of_strings** %ret, align 4
  %43 = load %struct._list_of_strings*, %struct._list_of_strings** %tmatches, align 4
  call void @strlist_dispose(%struct._list_of_strings* %43)
  br label %if.end68

if.end68:                                         ; preds = %if.then66, %if.then63
  br label %if.end69

if.end69:                                         ; preds = %if.end68, %do.body60
  br label %do.end70

do.end70:                                         ; preds = %if.end69
  br label %do.body71

do.body71:                                        ; preds = %do.end70
  %44 = load i32, i32* %flags, align 4
  %and72 = and i32 %44, 1024
  %tobool73 = icmp ne i32 %and72, 0
  br i1 %tobool73, label %if.then74, label %if.end80

if.then74:                                        ; preds = %do.body71
  %45 = load i8*, i8** %text.addr, align 4
  %call75 = call %struct._list_of_strings* @gen_matches_from_itemlist(%struct._list_of_items* bitcast ({ i32, i32 (%struct._list_of_items*)*, %struct._list_of_strings*, %struct._list_of_strings*, i32 }* @it_functions to %struct._list_of_items*), i8* %45)
  store %struct._list_of_strings* %call75, %struct._list_of_strings** %tmatches, align 4
  %46 = load %struct._list_of_strings*, %struct._list_of_strings** %tmatches, align 4
  %tobool76 = icmp ne %struct._list_of_strings* %46, null
  br i1 %tobool76, label %if.then77, label %if.end79

if.then77:                                        ; preds = %if.then74
  %47 = load %struct._list_of_strings*, %struct._list_of_strings** %ret, align 4
  %48 = load %struct._list_of_strings*, %struct._list_of_strings** %tmatches, align 4
  %call78 = call %struct._list_of_strings* @strlist_append(%struct._list_of_strings* %47, %struct._list_of_strings* %48)
  store %struct._list_of_strings* %call78, %struct._list_of_strings** %ret, align 4
  %49 = load %struct._list_of_strings*, %struct._list_of_strings** %tmatches, align 4
  call void @strlist_dispose(%struct._list_of_strings* %49)
  br label %if.end79

if.end79:                                         ; preds = %if.then77, %if.then74
  br label %if.end80

if.end80:                                         ; preds = %if.end79, %do.body71
  br label %do.end81

do.end81:                                         ; preds = %if.end80
  br label %do.body82

do.body82:                                        ; preds = %do.end81
  %50 = load i32, i32* %flags, align 4
  %and83 = and i32 %50, 4096
  %tobool84 = icmp ne i32 %and83, 0
  br i1 %tobool84, label %if.then85, label %if.end91

if.then85:                                        ; preds = %do.body82
  %51 = load i8*, i8** %text.addr, align 4
  %call86 = call %struct._list_of_strings* @gen_matches_from_itemlist(%struct._list_of_items* bitcast ({ i32, i32 (%struct._list_of_items*)*, %struct._list_of_strings*, %struct._list_of_strings*, i32 }* @it_helptopics to %struct._list_of_items*), i8* %51)
  store %struct._list_of_strings* %call86, %struct._list_of_strings** %tmatches, align 4
  %52 = load %struct._list_of_strings*, %struct._list_of_strings** %tmatches, align 4
  %tobool87 = icmp ne %struct._list_of_strings* %52, null
  br i1 %tobool87, label %if.then88, label %if.end90

if.then88:                                        ; preds = %if.then85
  %53 = load %struct._list_of_strings*, %struct._list_of_strings** %ret, align 4
  %54 = load %struct._list_of_strings*, %struct._list_of_strings** %tmatches, align 4
  %call89 = call %struct._list_of_strings* @strlist_append(%struct._list_of_strings* %53, %struct._list_of_strings* %54)
  store %struct._list_of_strings* %call89, %struct._list_of_strings** %ret, align 4
  %55 = load %struct._list_of_strings*, %struct._list_of_strings** %tmatches, align 4
  call void @strlist_dispose(%struct._list_of_strings* %55)
  br label %if.end90

if.end90:                                         ; preds = %if.then88, %if.then85
  br label %if.end91

if.end91:                                         ; preds = %if.end90, %do.body82
  br label %do.end92

do.end92:                                         ; preds = %if.end91
  br label %do.body93

do.body93:                                        ; preds = %do.end92
  %56 = load i32, i32* %flags, align 4
  %and94 = and i32 %56, 8192
  %tobool95 = icmp ne i32 %and94, 0
  br i1 %tobool95, label %if.then96, label %if.end102

if.then96:                                        ; preds = %do.body93
  %57 = load i8*, i8** %text.addr, align 4
  %call97 = call %struct._list_of_strings* @gen_matches_from_itemlist(%struct._list_of_items* bitcast ({ i32, i32 (%struct._list_of_items*)*, %struct._list_of_strings*, %struct._list_of_strings*, i32 }* @it_hostnames to %struct._list_of_items*), i8* %57)
  store %struct._list_of_strings* %call97, %struct._list_of_strings** %tmatches, align 4
  %58 = load %struct._list_of_strings*, %struct._list_of_strings** %tmatches, align 4
  %tobool98 = icmp ne %struct._list_of_strings* %58, null
  br i1 %tobool98, label %if.then99, label %if.end101

if.then99:                                        ; preds = %if.then96
  %59 = load %struct._list_of_strings*, %struct._list_of_strings** %ret, align 4
  %60 = load %struct._list_of_strings*, %struct._list_of_strings** %tmatches, align 4
  %call100 = call %struct._list_of_strings* @strlist_append(%struct._list_of_strings* %59, %struct._list_of_strings* %60)
  store %struct._list_of_strings* %call100, %struct._list_of_strings** %ret, align 4
  %61 = load %struct._list_of_strings*, %struct._list_of_strings** %tmatches, align 4
  call void @strlist_dispose(%struct._list_of_strings* %61)
  br label %if.end101

if.end101:                                        ; preds = %if.then99, %if.then96
  br label %if.end102

if.end102:                                        ; preds = %if.end101, %do.body93
  br label %do.end103

do.end103:                                        ; preds = %if.end102
  br label %do.body104

do.body104:                                       ; preds = %do.end103
  %62 = load i32, i32* %flags, align 4
  %and105 = and i32 %62, 16384
  %tobool106 = icmp ne i32 %and105, 0
  br i1 %tobool106, label %if.then107, label %if.end113

if.then107:                                       ; preds = %do.body104
  %63 = load i8*, i8** %text.addr, align 4
  %call108 = call %struct._list_of_strings* @gen_matches_from_itemlist(%struct._list_of_items* bitcast ({ i32, i32 (%struct._list_of_items*)*, %struct._list_of_strings*, %struct._list_of_strings*, i32 }* @it_jobs to %struct._list_of_items*), i8* %63)
  store %struct._list_of_strings* %call108, %struct._list_of_strings** %tmatches, align 4
  %64 = load %struct._list_of_strings*, %struct._list_of_strings** %tmatches, align 4
  %tobool109 = icmp ne %struct._list_of_strings* %64, null
  br i1 %tobool109, label %if.then110, label %if.end112

if.then110:                                       ; preds = %if.then107
  %65 = load %struct._list_of_strings*, %struct._list_of_strings** %ret, align 4
  %66 = load %struct._list_of_strings*, %struct._list_of_strings** %tmatches, align 4
  %call111 = call %struct._list_of_strings* @strlist_append(%struct._list_of_strings* %65, %struct._list_of_strings* %66)
  store %struct._list_of_strings* %call111, %struct._list_of_strings** %ret, align 4
  %67 = load %struct._list_of_strings*, %struct._list_of_strings** %tmatches, align 4
  call void @strlist_dispose(%struct._list_of_strings* %67)
  br label %if.end112

if.end112:                                        ; preds = %if.then110, %if.then107
  br label %if.end113

if.end113:                                        ; preds = %if.end112, %do.body104
  br label %do.end114

do.end114:                                        ; preds = %if.end113
  br label %do.body115

do.body115:                                       ; preds = %do.end114
  %68 = load i32, i32* %flags, align 4
  %and116 = and i32 %68, 32768
  %tobool117 = icmp ne i32 %and116, 0
  br i1 %tobool117, label %if.then118, label %if.end124

if.then118:                                       ; preds = %do.body115
  %69 = load i8*, i8** %text.addr, align 4
  %call119 = call %struct._list_of_strings* @gen_matches_from_itemlist(%struct._list_of_items* bitcast ({ i32, i32 (%struct._list_of_items*)*, %struct._list_of_strings*, %struct._list_of_strings*, i32 }* @it_keywords to %struct._list_of_items*), i8* %69)
  store %struct._list_of_strings* %call119, %struct._list_of_strings** %tmatches, align 4
  %70 = load %struct._list_of_strings*, %struct._list_of_strings** %tmatches, align 4
  %tobool120 = icmp ne %struct._list_of_strings* %70, null
  br i1 %tobool120, label %if.then121, label %if.end123

if.then121:                                       ; preds = %if.then118
  %71 = load %struct._list_of_strings*, %struct._list_of_strings** %ret, align 4
  %72 = load %struct._list_of_strings*, %struct._list_of_strings** %tmatches, align 4
  %call122 = call %struct._list_of_strings* @strlist_append(%struct._list_of_strings* %71, %struct._list_of_strings* %72)
  store %struct._list_of_strings* %call122, %struct._list_of_strings** %ret, align 4
  %73 = load %struct._list_of_strings*, %struct._list_of_strings** %tmatches, align 4
  call void @strlist_dispose(%struct._list_of_strings* %73)
  br label %if.end123

if.end123:                                        ; preds = %if.then121, %if.then118
  br label %if.end124

if.end124:                                        ; preds = %if.end123, %do.body115
  br label %do.end125

do.end125:                                        ; preds = %if.end124
  br label %do.body126

do.body126:                                       ; preds = %do.end125
  %74 = load i32, i32* %flags, align 4
  %and127 = and i32 %74, 65536
  %tobool128 = icmp ne i32 %and127, 0
  br i1 %tobool128, label %if.then129, label %if.end135

if.then129:                                       ; preds = %do.body126
  %75 = load i8*, i8** %text.addr, align 4
  %call130 = call %struct._list_of_strings* @gen_matches_from_itemlist(%struct._list_of_items* bitcast ({ i32, i32 (%struct._list_of_items*)*, %struct._list_of_strings*, %struct._list_of_strings*, i32 }* @it_running to %struct._list_of_items*), i8* %75)
  store %struct._list_of_strings* %call130, %struct._list_of_strings** %tmatches, align 4
  %76 = load %struct._list_of_strings*, %struct._list_of_strings** %tmatches, align 4
  %tobool131 = icmp ne %struct._list_of_strings* %76, null
  br i1 %tobool131, label %if.then132, label %if.end134

if.then132:                                       ; preds = %if.then129
  %77 = load %struct._list_of_strings*, %struct._list_of_strings** %ret, align 4
  %78 = load %struct._list_of_strings*, %struct._list_of_strings** %tmatches, align 4
  %call133 = call %struct._list_of_strings* @strlist_append(%struct._list_of_strings* %77, %struct._list_of_strings* %78)
  store %struct._list_of_strings* %call133, %struct._list_of_strings** %ret, align 4
  %79 = load %struct._list_of_strings*, %struct._list_of_strings** %tmatches, align 4
  call void @strlist_dispose(%struct._list_of_strings* %79)
  br label %if.end134

if.end134:                                        ; preds = %if.then132, %if.then129
  br label %if.end135

if.end135:                                        ; preds = %if.end134, %do.body126
  br label %do.end136

do.end136:                                        ; preds = %if.end135
  br label %do.body137

do.body137:                                       ; preds = %do.end136
  %80 = load i32, i32* %flags, align 4
  %and138 = and i32 %80, 262144
  %tobool139 = icmp ne i32 %and138, 0
  br i1 %tobool139, label %if.then140, label %if.end146

if.then140:                                       ; preds = %do.body137
  %81 = load i8*, i8** %text.addr, align 4
  %call141 = call %struct._list_of_strings* @gen_matches_from_itemlist(%struct._list_of_items* bitcast ({ i32, i32 (%struct._list_of_items*)*, %struct._list_of_strings*, %struct._list_of_strings*, i32 }* @it_setopts to %struct._list_of_items*), i8* %81)
  store %struct._list_of_strings* %call141, %struct._list_of_strings** %tmatches, align 4
  %82 = load %struct._list_of_strings*, %struct._list_of_strings** %tmatches, align 4
  %tobool142 = icmp ne %struct._list_of_strings* %82, null
  br i1 %tobool142, label %if.then143, label %if.end145

if.then143:                                       ; preds = %if.then140
  %83 = load %struct._list_of_strings*, %struct._list_of_strings** %ret, align 4
  %84 = load %struct._list_of_strings*, %struct._list_of_strings** %tmatches, align 4
  %call144 = call %struct._list_of_strings* @strlist_append(%struct._list_of_strings* %83, %struct._list_of_strings* %84)
  store %struct._list_of_strings* %call144, %struct._list_of_strings** %ret, align 4
  %85 = load %struct._list_of_strings*, %struct._list_of_strings** %tmatches, align 4
  call void @strlist_dispose(%struct._list_of_strings* %85)
  br label %if.end145

if.end145:                                        ; preds = %if.then143, %if.then140
  br label %if.end146

if.end146:                                        ; preds = %if.end145, %do.body137
  br label %do.end147

do.end147:                                        ; preds = %if.end146
  br label %do.body148

do.body148:                                       ; preds = %do.end147
  %86 = load i32, i32* %flags, align 4
  %and149 = and i32 %86, 524288
  %tobool150 = icmp ne i32 %and149, 0
  br i1 %tobool150, label %if.then151, label %if.end157

if.then151:                                       ; preds = %do.body148
  %87 = load i8*, i8** %text.addr, align 4
  %call152 = call %struct._list_of_strings* @gen_matches_from_itemlist(%struct._list_of_items* bitcast ({ i32, i32 (%struct._list_of_items*)*, %struct._list_of_strings*, %struct._list_of_strings*, i32 }* @it_shopts to %struct._list_of_items*), i8* %87)
  store %struct._list_of_strings* %call152, %struct._list_of_strings** %tmatches, align 4
  %88 = load %struct._list_of_strings*, %struct._list_of_strings** %tmatches, align 4
  %tobool153 = icmp ne %struct._list_of_strings* %88, null
  br i1 %tobool153, label %if.then154, label %if.end156

if.then154:                                       ; preds = %if.then151
  %89 = load %struct._list_of_strings*, %struct._list_of_strings** %ret, align 4
  %90 = load %struct._list_of_strings*, %struct._list_of_strings** %tmatches, align 4
  %call155 = call %struct._list_of_strings* @strlist_append(%struct._list_of_strings* %89, %struct._list_of_strings* %90)
  store %struct._list_of_strings* %call155, %struct._list_of_strings** %ret, align 4
  %91 = load %struct._list_of_strings*, %struct._list_of_strings** %tmatches, align 4
  call void @strlist_dispose(%struct._list_of_strings* %91)
  br label %if.end156

if.end156:                                        ; preds = %if.then154, %if.then151
  br label %if.end157

if.end157:                                        ; preds = %if.end156, %do.body148
  br label %do.end158

do.end158:                                        ; preds = %if.end157
  br label %do.body159

do.body159:                                       ; preds = %do.end158
  %92 = load i32, i32* %flags, align 4
  %and160 = and i32 %92, 1048576
  %tobool161 = icmp ne i32 %and160, 0
  br i1 %tobool161, label %if.then162, label %if.end168

if.then162:                                       ; preds = %do.body159
  %93 = load i8*, i8** %text.addr, align 4
  %call163 = call %struct._list_of_strings* @gen_matches_from_itemlist(%struct._list_of_items* bitcast ({ i32, i32 (%struct._list_of_items*)*, %struct._list_of_strings*, %struct._list_of_strings*, i32 }* @it_signals to %struct._list_of_items*), i8* %93)
  store %struct._list_of_strings* %call163, %struct._list_of_strings** %tmatches, align 4
  %94 = load %struct._list_of_strings*, %struct._list_of_strings** %tmatches, align 4
  %tobool164 = icmp ne %struct._list_of_strings* %94, null
  br i1 %tobool164, label %if.then165, label %if.end167

if.then165:                                       ; preds = %if.then162
  %95 = load %struct._list_of_strings*, %struct._list_of_strings** %ret, align 4
  %96 = load %struct._list_of_strings*, %struct._list_of_strings** %tmatches, align 4
  %call166 = call %struct._list_of_strings* @strlist_append(%struct._list_of_strings* %95, %struct._list_of_strings* %96)
  store %struct._list_of_strings* %call166, %struct._list_of_strings** %ret, align 4
  %97 = load %struct._list_of_strings*, %struct._list_of_strings** %tmatches, align 4
  call void @strlist_dispose(%struct._list_of_strings* %97)
  br label %if.end167

if.end167:                                        ; preds = %if.then165, %if.then162
  br label %if.end168

if.end168:                                        ; preds = %if.end167, %do.body159
  br label %do.end169

do.end169:                                        ; preds = %if.end168
  br label %do.body170

do.body170:                                       ; preds = %do.end169
  %98 = load i32, i32* %flags, align 4
  %and171 = and i32 %98, 2097152
  %tobool172 = icmp ne i32 %and171, 0
  br i1 %tobool172, label %if.then173, label %if.end179

if.then173:                                       ; preds = %do.body170
  %99 = load i8*, i8** %text.addr, align 4
  %call174 = call %struct._list_of_strings* @gen_matches_from_itemlist(%struct._list_of_items* bitcast ({ i32, i32 (%struct._list_of_items*)*, %struct._list_of_strings*, %struct._list_of_strings*, i32 }* @it_stopped to %struct._list_of_items*), i8* %99)
  store %struct._list_of_strings* %call174, %struct._list_of_strings** %tmatches, align 4
  %100 = load %struct._list_of_strings*, %struct._list_of_strings** %tmatches, align 4
  %tobool175 = icmp ne %struct._list_of_strings* %100, null
  br i1 %tobool175, label %if.then176, label %if.end178

if.then176:                                       ; preds = %if.then173
  %101 = load %struct._list_of_strings*, %struct._list_of_strings** %ret, align 4
  %102 = load %struct._list_of_strings*, %struct._list_of_strings** %tmatches, align 4
  %call177 = call %struct._list_of_strings* @strlist_append(%struct._list_of_strings* %101, %struct._list_of_strings* %102)
  store %struct._list_of_strings* %call177, %struct._list_of_strings** %ret, align 4
  %103 = load %struct._list_of_strings*, %struct._list_of_strings** %tmatches, align 4
  call void @strlist_dispose(%struct._list_of_strings* %103)
  br label %if.end178

if.end178:                                        ; preds = %if.then176, %if.then173
  br label %if.end179

if.end179:                                        ; preds = %if.end178, %do.body170
  br label %do.end180

do.end180:                                        ; preds = %if.end179
  br label %do.body181

do.body181:                                       ; preds = %do.end180
  %104 = load i32, i32* %flags, align 4
  %and182 = and i32 %104, 8388608
  %tobool183 = icmp ne i32 %and182, 0
  br i1 %tobool183, label %if.then184, label %if.end190

if.then184:                                       ; preds = %do.body181
  %105 = load i8*, i8** %text.addr, align 4
  %call185 = call %struct._list_of_strings* @gen_matches_from_itemlist(%struct._list_of_items* bitcast ({ i32, i32 (%struct._list_of_items*)*, %struct._list_of_strings*, %struct._list_of_strings*, i32 }* @it_variables to %struct._list_of_items*), i8* %105)
  store %struct._list_of_strings* %call185, %struct._list_of_strings** %tmatches, align 4
  %106 = load %struct._list_of_strings*, %struct._list_of_strings** %tmatches, align 4
  %tobool186 = icmp ne %struct._list_of_strings* %106, null
  br i1 %tobool186, label %if.then187, label %if.end189

if.then187:                                       ; preds = %if.then184
  %107 = load %struct._list_of_strings*, %struct._list_of_strings** %ret, align 4
  %108 = load %struct._list_of_strings*, %struct._list_of_strings** %tmatches, align 4
  %call188 = call %struct._list_of_strings* @strlist_append(%struct._list_of_strings* %107, %struct._list_of_strings* %108)
  store %struct._list_of_strings* %call188, %struct._list_of_strings** %ret, align 4
  %109 = load %struct._list_of_strings*, %struct._list_of_strings** %tmatches, align 4
  call void @strlist_dispose(%struct._list_of_strings* %109)
  br label %if.end189

if.end189:                                        ; preds = %if.then187, %if.then184
  br label %if.end190

if.end190:                                        ; preds = %if.end189, %do.body181
  br label %do.end191

do.end191:                                        ; preds = %if.end190
  br label %do.body192

do.body192:                                       ; preds = %do.end191
  %110 = load i32, i32* %flags, align 4
  %and193 = and i32 %110, 16
  %tobool194 = icmp ne i32 %and193, 0
  br i1 %tobool194, label %if.then195, label %if.end199

if.then195:                                       ; preds = %do.body192
  %111 = load i8*, i8** %text.addr, align 4
  %call196 = call i8** @rl_completion_matches(i8* %111, i8* (i8*, i32)* @command_word_completion_function)
  store i8** %call196, i8*** %cmatches, align 4
  %112 = load i8**, i8*** %cmatches, align 4
  %call197 = call %struct._list_of_strings* @completions_to_stringlist(i8** %112)
  store %struct._list_of_strings* %call197, %struct._list_of_strings** %tmatches, align 4
  %113 = load %struct._list_of_strings*, %struct._list_of_strings** %ret, align 4
  %114 = load %struct._list_of_strings*, %struct._list_of_strings** %tmatches, align 4
  %call198 = call %struct._list_of_strings* @strlist_append(%struct._list_of_strings* %113, %struct._list_of_strings* %114)
  store %struct._list_of_strings* %call198, %struct._list_of_strings** %ret, align 4
  %115 = load i8**, i8*** %cmatches, align 4
  call void @strvec_dispose(i8** %115)
  %116 = load %struct._list_of_strings*, %struct._list_of_strings** %tmatches, align 4
  call void @strlist_dispose(%struct._list_of_strings* %116)
  br label %if.end199

if.end199:                                        ; preds = %if.then195, %do.body192
  br label %do.end200

do.end200:                                        ; preds = %if.end199
  br label %do.body201

do.body201:                                       ; preds = %do.end200
  %117 = load i32, i32* %flags, align 4
  %and202 = and i32 %117, 512
  %tobool203 = icmp ne i32 %and202, 0
  br i1 %tobool203, label %if.then204, label %if.end208

if.then204:                                       ; preds = %do.body201
  %118 = load i8*, i8** %text.addr, align 4
  %call205 = call i8** @rl_completion_matches(i8* %118, i8* (i8*, i32)* @pcomp_filename_completion_function)
  store i8** %call205, i8*** %cmatches, align 4
  %119 = load i8**, i8*** %cmatches, align 4
  %call206 = call %struct._list_of_strings* @completions_to_stringlist(i8** %119)
  store %struct._list_of_strings* %call206, %struct._list_of_strings** %tmatches, align 4
  %120 = load %struct._list_of_strings*, %struct._list_of_strings** %ret, align 4
  %121 = load %struct._list_of_strings*, %struct._list_of_strings** %tmatches, align 4
  %call207 = call %struct._list_of_strings* @strlist_append(%struct._list_of_strings* %120, %struct._list_of_strings* %121)
  store %struct._list_of_strings* %call207, %struct._list_of_strings** %ret, align 4
  %122 = load i8**, i8*** %cmatches, align 4
  call void @strvec_dispose(i8** %122)
  %123 = load %struct._list_of_strings*, %struct._list_of_strings** %tmatches, align 4
  call void @strlist_dispose(%struct._list_of_strings* %123)
  br label %if.end208

if.end208:                                        ; preds = %if.then204, %do.body201
  br label %do.end209

do.end209:                                        ; preds = %if.end208
  br label %do.body210

do.body210:                                       ; preds = %do.end209
  %124 = load i32, i32* %flags, align 4
  %and211 = and i32 %124, 4194304
  %tobool212 = icmp ne i32 %and211, 0
  br i1 %tobool212, label %if.then213, label %if.end217

if.then213:                                       ; preds = %do.body210
  %125 = load i8*, i8** %text.addr, align 4
  %call214 = call i8** @rl_completion_matches(i8* %125, i8* (i8*, i32)* @rl_username_completion_function)
  store i8** %call214, i8*** %cmatches, align 4
  %126 = load i8**, i8*** %cmatches, align 4
  %call215 = call %struct._list_of_strings* @completions_to_stringlist(i8** %126)
  store %struct._list_of_strings* %call215, %struct._list_of_strings** %tmatches, align 4
  %127 = load %struct._list_of_strings*, %struct._list_of_strings** %ret, align 4
  %128 = load %struct._list_of_strings*, %struct._list_of_strings** %tmatches, align 4
  %call216 = call %struct._list_of_strings* @strlist_append(%struct._list_of_strings* %127, %struct._list_of_strings* %128)
  store %struct._list_of_strings* %call216, %struct._list_of_strings** %ret, align 4
  %129 = load i8**, i8*** %cmatches, align 4
  call void @strvec_dispose(i8** %129)
  %130 = load %struct._list_of_strings*, %struct._list_of_strings** %tmatches, align 4
  call void @strlist_dispose(%struct._list_of_strings* %130)
  br label %if.end217

if.end217:                                        ; preds = %if.then213, %do.body210
  br label %do.end218

do.end218:                                        ; preds = %if.end217
  br label %do.body219

do.body219:                                       ; preds = %do.end218
  %131 = load i32, i32* %flags, align 4
  %and220 = and i32 %131, 2048
  %tobool221 = icmp ne i32 %and220, 0
  br i1 %tobool221, label %if.then222, label %if.end226

if.then222:                                       ; preds = %do.body219
  %132 = load i8*, i8** %text.addr, align 4
  %call223 = call i8** @rl_completion_matches(i8* %132, i8* (i8*, i32)* @bash_groupname_completion_function)
  store i8** %call223, i8*** %cmatches, align 4
  %133 = load i8**, i8*** %cmatches, align 4
  %call224 = call %struct._list_of_strings* @completions_to_stringlist(i8** %133)
  store %struct._list_of_strings* %call224, %struct._list_of_strings** %tmatches, align 4
  %134 = load %struct._list_of_strings*, %struct._list_of_strings** %ret, align 4
  %135 = load %struct._list_of_strings*, %struct._list_of_strings** %tmatches, align 4
  %call225 = call %struct._list_of_strings* @strlist_append(%struct._list_of_strings* %134, %struct._list_of_strings* %135)
  store %struct._list_of_strings* %call225, %struct._list_of_strings** %ret, align 4
  %136 = load i8**, i8*** %cmatches, align 4
  call void @strvec_dispose(i8** %136)
  %137 = load %struct._list_of_strings*, %struct._list_of_strings** %tmatches, align 4
  call void @strlist_dispose(%struct._list_of_strings* %137)
  br label %if.end226

if.end226:                                        ; preds = %if.then222, %do.body219
  br label %do.end227

do.end227:                                        ; preds = %if.end226
  br label %do.body228

do.body228:                                       ; preds = %do.end227
  %138 = load i32, i32* %flags, align 4
  %and229 = and i32 %138, 131072
  %tobool230 = icmp ne i32 %and229, 0
  br i1 %tobool230, label %if.then231, label %if.end235

if.then231:                                       ; preds = %do.body228
  %139 = load i8*, i8** %text.addr, align 4
  %call232 = call i8** @rl_completion_matches(i8* %139, i8* (i8*, i32)* @bash_servicename_completion_function)
  store i8** %call232, i8*** %cmatches, align 4
  %140 = load i8**, i8*** %cmatches, align 4
  %call233 = call %struct._list_of_strings* @completions_to_stringlist(i8** %140)
  store %struct._list_of_strings* %call233, %struct._list_of_strings** %tmatches, align 4
  %141 = load %struct._list_of_strings*, %struct._list_of_strings** %ret, align 4
  %142 = load %struct._list_of_strings*, %struct._list_of_strings** %tmatches, align 4
  %call234 = call %struct._list_of_strings* @strlist_append(%struct._list_of_strings* %141, %struct._list_of_strings* %142)
  store %struct._list_of_strings* %call234, %struct._list_of_strings** %ret, align 4
  %143 = load i8**, i8*** %cmatches, align 4
  call void @strvec_dispose(i8** %143)
  %144 = load %struct._list_of_strings*, %struct._list_of_strings** %tmatches, align 4
  call void @strlist_dispose(%struct._list_of_strings* %144)
  br label %if.end235

if.end235:                                        ; preds = %if.then231, %do.body228
  br label %do.end236

do.end236:                                        ; preds = %if.end235
  %145 = load i32, i32* %flags, align 4
  %and237 = and i32 %145, 32
  %tobool238 = icmp ne i32 %and237, 0
  br i1 %tobool238, label %if.then239, label %if.end248

if.then239:                                       ; preds = %do.end236
  %146 = load i32, i32* @rl_filename_completion_desired, align 4
  store i32 %146, i32* %t, align 4
  store i32 1, i32* @rl_completion_mark_symlink_dirs, align 4
  %147 = load i8*, i8** %text.addr, align 4
  %call240 = call i8** @bash_directory_completion_matches(i8* %147)
  store i8** %call240, i8*** %cmatches, align 4
  %148 = load i32, i32* %t, align 4
  %cmp = icmp eq i32 %148, 0
  br i1 %cmp, label %land.lhs.true, label %if.end245

land.lhs.true:                                    ; preds = %if.then239
  %149 = load i8**, i8*** %cmatches, align 4
  %cmp241 = icmp eq i8** %149, null
  br i1 %cmp241, label %land.lhs.true242, label %if.end245

land.lhs.true242:                                 ; preds = %land.lhs.true
  %150 = load i32, i32* @rl_filename_completion_desired, align 4
  %cmp243 = icmp eq i32 %150, 1
  br i1 %cmp243, label %if.then244, label %if.end245

if.then244:                                       ; preds = %land.lhs.true242
  store i32 0, i32* @rl_filename_completion_desired, align 4
  br label %if.end245

if.end245:                                        ; preds = %if.then244, %land.lhs.true242, %land.lhs.true, %if.then239
  %151 = load i8**, i8*** %cmatches, align 4
  %call246 = call %struct._list_of_strings* @completions_to_stringlist(i8** %151)
  store %struct._list_of_strings* %call246, %struct._list_of_strings** %tmatches, align 4
  %152 = load %struct._list_of_strings*, %struct._list_of_strings** %ret, align 4
  %153 = load %struct._list_of_strings*, %struct._list_of_strings** %tmatches, align 4
  %call247 = call %struct._list_of_strings* @strlist_append(%struct._list_of_strings* %152, %struct._list_of_strings* %153)
  store %struct._list_of_strings* %call247, %struct._list_of_strings** %ret, align 4
  %154 = load i8**, i8*** %cmatches, align 4
  call void @strvec_dispose(i8** %154)
  %155 = load %struct._list_of_strings*, %struct._list_of_strings** %tmatches, align 4
  call void @strlist_dispose(%struct._list_of_strings* %155)
  br label %if.end248

if.end248:                                        ; preds = %if.end245, %do.end236
  %156 = load %struct._list_of_strings*, %struct._list_of_strings** %ret, align 4
  ret %struct._list_of_strings* %156
}

; Function Attrs: noinline nounwind
define internal %struct._list_of_strings* @gen_globpat_matches(%struct.compspec* %cs, i8* %text) #0 {
entry:
  %cs.addr = alloca %struct.compspec*, align 4
  %text.addr = alloca i8*, align 4
  %sl = alloca %struct._list_of_strings*, align 4
  store %struct.compspec* %cs, %struct.compspec** %cs.addr, align 4
  store i8* %text, i8** %text.addr, align 4
  %call = call %struct._list_of_strings* @strlist_create(i32 0)
  store %struct._list_of_strings* %call, %struct._list_of_strings** %sl, align 4
  %0 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %globpat = getelementptr inbounds %struct.compspec, %struct.compspec* %0, i32 0, i32 3
  %1 = load i8*, i8** %globpat, align 4
  %call1 = call i8** @glob_filename(i8* %1, i32 0)
  %2 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %list = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %2, i32 0, i32 0
  store i8** %call1, i8*** %list, align 4
  %3 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %list2 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %3, i32 0, i32 0
  %4 = load i8**, i8*** %list2, align 4
  %cmp = icmp eq i8** %4, @glob_error_return
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %5 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %list3 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %5, i32 0, i32 0
  store i8** null, i8*** %list3, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %6 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %list4 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %6, i32 0, i32 0
  %7 = load i8**, i8*** %list4, align 4
  %tobool = icmp ne i8** %7, null
  br i1 %tobool, label %if.then5, label %if.end8

if.then5:                                         ; preds = %if.end
  %8 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %list6 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %8, i32 0, i32 0
  %9 = load i8**, i8*** %list6, align 4
  %call7 = call i32 @strvec_len(i8** %9)
  %10 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %list_size = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %10, i32 0, i32 1
  store i32 %call7, i32* %list_size, align 4
  %11 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %list_len = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %11, i32 0, i32 2
  store i32 %call7, i32* %list_len, align 4
  br label %if.end8

if.end8:                                          ; preds = %if.then5, %if.end
  %12 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  ret %struct._list_of_strings* %12
}

declare %struct._list_of_strings* @strlist_append(%struct._list_of_strings*, %struct._list_of_strings*) #1

declare void @strlist_dispose(%struct._list_of_strings*) #1

; Function Attrs: noinline nounwind
define internal %struct._list_of_strings* @gen_wordlist_matches(%struct.compspec* %cs, i8* %text) #0 {
entry:
  %retval = alloca %struct._list_of_strings*, align 4
  %cs.addr = alloca %struct.compspec*, align 4
  %text.addr = alloca i8*, align 4
  %l = alloca %struct.word_list*, align 4
  %l2 = alloca %struct.word_list*, align 4
  %sl = alloca %struct._list_of_strings*, align 4
  %nw = alloca i32, align 4
  %tlen = alloca i32, align 4
  %ntxt = alloca i8*, align 4
  store %struct.compspec* %cs, %struct.compspec** %cs.addr, align 4
  store i8* %text, i8** %text.addr, align 4
  %0 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %words = getelementptr inbounds %struct.compspec, %struct.compspec* %0, i32 0, i32 4
  %1 = load i8*, i8** %words, align 4
  %cmp = icmp eq i8* %1, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %2 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %words1 = getelementptr inbounds %struct.compspec, %struct.compspec* %2, i32 0, i32 4
  %3 = load i8*, i8** %words1, align 4
  %arrayidx = getelementptr inbounds i8, i8* %3, i32 0
  %4 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %4 to i32
  %cmp2 = icmp eq i32 %conv, 0
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  store %struct._list_of_strings* null, %struct._list_of_strings** %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %5 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %words4 = getelementptr inbounds %struct.compspec, %struct.compspec* %5, i32 0, i32 4
  %6 = load i8*, i8** %words4, align 4
  %7 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %words5 = getelementptr inbounds %struct.compspec, %struct.compspec* %7, i32 0, i32 4
  %8 = load i8*, i8** %words5, align 4
  %call = call i32 @strlen(i8* %8)
  %call6 = call %struct.word_list* @split_at_delims(i8* %6, i32 %call, i8* null, i32 -1, i32 0, i32* null, i32* null)
  store %struct.word_list* %call6, %struct.word_list** %l, align 4
  %9 = load %struct.word_list*, %struct.word_list** %l, align 4
  %cmp7 = icmp eq %struct.word_list* %9, null
  br i1 %cmp7, label %if.then9, label %if.end10

if.then9:                                         ; preds = %if.end
  store %struct._list_of_strings* null, %struct._list_of_strings** %retval, align 4
  br label %return

if.end10:                                         ; preds = %if.end
  %10 = load %struct.word_list*, %struct.word_list** %l, align 4
  %call11 = call %struct.word_list* @expand_words_shellexp(%struct.word_list* %10)
  store %struct.word_list* %call11, %struct.word_list** %l2, align 4
  %11 = load %struct.word_list*, %struct.word_list** %l, align 4
  call void @dispose_words(%struct.word_list* %11)
  %12 = load %struct.word_list*, %struct.word_list** %l2, align 4
  %call12 = call i32 bitcast (i32 (...)* @list_length to i32 (%struct.word_list*)*)(%struct.word_list* %12)
  store i32 %call12, i32* %nw, align 4
  %13 = load i32, i32* %nw, align 4
  %add = add nsw i32 %13, 1
  %call13 = call %struct._list_of_strings* @strlist_create(i32 %add)
  store %struct._list_of_strings* %call13, %struct._list_of_strings** %sl, align 4
  %14 = load i8*, i8** %text.addr, align 4
  %call14 = call i8* @bash_dequote_text(i8* %14)
  store i8* %call14, i8** %ntxt, align 4
  %15 = load i8*, i8** %ntxt, align 4
  %tobool = icmp ne i8* %15, null
  br i1 %tobool, label %land.lhs.true, label %cond.false30

land.lhs.true:                                    ; preds = %if.end10
  %16 = load i8*, i8** %ntxt, align 4
  %arrayidx15 = getelementptr inbounds i8, i8* %16, i32 0
  %17 = load i8, i8* %arrayidx15, align 1
  %conv16 = sext i8 %17 to i32
  %tobool17 = icmp ne i32 %conv16, 0
  br i1 %tobool17, label %cond.true, label %cond.false30

cond.true:                                        ; preds = %land.lhs.true
  %18 = load i8*, i8** %ntxt, align 4
  %arrayidx18 = getelementptr inbounds i8, i8* %18, i32 1
  %19 = load i8, i8* %arrayidx18, align 1
  %conv19 = sext i8 %19 to i32
  %tobool20 = icmp ne i32 %conv19, 0
  br i1 %tobool20, label %cond.true21, label %cond.false27

cond.true21:                                      ; preds = %cond.true
  %20 = load i8*, i8** %ntxt, align 4
  %arrayidx22 = getelementptr inbounds i8, i8* %20, i32 2
  %21 = load i8, i8* %arrayidx22, align 1
  %conv23 = sext i8 %21 to i32
  %tobool24 = icmp ne i32 %conv23, 0
  br i1 %tobool24, label %cond.true25, label %cond.false

cond.true25:                                      ; preds = %cond.true21
  %22 = load i8*, i8** %ntxt, align 4
  %call26 = call i32 @strlen(i8* %22)
  br label %cond.end

cond.false:                                       ; preds = %cond.true21
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true25
  %cond = phi i32 [ %call26, %cond.true25 ], [ 2, %cond.false ]
  br label %cond.end28

cond.false27:                                     ; preds = %cond.true
  br label %cond.end28

cond.end28:                                       ; preds = %cond.false27, %cond.end
  %cond29 = phi i32 [ %cond, %cond.end ], [ 1, %cond.false27 ]
  br label %cond.end31

cond.false30:                                     ; preds = %land.lhs.true, %if.end10
  br label %cond.end31

cond.end31:                                       ; preds = %cond.false30, %cond.end28
  %cond32 = phi i32 [ %cond29, %cond.end28 ], [ 0, %cond.false30 ]
  store i32 %cond32, i32* %tlen, align 4
  store i32 0, i32* %nw, align 4
  %23 = load %struct.word_list*, %struct.word_list** %l2, align 4
  store %struct.word_list* %23, %struct.word_list** %l, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %cond.end31
  %24 = load %struct.word_list*, %struct.word_list** %l, align 4
  %tobool33 = icmp ne %struct.word_list* %24, null
  br i1 %tobool33, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %25 = load i32, i32* %tlen, align 4
  %cmp34 = icmp eq i32 %25, 0
  br i1 %cmp34, label %if.then54, label %lor.lhs.false36

lor.lhs.false36:                                  ; preds = %for.body
  %26 = load i32, i32* %tlen, align 4
  %cmp37 = icmp eq i32 %26, 0
  br i1 %cmp37, label %cond.true39, label %cond.false40

cond.true39:                                      ; preds = %lor.lhs.false36
  br i1 true, label %if.then54, label %if.end71

cond.false40:                                     ; preds = %lor.lhs.false36
  %27 = load %struct.word_list*, %struct.word_list** %l, align 4
  %word = getelementptr inbounds %struct.word_list, %struct.word_list* %27, i32 0, i32 1
  %28 = load %struct.word_desc*, %struct.word_desc** %word, align 4
  %word41 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %28, i32 0, i32 0
  %29 = load i8*, i8** %word41, align 4
  %arrayidx42 = getelementptr inbounds i8, i8* %29, i32 0
  %30 = load i8, i8* %arrayidx42, align 1
  %conv43 = sext i8 %30 to i32
  %31 = load i8*, i8** %ntxt, align 4
  %arrayidx44 = getelementptr inbounds i8, i8* %31, i32 0
  %32 = load i8, i8* %arrayidx44, align 1
  %conv45 = sext i8 %32 to i32
  %cmp46 = icmp eq i32 %conv43, %conv45
  br i1 %cmp46, label %land.lhs.true48, label %if.end71

land.lhs.true48:                                  ; preds = %cond.false40
  %33 = load %struct.word_list*, %struct.word_list** %l, align 4
  %word49 = getelementptr inbounds %struct.word_list, %struct.word_list* %33, i32 0, i32 1
  %34 = load %struct.word_desc*, %struct.word_desc** %word49, align 4
  %word50 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %34, i32 0, i32 0
  %35 = load i8*, i8** %word50, align 4
  %36 = load i8*, i8** %ntxt, align 4
  %37 = load i32, i32* %tlen, align 4
  %call51 = call i32 @strncmp(i8* %35, i8* %36, i32 %37)
  %cmp52 = icmp eq i32 %call51, 0
  br i1 %cmp52, label %if.then54, label %if.end71

if.then54:                                        ; preds = %land.lhs.true48, %cond.true39, %for.body
  %38 = load %struct.word_list*, %struct.word_list** %l, align 4
  %word55 = getelementptr inbounds %struct.word_list, %struct.word_list* %38, i32 0, i32 1
  %39 = load %struct.word_desc*, %struct.word_desc** %word55, align 4
  %word56 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %39, i32 0, i32 0
  %40 = load i8*, i8** %word56, align 4
  %tobool57 = icmp ne i8* %40, null
  br i1 %tobool57, label %cond.true58, label %cond.false67

cond.true58:                                      ; preds = %if.then54
  %41 = load %struct.word_list*, %struct.word_list** %l, align 4
  %word59 = getelementptr inbounds %struct.word_list, %struct.word_list* %41, i32 0, i32 1
  %42 = load %struct.word_desc*, %struct.word_desc** %word59, align 4
  %word60 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %42, i32 0, i32 0
  %43 = load i8*, i8** %word60, align 4
  %call61 = call i32 @strlen(i8* %43)
  %add62 = add i32 1, %call61
  %call63 = call i8* @sh_xmalloc(i32 %add62, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i32 940)
  %44 = load %struct.word_list*, %struct.word_list** %l, align 4
  %word64 = getelementptr inbounds %struct.word_list, %struct.word_list* %44, i32 0, i32 1
  %45 = load %struct.word_desc*, %struct.word_desc** %word64, align 4
  %word65 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %45, i32 0, i32 0
  %46 = load i8*, i8** %word65, align 4
  %call66 = call i8* @strcpy(i8* %call63, i8* %46)
  br label %cond.end68

cond.false67:                                     ; preds = %if.then54
  br label %cond.end68

cond.end68:                                       ; preds = %cond.false67, %cond.true58
  %cond69 = phi i8* [ %call66, %cond.true58 ], [ null, %cond.false67 ]
  %47 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %list = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %47, i32 0, i32 0
  %48 = load i8**, i8*** %list, align 4
  %49 = load i32, i32* %nw, align 4
  %inc = add nsw i32 %49, 1
  store i32 %inc, i32* %nw, align 4
  %arrayidx70 = getelementptr inbounds i8*, i8** %48, i32 %49
  store i8* %cond69, i8** %arrayidx70, align 4
  br label %if.end71

if.end71:                                         ; preds = %cond.end68, %land.lhs.true48, %cond.false40, %cond.true39
  br label %for.inc

for.inc:                                          ; preds = %if.end71
  %50 = load %struct.word_list*, %struct.word_list** %l, align 4
  %next = getelementptr inbounds %struct.word_list, %struct.word_list* %50, i32 0, i32 0
  %51 = load %struct.word_list*, %struct.word_list** %next, align 4
  store %struct.word_list* %51, %struct.word_list** %l, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %52 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %list72 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %52, i32 0, i32 0
  %53 = load i8**, i8*** %list72, align 4
  %54 = load i32, i32* %nw, align 4
  %55 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %list_len = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %55, i32 0, i32 2
  store i32 %54, i32* %list_len, align 4
  %arrayidx73 = getelementptr inbounds i8*, i8** %53, i32 %54
  store i8* null, i8** %arrayidx73, align 4
  %56 = load %struct.word_list*, %struct.word_list** %l2, align 4
  call void @dispose_words(%struct.word_list* %56)
  br label %do.body

do.body:                                          ; preds = %for.end
  %57 = load i8*, i8** %ntxt, align 4
  %tobool74 = icmp ne i8* %57, null
  br i1 %tobool74, label %if.then75, label %if.end76

if.then75:                                        ; preds = %do.body
  %58 = load i8*, i8** %ntxt, align 4
  call void @sh_xfree(i8* %58, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i32 945)
  br label %if.end76

if.end76:                                         ; preds = %if.then75, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end76
  %59 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  store %struct._list_of_strings* %59, %struct._list_of_strings** %retval, align 4
  br label %return

return:                                           ; preds = %do.end, %if.then9, %if.then
  %60 = load %struct._list_of_strings*, %struct._list_of_strings** %retval, align 4
  ret %struct._list_of_strings* %60
}

declare i8* @substring(i8*, i32, i32) #1

; Function Attrs: noinline nounwind
define internal %struct.word_list* @command_line_to_word_list(i8* %line, i32 %llen, i32 %sentinel, i32* %nwp, i32* %cwp) #0 {
entry:
  %line.addr = alloca i8*, align 4
  %llen.addr = alloca i32, align 4
  %sentinel.addr = alloca i32, align 4
  %nwp.addr = alloca i32*, align 4
  %cwp.addr = alloca i32*, align 4
  %ret = alloca %struct.word_list*, align 4
  %delims = alloca i8*, align 4
  store i8* %line, i8** %line.addr, align 4
  store i32 %llen, i32* %llen.addr, align 4
  store i32 %sentinel, i32* %sentinel.addr, align 4
  store i32* %nwp, i32** %nwp.addr, align 4
  store i32* %cwp, i32** %cwp.addr, align 4
  %0 = load i8*, i8** @rl_completer_word_break_characters, align 4
  store i8* %0, i8** %delims, align 4
  %1 = load i8*, i8** %line.addr, align 4
  %2 = load i32, i32* %llen.addr, align 4
  %3 = load i8*, i8** %delims, align 4
  %4 = load i32, i32* %sentinel.addr, align 4
  %5 = load i32*, i32** %nwp.addr, align 4
  %6 = load i32*, i32** %cwp.addr, align 4
  %call = call %struct.word_list* @split_at_delims(i8* %1, i32 %2, i8* %3, i32 %4, i32 260, i32* %5, i32* %6)
  store %struct.word_list* %call, %struct.word_list** %ret, align 4
  %7 = load %struct.word_list*, %struct.word_list** %ret, align 4
  ret %struct.word_list* %7
}

declare %struct.word_desc* @make_bare_word(i8*) #1

declare %struct.word_list* @make_word_list(%struct.word_desc*, %struct.word_list*) #1

; Function Attrs: noinline nounwind
define internal %struct._list_of_strings* @gen_shell_function_matches(%struct.compspec* %cs, i8* %cmd, i8* %text, i8* %line, i32 %ind, %struct.word_list* %lwords, i32 %nw, i32 %cw, i32* %foundp) #0 {
entry:
  %retval = alloca %struct._list_of_strings*, align 4
  %cs.addr = alloca %struct.compspec*, align 4
  %cmd.addr = alloca i8*, align 4
  %text.addr = alloca i8*, align 4
  %line.addr = alloca i8*, align 4
  %ind.addr = alloca i32, align 4
  %lwords.addr = alloca %struct.word_list*, align 4
  %nw.addr = alloca i32, align 4
  %cw.addr = alloca i32, align 4
  %foundp.addr = alloca i32*, align 4
  %funcname = alloca i8*, align 4
  %sl = alloca %struct._list_of_strings*, align 4
  %f = alloca %struct.variable*, align 4
  %v = alloca %struct.variable*, align 4
  %cmdlist = alloca %struct.word_list*, align 4
  %fval = alloca i32, align 4
  %found = alloca i32, align 4
  %ps = alloca %struct._sh_parser_state_t, align 4
  %pps = alloca %struct._sh_parser_state_t*, align 4
  %a = alloca %struct.array*, align 4
  store %struct.compspec* %cs, %struct.compspec** %cs.addr, align 4
  store i8* %cmd, i8** %cmd.addr, align 4
  store i8* %text, i8** %text.addr, align 4
  store i8* %line, i8** %line.addr, align 4
  store i32 %ind, i32* %ind.addr, align 4
  store %struct.word_list* %lwords, %struct.word_list** %lwords.addr, align 4
  store i32 %nw, i32* %nw.addr, align 4
  store i32 %cw, i32* %cw.addr, align 4
  store i32* %foundp, i32** %foundp.addr, align 4
  store i32 0, i32* %found, align 4
  %0 = load i32*, i32** %foundp.addr, align 4
  %tobool = icmp ne i32* %0, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %found, align 4
  %2 = load i32*, i32** %foundp.addr, align 4
  store i32 %1, i32* %2, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %3 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %funcname1 = getelementptr inbounds %struct.compspec, %struct.compspec* %3, i32 0, i32 7
  %4 = load i8*, i8** %funcname1, align 4
  store i8* %4, i8** %funcname, align 4
  %5 = load i8*, i8** %funcname, align 4
  %call = call %struct.variable* @find_function(i8* %5)
  store %struct.variable* %call, %struct.variable** %f, align 4
  %6 = load %struct.variable*, %struct.variable** %f, align 4
  %cmp = icmp eq %struct.variable* %6, null
  br i1 %cmp, label %if.then2, label %if.end6

if.then2:                                         ; preds = %if.end
  %call3 = call i8* @libintl_gettext(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.3, i32 0, i32 0))
  %7 = load i8*, i8** %funcname, align 4
  call void (i8*, ...) @internal_error(i8* %call3, i8* %7)
  %call4 = call i32 @rl_ding()
  %call5 = call i32 @rl_on_new_line()
  store %struct._list_of_strings* null, %struct._list_of_strings** %retval, align 4
  br label %return

if.end6:                                          ; preds = %if.end
  %8 = load i8*, i8** %line.addr, align 4
  %9 = load i32, i32* %ind.addr, align 4
  %10 = load %struct.word_list*, %struct.word_list** %lwords.addr, align 4
  %11 = load i32, i32* %cw.addr, align 4
  %sub = sub nsw i32 %11, 1
  call void @bind_compfunc_variables(i8* %8, i32 %9, %struct.word_list* %10, i32 %sub, i32 0)
  %12 = load i8*, i8** %funcname, align 4
  %13 = load i8*, i8** %cmd.addr, align 4
  %14 = load i8*, i8** %text.addr, align 4
  %15 = load %struct.word_list*, %struct.word_list** %lwords.addr, align 4
  %16 = load i32, i32* %cw.addr, align 4
  %call7 = call %struct.word_list* @build_arg_list(i8* %12, i8* %13, i8* %14, %struct.word_list* %15, i32 %16)
  store %struct.word_list* %call7, %struct.word_list** %cmdlist, align 4
  store %struct._sh_parser_state_t* %ps, %struct._sh_parser_state_t** %pps, align 4
  %17 = load %struct._sh_parser_state_t*, %struct._sh_parser_state_t** %pps, align 4
  %call8 = call %struct._sh_parser_state_t* @save_parser_state(%struct._sh_parser_state_t* %17)
  call void @begin_unwind_frame(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.4, i32 0, i32 0))
  %18 = load %struct._sh_parser_state_t*, %struct._sh_parser_state_t** %pps, align 4
  %19 = bitcast %struct._sh_parser_state_t* %18 to i8*
  call void bitcast (void (...)* @add_unwind_protect to void (void (%struct._sh_parser_state_t*)*, i8*)*)(void (%struct._sh_parser_state_t*)* @restore_parser_state, i8* %19)
  %20 = load %struct.word_list*, %struct.word_list** %cmdlist, align 4
  %21 = bitcast %struct.word_list* %20 to i8*
  call void bitcast (void (...)* @add_unwind_protect to void (void (%struct.word_list*)*, i8*)*)(void (%struct.word_list*)* @dispose_words, i8* %21)
  call void bitcast (void (...)* @add_unwind_protect to void (void (...)*, i8*)*)(void (...)* bitcast (void (i32)* @unbind_compfunc_variables to void (...)*), i8* null)
  %22 = load %struct.variable*, %struct.variable** %f, align 4
  %23 = load %struct.word_list*, %struct.word_list** %cmdlist, align 4
  %call9 = call i32 @execute_shell_function(%struct.variable* %22, %struct.word_list* %23)
  store i32 %call9, i32* %fval, align 4
  call void @discard_unwind_frame(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.4, i32 0, i32 0))
  %24 = load %struct._sh_parser_state_t*, %struct._sh_parser_state_t** %pps, align 4
  call void @restore_parser_state(%struct._sh_parser_state_t* %24)
  %25 = load i32, i32* %fval, align 4
  %cmp10 = icmp ne i32 %25, 127
  %conv = zext i1 %cmp10 to i32
  store i32 %conv, i32* %found, align 4
  %26 = load i32, i32* %fval, align 4
  %cmp11 = icmp eq i32 %26, 124
  br i1 %cmp11, label %if.then13, label %if.end14

if.then13:                                        ; preds = %if.end6
  %27 = load i32, i32* %found, align 4
  %or = or i32 %27, 256
  store i32 %or, i32* %found, align 4
  br label %if.end14

if.end14:                                         ; preds = %if.then13, %if.end6
  %28 = load i32*, i32** %foundp.addr, align 4
  %tobool15 = icmp ne i32* %28, null
  br i1 %tobool15, label %if.then16, label %if.end17

if.then16:                                        ; preds = %if.end14
  %29 = load i32, i32* %found, align 4
  %30 = load i32*, i32** %foundp.addr, align 4
  store i32 %29, i32* %30, align 4
  br label %if.end17

if.end17:                                         ; preds = %if.then16, %if.end14
  %31 = load %struct.word_list*, %struct.word_list** %cmdlist, align 4
  call void @dispose_words(%struct.word_list* %31)
  call void @unbind_compfunc_variables(i32 0)
  %call18 = call %struct.variable* @find_variable(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.5, i32 0, i32 0))
  store %struct.variable* %call18, %struct.variable** %v, align 4
  %32 = load %struct.variable*, %struct.variable** %v, align 4
  %cmp19 = icmp eq %struct.variable* %32, null
  br i1 %cmp19, label %if.then21, label %if.end22

if.then21:                                        ; preds = %if.end17
  store %struct._list_of_strings* null, %struct._list_of_strings** %retval, align 4
  br label %return

if.end22:                                         ; preds = %if.end17
  %33 = load %struct.variable*, %struct.variable** %v, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %33, i32 0, i32 5
  %34 = load i32, i32* %attributes, align 4
  %and = and i32 %34, 4
  %cmp23 = icmp eq i32 %and, 0
  br i1 %cmp23, label %if.then25, label %if.end27

if.then25:                                        ; preds = %if.end22
  %35 = load %struct.variable*, %struct.variable** %v, align 4
  %call26 = call %struct.variable* @convert_var_to_array(%struct.variable* %35)
  store %struct.variable* %call26, %struct.variable** %v, align 4
  br label %if.end27

if.end27:                                         ; preds = %if.then25, %if.end22
  %36 = load %struct.variable*, %struct.variable** %v, align 4
  %attributes28 = getelementptr inbounds %struct.variable, %struct.variable* %36, i32 0, i32 5
  %37 = load i32, i32* %attributes28, align 4
  %and29 = and i32 %37, -4097
  store i32 %and29, i32* %attributes28, align 4
  %38 = load %struct.variable*, %struct.variable** %v, align 4
  %value = getelementptr inbounds %struct.variable, %struct.variable* %38, i32 0, i32 1
  %39 = load i8*, i8** %value, align 4
  %40 = bitcast i8* %39 to %struct.array*
  store %struct.array* %40, %struct.array** %a, align 4
  %41 = load i32, i32* %found, align 4
  %cmp30 = icmp eq i32 %41, 0
  br i1 %cmp30, label %if.then40, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end27
  %42 = load i32, i32* %found, align 4
  %and32 = and i32 %42, 256
  %tobool33 = icmp ne i32 %and32, 0
  br i1 %tobool33, label %if.then40, label %lor.lhs.false34

lor.lhs.false34:                                  ; preds = %lor.lhs.false
  %43 = load %struct.array*, %struct.array** %a, align 4
  %cmp35 = icmp eq %struct.array* %43, null
  br i1 %cmp35, label %if.then40, label %lor.lhs.false37

lor.lhs.false37:                                  ; preds = %lor.lhs.false34
  %44 = load %struct.array*, %struct.array** %a, align 4
  %num_elements = getelementptr inbounds %struct.array, %struct.array* %44, i32 0, i32 2
  %45 = load i32, i32* %num_elements, align 8
  %cmp38 = icmp eq i32 %45, 0
  br i1 %cmp38, label %if.then40, label %if.else

if.then40:                                        ; preds = %lor.lhs.false37, %lor.lhs.false34, %lor.lhs.false, %if.end27
  store %struct._list_of_strings* null, %struct._list_of_strings** %sl, align 4
  br label %if.end44

if.else:                                          ; preds = %lor.lhs.false37
  %call41 = call %struct._list_of_strings* @strlist_create(i32 0)
  store %struct._list_of_strings* %call41, %struct._list_of_strings** %sl, align 4
  %46 = load %struct.array*, %struct.array** %a, align 4
  %call42 = call i8** @array_to_argv(%struct.array* %46)
  %47 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %list = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %47, i32 0, i32 0
  store i8** %call42, i8*** %list, align 4
  %48 = load %struct.array*, %struct.array** %a, align 4
  %num_elements43 = getelementptr inbounds %struct.array, %struct.array* %48, i32 0, i32 2
  %49 = load i32, i32* %num_elements43, align 8
  %50 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %list_size = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %50, i32 0, i32 1
  store i32 %49, i32* %list_size, align 4
  %51 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %list_len = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %51, i32 0, i32 2
  store i32 %49, i32* %list_len, align 4
  br label %if.end44

if.end44:                                         ; preds = %if.else, %if.then40
  %call45 = call i32 @unbind_variable_noref(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.5, i32 0, i32 0))
  %52 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  store %struct._list_of_strings* %52, %struct._list_of_strings** %retval, align 4
  br label %return

return:                                           ; preds = %if.end44, %if.then21, %if.then2
  %53 = load %struct._list_of_strings*, %struct._list_of_strings** %retval, align 4
  ret %struct._list_of_strings* %53
}

; Function Attrs: noinline nounwind
define internal %struct._list_of_strings* @gen_command_matches(%struct.compspec* %cs, i8* %cmd, i8* %text, i8* %line, i32 %ind, %struct.word_list* %lwords, i32 %nw, i32 %cw) #0 {
entry:
  %retval = alloca %struct._list_of_strings*, align 4
  %cs.addr = alloca %struct.compspec*, align 4
  %cmd.addr = alloca i8*, align 4
  %text.addr = alloca i8*, align 4
  %line.addr = alloca i8*, align 4
  %ind.addr = alloca i32, align 4
  %lwords.addr = alloca %struct.word_list*, align 4
  %nw.addr = alloca i32, align 4
  %cw.addr = alloca i32, align 4
  %csbuf = alloca i8*, align 4
  %cscmd = alloca i8*, align 4
  %t = alloca i8*, align 4
  %cmdlen = alloca i32, align 4
  %cmdsize = alloca i32, align 4
  %n = alloca i32, align 4
  %ws = alloca i32, align 4
  %we = alloca i32, align 4
  %cmdlist = alloca %struct.word_list*, align 4
  %cl = alloca %struct.word_list*, align 4
  %tw = alloca %struct.word_desc*, align 4
  %sl = alloca %struct._list_of_strings*, align 4
  store %struct.compspec* %cs, %struct.compspec** %cs.addr, align 4
  store i8* %cmd, i8** %cmd.addr, align 4
  store i8* %text, i8** %text.addr, align 4
  store i8* %line, i8** %line.addr, align 4
  store i32 %ind, i32* %ind.addr, align 4
  store %struct.word_list* %lwords, %struct.word_list** %lwords.addr, align 4
  store i32 %nw, i32* %nw.addr, align 4
  store i32 %cw, i32* %cw.addr, align 4
  %0 = load i8*, i8** %line.addr, align 4
  %1 = load i32, i32* %ind.addr, align 4
  %2 = load %struct.word_list*, %struct.word_list** %lwords.addr, align 4
  %3 = load i32, i32* %cw.addr, align 4
  call void @bind_compfunc_variables(i8* %0, i32 %1, %struct.word_list* %2, i32 %3, i32 1)
  %4 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %command = getelementptr inbounds %struct.compspec, %struct.compspec* %4, i32 0, i32 8
  %5 = load i8*, i8** %command, align 4
  %6 = load i8*, i8** %cmd.addr, align 4
  %7 = load i8*, i8** %text.addr, align 4
  %8 = load %struct.word_list*, %struct.word_list** %lwords.addr, align 4
  %9 = load i32, i32* %cw.addr, align 4
  %call = call %struct.word_list* @build_arg_list(i8* %5, i8* %6, i8* %7, %struct.word_list* %8, i32 %9)
  store %struct.word_list* %call, %struct.word_list** %cmdlist, align 4
  %10 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %command1 = getelementptr inbounds %struct.compspec, %struct.compspec* %10, i32 0, i32 8
  %11 = load i8*, i8** %command1, align 4
  %call2 = call i32 @strlen(i8* %11)
  store i32 %call2, i32* %n, align 4
  %12 = load i32, i32* %n, align 4
  %add = add nsw i32 %12, 1
  store i32 %add, i32* %cmdsize, align 4
  %13 = load %struct.word_list*, %struct.word_list** %cmdlist, align 4
  %next = getelementptr inbounds %struct.word_list, %struct.word_list* %13, i32 0, i32 0
  %14 = load %struct.word_list*, %struct.word_list** %next, align 4
  store %struct.word_list* %14, %struct.word_list** %cl, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %15 = load %struct.word_list*, %struct.word_list** %cl, align 4
  %tobool = icmp ne %struct.word_list* %15, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %16 = load %struct.word_list*, %struct.word_list** %cl, align 4
  %word = getelementptr inbounds %struct.word_list, %struct.word_list* %16, i32 0, i32 1
  %17 = load %struct.word_desc*, %struct.word_desc** %word, align 4
  %word3 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %17, i32 0, i32 0
  %18 = load i8*, i8** %word3, align 4
  %tobool4 = icmp ne i8* %18, null
  br i1 %tobool4, label %land.lhs.true, label %cond.false26

land.lhs.true:                                    ; preds = %for.body
  %19 = load %struct.word_list*, %struct.word_list** %cl, align 4
  %word5 = getelementptr inbounds %struct.word_list, %struct.word_list* %19, i32 0, i32 1
  %20 = load %struct.word_desc*, %struct.word_desc** %word5, align 4
  %word6 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %20, i32 0, i32 0
  %21 = load i8*, i8** %word6, align 4
  %arrayidx = getelementptr inbounds i8, i8* %21, i32 0
  %22 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %22 to i32
  %tobool7 = icmp ne i32 %conv, 0
  br i1 %tobool7, label %cond.true, label %cond.false26

cond.true:                                        ; preds = %land.lhs.true
  %23 = load %struct.word_list*, %struct.word_list** %cl, align 4
  %word8 = getelementptr inbounds %struct.word_list, %struct.word_list* %23, i32 0, i32 1
  %24 = load %struct.word_desc*, %struct.word_desc** %word8, align 4
  %word9 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %24, i32 0, i32 0
  %25 = load i8*, i8** %word9, align 4
  %arrayidx10 = getelementptr inbounds i8, i8* %25, i32 1
  %26 = load i8, i8* %arrayidx10, align 1
  %conv11 = sext i8 %26 to i32
  %tobool12 = icmp ne i32 %conv11, 0
  br i1 %tobool12, label %cond.true13, label %cond.false23

cond.true13:                                      ; preds = %cond.true
  %27 = load %struct.word_list*, %struct.word_list** %cl, align 4
  %word14 = getelementptr inbounds %struct.word_list, %struct.word_list* %27, i32 0, i32 1
  %28 = load %struct.word_desc*, %struct.word_desc** %word14, align 4
  %word15 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %28, i32 0, i32 0
  %29 = load i8*, i8** %word15, align 4
  %arrayidx16 = getelementptr inbounds i8, i8* %29, i32 2
  %30 = load i8, i8* %arrayidx16, align 1
  %conv17 = sext i8 %30 to i32
  %tobool18 = icmp ne i32 %conv17, 0
  br i1 %tobool18, label %cond.true19, label %cond.false

cond.true19:                                      ; preds = %cond.true13
  %31 = load %struct.word_list*, %struct.word_list** %cl, align 4
  %word20 = getelementptr inbounds %struct.word_list, %struct.word_list* %31, i32 0, i32 1
  %32 = load %struct.word_desc*, %struct.word_desc** %word20, align 4
  %word21 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %32, i32 0, i32 0
  %33 = load i8*, i8** %word21, align 4
  %call22 = call i32 @strlen(i8* %33)
  br label %cond.end

cond.false:                                       ; preds = %cond.true13
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true19
  %cond = phi i32 [ %call22, %cond.true19 ], [ 2, %cond.false ]
  br label %cond.end24

cond.false23:                                     ; preds = %cond.true
  br label %cond.end24

cond.end24:                                       ; preds = %cond.false23, %cond.end
  %cond25 = phi i32 [ %cond, %cond.end ], [ 1, %cond.false23 ]
  br label %cond.end27

cond.false26:                                     ; preds = %land.lhs.true, %for.body
  br label %cond.end27

cond.end27:                                       ; preds = %cond.false26, %cond.end24
  %cond28 = phi i32 [ %cond25, %cond.end24 ], [ 0, %cond.false26 ]
  %add29 = add i32 %cond28, 3
  %34 = load i32, i32* %cmdsize, align 4
  %add30 = add i32 %34, %add29
  store i32 %add30, i32* %cmdsize, align 4
  br label %for.inc

for.inc:                                          ; preds = %cond.end27
  %35 = load %struct.word_list*, %struct.word_list** %cl, align 4
  %next31 = getelementptr inbounds %struct.word_list, %struct.word_list* %35, i32 0, i32 0
  %36 = load %struct.word_list*, %struct.word_list** %next31, align 4
  store %struct.word_list* %36, %struct.word_list** %cl, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %37 = load i32, i32* %cmdsize, align 4
  %add32 = add nsw i32 %37, 2
  store i32 %add32, i32* %cmdsize, align 4
  %38 = load i32, i32* %cmdsize, align 4
  %add33 = add nsw i32 %38, 1
  %call34 = call i8* @sh_xmalloc(i32 %add33, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i32 1228)
  store i8* %call34, i8** %cscmd, align 4
  %39 = load i8*, i8** %cscmd, align 4
  %40 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %command35 = getelementptr inbounds %struct.compspec, %struct.compspec* %40, i32 0, i32 8
  %41 = load i8*, i8** %command35, align 4
  %call36 = call i8* @strcpy(i8* %39, i8* %41)
  %42 = load i32, i32* %n, align 4
  store i32 %42, i32* %cmdlen, align 4
  %43 = load i8*, i8** %cscmd, align 4
  %44 = load i32, i32* %cmdlen, align 4
  %inc = add nsw i32 %44, 1
  store i32 %inc, i32* %cmdlen, align 4
  %arrayidx37 = getelementptr inbounds i8, i8* %43, i32 %44
  store i8 32, i8* %arrayidx37, align 1
  %45 = load %struct.word_list*, %struct.word_list** %cmdlist, align 4
  %next38 = getelementptr inbounds %struct.word_list, %struct.word_list* %45, i32 0, i32 0
  %46 = load %struct.word_list*, %struct.word_list** %next38, align 4
  store %struct.word_list* %46, %struct.word_list** %cl, align 4
  br label %for.cond39

for.cond39:                                       ; preds = %for.inc70, %for.end
  %47 = load %struct.word_list*, %struct.word_list** %cl, align 4
  %tobool40 = icmp ne %struct.word_list* %47, null
  br i1 %tobool40, label %for.body41, label %for.end72

for.body41:                                       ; preds = %for.cond39
  %48 = load %struct.word_list*, %struct.word_list** %cl, align 4
  %word42 = getelementptr inbounds %struct.word_list, %struct.word_list* %48, i32 0, i32 1
  %49 = load %struct.word_desc*, %struct.word_desc** %word42, align 4
  %word43 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %49, i32 0, i32 0
  %50 = load i8*, i8** %word43, align 4
  %tobool44 = icmp ne i8* %50, null
  br i1 %tobool44, label %cond.true45, label %cond.false48

cond.true45:                                      ; preds = %for.body41
  %51 = load %struct.word_list*, %struct.word_list** %cl, align 4
  %word46 = getelementptr inbounds %struct.word_list, %struct.word_list* %51, i32 0, i32 1
  %52 = load %struct.word_desc*, %struct.word_desc** %word46, align 4
  %word47 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %52, i32 0, i32 0
  %53 = load i8*, i8** %word47, align 4
  br label %cond.end49

cond.false48:                                     ; preds = %for.body41
  br label %cond.end49

cond.end49:                                       ; preds = %cond.false48, %cond.true45
  %cond50 = phi i8* [ %53, %cond.true45 ], [ getelementptr inbounds ([1 x i8], [1 x i8]* @.str.12, i32 0, i32 0), %cond.false48 ]
  %call51 = call i8* @sh_single_quote(i8* %cond50)
  store i8* %call51, i8** %t, align 4
  %54 = load i8*, i8** %t, align 4
  %call52 = call i32 @strlen(i8* %54)
  store i32 %call52, i32* %n, align 4
  br label %do.body

do.body:                                          ; preds = %cond.end49
  %55 = load i32, i32* %cmdlen, align 4
  %56 = load i32, i32* %n, align 4
  %add53 = add nsw i32 %56, 2
  %add54 = add nsw i32 %55, %add53
  %57 = load i32, i32* %cmdsize, align 4
  %cmp = icmp sge i32 %add54, %57
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %do.body
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.then
  %58 = load i32, i32* %cmdlen, align 4
  %59 = load i32, i32* %n, align 4
  %add56 = add nsw i32 %59, 2
  %add57 = add nsw i32 %58, %add56
  %60 = load i32, i32* %cmdsize, align 4
  %cmp58 = icmp sge i32 %add57, %60
  br i1 %cmp58, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %61 = load i32, i32* %cmdsize, align 4
  %add60 = add nsw i32 %61, 64
  store i32 %add60, i32* %cmdsize, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %62 = load i8*, i8** %cscmd, align 4
  %63 = load i32, i32* %cmdsize, align 4
  %call61 = call i8* @sh_xrealloc(i8* %62, i32 %63, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i32 1237)
  store i8* %call61, i8** %cscmd, align 4
  br label %if.end

if.end:                                           ; preds = %while.end, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  %64 = load i8*, i8** %cscmd, align 4
  %65 = load i32, i32* %cmdlen, align 4
  %add.ptr = getelementptr inbounds i8, i8* %64, i32 %65
  %66 = load i8*, i8** %t, align 4
  %call62 = call i8* @strcpy(i8* %add.ptr, i8* %66)
  %67 = load i32, i32* %n, align 4
  %68 = load i32, i32* %cmdlen, align 4
  %add63 = add nsw i32 %68, %67
  store i32 %add63, i32* %cmdlen, align 4
  %69 = load %struct.word_list*, %struct.word_list** %cl, align 4
  %next64 = getelementptr inbounds %struct.word_list, %struct.word_list* %69, i32 0, i32 0
  %70 = load %struct.word_list*, %struct.word_list** %next64, align 4
  %tobool65 = icmp ne %struct.word_list* %70, null
  br i1 %tobool65, label %if.then66, label %if.end69

if.then66:                                        ; preds = %do.end
  %71 = load i8*, i8** %cscmd, align 4
  %72 = load i32, i32* %cmdlen, align 4
  %inc67 = add nsw i32 %72, 1
  store i32 %inc67, i32* %cmdlen, align 4
  %arrayidx68 = getelementptr inbounds i8, i8* %71, i32 %72
  store i8 32, i8* %arrayidx68, align 1
  br label %if.end69

if.end69:                                         ; preds = %if.then66, %do.end
  %73 = load i8*, i8** %t, align 4
  call void @sh_xfree(i8* %73, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i32 1242)
  br label %for.inc70

for.inc70:                                        ; preds = %if.end69
  %74 = load %struct.word_list*, %struct.word_list** %cl, align 4
  %next71 = getelementptr inbounds %struct.word_list, %struct.word_list* %74, i32 0, i32 0
  %75 = load %struct.word_list*, %struct.word_list** %next71, align 4
  store %struct.word_list* %75, %struct.word_list** %cl, align 4
  br label %for.cond39

for.end72:                                        ; preds = %for.cond39
  %76 = load i8*, i8** %cscmd, align 4
  %77 = load i32, i32* %cmdlen, align 4
  %arrayidx73 = getelementptr inbounds i8, i8* %76, i32 %77
  store i8 0, i8* %arrayidx73, align 1
  %78 = load i8*, i8** %cscmd, align 4
  %call74 = call %struct.word_desc* @command_substitute(i8* %78, i32 0)
  store %struct.word_desc* %call74, %struct.word_desc** %tw, align 4
  %79 = load %struct.word_desc*, %struct.word_desc** %tw, align 4
  %tobool75 = icmp ne %struct.word_desc* %79, null
  br i1 %tobool75, label %cond.true76, label %cond.false78

cond.true76:                                      ; preds = %for.end72
  %80 = load %struct.word_desc*, %struct.word_desc** %tw, align 4
  %word77 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %80, i32 0, i32 0
  %81 = load i8*, i8** %word77, align 4
  br label %cond.end79

cond.false78:                                     ; preds = %for.end72
  br label %cond.end79

cond.end79:                                       ; preds = %cond.false78, %cond.true76
  %cond80 = phi i8* [ %81, %cond.true76 ], [ null, %cond.false78 ]
  store i8* %cond80, i8** %csbuf, align 4
  %82 = load %struct.word_desc*, %struct.word_desc** %tw, align 4
  %tobool81 = icmp ne %struct.word_desc* %82, null
  br i1 %tobool81, label %if.then82, label %if.end83

if.then82:                                        ; preds = %cond.end79
  %83 = load %struct.word_desc*, %struct.word_desc** %tw, align 4
  call void @dispose_word_desc(%struct.word_desc* %83)
  br label %if.end83

if.end83:                                         ; preds = %if.then82, %cond.end79
  %84 = load %struct.word_list*, %struct.word_list** %cmdlist, align 4
  call void @dispose_words(%struct.word_list* %84)
  %85 = load i8*, i8** %cscmd, align 4
  call void @sh_xfree(i8* %85, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i32 1253)
  call void @unbind_compfunc_variables(i32 1)
  %86 = load i8*, i8** %csbuf, align 4
  %cmp84 = icmp eq i8* %86, null
  br i1 %cmp84, label %if.then89, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end83
  %87 = load i8*, i8** %csbuf, align 4
  %88 = load i8, i8* %87, align 1
  %conv86 = sext i8 %88 to i32
  %cmp87 = icmp eq i32 %conv86, 0
  br i1 %cmp87, label %if.then89, label %if.end95

if.then89:                                        ; preds = %lor.lhs.false, %if.end83
  br label %do.body90

do.body90:                                        ; preds = %if.then89
  %89 = load i8*, i8** %csbuf, align 4
  %tobool91 = icmp ne i8* %89, null
  br i1 %tobool91, label %if.then92, label %if.end93

if.then92:                                        ; preds = %do.body90
  %90 = load i8*, i8** %csbuf, align 4
  call void @sh_xfree(i8* %90, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i32 1258)
  br label %if.end93

if.end93:                                         ; preds = %if.then92, %do.body90
  br label %do.end94

do.end94:                                         ; preds = %if.end93
  store %struct._list_of_strings* null, %struct._list_of_strings** %retval, align 4
  br label %return

if.end95:                                         ; preds = %lor.lhs.false
  %call96 = call %struct._list_of_strings* @strlist_create(i32 16)
  store %struct._list_of_strings* %call96, %struct._list_of_strings** %sl, align 4
  store i32 0, i32* %ws, align 4
  br label %for.cond97

for.cond97:                                       ; preds = %while.end143, %if.end95
  %91 = load i8*, i8** %csbuf, align 4
  %92 = load i32, i32* %ws, align 4
  %arrayidx98 = getelementptr inbounds i8, i8* %91, i32 %92
  %93 = load i8, i8* %arrayidx98, align 1
  %tobool99 = icmp ne i8 %93, 0
  br i1 %tobool99, label %for.body100, label %for.end144

for.body100:                                      ; preds = %for.cond97
  %94 = load i32, i32* %ws, align 4
  store i32 %94, i32* %we, align 4
  br label %while.cond101

while.cond101:                                    ; preds = %if.end122, %for.body100
  %95 = load i8*, i8** %csbuf, align 4
  %96 = load i32, i32* %we, align 4
  %arrayidx102 = getelementptr inbounds i8, i8* %95, i32 %96
  %97 = load i8, i8* %arrayidx102, align 1
  %conv103 = sext i8 %97 to i32
  %tobool104 = icmp ne i32 %conv103, 0
  br i1 %tobool104, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond101
  %98 = load i8*, i8** %csbuf, align 4
  %99 = load i32, i32* %we, align 4
  %arrayidx105 = getelementptr inbounds i8, i8* %98, i32 %99
  %100 = load i8, i8* %arrayidx105, align 1
  %conv106 = sext i8 %100 to i32
  %cmp107 = icmp ne i32 %conv106, 10
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond101
  %101 = phi i1 [ false, %while.cond101 ], [ %cmp107, %land.rhs ]
  br i1 %101, label %while.body109, label %while.end124

while.body109:                                    ; preds = %land.end
  %102 = load i8*, i8** %csbuf, align 4
  %103 = load i32, i32* %we, align 4
  %arrayidx110 = getelementptr inbounds i8, i8* %102, i32 %103
  %104 = load i8, i8* %arrayidx110, align 1
  %conv111 = sext i8 %104 to i32
  %cmp112 = icmp eq i32 %conv111, 92
  br i1 %cmp112, label %land.lhs.true114, label %if.end122

land.lhs.true114:                                 ; preds = %while.body109
  %105 = load i8*, i8** %csbuf, align 4
  %106 = load i32, i32* %we, align 4
  %add115 = add nsw i32 %106, 1
  %arrayidx116 = getelementptr inbounds i8, i8* %105, i32 %add115
  %107 = load i8, i8* %arrayidx116, align 1
  %conv117 = sext i8 %107 to i32
  %cmp118 = icmp eq i32 %conv117, 10
  br i1 %cmp118, label %if.then120, label %if.end122

if.then120:                                       ; preds = %land.lhs.true114
  %108 = load i32, i32* %we, align 4
  %inc121 = add nsw i32 %108, 1
  store i32 %inc121, i32* %we, align 4
  br label %if.end122

if.end122:                                        ; preds = %if.then120, %land.lhs.true114, %while.body109
  %109 = load i32, i32* %we, align 4
  %inc123 = add nsw i32 %109, 1
  store i32 %inc123, i32* %we, align 4
  br label %while.cond101

while.end124:                                     ; preds = %land.end
  %110 = load i8*, i8** %csbuf, align 4
  %111 = load i32, i32* %ws, align 4
  %112 = load i32, i32* %we, align 4
  %call125 = call i8* @substring(i8* %110, i32 %111, i32 %112)
  store i8* %call125, i8** %t, align 4
  %113 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %list_len = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %113, i32 0, i32 2
  %114 = load i32, i32* %list_len, align 4
  %115 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %list_size = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %115, i32 0, i32 1
  %116 = load i32, i32* %list_size, align 4
  %sub = sub nsw i32 %116, 1
  %cmp126 = icmp sge i32 %114, %sub
  br i1 %cmp126, label %if.then128, label %if.end132

if.then128:                                       ; preds = %while.end124
  %117 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %118 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %list_size129 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %118, i32 0, i32 1
  %119 = load i32, i32* %list_size129, align 4
  %add130 = add nsw i32 %119, 16
  %call131 = call %struct._list_of_strings* @strlist_resize(%struct._list_of_strings* %117, i32 %add130)
  br label %if.end132

if.end132:                                        ; preds = %if.then128, %while.end124
  %120 = load i8*, i8** %t, align 4
  %121 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %list = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %121, i32 0, i32 0
  %122 = load i8**, i8*** %list, align 4
  %123 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %list_len133 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %123, i32 0, i32 2
  %124 = load i32, i32* %list_len133, align 4
  %inc134 = add nsw i32 %124, 1
  store i32 %inc134, i32* %list_len133, align 4
  %arrayidx135 = getelementptr inbounds i8*, i8** %122, i32 %124
  store i8* %120, i8** %arrayidx135, align 4
  br label %while.cond136

while.cond136:                                    ; preds = %while.body141, %if.end132
  %125 = load i8*, i8** %csbuf, align 4
  %126 = load i32, i32* %we, align 4
  %arrayidx137 = getelementptr inbounds i8, i8* %125, i32 %126
  %127 = load i8, i8* %arrayidx137, align 1
  %conv138 = sext i8 %127 to i32
  %cmp139 = icmp eq i32 %conv138, 10
  br i1 %cmp139, label %while.body141, label %while.end143

while.body141:                                    ; preds = %while.cond136
  %128 = load i32, i32* %we, align 4
  %inc142 = add nsw i32 %128, 1
  store i32 %inc142, i32* %we, align 4
  br label %while.cond136

while.end143:                                     ; preds = %while.cond136
  %129 = load i32, i32* %we, align 4
  store i32 %129, i32* %ws, align 4
  br label %for.cond97

for.end144:                                       ; preds = %for.cond97
  %130 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %list145 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %130, i32 0, i32 0
  %131 = load i8**, i8*** %list145, align 4
  %132 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %list_len146 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %132, i32 0, i32 2
  %133 = load i32, i32* %list_len146, align 4
  %arrayidx147 = getelementptr inbounds i8*, i8** %131, i32 %133
  store i8* null, i8** %arrayidx147, align 4
  %134 = load i8*, i8** %csbuf, align 4
  call void @sh_xfree(i8* %134, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i32 1283)
  %135 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  store %struct._list_of_strings* %135, %struct._list_of_strings** %retval, align 4
  br label %return

return:                                           ; preds = %for.end144, %do.end94
  %136 = load %struct._list_of_strings*, %struct._list_of_strings** %retval, align 4
  ret %struct._list_of_strings* %136
}

declare void @dispose_words(%struct.word_list*) #1

declare %struct._list_of_strings* @strlist_prefix_suffix(%struct._list_of_strings*, i8*, i8*) #1

declare %struct.compspec* @compspec_create() #1

declare void @compspec_dispose(%struct.compspec*) #1

; Function Attrs: noinline nounwind
define void @pcomp_set_readline_variables(i32 %flags, i32 %nval) #0 {
entry:
  %flags.addr = alloca i32, align 4
  %nval.addr = alloca i32, align 4
  store i32 %flags, i32* %flags.addr, align 4
  store i32 %nval, i32* %nval.addr, align 4
  %0 = load i32, i32* %flags.addr, align 4
  %and = and i32 %0, 4
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %nval.addr, align 4
  store i32 %1, i32* @rl_filename_completion_desired, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %2 = load i32, i32* %flags.addr, align 4
  %and1 = and i32 %2, 32
  %tobool2 = icmp ne i32 %and1, 0
  br i1 %tobool2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  %3 = load i32, i32* %nval.addr, align 4
  store i32 %3, i32* @rl_completion_suppress_append, align 4
  br label %if.end4

if.end4:                                          ; preds = %if.then3, %if.end
  %4 = load i32, i32* %flags.addr, align 4
  %and5 = and i32 %4, 16
  %tobool6 = icmp ne i32 %and5, 0
  br i1 %tobool6, label %if.then7, label %if.end8

if.then7:                                         ; preds = %if.end4
  %5 = load i32, i32* %nval.addr, align 4
  %sub = sub nsw i32 1, %5
  store i32 %sub, i32* @rl_filename_quoting_desired, align 4
  br label %if.end8

if.end8:                                          ; preds = %if.then7, %if.end4
  %6 = load i32, i32* %flags.addr, align 4
  %and9 = and i32 %6, 256
  %tobool10 = icmp ne i32 %and9, 0
  br i1 %tobool10, label %if.then11, label %if.end13

if.then11:                                        ; preds = %if.end8
  %7 = load i32, i32* %nval.addr, align 4
  %sub12 = sub nsw i32 1, %7
  store i32 %sub12, i32* @rl_sort_completion_matches, align 4
  br label %if.end13

if.end13:                                         ; preds = %if.then11, %if.end8
  ret void
}

; Function Attrs: noinline nounwind
define void @pcomp_set_compspec_options(%struct.compspec* %cs, i32 %flags, i32 %set_or_unset) #0 {
entry:
  %cs.addr = alloca %struct.compspec*, align 4
  %flags.addr = alloca i32, align 4
  %set_or_unset.addr = alloca i32, align 4
  store %struct.compspec* %cs, %struct.compspec** %cs.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  store i32 %set_or_unset, i32* %set_or_unset.addr, align 4
  %0 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %cmp = icmp eq %struct.compspec* %0, null
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %1 = load %struct.compspec*, %struct.compspec** @pcomp_curcs, align 4
  store %struct.compspec* %1, %struct.compspec** %cs.addr, align 4
  %cmp1 = icmp eq %struct.compspec* %1, null
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  br label %if.end4

if.end:                                           ; preds = %land.lhs.true, %entry
  %2 = load i32, i32* %set_or_unset.addr, align 4
  %tobool = icmp ne i32 %2, 0
  br i1 %tobool, label %if.then2, label %if.else

if.then2:                                         ; preds = %if.end
  %3 = load i32, i32* %flags.addr, align 4
  %4 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %options = getelementptr inbounds %struct.compspec, %struct.compspec* %4, i32 0, i32 2
  %5 = load i32, i32* %options, align 4
  %or = or i32 %5, %3
  store i32 %or, i32* %options, align 4
  br label %if.end4

if.else:                                          ; preds = %if.end
  %6 = load i32, i32* %flags.addr, align 4
  %neg = xor i32 %6, -1
  %7 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %options3 = getelementptr inbounds %struct.compspec, %struct.compspec* %7, i32 0, i32 2
  %8 = load i32, i32* %options3, align 4
  %and = and i32 %8, %neg
  store i32 %and, i32* %options3, align 4
  br label %if.end4

if.end4:                                          ; preds = %if.then, %if.else, %if.then2
  ret void
}

; Function Attrs: noinline nounwind
define i8** @programmable_completions(i8* %cmd, i8* %word, i32 %start, i32 %end, i32* %foundp) #0 {
entry:
  %cmd.addr = alloca i8*, align 4
  %word.addr = alloca i8*, align 4
  %start.addr = alloca i32, align 4
  %end.addr = alloca i32, align 4
  %foundp.addr = alloca i32*, align 4
  %cs = alloca %struct.compspec*, align 4
  %lastcs = alloca %struct.compspec*, align 4
  %ret = alloca %struct._list_of_strings*, align 4
  %rmatches = alloca i8**, align 4
  %t = alloca i8*, align 4
  %found = alloca i32, align 4
  %retry = alloca i32, align 4
  %count = alloca i32, align 4
  store i8* %cmd, i8** %cmd.addr, align 4
  store i8* %word, i8** %word.addr, align 4
  store i32 %start, i32* %start.addr, align 4
  store i32 %end, i32* %end.addr, align 4
  store i32* %foundp, i32** %foundp.addr, align 4
  store %struct.compspec* null, %struct.compspec** %lastcs, align 4
  store i32 0, i32* %count, align 4
  store i32 0, i32* %found, align 4
  br label %do.body

do.body:                                          ; preds = %do.cond, %entry
  store i32 0, i32* %retry, align 4
  %0 = load i8*, i8** %cmd.addr, align 4
  %1 = load i8*, i8** %cmd.addr, align 4
  %2 = load i8*, i8** %word.addr, align 4
  %3 = load i32, i32* %start.addr, align 4
  %4 = load i32, i32* %end.addr, align 4
  %call = call %struct._list_of_strings* @gen_progcomp_completions(i8* %0, i8* %1, i8* %2, i32 %3, i32 %4, i32* %found, i32* %retry, %struct.compspec** %lastcs)
  store %struct._list_of_strings* %call, %struct._list_of_strings** %ret, align 4
  %5 = load i32, i32* %found, align 4
  %cmp = icmp eq i32 %5, 0
  br i1 %cmp, label %if.then, label %if.end5

if.then:                                          ; preds = %do.body
  %6 = load i8*, i8** %cmd.addr, align 4
  %call1 = call i8* @strrchr(i8* %6, i32 47)
  store i8* %call1, i8** %t, align 4
  %7 = load i8*, i8** %t, align 4
  %tobool = icmp ne i8* %7, null
  br i1 %tobool, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %if.then
  %8 = load i8*, i8** %t, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %8, i32 1
  store i8* %incdec.ptr, i8** %t, align 4
  %9 = load i8, i8* %incdec.ptr, align 1
  %conv = sext i8 %9 to i32
  %tobool2 = icmp ne i32 %conv, 0
  br i1 %tobool2, label %if.then3, label %if.end

if.then3:                                         ; preds = %land.lhs.true
  %10 = load i8*, i8** %t, align 4
  %11 = load i8*, i8** %cmd.addr, align 4
  %12 = load i8*, i8** %word.addr, align 4
  %13 = load i32, i32* %start.addr, align 4
  %14 = load i32, i32* %end.addr, align 4
  %call4 = call %struct._list_of_strings* @gen_progcomp_completions(i8* %10, i8* %11, i8* %12, i32 %13, i32 %14, i32* %found, i32* %retry, %struct.compspec** %lastcs)
  store %struct._list_of_strings* %call4, %struct._list_of_strings** %ret, align 4
  br label %if.end

if.end:                                           ; preds = %if.then3, %land.lhs.true, %if.then
  br label %if.end5

if.end5:                                          ; preds = %if.end, %do.body
  %15 = load i32, i32* %found, align 4
  %cmp6 = icmp eq i32 %15, 0
  br i1 %cmp6, label %if.then8, label %if.end10

if.then8:                                         ; preds = %if.end5
  %16 = load i8*, i8** %cmd.addr, align 4
  %17 = load i8*, i8** %word.addr, align 4
  %18 = load i32, i32* %start.addr, align 4
  %19 = load i32, i32* %end.addr, align 4
  %call9 = call %struct._list_of_strings* @gen_progcomp_completions(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.1, i32 0, i32 0), i8* %16, i8* %17, i32 %18, i32 %19, i32* %found, i32* %retry, %struct.compspec** %lastcs)
  store %struct._list_of_strings* %call9, %struct._list_of_strings** %ret, align 4
  br label %if.end10

if.end10:                                         ; preds = %if.then8, %if.end5
  %20 = load i32, i32* %count, align 4
  %inc = add nsw i32 %20, 1
  store i32 %inc, i32* %count, align 4
  %21 = load i32, i32* %count, align 4
  %cmp11 = icmp sgt i32 %21, 32
  br i1 %cmp11, label %if.then13, label %if.end15

if.then13:                                        ; preds = %if.end10
  %call14 = call i8* @libintl_gettext(i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.2, i32 0, i32 0))
  %22 = load i8*, i8** %cmd.addr, align 4
  call void (i8*, ...) @internal_warning(i8* %call14, i8* %22)
  br label %do.end

if.end15:                                         ; preds = %if.end10
  br label %do.cond

do.cond:                                          ; preds = %if.end15
  %23 = load i32, i32* %retry, align 4
  %tobool16 = icmp ne i32 %23, 0
  br i1 %tobool16, label %do.body, label %do.end

do.end:                                           ; preds = %do.cond, %if.then13
  %24 = load %struct._list_of_strings*, %struct._list_of_strings** %ret, align 4
  %tobool17 = icmp ne %struct._list_of_strings* %24, null
  br i1 %tobool17, label %if.then18, label %if.else

if.then18:                                        ; preds = %do.end
  %25 = load %struct._list_of_strings*, %struct._list_of_strings** %ret, align 4
  %list = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %25, i32 0, i32 0
  %26 = load i8**, i8*** %list, align 4
  store i8** %26, i8*** %rmatches, align 4
  %27 = load %struct._list_of_strings*, %struct._list_of_strings** %ret, align 4
  %28 = bitcast %struct._list_of_strings* %27 to i8*
  call void @sh_xfree(i8* %28, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i32 1655)
  br label %if.end19

if.else:                                          ; preds = %do.end
  store i8** null, i8*** %rmatches, align 4
  br label %if.end19

if.end19:                                         ; preds = %if.else, %if.then18
  %29 = load i32*, i32** %foundp.addr, align 4
  %tobool20 = icmp ne i32* %29, null
  br i1 %tobool20, label %if.then21, label %if.end22

if.then21:                                        ; preds = %if.end19
  %30 = load i32, i32* %found, align 4
  %31 = load i32*, i32** %foundp.addr, align 4
  store i32 %30, i32* %31, align 4
  br label %if.end22

if.end22:                                         ; preds = %if.then21, %if.end19
  %32 = load %struct.compspec*, %struct.compspec** %lastcs, align 4
  %tobool23 = icmp ne %struct.compspec* %32, null
  br i1 %tobool23, label %if.then24, label %if.end25

if.then24:                                        ; preds = %if.end22
  %33 = load %struct.compspec*, %struct.compspec** %lastcs, align 4
  call void @compspec_dispose(%struct.compspec* %33)
  br label %if.end25

if.end25:                                         ; preds = %if.then24, %if.end22
  %34 = load i8**, i8*** %rmatches, align 4
  ret i8** %34
}

; Function Attrs: noinline nounwind
define internal %struct._list_of_strings* @gen_progcomp_completions(i8* %ocmd, i8* %cmd, i8* %word, i32 %start, i32 %end, i32* %foundp, i32* %retryp, %struct.compspec** %lastcs) #0 {
entry:
  %retval = alloca %struct._list_of_strings*, align 4
  %ocmd.addr = alloca i8*, align 4
  %cmd.addr = alloca i8*, align 4
  %word.addr = alloca i8*, align 4
  %start.addr = alloca i32, align 4
  %end.addr = alloca i32, align 4
  %foundp.addr = alloca i32*, align 4
  %retryp.addr = alloca i32*, align 4
  %lastcs.addr = alloca %struct.compspec**, align 4
  %cs = alloca %struct.compspec*, align 4
  %oldcs = alloca %struct.compspec*, align 4
  %oldcmd = alloca i8*, align 4
  %oldtxt = alloca i8*, align 4
  %ret = alloca %struct._list_of_strings*, align 4
  store i8* %ocmd, i8** %ocmd.addr, align 4
  store i8* %cmd, i8** %cmd.addr, align 4
  store i8* %word, i8** %word.addr, align 4
  store i32 %start, i32* %start.addr, align 4
  store i32 %end, i32* %end.addr, align 4
  store i32* %foundp, i32** %foundp.addr, align 4
  store i32* %retryp, i32** %retryp.addr, align 4
  store %struct.compspec** %lastcs, %struct.compspec*** %lastcs.addr, align 4
  %0 = load i8*, i8** %ocmd.addr, align 4
  %call = call %struct.compspec* @progcomp_search(i8* %0)
  store %struct.compspec* %call, %struct.compspec** %cs, align 4
  %1 = load %struct.compspec*, %struct.compspec** %cs, align 4
  %cmp = icmp eq %struct.compspec* %1, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %2 = load %struct.compspec*, %struct.compspec** %cs, align 4
  %3 = load %struct.compspec**, %struct.compspec*** %lastcs.addr, align 4
  %4 = load %struct.compspec*, %struct.compspec** %3, align 4
  %cmp1 = icmp eq %struct.compspec* %2, %4
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  store %struct._list_of_strings* null, %struct._list_of_strings** %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %5 = load %struct.compspec**, %struct.compspec*** %lastcs.addr, align 4
  %6 = load %struct.compspec*, %struct.compspec** %5, align 4
  %tobool = icmp ne %struct.compspec* %6, null
  br i1 %tobool, label %if.then2, label %if.end3

if.then2:                                         ; preds = %if.end
  %7 = load %struct.compspec**, %struct.compspec*** %lastcs.addr, align 4
  %8 = load %struct.compspec*, %struct.compspec** %7, align 4
  call void @compspec_dispose(%struct.compspec* %8)
  br label %if.end3

if.end3:                                          ; preds = %if.then2, %if.end
  %9 = load %struct.compspec*, %struct.compspec** %cs, align 4
  %refcount = getelementptr inbounds %struct.compspec, %struct.compspec* %9, i32 0, i32 0
  %10 = load i32, i32* %refcount, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %refcount, align 4
  %11 = load %struct.compspec*, %struct.compspec** %cs, align 4
  %12 = load %struct.compspec**, %struct.compspec*** %lastcs.addr, align 4
  store %struct.compspec* %11, %struct.compspec** %12, align 4
  %13 = load %struct.compspec*, %struct.compspec** %cs, align 4
  %call4 = call %struct.compspec* @compspec_copy(%struct.compspec* %13)
  store %struct.compspec* %call4, %struct.compspec** %cs, align 4
  %14 = load %struct.compspec*, %struct.compspec** @pcomp_curcs, align 4
  store %struct.compspec* %14, %struct.compspec** %oldcs, align 4
  %15 = load i8*, i8** @pcomp_curcmd, align 4
  store i8* %15, i8** %oldcmd, align 4
  %16 = load i8*, i8** @pcomp_curtxt, align 4
  store i8* %16, i8** %oldtxt, align 4
  %17 = load %struct.compspec*, %struct.compspec** %cs, align 4
  store %struct.compspec* %17, %struct.compspec** @pcomp_curcs, align 4
  %18 = load i8*, i8** %cmd.addr, align 4
  store i8* %18, i8** @pcomp_curcmd, align 4
  %19 = load i8*, i8** %word.addr, align 4
  store i8* %19, i8** @pcomp_curtxt, align 4
  %20 = load %struct.compspec*, %struct.compspec** %cs, align 4
  %21 = load i8*, i8** %cmd.addr, align 4
  %22 = load i8*, i8** %word.addr, align 4
  %23 = load i32, i32* %start.addr, align 4
  %24 = load i32, i32* %end.addr, align 4
  %25 = load i32*, i32** %foundp.addr, align 4
  %call5 = call %struct._list_of_strings* @gen_compspec_completions(%struct.compspec* %20, i8* %21, i8* %22, i32 %23, i32 %24, i32* %25)
  store %struct._list_of_strings* %call5, %struct._list_of_strings** %ret, align 4
  %26 = load %struct.compspec*, %struct.compspec** %oldcs, align 4
  store %struct.compspec* %26, %struct.compspec** @pcomp_curcs, align 4
  %27 = load i8*, i8** %oldcmd, align 4
  store i8* %27, i8** @pcomp_curcmd, align 4
  %28 = load i8*, i8** %oldtxt, align 4
  store i8* %28, i8** @pcomp_curtxt, align 4
  %29 = load i32*, i32** %retryp.addr, align 4
  %tobool6 = icmp ne i32* %29, null
  br i1 %tobool6, label %if.then7, label %if.end10

if.then7:                                         ; preds = %if.end3
  %30 = load i32*, i32** %foundp.addr, align 4
  %tobool8 = icmp ne i32* %30, null
  br i1 %tobool8, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %if.then7
  %31 = load i32*, i32** %foundp.addr, align 4
  %32 = load i32, i32* %31, align 4
  %and = and i32 %32, 256
  %tobool9 = icmp ne i32 %and, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %if.then7
  %33 = phi i1 [ false, %if.then7 ], [ %tobool9, %land.rhs ]
  %land.ext = zext i1 %33 to i32
  %34 = load i32*, i32** %retryp.addr, align 4
  store i32 %land.ext, i32* %34, align 4
  br label %if.end10

if.end10:                                         ; preds = %land.end, %if.end3
  %35 = load i32*, i32** %foundp.addr, align 4
  %tobool11 = icmp ne i32* %35, null
  br i1 %tobool11, label %if.then12, label %if.end14

if.then12:                                        ; preds = %if.end10
  %36 = load i32*, i32** %foundp.addr, align 4
  %37 = load i32, i32* %36, align 4
  %and13 = and i32 %37, -257
  store i32 %and13, i32* %36, align 4
  %38 = load %struct.compspec*, %struct.compspec** %cs, align 4
  %options = getelementptr inbounds %struct.compspec, %struct.compspec* %38, i32 0, i32 2
  %39 = load i32, i32* %options, align 4
  %40 = load i32*, i32** %foundp.addr, align 4
  %41 = load i32, i32* %40, align 4
  %or = or i32 %41, %39
  store i32 %or, i32* %40, align 4
  br label %if.end14

if.end14:                                         ; preds = %if.then12, %if.end10
  %42 = load %struct.compspec*, %struct.compspec** %cs, align 4
  call void @compspec_dispose(%struct.compspec* %42)
  %43 = load %struct._list_of_strings*, %struct._list_of_strings** %ret, align 4
  store %struct._list_of_strings* %43, %struct._list_of_strings** %retval, align 4
  br label %return

return:                                           ; preds = %if.end14, %if.then
  %44 = load %struct._list_of_strings*, %struct._list_of_strings** %retval, align 4
  ret %struct._list_of_strings* %44
}

declare i8* @strrchr(i8*, i32) #1

declare void @internal_warning(i8*, ...) #1

declare i8* @libintl_gettext(i8*) #1

declare i8* @strcreplace(i8*, i32, i8*, i32) #1

declare %struct.alias** @all_aliases() #1

; Function Attrs: noinline nounwind
define internal void @init_itemlist_from_varlist(%struct._list_of_items* %itp, %struct.variable** (...)* %svfunc) #0 {
entry:
  %itp.addr = alloca %struct._list_of_items*, align 4
  %svfunc.addr = alloca %struct.variable** (...)*, align 4
  %vlist = alloca %struct.variable**, align 4
  %sl = alloca %struct._list_of_strings*, align 4
  %i = alloca i32, align 4
  %n = alloca i32, align 4
  store %struct._list_of_items* %itp, %struct._list_of_items** %itp.addr, align 4
  store %struct.variable** (...)* %svfunc, %struct.variable** (...)** %svfunc.addr, align 4
  %0 = load %struct.variable** (...)*, %struct.variable** (...)** %svfunc.addr, align 4
  %callee.knr.cast = bitcast %struct.variable** (...)* %0 to %struct.variable** ()*
  %call = call %struct.variable** %callee.knr.cast()
  store %struct.variable** %call, %struct.variable*** %vlist, align 4
  %1 = load %struct.variable**, %struct.variable*** %vlist, align 4
  %cmp = icmp eq %struct.variable** %1, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load %struct._list_of_items*, %struct._list_of_items** %itp.addr, align 4
  %slist = getelementptr inbounds %struct._list_of_items, %struct._list_of_items* %2, i32 0, i32 2
  store %struct._list_of_strings* null, %struct._list_of_strings** %slist, align 4
  br label %return

if.end:                                           ; preds = %entry
  store i32 0, i32* %n, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load %struct.variable**, %struct.variable*** %vlist, align 4
  %4 = load i32, i32* %n, align 4
  %arrayidx = getelementptr inbounds %struct.variable*, %struct.variable** %3, i32 %4
  %5 = load %struct.variable*, %struct.variable** %arrayidx, align 4
  %tobool = icmp ne %struct.variable* %5, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %n, align 4
  %inc = add nsw i32 %6, 1
  store i32 %inc, i32* %n, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %n, align 4
  %add = add nsw i32 %7, 1
  %call1 = call %struct._list_of_strings* @strlist_create(i32 %add)
  store %struct._list_of_strings* %call1, %struct._list_of_strings** %sl, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond2

for.cond2:                                        ; preds = %for.inc13, %for.end
  %8 = load i32, i32* %i, align 4
  %9 = load i32, i32* %n, align 4
  %cmp3 = icmp slt i32 %8, %9
  br i1 %cmp3, label %for.body4, label %for.end15

for.body4:                                        ; preds = %for.cond2
  %10 = load %struct.variable**, %struct.variable*** %vlist, align 4
  %11 = load i32, i32* %i, align 4
  %arrayidx5 = getelementptr inbounds %struct.variable*, %struct.variable** %10, i32 %11
  %12 = load %struct.variable*, %struct.variable** %arrayidx5, align 4
  %name = getelementptr inbounds %struct.variable, %struct.variable* %12, i32 0, i32 0
  %13 = load i8*, i8** %name, align 4
  %call6 = call i32 @strlen(i8* %13)
  %add7 = add i32 1, %call6
  %call8 = call i8* @sh_xmalloc(i32 %add7, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i32 411)
  %14 = load %struct.variable**, %struct.variable*** %vlist, align 4
  %15 = load i32, i32* %i, align 4
  %arrayidx9 = getelementptr inbounds %struct.variable*, %struct.variable** %14, i32 %15
  %16 = load %struct.variable*, %struct.variable** %arrayidx9, align 4
  %name10 = getelementptr inbounds %struct.variable, %struct.variable* %16, i32 0, i32 0
  %17 = load i8*, i8** %name10, align 4
  %call11 = call i8* @strcpy(i8* %call8, i8* %17)
  %18 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %list = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %18, i32 0, i32 0
  %19 = load i8**, i8*** %list, align 4
  %20 = load i32, i32* %i, align 4
  %arrayidx12 = getelementptr inbounds i8*, i8** %19, i32 %20
  store i8* %call11, i8** %arrayidx12, align 4
  br label %for.inc13

for.inc13:                                        ; preds = %for.body4
  %21 = load i32, i32* %i, align 4
  %inc14 = add nsw i32 %21, 1
  store i32 %inc14, i32* %i, align 4
  br label %for.cond2

for.end15:                                        ; preds = %for.cond2
  %22 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %list16 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %22, i32 0, i32 0
  %23 = load i8**, i8*** %list16, align 4
  %24 = load i32, i32* %n, align 4
  %25 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %list_len = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %25, i32 0, i32 2
  store i32 %24, i32* %list_len, align 4
  %arrayidx17 = getelementptr inbounds i8*, i8** %23, i32 %24
  store i8* null, i8** %arrayidx17, align 4
  %26 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %27 = load %struct._list_of_items*, %struct._list_of_items** %itp.addr, align 4
  %slist18 = getelementptr inbounds %struct._list_of_items, %struct._list_of_items* %27, i32 0, i32 2
  store %struct._list_of_strings* %26, %struct._list_of_strings** %slist18, align 4
  br label %return

return:                                           ; preds = %for.end15, %if.then
  ret void
}

declare %struct.variable** @all_array_variables() #1

declare i8** @rl_funmap_names() #1

declare %struct.variable** @all_exported_variables() #1

declare %struct.variable** @all_visible_functions() #1

declare i8** @get_hostname_list() #1

; Function Attrs: noinline nounwind
define internal i32 @it_init_joblist(%struct._list_of_items* %itp, i32 %jstate) #0 {
entry:
  %itp.addr = alloca %struct._list_of_items*, align 4
  %jstate.addr = alloca i32, align 4
  store %struct._list_of_items* %itp, %struct._list_of_items** %itp.addr, align 4
  store i32 %jstate, i32* %jstate.addr, align 4
  %0 = load %struct._list_of_items*, %struct._list_of_items** %itp.addr, align 4
  %slist = getelementptr inbounds %struct._list_of_items, %struct._list_of_items* %0, i32 0, i32 2
  store %struct._list_of_strings* null, %struct._list_of_strings** %slist, align 4
  ret i32 0
}

declare %struct.variable** @all_visible_variables() #1

declare i8** @get_minus_o_opts() #1

declare i8** @get_shopt_options() #1

; Function Attrs: noinline nounwind
define internal %struct._list_of_strings* @gen_matches_from_itemlist(%struct._list_of_items* %itp, i8* %text) #0 {
entry:
  %retval = alloca %struct._list_of_strings*, align 4
  %itp.addr = alloca %struct._list_of_items*, align 4
  %text.addr = alloca i8*, align 4
  %ret = alloca %struct._list_of_strings*, align 4
  %sl = alloca %struct._list_of_strings*, align 4
  %tlen = alloca i32, align 4
  %i = alloca i32, align 4
  %n = alloca i32, align 4
  %ntxt = alloca i8*, align 4
  store %struct._list_of_items* %itp, %struct._list_of_items** %itp.addr, align 4
  store i8* %text, i8** %text.addr, align 4
  %0 = load %struct._list_of_items*, %struct._list_of_items** %itp.addr, align 4
  %flags = getelementptr inbounds %struct._list_of_items, %struct._list_of_items* %0, i32 0, i32 0
  %1 = load i32, i32* %flags, align 4
  %and = and i32 %1, 3
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %2 = load %struct._list_of_items*, %struct._list_of_items** %itp.addr, align 4
  %flags1 = getelementptr inbounds %struct._list_of_items, %struct._list_of_items* %2, i32 0, i32 0
  %3 = load i32, i32* %flags1, align 4
  %and2 = and i32 %3, 4
  %cmp = icmp eq i32 %and2, 0
  br i1 %cmp, label %if.then, label %if.end12

if.then:                                          ; preds = %lor.lhs.false, %entry
  %4 = load %struct._list_of_items*, %struct._list_of_items** %itp.addr, align 4
  %flags3 = getelementptr inbounds %struct._list_of_items, %struct._list_of_items* %4, i32 0, i32 0
  %5 = load i32, i32* %flags3, align 4
  %and4 = and i32 %5, 3
  %tobool5 = icmp ne i32 %and4, 0
  br i1 %tobool5, label %if.then6, label %if.end

if.then6:                                         ; preds = %if.then
  %6 = load %struct._list_of_items*, %struct._list_of_items** %itp.addr, align 4
  call void @clean_itemlist(%struct._list_of_items* %6)
  br label %if.end

if.end:                                           ; preds = %if.then6, %if.then
  %7 = load %struct._list_of_items*, %struct._list_of_items** %itp.addr, align 4
  %flags7 = getelementptr inbounds %struct._list_of_items, %struct._list_of_items* %7, i32 0, i32 0
  %8 = load i32, i32* %flags7, align 4
  %and8 = and i32 %8, 4
  %cmp9 = icmp eq i32 %and8, 0
  br i1 %cmp9, label %if.then10, label %if.end11

if.then10:                                        ; preds = %if.end
  %9 = load %struct._list_of_items*, %struct._list_of_items** %itp.addr, align 4
  call void @initialize_itemlist(%struct._list_of_items* %9)
  br label %if.end11

if.end11:                                         ; preds = %if.then10, %if.end
  br label %if.end12

if.end12:                                         ; preds = %if.end11, %lor.lhs.false
  %10 = load %struct._list_of_items*, %struct._list_of_items** %itp.addr, align 4
  %slist = getelementptr inbounds %struct._list_of_items, %struct._list_of_items* %10, i32 0, i32 2
  %11 = load %struct._list_of_strings*, %struct._list_of_strings** %slist, align 4
  %cmp13 = icmp eq %struct._list_of_strings* %11, null
  br i1 %cmp13, label %if.then14, label %if.end15

if.then14:                                        ; preds = %if.end12
  store %struct._list_of_strings* null, %struct._list_of_strings** %retval, align 4
  br label %return

if.end15:                                         ; preds = %if.end12
  %12 = load %struct._list_of_items*, %struct._list_of_items** %itp.addr, align 4
  %slist16 = getelementptr inbounds %struct._list_of_items, %struct._list_of_items* %12, i32 0, i32 2
  %13 = load %struct._list_of_strings*, %struct._list_of_strings** %slist16, align 4
  %list_len = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %13, i32 0, i32 2
  %14 = load i32, i32* %list_len, align 4
  %add = add nsw i32 %14, 1
  %call = call %struct._list_of_strings* @strlist_create(i32 %add)
  store %struct._list_of_strings* %call, %struct._list_of_strings** %ret, align 4
  %15 = load %struct._list_of_items*, %struct._list_of_items** %itp.addr, align 4
  %slist17 = getelementptr inbounds %struct._list_of_items, %struct._list_of_items* %15, i32 0, i32 2
  %16 = load %struct._list_of_strings*, %struct._list_of_strings** %slist17, align 4
  store %struct._list_of_strings* %16, %struct._list_of_strings** %sl, align 4
  %17 = load i8*, i8** %text.addr, align 4
  %call18 = call i8* @bash_dequote_text(i8* %17)
  store i8* %call18, i8** %ntxt, align 4
  %18 = load i8*, i8** %ntxt, align 4
  %tobool19 = icmp ne i8* %18, null
  br i1 %tobool19, label %land.lhs.true, label %cond.false33

land.lhs.true:                                    ; preds = %if.end15
  %19 = load i8*, i8** %ntxt, align 4
  %arrayidx = getelementptr inbounds i8, i8* %19, i32 0
  %20 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %20 to i32
  %tobool20 = icmp ne i32 %conv, 0
  br i1 %tobool20, label %cond.true, label %cond.false33

cond.true:                                        ; preds = %land.lhs.true
  %21 = load i8*, i8** %ntxt, align 4
  %arrayidx21 = getelementptr inbounds i8, i8* %21, i32 1
  %22 = load i8, i8* %arrayidx21, align 1
  %conv22 = sext i8 %22 to i32
  %tobool23 = icmp ne i32 %conv22, 0
  br i1 %tobool23, label %cond.true24, label %cond.false30

cond.true24:                                      ; preds = %cond.true
  %23 = load i8*, i8** %ntxt, align 4
  %arrayidx25 = getelementptr inbounds i8, i8* %23, i32 2
  %24 = load i8, i8* %arrayidx25, align 1
  %conv26 = sext i8 %24 to i32
  %tobool27 = icmp ne i32 %conv26, 0
  br i1 %tobool27, label %cond.true28, label %cond.false

cond.true28:                                      ; preds = %cond.true24
  %25 = load i8*, i8** %ntxt, align 4
  %call29 = call i32 @strlen(i8* %25)
  br label %cond.end

cond.false:                                       ; preds = %cond.true24
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true28
  %cond = phi i32 [ %call29, %cond.true28 ], [ 2, %cond.false ]
  br label %cond.end31

cond.false30:                                     ; preds = %cond.true
  br label %cond.end31

cond.end31:                                       ; preds = %cond.false30, %cond.end
  %cond32 = phi i32 [ %cond, %cond.end ], [ 1, %cond.false30 ]
  br label %cond.end34

cond.false33:                                     ; preds = %land.lhs.true, %if.end15
  br label %cond.end34

cond.end34:                                       ; preds = %cond.false33, %cond.end31
  %cond35 = phi i32 [ %cond32, %cond.end31 ], [ 0, %cond.false33 ]
  store i32 %cond35, i32* %tlen, align 4
  store i32 0, i32* %n, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %cond.end34
  %26 = load i32, i32* %i, align 4
  %27 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %list_len36 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %27, i32 0, i32 2
  %28 = load i32, i32* %list_len36, align 4
  %cmp37 = icmp slt i32 %26, %28
  br i1 %cmp37, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %29 = load i32, i32* %tlen, align 4
  %cmp39 = icmp eq i32 %29, 0
  br i1 %cmp39, label %if.then59, label %lor.lhs.false41

lor.lhs.false41:                                  ; preds = %for.body
  %30 = load i32, i32* %tlen, align 4
  %cmp42 = icmp eq i32 %30, 0
  br i1 %cmp42, label %cond.true44, label %cond.false45

cond.true44:                                      ; preds = %lor.lhs.false41
  br i1 true, label %if.then59, label %if.end77

cond.false45:                                     ; preds = %lor.lhs.false41
  %31 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %list = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %31, i32 0, i32 0
  %32 = load i8**, i8*** %list, align 4
  %33 = load i32, i32* %i, align 4
  %arrayidx46 = getelementptr inbounds i8*, i8** %32, i32 %33
  %34 = load i8*, i8** %arrayidx46, align 4
  %arrayidx47 = getelementptr inbounds i8, i8* %34, i32 0
  %35 = load i8, i8* %arrayidx47, align 1
  %conv48 = sext i8 %35 to i32
  %36 = load i8*, i8** %ntxt, align 4
  %arrayidx49 = getelementptr inbounds i8, i8* %36, i32 0
  %37 = load i8, i8* %arrayidx49, align 1
  %conv50 = sext i8 %37 to i32
  %cmp51 = icmp eq i32 %conv48, %conv50
  br i1 %cmp51, label %land.lhs.true53, label %if.end77

land.lhs.true53:                                  ; preds = %cond.false45
  %38 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %list54 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %38, i32 0, i32 0
  %39 = load i8**, i8*** %list54, align 4
  %40 = load i32, i32* %i, align 4
  %arrayidx55 = getelementptr inbounds i8*, i8** %39, i32 %40
  %41 = load i8*, i8** %arrayidx55, align 4
  %42 = load i8*, i8** %ntxt, align 4
  %43 = load i32, i32* %tlen, align 4
  %call56 = call i32 @strncmp(i8* %41, i8* %42, i32 %43)
  %cmp57 = icmp eq i32 %call56, 0
  br i1 %cmp57, label %if.then59, label %if.end77

if.then59:                                        ; preds = %land.lhs.true53, %cond.true44, %for.body
  %44 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %list60 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %44, i32 0, i32 0
  %45 = load i8**, i8*** %list60, align 4
  %46 = load i32, i32* %i, align 4
  %arrayidx61 = getelementptr inbounds i8*, i8** %45, i32 %46
  %47 = load i8*, i8** %arrayidx61, align 4
  %tobool62 = icmp ne i8* %47, null
  br i1 %tobool62, label %cond.true63, label %cond.false72

cond.true63:                                      ; preds = %if.then59
  %48 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %list64 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %48, i32 0, i32 0
  %49 = load i8**, i8*** %list64, align 4
  %50 = load i32, i32* %i, align 4
  %arrayidx65 = getelementptr inbounds i8*, i8** %49, i32 %50
  %51 = load i8*, i8** %arrayidx65, align 4
  %call66 = call i32 @strlen(i8* %51)
  %add67 = add i32 1, %call66
  %call68 = call i8* @sh_xmalloc(i32 %add67, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i32 715)
  %52 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %list69 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %52, i32 0, i32 0
  %53 = load i8**, i8*** %list69, align 4
  %54 = load i32, i32* %i, align 4
  %arrayidx70 = getelementptr inbounds i8*, i8** %53, i32 %54
  %55 = load i8*, i8** %arrayidx70, align 4
  %call71 = call i8* @strcpy(i8* %call68, i8* %55)
  br label %cond.end73

cond.false72:                                     ; preds = %if.then59
  br label %cond.end73

cond.end73:                                       ; preds = %cond.false72, %cond.true63
  %cond74 = phi i8* [ %call71, %cond.true63 ], [ null, %cond.false72 ]
  %56 = load %struct._list_of_strings*, %struct._list_of_strings** %ret, align 4
  %list75 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %56, i32 0, i32 0
  %57 = load i8**, i8*** %list75, align 4
  %58 = load i32, i32* %n, align 4
  %inc = add nsw i32 %58, 1
  store i32 %inc, i32* %n, align 4
  %arrayidx76 = getelementptr inbounds i8*, i8** %57, i32 %58
  store i8* %cond74, i8** %arrayidx76, align 4
  br label %if.end77

if.end77:                                         ; preds = %cond.end73, %land.lhs.true53, %cond.false45, %cond.true44
  br label %for.inc

for.inc:                                          ; preds = %if.end77
  %59 = load i32, i32* %i, align 4
  %inc78 = add nsw i32 %59, 1
  store i32 %inc78, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %60 = load %struct._list_of_strings*, %struct._list_of_strings** %ret, align 4
  %list79 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %60, i32 0, i32 0
  %61 = load i8**, i8*** %list79, align 4
  %62 = load i32, i32* %n, align 4
  %63 = load %struct._list_of_strings*, %struct._list_of_strings** %ret, align 4
  %list_len80 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %63, i32 0, i32 2
  store i32 %62, i32* %list_len80, align 4
  %arrayidx81 = getelementptr inbounds i8*, i8** %61, i32 %62
  store i8* null, i8** %arrayidx81, align 4
  br label %do.body

do.body:                                          ; preds = %for.end
  %64 = load i8*, i8** %ntxt, align 4
  %tobool82 = icmp ne i8* %64, null
  br i1 %tobool82, label %if.then83, label %if.end84

if.then83:                                        ; preds = %do.body
  %65 = load i8*, i8** %ntxt, align 4
  call void @sh_xfree(i8* %65, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i32 719)
  br label %if.end84

if.end84:                                         ; preds = %if.then83, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end84
  %66 = load %struct._list_of_strings*, %struct._list_of_strings** %ret, align 4
  store %struct._list_of_strings* %66, %struct._list_of_strings** %retval, align 4
  br label %return

return:                                           ; preds = %do.end, %if.then14
  %67 = load %struct._list_of_strings*, %struct._list_of_strings** %retval, align 4
  ret %struct._list_of_strings* %67
}

declare i8** @rl_completion_matches(i8*, i8* (i8*, i32)*) #1

declare i8* @command_word_completion_function(i8*, i32) #1

declare void @strvec_dispose(i8**) #1

; Function Attrs: noinline nounwind
define internal i8* @pcomp_filename_completion_function(i8* %text, i32 %state) #0 {
entry:
  %text.addr = alloca i8*, align 4
  %state.addr = alloca i32, align 4
  %qc = alloca i32, align 4
  %iscompgen = alloca i32, align 4
  %iscompleting = alloca i32, align 4
  store i8* %text, i8** %text.addr, align 4
  store i32 %state, i32* %state.addr, align 4
  %0 = load i32, i32* %state.addr, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end81

if.then:                                          ; preds = %entry
  br label %do.body

do.body:                                          ; preds = %if.then
  %1 = load i8*, i8** @pcomp_filename_completion_function.dfn, align 4
  %tobool = icmp ne i8* %1, null
  br i1 %tobool, label %if.then1, label %if.end

if.then1:                                         ; preds = %do.body
  %2 = load i8*, i8** @pcomp_filename_completion_function.dfn, align 4
  call void @sh_xfree(i8* %2, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i32 736)
  br label %if.end

if.end:                                           ; preds = %if.then1, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  %3 = load i32 (%struct.word_list*)*, i32 (%struct.word_list*)** @this_shell_builtin, align 4
  %cmp2 = icmp eq i32 (%struct.word_list*)* %3, @compgen_builtin
  %conv = zext i1 %cmp2 to i32
  store i32 %conv, i32* %iscompgen, align 4
  %4 = load i32, i32* @rl_readline_state, align 4
  %and = and i32 %4, 16384
  store i32 %and, i32* %iscompleting, align 4
  %5 = load i32, i32* %iscompgen, align 4
  %tobool3 = icmp ne i32 %5, 0
  br i1 %tobool3, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %do.end
  %6 = load i32, i32* %iscompleting, align 4
  %cmp4 = icmp eq i32 %6, 0
  br i1 %cmp4, label %land.lhs.true6, label %if.else

land.lhs.true6:                                   ; preds = %land.lhs.true
  %7 = load i32, i32* @rl_completion_found_quote, align 4
  %cmp7 = icmp eq i32 %7, 0
  br i1 %cmp7, label %land.lhs.true9, label %if.else

land.lhs.true9:                                   ; preds = %land.lhs.true6
  %8 = load i8* (i8*, i32)*, i8* (i8*, i32)** @rl_filename_dequoting_function, align 4
  %tobool10 = icmp ne i8* (i8*, i32)* %8, null
  br i1 %tobool10, label %if.then11, label %if.else

if.then11:                                        ; preds = %land.lhs.true9
  %9 = load i8* (i8*, i32)*, i8* (i8*, i32)** @rl_filename_dequoting_function, align 4
  %10 = load i8*, i8** %text.addr, align 4
  %11 = load i32, i32* @rl_completion_quote_character, align 4
  %call = call i8* %9(i8* %10, i32 %11)
  store i8* %call, i8** @pcomp_filename_completion_function.dfn, align 4
  br label %if.end80

if.else:                                          ; preds = %land.lhs.true9, %land.lhs.true6, %land.lhs.true, %do.end
  %12 = load i32, i32* %iscompgen, align 4
  %tobool12 = icmp ne i32 %12, 0
  br i1 %tobool12, label %land.lhs.true13, label %if.else45

land.lhs.true13:                                  ; preds = %if.else
  %13 = load i32, i32* %iscompleting, align 4
  %tobool14 = icmp ne i32 %13, 0
  br i1 %tobool14, label %land.lhs.true15, label %if.else45

land.lhs.true15:                                  ; preds = %land.lhs.true13
  %14 = load i8*, i8** @pcomp_curtxt, align 4
  %tobool16 = icmp ne i8* %14, null
  br i1 %tobool16, label %land.lhs.true17, label %if.else45

land.lhs.true17:                                  ; preds = %land.lhs.true15
  %15 = load i8*, i8** @pcomp_curtxt, align 4
  %16 = load i8, i8* %15, align 1
  %conv18 = sext i8 %16 to i32
  %cmp19 = icmp eq i32 %conv18, 0
  br i1 %cmp19, label %land.lhs.true21, label %if.else45

land.lhs.true21:                                  ; preds = %land.lhs.true17
  %17 = load i8*, i8** %text.addr, align 4
  %tobool22 = icmp ne i8* %17, null
  br i1 %tobool22, label %land.lhs.true23, label %if.else45

land.lhs.true23:                                  ; preds = %land.lhs.true21
  %18 = load i8*, i8** %text.addr, align 4
  %19 = load i8, i8* %18, align 1
  %conv24 = sext i8 %19 to i32
  %cmp25 = icmp eq i32 %conv24, 39
  br i1 %cmp25, label %land.lhs.true30, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true23
  %20 = load i8*, i8** %text.addr, align 4
  %21 = load i8, i8* %20, align 1
  %conv27 = sext i8 %21 to i32
  %cmp28 = icmp eq i32 %conv27, 34
  br i1 %cmp28, label %land.lhs.true30, label %if.else45

land.lhs.true30:                                  ; preds = %lor.lhs.false, %land.lhs.true23
  %22 = load i8*, i8** %text.addr, align 4
  %arrayidx = getelementptr inbounds i8, i8* %22, i32 1
  %23 = load i8, i8* %arrayidx, align 1
  %conv31 = sext i8 %23 to i32
  %24 = load i8*, i8** %text.addr, align 4
  %arrayidx32 = getelementptr inbounds i8, i8* %24, i32 0
  %25 = load i8, i8* %arrayidx32, align 1
  %conv33 = sext i8 %25 to i32
  %cmp34 = icmp eq i32 %conv31, %conv33
  br i1 %cmp34, label %land.lhs.true36, label %if.else45

land.lhs.true36:                                  ; preds = %land.lhs.true30
  %26 = load i8*, i8** %text.addr, align 4
  %arrayidx37 = getelementptr inbounds i8, i8* %26, i32 2
  %27 = load i8, i8* %arrayidx37, align 1
  %conv38 = sext i8 %27 to i32
  %cmp39 = icmp eq i32 %conv38, 0
  br i1 %cmp39, label %land.lhs.true41, label %if.else45

land.lhs.true41:                                  ; preds = %land.lhs.true36
  %28 = load i8* (i8*, i32)*, i8* (i8*, i32)** @rl_filename_dequoting_function, align 4
  %tobool42 = icmp ne i8* (i8*, i32)* %28, null
  br i1 %tobool42, label %if.then43, label %if.else45

if.then43:                                        ; preds = %land.lhs.true41
  %29 = load i8* (i8*, i32)*, i8* (i8*, i32)** @rl_filename_dequoting_function, align 4
  %30 = load i8*, i8** %text.addr, align 4
  %31 = load i32, i32* @rl_completion_quote_character, align 4
  %call44 = call i8* %29(i8* %30, i32 %31)
  store i8* %call44, i8** @pcomp_filename_completion_function.dfn, align 4
  br label %if.end79

if.else45:                                        ; preds = %land.lhs.true41, %land.lhs.true36, %land.lhs.true30, %lor.lhs.false, %land.lhs.true21, %land.lhs.true17, %land.lhs.true15, %land.lhs.true13, %if.else
  %32 = load i32, i32* %iscompgen, align 4
  %tobool46 = icmp ne i32 %32, 0
  br i1 %tobool46, label %land.lhs.true47, label %if.else74

land.lhs.true47:                                  ; preds = %if.else45
  %33 = load i32, i32* %iscompleting, align 4
  %tobool48 = icmp ne i32 %33, 0
  br i1 %tobool48, label %land.lhs.true49, label %if.else74

land.lhs.true49:                                  ; preds = %land.lhs.true47
  %34 = load i8* (i8*, i32)*, i8* (i8*, i32)** @rl_filename_dequoting_function, align 4
  %tobool50 = icmp ne i8* (i8*, i32)* %34, null
  br i1 %tobool50, label %land.lhs.true51, label %if.else74

land.lhs.true51:                                  ; preds = %land.lhs.true49
  %35 = load i8*, i8** @pcomp_curtxt, align 4
  %tobool52 = icmp ne i8* %35, null
  br i1 %tobool52, label %land.lhs.true53, label %if.else74

land.lhs.true53:                                  ; preds = %land.lhs.true51
  %36 = load i8*, i8** %text.addr, align 4
  %tobool54 = icmp ne i8* %36, null
  br i1 %tobool54, label %land.lhs.true55, label %if.else74

land.lhs.true55:                                  ; preds = %land.lhs.true53
  %37 = load i8*, i8** @pcomp_curtxt, align 4
  %arrayidx56 = getelementptr inbounds i8, i8* %37, i32 0
  %38 = load i8, i8* %arrayidx56, align 1
  %conv57 = sext i8 %38 to i32
  %39 = load i8*, i8** %text.addr, align 4
  %arrayidx58 = getelementptr inbounds i8, i8* %39, i32 0
  %40 = load i8, i8* %arrayidx58, align 1
  %conv59 = sext i8 %40 to i32
  %cmp60 = icmp eq i32 %conv57, %conv59
  br i1 %cmp60, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %land.lhs.true55
  %41 = load i8*, i8** @pcomp_curtxt, align 4
  %42 = load i8*, i8** %text.addr, align 4
  %call62 = call i32 @strcmp(i8* %41, i8* %42)
  %cmp63 = icmp eq i32 %call62, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %land.lhs.true55
  %43 = phi i1 [ false, %land.lhs.true55 ], [ %cmp63, %land.rhs ]
  %land.ext = zext i1 %43 to i32
  %cmp65 = icmp eq i32 %land.ext, 0
  br i1 %cmp65, label %land.lhs.true67, label %if.else74

land.lhs.true67:                                  ; preds = %land.end
  %44 = load i32, i32* @variable_context, align 4
  %tobool68 = icmp ne i32 %44, 0
  br i1 %tobool68, label %land.lhs.true69, label %if.else74

land.lhs.true69:                                  ; preds = %land.lhs.true67
  %45 = load i8*, i8** %text.addr, align 4
  %call70 = call i32 @sh_contains_quotes(i8* %45)
  %tobool71 = icmp ne i32 %call70, 0
  br i1 %tobool71, label %if.then72, label %if.else74

if.then72:                                        ; preds = %land.lhs.true69
  %46 = load i8* (i8*, i32)*, i8* (i8*, i32)** @rl_filename_dequoting_function, align 4
  %47 = load i8*, i8** %text.addr, align 4
  %48 = load i32, i32* @rl_completion_quote_character, align 4
  %call73 = call i8* %46(i8* %47, i32 %48)
  store i8* %call73, i8** @pcomp_filename_completion_function.dfn, align 4
  br label %if.end78

if.else74:                                        ; preds = %land.lhs.true69, %land.lhs.true67, %land.end, %land.lhs.true53, %land.lhs.true51, %land.lhs.true49, %land.lhs.true47, %if.else45
  %49 = load i8*, i8** %text.addr, align 4
  %call75 = call i32 @strlen(i8* %49)
  %add = add i32 1, %call75
  %call76 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i32 789)
  %50 = load i8*, i8** %text.addr, align 4
  %call77 = call i8* @strcpy(i8* %call76, i8* %50)
  store i8* %call77, i8** @pcomp_filename_completion_function.dfn, align 4
  br label %if.end78

if.end78:                                         ; preds = %if.else74, %if.then72
  br label %if.end79

if.end79:                                         ; preds = %if.end78, %if.then43
  br label %if.end80

if.end80:                                         ; preds = %if.end79, %if.then11
  br label %if.end81

if.end81:                                         ; preds = %if.end80, %entry
  %51 = load i8*, i8** @pcomp_filename_completion_function.dfn, align 4
  %52 = load i32, i32* %state.addr, align 4
  %call82 = call i8* @rl_filename_completion_function(i8* %51, i32 %52)
  ret i8* %call82
}

declare i8* @rl_username_completion_function(i8*, i32) #1

declare i8* @bash_groupname_completion_function(i8*, i32) #1

declare i8* @bash_servicename_completion_function(i8*, i32) #1

declare i8** @bash_directory_completion_matches(i8*) #1

declare i8* @bash_dequote_text(i8*) #1

declare i32 @strncmp(i8*, i8*, i32) #1

declare i32 @compgen_builtin(%struct.word_list*) #1

declare i32 @strcmp(i8*, i8*) #1

declare i32 @sh_contains_quotes(i8*) #1

declare i8* @rl_filename_completion_function(i8*, i32) #1

declare i8** @glob_filename(i8*, i32) #1

declare %struct.word_list* @split_at_delims(i8*, i32, i8*, i32, i32, i32*, i32*) #1

declare %struct.word_list* @expand_words_shellexp(%struct.word_list*) #1

declare i32 @list_length(...) #1

declare %struct.variable* @find_function(i8*) #1

declare void @internal_error(i8*, ...) #1

declare i32 @rl_ding() #1

declare i32 @rl_on_new_line() #1

; Function Attrs: noinline nounwind
define internal void @bind_compfunc_variables(i8* %line, i32 %ind, %struct.word_list* %lwords, i32 %cw, i32 %exported) #0 {
entry:
  %line.addr = alloca i8*, align 4
  %ind.addr = alloca i32, align 4
  %lwords.addr = alloca %struct.word_list*, align 4
  %cw.addr = alloca i32, align 4
  %exported.addr = alloca i32, align 4
  %ibuf = alloca [12 x i8], align 1
  %value = alloca i8*, align 4
  %v = alloca %struct.variable*, align 4
  %llen = alloca i32, align 4
  %c = alloca i32, align 4
  store i8* %line, i8** %line.addr, align 4
  store i32 %ind, i32* %ind.addr, align 4
  store %struct.word_list* %lwords, %struct.word_list** %lwords.addr, align 4
  store i32 %cw, i32* %cw.addr, align 4
  store i32 %exported, i32* %exported.addr, align 4
  %0 = load i8*, i8** %line.addr, align 4
  %call = call %struct.variable* @bind_variable(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.6, i32 0, i32 0), i8* %0, i32 0)
  store %struct.variable* %call, %struct.variable** %v, align 4
  %1 = load %struct.variable*, %struct.variable** %v, align 4
  %tobool = icmp ne %struct.variable* %1, null
  br i1 %tobool, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %2 = load i32, i32* %exported.addr, align 4
  %tobool1 = icmp ne i32 %2, 0
  br i1 %tobool1, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %3 = load %struct.variable*, %struct.variable** %v, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %3, i32 0, i32 5
  %4 = load i32, i32* %attributes, align 4
  %or = or i32 %4, 1
  store i32 %or, i32* %attributes, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %5 = load i8*, i8** %line.addr, align 4
  %6 = load i32, i32* %ind.addr, align 4
  %arrayidx = getelementptr inbounds i8, i8* %5, i32 %6
  %7 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %7 to i32
  store i32 %conv, i32* %c, align 4
  %8 = load i8*, i8** %line.addr, align 4
  %9 = load i32, i32* %ind.addr, align 4
  %arrayidx2 = getelementptr inbounds i8, i8* %8, i32 %9
  store i8 0, i8* %arrayidx2, align 1
  %call3 = call i32 @__ctype_get_mb_cur_max()
  %cmp = icmp ugt i32 %call3, 1
  br i1 %cmp, label %cond.true, label %cond.false19

cond.true:                                        ; preds = %if.end
  %10 = load i8*, i8** %line.addr, align 4
  %tobool5 = icmp ne i8* %10, null
  br i1 %tobool5, label %land.lhs.true6, label %cond.false16

land.lhs.true6:                                   ; preds = %cond.true
  %11 = load i8*, i8** %line.addr, align 4
  %arrayidx7 = getelementptr inbounds i8, i8* %11, i32 0
  %12 = load i8, i8* %arrayidx7, align 1
  %conv8 = sext i8 %12 to i32
  %tobool9 = icmp ne i32 %conv8, 0
  br i1 %tobool9, label %cond.true10, label %cond.false16

cond.true10:                                      ; preds = %land.lhs.true6
  %13 = load i8*, i8** %line.addr, align 4
  %arrayidx11 = getelementptr inbounds i8, i8* %13, i32 1
  %14 = load i8, i8* %arrayidx11, align 1
  %conv12 = sext i8 %14 to i32
  %tobool13 = icmp ne i32 %conv12, 0
  br i1 %tobool13, label %cond.true14, label %cond.false

cond.true14:                                      ; preds = %cond.true10
  %15 = load i8*, i8** %line.addr, align 4
  %call15 = call i32 @mbstrlen(i8* %15)
  br label %cond.end

cond.false:                                       ; preds = %cond.true10
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true14
  %cond = phi i32 [ %call15, %cond.true14 ], [ 1, %cond.false ]
  br label %cond.end17

cond.false16:                                     ; preds = %land.lhs.true6, %cond.true
  br label %cond.end17

cond.end17:                                       ; preds = %cond.false16, %cond.end
  %cond18 = phi i32 [ %cond, %cond.end ], [ 0, %cond.false16 ]
  br label %cond.end44

cond.false19:                                     ; preds = %if.end
  %16 = load i8*, i8** %line.addr, align 4
  %tobool20 = icmp ne i8* %16, null
  br i1 %tobool20, label %land.lhs.true21, label %cond.false41

land.lhs.true21:                                  ; preds = %cond.false19
  %17 = load i8*, i8** %line.addr, align 4
  %arrayidx22 = getelementptr inbounds i8, i8* %17, i32 0
  %18 = load i8, i8* %arrayidx22, align 1
  %conv23 = sext i8 %18 to i32
  %tobool24 = icmp ne i32 %conv23, 0
  br i1 %tobool24, label %cond.true25, label %cond.false41

cond.true25:                                      ; preds = %land.lhs.true21
  %19 = load i8*, i8** %line.addr, align 4
  %arrayidx26 = getelementptr inbounds i8, i8* %19, i32 1
  %20 = load i8, i8* %arrayidx26, align 1
  %conv27 = sext i8 %20 to i32
  %tobool28 = icmp ne i32 %conv27, 0
  br i1 %tobool28, label %cond.true29, label %cond.false38

cond.true29:                                      ; preds = %cond.true25
  %21 = load i8*, i8** %line.addr, align 4
  %arrayidx30 = getelementptr inbounds i8, i8* %21, i32 2
  %22 = load i8, i8* %arrayidx30, align 1
  %conv31 = sext i8 %22 to i32
  %tobool32 = icmp ne i32 %conv31, 0
  br i1 %tobool32, label %cond.true33, label %cond.false35

cond.true33:                                      ; preds = %cond.true29
  %23 = load i8*, i8** %line.addr, align 4
  %call34 = call i32 @strlen(i8* %23)
  br label %cond.end36

cond.false35:                                     ; preds = %cond.true29
  br label %cond.end36

cond.end36:                                       ; preds = %cond.false35, %cond.true33
  %cond37 = phi i32 [ %call34, %cond.true33 ], [ 2, %cond.false35 ]
  br label %cond.end39

cond.false38:                                     ; preds = %cond.true25
  br label %cond.end39

cond.end39:                                       ; preds = %cond.false38, %cond.end36
  %cond40 = phi i32 [ %cond37, %cond.end36 ], [ 1, %cond.false38 ]
  br label %cond.end42

cond.false41:                                     ; preds = %land.lhs.true21, %cond.false19
  br label %cond.end42

cond.end42:                                       ; preds = %cond.false41, %cond.end39
  %cond43 = phi i32 [ %cond40, %cond.end39 ], [ 0, %cond.false41 ]
  br label %cond.end44

cond.end44:                                       ; preds = %cond.end42, %cond.end17
  %cond45 = phi i32 [ %cond18, %cond.end17 ], [ %cond43, %cond.end42 ]
  store i32 %cond45, i32* %llen, align 4
  %24 = load i32, i32* %c, align 4
  %conv46 = trunc i32 %24 to i8
  %25 = load i8*, i8** %line.addr, align 4
  %26 = load i32, i32* %ind.addr, align 4
  %arrayidx47 = getelementptr inbounds i8, i8* %25, i32 %26
  store i8 %conv46, i8* %arrayidx47, align 1
  %27 = load i32, i32* %llen, align 4
  %conv48 = zext i32 %27 to i64
  %arraydecay = getelementptr inbounds [12 x i8], [12 x i8]* %ibuf, i32 0, i32 0
  %call49 = call i8* @inttostr(i64 %conv48, i8* %arraydecay, i32 12)
  store i8* %call49, i8** %value, align 4
  %28 = load i8*, i8** %value, align 4
  %call50 = call %struct.variable* @bind_int_variable(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.7, i32 0, i32 0), i8* %28)
  store %struct.variable* %call50, %struct.variable** %v, align 4
  %29 = load %struct.variable*, %struct.variable** %v, align 4
  %tobool51 = icmp ne %struct.variable* %29, null
  br i1 %tobool51, label %land.lhs.true52, label %if.end57

land.lhs.true52:                                  ; preds = %cond.end44
  %30 = load i32, i32* %exported.addr, align 4
  %tobool53 = icmp ne i32 %30, 0
  br i1 %tobool53, label %if.then54, label %if.end57

if.then54:                                        ; preds = %land.lhs.true52
  %31 = load %struct.variable*, %struct.variable** %v, align 4
  %attributes55 = getelementptr inbounds %struct.variable, %struct.variable* %31, i32 0, i32 5
  %32 = load i32, i32* %attributes55, align 4
  %or56 = or i32 %32, 1
  store i32 %or56, i32* %attributes55, align 4
  br label %if.end57

if.end57:                                         ; preds = %if.then54, %land.lhs.true52, %cond.end44
  %33 = load i32, i32* @rl_completion_type, align 4
  %conv58 = sext i32 %33 to i64
  %arraydecay59 = getelementptr inbounds [12 x i8], [12 x i8]* %ibuf, i32 0, i32 0
  %call60 = call i8* @inttostr(i64 %conv58, i8* %arraydecay59, i32 12)
  store i8* %call60, i8** %value, align 4
  %34 = load i8*, i8** %value, align 4
  %call61 = call %struct.variable* @bind_int_variable(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.8, i32 0, i32 0), i8* %34)
  store %struct.variable* %call61, %struct.variable** %v, align 4
  %35 = load %struct.variable*, %struct.variable** %v, align 4
  %tobool62 = icmp ne %struct.variable* %35, null
  br i1 %tobool62, label %land.lhs.true63, label %if.end68

land.lhs.true63:                                  ; preds = %if.end57
  %36 = load i32, i32* %exported.addr, align 4
  %tobool64 = icmp ne i32 %36, 0
  br i1 %tobool64, label %if.then65, label %if.end68

if.then65:                                        ; preds = %land.lhs.true63
  %37 = load %struct.variable*, %struct.variable** %v, align 4
  %attributes66 = getelementptr inbounds %struct.variable, %struct.variable* %37, i32 0, i32 5
  %38 = load i32, i32* %attributes66, align 4
  %or67 = or i32 %38, 1
  store i32 %or67, i32* %attributes66, align 4
  br label %if.end68

if.end68:                                         ; preds = %if.then65, %land.lhs.true63, %if.end57
  %39 = load i32, i32* @rl_completion_invoking_key, align 4
  %conv69 = sext i32 %39 to i64
  %arraydecay70 = getelementptr inbounds [12 x i8], [12 x i8]* %ibuf, i32 0, i32 0
  %call71 = call i8* @inttostr(i64 %conv69, i8* %arraydecay70, i32 12)
  store i8* %call71, i8** %value, align 4
  %40 = load i8*, i8** %value, align 4
  %call72 = call %struct.variable* @bind_int_variable(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.9, i32 0, i32 0), i8* %40)
  store %struct.variable* %call72, %struct.variable** %v, align 4
  %41 = load %struct.variable*, %struct.variable** %v, align 4
  %tobool73 = icmp ne %struct.variable* %41, null
  br i1 %tobool73, label %land.lhs.true74, label %if.end79

land.lhs.true74:                                  ; preds = %if.end68
  %42 = load i32, i32* %exported.addr, align 4
  %tobool75 = icmp ne i32 %42, 0
  br i1 %tobool75, label %if.then76, label %if.end79

if.then76:                                        ; preds = %land.lhs.true74
  %43 = load %struct.variable*, %struct.variable** %v, align 4
  %attributes77 = getelementptr inbounds %struct.variable, %struct.variable* %43, i32 0, i32 5
  %44 = load i32, i32* %attributes77, align 4
  %or78 = or i32 %44, 1
  store i32 %or78, i32* %attributes77, align 4
  br label %if.end79

if.end79:                                         ; preds = %if.then76, %land.lhs.true74, %if.end68
  %45 = load i32, i32* %exported.addr, align 4
  %cmp80 = icmp eq i32 %45, 0
  br i1 %cmp80, label %if.then82, label %if.else

if.then82:                                        ; preds = %if.end79
  %46 = load %struct.word_list*, %struct.word_list** %lwords.addr, align 4
  %call83 = call %struct.variable* @bind_comp_words(%struct.word_list* %46)
  store %struct.variable* %call83, %struct.variable** %v, align 4
  %47 = load i32, i32* %cw.addr, align 4
  %conv84 = sext i32 %47 to i64
  %arraydecay85 = getelementptr inbounds [12 x i8], [12 x i8]* %ibuf, i32 0, i32 0
  %call86 = call i8* @inttostr(i64 %conv84, i8* %arraydecay85, i32 12)
  store i8* %call86, i8** %value, align 4
  %48 = load i8*, i8** %value, align 4
  %call87 = call %struct.variable* @bind_int_variable(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.10, i32 0, i32 0), i8* %48)
  br label %if.end88

if.else:                                          ; preds = %if.end79
  store i32 1, i32* @array_needs_making, align 4
  br label %if.end88

if.end88:                                         ; preds = %if.else, %if.then82
  ret void
}

; Function Attrs: noinline nounwind
define internal %struct.word_list* @build_arg_list(i8* %cmd, i8* %cname, i8* %text, %struct.word_list* %lwords, i32 %ind) #0 {
entry:
  %cmd.addr = alloca i8*, align 4
  %cname.addr = alloca i8*, align 4
  %text.addr = alloca i8*, align 4
  %lwords.addr = alloca %struct.word_list*, align 4
  %ind.addr = alloca i32, align 4
  %ret = alloca %struct.word_list*, align 4
  %cl = alloca %struct.word_list*, align 4
  %l = alloca %struct.word_list*, align 4
  %w = alloca %struct.word_desc*, align 4
  %i = alloca i32, align 4
  store i8* %cmd, i8** %cmd.addr, align 4
  store i8* %cname, i8** %cname.addr, align 4
  store i8* %text, i8** %text.addr, align 4
  store %struct.word_list* %lwords, %struct.word_list** %lwords.addr, align 4
  store i32 %ind, i32* %ind.addr, align 4
  store %struct.word_list* null, %struct.word_list** %ret, align 4
  %0 = load i8*, i8** %cmd.addr, align 4
  %call = call %struct.word_desc* @make_word(i8* %0)
  store %struct.word_desc* %call, %struct.word_desc** %w, align 4
  %1 = load %struct.word_desc*, %struct.word_desc** %w, align 4
  %call1 = call %struct.word_list* @make_word_list(%struct.word_desc* %1, %struct.word_list* null)
  store %struct.word_list* %call1, %struct.word_list** %ret, align 4
  %2 = load i8*, i8** %cname.addr, align 4
  %call2 = call %struct.word_desc* @make_word(i8* %2)
  store %struct.word_desc* %call2, %struct.word_desc** %w, align 4
  %3 = load %struct.word_desc*, %struct.word_desc** %w, align 4
  %call3 = call %struct.word_list* @make_word_list(%struct.word_desc* %3, %struct.word_list* null)
  %4 = load %struct.word_list*, %struct.word_list** %ret, align 4
  %next = getelementptr inbounds %struct.word_list, %struct.word_list* %4, i32 0, i32 0
  store %struct.word_list* %call3, %struct.word_list** %next, align 4
  store %struct.word_list* %call3, %struct.word_list** %cl, align 4
  %5 = load i8*, i8** %text.addr, align 4
  %call4 = call %struct.word_desc* @make_word(i8* %5)
  store %struct.word_desc* %call4, %struct.word_desc** %w, align 4
  %6 = load %struct.word_desc*, %struct.word_desc** %w, align 4
  %call5 = call %struct.word_list* @make_word_list(%struct.word_desc* %6, %struct.word_list* null)
  %7 = load %struct.word_list*, %struct.word_list** %cl, align 4
  %next6 = getelementptr inbounds %struct.word_list, %struct.word_list* %7, i32 0, i32 0
  store %struct.word_list* %call5, %struct.word_list** %next6, align 4
  %8 = load %struct.word_list*, %struct.word_list** %cl, align 4
  %next7 = getelementptr inbounds %struct.word_list, %struct.word_list* %8, i32 0, i32 0
  %9 = load %struct.word_list*, %struct.word_list** %next7, align 4
  store %struct.word_list* %9, %struct.word_list** %cl, align 4
  %10 = load %struct.word_list*, %struct.word_list** %lwords.addr, align 4
  store %struct.word_list* %10, %struct.word_list** %l, align 4
  store i32 1, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %11 = load %struct.word_list*, %struct.word_list** %l, align 4
  %tobool = icmp ne %struct.word_list* %11, null
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.cond
  %12 = load i32, i32* %i, align 4
  %13 = load i32, i32* %ind.addr, align 4
  %sub = sub nsw i32 %13, 1
  %cmp = icmp slt i32 %12, %sub
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %14 = phi i1 [ false, %for.cond ], [ %cmp, %land.rhs ]
  br i1 %14, label %for.body, label %for.end

for.body:                                         ; preds = %land.end
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %15 = load %struct.word_list*, %struct.word_list** %l, align 4
  %next8 = getelementptr inbounds %struct.word_list, %struct.word_list* %15, i32 0, i32 0
  %16 = load %struct.word_list*, %struct.word_list** %next8, align 4
  store %struct.word_list* %16, %struct.word_list** %l, align 4
  %17 = load i32, i32* %i, align 4
  %inc = add nsw i32 %17, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %land.end
  %18 = load %struct.word_list*, %struct.word_list** %l, align 4
  %tobool9 = icmp ne %struct.word_list* %18, null
  br i1 %tobool9, label %land.lhs.true, label %cond.false

land.lhs.true:                                    ; preds = %for.end
  %19 = load %struct.word_list*, %struct.word_list** %l, align 4
  %word = getelementptr inbounds %struct.word_list, %struct.word_list* %19, i32 0, i32 1
  %20 = load %struct.word_desc*, %struct.word_desc** %word, align 4
  %tobool10 = icmp ne %struct.word_desc* %20, null
  br i1 %tobool10, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true
  %21 = load %struct.word_list*, %struct.word_list** %l, align 4
  %word11 = getelementptr inbounds %struct.word_list, %struct.word_list* %21, i32 0, i32 1
  %22 = load %struct.word_desc*, %struct.word_desc** %word11, align 4
  %call12 = call %struct.word_desc* @copy_word(%struct.word_desc* %22)
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true, %for.end
  %call13 = call %struct.word_desc* @make_word(i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.12, i32 0, i32 0))
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi %struct.word_desc* [ %call12, %cond.true ], [ %call13, %cond.false ]
  store %struct.word_desc* %cond, %struct.word_desc** %w, align 4
  %23 = load %struct.word_desc*, %struct.word_desc** %w, align 4
  %call14 = call %struct.word_list* @make_word_list(%struct.word_desc* %23, %struct.word_list* null)
  %24 = load %struct.word_list*, %struct.word_list** %cl, align 4
  %next15 = getelementptr inbounds %struct.word_list, %struct.word_list* %24, i32 0, i32 0
  store %struct.word_list* %call14, %struct.word_list** %next15, align 4
  %25 = load %struct.word_list*, %struct.word_list** %ret, align 4
  ret %struct.word_list* %25
}

declare %struct._sh_parser_state_t* @save_parser_state(%struct._sh_parser_state_t*) #1

declare void @begin_unwind_frame(i8*) #1

declare void @add_unwind_protect(...) #1

declare void @restore_parser_state(%struct._sh_parser_state_t*) #1

; Function Attrs: noinline nounwind
define internal void @unbind_compfunc_variables(i32 %exported) #0 {
entry:
  %exported.addr = alloca i32, align 4
  store i32 %exported, i32* %exported.addr, align 4
  %call = call i32 @unbind_variable_noref(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.6, i32 0, i32 0))
  %call1 = call i32 @unbind_variable_noref(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.7, i32 0, i32 0))
  %call2 = call i32 @unbind_variable_noref(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.8, i32 0, i32 0))
  %call3 = call i32 @unbind_variable_noref(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.9, i32 0, i32 0))
  %call4 = call i32 @unbind_variable_noref(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.11, i32 0, i32 0))
  %call5 = call i32 @unbind_variable_noref(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.10, i32 0, i32 0))
  %0 = load i32, i32* %exported.addr, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 1, i32* @array_needs_making, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

declare i32 @execute_shell_function(%struct.variable*, %struct.word_list*) #1

declare void @discard_unwind_frame(i8*) #1

declare %struct.variable* @find_variable(i8*) #1

declare %struct.variable* @convert_var_to_array(%struct.variable*) #1

declare i8** @array_to_argv(%struct.array*) #1

declare i32 @unbind_variable_noref(i8*) #1

declare %struct.variable* @bind_variable(i8*, i8*, i32) #1

declare i32 @__ctype_get_mb_cur_max() #1

declare i32 @mbstrlen(i8*) #1

declare i8* @inttostr(i64, i8*, i32) #1

declare %struct.variable* @bind_int_variable(i8*, i8*) #1

; Function Attrs: noinline nounwind
define internal %struct.variable* @bind_comp_words(%struct.word_list* %lwords) #0 {
entry:
  %lwords.addr = alloca %struct.word_list*, align 4
  %v = alloca %struct.variable*, align 4
  store %struct.word_list* %lwords, %struct.word_list** %lwords.addr, align 4
  %call = call %struct.variable* @find_variable(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.11, i32 0, i32 0))
  store %struct.variable* %call, %struct.variable** %v, align 4
  %0 = load %struct.variable*, %struct.variable** %v, align 4
  %cmp = icmp eq %struct.variable* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call1 = call %struct.variable* @make_new_array_variable(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.11, i32 0, i32 0))
  store %struct.variable* %call1, %struct.variable** %v, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %1 = load %struct.variable*, %struct.variable** %v, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %1, i32 0, i32 5
  %2 = load i32, i32* %attributes, align 4
  %and = and i32 %2, 2
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then2, label %if.end5

if.then2:                                         ; preds = %if.end
  %3 = load %struct.variable*, %struct.variable** %v, align 4
  %attributes3 = getelementptr inbounds %struct.variable, %struct.variable* %3, i32 0, i32 5
  %4 = load i32, i32* %attributes3, align 4
  %and4 = and i32 %4, -3
  store i32 %and4, i32* %attributes3, align 4
  br label %if.end5

if.end5:                                          ; preds = %if.then2, %if.end
  %5 = load %struct.variable*, %struct.variable** %v, align 4
  %attributes6 = getelementptr inbounds %struct.variable, %struct.variable* %5, i32 0, i32 5
  %6 = load i32, i32* %attributes6, align 4
  %and7 = and i32 %6, 4
  %cmp8 = icmp eq i32 %and7, 0
  br i1 %cmp8, label %if.then9, label %if.end11

if.then9:                                         ; preds = %if.end5
  %7 = load %struct.variable*, %struct.variable** %v, align 4
  %call10 = call %struct.variable* @convert_var_to_array(%struct.variable* %7)
  store %struct.variable* %call10, %struct.variable** %v, align 4
  br label %if.end11

if.end11:                                         ; preds = %if.then9, %if.end5
  %8 = load %struct.variable*, %struct.variable** %v, align 4
  %9 = load %struct.word_list*, %struct.word_list** %lwords.addr, align 4
  %call12 = call %struct.variable* @assign_array_var_from_word_list(%struct.variable* %8, %struct.word_list* %9, i32 0)
  store %struct.variable* %call12, %struct.variable** %v, align 4
  %10 = load %struct.variable*, %struct.variable** %v, align 4
  %attributes13 = getelementptr inbounds %struct.variable, %struct.variable* %10, i32 0, i32 5
  %11 = load i32, i32* %attributes13, align 4
  %and14 = and i32 %11, -4097
  store i32 %and14, i32* %attributes13, align 4
  %12 = load %struct.variable*, %struct.variable** %v, align 4
  ret %struct.variable* %12
}

declare %struct.variable* @make_new_array_variable(i8*) #1

declare %struct.variable* @assign_array_var_from_word_list(%struct.variable*, %struct.word_list*, i32) #1

declare %struct.word_desc* @make_word(i8*) #1

declare %struct.word_desc* @copy_word(%struct.word_desc*) #1

declare i8* @sh_single_quote(i8*) #1

declare i8* @sh_xrealloc(i8*, i32, i8*, i32) #1

declare %struct.word_desc* @command_substitute(i8*, i32) #1

declare void @dispose_word_desc(%struct.word_desc*) #1

declare %struct._list_of_strings* @strlist_resize(%struct._list_of_strings*, i32) #1

declare %struct.compspec* @progcomp_search(i8*) #1

declare %struct.compspec* @compspec_copy(%struct.compspec*) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
