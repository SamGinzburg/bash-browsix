; ModuleID = 'alias.c'
source_filename = "alias.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.hash_table = type { %struct.bucket_contents**, i32, i32 }
%struct.bucket_contents = type { %struct.bucket_contents*, i8*, i8*, i32, i32 }
%struct._list_of_items = type { i32, i32 (%struct._list_of_items*)*, %struct._list_of_strings*, %struct._list_of_strings*, i32 }
%struct._list_of_strings = type { i8**, i32, i32 }
%struct.alias = type { i8*, i8*, i8 }

@alias_expand_all = global i32 0, align 4
@aliases = global %struct.hash_table* null, align 4
@.str = private unnamed_addr constant [8 x i8] c"alias.c\00", align 1
@it_aliases = external global %struct._list_of_items, align 4
@command_word = internal global i32 0, align 4
@.str.1 = private unnamed_addr constant [7 x i8] c"\0D\0A;|&(\00", align 1
@.str.2 = private unnamed_addr constant [10 x i8] c" \09\0A\0D;|&()\00", align 1

; Function Attrs: noinline nounwind
define void @initialize_aliases() #0 {
entry:
  %0 = load %struct.hash_table*, %struct.hash_table** @aliases, align 4
  %cmp = icmp eq %struct.hash_table* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call = call %struct.hash_table* @hash_create(i32 64)
  store %struct.hash_table* %call, %struct.hash_table** @aliases, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

declare %struct.hash_table* @hash_create(i32) #1

; Function Attrs: noinline nounwind
define %struct.alias* @find_alias(i8* %name) #0 {
entry:
  %retval = alloca %struct.alias*, align 4
  %name.addr = alloca i8*, align 4
  %al = alloca %struct.bucket_contents*, align 4
  store i8* %name, i8** %name.addr, align 4
  %0 = load %struct.hash_table*, %struct.hash_table** @aliases, align 4
  %cmp = icmp eq %struct.hash_table* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store %struct.alias* null, %struct.alias** %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %name.addr, align 4
  %2 = load %struct.hash_table*, %struct.hash_table** @aliases, align 4
  %call = call %struct.bucket_contents* @hash_search(i8* %1, %struct.hash_table* %2, i32 0)
  store %struct.bucket_contents* %call, %struct.bucket_contents** %al, align 4
  %3 = load %struct.bucket_contents*, %struct.bucket_contents** %al, align 4
  %tobool = icmp ne %struct.bucket_contents* %3, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end
  %4 = load %struct.bucket_contents*, %struct.bucket_contents** %al, align 4
  %data = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %4, i32 0, i32 2
  %5 = load i8*, i8** %data, align 4
  %6 = bitcast i8* %5 to %struct.alias*
  br label %cond.end

cond.false:                                       ; preds = %if.end
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi %struct.alias* [ %6, %cond.true ], [ null, %cond.false ]
  store %struct.alias* %cond, %struct.alias** %retval, align 4
  br label %return

return:                                           ; preds = %cond.end, %if.then
  %7 = load %struct.alias*, %struct.alias** %retval, align 4
  ret %struct.alias* %7
}

declare %struct.bucket_contents* @hash_search(i8*, %struct.hash_table*, i32) #1

; Function Attrs: noinline nounwind
define i8* @get_alias_value(i8* %name) #0 {
entry:
  %retval = alloca i8*, align 4
  %name.addr = alloca i8*, align 4
  %alias = alloca %struct.alias*, align 4
  store i8* %name, i8** %name.addr, align 4
  %0 = load %struct.hash_table*, %struct.hash_table** @aliases, align 4
  %cmp = icmp eq %struct.hash_table* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i8* null, i8** %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %name.addr, align 4
  %call = call %struct.alias* @find_alias(i8* %1)
  store %struct.alias* %call, %struct.alias** %alias, align 4
  %2 = load %struct.alias*, %struct.alias** %alias, align 4
  %tobool = icmp ne %struct.alias* %2, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end
  %3 = load %struct.alias*, %struct.alias** %alias, align 4
  %value = getelementptr inbounds %struct.alias, %struct.alias* %3, i32 0, i32 1
  %4 = load i8*, i8** %value, align 4
  br label %cond.end

cond.false:                                       ; preds = %if.end
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %4, %cond.true ], [ null, %cond.false ]
  store i8* %cond, i8** %retval, align 4
  br label %return

return:                                           ; preds = %cond.end, %if.then
  %5 = load i8*, i8** %retval, align 4
  ret i8* %5
}

; Function Attrs: noinline nounwind
define void @add_alias(i8* %name, i8* %value) #0 {
entry:
  %name.addr = alloca i8*, align 4
  %value.addr = alloca i8*, align 4
  %elt = alloca %struct.bucket_contents*, align 4
  %temp = alloca %struct.alias*, align 4
  %n = alloca i32, align 4
  store i8* %name, i8** %name.addr, align 4
  store i8* %value, i8** %value.addr, align 4
  %0 = load %struct.hash_table*, %struct.hash_table** @aliases, align 4
  %cmp = icmp eq %struct.hash_table* %0, null
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  call void @initialize_aliases()
  store %struct.alias* null, %struct.alias** %temp, align 4
  br label %if.end

if.else:                                          ; preds = %entry
  %1 = load i8*, i8** %name.addr, align 4
  %call = call %struct.alias* @find_alias(i8* %1)
  store %struct.alias* %call, %struct.alias** %temp, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %2 = load %struct.alias*, %struct.alias** %temp, align 4
  %tobool = icmp ne %struct.alias* %2, null
  br i1 %tobool, label %if.then1, label %if.else19

if.then1:                                         ; preds = %if.end
  %3 = load %struct.alias*, %struct.alias** %temp, align 4
  %value2 = getelementptr inbounds %struct.alias, %struct.alias* %3, i32 0, i32 1
  %4 = load i8*, i8** %value2, align 4
  call void @sh_xfree(i8* %4, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 127)
  %5 = load i8*, i8** %value.addr, align 4
  %call3 = call i32 @strlen(i8* %5)
  %add = add i32 1, %call3
  %call4 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 128)
  %6 = load i8*, i8** %value.addr, align 4
  %call5 = call i8* @strcpy(i8* %call4, i8* %6)
  %7 = load %struct.alias*, %struct.alias** %temp, align 4
  %value6 = getelementptr inbounds %struct.alias, %struct.alias* %7, i32 0, i32 1
  store i8* %call5, i8** %value6, align 4
  %8 = load %struct.alias*, %struct.alias** %temp, align 4
  %flags = getelementptr inbounds %struct.alias, %struct.alias* %8, i32 0, i32 2
  %9 = load i8, i8* %flags, align 4
  %conv = sext i8 %9 to i32
  %and = and i32 %conv, -2
  %conv7 = trunc i32 %and to i8
  store i8 %conv7, i8* %flags, align 4
  %10 = load i8*, i8** %value.addr, align 4
  %11 = load i8*, i8** %value.addr, align 4
  %call8 = call i32 @strlen(i8* %11)
  %sub = sub i32 %call8, 1
  %arrayidx = getelementptr inbounds i8, i8* %10, i32 %sub
  %12 = load i8, i8* %arrayidx, align 1
  %conv9 = sext i8 %12 to i32
  store i32 %conv9, i32* %n, align 4
  %13 = load i32, i32* %n, align 4
  %cmp10 = icmp eq i32 %13, 32
  br i1 %cmp10, label %if.then14, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.then1
  %14 = load i32, i32* %n, align 4
  %cmp12 = icmp eq i32 %14, 9
  br i1 %cmp12, label %if.then14, label %if.end18

if.then14:                                        ; preds = %lor.lhs.false, %if.then1
  %15 = load %struct.alias*, %struct.alias** %temp, align 4
  %flags15 = getelementptr inbounds %struct.alias, %struct.alias* %15, i32 0, i32 2
  %16 = load i8, i8* %flags15, align 4
  %conv16 = sext i8 %16 to i32
  %or = or i32 %conv16, 1
  %conv17 = trunc i32 %or to i8
  store i8 %conv17, i8* %flags15, align 4
  br label %if.end18

if.end18:                                         ; preds = %if.then14, %lor.lhs.false
  br label %if.end52

