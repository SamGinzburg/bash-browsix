; ModuleID = 'copy_cmd.c'
source_filename = "copy_cmd.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.word_desc = type { i8*, i32 }
%struct.word_list = type { %struct.word_list*, %struct.word_desc* }
%struct.g_list = type { %struct.g_list* }
%struct.redirect = type { %struct.redirect*, %union.REDIRECTEE, i32, i32, i32, %union.REDIRECTEE, i8* }
%union.REDIRECTEE = type { i32 }
%struct.function_def = type { i32, i32, %struct.word_desc*, %struct.command*, i8* }
%struct.command = type { i32, i32, i32, %struct.redirect*, %union.anon }
%union.anon = type { %struct.for_com* }
%struct.for_com = type { i32, i32, %struct.word_desc*, %struct.word_list*, %struct.command* }
%struct.connection = type { i32, %struct.command*, %struct.command*, i32 }
%struct.arith_for_com = type { i32, i32, %struct.word_list*, %struct.word_list*, %struct.word_list*, %struct.command* }
%struct.select_com = type { i32, i32, %struct.word_desc*, %struct.word_list*, %struct.command* }
%struct.group_com = type { i32, %struct.command* }
%struct.subshell_com = type { i32, %struct.command* }
%struct.coproc_com = type { i32, i8*, %struct.command* }
%struct.case_com = type { i32, i32, %struct.word_desc*, %struct.pattern_list* }
%struct.pattern_list = type { %struct.pattern_list*, %struct.word_list*, %struct.command*, i32 }
%struct.while_com = type { i32, %struct.command*, %struct.command* }
%struct.if_com = type { i32, %struct.command*, %struct.command*, %struct.command* }
%struct.arith_com = type { i32, i32, %struct.word_list* }
%struct.cond_com = type { i32, i32, i32, %struct.word_desc*, %struct.cond_com*, %struct.cond_com* }
%struct.simple_com = type { i32, i32, %struct.word_list*, %struct.redirect* }

@.str = private unnamed_addr constant [11 x i8] c"copy_cmd.c\00", align 1

; Function Attrs: noinline nounwind
define %struct.word_desc* @copy_word(%struct.word_desc* %w) #0 {
entry:
  %w.addr = alloca %struct.word_desc*, align 4
  %new_word = alloca %struct.word_desc*, align 4
  store %struct.word_desc* %w, %struct.word_desc** %w.addr, align 4
  %0 = load %struct.word_desc*, %struct.word_desc** %w.addr, align 4
  %word = getelementptr inbounds %struct.word_desc, %struct.word_desc* %0, i32 0, i32 0
  %1 = load i8*, i8** %word, align 4
  %call = call %struct.word_desc* @make_bare_word(i8* %1)
  store %struct.word_desc* %call, %struct.word_desc** %new_word, align 4
  %2 = load %struct.word_desc*, %struct.word_desc** %w.addr, align 4
  %flags = getelementptr inbounds %struct.word_desc, %struct.word_desc* %2, i32 0, i32 1
  %3 = load i32, i32* %flags, align 4
  %4 = load %struct.word_desc*, %struct.word_desc** %new_word, align 4
  %flags1 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %4, i32 0, i32 1
  store i32 %3, i32* %flags1, align 4
  %5 = load %struct.word_desc*, %struct.word_desc** %new_word, align 4
  ret %struct.word_desc* %5
}

declare %struct.word_desc* @make_bare_word(i8*) #1

; Function Attrs: noinline nounwind
define %struct.word_list* @copy_word_list(%struct.word_list* %list) #0 {
entry:
  %list.addr = alloca %struct.word_list*, align 4
  %new_list = alloca %struct.word_list*, align 4
  store %struct.word_list* %list, %struct.word_list** %list.addr, align 4
  store %struct.word_list* null, %struct.word_list** %new_list, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %tobool = icmp ne %struct.word_list* %0, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word = getelementptr inbounds %struct.word_list, %struct.word_list* %1, i32 0, i32 1
  %2 = load %struct.word_desc*, %struct.word_desc** %word, align 4
  %call = call %struct.word_desc* @copy_word(%struct.word_desc* %2)
  %3 = load %struct.word_list*, %struct.word_list** %new_list, align 4
  %call1 = call %struct.word_list* @make_word_list(%struct.word_desc* %call, %struct.word_list* %3)
  store %struct.word_list* %call1, %struct.word_list** %new_list, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %4 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next = getelementptr inbounds %struct.word_list, %struct.word_list* %4, i32 0, i32 0
  %5 = load %struct.word_list*, %struct.word_list** %next, align 4
  store %struct.word_list* %5, %struct.word_list** %list.addr, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %6 = load %struct.word_list*, %struct.word_list** %new_list, align 4
  %tobool2 = icmp ne %struct.word_list* %6, null
  br i1 %tobool2, label %land.lhs.true, label %cond.false

land.lhs.true:                                    ; preds = %for.end
  %7 = load %struct.word_list*, %struct.word_list** %new_list, align 4
  %next3 = getelementptr inbounds %struct.word_list, %struct.word_list* %7, i32 0, i32 0
  %8 = load %struct.word_list*, %struct.word_list** %next3, align 4
  %tobool4 = icmp ne %struct.word_list* %8, null
  br i1 %tobool4, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true
  %9 = load %struct.word_list*, %struct.word_list** %new_list, align 4
  %10 = bitcast %struct.word_list* %9 to %struct.g_list*
  %call5 = call %struct.g_list* bitcast (%struct.g_list* (...)* @list_reverse to %struct.g_list* (%struct.g_list*)*)(%struct.g_list* %10)
  %11 = bitcast %struct.g_list* %call5 to %struct.word_list*
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true, %for.end
  %12 = load %struct.word_list*, %struct.word_list** %new_list, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi %struct.word_list* [ %11, %cond.true ], [ %12, %cond.false ]
  ret %struct.word_list* %cond
}

declare %struct.word_list* @make_word_list(%struct.word_desc*, %struct.word_list*) #1

declare %struct.g_list* @list_reverse(...) #1

; Function Attrs: noinline nounwind
define %struct.redirect* @copy_redirect(%struct.redirect* %redirect) #0 {
entry:
  %redirect.addr = alloca %struct.redirect*, align 4
  %new_redirect = alloca %struct.redirect*, align 4
  store %struct.redirect* %redirect, %struct.redirect** %redirect.addr, align 4
  %call = call i8* @sh_xmalloc(i32 28, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 115)
  %0 = bitcast i8* %call to %struct.redirect*
  store %struct.redirect* %0, %struct.redirect** %new_redirect, align 4
  %1 = load %struct.redirect*, %struct.redirect** %new_redirect, align 4
  %2 = load %struct.redirect*, %struct.redirect** %redirect.addr, align 4
  %3 = bitcast %struct.redirect* %1 to i8*
  %4 = bitcast %struct.redirect* %2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %3, i8* %4, i32 28, i32 4, i1 false)
  %5 = load %struct.redirect*, %struct.redirect** %redirect.addr, align 4
  %rflags = getelementptr inbounds %struct.redirect, %struct.redirect* %5, i32 0, i32 2
  %6 = load i32, i32* %rflags, align 4
  %and = and i32 %6, 1
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %7 = load %struct.redirect*, %struct.redirect** %redirect.addr, align 4
  %redirector = getelementptr inbounds %struct.redirect, %struct.redirect* %7, i32 0, i32 1
  %filename = bitcast %union.REDIRECTEE* %redirector to %struct.word_desc**
  %8 = load %struct.word_desc*, %struct.word_desc** %filename, align 4
  %call1 = call %struct.word_desc* @copy_word(%struct.word_desc* %8)
  %9 = load %struct.redirect*, %struct.redirect** %new_redirect, align 4
  %redirector2 = getelementptr inbounds %struct.redirect, %struct.redirect* %9, i32 0, i32 1
  %filename3 = bitcast %union.REDIRECTEE* %redirector2 to %struct.word_desc**
  store %struct.word_desc* %call1, %struct.word_desc** %filename3, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %10 = load %struct.redirect*, %struct.redirect** %redirect.addr, align 4
  %instruction = getelementptr inbounds %struct.redirect, %struct.redirect* %10, i32 0, i32 4
  %11 = load i32, i32* %instruction, align 4
  switch i32 %11, label %sw.epilog [
    i32 4, label %sw.bb
    i32 8, label %sw.bb
    i32 5, label %sw.bb11
    i32 3, label %sw.bb11
    i32 0, label %sw.bb11
    i32 1, label %sw.bb11
    i32 2, label %sw.bb11
    i32 10, label %sw.bb11
    i32 19, label %sw.bb11
    i32 11, label %sw.bb11
    i32 12, label %sw.bb11
    i32 13, label %sw.bb11
    i32 14, label %sw.bb11
    i32 17, label %sw.bb11
    i32 18, label %sw.bb11
    i32 6, label %sw.bb16
    i32 7, label %sw.bb16
    i32 15, label %sw.bb16
    i32 16, label %sw.bb16
    i32 9, label %sw.bb16
  ]

sw.bb:                                            ; preds = %if.end, %if.end
  %12 = load %struct.redirect*, %struct.redirect** %redirect.addr, align 4
  %here_doc_eof = getelementptr inbounds %struct.redirect, %struct.redirect* %12, i32 0, i32 6
  %13 = load i8*, i8** %here_doc_eof, align 4
  %tobool4 = icmp ne i8* %13, null
  br i1 %tobool4, label %cond.true, label %cond.false

cond.true:                                        ; preds = %sw.bb
  %14 = load %struct.redirect*, %struct.redirect** %redirect.addr, align 4
  %here_doc_eof5 = getelementptr inbounds %struct.redirect, %struct.redirect* %14, i32 0, i32 6
  %15 = load i8*, i8** %here_doc_eof5, align 4
  %call6 = call i32 @strlen(i8* %15)
  %add = add i32 1, %call6
  %call7 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 129)
  %16 = load %struct.redirect*, %struct.redirect** %redirect.addr, align 4
  %here_doc_eof8 = getelementptr inbounds %struct.redirect, %struct.redirect* %16, i32 0, i32 6
  %17 = load i8*, i8** %here_doc_eof8, align 4
  %call9 = call i8* @strcpy(i8* %call7, i8* %17)
  br label %cond.end