if.else19:                                        ; preds = %if.end
  %call20 = call i8* @sh_xmalloc(i32 12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 136)
  %17 = bitcast i8* %call20 to %struct.alias*
  store %struct.alias* %17, %struct.alias** %temp, align 4
  %18 = load i8*, i8** %name.addr, align 4
  %call21 = call i32 @strlen(i8* %18)
  %add22 = add i32 1, %call21
  %call23 = call i8* @sh_xmalloc(i32 %add22, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 137)
  %19 = load i8*, i8** %name.addr, align 4
  %call24 = call i8* @strcpy(i8* %call23, i8* %19)
  %20 = load %struct.alias*, %struct.alias** %temp, align 4
  %name25 = getelementptr inbounds %struct.alias, %struct.alias* %20, i32 0, i32 0
  store i8* %call24, i8** %name25, align 4
  %21 = load i8*, i8** %value.addr, align 4
  %call26 = call i32 @strlen(i8* %21)
  %add27 = add i32 1, %call26
  %call28 = call i8* @sh_xmalloc(i32 %add27, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 138)
  %22 = load i8*, i8** %value.addr, align 4
  %call29 = call i8* @strcpy(i8* %call28, i8* %22)
  %23 = load %struct.alias*, %struct.alias** %temp, align 4
  %value30 = getelementptr inbounds %struct.alias, %struct.alias* %23, i32 0, i32 1
  store i8* %call29, i8** %value30, align 4
  %24 = load %struct.alias*, %struct.alias** %temp, align 4
  %flags31 = getelementptr inbounds %struct.alias, %struct.alias* %24, i32 0, i32 2
  store i8 0, i8* %flags31, align 4
  %25 = load i8*, i8** %value.addr, align 4
  %26 = load i8*, i8** %value.addr, align 4
  %call32 = call i32 @strlen(i8* %26)
  %sub33 = sub i32 %call32, 1
  %arrayidx34 = getelementptr inbounds i8, i8* %25, i32 %sub33
  %27 = load i8, i8* %arrayidx34, align 1
  %conv35 = sext i8 %27 to i32
  store i32 %conv35, i32* %n, align 4
  %28 = load i32, i32* %n, align 4
  %cmp36 = icmp eq i32 %28, 32
  br i1 %cmp36, label %if.then41, label %lor.lhs.false38

lor.lhs.false38:                                  ; preds = %if.else19
  %29 = load i32, i32* %n, align 4
  %cmp39 = icmp eq i32 %29, 9
  br i1 %cmp39, label %if.then41, label %if.end46

if.then41:                                        ; preds = %lor.lhs.false38, %if.else19
  %30 = load %struct.alias*, %struct.alias** %temp, align 4
  %flags42 = getelementptr inbounds %struct.alias, %struct.alias* %30, i32 0, i32 2
  %31 = load i8, i8* %flags42, align 4
  %conv43 = sext i8 %31 to i32
  %or44 = or i32 %conv43, 1
  %conv45 = trunc i32 %or44 to i8
  store i8 %conv45, i8* %flags42, align 4
  br label %if.end46

if.end46:                                         ; preds = %if.then41, %lor.lhs.false38
  %32 = load i8*, i8** %name.addr, align 4
  %call47 = call i32 @strlen(i8* %32)
  %add48 = add i32 1, %call47
  %call49 = call i8* @sh_xmalloc(i32 %add48, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 145)
  %33 = load i8*, i8** %name.addr, align 4
  %call50 = call i8* @strcpy(i8* %call49, i8* %33)
  %34 = load %struct.hash_table*, %struct.hash_table** @aliases, align 4
  %call51 = call %struct.bucket_contents* @hash_insert(i8* %call50, %struct.hash_table* %34, i32 1)
  store %struct.bucket_contents* %call51, %struct.bucket_contents** %elt, align 4
  %35 = load %struct.alias*, %struct.alias** %temp, align 4
  %36 = bitcast %struct.alias* %35 to i8*
  %37 = load %struct.bucket_contents*, %struct.bucket_contents** %elt, align 4
  %data = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %37, i32 0, i32 2
  store i8* %36, i8** %data, align 4
  call void @set_itemlist_dirty(%struct._list_of_items* @it_aliases)
  br label %if.end52

if.end52:                                         ; preds = %if.end46, %if.end18
  ret void
}

declare void @sh_xfree(i8*, i8*, i32) #1

declare i8* @strcpy(i8*, i8*) #1

declare i8* @sh_xmalloc(i32, i8*, i32) #1

declare i32 @strlen(i8*) #1

declare %struct.bucket_contents* @hash_insert(i8*, %struct.hash_table*, i32) #1

declare void @set_itemlist_dirty(%struct._list_of_items*) #1

; Function Attrs: noinline nounwind
define i32 @remove_alias(i8* %name) #0 {
entry:
  %retval = alloca i32, align 4
  %name.addr = alloca i8*, align 4
  %elt = alloca %struct.bucket_contents*, align 4
  store i8* %name, i8** %name.addr, align 4
  %0 = load %struct.hash_table*, %struct.hash_table** @aliases, align 4
  %cmp = icmp eq %struct.hash_table* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %name.addr, align 4
  %2 = load %struct.hash_table*, %struct.hash_table** @aliases, align 4
  %call = call %struct.bucket_contents* @hash_remove(i8* %1, %struct.hash_table* %2, i32 0)
  store %struct.bucket_contents* %call, %struct.bucket_contents** %elt, align 4
  %3 = load %struct.bucket_contents*, %struct.bucket_contents** %elt, align 4
  %tobool = icmp ne %struct.bucket_contents* %3, null
  br i1 %tobool, label %if.then1, label %if.end2

if.then1:                                         ; preds = %if.end
  %4 = load %struct.bucket_contents*, %struct.bucket_contents** %elt, align 4
  %data = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %4, i32 0, i32 2
  %5 = load i8*, i8** %data, align 4
  call void @free_alias_data(i8* %5)
  %6 = load %struct.bucket_contents*, %struct.bucket_contents** %elt, align 4
  %key = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %6, i32 0, i32 1
  %7 = load i8*, i8** %key, align 4
  call void @sh_xfree(i8* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 182)
  %8 = load %struct.bucket_contents*, %struct.bucket_contents** %elt, align 4
  %9 = bitcast %struct.bucket_contents* %8 to i8*
  call void @sh_xfree(i8* %9, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 183)
  call void @set_itemlist_dirty(%struct._list_of_items* @it_aliases)
  %10 = load %struct.hash_table*, %struct.hash_table** @aliases, align 4
  %nentries = getelementptr inbounds %struct.hash_table, %struct.hash_table* %10, i32 0, i32 2
  %11 = load i32, i32* %nentries, align 4
  store i32 %11, i32* %retval, align 4
  br label %return

if.end2:                                          ; preds = %if.end
  store i32 -1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end2, %if.then1, %if.then
  %12 = load i32, i32* %retval, align 4
  ret i32 %12
}

declare %struct.bucket_contents* @hash_remove(i8*, %struct.hash_table*, i32) #1

; Function Attrs: noinline nounwind
define internal void @free_alias_data(i8* %data) #0 {
entry:
  %data.addr = alloca i8*, align 4
  %a = alloca %struct.alias*, align 4
  store i8* %data, i8** %data.addr, align 4
  %0 = load i8*, i8** %data.addr, align 4
  %1 = bitcast i8* %0 to %struct.alias*
  store %struct.alias* %1, %struct.alias** %a, align 4
  %2 = load %struct.alias*, %struct.alias** %a, align 4
  %value = getelementptr inbounds %struct.alias, %struct.alias* %2, i32 0, i32 1
  %3 = load i8*, i8** %value, align 4
  call void @sh_xfree(i8* %3, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 161)
  %4 = load %struct.alias*, %struct.alias** %a, align 4
  %name = getelementptr inbounds %struct.alias, %struct.alias* %4, i32 0, i32 0
  %5 = load i8*, i8** %name, align 4
  call void @sh_xfree(i8* %5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 162)
  %6 = load i8*, i8** %data.addr, align 4
  call void @sh_xfree(i8* %6, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 163)
  ret void
}

; Function Attrs: noinline nounwind
define void @delete_all_aliases() #0 {
entry:
  %0 = load %struct.hash_table*, %struct.hash_table** @aliases, align 4
  %cmp = icmp eq %struct.hash_table* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %return

if.end:                                           ; preds = %entry
  %1 = load %struct.hash_table*, %struct.hash_table** @aliases, align 4
  call void @hash_flush(%struct.hash_table* %1, void (i8*)* @free_alias_data)
  %2 = load %struct.hash_table*, %struct.hash_table** @aliases, align 4
  call void @hash_dispose(%struct.hash_table* %2)
  store %struct.hash_table* null, %struct.hash_table** @aliases, align 4
  call void @set_itemlist_dirty(%struct._list_of_items* @it_aliases)
  br label %return

return:                                           ; preds = %if.end, %if.then
  ret void
}

declare void @hash_flush(%struct.hash_table*, void (i8*)*) #1

declare void @hash_dispose(%struct.hash_table*) #1

; Function Attrs: noinline nounwind
define %struct.alias** @all_aliases() #0 {
entry:
  %retval = alloca %struct.alias**, align 4
  %list = alloca %struct.alias**, align 4
  %0 = load %struct.hash_table*, %struct.hash_table** @aliases, align 4
  %cmp = icmp eq %struct.hash_table* %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load %struct.hash_table*, %struct.hash_table** @aliases, align 4
  %tobool = icmp ne %struct.hash_table* %1, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false
  %2 = load %struct.hash_table*, %struct.hash_table** @aliases, align 4
  %nentries = getelementptr inbounds %struct.hash_table, %struct.hash_table* %2, i32 0, i32 2
  %3 = load i32, i32* %nentries, align 4
  br label %cond.end

cond.false:                                       ; preds = %lor.lhs.false
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %3, %cond.true ], [ 0, %cond.false ]
  %cmp1 = icmp eq i32 %cond, 0
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %cond.end, %entry
  store %struct.alias** null, %struct.alias*** %retval, align 4
  br label %return

if.end:                                           ; preds = %cond.end
  %call = call %struct.alias** @map_over_aliases(i32 (%struct.alias*)* null)
  store %struct.alias** %call, %struct.alias*** %list, align 4
  %4 = load %struct.alias**, %struct.alias*** %list, align 4
  %tobool2 = icmp ne %struct.alias** %4, null
  br i1 %tobool2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  %5 = load %struct.alias**, %struct.alias*** %list, align 4
  call void @sort_aliases(%struct.alias** %5)
  br label %if.end4

if.end4:                                          ; preds = %if.then3, %if.end
  %6 = load %struct.alias**, %struct.alias*** %list, align 4
  store %struct.alias** %6, %struct.alias*** %retval, align 4
  br label %return

return:                                           ; preds = %if.end4, %if.then
  %7 = load %struct.alias**, %struct.alias*** %retval, align 4
  ret %struct.alias** %7
}

; Function Attrs: noinline nounwind
define internal %struct.alias** @map_over_aliases(i32 (%struct.alias*)* %function) #0 {
entry:
  %retval = alloca %struct.alias**, align 4
  %function.addr = alloca i32 (%struct.alias*)*, align 4
  %i = alloca i32, align 4
  %tlist = alloca %struct.bucket_contents*, align 4
  %alias = alloca %struct.alias*, align 4
  %list = alloca %struct.alias**, align 4
  %list_index = alloca i32, align 4
  store i32 (%struct.alias*)* %function, i32 (%struct.alias*)** %function.addr, align 4
  %0 = load %struct.hash_table*, %struct.hash_table** @aliases, align 4
  %tobool = icmp ne %struct.hash_table* %0, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %1 = load %struct.hash_table*, %struct.hash_table** @aliases, align 4
  %nentries = getelementptr inbounds %struct.hash_table, %struct.hash_table* %1, i32 0, i32 2
  %2 = load i32, i32* %nentries, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %2, %cond.true ], [ 0, %cond.false ]
  store i32 %cond, i32* %i, align 4
  %3 = load i32, i32* %i, align 4
  %cmp = icmp eq i32 %3, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %cond.end
  store %struct.alias** null, %struct.alias*** %retval, align 4
  br label %return

if.end:                                           ; preds = %cond.end
  %4 = load i32, i32* %i, align 4
  %add = add nsw i32 %4, 1
  %mul = mul i32 %add, 4
  %call = call i8* @sh_xmalloc(i32 %mul, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 222)
  %5 = bitcast i8* %call to %struct.alias**
  store %struct.alias** %5, %struct.alias*** %list, align 4
  store i32 0, i32* %list_index, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc19, %if.end
  %6 = load i32, i32* %i, align 4
  %7 = load %struct.hash_table*, %struct.hash_table** @aliases, align 4
  %nbuckets = getelementptr inbounds %struct.hash_table, %struct.hash_table* %7, i32 0, i32 1
  %8 = load i32, i32* %nbuckets, align 4
  %cmp1 = icmp slt i32 %6, %8
  br i1 %cmp1, label %for.body, label %for.end21

for.body:                                         ; preds = %for.cond
  %9 = load %struct.hash_table*, %struct.hash_table** @aliases, align 4
  %tobool2 = icmp ne %struct.hash_table* %9, null
  br i1 %tobool2, label %land.lhs.true, label %cond.false6

land.lhs.true:                                    ; preds = %for.body
  %10 = load i32, i32* %i, align 4
  %11 = load %struct.hash_table*, %struct.hash_table** @aliases, align 4
  %nbuckets3 = getelementptr inbounds %struct.hash_table, %struct.hash_table* %11, i32 0, i32 1
  %12 = load i32, i32* %nbuckets3, align 4
  %cmp4 = icmp slt i32 %10, %12
  br i1 %cmp4, label %cond.true5, label %cond.false6

cond.true5:                                       ; preds = %land.lhs.true
  %13 = load %struct.hash_table*, %struct.hash_table** @aliases, align 4
  %bucket_array = getelementptr inbounds %struct.hash_table, %struct.hash_table* %13, i32 0, i32 0
  %14 = load %struct.bucket_contents**, %struct.bucket_contents*** %bucket_array, align 4
  %15 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds %struct.bucket_contents*, %struct.bucket_contents** %14, i32 %15
  %16 = load %struct.bucket_contents*, %struct.bucket_contents** %arrayidx, align 4
  br label %cond.end7

cond.false6:                                      ; preds = %land.lhs.true, %for.body
  br label %cond.end7

cond.end7:                                        ; preds = %cond.false6, %cond.true5
  %cond8 = phi %struct.bucket_contents* [ %16, %cond.true5 ], [ null, %cond.false6 ]
  store %struct.bucket_contents* %cond8, %struct.bucket_contents** %tlist, align 4
  br label %for.cond9

for.cond9:                                        ; preds = %for.inc, %cond.end7
  %17 = load %struct.bucket_contents*, %struct.bucket_contents** %tlist, align 4
  %tobool10 = icmp ne %struct.bucket_contents* %17, null
  br i1 %tobool10, label %for.body11, label %for.end

for.body11:                                       ; preds = %for.cond9
  %18 = load %struct.bucket_contents*, %struct.bucket_contents** %tlist, align 4
  %data = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %18, i32 0, i32 2
  %19 = load i8*, i8** %data, align 4
  %20 = bitcast i8* %19 to %struct.alias*
  store %struct.alias* %20, %struct.alias** %alias, align 4
  %21 = load i32 (%struct.alias*)*, i32 (%struct.alias*)** %function.addr, align 4
  %tobool12 = icmp ne i32 (%struct.alias*)* %21, null
  br i1 %tobool12, label %lor.lhs.false, label %if.then15

lor.lhs.false:                                    ; preds = %for.body11
  %22 = load i32 (%struct.alias*)*, i32 (%struct.alias*)** %function.addr, align 4
  %23 = load %struct.alias*, %struct.alias** %alias, align 4
  %call13 = call i32 %22(%struct.alias* %23)
  %tobool14 = icmp ne i32 %call13, 0
  br i1 %tobool14, label %if.then15, label %if.end18

if.then15:                                        ; preds = %lor.lhs.false, %for.body11
  %24 = load %struct.alias*, %struct.alias** %alias, align 4
  %25 = load %struct.alias**, %struct.alias*** %list, align 4
  %26 = load i32, i32* %list_index, align 4
  %inc = add nsw i32 %26, 1
  store i32 %inc, i32* %list_index, align 4
  %arrayidx16 = getelementptr inbounds %struct.alias*, %struct.alias** %25, i32 %26
  store %struct.alias* %24, %struct.alias** %arrayidx16, align 4
  %27 = load %struct.alias**, %struct.alias*** %list, align 4
  %28 = load i32, i32* %list_index, align 4
  %arrayidx17 = getelementptr inbounds %struct.alias*, %struct.alias** %27, i32 %28
  store %struct.alias* null, %struct.alias** %arrayidx17, align 4
  br label %if.end18

if.end18:                                         ; preds = %if.then15, %lor.lhs.false
  br label %for.inc

for.inc:                                          ; preds = %if.end18
  %29 = load %struct.bucket_contents*, %struct.bucket_contents** %tlist, align 4
  %next = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %29, i32 0, i32 0
  %30 = load %struct.bucket_contents*, %struct.bucket_contents** %next, align 4
  store %struct.bucket_contents* %30, %struct.bucket_contents** %tlist, align 4
  br label %for.cond9

for.end:                                          ; preds = %for.cond9
  br label %for.inc19

for.inc19:                                        ; preds = %for.end
  %31 = load i32, i32* %i, align 4
  %inc20 = add nsw i32 %31, 1
  store i32 %inc20, i32* %i, align 4
  br label %for.cond