cond.false:                                       ; preds = %sw.bb
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %call9, %cond.true ], [ null, %cond.false ]
  %18 = load %struct.redirect*, %struct.redirect** %new_redirect, align 4
  %here_doc_eof10 = getelementptr inbounds %struct.redirect, %struct.redirect* %18, i32 0, i32 6
  store i8* %cond, i8** %here_doc_eof10, align 4
  br label %sw.bb11

sw.bb11:                                          ; preds = %if.end, %if.end, %if.end, %if.end, %if.end, %if.end, %if.end, %if.end, %if.end, %if.end, %if.end, %if.end, %if.end, %cond.end
  %19 = load %struct.redirect*, %struct.redirect** %redirect.addr, align 4
  %redirectee = getelementptr inbounds %struct.redirect, %struct.redirect* %19, i32 0, i32 5
  %filename12 = bitcast %union.REDIRECTEE* %redirectee to %struct.word_desc**
  %20 = load %struct.word_desc*, %struct.word_desc** %filename12, align 4
  %call13 = call %struct.word_desc* @copy_word(%struct.word_desc* %20)
  %21 = load %struct.redirect*, %struct.redirect** %new_redirect, align 4
  %redirectee14 = getelementptr inbounds %struct.redirect, %struct.redirect* %21, i32 0, i32 5
  %filename15 = bitcast %union.REDIRECTEE* %redirectee14 to %struct.word_desc**
  store %struct.word_desc* %call13, %struct.word_desc** %filename15, align 4
  br label %sw.epilog

sw.bb16:                                          ; preds = %if.end, %if.end, %if.end, %if.end, %if.end
  br label %sw.epilog

sw.epilog:                                        ; preds = %if.end, %sw.bb16, %sw.bb11
  %22 = load %struct.redirect*, %struct.redirect** %new_redirect, align 4
  ret %struct.redirect* %22
}

declare i8* @sh_xmalloc(i32, i8*, i32) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* nocapture writeonly, i8* nocapture readonly, i32, i32, i1) #2

declare i8* @strcpy(i8*, i8*) #1

declare i32 @strlen(i8*) #1

; Function Attrs: noinline nounwind
define %struct.redirect* @copy_redirects(%struct.redirect* %list) #0 {
entry:
  %list.addr = alloca %struct.redirect*, align 4
  %new_list = alloca %struct.redirect*, align 4
  %temp = alloca %struct.redirect*, align 4
  store %struct.redirect* %list, %struct.redirect** %list.addr, align 4
  store %struct.redirect* null, %struct.redirect** %new_list, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load %struct.redirect*, %struct.redirect** %list.addr, align 4
  %tobool = icmp ne %struct.redirect* %0, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load %struct.redirect*, %struct.redirect** %list.addr, align 4
  %call = call %struct.redirect* @copy_redirect(%struct.redirect* %1)
  store %struct.redirect* %call, %struct.redirect** %temp, align 4
  %2 = load %struct.redirect*, %struct.redirect** %new_list, align 4
  %3 = load %struct.redirect*, %struct.redirect** %temp, align 4
  %next = getelementptr inbounds %struct.redirect, %struct.redirect* %3, i32 0, i32 0
  store %struct.redirect* %2, %struct.redirect** %next, align 4
  %4 = load %struct.redirect*, %struct.redirect** %temp, align 4
  store %struct.redirect* %4, %struct.redirect** %new_list, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %5 = load %struct.redirect*, %struct.redirect** %list.addr, align 4
  %next1 = getelementptr inbounds %struct.redirect, %struct.redirect* %5, i32 0, i32 0
  %6 = load %struct.redirect*, %struct.redirect** %next1, align 4
  store %struct.redirect* %6, %struct.redirect** %list.addr, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %7 = load %struct.redirect*, %struct.redirect** %new_list, align 4
  %tobool2 = icmp ne %struct.redirect* %7, null
  br i1 %tobool2, label %land.lhs.true, label %cond.false

land.lhs.true:                                    ; preds = %for.end
  %8 = load %struct.redirect*, %struct.redirect** %new_list, align 4
  %next3 = getelementptr inbounds %struct.redirect, %struct.redirect* %8, i32 0, i32 0
  %9 = load %struct.redirect*, %struct.redirect** %next3, align 4
  %tobool4 = icmp ne %struct.redirect* %9, null
  br i1 %tobool4, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true
  %10 = load %struct.redirect*, %struct.redirect** %new_list, align 4
  %11 = bitcast %struct.redirect* %10 to %struct.g_list*
  %call5 = call %struct.g_list* bitcast (%struct.g_list* (...)* @list_reverse to %struct.g_list* (%struct.g_list*)*)(%struct.g_list* %11)
  %12 = bitcast %struct.g_list* %call5 to %struct.redirect*
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true, %for.end
  %13 = load %struct.redirect*, %struct.redirect** %new_list, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi %struct.redirect* [ %12, %cond.true ], [ %13, %cond.false ]
  ret %struct.redirect* %cond
}

; Function Attrs: noinline nounwind
define %struct.function_def* @copy_function_def_contents(%struct.function_def* %old, %struct.function_def* %new_def) #0 {
entry:
  %old.addr = alloca %struct.function_def*, align 4
  %new_def.addr = alloca %struct.function_def*, align 4
  store %struct.function_def* %old, %struct.function_def** %old.addr, align 4
  store %struct.function_def* %new_def, %struct.function_def** %new_def.addr, align 4
  %0 = load %struct.function_def*, %struct.function_def** %old.addr, align 4
  %name = getelementptr inbounds %struct.function_def, %struct.function_def* %0, i32 0, i32 2
  %1 = load %struct.word_desc*, %struct.word_desc** %name, align 4
  %call = call %struct.word_desc* @copy_word(%struct.word_desc* %1)
  %2 = load %struct.function_def*, %struct.function_def** %new_def.addr, align 4
  %name1 = getelementptr inbounds %struct.function_def, %struct.function_def* %2, i32 0, i32 2
  store %struct.word_desc* %call, %struct.word_desc** %name1, align 4
  %3 = load %struct.function_def*, %struct.function_def** %old.addr, align 4
  %command = getelementptr inbounds %struct.function_def, %struct.function_def* %3, i32 0, i32 3
  %4 = load %struct.command*, %struct.command** %command, align 4
  %tobool = icmp ne %struct.command* %4, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %5 = load %struct.function_def*, %struct.function_def** %old.addr, align 4
  %command2 = getelementptr inbounds %struct.function_def, %struct.function_def* %5, i32 0, i32 3
  %6 = load %struct.command*, %struct.command** %command2, align 4
  %call3 = call %struct.command* @copy_command(%struct.command* %6)
  br label %cond.end

cond.false:                                       ; preds = %entry
  %7 = load %struct.function_def*, %struct.function_def** %old.addr, align 4
  %command4 = getelementptr inbounds %struct.function_def, %struct.function_def* %7, i32 0, i32 3
  %8 = load %struct.command*, %struct.command** %command4, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi %struct.command* [ %call3, %cond.true ], [ %8, %cond.false ]
  %9 = load %struct.function_def*, %struct.function_def** %new_def.addr, align 4
  %command5 = getelementptr inbounds %struct.function_def, %struct.function_def* %9, i32 0, i32 3
  store %struct.command* %cond, %struct.command** %command5, align 4
  %10 = load %struct.function_def*, %struct.function_def** %old.addr, align 4
  %flags = getelementptr inbounds %struct.function_def, %struct.function_def* %10, i32 0, i32 0
  %11 = load i32, i32* %flags, align 4
  %12 = load %struct.function_def*, %struct.function_def** %new_def.addr, align 4
  %flags6 = getelementptr inbounds %struct.function_def, %struct.function_def* %12, i32 0, i32 0
  store i32 %11, i32* %flags6, align 4
  %13 = load %struct.function_def*, %struct.function_def** %old.addr, align 4
  %line = getelementptr inbounds %struct.function_def, %struct.function_def* %13, i32 0, i32 1
  %14 = load i32, i32* %line, align 4
  %15 = load %struct.function_def*, %struct.function_def** %new_def.addr, align 4
  %line7 = getelementptr inbounds %struct.function_def, %struct.function_def* %15, i32 0, i32 1
  store i32 %14, i32* %line7, align 4
  %16 = load %struct.function_def*, %struct.function_def** %old.addr, align 4
  %source_file = getelementptr inbounds %struct.function_def, %struct.function_def* %16, i32 0, i32 4
  %17 = load i8*, i8** %source_file, align 4
  %tobool8 = icmp ne i8* %17, null
  br i1 %tobool8, label %cond.true9, label %cond.false15

cond.true9:                                       ; preds = %cond.end
  %18 = load %struct.function_def*, %struct.function_def** %old.addr, align 4
  %source_file10 = getelementptr inbounds %struct.function_def, %struct.function_def* %18, i32 0, i32 4
  %19 = load i8*, i8** %source_file10, align 4
  %call11 = call i32 @strlen(i8* %19)
  %add = add i32 1, %call11
  %call12 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 338)
  %20 = load %struct.function_def*, %struct.function_def** %old.addr, align 4
  %source_file13 = getelementptr inbounds %struct.function_def, %struct.function_def* %20, i32 0, i32 4
  %21 = load i8*, i8** %source_file13, align 4
  %call14 = call i8* @strcpy(i8* %call12, i8* %21)
  br label %cond.end17

cond.false15:                                     ; preds = %cond.end
  %22 = load %struct.function_def*, %struct.function_def** %old.addr, align 4
  %source_file16 = getelementptr inbounds %struct.function_def, %struct.function_def* %22, i32 0, i32 4
  %23 = load i8*, i8** %source_file16, align 4
  br label %cond.end17

cond.end17:                                       ; preds = %cond.false15, %cond.true9
  %cond18 = phi i8* [ %call14, %cond.true9 ], [ %23, %cond.false15 ]
  %24 = load %struct.function_def*, %struct.function_def** %new_def.addr, align 4
  %source_file19 = getelementptr inbounds %struct.function_def, %struct.function_def* %24, i32 0, i32 4
  store i8* %cond18, i8** %source_file19, align 4
  %25 = load %struct.function_def*, %struct.function_def** %new_def.addr, align 4
  ret %struct.function_def* %25
}

; Function Attrs: noinline nounwind
define %struct.command* @copy_command(%struct.command* %command) #0 {
entry:
  %retval = alloca %struct.command*, align 4
  %command.addr = alloca %struct.command*, align 4
  %new_command = alloca %struct.command*, align 4
  %new_connection = alloca %struct.connection*, align 4
  store %struct.command* %command, %struct.command** %command.addr, align 4
  %0 = load %struct.command*, %struct.command** %command.addr, align 4
  %cmp = icmp eq %struct.command* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load %struct.command*, %struct.command** %command.addr, align 4
  store %struct.command* %1, %struct.command** %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %call = call i8* @sh_xmalloc(i32 20, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 365)
  %2 = bitcast i8* %call to %struct.command*
  store %struct.command* %2, %struct.command** %new_command, align 4
  %3 = load %struct.command*, %struct.command** %new_command, align 4
  %4 = bitcast %struct.command* %3 to i8*
  %5 = load %struct.command*, %struct.command** %command.addr, align 4
  %6 = bitcast %struct.command* %5 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %4, i8* %6, i32 20, i32 1, i1 false)
  %7 = load %struct.command*, %struct.command** %command.addr, align 4
  %flags = getelementptr inbounds %struct.command, %struct.command* %7, i32 0, i32 1
  %8 = load i32, i32* %flags, align 4
  %9 = load %struct.command*, %struct.command** %new_command, align 4
  %flags1 = getelementptr inbounds %struct.command, %struct.command* %9, i32 0, i32 1
  store i32 %8, i32* %flags1, align 4
  %10 = load %struct.command*, %struct.command** %command.addr, align 4
  %line = getelementptr inbounds %struct.command, %struct.command* %10, i32 0, i32 2
  %11 = load i32, i32* %line, align 4
  %12 = load %struct.command*, %struct.command** %new_command, align 4
  %line2 = getelementptr inbounds %struct.command, %struct.command* %12, i32 0, i32 2
  store i32 %11, i32* %line2, align 4
  %13 = load %struct.command*, %struct.command** %command.addr, align 4
  %redirects = getelementptr inbounds %struct.command, %struct.command* %13, i32 0, i32 3
  %14 = load %struct.redirect*, %struct.redirect** %redirects, align 4
  %tobool = icmp ne %struct.redirect* %14, null
  br i1 %tobool, label %if.then3, label %if.end7

if.then3:                                         ; preds = %if.end
  %15 = load %struct.command*, %struct.command** %command.addr, align 4
  %redirects4 = getelementptr inbounds %struct.command, %struct.command* %15, i32 0, i32 3
  %16 = load %struct.redirect*, %struct.redirect** %redirects4, align 4
  %call5 = call %struct.redirect* @copy_redirects(%struct.redirect* %16)
  %17 = load %struct.command*, %struct.command** %new_command, align 4
  %redirects6 = getelementptr inbounds %struct.command, %struct.command* %17, i32 0, i32 3
  store %struct.redirect* %call5, %struct.redirect** %redirects6, align 4
  br label %if.end7

if.end7:                                          ; preds = %if.then3, %if.end
  %18 = load %struct.command*, %struct.command** %command.addr, align 4
  %type = getelementptr inbounds %struct.command, %struct.command* %18, i32 0, i32 0
  %19 = load i32, i32* %type, align 4
  switch i32 %19, label %sw.epilog [
    i32 0, label %sw.bb
    i32 12, label %sw.bb11
    i32 5, label %sw.bb16
    i32 9, label %sw.bb21
    i32 13, label %sw.bb26
    i32 14, label %sw.bb31
    i32 1, label %sw.bb36
    i32 8, label %sw.bb41
    i32 2, label %sw.bb41
    i32 3, label %sw.bb46
    i32 10, label %sw.bb51
    i32 11, label %sw.bb56
    i32 4, label %sw.bb61
    i32 6, label %sw.bb66
    i32 7, label %sw.bb80
  ]

sw.bb:                                            ; preds = %if.end7
  %20 = load %struct.command*, %struct.command** %command.addr, align 4
  %value = getelementptr inbounds %struct.command, %struct.command* %20, i32 0, i32 4
  %For = bitcast %union.anon* %value to %struct.for_com**
  %21 = load %struct.for_com*, %struct.for_com** %For, align 4
  %call8 = call %struct.for_com* @copy_for_command(%struct.for_com* %21)
  %22 = load %struct.command*, %struct.command** %new_command, align 4
  %value9 = getelementptr inbounds %struct.command, %struct.command* %22, i32 0, i32 4
  %For10 = bitcast %union.anon* %value9 to %struct.for_com**
  store %struct.for_com* %call8, %struct.for_com** %For10, align 4
  br label %sw.epilog

sw.bb11:                                          ; preds = %if.end7
  %23 = load %struct.command*, %struct.command** %command.addr, align 4
  %value12 = getelementptr inbounds %struct.command, %struct.command* %23, i32 0, i32 4
  %ArithFor = bitcast %union.anon* %value12 to %struct.arith_for_com**
  %24 = load %struct.arith_for_com*, %struct.arith_for_com** %ArithFor, align 4
  %call13 = call %struct.arith_for_com* @copy_arith_for_command(%struct.arith_for_com* %24)
  %25 = load %struct.command*, %struct.command** %new_command, align 4
  %value14 = getelementptr inbounds %struct.command, %struct.command* %25, i32 0, i32 4
  %ArithFor15 = bitcast %union.anon* %value14 to %struct.arith_for_com**
  store %struct.arith_for_com* %call13, %struct.arith_for_com** %ArithFor15, align 4
  br label %sw.epilog

sw.bb16:                                          ; preds = %if.end7
  %26 = load %struct.command*, %struct.command** %command.addr, align 4
  %value17 = getelementptr inbounds %struct.command, %struct.command* %26, i32 0, i32 4
  %Select = bitcast %union.anon* %value17 to %struct.select_com**
  %27 = load %struct.select_com*, %struct.select_com** %Select, align 4
  %28 = bitcast %struct.select_com* %27 to %struct.for_com*
  %call18 = call %struct.for_com* @copy_for_command(%struct.for_com* %28)
  %29 = bitcast %struct.for_com* %call18 to %struct.select_com*
  %30 = load %struct.command*, %struct.command** %new_command, align 4
  %value19 = getelementptr inbounds %struct.command, %struct.command* %30, i32 0, i32 4
  %Select20 = bitcast %union.anon* %value19 to %struct.select_com**
  store %struct.select_com* %29, %struct.select_com** %Select20, align 4
  br label %sw.epilog

sw.bb21:                                          ; preds = %if.end7
  %31 = load %struct.command*, %struct.command** %command.addr, align 4
  %value22 = getelementptr inbounds %struct.command, %struct.command* %31, i32 0, i32 4
  %Group = bitcast %union.anon* %value22 to %struct.group_com**
  %32 = load %struct.group_com*, %struct.group_com** %Group, align 4
  %call23 = call %struct.group_com* @copy_group_command(%struct.group_com* %32)
  %33 = load %struct.command*, %struct.command** %new_command, align 4
  %value24 = getelementptr inbounds %struct.command, %struct.command* %33, i32 0, i32 4
  %Group25 = bitcast %union.anon* %value24 to %struct.group_com**
  store %struct.group_com* %call23, %struct.group_com** %Group25, align 4
  br label %sw.epilog

sw.bb26:                                          ; preds = %if.end7
  %34 = load %struct.command*, %struct.command** %command.addr, align 4
  %value27 = getelementptr inbounds %struct.command, %struct.command* %34, i32 0, i32 4
  %Subshell = bitcast %union.anon* %value27 to %struct.subshell_com**
  %35 = load %struct.subshell_com*, %struct.subshell_com** %Subshell, align 4
  %call28 = call %struct.subshell_com* @copy_subshell_command(%struct.subshell_com* %35)
  %36 = load %struct.command*, %struct.command** %new_command, align 4
  %value29 = getelementptr inbounds %struct.command, %struct.command* %36, i32 0, i32 4
  %Subshell30 = bitcast %union.anon* %value29 to %struct.subshell_com**
  store %struct.subshell_com* %call28, %struct.subshell_com** %Subshell30, align 4
  br label %sw.epilog

sw.bb31:                                          ; preds = %if.end7
  %37 = load %struct.command*, %struct.command** %command.addr, align 4
  %value32 = getelementptr inbounds %struct.command, %struct.command* %37, i32 0, i32 4
  %Coproc = bitcast %union.anon* %value32 to %struct.coproc_com**
  %38 = load %struct.coproc_com*, %struct.coproc_com** %Coproc, align 4
  %call33 = call %struct.coproc_com* @copy_coproc_command(%struct.coproc_com* %38)
  %39 = load %struct.command*, %struct.command** %new_command, align 4
  %value34 = getelementptr inbounds %struct.command, %struct.command* %39, i32 0, i32 4
  %Coproc35 = bitcast %union.anon* %value34 to %struct.coproc_com**
  store %struct.coproc_com* %call33, %struct.coproc_com** %Coproc35, align 4
  br label %sw.epilog

sw.bb36:                                          ; preds = %if.end7
  %40 = load %struct.command*, %struct.command** %command.addr, align 4
  %value37 = getelementptr inbounds %struct.command, %struct.command* %40, i32 0, i32 4
  %Case = bitcast %union.anon* %value37 to %struct.case_com**
  %41 = load %struct.case_com*, %struct.case_com** %Case, align 4
  %call38 = call %struct.case_com* @copy_case_command(%struct.case_com* %41)
  %42 = load %struct.command*, %struct.command** %new_command, align 4
  %value39 = getelementptr inbounds %struct.command, %struct.command* %42, i32 0, i32 4
  %Case40 = bitcast %union.anon* %value39 to %struct.case_com**
  store %struct.case_com* %call38, %struct.case_com** %Case40, align 4
  br label %sw.epilog