for.end21:                                        ; preds = %for.cond
  %32 = load %struct.alias**, %struct.alias*** %list, align 4
  store %struct.alias** %32, %struct.alias*** %retval, align 4
  br label %return

return:                                           ; preds = %for.end21, %if.then
  %33 = load %struct.alias**, %struct.alias*** %retval, align 4
  ret %struct.alias** %33
}

; Function Attrs: noinline nounwind
define internal void @sort_aliases(%struct.alias** %array) #0 {
entry:
  %array.addr = alloca %struct.alias**, align 4
  store %struct.alias** %array, %struct.alias*** %array.addr, align 4
  %0 = load %struct.alias**, %struct.alias*** %array.addr, align 4
  %1 = bitcast %struct.alias** %0 to i8*
  %2 = load %struct.alias**, %struct.alias*** %array.addr, align 4
  %3 = bitcast %struct.alias** %2 to i8**
  %call = call i32 @strvec_len(i8** %3)
  call void @qsort(i8* %1, i32 %call, i32 4, i32 (i8*, i8*)* bitcast (i32 (%struct.alias**, %struct.alias**)* @qsort_alias_compare to i32 (i8*, i8*)*))
  ret void
}

; Function Attrs: noinline nounwind
define i8* @alias_expand_word(i8* %s) #0 {
entry:
  %s.addr = alloca i8*, align 4
  %r = alloca %struct.alias*, align 4
  store i8* %s, i8** %s.addr, align 4
  %0 = load i8*, i8** %s.addr, align 4
  %call = call %struct.alias* @find_alias(i8* %0)
  store %struct.alias* %call, %struct.alias** %r, align 4
  %1 = load %struct.alias*, %struct.alias** %r, align 4
  %tobool = icmp ne %struct.alias* %1, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %2 = load %struct.alias*, %struct.alias** %r, align 4
  %value = getelementptr inbounds %struct.alias, %struct.alias* %2, i32 0, i32 1
  %3 = load i8*, i8** %value, align 4
  %call1 = call i32 @strlen(i8* %3)
  %add = add i32 1, %call1
  %call2 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 280)
  %4 = load %struct.alias*, %struct.alias** %r, align 4
  %value3 = getelementptr inbounds %struct.alias, %struct.alias* %4, i32 0, i32 1
  %5 = load i8*, i8** %value3, align 4
  %call4 = call i8* @strcpy(i8* %call2, i8* %5)
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %call4, %cond.true ], [ null, %cond.false ]
  ret i8* %cond
}

; Function Attrs: noinline nounwind
define i8* @alias_expand(i8* %string) #0 {
entry:
  %string.addr = alloca i8*, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %start = alloca i32, align 4
  %line = alloca i8*, align 4
  %token = alloca i8*, align 4
  %line_len = alloca i32, align 4
  %tl = alloca i32, align 4
  %real_start = alloca i32, align 4
  %expand_next = alloca i32, align 4
  %expand_this_token = alloca i32, align 4
  %alias = alloca %struct.alias*, align 4
  %v = alloca i8*, align 4
  %vlen = alloca i32, align 4
  %llen = alloca i32, align 4
  %llen109 = alloca i32, align 4
  %tlen = alloca i32, align 4
  store i8* %string, i8** %string.addr, align 4
  %0 = load i8*, i8** %string.addr, align 4
  %call = call i32 @strlen(i8* %0)
  %add = add i32 %call, 1
  store i32 %add, i32* %line_len, align 4
  %1 = load i32, i32* %line_len, align 4
  %call1 = call i8* @sh_xmalloc(i32 %1, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 478)
  store i8* %call1, i8** %line, align 4
  %2 = load i32, i32* %line_len, align 4
  %call2 = call i8* @sh_xmalloc(i32 %2, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 479)
  store i8* %call2, i8** %token, align 4
  store i32 0, i32* %i, align 4
  %3 = load i8*, i8** %line, align 4
  %arrayidx = getelementptr inbounds i8, i8* %3, i32 0
  store i8 0, i8* %arrayidx, align 1
  store i32 0, i32* %expand_next, align 4
  store i32 1, i32* @command_word, align 4
  br label %for.cond

for.cond:                                         ; preds = %if.end136, %entry
  %4 = load i8*, i8** %token, align 4
  %arrayidx3 = getelementptr inbounds i8, i8* %4, i32 0
  store i8 0, i8* %arrayidx3, align 1
  %5 = load i32, i32* %i, align 4
  store i32 %5, i32* %start, align 4
  %6 = load i8*, i8** %string.addr, align 4
  %7 = load i32, i32* %start, align 4
  %call4 = call i32 @skipws(i8* %6, i32 %7)
  store i32 %call4, i32* %i, align 4
  %8 = load i32, i32* %start, align 4
  %9 = load i32, i32* %i, align 4
  %cmp = icmp eq i32 %8, %9
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %for.cond
  %10 = load i8*, i8** %string.addr, align 4
  %11 = load i32, i32* %i, align 4
  %arrayidx5 = getelementptr inbounds i8, i8* %10, i32 %11
  %12 = load i8, i8* %arrayidx5, align 1
  %conv = sext i8 %12 to i32
  %cmp6 = icmp eq i32 %conv, 0
  br i1 %cmp6, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %13 = load i8*, i8** %token, align 4
  call void @sh_xfree(i8* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 501)
  %14 = load i8*, i8** %line, align 4
  ret i8* %14

if.end:                                           ; preds = %land.lhs.true, %for.cond
  %15 = load i8*, i8** %line, align 4
  %call8 = call i32 @strlen(i8* %15)
  store i32 %call8, i32* %j, align 4
  %16 = load i32, i32* %i, align 4
  %17 = load i32, i32* %start, align 4
  %sub = sub nsw i32 %16, %17
  store i32 %sub, i32* %tl, align 4
  br label %do.body

do.body:                                          ; preds = %if.end
  %18 = load i32, i32* %j, align 4
  %19 = load i32, i32* %tl, align 4
  %add9 = add nsw i32 %19, 1
  %add10 = add nsw i32 %18, %add9
  %20 = load i32, i32* %line_len, align 4
  %cmp11 = icmp sge i32 %add10, %20
  br i1 %cmp11, label %if.then13, label %if.end21

if.then13:                                        ; preds = %do.body
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.then13
  %21 = load i32, i32* %j, align 4
  %22 = load i32, i32* %tl, align 4
  %add14 = add nsw i32 %22, 1
  %add15 = add nsw i32 %21, %add14
  %23 = load i32, i32* %line_len, align 4
  %cmp16 = icmp sge i32 %add15, %23
  br i1 %cmp16, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %24 = load i32, i32* %tl, align 4
  %add18 = add nsw i32 %24, 50
  %25 = load i32, i32* %line_len, align 4
  %add19 = add nsw i32 %25, %add18
  store i32 %add19, i32* %line_len, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %26 = load i8*, i8** %line, align 4
  %27 = load i32, i32* %line_len, align 4
  %call20 = call i8* @sh_xrealloc(i8* %26, i32 %27, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 509)
  store i8* %call20, i8** %line, align 4
  br label %if.end21

if.end21:                                         ; preds = %while.end, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end21
  %28 = load i8*, i8** %line, align 4
  %29 = load i32, i32* %j, align 4
  %add.ptr = getelementptr inbounds i8, i8* %28, i32 %29
  %30 = load i8*, i8** %string.addr, align 4
  %31 = load i32, i32* %start, align 4
  %add.ptr22 = getelementptr inbounds i8, i8* %30, i32 %31
  %32 = load i32, i32* %tl, align 4
  %call23 = call i8* @strncpy(i8* %add.ptr, i8* %add.ptr22, i32 %32)
  %33 = load i8*, i8** %line, align 4
  %34 = load i32, i32* %j, align 4
  %35 = load i32, i32* %tl, align 4
  %add24 = add nsw i32 %34, %35
  %arrayidx25 = getelementptr inbounds i8, i8* %33, i32 %add24
  store i8 0, i8* %arrayidx25, align 1
  %36 = load i32, i32* %i, align 4
  store i32 %36, i32* %real_start, align 4
  %37 = load i32, i32* @command_word, align 4
  %tobool = icmp ne i32 %37, 0
  br i1 %tobool, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %do.end
  %38 = load i8*, i8** %string.addr, align 4
  %39 = load i32, i32* %i, align 4
  %arrayidx26 = getelementptr inbounds i8, i8* %38, i32 %39
  %40 = load i8, i8* %arrayidx26, align 1
  %conv27 = sext i8 %40 to i32
  %tobool28 = icmp ne i32 %conv27, 0
  br i1 %tobool28, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.rhs
  %41 = load i8*, i8** %string.addr, align 4
  %42 = load i32, i32* %i, align 4
  %arrayidx29 = getelementptr inbounds i8, i8* %41, i32 %42
  %43 = load i8, i8* %arrayidx29, align 1
  %conv30 = sext i8 %43 to i32
  %call31 = call i8* @mbschr(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i32 0, i32 0), i32 %conv30)
  %cmp32 = icmp ne i8* %call31, null
  %conv33 = zext i1 %cmp32 to i32
  br label %cond.end

cond.false:                                       ; preds = %lor.rhs
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv33, %cond.true ], [ 0, %cond.false ]
  %tobool34 = icmp ne i32 %cond, 0
  br label %lor.end

lor.end:                                          ; preds = %cond.end, %do.end
  %44 = phi i1 [ true, %do.end ], [ %tobool34, %cond.end ]
  %lor.ext = zext i1 %44 to i32
  store i32 %lor.ext, i32* @command_word, align 4
  %45 = load i32, i32* @command_word, align 4
  %tobool35 = icmp ne i32 %45, 0
  br i1 %tobool35, label %lor.end38, label %lor.rhs36

lor.rhs36:                                        ; preds = %lor.end
  %46 = load i32, i32* %expand_next, align 4
  %tobool37 = icmp ne i32 %46, 0
  br label %lor.end38

lor.end38:                                        ; preds = %lor.rhs36, %lor.end
  %47 = phi i1 [ true, %lor.end ], [ %tobool37, %lor.rhs36 ]
  %lor.ext39 = zext i1 %47 to i32
  store i32 %lor.ext39, i32* %expand_this_token, align 4
  store i32 0, i32* %expand_next, align 4
  %48 = load i32, i32* %i, align 4
  store i32 %48, i32* %start, align 4
  %49 = load i8*, i8** %string.addr, align 4
  %50 = load i32, i32* %start, align 4
  %call40 = call i32 @rd_token(i8* %49, i32 %50)
  store i32 %call40, i32* %i, align 4
  %51 = load i32, i32* %i, align 4
  %52 = load i32, i32* %start, align 4
  %sub41 = sub nsw i32 %51, %52
  store i32 %sub41, i32* %tl, align 4
  %53 = load i32, i32* %tl, align 4
  %cmp42 = icmp eq i32 %53, 0
  br i1 %cmp42, label %land.lhs.true44, label %if.end50

land.lhs.true44:                                  ; preds = %lor.end38
  %54 = load i8*, i8** %string.addr, align 4
  %55 = load i32, i32* %i, align 4
  %arrayidx45 = getelementptr inbounds i8, i8* %54, i32 %55
  %56 = load i8, i8* %arrayidx45, align 1
  %conv46 = sext i8 %56 to i32
  %cmp47 = icmp ne i32 %conv46, 0
  br i1 %cmp47, label %if.then49, label %if.end50

if.then49:                                        ; preds = %land.lhs.true44
  store i32 1, i32* %tl, align 4
  %57 = load i32, i32* %i, align 4
  %inc = add nsw i32 %57, 1
  store i32 %inc, i32* %i, align 4
  br label %if.end50

if.end50:                                         ; preds = %if.then49, %land.lhs.true44, %lor.end38
  %58 = load i8*, i8** %token, align 4
  %59 = load i8*, i8** %string.addr, align 4
  %60 = load i32, i32* %start, align 4
  %add.ptr51 = getelementptr inbounds i8, i8* %59, i32 %60
  %61 = load i32, i32* %tl, align 4
  %call52 = call i8* @strncpy(i8* %58, i8* %add.ptr51, i32 %61)
  %62 = load i8*, i8** %token, align 4
  %63 = load i32, i32* %tl, align 4
  %arrayidx53 = getelementptr inbounds i8, i8* %62, i32 %63
  store i8 0, i8* %arrayidx53, align 1
  %64 = load i8*, i8** %token, align 4
  %call54 = call i8* @mbschr(i8* %64, i32 92)
  %tobool55 = icmp ne i8* %call54, null
  br i1 %tobool55, label %if.then56, label %if.end57

if.then56:                                        ; preds = %if.end50
  store i32 0, i32* %expand_this_token, align 4
  br label %if.end57

if.end57:                                         ; preds = %if.then56, %if.end50
  %65 = load i8*, i8** %token, align 4
  %arrayidx58 = getelementptr inbounds i8, i8* %65, i32 0
  %66 = load i8, i8* %arrayidx58, align 1
  %conv59 = sext i8 %66 to i32
  %tobool60 = icmp ne i32 %conv59, 0
  br i1 %tobool60, label %land.lhs.true61, label %if.else

land.lhs.true61:                                  ; preds = %if.end57
  %67 = load i32, i32* %expand_this_token, align 4
  %tobool62 = icmp ne i32 %67, 0
  br i1 %tobool62, label %land.lhs.true64, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true61
  %68 = load i32, i32* @alias_expand_all, align 4
  %tobool63 = icmp ne i32 %68, 0
  br i1 %tobool63, label %land.lhs.true64, label %if.else

land.lhs.true64:                                  ; preds = %lor.lhs.false, %land.lhs.true61
  %69 = load i8*, i8** %token, align 4
  %call65 = call %struct.alias* @find_alias(i8* %69)
  store %struct.alias* %call65, %struct.alias** %alias, align 4
  %tobool66 = icmp ne %struct.alias* %call65, null
  br i1 %tobool66, label %if.then67, label %if.else

if.then67:                                        ; preds = %land.lhs.true64
  %70 = load %struct.alias*, %struct.alias** %alias, align 4
  %value = getelementptr inbounds %struct.alias, %struct.alias* %70, i32 0, i32 1
  %71 = load i8*, i8** %value, align 4
  store i8* %71, i8** %v, align 4
  %72 = load i8*, i8** %v, align 4
  %call68 = call i32 @strlen(i8* %72)
  store i32 %call68, i32* %vlen, align 4
  %73 = load i8*, i8** %line, align 4
  %call69 = call i32 @strlen(i8* %73)
  store i32 %call69, i32* %llen, align 4
  br label %do.body70

do.body70:                                        ; preds = %if.then67
  %74 = load i32, i32* %llen, align 4
  %75 = load i32, i32* %vlen, align 4
  %add71 = add nsw i32 %75, 3
  %add72 = add nsw i32 %74, %add71
  %76 = load i32, i32* %line_len, align 4
  %cmp73 = icmp sge i32 %add72, %76
  br i1 %cmp73, label %if.then75, label %if.end86

if.then75:                                        ; preds = %do.body70
  br label %while.cond76

while.cond76:                                     ; preds = %while.body81, %if.then75
  %77 = load i32, i32* %llen, align 4
  %78 = load i32, i32* %vlen, align 4
  %add77 = add nsw i32 %78, 3
  %add78 = add nsw i32 %77, %add77
  %79 = load i32, i32* %line_len, align 4
  %cmp79 = icmp sge i32 %add78, %79
  br i1 %cmp79, label %while.body81, label %while.end84

while.body81:                                     ; preds = %while.cond76
  %80 = load i32, i32* %vlen, align 4
  %add82 = add nsw i32 %80, 50
  %81 = load i32, i32* %line_len, align 4
  %add83 = add nsw i32 %81, %add82
  store i32 %add83, i32* %line_len, align 4
  br label %while.cond76

while.end84:                                      ; preds = %while.cond76
  %82 = load i8*, i8** %line, align 4
  %83 = load i32, i32* %line_len, align 4
  %call85 = call i8* @sh_xrealloc(i8* %82, i32 %83, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 560)
  store i8* %call85, i8** %line, align 4
  br label %if.end86

if.end86:                                         ; preds = %while.end84, %do.body70
  br label %do.end87

do.end87:                                         ; preds = %if.end86
  %84 = load i8*, i8** %line, align 4
  %85 = load i32, i32* %llen, align 4
  %add.ptr88 = getelementptr inbounds i8, i8* %84, i32 %85
  %86 = load i8*, i8** %v, align 4
  %call89 = call i8* @strcpy(i8* %add.ptr88, i8* %86)
  %87 = load i32, i32* %expand_this_token, align 4
  %tobool90 = icmp ne i32 %87, 0
  br i1 %tobool90, label %land.lhs.true91, label %lor.lhs.false105

land.lhs.true91:                                  ; preds = %do.end87
  %88 = load i32, i32* %vlen, align 4
  %tobool92 = icmp ne i32 %88, 0
  br i1 %tobool92, label %land.lhs.true93, label %lor.lhs.false105