sw.bb41:                                          ; preds = %if.end7, %if.end7
  %43 = load %struct.command*, %struct.command** %command.addr, align 4
  %value42 = getelementptr inbounds %struct.command, %struct.command* %43, i32 0, i32 4
  %While = bitcast %union.anon* %value42 to %struct.while_com**
  %44 = load %struct.while_com*, %struct.while_com** %While, align 4
  %call43 = call %struct.while_com* @copy_while_command(%struct.while_com* %44)
  %45 = load %struct.command*, %struct.command** %new_command, align 4
  %value44 = getelementptr inbounds %struct.command, %struct.command* %45, i32 0, i32 4
  %While45 = bitcast %union.anon* %value44 to %struct.while_com**
  store %struct.while_com* %call43, %struct.while_com** %While45, align 4
  br label %sw.epilog

sw.bb46:                                          ; preds = %if.end7
  %46 = load %struct.command*, %struct.command** %command.addr, align 4
  %value47 = getelementptr inbounds %struct.command, %struct.command* %46, i32 0, i32 4
  %If = bitcast %union.anon* %value47 to %struct.if_com**
  %47 = load %struct.if_com*, %struct.if_com** %If, align 4
  %call48 = call %struct.if_com* @copy_if_command(%struct.if_com* %47)
  %48 = load %struct.command*, %struct.command** %new_command, align 4
  %value49 = getelementptr inbounds %struct.command, %struct.command* %48, i32 0, i32 4
  %If50 = bitcast %union.anon* %value49 to %struct.if_com**
  store %struct.if_com* %call48, %struct.if_com** %If50, align 4
  br label %sw.epilog

sw.bb51:                                          ; preds = %if.end7
  %49 = load %struct.command*, %struct.command** %command.addr, align 4
  %value52 = getelementptr inbounds %struct.command, %struct.command* %49, i32 0, i32 4
  %Arith = bitcast %union.anon* %value52 to %struct.arith_com**
  %50 = load %struct.arith_com*, %struct.arith_com** %Arith, align 4
  %call53 = call %struct.arith_com* @copy_arith_command(%struct.arith_com* %50)
  %51 = load %struct.command*, %struct.command** %new_command, align 4
  %value54 = getelementptr inbounds %struct.command, %struct.command* %51, i32 0, i32 4
  %Arith55 = bitcast %union.anon* %value54 to %struct.arith_com**
  store %struct.arith_com* %call53, %struct.arith_com** %Arith55, align 4
  br label %sw.epilog

sw.bb56:                                          ; preds = %if.end7
  %52 = load %struct.command*, %struct.command** %command.addr, align 4
  %value57 = getelementptr inbounds %struct.command, %struct.command* %52, i32 0, i32 4
  %Cond = bitcast %union.anon* %value57 to %struct.cond_com**
  %53 = load %struct.cond_com*, %struct.cond_com** %Cond, align 4
  %call58 = call %struct.cond_com* @copy_cond_command(%struct.cond_com* %53)
  %54 = load %struct.command*, %struct.command** %new_command, align 4
  %value59 = getelementptr inbounds %struct.command, %struct.command* %54, i32 0, i32 4
  %Cond60 = bitcast %union.anon* %value59 to %struct.cond_com**
  store %struct.cond_com* %call58, %struct.cond_com** %Cond60, align 4
  br label %sw.epilog

sw.bb61:                                          ; preds = %if.end7
  %55 = load %struct.command*, %struct.command** %command.addr, align 4
  %value62 = getelementptr inbounds %struct.command, %struct.command* %55, i32 0, i32 4
  %Simple = bitcast %union.anon* %value62 to %struct.simple_com**
  %56 = load %struct.simple_com*, %struct.simple_com** %Simple, align 4
  %call63 = call %struct.simple_com* @copy_simple_command(%struct.simple_com* %56)
  %57 = load %struct.command*, %struct.command** %new_command, align 4
  %value64 = getelementptr inbounds %struct.command, %struct.command* %57, i32 0, i32 4
  %Simple65 = bitcast %union.anon* %value64 to %struct.simple_com**
  store %struct.simple_com* %call63, %struct.simple_com** %Simple65, align 4
  br label %sw.epilog

sw.bb66:                                          ; preds = %if.end7
  %call67 = call i8* @sh_xmalloc(i32 16, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 437)
  %58 = bitcast i8* %call67 to %struct.connection*
  store %struct.connection* %58, %struct.connection** %new_connection, align 4
  %59 = load %struct.command*, %struct.command** %command.addr, align 4
  %value68 = getelementptr inbounds %struct.command, %struct.command* %59, i32 0, i32 4
  %Connection = bitcast %union.anon* %value68 to %struct.connection**
  %60 = load %struct.connection*, %struct.connection** %Connection, align 4
  %connector = getelementptr inbounds %struct.connection, %struct.connection* %60, i32 0, i32 3
  %61 = load i32, i32* %connector, align 4
  %62 = load %struct.connection*, %struct.connection** %new_connection, align 4
  %connector69 = getelementptr inbounds %struct.connection, %struct.connection* %62, i32 0, i32 3
  store i32 %61, i32* %connector69, align 4
  %63 = load %struct.command*, %struct.command** %command.addr, align 4
  %value70 = getelementptr inbounds %struct.command, %struct.command* %63, i32 0, i32 4
  %Connection71 = bitcast %union.anon* %value70 to %struct.connection**
  %64 = load %struct.connection*, %struct.connection** %Connection71, align 4
  %first = getelementptr inbounds %struct.connection, %struct.connection* %64, i32 0, i32 1
  %65 = load %struct.command*, %struct.command** %first, align 4
  %call72 = call %struct.command* @copy_command(%struct.command* %65)
  %66 = load %struct.connection*, %struct.connection** %new_connection, align 4
  %first73 = getelementptr inbounds %struct.connection, %struct.connection* %66, i32 0, i32 1
  store %struct.command* %call72, %struct.command** %first73, align 4
  %67 = load %struct.command*, %struct.command** %command.addr, align 4
  %value74 = getelementptr inbounds %struct.command, %struct.command* %67, i32 0, i32 4
  %Connection75 = bitcast %union.anon* %value74 to %struct.connection**
  %68 = load %struct.connection*, %struct.connection** %Connection75, align 4
  %second = getelementptr inbounds %struct.connection, %struct.connection* %68, i32 0, i32 2
  %69 = load %struct.command*, %struct.command** %second, align 4
  %call76 = call %struct.command* @copy_command(%struct.command* %69)
  %70 = load %struct.connection*, %struct.connection** %new_connection, align 4
  %second77 = getelementptr inbounds %struct.connection, %struct.connection* %70, i32 0, i32 2
  store %struct.command* %call76, %struct.command** %second77, align 4
  %71 = load %struct.connection*, %struct.connection** %new_connection, align 4
  %72 = load %struct.command*, %struct.command** %new_command, align 4
  %value78 = getelementptr inbounds %struct.command, %struct.command* %72, i32 0, i32 4
  %Connection79 = bitcast %union.anon* %value78 to %struct.connection**
  store %struct.connection* %71, %struct.connection** %Connection79, align 4
  br label %sw.epilog

sw.bb80:                                          ; preds = %if.end7
  %73 = load %struct.command*, %struct.command** %command.addr, align 4
  %value81 = getelementptr inbounds %struct.command, %struct.command* %73, i32 0, i32 4
  %Function_def = bitcast %union.anon* %value81 to %struct.function_def**
  %74 = load %struct.function_def*, %struct.function_def** %Function_def, align 4
  %call82 = call %struct.function_def* @copy_function_def(%struct.function_def* %74)
  %75 = load %struct.command*, %struct.command** %new_command, align 4
  %value83 = getelementptr inbounds %struct.command, %struct.command* %75, i32 0, i32 4
  %Function_def84 = bitcast %union.anon* %value83 to %struct.function_def**
  store %struct.function_def* %call82, %struct.function_def** %Function_def84, align 4
  br label %sw.epilog

sw.epilog:                                        ; preds = %if.end7, %sw.bb80, %sw.bb66, %sw.bb61, %sw.bb56, %sw.bb51, %sw.bb46, %sw.bb41, %sw.bb36, %sw.bb31, %sw.bb26, %sw.bb21, %sw.bb16, %sw.bb11, %sw.bb
  %76 = load %struct.command*, %struct.command** %new_command, align 4
  store %struct.command* %76, %struct.command** %retval, align 4
  br label %return

return:                                           ; preds = %sw.epilog, %if.then
  %77 = load %struct.command*, %struct.command** %retval, align 4
  ret %struct.command* %77
}

; Function Attrs: noinline nounwind
define %struct.function_def* @copy_function_def(%struct.function_def* %com) #0 {
entry:
  %com.addr = alloca %struct.function_def*, align 4
  %new_def = alloca %struct.function_def*, align 4
  store %struct.function_def* %com, %struct.function_def** %com.addr, align 4
  %call = call i8* @sh_xmalloc(i32 20, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 348)
  %0 = bitcast i8* %call to %struct.function_def*
  store %struct.function_def* %0, %struct.function_def** %new_def, align 4
  %1 = load %struct.function_def*, %struct.function_def** %com.addr, align 4
  %2 = load %struct.function_def*, %struct.function_def** %new_def, align 4
  %call1 = call %struct.function_def* @copy_function_def_contents(%struct.function_def* %1, %struct.function_def* %2)
  store %struct.function_def* %call1, %struct.function_def** %new_def, align 4
  %3 = load %struct.function_def*, %struct.function_def** %new_def, align 4
  ret %struct.function_def* %3
}