land.lhs.true93:                                  ; preds = %land.lhs.true91
  %89 = load i8*, i8** %v, align 4
  %90 = load i32, i32* %vlen, align 4
  %sub94 = sub nsw i32 %90, 1
  %arrayidx95 = getelementptr inbounds i8, i8* %89, i32 %sub94
  %91 = load i8, i8* %arrayidx95, align 1
  %conv96 = sext i8 %91 to i32
  %cmp97 = icmp eq i32 %conv96, 32
  br i1 %cmp97, label %if.then107, label %lor.lhs.false99

lor.lhs.false99:                                  ; preds = %land.lhs.true93
  %92 = load i8*, i8** %v, align 4
  %93 = load i32, i32* %vlen, align 4
  %sub100 = sub nsw i32 %93, 1
  %arrayidx101 = getelementptr inbounds i8, i8* %92, i32 %sub100
  %94 = load i8, i8* %arrayidx101, align 1
  %conv102 = sext i8 %94 to i32
  %cmp103 = icmp eq i32 %conv102, 9
  br i1 %cmp103, label %if.then107, label %lor.lhs.false105

lor.lhs.false105:                                 ; preds = %lor.lhs.false99, %land.lhs.true91, %do.end87
  %95 = load i32, i32* @alias_expand_all, align 4
  %tobool106 = icmp ne i32 %95, 0
  br i1 %tobool106, label %if.then107, label %if.end108

if.then107:                                       ; preds = %lor.lhs.false105, %lor.lhs.false99, %land.lhs.true93
  store i32 1, i32* %expand_next, align 4
  br label %if.end108

if.end108:                                        ; preds = %if.then107, %lor.lhs.false105
  br label %if.end136

if.else:                                          ; preds = %land.lhs.true64, %lor.lhs.false, %if.end57
  %96 = load i8*, i8** %line, align 4
  %call110 = call i32 @strlen(i8* %96)
  store i32 %call110, i32* %llen109, align 4
  %97 = load i32, i32* %i, align 4
  %98 = load i32, i32* %real_start, align 4
  %sub111 = sub nsw i32 %97, %98
  store i32 %sub111, i32* %tlen, align 4
  br label %do.body112

do.body112:                                       ; preds = %if.else
  %99 = load i32, i32* %llen109, align 4
  %100 = load i32, i32* %tlen, align 4
  %add113 = add nsw i32 %100, 1
  %add114 = add nsw i32 %99, %add113
  %101 = load i32, i32* %line_len, align 4
  %cmp115 = icmp sge i32 %add114, %101
  br i1 %cmp115, label %if.then117, label %if.end129

if.then117:                                       ; preds = %do.body112
  br label %while.cond118

while.cond118:                                    ; preds = %while.body123, %if.then117
  %102 = load i32, i32* %llen109, align 4
  %103 = load i32, i32* %tlen, align 4
  %add119 = add nsw i32 %103, 1
  %add120 = add nsw i32 %102, %add119
  %104 = load i32, i32* %line_len, align 4
  %cmp121 = icmp sge i32 %add120, %104
  br i1 %cmp121, label %while.body123, label %while.end127

while.body123:                                    ; preds = %while.cond118
  %105 = load i32, i32* %llen109, align 4
  %106 = load i32, i32* %tlen, align 4
  %add124 = add nsw i32 %105, %106
  %add125 = add nsw i32 %add124, 50
  %107 = load i32, i32* %line_len, align 4
  %add126 = add nsw i32 %107, %add125
  store i32 %add126, i32* %line_len, align 4
  br label %while.cond118

while.end127:                                     ; preds = %while.cond118
  %108 = load i8*, i8** %line, align 4
  %109 = load i32, i32* %line_len, align 4
  %call128 = call i8* @sh_xrealloc(i8* %108, i32 %109, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 575)
  store i8* %call128, i8** %line, align 4
  br label %if.end129

if.end129:                                        ; preds = %while.end127, %do.body112
  br label %do.end130

do.end130:                                        ; preds = %if.end129
  %110 = load i8*, i8** %line, align 4
  %111 = load i32, i32* %llen109, align 4
  %add.ptr131 = getelementptr inbounds i8, i8* %110, i32 %111
  %112 = load i8*, i8** %string.addr, align 4
  %113 = load i32, i32* %real_start, align 4
  %add.ptr132 = getelementptr inbounds i8, i8* %112, i32 %113
  %114 = load i32, i32* %tlen, align 4
  %call133 = call i8* @strncpy(i8* %add.ptr131, i8* %add.ptr132, i32 %114)
  %115 = load i8*, i8** %line, align 4
  %116 = load i32, i32* %llen109, align 4
  %117 = load i32, i32* %tlen, align 4
  %add134 = add nsw i32 %116, %117
  %arrayidx135 = getelementptr inbounds i8, i8* %115, i32 %add134
  store i8 0, i8* %arrayidx135, align 1
  br label %if.end136

if.end136:                                        ; preds = %do.end130, %if.end108
  store i32 0, i32* @command_word, align 4
  br label %for.cond
}

; Function Attrs: noinline nounwind
define internal i32 @skipws(i8* %string, i32 %start) #0 {
entry:
  %string.addr = alloca i8*, align 4
  %start.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %pass_next = alloca i32, align 4
  %backslash_quoted_word = alloca i32, align 4
  %peekc = alloca i8, align 1
  store i8* %string, i8** %string.addr, align 4
  store i32 %start, i32* %start.addr, align 4
  store i32 0, i32* %pass_next, align 4
  store i32 0, i32* %backslash_quoted_word, align 4
  store i32 0, i32* %i, align 4
  %0 = load i32, i32* %start.addr, align 4
  store i32 %0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i8*, i8** %string.addr, align 4
  %2 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds i8, i8* %1, i32 %2
  %3 = load i8, i8* %arrayidx, align 1
  %tobool = icmp ne i8 %3, 0
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %pass_next, align 4
  %tobool1 = icmp ne i32 %4, 0
  br i1 %tobool1, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  store i32 0, i32* %pass_next, align 4
  br label %for.inc

if.end:                                           ; preds = %for.body
  %5 = load i8*, i8** %string.addr, align 4
  %6 = load i32, i32* %i, align 4
  %arrayidx2 = getelementptr inbounds i8, i8* %5, i32 %6
  %7 = load i8, i8* %arrayidx2, align 1
  %conv = sext i8 %7 to i32
  %cmp = icmp eq i32 %conv, 32
  br i1 %cmp, label %if.then8, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end
  %8 = load i8*, i8** %string.addr, align 4
  %9 = load i32, i32* %i, align 4
  %arrayidx4 = getelementptr inbounds i8, i8* %8, i32 %9
  %10 = load i8, i8* %arrayidx4, align 1
  %conv5 = sext i8 %10 to i32
  %cmp6 = icmp eq i32 %conv5, 9
  br i1 %cmp6, label %if.then8, label %if.end9

if.then8:                                         ; preds = %lor.lhs.false, %if.end
  store i32 0, i32* %backslash_quoted_word, align 4
  br label %for.inc

if.end9:                                          ; preds = %lor.lhs.false
  %11 = load i8*, i8** %string.addr, align 4
  %12 = load i32, i32* %i, align 4
  %arrayidx10 = getelementptr inbounds i8, i8* %11, i32 %12
  %13 = load i8, i8* %arrayidx10, align 1
  %conv11 = sext i8 %13 to i32
  %cmp12 = icmp eq i32 %conv11, 92
  br i1 %cmp12, label %if.then14, label %if.end26

if.then14:                                        ; preds = %if.end9
  %14 = load i8*, i8** %string.addr, align 4
  %15 = load i32, i32* %i, align 4
  %add = add nsw i32 %15, 1
  %arrayidx15 = getelementptr inbounds i8, i8* %14, i32 %add
  %16 = load i8, i8* %arrayidx15, align 1
  store i8 %16, i8* %peekc, align 1
  %17 = load i8, i8* %peekc, align 1
  %conv16 = zext i8 %17 to i32
  %cmp17 = icmp eq i32 %conv16, 0
  br i1 %cmp17, label %if.then19, label %if.end20

if.then19:                                        ; preds = %if.then14
  br label %for.end

if.end20:                                         ; preds = %if.then14
  %18 = load i8, i8* %peekc, align 1
  %conv21 = zext i8 %18 to i32
  %call = call i32 @isalpha(i32 %conv21) #3
  %tobool22 = icmp ne i32 %call, 0
  br i1 %tobool22, label %if.then23, label %if.else

if.then23:                                        ; preds = %if.end20
  %19 = load i32, i32* %backslash_quoted_word, align 4
  %inc = add nsw i32 %19, 1
  store i32 %inc, i32* %backslash_quoted_word, align 4
  br label %if.end25