; Function Attrs: noinline nounwind
define internal %struct.for_com* @copy_for_command(%struct.for_com* %com) #0 {
entry:
  %com.addr = alloca %struct.for_com*, align 4
  %new_for = alloca %struct.for_com*, align 4
  store %struct.for_com* %com, %struct.for_com** %com.addr, align 4
  %call = call i8* @sh_xmalloc(i32 20, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 177)
  %0 = bitcast i8* %call to %struct.for_com*
  store %struct.for_com* %0, %struct.for_com** %new_for, align 4
  %1 = load %struct.for_com*, %struct.for_com** %com.addr, align 4
  %flags = getelementptr inbounds %struct.for_com, %struct.for_com* %1, i32 0, i32 0
  %2 = load i32, i32* %flags, align 4
  %3 = load %struct.for_com*, %struct.for_com** %new_for, align 4
  %flags1 = getelementptr inbounds %struct.for_com, %struct.for_com* %3, i32 0, i32 0
  store i32 %2, i32* %flags1, align 4
  %4 = load %struct.for_com*, %struct.for_com** %com.addr, align 4
  %line = getelementptr inbounds %struct.for_com, %struct.for_com* %4, i32 0, i32 1
  %5 = load i32, i32* %line, align 4
  %6 = load %struct.for_com*, %struct.for_com** %new_for, align 4
  %line2 = getelementptr inbounds %struct.for_com, %struct.for_com* %6, i32 0, i32 1
  store i32 %5, i32* %line2, align 4
  %7 = load %struct.for_com*, %struct.for_com** %com.addr, align 4
  %name = getelementptr inbounds %struct.for_com, %struct.for_com* %7, i32 0, i32 2
  %8 = load %struct.word_desc*, %struct.word_desc** %name, align 4
  %call3 = call %struct.word_desc* @copy_word(%struct.word_desc* %8)
  %9 = load %struct.for_com*, %struct.for_com** %new_for, align 4
  %name4 = getelementptr inbounds %struct.for_com, %struct.for_com* %9, i32 0, i32 2
  store %struct.word_desc* %call3, %struct.word_desc** %name4, align 4
  %10 = load %struct.for_com*, %struct.for_com** %com.addr, align 4
  %map_list = getelementptr inbounds %struct.for_com, %struct.for_com* %10, i32 0, i32 3
  %11 = load %struct.word_list*, %struct.word_list** %map_list, align 4
  %call5 = call %struct.word_list* @copy_word_list(%struct.word_list* %11)
  %12 = load %struct.for_com*, %struct.for_com** %new_for, align 4
  %map_list6 = getelementptr inbounds %struct.for_com, %struct.for_com* %12, i32 0, i32 3
  store %struct.word_list* %call5, %struct.word_list** %map_list6, align 4
  %13 = load %struct.for_com*, %struct.for_com** %com.addr, align 4
  %action = getelementptr inbounds %struct.for_com, %struct.for_com* %13, i32 0, i32 4
  %14 = load %struct.command*, %struct.command** %action, align 4
  %call7 = call %struct.command* @copy_command(%struct.command* %14)
  %15 = load %struct.for_com*, %struct.for_com** %new_for, align 4
  %action8 = getelementptr inbounds %struct.for_com, %struct.for_com* %15, i32 0, i32 4
  store %struct.command* %call7, %struct.command** %action8, align 4
  %16 = load %struct.for_com*, %struct.for_com** %new_for, align 4
  ret %struct.for_com* %16
}

; Function Attrs: noinline nounwind
define internal %struct.arith_for_com* @copy_arith_for_command(%struct.arith_for_com* %com) #0 {
entry:
  %com.addr = alloca %struct.arith_for_com*, align 4
  %new_arith_for = alloca %struct.arith_for_com*, align 4
  store %struct.arith_for_com* %com, %struct.arith_for_com** %com.addr, align 4
  %call = call i8* @sh_xmalloc(i32 24, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 193)
  %0 = bitcast i8* %call to %struct.arith_for_com*
  store %struct.arith_for_com* %0, %struct.arith_for_com** %new_arith_for, align 4
  %1 = load %struct.arith_for_com*, %struct.arith_for_com** %com.addr, align 4
  %flags = getelementptr inbounds %struct.arith_for_com, %struct.arith_for_com* %1, i32 0, i32 0
  %2 = load i32, i32* %flags, align 4
  %3 = load %struct.arith_for_com*, %struct.arith_for_com** %new_arith_for, align 4
  %flags1 = getelementptr inbounds %struct.arith_for_com, %struct.arith_for_com* %3, i32 0, i32 0
  store i32 %2, i32* %flags1, align 4
  %4 = load %struct.arith_for_com*, %struct.arith_for_com** %com.addr, align 4
  %line = getelementptr inbounds %struct.arith_for_com, %struct.arith_for_com* %4, i32 0, i32 1
  %5 = load i32, i32* %line, align 4
  %6 = load %struct.arith_for_com*, %struct.arith_for_com** %new_arith_for, align 4
  %line2 = getelementptr inbounds %struct.arith_for_com, %struct.arith_for_com* %6, i32 0, i32 1
  store i32 %5, i32* %line2, align 4
  %7 = load %struct.arith_for_com*, %struct.arith_for_com** %com.addr, align 4
  %init = getelementptr inbounds %struct.arith_for_com, %struct.arith_for_com* %7, i32 0, i32 2
  %8 = load %struct.word_list*, %struct.word_list** %init, align 4
  %call3 = call %struct.word_list* @copy_word_list(%struct.word_list* %8)
  %9 = load %struct.arith_for_com*, %struct.arith_for_com** %new_arith_for, align 4
  %init4 = getelementptr inbounds %struct.arith_for_com, %struct.arith_for_com* %9, i32 0, i32 2
  store %struct.word_list* %call3, %struct.word_list** %init4, align 4
  %10 = load %struct.arith_for_com*, %struct.arith_for_com** %com.addr, align 4
  %test = getelementptr inbounds %struct.arith_for_com, %struct.arith_for_com* %10, i32 0, i32 3
  %11 = load %struct.word_list*, %struct.word_list** %test, align 4
  %call5 = call %struct.word_list* @copy_word_list(%struct.word_list* %11)
  %12 = load %struct.arith_for_com*, %struct.arith_for_com** %new_arith_for, align 4
  %test6 = getelementptr inbounds %struct.arith_for_com, %struct.arith_for_com* %12, i32 0, i32 3
  store %struct.word_list* %call5, %struct.word_list** %test6, align 4
  %13 = load %struct.arith_for_com*, %struct.arith_for_com** %com.addr, align 4
  %step = getelementptr inbounds %struct.arith_for_com, %struct.arith_for_com* %13, i32 0, i32 4
  %14 = load %struct.word_list*, %struct.word_list** %step, align 4
  %call7 = call %struct.word_list* @copy_word_list(%struct.word_list* %14)
  %15 = load %struct.arith_for_com*, %struct.arith_for_com** %new_arith_for, align 4
  %step8 = getelementptr inbounds %struct.arith_for_com, %struct.arith_for_com* %15, i32 0, i32 4
  store %struct.word_list* %call7, %struct.word_list** %step8, align 4
  %16 = load %struct.arith_for_com*, %struct.arith_for_com** %com.addr, align 4
  %action = getelementptr inbounds %struct.arith_for_com, %struct.arith_for_com* %16, i32 0, i32 5
  %17 = load %struct.command*, %struct.command** %action, align 4
  %call9 = call %struct.command* @copy_command(%struct.command* %17)
  %18 = load %struct.arith_for_com*, %struct.arith_for_com** %new_arith_for, align 4
  %action10 = getelementptr inbounds %struct.arith_for_com, %struct.arith_for_com* %18, i32 0, i32 5
  store %struct.command* %call9, %struct.command** %action10, align 4
  %19 = load %struct.arith_for_com*, %struct.arith_for_com** %new_arith_for, align 4
  ret %struct.arith_for_com* %19
}

; Function Attrs: noinline nounwind
define internal %struct.group_com* @copy_group_command(%struct.group_com* %com) #0 {
entry:
  %com.addr = alloca %struct.group_com*, align 4
  %new_group = alloca %struct.group_com*, align 4
  store %struct.group_com* %com, %struct.group_com** %com.addr, align 4
  %call = call i8* @sh_xmalloc(i32 8, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 210)
  %0 = bitcast i8* %call to %struct.group_com*
  store %struct.group_com* %0, %struct.group_com** %new_group, align 4
  %1 = load %struct.group_com*, %struct.group_com** %com.addr, align 4
  %command = getelementptr inbounds %struct.group_com, %struct.group_com* %1, i32 0, i32 1
  %2 = load %struct.command*, %struct.command** %command, align 4
  %call1 = call %struct.command* @copy_command(%struct.command* %2)
  %3 = load %struct.group_com*, %struct.group_com** %new_group, align 4
  %command2 = getelementptr inbounds %struct.group_com, %struct.group_com* %3, i32 0, i32 1
  store %struct.command* %call1, %struct.command** %command2, align 4
  %4 = load %struct.group_com*, %struct.group_com** %new_group, align 4
  ret %struct.group_com* %4
}

; Function Attrs: noinline nounwind
define internal %struct.subshell_com* @copy_subshell_command(%struct.subshell_com* %com) #0 {
entry:
  %com.addr = alloca %struct.subshell_com*, align 4
  %new_subshell = alloca %struct.subshell_com*, align 4
  store %struct.subshell_com* %com, %struct.subshell_com** %com.addr, align 4
  %call = call i8* @sh_xmalloc(i32 8, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 221)
  %0 = bitcast i8* %call to %struct.subshell_com*
  store %struct.subshell_com* %0, %struct.subshell_com** %new_subshell, align 4
  %1 = load %struct.subshell_com*, %struct.subshell_com** %com.addr, align 4
  %command = getelementptr inbounds %struct.subshell_com, %struct.subshell_com* %1, i32 0, i32 1
  %2 = load %struct.command*, %struct.command** %command, align 4
  %call1 = call %struct.command* @copy_command(%struct.command* %2)
  %3 = load %struct.subshell_com*, %struct.subshell_com** %new_subshell, align 4
  %command2 = getelementptr inbounds %struct.subshell_com, %struct.subshell_com* %3, i32 0, i32 1
  store %struct.command* %call1, %struct.command** %command2, align 4
  %4 = load %struct.subshell_com*, %struct.subshell_com** %com.addr, align 4
  %flags = getelementptr inbounds %struct.subshell_com, %struct.subshell_com* %4, i32 0, i32 0
  %5 = load i32, i32* %flags, align 4
  %6 = load %struct.subshell_com*, %struct.subshell_com** %new_subshell, align 4
  %flags3 = getelementptr inbounds %struct.subshell_com, %struct.subshell_com* %6, i32 0, i32 0
  store i32 %5, i32* %flags3, align 4
  %7 = load %struct.subshell_com*, %struct.subshell_com** %new_subshell, align 4
  ret %struct.subshell_com* %7
}