if.else:                                          ; preds = %if.end20
  %20 = load i32, i32* %pass_next, align 4
  %inc24 = add nsw i32 %20, 1
  store i32 %inc24, i32* %pass_next, align 4
  br label %if.end25

if.end25:                                         ; preds = %if.else, %if.then23
  br label %for.inc

if.end26:                                         ; preds = %if.end9
  %21 = load i8*, i8** %string.addr, align 4
  %22 = load i32, i32* %i, align 4
  %arrayidx27 = getelementptr inbounds i8, i8* %21, i32 %22
  %23 = load i8, i8* %arrayidx27, align 1
  %conv28 = sext i8 %23 to i32
  %cmp29 = icmp eq i32 %conv28, 39
  br i1 %cmp29, label %if.then36, label %lor.lhs.false31

lor.lhs.false31:                                  ; preds = %if.end26
  %24 = load i8*, i8** %string.addr, align 4
  %25 = load i32, i32* %i, align 4
  %arrayidx32 = getelementptr inbounds i8, i8* %24, i32 %25
  %26 = load i8, i8* %arrayidx32, align 1
  %conv33 = sext i8 %26 to i32
  %cmp34 = icmp eq i32 %conv33, 34
  br i1 %cmp34, label %if.then36, label %if.end52

if.then36:                                        ; preds = %lor.lhs.false31, %if.end26
  %27 = load i8*, i8** %string.addr, align 4
  %28 = load i32, i32* %i, align 4
  %call37 = call i32 @skipquotes(i8* %27, i32 %28)
  store i32 %call37, i32* %i, align 4
  %29 = load i8*, i8** %string.addr, align 4
  %30 = load i32, i32* %i, align 4
  %arrayidx38 = getelementptr inbounds i8, i8* %29, i32 %30
  %31 = load i8, i8* %arrayidx38, align 1
  %conv39 = sext i8 %31 to i32
  %cmp40 = icmp eq i32 %conv39, 0
  br i1 %cmp40, label %if.then42, label %if.end43

if.then42:                                        ; preds = %if.then36
  br label %for.end

if.end43:                                         ; preds = %if.then36
  %32 = load i8*, i8** %string.addr, align 4
  %33 = load i32, i32* %i, align 4
  %add44 = add nsw i32 %33, 1
  %arrayidx45 = getelementptr inbounds i8, i8* %32, i32 %add44
  %34 = load i8, i8* %arrayidx45, align 1
  store i8 %34, i8* %peekc, align 1
  %35 = load i8, i8* %peekc, align 1
  %conv46 = zext i8 %35 to i32
  %call47 = call i32 @isalpha(i32 %conv46) #3
  %tobool48 = icmp ne i32 %call47, 0
  br i1 %tobool48, label %if.then49, label %if.end51

if.then49:                                        ; preds = %if.end43
  %36 = load i32, i32* %backslash_quoted_word, align 4
  %inc50 = add nsw i32 %36, 1
  store i32 %inc50, i32* %backslash_quoted_word, align 4
  br label %if.end51

if.end51:                                         ; preds = %if.then49, %if.end43
  br label %for.inc

if.end52:                                         ; preds = %lor.lhs.false31
  %37 = load i32, i32* %backslash_quoted_word, align 4
  %tobool53 = icmp ne i32 %37, 0
  br i1 %tobool53, label %if.then54, label %if.end55

if.then54:                                        ; preds = %if.end52
  br label %for.inc

if.end55:                                         ; preds = %if.end52
  %38 = load i8*, i8** %string.addr, align 4
  %39 = load i32, i32* %i, align 4
  %arrayidx56 = getelementptr inbounds i8, i8* %38, i32 %39
  %40 = load i8, i8* %arrayidx56, align 1
  %conv57 = sext i8 %40 to i32
  %tobool58 = icmp ne i32 %conv57, 0
  br i1 %tobool58, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end55
  %41 = load i8*, i8** %string.addr, align 4
  %42 = load i32, i32* %i, align 4
  %arrayidx59 = getelementptr inbounds i8, i8* %41, i32 %42
  %43 = load i8, i8* %arrayidx59, align 1
  %conv60 = sext i8 %43 to i32
  %call61 = call i8* @mbschr(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i32 0, i32 0), i32 %conv60)
  %cmp62 = icmp ne i8* %call61, null
  br i1 %cmp62, label %if.then64, label %if.end66

cond.false:                                       ; preds = %if.end55
  br i1 false, label %if.then64, label %if.end66

if.then64:                                        ; preds = %cond.false, %cond.true
  %44 = load i32, i32* @command_word, align 4
  %inc65 = add nsw i32 %44, 1
  store i32 %inc65, i32* @command_word, align 4
  br label %for.inc

if.end66:                                         ; preds = %cond.false, %cond.true
  br label %for.end

for.inc:                                          ; preds = %if.then64, %if.then54, %if.end51, %if.end25, %if.then8, %if.then
  %45 = load i32, i32* %i, align 4
  %inc67 = add nsw i32 %45, 1
  store i32 %inc67, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %if.end66, %if.then42, %if.then19, %for.cond
  %46 = load i32, i32* %i, align 4
  ret i32 %46
}

declare i8* @sh_xrealloc(i8*, i32, i8*, i32) #1

declare i8* @strncpy(i8*, i8*, i32) #1

declare i8* @mbschr(i8*, i32) #1

; Function Attrs: noinline nounwind
define internal i32 @rd_token(i8* %string, i32 %start) #0 {
entry:
  %string.addr = alloca i8*, align 4
  %start.addr = alloca i32, align 4
  %i = alloca i32, align 4
  store i8* %string, i8** %string.addr, align 4
  store i32 %start, i32* %start.addr, align 4
  %0 = load i32, i32* %start.addr, align 4
  store i32 %0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i8*, i8** %string.addr, align 4
  %2 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds i8, i8* %1, i32 %2
  %3 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %3 to i32
  %tobool = icmp ne i32 %conv, 0
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.cond
  %4 = load i8*, i8** %string.addr, align 4
  %5 = load i32, i32* %i, align 4
  %arrayidx1 = getelementptr inbounds i8, i8* %4, i32 %5
  %6 = load i8, i8* %arrayidx1, align 1
  %conv2 = sext i8 %6 to i32
  %cmp = icmp eq i32 %conv2, 32
  br i1 %cmp, label %lor.end, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.rhs
  %7 = load i8*, i8** %string.addr, align 4
  %8 = load i32, i32* %i, align 4
  %arrayidx4 = getelementptr inbounds i8, i8* %7, i32 %8
  %9 = load i8, i8* %arrayidx4, align 1
  %conv5 = sext i8 %9 to i32
  %cmp6 = icmp eq i32 %conv5, 9
  br i1 %cmp6, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %lor.lhs.false
  %10 = load i8*, i8** %string.addr, align 4
  %11 = load i32, i32* %i, align 4
  %arrayidx8 = getelementptr inbounds i8, i8* %10, i32 %11
  %12 = load i8, i8* %arrayidx8, align 1
  %conv9 = sext i8 %12 to i32
  %tobool10 = icmp ne i32 %conv9, 0
  br i1 %tobool10, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.rhs
  %13 = load i8*, i8** %string.addr, align 4
  %14 = load i32, i32* %i, align 4
  %arrayidx11 = getelementptr inbounds i8, i8* %13, i32 %14
  %15 = load i8, i8* %arrayidx11, align 1
  %conv12 = sext i8 %15 to i32
  %call = call i8* @mbschr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.2, i32 0, i32 0), i32 %conv12)
  %cmp13 = icmp ne i8* %call, null
  %conv14 = zext i1 %cmp13 to i32
  br label %cond.end

cond.false:                                       ; preds = %lor.rhs
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv14, %cond.true ], [ 0, %cond.false ]
  %tobool15 = icmp ne i32 %cond, 0
  br label %lor.end

lor.end:                                          ; preds = %cond.end, %lor.lhs.false, %land.rhs
  %16 = phi i1 [ true, %lor.lhs.false ], [ true, %land.rhs ], [ %tobool15, %cond.end ]
  %lnot = xor i1 %16, true
  br label %land.end

land.end:                                         ; preds = %lor.end, %for.cond
  %17 = phi i1 [ false, %for.cond ], [ %lnot, %lor.end ]
  br i1 %17, label %for.body, label %for.end

for.body:                                         ; preds = %land.end
  %18 = load i8*, i8** %string.addr, align 4
  %19 = load i32, i32* %i, align 4
  %arrayidx16 = getelementptr inbounds i8, i8* %18, i32 %19
  %20 = load i8, i8* %arrayidx16, align 1
  %conv17 = sext i8 %20 to i32
  %cmp18 = icmp eq i32 %conv17, 92
  br i1 %cmp18, label %if.then, label %if.end25