; Function Attrs: noinline nounwind
define internal %struct.coproc_com* @copy_coproc_command(%struct.coproc_com* %com) #0 {
entry:
  %com.addr = alloca %struct.coproc_com*, align 4
  %new_coproc = alloca %struct.coproc_com*, align 4
  store %struct.coproc_com* %com, %struct.coproc_com** %com.addr, align 4
  %call = call i8* @sh_xmalloc(i32 12, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 233)
  %0 = bitcast i8* %call to %struct.coproc_com*
  store %struct.coproc_com* %0, %struct.coproc_com** %new_coproc, align 4
  %1 = load %struct.coproc_com*, %struct.coproc_com** %com.addr, align 4
  %name = getelementptr inbounds %struct.coproc_com, %struct.coproc_com* %1, i32 0, i32 1
  %2 = load i8*, i8** %name, align 4
  %call1 = call i32 @strlen(i8* %2)
  %add = add i32 1, %call1
  %call2 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 234)
  %3 = load %struct.coproc_com*, %struct.coproc_com** %com.addr, align 4
  %name3 = getelementptr inbounds %struct.coproc_com, %struct.coproc_com* %3, i32 0, i32 1
  %4 = load i8*, i8** %name3, align 4
  %call4 = call i8* @strcpy(i8* %call2, i8* %4)
  %5 = load %struct.coproc_com*, %struct.coproc_com** %new_coproc, align 4
  %name5 = getelementptr inbounds %struct.coproc_com, %struct.coproc_com* %5, i32 0, i32 1
  store i8* %call4, i8** %name5, align 4
  %6 = load %struct.coproc_com*, %struct.coproc_com** %com.addr, align 4
  %command = getelementptr inbounds %struct.coproc_com, %struct.coproc_com* %6, i32 0, i32 2
  %7 = load %struct.command*, %struct.command** %command, align 4
  %call6 = call %struct.command* @copy_command(%struct.command* %7)
  %8 = load %struct.coproc_com*, %struct.coproc_com** %new_coproc, align 4
  %command7 = getelementptr inbounds %struct.coproc_com, %struct.coproc_com* %8, i32 0, i32 2
  store %struct.command* %call6, %struct.command** %command7, align 4
  %9 = load %struct.coproc_com*, %struct.coproc_com** %com.addr, align 4
  %flags = getelementptr inbounds %struct.coproc_com, %struct.coproc_com* %9, i32 0, i32 0
  %10 = load i32, i32* %flags, align 4
  %11 = load %struct.coproc_com*, %struct.coproc_com** %new_coproc, align 4
  %flags8 = getelementptr inbounds %struct.coproc_com, %struct.coproc_com* %11, i32 0, i32 0
  store i32 %10, i32* %flags8, align 4
  %12 = load %struct.coproc_com*, %struct.coproc_com** %new_coproc, align 4
  ret %struct.coproc_com* %12
}

; Function Attrs: noinline nounwind
define internal %struct.case_com* @copy_case_command(%struct.case_com* %com) #0 {
entry:
  %com.addr = alloca %struct.case_com*, align 4
  %new_case = alloca %struct.case_com*, align 4
  store %struct.case_com* %com, %struct.case_com** %com.addr, align 4
  %call = call i8* @sh_xmalloc(i32 16, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 246)
  %0 = bitcast i8* %call to %struct.case_com*
  store %struct.case_com* %0, %struct.case_com** %new_case, align 4
  %1 = load %struct.case_com*, %struct.case_com** %com.addr, align 4
  %flags = getelementptr inbounds %struct.case_com, %struct.case_com* %1, i32 0, i32 0
  %2 = load i32, i32* %flags, align 4
  %3 = load %struct.case_com*, %struct.case_com** %new_case, align 4
  %flags1 = getelementptr inbounds %struct.case_com, %struct.case_com* %3, i32 0, i32 0
  store i32 %2, i32* %flags1, align 4
  %4 = load %struct.case_com*, %struct.case_com** %com.addr, align 4
  %line = getelementptr inbounds %struct.case_com, %struct.case_com* %4, i32 0, i32 1
  %5 = load i32, i32* %line, align 4
  %6 = load %struct.case_com*, %struct.case_com** %new_case, align 4
  %line2 = getelementptr inbounds %struct.case_com, %struct.case_com* %6, i32 0, i32 1
  store i32 %5, i32* %line2, align 4
  %7 = load %struct.case_com*, %struct.case_com** %com.addr, align 4
  %word = getelementptr inbounds %struct.case_com, %struct.case_com* %7, i32 0, i32 2
  %8 = load %struct.word_desc*, %struct.word_desc** %word, align 4
  %call3 = call %struct.word_desc* @copy_word(%struct.word_desc* %8)
  %9 = load %struct.case_com*, %struct.case_com** %new_case, align 4
  %word4 = getelementptr inbounds %struct.case_com, %struct.case_com* %9, i32 0, i32 2
  store %struct.word_desc* %call3, %struct.word_desc** %word4, align 4
  %10 = load %struct.case_com*, %struct.case_com** %com.addr, align 4
  %clauses = getelementptr inbounds %struct.case_com, %struct.case_com* %10, i32 0, i32 3
  %11 = load %struct.pattern_list*, %struct.pattern_list** %clauses, align 4
  %call5 = call %struct.pattern_list* @copy_case_clauses(%struct.pattern_list* %11)
  %12 = load %struct.case_com*, %struct.case_com** %new_case, align 4
  %clauses6 = getelementptr inbounds %struct.case_com, %struct.case_com* %12, i32 0, i32 3
  store %struct.pattern_list* %call5, %struct.pattern_list** %clauses6, align 4
  %13 = load %struct.case_com*, %struct.case_com** %new_case, align 4
  ret %struct.case_com* %13
}

; Function Attrs: noinline nounwind
define internal %struct.while_com* @copy_while_command(%struct.while_com* %com) #0 {
entry:
  %com.addr = alloca %struct.while_com*, align 4
  %new_while = alloca %struct.while_com*, align 4
  store %struct.while_com* %com, %struct.while_com** %com.addr, align 4
  %call = call i8* @sh_xmalloc(i32 12, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 260)
  %0 = bitcast i8* %call to %struct.while_com*
  store %struct.while_com* %0, %struct.while_com** %new_while, align 4
  %1 = load %struct.while_com*, %struct.while_com** %com.addr, align 4
  %flags = getelementptr inbounds %struct.while_com, %struct.while_com* %1, i32 0, i32 0
  %2 = load i32, i32* %flags, align 4
  %3 = load %struct.while_com*, %struct.while_com** %new_while, align 4
  %flags1 = getelementptr inbounds %struct.while_com, %struct.while_com* %3, i32 0, i32 0
  store i32 %2, i32* %flags1, align 4
  %4 = load %struct.while_com*, %struct.while_com** %com.addr, align 4
  %test = getelementptr inbounds %struct.while_com, %struct.while_com* %4, i32 0, i32 1
  %5 = load %struct.command*, %struct.command** %test, align 4
  %call2 = call %struct.command* @copy_command(%struct.command* %5)
  %6 = load %struct.while_com*, %struct.while_com** %new_while, align 4
  %test3 = getelementptr inbounds %struct.while_com, %struct.while_com* %6, i32 0, i32 1
  store %struct.command* %call2, %struct.command** %test3, align 4
  %7 = load %struct.while_com*, %struct.while_com** %com.addr, align 4
  %action = getelementptr inbounds %struct.while_com, %struct.while_com* %7, i32 0, i32 2
  %8 = load %struct.command*, %struct.command** %action, align 4
  %call4 = call %struct.command* @copy_command(%struct.command* %8)
  %9 = load %struct.while_com*, %struct.while_com** %new_while, align 4
  %action5 = getelementptr inbounds %struct.while_com, %struct.while_com* %9, i32 0, i32 2
  store %struct.command* %call4, %struct.command** %action5, align 4
  %10 = load %struct.while_com*, %struct.while_com** %new_while, align 4
  ret %struct.while_com* %10
}