if.then:                                          ; preds = %for.body
  %21 = load i32, i32* %i, align 4
  %inc = add nsw i32 %21, 1
  store i32 %inc, i32* %i, align 4
  %22 = load i8*, i8** %string.addr, align 4
  %23 = load i32, i32* %i, align 4
  %arrayidx20 = getelementptr inbounds i8, i8* %22, i32 %23
  %24 = load i8, i8* %arrayidx20, align 1
  %conv21 = sext i8 %24 to i32
  %cmp22 = icmp eq i32 %conv21, 0
  br i1 %cmp22, label %if.then24, label %if.end

if.then24:                                        ; preds = %if.then
  br label %for.end

if.end:                                           ; preds = %if.then
  br label %for.inc

if.end25:                                         ; preds = %for.body
  %25 = load i8*, i8** %string.addr, align 4
  %26 = load i32, i32* %i, align 4
  %arrayidx26 = getelementptr inbounds i8, i8* %25, i32 %26
  %27 = load i8, i8* %arrayidx26, align 1
  %conv27 = sext i8 %27 to i32
  %cmp28 = icmp eq i32 %conv27, 39
  br i1 %cmp28, label %if.then35, label %lor.lhs.false30

lor.lhs.false30:                                  ; preds = %if.end25
  %28 = load i8*, i8** %string.addr, align 4
  %29 = load i32, i32* %i, align 4
  %arrayidx31 = getelementptr inbounds i8, i8* %28, i32 %29
  %30 = load i8, i8* %arrayidx31, align 1
  %conv32 = sext i8 %30 to i32
  %cmp33 = icmp eq i32 %conv32, 34
  br i1 %cmp33, label %if.then35, label %if.end43

if.then35:                                        ; preds = %lor.lhs.false30, %if.end25
  %31 = load i8*, i8** %string.addr, align 4
  %32 = load i32, i32* %i, align 4
  %call36 = call i32 @skipquotes(i8* %31, i32 %32)
  store i32 %call36, i32* %i, align 4
  %33 = load i8*, i8** %string.addr, align 4
  %34 = load i32, i32* %i, align 4
  %arrayidx37 = getelementptr inbounds i8, i8* %33, i32 %34
  %35 = load i8, i8* %arrayidx37, align 1
  %conv38 = sext i8 %35 to i32
  %cmp39 = icmp eq i32 %conv38, 0
  br i1 %cmp39, label %if.then41, label %if.end42

if.then41:                                        ; preds = %if.then35
  br label %for.end

if.end42:                                         ; preds = %if.then35
  br label %for.inc

if.end43:                                         ; preds = %lor.lhs.false30
  br label %for.inc

for.inc:                                          ; preds = %if.end43, %if.end42, %if.end
  %36 = load i32, i32* %i, align 4
  %inc44 = add nsw i32 %36, 1
  store i32 %inc44, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then41, %if.then24, %land.end
  %37 = load i32, i32* %i, align 4
  ret i32 %37
}

declare void @qsort(i8*, i32, i32, i32 (i8*, i8*)*) #1

declare i32 @strvec_len(i8**) #1

; Function Attrs: noinline nounwind
define internal i32 @qsort_alias_compare(%struct.alias** %as1, %struct.alias** %as2) #0 {
entry:
  %as1.addr = alloca %struct.alias**, align 4
  %as2.addr = alloca %struct.alias**, align 4
  %result = alloca i32, align 4
  store %struct.alias** %as1, %struct.alias*** %as1.addr, align 4
  store %struct.alias** %as2, %struct.alias*** %as2.addr, align 4
  %0 = load %struct.alias**, %struct.alias*** %as1.addr, align 4
  %1 = load %struct.alias*, %struct.alias** %0, align 4
  %name = getelementptr inbounds %struct.alias, %struct.alias* %1, i32 0, i32 0
  %2 = load i8*, i8** %name, align 4
  %arrayidx = getelementptr inbounds i8, i8* %2, i32 0
  %3 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %3 to i32
  %4 = load %struct.alias**, %struct.alias*** %as2.addr, align 4
  %5 = load %struct.alias*, %struct.alias** %4, align 4
  %name1 = getelementptr inbounds %struct.alias, %struct.alias* %5, i32 0, i32 0
  %6 = load i8*, i8** %name1, align 4
  %arrayidx2 = getelementptr inbounds i8, i8* %6, i32 0
  %7 = load i8, i8* %arrayidx2, align 1
  %conv3 = sext i8 %7 to i32
  %sub = sub nsw i32 %conv, %conv3
  store i32 %sub, i32* %result, align 4
  %cmp = icmp eq i32 %sub, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %8 = load %struct.alias**, %struct.alias*** %as1.addr, align 4
  %9 = load %struct.alias*, %struct.alias** %8, align 4
  %name5 = getelementptr inbounds %struct.alias, %struct.alias* %9, i32 0, i32 0
  %10 = load i8*, i8** %name5, align 4
  %11 = load %struct.alias**, %struct.alias*** %as2.addr, align 4
  %12 = load %struct.alias*, %struct.alias** %11, align 4
  %name6 = getelementptr inbounds %struct.alias, %struct.alias* %12, i32 0, i32 0
  %13 = load i8*, i8** %name6, align 4
  %call = call i32 @strcmp(i8* %10, i8* %13)
  store i32 %call, i32* %result, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %14 = load i32, i32* %result, align 4
  ret i32 %14
}

declare i32 @strcmp(i8*, i8*) #1

; Function Attrs: nounwind readonly
declare i32 @isalpha(i32) #2

; Function Attrs: noinline nounwind
define internal i32 @skipquotes(i8* %string, i32 %start) #0 {
entry:
  %retval = alloca i32, align 4
  %string.addr = alloca i8*, align 4
  %start.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %delimiter = alloca i32, align 4
  store i8* %string, i8** %string.addr, align 4
  store i32 %start, i32* %start.addr, align 4
  %0 = load i8*, i8** %string.addr, align 4
  %1 = load i32, i32* %start.addr, align 4
  %arrayidx = getelementptr inbounds i8, i8* %0, i32 %1
  %2 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %2 to i32
  store i32 %conv, i32* %delimiter, align 4
  %3 = load i32, i32* %start.addr, align 4
  %add = add nsw i32 %3, 1
  store i32 %add, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i8*, i8** %string.addr, align 4
  %5 = load i32, i32* %i, align 4
  %arrayidx1 = getelementptr inbounds i8, i8* %4, i32 %5
  %6 = load i8, i8* %arrayidx1, align 1
  %tobool = icmp ne i8 %6, 0
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %7 = load i8*, i8** %string.addr, align 4
  %8 = load i32, i32* %i, align 4
  %arrayidx2 = getelementptr inbounds i8, i8* %7, i32 %8
  %9 = load i8, i8* %arrayidx2, align 1
  %conv3 = sext i8 %9 to i32
  %cmp = icmp eq i32 %conv3, 92
  br i1 %cmp, label %if.then, label %if.end10

if.then:                                          ; preds = %for.body
  %10 = load i32, i32* %i, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %i, align 4
  %11 = load i8*, i8** %string.addr, align 4
  %12 = load i32, i32* %i, align 4
  %arrayidx5 = getelementptr inbounds i8, i8* %11, i32 %12
  %13 = load i8, i8* %arrayidx5, align 1
  %conv6 = sext i8 %13 to i32
  %cmp7 = icmp eq i32 %conv6, 0
  br i1 %cmp7, label %if.then9, label %if.end

if.then9:                                         ; preds = %if.then
  br label %for.end

if.end:                                           ; preds = %if.then
  br label %for.inc

if.end10:                                         ; preds = %for.body
  %14 = load i8*, i8** %string.addr, align 4
  %15 = load i32, i32* %i, align 4
  %arrayidx11 = getelementptr inbounds i8, i8* %14, i32 %15
  %16 = load i8, i8* %arrayidx11, align 1
  %conv12 = sext i8 %16 to i32
  %17 = load i32, i32* %delimiter, align 4
  %cmp13 = icmp eq i32 %conv12, %17
  br i1 %cmp13, label %if.then15, label %if.end16

if.then15:                                        ; preds = %if.end10
  %18 = load i32, i32* %i, align 4
  store i32 %18, i32* %retval, align 4
  br label %return

if.end16:                                         ; preds = %if.end10
  br label %for.inc

for.inc:                                          ; preds = %if.end16, %if.end
  %19 = load i32, i32* %i, align 4
  %inc17 = add nsw i32 %19, 1
  store i32 %inc17, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then9, %for.cond
  %20 = load i32, i32* %i, align 4
  store i32 %20, i32* %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then15
  %21 = load i32, i32* %retval, align 4
  ret i32 %21
}

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