; Function Attrs: noinline nounwind
define internal %struct.if_com* @copy_if_command(%struct.if_com* %com) #0 {
entry:
  %com.addr = alloca %struct.if_com*, align 4
  %new_if = alloca %struct.if_com*, align 4
  store %struct.if_com* %com, %struct.if_com** %com.addr, align 4
  %call = call i8* @sh_xmalloc(i32 16, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 273)
  %0 = bitcast i8* %call to %struct.if_com*
  store %struct.if_com* %0, %struct.if_com** %new_if, align 4
  %1 = load %struct.if_com*, %struct.if_com** %com.addr, align 4
  %flags = getelementptr inbounds %struct.if_com, %struct.if_com* %1, i32 0, i32 0
  %2 = load i32, i32* %flags, align 4
  %3 = load %struct.if_com*, %struct.if_com** %new_if, align 4
  %flags1 = getelementptr inbounds %struct.if_com, %struct.if_com* %3, i32 0, i32 0
  store i32 %2, i32* %flags1, align 4
  %4 = load %struct.if_com*, %struct.if_com** %com.addr, align 4
  %test = getelementptr inbounds %struct.if_com, %struct.if_com* %4, i32 0, i32 1
  %5 = load %struct.command*, %struct.command** %test, align 4
  %call2 = call %struct.command* @copy_command(%struct.command* %5)
  %6 = load %struct.if_com*, %struct.if_com** %new_if, align 4
  %test3 = getelementptr inbounds %struct.if_com, %struct.if_com* %6, i32 0, i32 1
  store %struct.command* %call2, %struct.command** %test3, align 4
  %7 = load %struct.if_com*, %struct.if_com** %com.addr, align 4
  %true_case = getelementptr inbounds %struct.if_com, %struct.if_com* %7, i32 0, i32 2
  %8 = load %struct.command*, %struct.command** %true_case, align 4
  %call4 = call %struct.command* @copy_command(%struct.command* %8)
  %9 = load %struct.if_com*, %struct.if_com** %new_if, align 4
  %true_case5 = getelementptr inbounds %struct.if_com, %struct.if_com* %9, i32 0, i32 2
  store %struct.command* %call4, %struct.command** %true_case5, align 4
  %10 = load %struct.if_com*, %struct.if_com** %com.addr, align 4
  %false_case = getelementptr inbounds %struct.if_com, %struct.if_com* %10, i32 0, i32 3
  %11 = load %struct.command*, %struct.command** %false_case, align 4
  %tobool = icmp ne %struct.command* %11, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %12 = load %struct.if_com*, %struct.if_com** %com.addr, align 4
  %false_case6 = getelementptr inbounds %struct.if_com, %struct.if_com* %12, i32 0, i32 3
  %13 = load %struct.command*, %struct.command** %false_case6, align 4
  %call7 = call %struct.command* @copy_command(%struct.command* %13)
  br label %cond.end

cond.false:                                       ; preds = %entry
  %14 = load %struct.if_com*, %struct.if_com** %com.addr, align 4
  %false_case8 = getelementptr inbounds %struct.if_com, %struct.if_com* %14, i32 0, i32 3
  %15 = load %struct.command*, %struct.command** %false_case8, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi %struct.command* [ %call7, %cond.true ], [ %15, %cond.false ]
  %16 = load %struct.if_com*, %struct.if_com** %new_if, align 4
  %false_case9 = getelementptr inbounds %struct.if_com, %struct.if_com* %16, i32 0, i32 3
  store %struct.command* %cond, %struct.command** %false_case9, align 4
  %17 = load %struct.if_com*, %struct.if_com** %new_if, align 4
  ret %struct.if_com* %17
}

; Function Attrs: noinline nounwind
define internal %struct.arith_com* @copy_arith_command(%struct.arith_com* %com) #0 {
entry:
  %com.addr = alloca %struct.arith_com*, align 4
  %new_arith = alloca %struct.arith_com*, align 4
  store %struct.arith_com* %com, %struct.arith_com** %com.addr, align 4
  %call = call i8* @sh_xmalloc(i32 12, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 288)
  %0 = bitcast i8* %call to %struct.arith_com*
  store %struct.arith_com* %0, %struct.arith_com** %new_arith, align 4
  %1 = load %struct.arith_com*, %struct.arith_com** %com.addr, align 4
  %flags = getelementptr inbounds %struct.arith_com, %struct.arith_com* %1, i32 0, i32 0
  %2 = load i32, i32* %flags, align 4
  %3 = load %struct.arith_com*, %struct.arith_com** %new_arith, align 4
  %flags1 = getelementptr inbounds %struct.arith_com, %struct.arith_com* %3, i32 0, i32 0
  store i32 %2, i32* %flags1, align 4
  %4 = load %struct.arith_com*, %struct.arith_com** %com.addr, align 4
  %exp = getelementptr inbounds %struct.arith_com, %struct.arith_com* %4, i32 0, i32 2
  %5 = load %struct.word_list*, %struct.word_list** %exp, align 4
  %call2 = call %struct.word_list* @copy_word_list(%struct.word_list* %5)
  %6 = load %struct.arith_com*, %struct.arith_com** %new_arith, align 4
  %exp3 = getelementptr inbounds %struct.arith_com, %struct.arith_com* %6, i32 0, i32 2
  store %struct.word_list* %call2, %struct.word_list** %exp3, align 4
  %7 = load %struct.arith_com*, %struct.arith_com** %com.addr, align 4
  %line = getelementptr inbounds %struct.arith_com, %struct.arith_com* %7, i32 0, i32 1
  %8 = load i32, i32* %line, align 4
  %9 = load %struct.arith_com*, %struct.arith_com** %new_arith, align 4
  %line4 = getelementptr inbounds %struct.arith_com, %struct.arith_com* %9, i32 0, i32 1
  store i32 %8, i32* %line4, align 4
  %10 = load %struct.arith_com*, %struct.arith_com** %new_arith, align 4
  ret %struct.arith_com* %10
}

; Function Attrs: noinline nounwind
define internal %struct.cond_com* @copy_cond_command(%struct.cond_com* %com) #0 {
entry:
  %com.addr = alloca %struct.cond_com*, align 4
  %new_cond = alloca %struct.cond_com*, align 4
  store %struct.cond_com* %com, %struct.cond_com** %com.addr, align 4
  %call = call i8* @sh_xmalloc(i32 24, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 304)
  %0 = bitcast i8* %call to %struct.cond_com*
  store %struct.cond_com* %0, %struct.cond_com** %new_cond, align 4
  %1 = load %struct.cond_com*, %struct.cond_com** %com.addr, align 4
  %flags = getelementptr inbounds %struct.cond_com, %struct.cond_com* %1, i32 0, i32 0
  %2 = load i32, i32* %flags, align 4
  %3 = load %struct.cond_com*, %struct.cond_com** %new_cond, align 4
  %flags1 = getelementptr inbounds %struct.cond_com, %struct.cond_com* %3, i32 0, i32 0
  store i32 %2, i32* %flags1, align 4
  %4 = load %struct.cond_com*, %struct.cond_com** %com.addr, align 4
  %line = getelementptr inbounds %struct.cond_com, %struct.cond_com* %4, i32 0, i32 1
  %5 = load i32, i32* %line, align 4
  %6 = load %struct.cond_com*, %struct.cond_com** %new_cond, align 4
  %line2 = getelementptr inbounds %struct.cond_com, %struct.cond_com* %6, i32 0, i32 1
  store i32 %5, i32* %line2, align 4
  %7 = load %struct.cond_com*, %struct.cond_com** %com.addr, align 4
  %type = getelementptr inbounds %struct.cond_com, %struct.cond_com* %7, i32 0, i32 2
  %8 = load i32, i32* %type, align 4
  %9 = load %struct.cond_com*, %struct.cond_com** %new_cond, align 4
  %type3 = getelementptr inbounds %struct.cond_com, %struct.cond_com* %9, i32 0, i32 2
  store i32 %8, i32* %type3, align 4
  %10 = load %struct.cond_com*, %struct.cond_com** %com.addr, align 4
  %op = getelementptr inbounds %struct.cond_com, %struct.cond_com* %10, i32 0, i32 3
  %11 = load %struct.word_desc*, %struct.word_desc** %op, align 4
  %tobool = icmp ne %struct.word_desc* %11, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %12 = load %struct.cond_com*, %struct.cond_com** %com.addr, align 4
  %op4 = getelementptr inbounds %struct.cond_com, %struct.cond_com* %12, i32 0, i32 3
  %13 = load %struct.word_desc*, %struct.word_desc** %op4, align 4
  %call5 = call %struct.word_desc* @copy_word(%struct.word_desc* %13)
  br label %cond.end

cond.false:                                       ; preds = %entry
  %14 = load %struct.cond_com*, %struct.cond_com** %com.addr, align 4
  %op6 = getelementptr inbounds %struct.cond_com, %struct.cond_com* %14, i32 0, i32 3
  %15 = load %struct.word_desc*, %struct.word_desc** %op6, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi %struct.word_desc* [ %call5, %cond.true ], [ %15, %cond.false ]
  %16 = load %struct.cond_com*, %struct.cond_com** %new_cond, align 4
  %op7 = getelementptr inbounds %struct.cond_com, %struct.cond_com* %16, i32 0, i32 3
  store %struct.word_desc* %cond, %struct.word_desc** %op7, align 4
  %17 = load %struct.cond_com*, %struct.cond_com** %com.addr, align 4
  %left = getelementptr inbounds %struct.cond_com, %struct.cond_com* %17, i32 0, i32 4
  %18 = load %struct.cond_com*, %struct.cond_com** %left, align 4
  %tobool8 = icmp ne %struct.cond_com* %18, null
  br i1 %tobool8, label %cond.true9, label %cond.false12

cond.true9:                                       ; preds = %cond.end
  %19 = load %struct.cond_com*, %struct.cond_com** %com.addr, align 4
  %left10 = getelementptr inbounds %struct.cond_com, %struct.cond_com* %19, i32 0, i32 4
  %20 = load %struct.cond_com*, %struct.cond_com** %left10, align 4
  %call11 = call %struct.cond_com* @copy_cond_command(%struct.cond_com* %20)
  br label %cond.end13

cond.false12:                                     ; preds = %cond.end
  br label %cond.end13

cond.end13:                                       ; preds = %cond.false12, %cond.true9
  %cond14 = phi %struct.cond_com* [ %call11, %cond.true9 ], [ null, %cond.false12 ]
  %21 = load %struct.cond_com*, %struct.cond_com** %new_cond, align 4
  %left15 = getelementptr inbounds %struct.cond_com, %struct.cond_com* %21, i32 0, i32 4
  store %struct.cond_com* %cond14, %struct.cond_com** %left15, align 4
  %22 = load %struct.cond_com*, %struct.cond_com** %com.addr, align 4
  %right = getelementptr inbounds %struct.cond_com, %struct.cond_com* %22, i32 0, i32 5
  %23 = load %struct.cond_com*, %struct.cond_com** %right, align 4
  %tobool16 = icmp ne %struct.cond_com* %23, null
  br i1 %tobool16, label %cond.true17, label %cond.false20

cond.true17:                                      ; preds = %cond.end13
  %24 = load %struct.cond_com*, %struct.cond_com** %com.addr, align 4
  %right18 = getelementptr inbounds %struct.cond_com, %struct.cond_com* %24, i32 0, i32 5
  %25 = load %struct.cond_com*, %struct.cond_com** %right18, align 4
  %call19 = call %struct.cond_com* @copy_cond_command(%struct.cond_com* %25)
  br label %cond.end21

cond.false20:                                     ; preds = %cond.end13
  br label %cond.end21

cond.end21:                                       ; preds = %cond.false20, %cond.true17
  %cond22 = phi %struct.cond_com* [ %call19, %cond.true17 ], [ null, %cond.false20 ]
  %26 = load %struct.cond_com*, %struct.cond_com** %new_cond, align 4
  %right23 = getelementptr inbounds %struct.cond_com, %struct.cond_com* %26, i32 0, i32 5
  store %struct.cond_com* %cond22, %struct.cond_com** %right23, align 4
  %27 = load %struct.cond_com*, %struct.cond_com** %new_cond, align 4
  ret %struct.cond_com* %27
}

; Function Attrs: noinline nounwind
define internal %struct.simple_com* @copy_simple_command(%struct.simple_com* %com) #0 {
entry:
  %com.addr = alloca %struct.simple_com*, align 4
  %new_simple = alloca %struct.simple_com*, align 4
  store %struct.simple_com* %com, %struct.simple_com** %com.addr, align 4
  %call = call i8* @sh_xmalloc(i32 16, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 322)
  %0 = bitcast i8* %call to %struct.simple_com*
  store %struct.simple_com* %0, %struct.simple_com** %new_simple, align 4
  %1 = load %struct.simple_com*, %struct.simple_com** %com.addr, align 4
  %flags = getelementptr inbounds %struct.simple_com, %struct.simple_com* %1, i32 0, i32 0
  %2 = load i32, i32* %flags, align 4
  %3 = load %struct.simple_com*, %struct.simple_com** %new_simple, align 4
  %flags1 = getelementptr inbounds %struct.simple_com, %struct.simple_com* %3, i32 0, i32 0
  store i32 %2, i32* %flags1, align 4
  %4 = load %struct.simple_com*, %struct.simple_com** %com.addr, align 4
  %words = getelementptr inbounds %struct.simple_com, %struct.simple_com* %4, i32 0, i32 2
  %5 = load %struct.word_list*, %struct.word_list** %words, align 4
  %call2 = call %struct.word_list* @copy_word_list(%struct.word_list* %5)
  %6 = load %struct.simple_com*, %struct.simple_com** %new_simple, align 4
  %words3 = getelementptr inbounds %struct.simple_com, %struct.simple_com* %6, i32 0, i32 2
  store %struct.word_list* %call2, %struct.word_list** %words3, align 4
  %7 = load %struct.simple_com*, %struct.simple_com** %com.addr, align 4
  %redirects = getelementptr inbounds %struct.simple_com, %struct.simple_com* %7, i32 0, i32 3
  %8 = load %struct.redirect*, %struct.redirect** %redirects, align 4
  %tobool = icmp ne %struct.redirect* %8, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %9 = load %struct.simple_com*, %struct.simple_com** %com.addr, align 4
  %redirects4 = getelementptr inbounds %struct.simple_com, %struct.simple_com* %9, i32 0, i32 3
  %10 = load %struct.redirect*, %struct.redirect** %redirects4, align 4
  %call5 = call %struct.redirect* @copy_redirects(%struct.redirect* %10)
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi %struct.redirect* [ %call5, %cond.true ], [ null, %cond.false ]
  %11 = load %struct.simple_com*, %struct.simple_com** %new_simple, align 4
  %redirects6 = getelementptr inbounds %struct.simple_com, %struct.simple_com* %11, i32 0, i32 3
  store %struct.redirect* %cond, %struct.redirect** %redirects6, align 4
  %12 = load %struct.simple_com*, %struct.simple_com** %com.addr, align 4
  %line = getelementptr inbounds %struct.simple_com, %struct.simple_com* %12, i32 0, i32 1
  %13 = load i32, i32* %line, align 4
  %14 = load %struct.simple_com*, %struct.simple_com** %new_simple, align 4
  %line7 = getelementptr inbounds %struct.simple_com, %struct.simple_com* %14, i32 0, i32 1
  store i32 %13, i32* %line7, align 4
  %15 = load %struct.simple_com*, %struct.simple_com** %new_simple, align 4
  ret %struct.simple_com* %15
}

; Function Attrs: noinline nounwind
define internal %struct.pattern_list* @copy_case_clauses(%struct.pattern_list* %clauses) #0 {
entry:
  %clauses.addr = alloca %struct.pattern_list*, align 4
  %new_list = alloca %struct.pattern_list*, align 4
  %new_clause = alloca %struct.pattern_list*, align 4
  store %struct.pattern_list* %clauses, %struct.pattern_list** %clauses.addr, align 4
  store %struct.pattern_list* null, %struct.pattern_list** %new_list, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load %struct.pattern_list*, %struct.pattern_list** %clauses.addr, align 4
  %tobool = icmp ne %struct.pattern_list* %0, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load %struct.pattern_list*, %struct.pattern_list** %clauses.addr, align 4
  %call = call %struct.pattern_list* @copy_case_clause(%struct.pattern_list* %1)
  store %struct.pattern_list* %call, %struct.pattern_list** %new_clause, align 4
  %2 = load %struct.pattern_list*, %struct.pattern_list** %new_list, align 4
  %3 = load %struct.pattern_list*, %struct.pattern_list** %new_clause, align 4
  %next = getelementptr inbounds %struct.pattern_list, %struct.pattern_list* %3, i32 0, i32 0
  store %struct.pattern_list* %2, %struct.pattern_list** %next, align 4
  %4 = load %struct.pattern_list*, %struct.pattern_list** %new_clause, align 4
  store %struct.pattern_list* %4, %struct.pattern_list** %new_list, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %5 = load %struct.pattern_list*, %struct.pattern_list** %clauses.addr, align 4
  %next1 = getelementptr inbounds %struct.pattern_list, %struct.pattern_list* %5, i32 0, i32 0
  %6 = load %struct.pattern_list*, %struct.pattern_list** %next1, align 4
  store %struct.pattern_list* %6, %struct.pattern_list** %clauses.addr, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %7 = load %struct.pattern_list*, %struct.pattern_list** %new_list, align 4
  %tobool2 = icmp ne %struct.pattern_list* %7, null
  br i1 %tobool2, label %land.lhs.true, label %cond.false

land.lhs.true:                                    ; preds = %for.end
  %8 = load %struct.pattern_list*, %struct.pattern_list** %new_list, align 4
  %next3 = getelementptr inbounds %struct.pattern_list, %struct.pattern_list* %8, i32 0, i32 0
  %9 = load %struct.pattern_list*, %struct.pattern_list** %next3, align 4
  %tobool4 = icmp ne %struct.pattern_list* %9, null
  br i1 %tobool4, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true
  %10 = load %struct.pattern_list*, %struct.pattern_list** %new_list, align 4
  %11 = bitcast %struct.pattern_list* %10 to %struct.g_list*
  %call5 = call %struct.g_list* bitcast (%struct.g_list* (...)* @list_reverse to %struct.g_list* (%struct.g_list*)*)(%struct.g_list* %11)
  %12 = bitcast %struct.g_list* %call5 to %struct.pattern_list*
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true, %for.end
  %13 = load %struct.pattern_list*, %struct.pattern_list** %new_list, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi %struct.pattern_list* [ %12, %cond.true ], [ %13, %cond.false ]
  ret %struct.pattern_list* %cond
}

; Function Attrs: noinline nounwind
define internal %struct.pattern_list* @copy_case_clause(%struct.pattern_list* %clause) #0 {
entry:
  %clause.addr = alloca %struct.pattern_list*, align 4
  %new_clause = alloca %struct.pattern_list*, align 4
  store %struct.pattern_list* %clause, %struct.pattern_list** %clause.addr, align 4
  %call = call i8* @sh_xmalloc(i32 16, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 86)
  %0 = bitcast i8* %call to %struct.pattern_list*
  store %struct.pattern_list* %0, %struct.pattern_list** %new_clause, align 4
  %1 = load %struct.pattern_list*, %struct.pattern_list** %clause.addr, align 4
  %patterns = getelementptr inbounds %struct.pattern_list, %struct.pattern_list* %1, i32 0, i32 1
  %2 = load %struct.word_list*, %struct.word_list** %patterns, align 4
  %call1 = call %struct.word_list* @copy_word_list(%struct.word_list* %2)
  %3 = load %struct.pattern_list*, %struct.pattern_list** %new_clause, align 4
  %patterns2 = getelementptr inbounds %struct.pattern_list, %struct.pattern_list* %3, i32 0, i32 1
  store %struct.word_list* %call1, %struct.word_list** %patterns2, align 4
  %4 = load %struct.pattern_list*, %struct.pattern_list** %clause.addr, align 4
  %action = getelementptr inbounds %struct.pattern_list, %struct.pattern_list* %4, i32 0, i32 2
  %5 = load %struct.command*, %struct.command** %action, align 4
  %call3 = call %struct.command* @copy_command(%struct.command* %5)
  %6 = load %struct.pattern_list*, %struct.pattern_list** %new_clause, align 4
  %action4 = getelementptr inbounds %struct.pattern_list, %struct.pattern_list* %6, i32 0, i32 2
  store %struct.command* %call3, %struct.command** %action4, align 4
  %7 = load %struct.pattern_list*, %struct.pattern_list** %clause.addr, align 4
  %flags = getelementptr inbounds %struct.pattern_list, %struct.pattern_list* %7, i32 0, i32 3
  %8 = load i32, i32* %flags, align 4
  %9 = load %struct.pattern_list*, %struct.pattern_list** %new_clause, align 4
  %flags5 = getelementptr inbounds %struct.pattern_list, %struct.pattern_list* %9, i32 0, i32 3
  store i32 %8, i32* %flags5, align 4
  %10 = load %struct.pattern_list*, %struct.pattern_list** %new_clause, align 4
  ret %struct.pattern_list* %10
}

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
