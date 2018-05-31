; ModuleID = 'arrayfunc.c'
source_filename = "arrayfunc.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.variable = type { i8*, i8*, i8*, {}*, %struct.variable* (%struct.variable*, i8*, i64, i8*)*, i32, i32 }
%struct.array = type { i32, i64, i32, %struct.array_element* }
%struct.array_element = type { i64, i8*, %struct.array_element*, %struct.array_element* }
%struct.hash_table = type { %struct.bucket_contents**, i32, i32 }
%struct.bucket_contents = type { %struct.bucket_contents*, i8*, i8*, i32, i32 }
%struct.word_list = type { %struct.word_list*, %struct.word_desc* }
%struct.word_desc = type { i8*, i32 }
%struct.__mbstate_t = type { i32, i32 }

@.str = private unnamed_addr constant [20 x i8] c"bad array subscript\00", align 1
@bash_badsub_errmsg = constant i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str, i32 0, i32 0), align 4
@.str.1 = private unnamed_addr constant [12 x i8] c"arrayfunc.c\00", align 1
@array_needs_making = external global i32, align 4
@.str.2 = private unnamed_addr constant [2 x i8] c"0\00", align 1
@nameref_invalid_value = external global %struct.variable, align 4
@.str.3 = private unnamed_addr constant [31 x i8] c"%s: removing nameref attribute\00", align 1
@last_command_exit_value = external global i32, align 4
@.str.4 = private unnamed_addr constant [48 x i8] c"%s: cannot convert indexed to associative array\00", align 1
@.str.5 = private unnamed_addr constant [13 x i8] c"array assign\00", align 1
@.str.6 = private unnamed_addr constant [34 x i8] c"%s: invalid associative array key\00", align 1
@.str.7 = private unnamed_addr constant [39 x i8] c"%s: cannot assign to non-numeric index\00", align 1
@.str.8 = private unnamed_addr constant [60 x i8] c"%s: %s: must use subscript when assigning associative array\00", align 1
@this_command_name = external global i8*, align 4
@.str.9 = private unnamed_addr constant [10 x i8] c"%s[%s: %s\00", align 1
@.str.10 = private unnamed_addr constant [9 x i8] c"[%s]: %s\00", align 1
@.str.11 = private unnamed_addr constant [7 x i8] c"%s=%s\0A\00", align 1
@.str.12 = private unnamed_addr constant [5 x i8] c"'()'\00", align 1
@.str.13 = private unnamed_addr constant [3 x i8] c"()\00", align 1
@no_longjmp_on_fatal_error = external global i32, align 4
@ifs_cmap = external global [0 x i8], align 1
@locale_mb_cur_max = external global i32, align 4
@is_basic_table = external constant [0 x i32], align 4

; Function Attrs: noinline nounwind
define %struct.variable* @convert_var_to_array(%struct.variable* %var) #0 {
entry:
  %var.addr = alloca %struct.variable*, align 4
  %oldval = alloca i8*, align 4
  %array = alloca %struct.array*, align 4
  store %struct.variable* %var, %struct.variable** %var.addr, align 4
  %0 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %value = getelementptr inbounds %struct.variable, %struct.variable* %0, i32 0, i32 1
  %1 = load i8*, i8** %value, align 4
  store i8* %1, i8** %oldval, align 4
  %call = call %struct.array* @array_create()
  store %struct.array* %call, %struct.array** %array, align 4
  %2 = load i8*, i8** %oldval, align 4
  %tobool = icmp ne i8* %2, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %3 = load %struct.array*, %struct.array** %array, align 4
  %4 = load i8*, i8** %oldval, align 4
  %call1 = call i32 @array_insert(%struct.array* %3, i64 0, i8* %4)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  br label %do.body

do.body:                                          ; preds = %if.end
  %5 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %value2 = getelementptr inbounds %struct.variable, %struct.variable* %5, i32 0, i32 1
  %6 = load i8*, i8** %value2, align 4
  %tobool3 = icmp ne i8* %6, null
  br i1 %tobool3, label %if.then4, label %if.end6

if.then4:                                         ; preds = %do.body
  %7 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %value5 = getelementptr inbounds %struct.variable, %struct.variable* %7, i32 0, i32 1
  %8 = load i8*, i8** %value5, align 4
  call void @sh_xfree(i8* %8, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 76)
  br label %if.end6

if.end6:                                          ; preds = %if.then4, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end6
  %9 = load %struct.array*, %struct.array** %array, align 4
  %10 = bitcast %struct.array* %9 to i8*
  %11 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %value7 = getelementptr inbounds %struct.variable, %struct.variable* %11, i32 0, i32 1
  store i8* %10, i8** %value7, align 4
  %12 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %dynamic_value = getelementptr inbounds %struct.variable, %struct.variable* %12, i32 0, i32 3
  %dynamic_value8 = bitcast {}** %dynamic_value to %struct.variable* (%struct.variable*)**
  store %struct.variable* (%struct.variable*)* null, %struct.variable* (%struct.variable*)** %dynamic_value8, align 4
  %13 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %assign_func = getelementptr inbounds %struct.variable, %struct.variable* %13, i32 0, i32 4
  store %struct.variable* (%struct.variable*, i8*, i64, i8*)* null, %struct.variable* (%struct.variable*, i8*, i64, i8*)** %assign_func, align 4
  br label %do.body9

do.body9:                                         ; preds = %do.end
  %14 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %exportstr = getelementptr inbounds %struct.variable, %struct.variable* %14, i32 0, i32 2
  %15 = load i8*, i8** %exportstr, align 4
  %tobool10 = icmp ne i8* %15, null
  br i1 %tobool10, label %if.then11, label %if.end14

if.then11:                                        ; preds = %do.body9
  %16 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %exportstr12 = getelementptr inbounds %struct.variable, %struct.variable* %16, i32 0, i32 2
  %17 = load i8*, i8** %exportstr12, align 4
  call void @sh_xfree(i8* %17, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 83)
  %18 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %exportstr13 = getelementptr inbounds %struct.variable, %struct.variable* %18, i32 0, i32 2
  store i8* null, i8** %exportstr13, align 4
  br label %if.end14

if.end14:                                         ; preds = %if.then11, %do.body9
  br label %do.end15

do.end15:                                         ; preds = %if.end14
  %19 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %19, i32 0, i32 5
  %20 = load i32, i32* %attributes, align 4
  %and = and i32 %20, 1
  %tobool16 = icmp ne i32 %and, 0
  br i1 %tobool16, label %if.then17, label %if.end18

if.then17:                                        ; preds = %do.end15
  %21 = load i32, i32* @array_needs_making, align 4
  %inc = add nsw i32 %21, 1
  store i32 %inc, i32* @array_needs_making, align 4
  br label %if.end18

if.end18:                                         ; preds = %if.then17, %do.end15
  %22 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %attributes19 = getelementptr inbounds %struct.variable, %struct.variable* %22, i32 0, i32 5
  %23 = load i32, i32* %attributes19, align 4
  %or = or i32 %23, 4
  store i32 %or, i32* %attributes19, align 4
  %24 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %attributes20 = getelementptr inbounds %struct.variable, %struct.variable* %24, i32 0, i32 5
  %25 = load i32, i32* %attributes20, align 4
  %and21 = and i32 %25, -4097
  store i32 %and21, i32* %attributes20, align 4
  %26 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %attributes22 = getelementptr inbounds %struct.variable, %struct.variable* %26, i32 0, i32 5
  %27 = load i32, i32* %attributes22, align 4
  %and23 = and i32 %27, -65
  store i32 %and23, i32* %attributes22, align 4
  %28 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %attributes24 = getelementptr inbounds %struct.variable, %struct.variable* %28, i32 0, i32 5
  %29 = load i32, i32* %attributes24, align 4
  %and25 = and i32 %29, -2049
  store i32 %and25, i32* %attributes24, align 4
  %30 = load %struct.variable*, %struct.variable** %var.addr, align 4
  ret %struct.variable* %30
}

declare %struct.array* @array_create() #1

declare i32 @array_insert(%struct.array*, i64, i8*) #1

declare void @sh_xfree(i8*, i8*, i32) #1

; Function Attrs: noinline nounwind
define %struct.variable* @convert_var_to_assoc(%struct.variable* %var) #0 {
entry:
  %var.addr = alloca %struct.variable*, align 4
  %oldval = alloca i8*, align 4
  %hash = alloca %struct.hash_table*, align 4
  store %struct.variable* %var, %struct.variable** %var.addr, align 4
  %0 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %value = getelementptr inbounds %struct.variable, %struct.variable* %0, i32 0, i32 1
  %1 = load i8*, i8** %value, align 4
  store i8* %1, i8** %oldval, align 4
  %call = call %struct.hash_table* @hash_create(i32 0)
  store %struct.hash_table* %call, %struct.hash_table** %hash, align 4
  %2 = load i8*, i8** %oldval, align 4
  %tobool = icmp ne i8* %2, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %3 = load %struct.hash_table*, %struct.hash_table** %hash, align 4
  %call1 = call i8* @sh_xmalloc(i32 2, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 111)
  %call2 = call i8* @strcpy(i8* %call1, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i32 0, i32 0))
  %4 = load i8*, i8** %oldval, align 4
  %call3 = call i32 @assoc_insert(%struct.hash_table* %3, i8* %call2, i8* %4)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  br label %do.body

do.body:                                          ; preds = %if.end
  %5 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %value4 = getelementptr inbounds %struct.variable, %struct.variable* %5, i32 0, i32 1
  %6 = load i8*, i8** %value4, align 4
  %tobool5 = icmp ne i8* %6, null
  br i1 %tobool5, label %if.then6, label %if.end8

if.then6:                                         ; preds = %do.body
  %7 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %value7 = getelementptr inbounds %struct.variable, %struct.variable* %7, i32 0, i32 1
  %8 = load i8*, i8** %value7, align 4
  call void @sh_xfree(i8* %8, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 113)
  br label %if.end8

if.end8:                                          ; preds = %if.then6, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end8
  %9 = load %struct.hash_table*, %struct.hash_table** %hash, align 4
  %10 = bitcast %struct.hash_table* %9 to i8*
  %11 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %value9 = getelementptr inbounds %struct.variable, %struct.variable* %11, i32 0, i32 1
  store i8* %10, i8** %value9, align 4
  %12 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %dynamic_value = getelementptr inbounds %struct.variable, %struct.variable* %12, i32 0, i32 3
  %dynamic_value10 = bitcast {}** %dynamic_value to %struct.variable* (%struct.variable*)**
  store %struct.variable* (%struct.variable*)* null, %struct.variable* (%struct.variable*)** %dynamic_value10, align 4
  %13 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %assign_func = getelementptr inbounds %struct.variable, %struct.variable* %13, i32 0, i32 4
  store %struct.variable* (%struct.variable*, i8*, i64, i8*)* null, %struct.variable* (%struct.variable*, i8*, i64, i8*)** %assign_func, align 4
  br label %do.body11

do.body11:                                        ; preds = %do.end
  %14 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %exportstr = getelementptr inbounds %struct.variable, %struct.variable* %14, i32 0, i32 2
  %15 = load i8*, i8** %exportstr, align 4
  %tobool12 = icmp ne i8* %15, null
  br i1 %tobool12, label %if.then13, label %if.end16

if.then13:                                        ; preds = %do.body11
  %16 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %exportstr14 = getelementptr inbounds %struct.variable, %struct.variable* %16, i32 0, i32 2
  %17 = load i8*, i8** %exportstr14, align 4
  call void @sh_xfree(i8* %17, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 120)
  %18 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %exportstr15 = getelementptr inbounds %struct.variable, %struct.variable* %18, i32 0, i32 2
  store i8* null, i8** %exportstr15, align 4
  br label %if.end16

if.end16:                                         ; preds = %if.then13, %do.body11
  br label %do.end17

do.end17:                                         ; preds = %if.end16
  %19 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %19, i32 0, i32 5
  %20 = load i32, i32* %attributes, align 4
  %and = and i32 %20, 1
  %tobool18 = icmp ne i32 %and, 0
  br i1 %tobool18, label %if.then19, label %if.end20

if.then19:                                        ; preds = %do.end17
  %21 = load i32, i32* @array_needs_making, align 4
  %inc = add nsw i32 %21, 1
  store i32 %inc, i32* @array_needs_making, align 4
  br label %if.end20

if.end20:                                         ; preds = %if.then19, %do.end17
  %22 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %attributes21 = getelementptr inbounds %struct.variable, %struct.variable* %22, i32 0, i32 5
  %23 = load i32, i32* %attributes21, align 4
  %or = or i32 %23, 64
  store i32 %or, i32* %attributes21, align 4
  %24 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %attributes22 = getelementptr inbounds %struct.variable, %struct.variable* %24, i32 0, i32 5
  %25 = load i32, i32* %attributes22, align 4
  %and23 = and i32 %25, -4097
  store i32 %and23, i32* %attributes22, align 4
  %26 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %attributes24 = getelementptr inbounds %struct.variable, %struct.variable* %26, i32 0, i32 5
  %27 = load i32, i32* %attributes24, align 4
  %and25 = and i32 %27, -5
  store i32 %and25, i32* %attributes24, align 4
  %28 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %attributes26 = getelementptr inbounds %struct.variable, %struct.variable* %28, i32 0, i32 5
  %29 = load i32, i32* %attributes26, align 4
  %and27 = and i32 %29, -2049
  store i32 %and27, i32* %attributes26, align 4
  %30 = load %struct.variable*, %struct.variable** %var.addr, align 4
  ret %struct.variable* %30
}

declare %struct.hash_table* @hash_create(i32) #1

declare i32 @assoc_insert(%struct.hash_table*, i8*, i8*) #1

declare i8* @strcpy(i8*, i8*) #1

declare i8* @sh_xmalloc(i32, i8*, i32) #1

; Function Attrs: noinline nounwind
define i8* @make_array_variable_value(%struct.variable* %entry1, i64 %ind, i8* %key, i8* %value, i32 %flags) #0 {
entry:
  %entry.addr = alloca %struct.variable*, align 4
  %ind.addr = alloca i64, align 8
  %key.addr = alloca i8*, align 4
  %value.addr = alloca i8*, align 4
  %flags.addr = alloca i32, align 4
  %dentry = alloca %struct.variable*, align 4
  %newval = alloca i8*, align 4
  store %struct.variable* %entry1, %struct.variable** %entry.addr, align 4
  store i64 %ind, i64* %ind.addr, align 8
  store i8* %key, i8** %key.addr, align 4
  store i8* %value, i8** %value.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %0 = load i32, i32* %flags.addr, align 4
  %and = and i32 %0, 1
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then, label %if.else30

if.then:                                          ; preds = %entry
  %call = call i8* @sh_xmalloc(i32 28, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 151)
  %1 = bitcast i8* %call to %struct.variable*
  store %struct.variable* %1, %struct.variable** %dentry, align 4
  %2 = load %struct.variable*, %struct.variable** %entry.addr, align 4
  %name = getelementptr inbounds %struct.variable, %struct.variable* %2, i32 0, i32 0
  %3 = load i8*, i8** %name, align 4
  %call2 = call i32 @strlen(i8* %3)
  %add = add i32 1, %call2
  %call3 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 152)
  %4 = load %struct.variable*, %struct.variable** %entry.addr, align 4
  %name4 = getelementptr inbounds %struct.variable, %struct.variable* %4, i32 0, i32 0
  %5 = load i8*, i8** %name4, align 4
  %call5 = call i8* @strcpy(i8* %call3, i8* %5)
  %6 = load %struct.variable*, %struct.variable** %dentry, align 4
  %name6 = getelementptr inbounds %struct.variable, %struct.variable* %6, i32 0, i32 0
  store i8* %call5, i8** %name6, align 4
  %7 = load %struct.variable*, %struct.variable** %entry.addr, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %7, i32 0, i32 5
  %8 = load i32, i32* %attributes, align 4
  %and7 = and i32 %8, 64
  %tobool8 = icmp ne i32 %and7, 0
  br i1 %tobool8, label %if.then9, label %if.else

if.then9:                                         ; preds = %if.then
  %9 = load %struct.variable*, %struct.variable** %entry.addr, align 4
  %value10 = getelementptr inbounds %struct.variable, %struct.variable* %9, i32 0, i32 1
  %10 = load i8*, i8** %value10, align 4
  %11 = bitcast i8* %10 to %struct.hash_table*
  %12 = load i8*, i8** %key.addr, align 4
  %call11 = call i8* @assoc_reference(%struct.hash_table* %11, i8* %12)
  store i8* %call11, i8** %newval, align 4
  br label %if.end

if.else:                                          ; preds = %if.then
  %13 = load %struct.variable*, %struct.variable** %entry.addr, align 4
  %value12 = getelementptr inbounds %struct.variable, %struct.variable* %13, i32 0, i32 1
  %14 = load i8*, i8** %value12, align 4
  %15 = bitcast i8* %14 to %struct.array*
  %16 = load i64, i64* %ind.addr, align 8
  %call13 = call i8* @array_reference(%struct.array* %15, i64 %16)
  store i8* %call13, i8** %newval, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then9
  %17 = load i8*, i8** %newval, align 4
  %tobool14 = icmp ne i8* %17, null
  br i1 %tobool14, label %if.then15, label %if.else21

if.then15:                                        ; preds = %if.end
  %18 = load i8*, i8** %newval, align 4
  %call16 = call i32 @strlen(i8* %18)
  %add17 = add i32 1, %call16
  %call18 = call i8* @sh_xmalloc(i32 %add17, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 158)
  %19 = load i8*, i8** %newval, align 4
  %call19 = call i8* @strcpy(i8* %call18, i8* %19)
  %20 = load %struct.variable*, %struct.variable** %dentry, align 4
  %value20 = getelementptr inbounds %struct.variable, %struct.variable* %20, i32 0, i32 1
  store i8* %call19, i8** %value20, align 4
  br label %if.end25

if.else21:                                        ; preds = %if.end
  %call22 = call i8* @sh_xmalloc(i32 1, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 161)
  %21 = load %struct.variable*, %struct.variable** %dentry, align 4
  %value23 = getelementptr inbounds %struct.variable, %struct.variable* %21, i32 0, i32 1
  store i8* %call22, i8** %value23, align 4
  %22 = load %struct.variable*, %struct.variable** %dentry, align 4
  %value24 = getelementptr inbounds %struct.variable, %struct.variable* %22, i32 0, i32 1
  %23 = load i8*, i8** %value24, align 4
  %arrayidx = getelementptr inbounds i8, i8* %23, i32 0
  store i8 0, i8* %arrayidx, align 1
  br label %if.end25

if.end25:                                         ; preds = %if.else21, %if.then15
  %24 = load %struct.variable*, %struct.variable** %dentry, align 4
  %exportstr = getelementptr inbounds %struct.variable, %struct.variable* %24, i32 0, i32 2
  store i8* null, i8** %exportstr, align 4
  %25 = load %struct.variable*, %struct.variable** %entry.addr, align 4
  %attributes26 = getelementptr inbounds %struct.variable, %struct.variable* %25, i32 0, i32 5
  %26 = load i32, i32* %attributes26, align 4
  %and27 = and i32 %26, -70
  %27 = load %struct.variable*, %struct.variable** %dentry, align 4
  %attributes28 = getelementptr inbounds %struct.variable, %struct.variable* %27, i32 0, i32 5
  store i32 %and27, i32* %attributes28, align 4
  %28 = load %struct.variable*, %struct.variable** %dentry, align 4
  %29 = load i8*, i8** %value.addr, align 4
  %30 = load i32, i32* %flags.addr, align 4
  %call29 = call i8* @make_variable_value(%struct.variable* %28, i8* %29, i32 %30)
  store i8* %call29, i8** %newval, align 4
  %31 = load %struct.variable*, %struct.variable** %dentry, align 4
  call void @dispose_variable(%struct.variable* %31)
  br label %if.end32

if.else30:                                        ; preds = %entry
  %32 = load %struct.variable*, %struct.variable** %entry.addr, align 4
  %33 = load i8*, i8** %value.addr, align 4
  %34 = load i32, i32* %flags.addr, align 4
  %call31 = call i8* @make_variable_value(%struct.variable* %32, i8* %33, i32 %34)
  store i8* %call31, i8** %newval, align 4
  br label %if.end32

if.end32:                                         ; preds = %if.else30, %if.end25
  %35 = load i8*, i8** %newval, align 4
  ret i8* %35
}

declare i32 @strlen(i8*) #1

declare i8* @assoc_reference(%struct.hash_table*, i8*) #1

declare i8* @array_reference(%struct.array*, i64) #1

declare i8* @make_variable_value(%struct.variable*, i8*, i32) #1

declare void @dispose_variable(%struct.variable*) #1

; Function Attrs: noinline nounwind
define %struct.variable* @bind_array_variable(i8* %name, i64 %ind, i8* %value, i32 %flags) #0 {
entry:
  %retval = alloca %struct.variable*, align 4
  %name.addr = alloca i8*, align 4
  %ind.addr = alloca i64, align 8
  %value.addr = alloca i8*, align 4
  %flags.addr = alloca i32, align 4
  %entry1 = alloca %struct.variable*, align 4
  store i8* %name, i8** %name.addr, align 4
  store i64 %ind, i64* %ind.addr, align 8
  store i8* %value, i8** %value.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %0 = load i8*, i8** %name.addr, align 4
  %call = call %struct.variable* @find_shell_variable(i8* %0)
  store %struct.variable* %call, %struct.variable** %entry1, align 4
  %1 = load %struct.variable*, %struct.variable** %entry1, align 4
  %cmp = icmp eq %struct.variable* %1, null
  br i1 %cmp, label %if.then, label %if.end10

if.then:                                          ; preds = %entry
  %2 = load i8*, i8** %name.addr, align 4
  %call2 = call %struct.variable* @find_variable_nameref_for_create(i8* %2, i32 0)
  store %struct.variable* %call2, %struct.variable** %entry1, align 4
  %3 = load %struct.variable*, %struct.variable** %entry1, align 4
  %cmp3 = icmp eq %struct.variable* %3, @nameref_invalid_value
  br i1 %cmp3, label %if.then4, label %if.end

if.then4:                                         ; preds = %if.then
  store %struct.variable* null, %struct.variable** %retval, align 4
  br label %return

if.end:                                           ; preds = %if.then
  %4 = load %struct.variable*, %struct.variable** %entry1, align 4
  %tobool = icmp ne %struct.variable* %4, null
  br i1 %tobool, label %land.lhs.true, label %if.end9

land.lhs.true:                                    ; preds = %if.end
  %5 = load %struct.variable*, %struct.variable** %entry1, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %5, i32 0, i32 5
  %6 = load i32, i32* %attributes, align 4
  %and = and i32 %6, 2048
  %tobool5 = icmp ne i32 %and, 0
  br i1 %tobool5, label %if.then6, label %if.end9

if.then6:                                         ; preds = %land.lhs.true
  %7 = load %struct.variable*, %struct.variable** %entry1, align 4
  %value7 = getelementptr inbounds %struct.variable, %struct.variable* %7, i32 0, i32 1
  %8 = load i8*, i8** %value7, align 4
  %call8 = call %struct.variable* @make_new_array_variable(i8* %8)
  store %struct.variable* %call8, %struct.variable** %entry1, align 4
  br label %if.end9

if.end9:                                          ; preds = %if.then6, %land.lhs.true, %if.end
  br label %if.end10

if.end10:                                         ; preds = %if.end9, %entry
  %9 = load %struct.variable*, %struct.variable** %entry1, align 4
  %cmp11 = icmp eq %struct.variable* %9, null
  br i1 %cmp11, label %if.then12, label %if.else

if.then12:                                        ; preds = %if.end10
  %10 = load i8*, i8** %name.addr, align 4
  %call13 = call %struct.variable* @make_new_array_variable(i8* %10)
  store %struct.variable* %call13, %struct.variable** %entry1, align 4
  br label %if.end37

if.else:                                          ; preds = %if.end10
  %11 = load %struct.variable*, %struct.variable** %entry1, align 4
  %attributes14 = getelementptr inbounds %struct.variable, %struct.variable* %11, i32 0, i32 5
  %12 = load i32, i32* %attributes14, align 4
  %and15 = and i32 %12, 2
  %tobool16 = icmp ne i32 %and15, 0
  br i1 %tobool16, label %land.lhs.true17, label %lor.lhs.false

land.lhs.true17:                                  ; preds = %if.else
  %13 = load i32, i32* %flags.addr, align 4
  %and18 = and i32 %13, 32
  %cmp19 = icmp eq i32 %and18, 0
  br i1 %cmp19, label %if.then23, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true17, %if.else
  %14 = load %struct.variable*, %struct.variable** %entry1, align 4
  %attributes20 = getelementptr inbounds %struct.variable, %struct.variable* %14, i32 0, i32 5
  %15 = load i32, i32* %attributes20, align 4
  %and21 = and i32 %15, 16384
  %tobool22 = icmp ne i32 %and21, 0
  br i1 %tobool22, label %if.then23, label %if.else29

if.then23:                                        ; preds = %lor.lhs.false, %land.lhs.true17
  %16 = load %struct.variable*, %struct.variable** %entry1, align 4
  %attributes24 = getelementptr inbounds %struct.variable, %struct.variable* %16, i32 0, i32 5
  %17 = load i32, i32* %attributes24, align 4
  %and25 = and i32 %17, 2
  %tobool26 = icmp ne i32 %and25, 0
  br i1 %tobool26, label %if.then27, label %if.end28

if.then27:                                        ; preds = %if.then23
  %18 = load i8*, i8** %name.addr, align 4
  call void @err_readonly(i8* %18)
  br label %if.end28

if.end28:                                         ; preds = %if.then27, %if.then23
  %19 = load %struct.variable*, %struct.variable** %entry1, align 4
  store %struct.variable* %19, %struct.variable** %retval, align 4
  br label %return

if.else29:                                        ; preds = %lor.lhs.false
  %20 = load %struct.variable*, %struct.variable** %entry1, align 4
  %attributes30 = getelementptr inbounds %struct.variable, %struct.variable* %20, i32 0, i32 5
  %21 = load i32, i32* %attributes30, align 4
  %and31 = and i32 %21, 4
  %cmp32 = icmp eq i32 %and31, 0
  br i1 %cmp32, label %if.then33, label %if.end35

if.then33:                                        ; preds = %if.else29
  %22 = load %struct.variable*, %struct.variable** %entry1, align 4
  %call34 = call %struct.variable* @convert_var_to_array(%struct.variable* %22)
  store %struct.variable* %call34, %struct.variable** %entry1, align 4
  br label %if.end35

if.end35:                                         ; preds = %if.then33, %if.else29
  br label %if.end36

if.end36:                                         ; preds = %if.end35
  br label %if.end37

if.end37:                                         ; preds = %if.end36, %if.then12
  %23 = load %struct.variable*, %struct.variable** %entry1, align 4
  %24 = load i64, i64* %ind.addr, align 8
  %25 = load i8*, i8** %value.addr, align 4
  %26 = load i32, i32* %flags.addr, align 4
  %call38 = call %struct.variable* @bind_array_var_internal(%struct.variable* %23, i64 %24, i8* null, i8* %25, i32 %26)
  store %struct.variable* %call38, %struct.variable** %retval, align 4
  br label %return

return:                                           ; preds = %if.end37, %if.end28, %if.then4
  %27 = load %struct.variable*, %struct.variable** %retval, align 4
  ret %struct.variable* %27
}

declare %struct.variable* @find_shell_variable(i8*) #1

declare %struct.variable* @find_variable_nameref_for_create(i8*, i32) #1

declare %struct.variable* @make_new_array_variable(i8*) #1

declare void @err_readonly(i8*) #1

; Function Attrs: noinline nounwind
define internal %struct.variable* @bind_array_var_internal(%struct.variable* %entry1, i64 %ind, i8* %key, i8* %value, i32 %flags) #0 {
entry:
  %entry.addr = alloca %struct.variable*, align 4
  %ind.addr = alloca i64, align 8
  %key.addr = alloca i8*, align 4
  %value.addr = alloca i8*, align 4
  %flags.addr = alloca i32, align 4
  %newval = alloca i8*, align 4
  store %struct.variable* %entry1, %struct.variable** %entry.addr, align 4
  store i64 %ind, i64* %ind.addr, align 8
  store i8* %key, i8** %key.addr, align 4
  store i8* %value, i8** %value.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %0 = load %struct.variable*, %struct.variable** %entry.addr, align 4
  %1 = load i64, i64* %ind.addr, align 8
  %2 = load i8*, i8** %key.addr, align 4
  %3 = load i8*, i8** %value.addr, align 4
  %4 = load i32, i32* %flags.addr, align 4
  %call = call i8* @make_array_variable_value(%struct.variable* %0, i64 %1, i8* %2, i8* %3, i32 %4)
  store i8* %call, i8** %newval, align 4
  %5 = load %struct.variable*, %struct.variable** %entry.addr, align 4
  %assign_func = getelementptr inbounds %struct.variable, %struct.variable* %5, i32 0, i32 4
  %6 = load %struct.variable* (%struct.variable*, i8*, i64, i8*)*, %struct.variable* (%struct.variable*, i8*, i64, i8*)** %assign_func, align 4
  %tobool = icmp ne %struct.variable* (%struct.variable*, i8*, i64, i8*)* %6, null
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %7 = load %struct.variable*, %struct.variable** %entry.addr, align 4
  %assign_func2 = getelementptr inbounds %struct.variable, %struct.variable* %7, i32 0, i32 4
  %8 = load %struct.variable* (%struct.variable*, i8*, i64, i8*)*, %struct.variable* (%struct.variable*, i8*, i64, i8*)** %assign_func2, align 4
  %9 = load %struct.variable*, %struct.variable** %entry.addr, align 4
  %10 = load i8*, i8** %newval, align 4
  %11 = load i64, i64* %ind.addr, align 8
  %12 = load i8*, i8** %key.addr, align 4
  %call3 = call %struct.variable* %8(%struct.variable* %9, i8* %10, i64 %11, i8* %12)
  br label %if.end11

if.else:                                          ; preds = %entry
  %13 = load %struct.variable*, %struct.variable** %entry.addr, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %13, i32 0, i32 5
  %14 = load i32, i32* %attributes, align 4
  %and = and i32 %14, 64
  %tobool4 = icmp ne i32 %and, 0
  br i1 %tobool4, label %if.then5, label %if.else8

if.then5:                                         ; preds = %if.else
  %15 = load %struct.variable*, %struct.variable** %entry.addr, align 4
  %value6 = getelementptr inbounds %struct.variable, %struct.variable* %15, i32 0, i32 1
  %16 = load i8*, i8** %value6, align 4
  %17 = bitcast i8* %16 to %struct.hash_table*
  %18 = load i8*, i8** %key.addr, align 4
  %19 = load i8*, i8** %newval, align 4
  %call7 = call i32 @assoc_insert(%struct.hash_table* %17, i8* %18, i8* %19)
  br label %if.end

if.else8:                                         ; preds = %if.else
  %20 = load %struct.variable*, %struct.variable** %entry.addr, align 4
  %value9 = getelementptr inbounds %struct.variable, %struct.variable* %20, i32 0, i32 1
  %21 = load i8*, i8** %value9, align 4
  %22 = bitcast i8* %21 to %struct.array*
  %23 = load i64, i64* %ind.addr, align 8
  %24 = load i8*, i8** %newval, align 4
  %call10 = call i32 @array_insert(%struct.array* %22, i64 %23, i8* %24)
  br label %if.end

if.end:                                           ; preds = %if.else8, %if.then5
  br label %if.end11

if.end11:                                         ; preds = %if.end, %if.then
  br label %do.body

do.body:                                          ; preds = %if.end11
  %25 = load i8*, i8** %newval, align 4
  %tobool12 = icmp ne i8* %25, null
  br i1 %tobool12, label %if.then13, label %if.end14

if.then13:                                        ; preds = %do.body
  %26 = load i8*, i8** %newval, align 4
  call void @sh_xfree(i8* %26, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 195)
  br label %if.end14

if.end14:                                         ; preds = %if.then13, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end14
  %27 = load %struct.variable*, %struct.variable** %entry.addr, align 4
  %attributes15 = getelementptr inbounds %struct.variable, %struct.variable* %27, i32 0, i32 5
  %28 = load i32, i32* %attributes15, align 4
  %and16 = and i32 %28, -4097
  store i32 %and16, i32* %attributes15, align 4
  %29 = load %struct.variable*, %struct.variable** %entry.addr, align 4
  ret %struct.variable* %29
}

; Function Attrs: noinline nounwind
define %struct.variable* @bind_array_element(%struct.variable* %entry1, i64 %ind, i8* %value, i32 %flags) #0 {
entry:
  %entry.addr = alloca %struct.variable*, align 4
  %ind.addr = alloca i64, align 8
  %value.addr = alloca i8*, align 4
  %flags.addr = alloca i32, align 4
  store %struct.variable* %entry1, %struct.variable** %entry.addr, align 4
  store i64 %ind, i64* %ind.addr, align 8
  store i8* %value, i8** %value.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %0 = load %struct.variable*, %struct.variable** %entry.addr, align 4
  %1 = load i64, i64* %ind.addr, align 8
  %2 = load i8*, i8** %value.addr, align 4
  %3 = load i32, i32* %flags.addr, align 4
  %call = call %struct.variable* @bind_array_var_internal(%struct.variable* %0, i64 %1, i8* null, i8* %2, i32 %3)
  ret %struct.variable* %call
}

; Function Attrs: noinline nounwind
define %struct.variable* @bind_assoc_variable(%struct.variable* %entry1, i8* %name, i8* %key, i8* %value, i32 %flags) #0 {
entry:
  %retval = alloca %struct.variable*, align 4
  %entry.addr = alloca %struct.variable*, align 4
  %name.addr = alloca i8*, align 4
  %key.addr = alloca i8*, align 4
  %value.addr = alloca i8*, align 4
  %flags.addr = alloca i32, align 4
  %dentry = alloca %struct.variable*, align 4
  %newval = alloca i8*, align 4
  store %struct.variable* %entry1, %struct.variable** %entry.addr, align 4
  store i8* %name, i8** %name.addr, align 4
  store i8* %key, i8** %key.addr, align 4
  store i8* %value, i8** %value.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %0 = load %struct.variable*, %struct.variable** %entry.addr, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %0, i32 0, i32 5
  %1 = load i32, i32* %attributes, align 4
  %and = and i32 %1, 2
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %land.lhs.true, label %lor.lhs.false

land.lhs.true:                                    ; preds = %entry
  %2 = load i32, i32* %flags.addr, align 4
  %and2 = and i32 %2, 32
  %cmp = icmp eq i32 %and2, 0
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %3 = load %struct.variable*, %struct.variable** %entry.addr, align 4
  %attributes3 = getelementptr inbounds %struct.variable, %struct.variable* %3, i32 0, i32 5
  %4 = load i32, i32* %attributes3, align 4
  %and4 = and i32 %4, 16384
  %tobool5 = icmp ne i32 %and4, 0
  br i1 %tobool5, label %if.then, label %if.end10

if.then:                                          ; preds = %lor.lhs.false, %land.lhs.true
  %5 = load %struct.variable*, %struct.variable** %entry.addr, align 4
  %attributes6 = getelementptr inbounds %struct.variable, %struct.variable* %5, i32 0, i32 5
  %6 = load i32, i32* %attributes6, align 4
  %and7 = and i32 %6, 2
  %tobool8 = icmp ne i32 %and7, 0
  br i1 %tobool8, label %if.then9, label %if.end

if.then9:                                         ; preds = %if.then
  %7 = load i8*, i8** %name.addr, align 4
  call void @err_readonly(i8* %7)
  br label %if.end

if.end:                                           ; preds = %if.then9, %if.then
  %8 = load %struct.variable*, %struct.variable** %entry.addr, align 4
  store %struct.variable* %8, %struct.variable** %retval, align 4
  br label %return

if.end10:                                         ; preds = %lor.lhs.false
  %9 = load %struct.variable*, %struct.variable** %entry.addr, align 4
  %10 = load i8*, i8** %key.addr, align 4
  %11 = load i8*, i8** %value.addr, align 4
  %12 = load i32, i32* %flags.addr, align 4
  %call = call %struct.variable* @bind_array_var_internal(%struct.variable* %9, i64 0, i8* %10, i8* %11, i32 %12)
  store %struct.variable* %call, %struct.variable** %retval, align 4
  br label %return

return:                                           ; preds = %if.end10, %if.end
  %13 = load %struct.variable*, %struct.variable** %retval, align 4
  ret %struct.variable* %13
}

; Function Attrs: noinline nounwind
define %struct.variable* @assign_array_element(i8* %name, i8* %value, i32 %flags) #0 {
entry:
  %retval = alloca %struct.variable*, align 4
  %name.addr = alloca i8*, align 4
  %value.addr = alloca i8*, align 4
  %flags.addr = alloca i32, align 4
  %sub = alloca i8*, align 4
  %vname = alloca i8*, align 4
  %sublen = alloca i32, align 4
  %entry1 = alloca %struct.variable*, align 4
  %nv = alloca %struct.variable*, align 4
  store i8* %name, i8** %name.addr, align 4
  store i8* %value, i8** %value.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %0 = load i8*, i8** %name.addr, align 4
  %call = call i8* @array_variable_name(i8* %0, i8** %sub, i32* %sublen)
  store i8* %call, i8** %vname, align 4
  %1 = load i8*, i8** %vname, align 4
  %cmp = icmp eq i8* %1, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store %struct.variable* null, %struct.variable** %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %2 = load i8*, i8** %sub, align 4
  %arrayidx = getelementptr inbounds i8, i8* %2, i32 0
  %3 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %3 to i32
  %cmp2 = icmp eq i32 %conv, 64
  br i1 %cmp2, label %land.lhs.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end
  %4 = load i8*, i8** %sub, align 4
  %arrayidx4 = getelementptr inbounds i8, i8* %4, i32 0
  %5 = load i8, i8* %arrayidx4, align 1
  %conv5 = sext i8 %5 to i32
  %cmp6 = icmp eq i32 %conv5, 42
  br i1 %cmp6, label %land.lhs.true, label %lor.lhs.false12

land.lhs.true:                                    ; preds = %lor.lhs.false, %if.end
  %6 = load i8*, i8** %sub, align 4
  %arrayidx8 = getelementptr inbounds i8, i8* %6, i32 1
  %7 = load i8, i8* %arrayidx8, align 1
  %conv9 = sext i8 %7 to i32
  %cmp10 = icmp eq i32 %conv9, 93
  br i1 %cmp10, label %if.then15, label %lor.lhs.false12

lor.lhs.false12:                                  ; preds = %land.lhs.true, %lor.lhs.false
  %8 = load i32, i32* %sublen, align 4
  %cmp13 = icmp sle i32 %8, 1
  br i1 %cmp13, label %if.then15, label %if.end16

if.then15:                                        ; preds = %lor.lhs.false12, %land.lhs.true
  %9 = load i8*, i8** %vname, align 4
  call void @sh_xfree(i8* %9, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 292)
  %10 = load i8*, i8** %name.addr, align 4
  call void @err_badarraysub(i8* %10)
  store %struct.variable* null, %struct.variable** %retval, align 4
  br label %return

if.end16:                                         ; preds = %lor.lhs.false12
  %11 = load i8*, i8** %vname, align 4
  %call17 = call %struct.variable* @find_variable(i8* %11)
  store %struct.variable* %call17, %struct.variable** %entry1, align 4
  %12 = load %struct.variable*, %struct.variable** %entry1, align 4
  %13 = load i8*, i8** %name.addr, align 4
  %14 = load i8*, i8** %vname, align 4
  %15 = load i8*, i8** %sub, align 4
  %16 = load i32, i32* %sublen, align 4
  %17 = load i8*, i8** %value.addr, align 4
  %18 = load i32, i32* %flags.addr, align 4
  %call18 = call %struct.variable* @assign_array_element_internal(%struct.variable* %12, i8* %13, i8* %14, i8* %15, i32 %16, i8* %17, i32 %18)
  store %struct.variable* %call18, %struct.variable** %entry1, align 4
  %19 = load i8*, i8** %vname, align 4
  call void @sh_xfree(i8* %19, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 300)
  %20 = load %struct.variable*, %struct.variable** %entry1, align 4
  store %struct.variable* %20, %struct.variable** %retval, align 4
  br label %return

return:                                           ; preds = %if.end16, %if.then15, %if.then
  %21 = load %struct.variable*, %struct.variable** %retval, align 4
  ret %struct.variable* %21
}

; Function Attrs: noinline nounwind
define i8* @array_variable_name(i8* %s, i8** %subp, i32* %lenp) #0 {
entry:
  %retval = alloca i8*, align 4
  %s.addr = alloca i8*, align 4
  %subp.addr = alloca i8**, align 4
  %lenp.addr = alloca i32*, align 4
  %t = alloca i8*, align 4
  %ret = alloca i8*, align 4
  %ind = alloca i32, align 4
  %ni = alloca i32, align 4
  store i8* %s, i8** %s.addr, align 4
  store i8** %subp, i8*** %subp.addr, align 4
  store i32* %lenp, i32** %lenp.addr, align 4
  %0 = load i8*, i8** %s.addr, align 4
  %call = call i8* @mbschr(i8* %0, i32 91)
  store i8* %call, i8** %t, align 4
  %1 = load i8*, i8** %t, align 4
  %cmp = icmp eq i8* %1, null
  br i1 %cmp, label %if.then, label %if.end5

if.then:                                          ; preds = %entry
  %2 = load i8**, i8*** %subp.addr, align 4
  %tobool = icmp ne i8** %2, null
  br i1 %tobool, label %if.then1, label %if.end

if.then1:                                         ; preds = %if.then
  %3 = load i8*, i8** %t, align 4
  %4 = load i8**, i8*** %subp.addr, align 4
  store i8* %3, i8** %4, align 4
  br label %if.end

if.end:                                           ; preds = %if.then1, %if.then
  %5 = load i32*, i32** %lenp.addr, align 4
  %tobool2 = icmp ne i32* %5, null
  br i1 %tobool2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  %6 = load i32*, i32** %lenp.addr, align 4
  store i32 0, i32* %6, align 4
  br label %if.end4

if.end4:                                          ; preds = %if.then3, %if.end
  store i8* null, i8** %retval, align 4
  br label %return

if.end5:                                          ; preds = %entry
  %7 = load i8*, i8** %t, align 4
  %8 = load i8*, i8** %s.addr, align 4
  %sub.ptr.lhs.cast = ptrtoint i8* %7 to i32
  %sub.ptr.rhs.cast = ptrtoint i8* %8 to i32
  %sub.ptr.sub = sub i32 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  store i32 %sub.ptr.sub, i32* %ind, align 4
  %9 = load i8*, i8** %s.addr, align 4
  %10 = load i32, i32* %ind, align 4
  %call6 = call i32 @skipsubscript(i8* %9, i32 %10, i32 0)
  store i32 %call6, i32* %ni, align 4
  %11 = load i32, i32* %ni, align 4
  %12 = load i32, i32* %ind, align 4
  %add = add nsw i32 %12, 1
  %cmp7 = icmp sle i32 %11, %add
  br i1 %cmp7, label %if.then10, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end5
  %13 = load i8*, i8** %s.addr, align 4
  %14 = load i32, i32* %ni, align 4
  %arrayidx = getelementptr inbounds i8, i8* %13, i32 %14
  %15 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %15 to i32
  %cmp8 = icmp ne i32 %conv, 93
  br i1 %cmp8, label %if.then10, label %if.end17

if.then10:                                        ; preds = %lor.lhs.false, %if.end5
  %16 = load i8*, i8** %s.addr, align 4
  call void @err_badarraysub(i8* %16)
  %17 = load i8**, i8*** %subp.addr, align 4
  %tobool11 = icmp ne i8** %17, null
  br i1 %tobool11, label %if.then12, label %if.end13

if.then12:                                        ; preds = %if.then10
  %18 = load i8*, i8** %t, align 4
  %19 = load i8**, i8*** %subp.addr, align 4
  store i8* %18, i8** %19, align 4
  br label %if.end13

if.end13:                                         ; preds = %if.then12, %if.then10
  %20 = load i32*, i32** %lenp.addr, align 4
  %tobool14 = icmp ne i32* %20, null
  br i1 %tobool14, label %if.then15, label %if.end16

if.then15:                                        ; preds = %if.end13
  %21 = load i32*, i32** %lenp.addr, align 4
  store i32 0, i32* %21, align 4
  br label %if.end16

if.end16:                                         ; preds = %if.then15, %if.end13
  store i8* null, i8** %retval, align 4
  br label %return

if.end17:                                         ; preds = %lor.lhs.false
  %22 = load i8*, i8** %t, align 4
  store i8 0, i8* %22, align 1
  %23 = load i8*, i8** %s.addr, align 4
  %call18 = call i32 @strlen(i8* %23)
  %add19 = add i32 1, %call18
  %call20 = call i8* @sh_xmalloc(i32 %add19, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 980)
  %24 = load i8*, i8** %s.addr, align 4
  %call21 = call i8* @strcpy(i8* %call20, i8* %24)
  store i8* %call21, i8** %ret, align 4
  %25 = load i8*, i8** %t, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %25, i32 1
  store i8* %incdec.ptr, i8** %t, align 4
  store i8 91, i8* %25, align 1
  %26 = load i8**, i8*** %subp.addr, align 4
  %tobool22 = icmp ne i8** %26, null
  br i1 %tobool22, label %if.then23, label %if.end24

if.then23:                                        ; preds = %if.end17
  %27 = load i8*, i8** %t, align 4
  %28 = load i8**, i8*** %subp.addr, align 4
  store i8* %27, i8** %28, align 4
  br label %if.end24

if.end24:                                         ; preds = %if.then23, %if.end17
  %29 = load i32*, i32** %lenp.addr, align 4
  %tobool25 = icmp ne i32* %29, null
  br i1 %tobool25, label %if.then26, label %if.end27

if.then26:                                        ; preds = %if.end24
  %30 = load i32, i32* %ni, align 4
  %31 = load i32, i32* %ind, align 4
  %sub = sub nsw i32 %30, %31
  %32 = load i32*, i32** %lenp.addr, align 4
  store i32 %sub, i32* %32, align 4
  br label %if.end27

if.end27:                                         ; preds = %if.then26, %if.end24
  %33 = load i8*, i8** %ret, align 4
  store i8* %33, i8** %retval, align 4
  br label %return

return:                                           ; preds = %if.end27, %if.end16, %if.end4
  %34 = load i8*, i8** %retval, align 4
  ret i8* %34
}

declare void @err_badarraysub(i8*) #1

declare %struct.variable* @find_variable(i8*) #1

; Function Attrs: noinline nounwind
define internal %struct.variable* @assign_array_element_internal(%struct.variable* %entry1, i8* %name, i8* %vname, i8* %sub, i32 %sublen, i8* %value, i32 %flags) #0 {
entry:
  %retval = alloca %struct.variable*, align 4
  %entry.addr = alloca %struct.variable*, align 4
  %name.addr = alloca i8*, align 4
  %vname.addr = alloca i8*, align 4
  %sub.addr = alloca i8*, align 4
  %sublen.addr = alloca i32, align 4
  %value.addr = alloca i8*, align 4
  %flags.addr = alloca i32, align 4
  %akey = alloca i8*, align 4
  %ind = alloca i64, align 8
  store %struct.variable* %entry1, %struct.variable** %entry.addr, align 4
  store i8* %name, i8** %name.addr, align 4
  store i8* %vname, i8** %vname.addr, align 4
  store i8* %sub, i8** %sub.addr, align 4
  store i32 %sublen, i32* %sublen.addr, align 4
  store i8* %value, i8** %value.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %0 = load %struct.variable*, %struct.variable** %entry.addr, align 4
  %tobool = icmp ne %struct.variable* %0, null
  br i1 %tobool, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %entry
  %1 = load %struct.variable*, %struct.variable** %entry.addr, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %1, i32 0, i32 5
  %2 = load i32, i32* %attributes, align 4
  %and = and i32 %2, 64
  %tobool2 = icmp ne i32 %and, 0
  br i1 %tobool2, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true
  %3 = load i8*, i8** %sub.addr, align 4
  %4 = load i32, i32* %sublen.addr, align 4
  %sub3 = sub nsw i32 %4, 1
  %arrayidx = getelementptr inbounds i8, i8* %3, i32 %sub3
  store i8 0, i8* %arrayidx, align 1
  %5 = load i8*, i8** %sub.addr, align 4
  %call = call i8* @expand_assignment_string_to_string(i8* %5, i32 0)
  store i8* %call, i8** %akey, align 4
  %6 = load i8*, i8** %sub.addr, align 4
  %7 = load i32, i32* %sublen.addr, align 4
  %sub4 = sub nsw i32 %7, 1
  %arrayidx5 = getelementptr inbounds i8, i8* %6, i32 %sub4
  store i8 93, i8* %arrayidx5, align 1
  %8 = load i8*, i8** %akey, align 4
  %cmp = icmp eq i8* %8, null
  br i1 %cmp, label %if.then8, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.then
  %9 = load i8*, i8** %akey, align 4
  %10 = load i8, i8* %9, align 1
  %conv = sext i8 %10 to i32
  %cmp6 = icmp eq i32 %conv, 0
  br i1 %cmp6, label %if.then8, label %if.end11

if.then8:                                         ; preds = %lor.lhs.false, %if.then
  %11 = load i8*, i8** %name.addr, align 4
  call void @err_badarraysub(i8* %11)
  br label %do.body

do.body:                                          ; preds = %if.then8
  %12 = load i8*, i8** %akey, align 4
  %tobool9 = icmp ne i8* %12, null
  br i1 %tobool9, label %if.then10, label %if.end

if.then10:                                        ; preds = %do.body
  %13 = load i8*, i8** %akey, align 4
  call void @sh_xfree(i8* %13, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 325)
  br label %if.end

if.end:                                           ; preds = %if.then10, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  store %struct.variable* null, %struct.variable** %retval, align 4
  br label %return

if.end11:                                         ; preds = %lor.lhs.false
  %14 = load %struct.variable*, %struct.variable** %entry.addr, align 4
  %15 = load i8*, i8** %vname.addr, align 4
  %16 = load i8*, i8** %akey, align 4
  %17 = load i8*, i8** %value.addr, align 4
  %18 = load i32, i32* %flags.addr, align 4
  %call12 = call %struct.variable* @bind_assoc_variable(%struct.variable* %14, i8* %15, i8* %16, i8* %17, i32 %18)
  store %struct.variable* %call12, %struct.variable** %entry.addr, align 4
  br label %if.end30

if.else:                                          ; preds = %land.lhs.true, %entry
  %19 = load %struct.variable*, %struct.variable** %entry.addr, align 4
  %20 = load i8*, i8** %sub.addr, align 4
  %21 = load i32, i32* %sublen.addr, align 4
  %call13 = call i64 @array_expand_index(%struct.variable* %19, i8* %20, i32 %21)
  store i64 %call13, i64* %ind, align 8
  %22 = load %struct.variable*, %struct.variable** %entry.addr, align 4
  %tobool14 = icmp ne %struct.variable* %22, null
  br i1 %tobool14, label %land.lhs.true15, label %if.end24

land.lhs.true15:                                  ; preds = %if.else
  %23 = load i64, i64* %ind, align 8
  %cmp16 = icmp slt i64 %23, 0
  br i1 %cmp16, label %if.then18, label %if.end24

if.then18:                                        ; preds = %land.lhs.true15
  %24 = load %struct.variable*, %struct.variable** %entry.addr, align 4
  %attributes19 = getelementptr inbounds %struct.variable, %struct.variable* %24, i32 0, i32 5
  %25 = load i32, i32* %attributes19, align 4
  %and20 = and i32 %25, 4
  %tobool21 = icmp ne i32 %and20, 0
  br i1 %tobool21, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then18
  %26 = load %struct.variable*, %struct.variable** %entry.addr, align 4
  %value22 = getelementptr inbounds %struct.variable, %struct.variable* %26, i32 0, i32 1
  %27 = load i8*, i8** %value22, align 4
  %28 = bitcast i8* %27 to %struct.array*
  %max_index = getelementptr inbounds %struct.array, %struct.array* %28, i32 0, i32 1
  %29 = load i64, i64* %max_index, align 8
  br label %cond.end

cond.false:                                       ; preds = %if.then18
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %29, %cond.true ], [ 0, %cond.false ]
  %add = add nsw i64 %cond, 1
  %30 = load i64, i64* %ind, align 8
  %add23 = add nsw i64 %add, %30
  store i64 %add23, i64* %ind, align 8
  br label %if.end24

if.end24:                                         ; preds = %cond.end, %land.lhs.true15, %if.else
  %31 = load i64, i64* %ind, align 8
  %cmp25 = icmp slt i64 %31, 0
  br i1 %cmp25, label %if.then27, label %if.end28

if.then27:                                        ; preds = %if.end24
  %32 = load i8*, i8** %name.addr, align 4
  call void @err_badarraysub(i8* %32)
  store %struct.variable* null, %struct.variable** %retval, align 4
  br label %return

if.end28:                                         ; preds = %if.end24
  %33 = load i8*, i8** %vname.addr, align 4
  %34 = load i64, i64* %ind, align 8
  %35 = load i8*, i8** %value.addr, align 4
  %36 = load i32, i32* %flags.addr, align 4
  %call29 = call %struct.variable* @bind_array_variable(i8* %33, i64 %34, i8* %35, i32 %36)
  store %struct.variable* %call29, %struct.variable** %entry.addr, align 4
  br label %if.end30

if.end30:                                         ; preds = %if.end28, %if.end11
  %37 = load %struct.variable*, %struct.variable** %entry.addr, align 4
  store %struct.variable* %37, %struct.variable** %retval, align 4
  br label %return

return:                                           ; preds = %if.end30, %if.then27, %do.end
  %38 = load %struct.variable*, %struct.variable** %retval, align 4
  ret %struct.variable* %38
}

; Function Attrs: noinline nounwind
define %struct.variable* @find_or_make_array_variable(i8* %name, i32 %flags) #0 {
entry:
  %retval = alloca %struct.variable*, align 4
  %name.addr = alloca i8*, align 4
  %flags.addr = alloca i32, align 4
  %var = alloca %struct.variable*, align 4
  store i8* %name, i8** %name.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %0 = load i8*, i8** %name.addr, align 4
  %call = call %struct.variable* @find_variable(i8* %0)
  store %struct.variable* %call, %struct.variable** %var, align 4
  %1 = load %struct.variable*, %struct.variable** %var, align 4
  %cmp = icmp eq %struct.variable* %1, null
  br i1 %cmp, label %if.then, label %if.end29

if.then:                                          ; preds = %entry
  %2 = load i8*, i8** %name.addr, align 4
  %call1 = call %struct.variable* @find_variable_last_nameref(i8* %2, i32 1)
  store %struct.variable* %call1, %struct.variable** %var, align 4
  %3 = load %struct.variable*, %struct.variable** %var, align 4
  %tobool = icmp ne %struct.variable* %3, null
  br i1 %tobool, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %if.then
  %4 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %4, i32 0, i32 5
  %5 = load i32, i32* %attributes, align 4
  %and = and i32 %5, 2048
  %tobool2 = icmp ne i32 %and, 0
  br i1 %tobool2, label %land.lhs.true3, label %if.end

land.lhs.true3:                                   ; preds = %land.lhs.true
  %6 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes4 = getelementptr inbounds %struct.variable, %struct.variable* %6, i32 0, i32 5
  %7 = load i32, i32* %attributes4, align 4
  %and5 = and i32 %7, 4096
  %tobool6 = icmp ne i32 %and5, 0
  br i1 %tobool6, label %if.then7, label %if.end

if.then7:                                         ; preds = %land.lhs.true3
  %call8 = call i8* @libintl_gettext(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.3, i32 0, i32 0))
  %8 = load i8*, i8** %name.addr, align 4
  call void (i8*, ...) @internal_warning(i8* %call8, i8* %8)
  %9 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes9 = getelementptr inbounds %struct.variable, %struct.variable* %9, i32 0, i32 5
  %10 = load i32, i32* %attributes9, align 4
  %and10 = and i32 %10, -2049
  store i32 %and10, i32* %attributes9, align 4
  br label %if.end

if.end:                                           ; preds = %if.then7, %land.lhs.true3, %land.lhs.true, %if.then
  %11 = load %struct.variable*, %struct.variable** %var, align 4
  %tobool11 = icmp ne %struct.variable* %11, null
  br i1 %tobool11, label %land.lhs.true12, label %if.end28

land.lhs.true12:                                  ; preds = %if.end
  %12 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes13 = getelementptr inbounds %struct.variable, %struct.variable* %12, i32 0, i32 5
  %13 = load i32, i32* %attributes13, align 4
  %and14 = and i32 %13, 2048
  %tobool15 = icmp ne i32 %and14, 0
  br i1 %tobool15, label %if.then16, label %if.end28

if.then16:                                        ; preds = %land.lhs.true12
  %14 = load %struct.variable*, %struct.variable** %var, align 4
  %value = getelementptr inbounds %struct.variable, %struct.variable* %14, i32 0, i32 1
  %15 = load i8*, i8** %value, align 4
  %call17 = call i32 @valid_nameref_value(i8* %15, i32 2)
  %cmp18 = icmp eq i32 %call17, 0
  br i1 %cmp18, label %if.then19, label %if.end21

if.then19:                                        ; preds = %if.then16
  %16 = load %struct.variable*, %struct.variable** %var, align 4
  %value20 = getelementptr inbounds %struct.variable, %struct.variable* %16, i32 0, i32 1
  %17 = load i8*, i8** %value20, align 4
  call void @sh_invalidid(i8* %17)
  store %struct.variable* null, %struct.variable** %retval, align 4
  br label %return

if.end21:                                         ; preds = %if.then16
  %18 = load i32, i32* %flags.addr, align 4
  %and22 = and i32 %18, 2
  %tobool23 = icmp ne i32 %and22, 0
  br i1 %tobool23, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end21
  %19 = load %struct.variable*, %struct.variable** %var, align 4
  %value24 = getelementptr inbounds %struct.variable, %struct.variable* %19, i32 0, i32 1
  %20 = load i8*, i8** %value24, align 4
  %call25 = call %struct.variable* @make_new_assoc_variable(i8* %20)
  br label %cond.end

cond.false:                                       ; preds = %if.end21
  %21 = load %struct.variable*, %struct.variable** %var, align 4
  %value26 = getelementptr inbounds %struct.variable, %struct.variable* %21, i32 0, i32 1
  %22 = load i8*, i8** %value26, align 4
  %call27 = call %struct.variable* @make_new_array_variable(i8* %22)
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi %struct.variable* [ %call25, %cond.true ], [ %call27, %cond.false ]
  store %struct.variable* %cond, %struct.variable** %var, align 4
  br label %if.end28

if.end28:                                         ; preds = %cond.end, %land.lhs.true12, %if.end
  br label %if.end29

if.end29:                                         ; preds = %if.end28, %entry
  %23 = load %struct.variable*, %struct.variable** %var, align 4
  %cmp30 = icmp eq %struct.variable* %23, null
  br i1 %cmp30, label %if.then31, label %if.else

if.then31:                                        ; preds = %if.end29
  %24 = load i32, i32* %flags.addr, align 4
  %and32 = and i32 %24, 2
  %tobool33 = icmp ne i32 %and32, 0
  br i1 %tobool33, label %cond.true34, label %cond.false36

cond.true34:                                      ; preds = %if.then31
  %25 = load i8*, i8** %name.addr, align 4
  %call35 = call %struct.variable* @make_new_assoc_variable(i8* %25)
  br label %cond.end38

cond.false36:                                     ; preds = %if.then31
  %26 = load i8*, i8** %name.addr, align 4
  %call37 = call %struct.variable* @make_new_array_variable(i8* %26)
  br label %cond.end38

cond.end38:                                       ; preds = %cond.false36, %cond.true34
  %cond39 = phi %struct.variable* [ %call35, %cond.true34 ], [ %call37, %cond.false36 ]
  store %struct.variable* %cond39, %struct.variable** %var, align 4
  br label %if.end77

if.else:                                          ; preds = %if.end29
  %27 = load i32, i32* %flags.addr, align 4
  %and40 = and i32 %27, 1
  %tobool41 = icmp ne i32 %and40, 0
  br i1 %tobool41, label %land.lhs.true42, label %if.else55

land.lhs.true42:                                  ; preds = %if.else
  %28 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes43 = getelementptr inbounds %struct.variable, %struct.variable* %28, i32 0, i32 5
  %29 = load i32, i32* %attributes43, align 4
  %and44 = and i32 %29, 2
  %tobool45 = icmp ne i32 %and44, 0
  br i1 %tobool45, label %if.then49, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true42
  %30 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes46 = getelementptr inbounds %struct.variable, %struct.variable* %30, i32 0, i32 5
  %31 = load i32, i32* %attributes46, align 4
  %and47 = and i32 %31, 16384
  %tobool48 = icmp ne i32 %and47, 0
  br i1 %tobool48, label %if.then49, label %if.else55

if.then49:                                        ; preds = %lor.lhs.false, %land.lhs.true42
  %32 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes50 = getelementptr inbounds %struct.variable, %struct.variable* %32, i32 0, i32 5
  %33 = load i32, i32* %attributes50, align 4
  %and51 = and i32 %33, 2
  %tobool52 = icmp ne i32 %and51, 0
  br i1 %tobool52, label %if.then53, label %if.end54

if.then53:                                        ; preds = %if.then49
  %34 = load i8*, i8** %name.addr, align 4
  call void @err_readonly(i8* %34)
  br label %if.end54

if.end54:                                         ; preds = %if.then53, %if.then49
  store %struct.variable* null, %struct.variable** %retval, align 4
  br label %return

if.else55:                                        ; preds = %lor.lhs.false, %if.else
  %35 = load i32, i32* %flags.addr, align 4
  %and56 = and i32 %35, 2
  %tobool57 = icmp ne i32 %and56, 0
  br i1 %tobool57, label %land.lhs.true58, label %if.else64

land.lhs.true58:                                  ; preds = %if.else55
  %36 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes59 = getelementptr inbounds %struct.variable, %struct.variable* %36, i32 0, i32 5
  %37 = load i32, i32* %attributes59, align 4
  %and60 = and i32 %37, 4
  %tobool61 = icmp ne i32 %and60, 0
  br i1 %tobool61, label %if.then62, label %if.else64

if.then62:                                        ; preds = %land.lhs.true58
  store i32 1, i32* @last_command_exit_value, align 4
  %call63 = call i8* @libintl_gettext(i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.4, i32 0, i32 0))
  %38 = load i8*, i8** %name.addr, align 4
  call void (i8*, ...) @report_error(i8* %call63, i8* %38)
  store %struct.variable* null, %struct.variable** %retval, align 4
  br label %return

if.else64:                                        ; preds = %land.lhs.true58, %if.else55
  %39 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes65 = getelementptr inbounds %struct.variable, %struct.variable* %39, i32 0, i32 5
  %40 = load i32, i32* %attributes65, align 4
  %and66 = and i32 %40, 4
  %cmp67 = icmp eq i32 %and66, 0
  br i1 %cmp67, label %land.lhs.true68, label %if.end74

land.lhs.true68:                                  ; preds = %if.else64
  %41 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes69 = getelementptr inbounds %struct.variable, %struct.variable* %41, i32 0, i32 5
  %42 = load i32, i32* %attributes69, align 4
  %and70 = and i32 %42, 64
  %cmp71 = icmp eq i32 %and70, 0
  br i1 %cmp71, label %if.then72, label %if.end74

if.then72:                                        ; preds = %land.lhs.true68
  %43 = load %struct.variable*, %struct.variable** %var, align 4
  %call73 = call %struct.variable* @convert_var_to_array(%struct.variable* %43)
  store %struct.variable* %call73, %struct.variable** %var, align 4
  br label %if.end74

if.end74:                                         ; preds = %if.then72, %land.lhs.true68, %if.else64
  br label %if.end75

if.end75:                                         ; preds = %if.end74
  br label %if.end76

if.end76:                                         ; preds = %if.end75
  br label %if.end77

if.end77:                                         ; preds = %if.end76, %cond.end38
  %44 = load %struct.variable*, %struct.variable** %var, align 4
  store %struct.variable* %44, %struct.variable** %retval, align 4
  br label %return

return:                                           ; preds = %if.end77, %if.then62, %if.end54, %if.then19
  %45 = load %struct.variable*, %struct.variable** %retval, align 4
  ret %struct.variable* %45
}

declare %struct.variable* @find_variable_last_nameref(i8*, i32) #1

declare void @internal_warning(i8*, ...) #1

declare i8* @libintl_gettext(i8*) #1

declare i32 @valid_nameref_value(i8*, i32) #1

declare void @sh_invalidid(i8*) #1

declare %struct.variable* @make_new_assoc_variable(i8*) #1

declare void @report_error(i8*, ...) #1

; Function Attrs: noinline nounwind
define %struct.variable* @assign_array_from_string(i8* %name, i8* %value, i32 %flags) #0 {
entry:
  %retval = alloca %struct.variable*, align 4
  %name.addr = alloca i8*, align 4
  %value.addr = alloca i8*, align 4
  %flags.addr = alloca i32, align 4
  %var = alloca %struct.variable*, align 4
  %vflags = alloca i32, align 4
  store i8* %name, i8** %name.addr, align 4
  store i8* %value, i8** %value.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  store i32 1, i32* %vflags, align 4
  %0 = load i32, i32* %flags.addr, align 4
  %and = and i32 %0, 4
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %vflags, align 4
  %or = or i32 %1, 2
  store i32 %or, i32* %vflags, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %2 = load i8*, i8** %name.addr, align 4
  %3 = load i32, i32* %vflags, align 4
  %call = call %struct.variable* @find_or_make_array_variable(i8* %2, i32 %3)
  store %struct.variable* %call, %struct.variable** %var, align 4
  %4 = load %struct.variable*, %struct.variable** %var, align 4
  %cmp = icmp eq %struct.variable* %4, null
  br i1 %cmp, label %if.then1, label %if.end2

if.then1:                                         ; preds = %if.end
  store %struct.variable* null, %struct.variable** %retval, align 4
  br label %return

if.end2:                                          ; preds = %if.end
  %5 = load %struct.variable*, %struct.variable** %var, align 4
  %6 = load i8*, i8** %value.addr, align 4
  %7 = load i32, i32* %flags.addr, align 4
  %call3 = call %struct.variable* @assign_array_var_from_string(%struct.variable* %5, i8* %6, i32 %7)
  store %struct.variable* %call3, %struct.variable** %retval, align 4
  br label %return

return:                                           ; preds = %if.end2, %if.then1
  %8 = load %struct.variable*, %struct.variable** %retval, align 4
  ret %struct.variable* %8
}

; Function Attrs: noinline nounwind
define %struct.variable* @assign_array_var_from_string(%struct.variable* %var, i8* %value, i32 %flags) #0 {
entry:
  %retval = alloca %struct.variable*, align 4
  %var.addr = alloca %struct.variable*, align 4
  %value.addr = alloca i8*, align 4
  %flags.addr = alloca i32, align 4
  %nlist = alloca %struct.word_list*, align 4
  store %struct.variable* %var, %struct.variable** %var.addr, align 4
  store i8* %value, i8** %value.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %0 = load i8*, i8** %value.addr, align 4
  %cmp = icmp eq i8* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load %struct.variable*, %struct.variable** %var.addr, align 4
  store %struct.variable* %1, %struct.variable** %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %2 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %3 = load i8*, i8** %value.addr, align 4
  %4 = load i32, i32* %flags.addr, align 4
  %call = call %struct.word_list* @expand_compound_array_assignment(%struct.variable* %2, i8* %3, i32 %4)
  store %struct.word_list* %call, %struct.word_list** %nlist, align 4
  %5 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %6 = load %struct.word_list*, %struct.word_list** %nlist, align 4
  %7 = load i32, i32* %flags.addr, align 4
  call void @assign_compound_array_list(%struct.variable* %5, %struct.word_list* %6, i32 %7)
  %8 = load %struct.word_list*, %struct.word_list** %nlist, align 4
  %tobool = icmp ne %struct.word_list* %8, null
  br i1 %tobool, label %if.then1, label %if.end2

if.then1:                                         ; preds = %if.end
  %9 = load %struct.word_list*, %struct.word_list** %nlist, align 4
  call void @dispose_words(%struct.word_list* %9)
  br label %if.end2

if.end2:                                          ; preds = %if.then1, %if.end
  %10 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %tobool3 = icmp ne %struct.variable* %10, null
  br i1 %tobool3, label %if.then4, label %if.end5

if.then4:                                         ; preds = %if.end2
  %11 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %11, i32 0, i32 5
  %12 = load i32, i32* %attributes, align 4
  %and = and i32 %12, -4097
  store i32 %and, i32* %attributes, align 4
  br label %if.end5

if.end5:                                          ; preds = %if.then4, %if.end2
  %13 = load %struct.variable*, %struct.variable** %var.addr, align 4
  store %struct.variable* %13, %struct.variable** %retval, align 4
  br label %return

return:                                           ; preds = %if.end5, %if.then
  %14 = load %struct.variable*, %struct.variable** %retval, align 4
  ret %struct.variable* %14
}

; Function Attrs: noinline nounwind
define %struct.variable* @assign_array_var_from_word_list(%struct.variable* %var, %struct.word_list* %list, i32 %flags) #0 {
entry:
  %var.addr = alloca %struct.variable*, align 4
  %list.addr = alloca %struct.word_list*, align 4
  %flags.addr = alloca i32, align 4
  %i = alloca i64, align 8
  %l = alloca %struct.word_list*, align 4
  %a = alloca %struct.array*, align 4
  store %struct.variable* %var, %struct.variable** %var.addr, align 4
  store %struct.word_list* %list, %struct.word_list** %list.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %0 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %value = getelementptr inbounds %struct.variable, %struct.variable* %0, i32 0, i32 1
  %1 = load i8*, i8** %value, align 4
  %2 = bitcast i8* %1 to %struct.array*
  store %struct.array* %2, %struct.array** %a, align 4
  %3 = load i32, i32* %flags.addr, align 4
  %and = and i32 %3, 1
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %4 = load %struct.array*, %struct.array** %a, align 4
  %max_index = getelementptr inbounds %struct.array, %struct.array* %4, i32 0, i32 1
  %5 = load i64, i64* %max_index, align 8
  %add = add nsw i64 %5, 1
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %add, %cond.true ], [ 0, %cond.false ]
  store i64 %cond, i64* %i, align 8
  %6 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  store %struct.word_list* %6, %struct.word_list** %l, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %cond.end
  %7 = load %struct.word_list*, %struct.word_list** %l, align 4
  %tobool1 = icmp ne %struct.word_list* %7, null
  br i1 %tobool1, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %8 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %9 = load i64, i64* %i, align 8
  %10 = load %struct.word_list*, %struct.word_list** %l, align 4
  %word = getelementptr inbounds %struct.word_list, %struct.word_list* %10, i32 0, i32 1
  %11 = load %struct.word_desc*, %struct.word_desc** %word, align 4
  %word2 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %11, i32 0, i32 0
  %12 = load i8*, i8** %word2, align 4
  %13 = load i32, i32* %flags.addr, align 4
  %and3 = and i32 %13, -2
  %call = call %struct.variable* @bind_array_var_internal(%struct.variable* %8, i64 %9, i8* null, i8* %12, i32 %and3)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %14 = load %struct.word_list*, %struct.word_list** %l, align 4
  %next = getelementptr inbounds %struct.word_list, %struct.word_list* %14, i32 0, i32 0
  %15 = load %struct.word_list*, %struct.word_list** %next, align 4
  store %struct.word_list* %15, %struct.word_list** %l, align 4
  %16 = load i64, i64* %i, align 8
  %inc = add nsw i64 %16, 1
  store i64 %inc, i64* %i, align 8
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %17 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %17, i32 0, i32 5
  %18 = load i32, i32* %attributes, align 4
  %and4 = and i32 %18, -4097
  store i32 %and4, i32* %attributes, align 4
  %19 = load %struct.variable*, %struct.variable** %var.addr, align 4
  ret %struct.variable* %19
}

; Function Attrs: noinline nounwind
define %struct.word_list* @expand_compound_array_assignment(%struct.variable* %var, i8* %value, i32 %flags) #0 {
entry:
  %retval = alloca %struct.word_list*, align 4
  %var.addr = alloca %struct.variable*, align 4
  %value.addr = alloca i8*, align 4
  %flags.addr = alloca i32, align 4
  %list = alloca %struct.word_list*, align 4
  %nlist = alloca %struct.word_list*, align 4
  %hd = alloca %struct.word_list*, align 4
  %tl = alloca %struct.word_list*, align 4
  %t = alloca %struct.word_list*, align 4
  %n = alloca %struct.word_list*, align 4
  %val = alloca i8*, align 4
  %ni = alloca i32, align 4
  store %struct.variable* %var, %struct.variable** %var.addr, align 4
  store i8* %value, i8** %value.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %0 = load i8*, i8** %value.addr, align 4
  %1 = load i8, i8* %0, align 1
  %conv = sext i8 %1 to i32
  %cmp = icmp eq i32 %conv, 40
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i32 1, i32* %ni, align 4
  %2 = load i8*, i8** %value.addr, align 4
  %call = call i8* @extract_array_assignment_list(i8* %2, i32* %ni)
  store i8* %call, i8** %val, align 4
  %3 = load i8*, i8** %val, align 4
  %cmp2 = icmp eq i8* %3, null
  br i1 %cmp2, label %if.then4, label %if.end

if.then4:                                         ; preds = %if.then
  store %struct.word_list* null, %struct.word_list** %retval, align 4
  br label %return

if.end:                                           ; preds = %if.then
  br label %if.end5

if.else:                                          ; preds = %entry
  %4 = load i8*, i8** %value.addr, align 4
  store i8* %4, i8** %val, align 4
  br label %if.end5

if.end5:                                          ; preds = %if.else, %if.end
  %5 = load i8*, i8** %val, align 4
  %call6 = call %struct.word_list* @parse_string_to_word_list(i8* %5, i32 1, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.5, i32 0, i32 0))
  store %struct.word_list* %call6, %struct.word_list** %list, align 4
  %6 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %tobool = icmp ne %struct.variable* %6, null
  br i1 %tobool, label %land.lhs.true, label %if.end13

land.lhs.true:                                    ; preds = %if.end5
  %7 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %7, i32 0, i32 5
  %8 = load i32, i32* %attributes, align 4
  %and = and i32 %8, 64
  %tobool7 = icmp ne i32 %and, 0
  br i1 %tobool7, label %if.then8, label %if.end13

if.then8:                                         ; preds = %land.lhs.true
  %9 = load i8*, i8** %val, align 4
  %10 = load i8*, i8** %value.addr, align 4
  %cmp9 = icmp ne i8* %9, %10
  br i1 %cmp9, label %if.then11, label %if.end12

if.then11:                                        ; preds = %if.then8
  %11 = load i8*, i8** %val, align 4
  call void @sh_xfree(i8* %11, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 479)
  br label %if.end12

if.end12:                                         ; preds = %if.then11, %if.then8
  %12 = load %struct.word_list*, %struct.word_list** %list, align 4
  store %struct.word_list* %12, %struct.word_list** %retval, align 4
  br label %return

if.end13:                                         ; preds = %land.lhs.true, %if.end5
  %13 = load %struct.word_list*, %struct.word_list** %list, align 4
  %tobool14 = icmp ne %struct.word_list* %13, null
  br i1 %tobool14, label %if.then15, label %if.end16

if.then15:                                        ; preds = %if.end13
  %14 = load %struct.word_list*, %struct.word_list** %list, align 4
  call void @quote_array_assignment_chars(%struct.word_list* %14)
  br label %if.end16

if.end16:                                         ; preds = %if.then15, %if.end13
  %15 = load %struct.word_list*, %struct.word_list** %list, align 4
  %tobool17 = icmp ne %struct.word_list* %15, null
  br i1 %tobool17, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end16
  %16 = load %struct.word_list*, %struct.word_list** %list, align 4
  %call18 = call %struct.word_list* @expand_words_no_vars(%struct.word_list* %16)
  br label %cond.end

cond.false:                                       ; preds = %if.end16
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi %struct.word_list* [ %call18, %cond.true ], [ null, %cond.false ]
  store %struct.word_list* %cond, %struct.word_list** %nlist, align 4
  %17 = load %struct.word_list*, %struct.word_list** %list, align 4
  call void @dispose_words(%struct.word_list* %17)
  %18 = load i8*, i8** %val, align 4
  %19 = load i8*, i8** %value.addr, align 4
  %cmp19 = icmp ne i8* %18, %19
  br i1 %cmp19, label %if.then21, label %if.end22

if.then21:                                        ; preds = %cond.end
  %20 = load i8*, i8** %val, align 4
  call void @sh_xfree(i8* %20, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 497)
  br label %if.end22

if.end22:                                         ; preds = %if.then21, %cond.end
  %21 = load %struct.word_list*, %struct.word_list** %nlist, align 4
  store %struct.word_list* %21, %struct.word_list** %retval, align 4
  br label %return

return:                                           ; preds = %if.end22, %if.end12, %if.then4
  %22 = load %struct.word_list*, %struct.word_list** %retval, align 4
  ret %struct.word_list* %22
}

declare i8* @extract_array_assignment_list(i8*, i32*) #1

declare %struct.word_list* @parse_string_to_word_list(i8*, i32, i8*) #1

; Function Attrs: noinline nounwind
define internal void @quote_array_assignment_chars(%struct.word_list* %list) #0 {
entry:
  %list.addr = alloca %struct.word_list*, align 4
  %nword = alloca i8*, align 4
  %l = alloca %struct.word_list*, align 4
  store %struct.word_list* %list, %struct.word_list** %list.addr, align 4
  %0 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  store %struct.word_list* %0, %struct.word_list** %l, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load %struct.word_list*, %struct.word_list** %l, align 4
  %tobool = icmp ne %struct.word_list* %1, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load %struct.word_list*, %struct.word_list** %l, align 4
  %word = getelementptr inbounds %struct.word_list, %struct.word_list* %2, i32 0, i32 1
  %3 = load %struct.word_desc*, %struct.word_desc** %word, align 4
  %cmp = icmp eq %struct.word_desc* %3, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %for.body
  %4 = load %struct.word_list*, %struct.word_list** %l, align 4
  %word1 = getelementptr inbounds %struct.word_list, %struct.word_list* %4, i32 0, i32 1
  %5 = load %struct.word_desc*, %struct.word_desc** %word1, align 4
  %word2 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %5, i32 0, i32 0
  %6 = load i8*, i8** %word2, align 4
  %cmp3 = icmp eq i8* %6, null
  br i1 %cmp3, label %if.then, label %lor.lhs.false4

lor.lhs.false4:                                   ; preds = %lor.lhs.false
  %7 = load %struct.word_list*, %struct.word_list** %l, align 4
  %word5 = getelementptr inbounds %struct.word_list, %struct.word_list* %7, i32 0, i32 1
  %8 = load %struct.word_desc*, %struct.word_desc** %word5, align 4
  %word6 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %8, i32 0, i32 0
  %9 = load i8*, i8** %word6, align 4
  %arrayidx = getelementptr inbounds i8, i8* %9, i32 0
  %10 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %10 to i32
  %cmp7 = icmp eq i32 %conv, 0
  br i1 %cmp7, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false4, %lor.lhs.false, %for.body
  br label %for.inc

if.end:                                           ; preds = %lor.lhs.false4
  %11 = load %struct.word_list*, %struct.word_list** %l, align 4
  %word9 = getelementptr inbounds %struct.word_list, %struct.word_list* %11, i32 0, i32 1
  %12 = load %struct.word_desc*, %struct.word_desc** %word9, align 4
  %flags = getelementptr inbounds %struct.word_desc, %struct.word_desc* %12, i32 0, i32 1
  %13 = load i32, i32* %flags, align 4
  %and = and i32 %13, 4
  %cmp10 = icmp eq i32 %and, 0
  br i1 %cmp10, label %if.then12, label %if.end13

if.then12:                                        ; preds = %if.end
  br label %for.inc

if.end13:                                         ; preds = %if.end
  %14 = load %struct.word_list*, %struct.word_list** %l, align 4
  %word14 = getelementptr inbounds %struct.word_list, %struct.word_list* %14, i32 0, i32 1
  %15 = load %struct.word_desc*, %struct.word_desc** %word14, align 4
  %word15 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %15, i32 0, i32 0
  %16 = load i8*, i8** %word15, align 4
  %arrayidx16 = getelementptr inbounds i8, i8* %16, i32 0
  %17 = load i8, i8* %arrayidx16, align 1
  %conv17 = sext i8 %17 to i32
  %cmp18 = icmp ne i32 %conv17, 91
  br i1 %cmp18, label %if.then25, label %lor.lhs.false20

lor.lhs.false20:                                  ; preds = %if.end13
  %18 = load %struct.word_list*, %struct.word_list** %l, align 4
  %word21 = getelementptr inbounds %struct.word_list, %struct.word_list* %18, i32 0, i32 1
  %19 = load %struct.word_desc*, %struct.word_desc** %word21, align 4
  %word22 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %19, i32 0, i32 0
  %20 = load i8*, i8** %word22, align 4
  %call = call i8* @mbschr(i8* %20, i32 61)
  %cmp23 = icmp eq i8* %call, null
  br i1 %cmp23, label %if.then25, label %if.end26

if.then25:                                        ; preds = %lor.lhs.false20, %if.end13
  br label %for.inc

if.end26:                                         ; preds = %lor.lhs.false20
  %21 = load %struct.word_list*, %struct.word_list** %l, align 4
  %word27 = getelementptr inbounds %struct.word_list, %struct.word_list* %21, i32 0, i32 1
  %22 = load %struct.word_desc*, %struct.word_desc** %word27, align 4
  %word28 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %22, i32 0, i32 0
  %23 = load i8*, i8** %word28, align 4
  %call29 = call i8* @quote_assign(i8* %23)
  store i8* %call29, i8** %nword, align 4
  %24 = load %struct.word_list*, %struct.word_list** %l, align 4
  %word30 = getelementptr inbounds %struct.word_list, %struct.word_list* %24, i32 0, i32 1
  %25 = load %struct.word_desc*, %struct.word_desc** %word30, align 4
  %word31 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %25, i32 0, i32 0
  %26 = load i8*, i8** %word31, align 4
  call void @sh_xfree(i8* %26, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 751)
  %27 = load i8*, i8** %nword, align 4
  %28 = load %struct.word_list*, %struct.word_list** %l, align 4
  %word32 = getelementptr inbounds %struct.word_list, %struct.word_list* %28, i32 0, i32 1
  %29 = load %struct.word_desc*, %struct.word_desc** %word32, align 4
  %word33 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %29, i32 0, i32 0
  store i8* %27, i8** %word33, align 4
  %30 = load %struct.word_list*, %struct.word_list** %l, align 4
  %word34 = getelementptr inbounds %struct.word_list, %struct.word_list* %30, i32 0, i32 1
  %31 = load %struct.word_desc*, %struct.word_desc** %word34, align 4
  %flags35 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %31, i32 0, i32 1
  %32 = load i32, i32* %flags35, align 4
  %or = or i32 %32, 32
  store i32 %or, i32* %flags35, align 4
  br label %for.inc

for.inc:                                          ; preds = %if.end26, %if.then25, %if.then12, %if.then
  %33 = load %struct.word_list*, %struct.word_list** %l, align 4
  %next = getelementptr inbounds %struct.word_list, %struct.word_list* %33, i32 0, i32 0
  %34 = load %struct.word_list*, %struct.word_list** %next, align 4
  store %struct.word_list* %34, %struct.word_list** %l, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

declare %struct.word_list* @expand_words_no_vars(%struct.word_list*) #1

declare void @dispose_words(%struct.word_list*) #1

; Function Attrs: noinline nounwind
define void @assign_compound_array_list(%struct.variable* %var, %struct.word_list* %nlist, i32 %flags) #0 {
entry:
  %var.addr = alloca %struct.variable*, align 4
  %nlist.addr = alloca %struct.word_list*, align 4
  %flags.addr = alloca i32, align 4
  %a = alloca %struct.array*, align 4
  %h = alloca %struct.hash_table*, align 4
  %list = alloca %struct.word_list*, align 4
  %w = alloca i8*, align 4
  %val = alloca i8*, align 4
  %nval = alloca i8*, align 4
  %savecmd = alloca i8*, align 4
  %len = alloca i32, align 4
  %iflags = alloca i32, align 4
  %free_val = alloca i32, align 4
  %ind = alloca i64, align 8
  %last_ind = alloca i64, align 8
  %akey = alloca i8*, align 4
  store %struct.variable* %var, %struct.variable** %var.addr, align 4
  store %struct.word_list* %nlist, %struct.word_list** %nlist.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %0 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %tobool = icmp ne %struct.variable* %0, null
  br i1 %tobool, label %land.lhs.true, label %cond.false

land.lhs.true:                                    ; preds = %entry
  %1 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %1, i32 0, i32 5
  %2 = load i32, i32* %attributes, align 4
  %and = and i32 %2, 4
  %tobool1 = icmp ne i32 %and, 0
  br i1 %tobool1, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true
  %3 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %value = getelementptr inbounds %struct.variable, %struct.variable* %3, i32 0, i32 1
  %4 = load i8*, i8** %value, align 4
  %5 = bitcast i8* %4 to %struct.array*
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true, %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi %struct.array* [ %5, %cond.true ], [ null, %cond.false ]
  store %struct.array* %cond, %struct.array** %a, align 4
  %6 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %tobool2 = icmp ne %struct.variable* %6, null
  br i1 %tobool2, label %land.lhs.true3, label %cond.false9

land.lhs.true3:                                   ; preds = %cond.end
  %7 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %attributes4 = getelementptr inbounds %struct.variable, %struct.variable* %7, i32 0, i32 5
  %8 = load i32, i32* %attributes4, align 4
  %and5 = and i32 %8, 64
  %tobool6 = icmp ne i32 %and5, 0
  br i1 %tobool6, label %cond.true7, label %cond.false9

cond.true7:                                       ; preds = %land.lhs.true3
  %9 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %value8 = getelementptr inbounds %struct.variable, %struct.variable* %9, i32 0, i32 1
  %10 = load i8*, i8** %value8, align 4
  %11 = bitcast i8* %10 to %struct.hash_table*
  br label %cond.end10

cond.false9:                                      ; preds = %land.lhs.true3, %cond.end
  br label %cond.end10

cond.end10:                                       ; preds = %cond.false9, %cond.true7
  %cond11 = phi %struct.hash_table* [ %11, %cond.true7 ], [ null, %cond.false9 ]
  store %struct.hash_table* %cond11, %struct.hash_table** %h, align 4
  store i8* null, i8** %akey, align 4
  store i64 0, i64* %ind, align 8
  %12 = load i32, i32* %flags.addr, align 4
  %and12 = and i32 %12, 1
  %cmp = icmp eq i32 %and12, 0
  br i1 %cmp, label %if.then, label %if.end26

if.then:                                          ; preds = %cond.end10
  %13 = load %struct.array*, %struct.array** %a, align 4
  %tobool13 = icmp ne %struct.array* %13, null
  br i1 %tobool13, label %land.lhs.true14, label %if.else

land.lhs.true14:                                  ; preds = %if.then
  %14 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %attributes15 = getelementptr inbounds %struct.variable, %struct.variable* %14, i32 0, i32 5
  %15 = load i32, i32* %attributes15, align 4
  %and16 = and i32 %15, 4
  %tobool17 = icmp ne i32 %and16, 0
  br i1 %tobool17, label %if.then18, label %if.else

if.then18:                                        ; preds = %land.lhs.true14
  %16 = load %struct.array*, %struct.array** %a, align 4
  call void @array_flush(%struct.array* %16)
  br label %if.end25

if.else:                                          ; preds = %land.lhs.true14, %if.then
  %17 = load %struct.hash_table*, %struct.hash_table** %h, align 4
  %tobool19 = icmp ne %struct.hash_table* %17, null
  br i1 %tobool19, label %land.lhs.true20, label %if.end

land.lhs.true20:                                  ; preds = %if.else
  %18 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %attributes21 = getelementptr inbounds %struct.variable, %struct.variable* %18, i32 0, i32 5
  %19 = load i32, i32* %attributes21, align 4
  %and22 = and i32 %19, 64
  %tobool23 = icmp ne i32 %and22, 0
  br i1 %tobool23, label %if.then24, label %if.end

if.then24:                                        ; preds = %land.lhs.true20
  %20 = load %struct.hash_table*, %struct.hash_table** %h, align 4
  call void @assoc_flush(%struct.hash_table* %20)
  br label %if.end

if.end:                                           ; preds = %if.then24, %land.lhs.true20, %if.else
  br label %if.end25

if.end25:                                         ; preds = %if.end, %if.then18
  br label %if.end26

if.end26:                                         ; preds = %if.end25, %cond.end10
  %21 = load %struct.array*, %struct.array** %a, align 4
  %tobool27 = icmp ne %struct.array* %21, null
  br i1 %tobool27, label %land.lhs.true28, label %cond.false32

land.lhs.true28:                                  ; preds = %if.end26
  %22 = load i32, i32* %flags.addr, align 4
  %and29 = and i32 %22, 1
  %tobool30 = icmp ne i32 %and29, 0
  br i1 %tobool30, label %cond.true31, label %cond.false32

cond.true31:                                      ; preds = %land.lhs.true28
  %23 = load %struct.array*, %struct.array** %a, align 4
  %max_index = getelementptr inbounds %struct.array, %struct.array* %23, i32 0, i32 1
  %24 = load i64, i64* %max_index, align 8
  %add = add nsw i64 %24, 1
  br label %cond.end33

cond.false32:                                     ; preds = %land.lhs.true28, %if.end26
  br label %cond.end33

cond.end33:                                       ; preds = %cond.false32, %cond.true31
  %cond34 = phi i64 [ %add, %cond.true31 ], [ 0, %cond.false32 ]
  store i64 %cond34, i64* %last_ind, align 8
  %25 = load %struct.word_list*, %struct.word_list** %nlist.addr, align 4
  store %struct.word_list* %25, %struct.word_list** %list, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %cond.end33
  %26 = load %struct.word_list*, %struct.word_list** %list, align 4
  %tobool35 = icmp ne %struct.word_list* %26, null
  br i1 %tobool35, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %27 = load i32, i32* %flags.addr, align 4
  %and36 = and i32 %27, -2
  store i32 %and36, i32* %iflags, align 4
  %28 = load %struct.word_list*, %struct.word_list** %list, align 4
  %word = getelementptr inbounds %struct.word_list, %struct.word_list* %28, i32 0, i32 1
  %29 = load %struct.word_desc*, %struct.word_desc** %word, align 4
  %word37 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %29, i32 0, i32 0
  %30 = load i8*, i8** %word37, align 4
  store i8* %30, i8** %w, align 4
  %31 = load %struct.word_list*, %struct.word_list** %list, align 4
  %word38 = getelementptr inbounds %struct.word_list, %struct.word_list* %31, i32 0, i32 1
  %32 = load %struct.word_desc*, %struct.word_desc** %word38, align 4
  %flags39 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %32, i32 0, i32 1
  %33 = load i32, i32* %flags39, align 4
  %and40 = and i32 %33, 4
  %tobool41 = icmp ne i32 %and40, 0
  br i1 %tobool41, label %land.lhs.true42, label %if.else170

land.lhs.true42:                                  ; preds = %for.body
  %34 = load i8*, i8** %w, align 4
  %arrayidx = getelementptr inbounds i8, i8* %34, i32 0
  %35 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %35 to i32
  %cmp43 = icmp eq i32 %conv, 91
  br i1 %cmp43, label %if.then45, label %if.else170

if.then45:                                        ; preds = %land.lhs.true42
  %36 = load i8*, i8** %w, align 4
  %call = call i32 @skipsubscript(i8* %36, i32 0, i32 0)
  store i32 %call, i32* %len, align 4
  %37 = load i8*, i8** %w, align 4
  %38 = load i32, i32* %len, align 4
  %arrayidx46 = getelementptr inbounds i8, i8* %37, i32 %38
  %39 = load i8, i8* %arrayidx46, align 1
  %conv47 = sext i8 %39 to i32
  %cmp48 = icmp ne i32 %conv47, 93
  br i1 %cmp48, label %if.then67, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.then45
  %40 = load i8*, i8** %w, align 4
  %41 = load i32, i32* %len, align 4
  %add50 = add nsw i32 %41, 1
  %arrayidx51 = getelementptr inbounds i8, i8* %40, i32 %add50
  %42 = load i8, i8* %arrayidx51, align 1
  %conv52 = sext i8 %42 to i32
  %cmp53 = icmp ne i32 %conv52, 61
  br i1 %cmp53, label %land.lhs.true55, label %if.end84

land.lhs.true55:                                  ; preds = %lor.lhs.false
  %43 = load i8*, i8** %w, align 4
  %44 = load i32, i32* %len, align 4
  %add56 = add nsw i32 %44, 1
  %arrayidx57 = getelementptr inbounds i8, i8* %43, i32 %add56
  %45 = load i8, i8* %arrayidx57, align 1
  %conv58 = sext i8 %45 to i32
  %cmp59 = icmp ne i32 %conv58, 43
  br i1 %cmp59, label %if.then67, label %lor.lhs.false61

lor.lhs.false61:                                  ; preds = %land.lhs.true55
  %46 = load i8*, i8** %w, align 4
  %47 = load i32, i32* %len, align 4
  %add62 = add nsw i32 %47, 2
  %arrayidx63 = getelementptr inbounds i8, i8* %46, i32 %add62
  %48 = load i8, i8* %arrayidx63, align 1
  %conv64 = sext i8 %48 to i32
  %cmp65 = icmp ne i32 %conv64, 61
  br i1 %cmp65, label %if.then67, label %if.end84

if.then67:                                        ; preds = %lor.lhs.false61, %land.lhs.true55, %if.then45
  %49 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %attributes68 = getelementptr inbounds %struct.variable, %struct.variable* %49, i32 0, i32 5
  %50 = load i32, i32* %attributes68, align 4
  %and69 = and i32 %50, 64
  %tobool70 = icmp ne i32 %and69, 0
  br i1 %tobool70, label %if.then71, label %if.end72

if.then71:                                        ; preds = %if.then67
  %51 = load i8*, i8** %w, align 4
  call void @err_badarraysub(i8* %51)
  br label %for.inc

if.end72:                                         ; preds = %if.then67
  %52 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %53 = load i8*, i8** %w, align 4
  %54 = load i32, i32* %flags.addr, align 4
  %call73 = call i8* @make_variable_value(%struct.variable* %52, i8* %53, i32 %54)
  store i8* %call73, i8** %nval, align 4
  %55 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %assign_func = getelementptr inbounds %struct.variable, %struct.variable* %55, i32 0, i32 4
  %56 = load %struct.variable* (%struct.variable*, i8*, i64, i8*)*, %struct.variable* (%struct.variable*, i8*, i64, i8*)** %assign_func, align 4
  %tobool74 = icmp ne %struct.variable* (%struct.variable*, i8*, i64, i8*)* %56, null
  br i1 %tobool74, label %if.then75, label %if.else78

if.then75:                                        ; preds = %if.end72
  %57 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %assign_func76 = getelementptr inbounds %struct.variable, %struct.variable* %57, i32 0, i32 4
  %58 = load %struct.variable* (%struct.variable*, i8*, i64, i8*)*, %struct.variable* (%struct.variable*, i8*, i64, i8*)** %assign_func76, align 4
  %59 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %60 = load i8*, i8** %nval, align 4
  %61 = load i64, i64* %last_ind, align 8
  %call77 = call %struct.variable* %58(%struct.variable* %59, i8* %60, i64 %61, i8* null)
  br label %if.end80

if.else78:                                        ; preds = %if.end72
  %62 = load %struct.array*, %struct.array** %a, align 4
  %63 = load i64, i64* %last_ind, align 8
  %64 = load i8*, i8** %nval, align 4
  %call79 = call i32 @array_insert(%struct.array* %62, i64 %63, i8* %64)
  br label %if.end80

if.end80:                                         ; preds = %if.else78, %if.then75
  br label %do.body

do.body:                                          ; preds = %if.end80
  %65 = load i8*, i8** %nval, align 4
  %tobool81 = icmp ne i8* %65, null
  br i1 %tobool81, label %if.then82, label %if.end83

if.then82:                                        ; preds = %do.body
  %66 = load i8*, i8** %nval, align 4
  call void @sh_xfree(i8* %66, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 563)
  br label %if.end83

if.end83:                                         ; preds = %if.then82, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end83
  %67 = load i64, i64* %last_ind, align 8
  %inc = add nsw i64 %67, 1
  store i64 %inc, i64* %last_ind, align 8
  br label %for.inc

if.end84:                                         ; preds = %lor.lhs.false61, %lor.lhs.false
  %68 = load i32, i32* %len, align 4
  %cmp85 = icmp eq i32 %68, 1
  br i1 %cmp85, label %if.then87, label %if.end88

if.then87:                                        ; preds = %if.end84
  %69 = load i8*, i8** %w, align 4
  call void @err_badarraysub(i8* %69)
  br label %for.inc

if.end88:                                         ; preds = %if.end84
  %70 = load i8*, i8** %w, align 4
  %arrayidx89 = getelementptr inbounds i8, i8* %70, i32 1
  %71 = load i8, i8* %arrayidx89, align 1
  %conv90 = sext i8 %71 to i32
  %cmp91 = icmp eq i32 %conv90, 64
  br i1 %cmp91, label %land.lhs.true98, label %lor.lhs.false93

lor.lhs.false93:                                  ; preds = %if.end88
  %72 = load i8*, i8** %w, align 4
  %arrayidx94 = getelementptr inbounds i8, i8* %72, i32 1
  %73 = load i8, i8* %arrayidx94, align 1
  %conv95 = sext i8 %73 to i32
  %cmp96 = icmp eq i32 %conv95, 42
  br i1 %cmp96, label %land.lhs.true98, label %if.end110

land.lhs.true98:                                  ; preds = %lor.lhs.false93, %if.end88
  %74 = load i32, i32* %len, align 4
  %cmp99 = icmp eq i32 %74, 2
  br i1 %cmp99, label %if.then101, label %if.end110

if.then101:                                       ; preds = %land.lhs.true98
  store i32 1, i32* @last_command_exit_value, align 4
  %75 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %attributes102 = getelementptr inbounds %struct.variable, %struct.variable* %75, i32 0, i32 5
  %76 = load i32, i32* %attributes102, align 4
  %and103 = and i32 %76, 64
  %tobool104 = icmp ne i32 %and103, 0
  br i1 %tobool104, label %if.then105, label %if.else107

if.then105:                                       ; preds = %if.then101
  %call106 = call i8* @libintl_gettext(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.6, i32 0, i32 0))
  %77 = load i8*, i8** %w, align 4
  call void (i8*, ...) @report_error(i8* %call106, i8* %77)
  br label %if.end109

if.else107:                                       ; preds = %if.then101
  %call108 = call i8* @libintl_gettext(i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str.7, i32 0, i32 0))
  %78 = load i8*, i8** %w, align 4
  call void (i8*, ...) @report_error(i8* %call108, i8* %78)
  br label %if.end109

if.end109:                                        ; preds = %if.else107, %if.then105
  br label %for.inc

if.end110:                                        ; preds = %land.lhs.true98, %lor.lhs.false93
  %79 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %attributes111 = getelementptr inbounds %struct.variable, %struct.variable* %79, i32 0, i32 5
  %80 = load i32, i32* %attributes111, align 4
  %and112 = and i32 %80, 4
  %tobool113 = icmp ne i32 %and112, 0
  br i1 %tobool113, label %if.then114, label %if.else128

if.then114:                                       ; preds = %if.end110
  %81 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %82 = load i8*, i8** %w, align 4
  %add.ptr = getelementptr inbounds i8, i8* %82, i32 1
  %83 = load i32, i32* %len, align 4
  %call115 = call i64 @array_expand_index(%struct.variable* %81, i8* %add.ptr, i32 %83)
  store i64 %call115, i64* %ind, align 8
  %84 = load i64, i64* %ind, align 8
  %cmp116 = icmp slt i64 %84, 0
  br i1 %cmp116, label %if.then118, label %if.end123

if.then118:                                       ; preds = %if.then114
  %85 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %value119 = getelementptr inbounds %struct.variable, %struct.variable* %85, i32 0, i32 1
  %86 = load i8*, i8** %value119, align 4
  %87 = bitcast i8* %86 to %struct.array*
  %max_index120 = getelementptr inbounds %struct.array, %struct.array* %87, i32 0, i32 1
  %88 = load i64, i64* %max_index120, align 8
  %add121 = add nsw i64 %88, 1
  %89 = load i64, i64* %ind, align 8
  %add122 = add nsw i64 %add121, %89
  store i64 %add122, i64* %ind, align 8
  br label %if.end123

if.end123:                                        ; preds = %if.then118, %if.then114
  %90 = load i64, i64* %ind, align 8
  %cmp124 = icmp slt i64 %90, 0
  br i1 %cmp124, label %if.then126, label %if.end127

if.then126:                                       ; preds = %if.end123
  %91 = load i8*, i8** %w, align 4
  call void @err_badarraysub(i8* %91)
  br label %for.inc

if.end127:                                        ; preds = %if.end123
  %92 = load i64, i64* %ind, align 8
  store i64 %92, i64* %last_ind, align 8
  br label %if.end151

if.else128:                                       ; preds = %if.end110
  %93 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %attributes129 = getelementptr inbounds %struct.variable, %struct.variable* %93, i32 0, i32 5
  %94 = load i32, i32* %attributes129, align 4
  %and130 = and i32 %94, 64
  %tobool131 = icmp ne i32 %and130, 0
  br i1 %tobool131, label %if.then132, label %if.end150

if.then132:                                       ; preds = %if.else128
  %95 = load i8*, i8** %w, align 4
  %96 = load i32, i32* %len, align 4
  %arrayidx133 = getelementptr inbounds i8, i8* %95, i32 %96
  store i8 0, i8* %arrayidx133, align 1
  %97 = load i8*, i8** %w, align 4
  %add.ptr134 = getelementptr inbounds i8, i8* %97, i32 1
  %call135 = call i8* @expand_assignment_string_to_string(i8* %add.ptr134, i32 0)
  store i8* %call135, i8** %akey, align 4
  %98 = load i8*, i8** %w, align 4
  %99 = load i32, i32* %len, align 4
  %arrayidx136 = getelementptr inbounds i8, i8* %98, i32 %99
  store i8 93, i8* %arrayidx136, align 1
  %100 = load i8*, i8** %akey, align 4
  %cmp137 = icmp eq i8* %100, null
  br i1 %cmp137, label %if.then143, label %lor.lhs.false139

lor.lhs.false139:                                 ; preds = %if.then132
  %101 = load i8*, i8** %akey, align 4
  %102 = load i8, i8* %101, align 1
  %conv140 = sext i8 %102 to i32
  %cmp141 = icmp eq i32 %conv140, 0
  br i1 %cmp141, label %if.then143, label %if.end149

if.then143:                                       ; preds = %lor.lhs.false139, %if.then132
  %103 = load i8*, i8** %w, align 4
  call void @err_badarraysub(i8* %103)
  br label %do.body144

do.body144:                                       ; preds = %if.then143
  %104 = load i8*, i8** %akey, align 4
  %tobool145 = icmp ne i8* %104, null
  br i1 %tobool145, label %if.then146, label %if.end147

if.then146:                                       ; preds = %do.body144
  %105 = load i8*, i8** %akey, align 4
  call void @sh_xfree(i8* %105, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 608)
  br label %if.end147

if.end147:                                        ; preds = %if.then146, %do.body144
  br label %do.end148

do.end148:                                        ; preds = %if.end147
  br label %for.inc

if.end149:                                        ; preds = %lor.lhs.false139
  br label %if.end150

if.end150:                                        ; preds = %if.end149, %if.else128
  br label %if.end151

if.end151:                                        ; preds = %if.end150, %if.end127
  %106 = load i8*, i8** %w, align 4
  %107 = load i32, i32* %len, align 4
  %add152 = add nsw i32 %107, 1
  %arrayidx153 = getelementptr inbounds i8, i8* %106, i32 %add152
  %108 = load i8, i8* %arrayidx153, align 1
  %conv154 = sext i8 %108 to i32
  %cmp155 = icmp eq i32 %conv154, 43
  br i1 %cmp155, label %land.lhs.true157, label %if.else166

land.lhs.true157:                                 ; preds = %if.end151
  %109 = load i8*, i8** %w, align 4
  %110 = load i32, i32* %len, align 4
  %add158 = add nsw i32 %110, 2
  %arrayidx159 = getelementptr inbounds i8, i8* %109, i32 %add158
  %111 = load i8, i8* %arrayidx159, align 1
  %conv160 = sext i8 %111 to i32
  %cmp161 = icmp eq i32 %conv160, 61
  br i1 %cmp161, label %if.then163, label %if.else166

if.then163:                                       ; preds = %land.lhs.true157
  %112 = load i32, i32* %iflags, align 4
  %or = or i32 %112, 1
  store i32 %or, i32* %iflags, align 4
  %113 = load i8*, i8** %w, align 4
  %114 = load i32, i32* %len, align 4
  %add.ptr164 = getelementptr inbounds i8, i8* %113, i32 %114
  %add.ptr165 = getelementptr inbounds i8, i8* %add.ptr164, i32 3
  store i8* %add.ptr165, i8** %val, align 4
  br label %if.end169

if.else166:                                       ; preds = %land.lhs.true157, %if.end151
  %115 = load i8*, i8** %w, align 4
  %116 = load i32, i32* %len, align 4
  %add.ptr167 = getelementptr inbounds i8, i8* %115, i32 %116
  %add.ptr168 = getelementptr inbounds i8, i8* %add.ptr167, i32 2
  store i8* %add.ptr168, i8** %val, align 4
  br label %if.end169

if.end169:                                        ; preds = %if.else166, %if.then163
  br label %if.end178

if.else170:                                       ; preds = %land.lhs.true42, %for.body
  %117 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %attributes171 = getelementptr inbounds %struct.variable, %struct.variable* %117, i32 0, i32 5
  %118 = load i32, i32* %attributes171, align 4
  %and172 = and i32 %118, 64
  %tobool173 = icmp ne i32 %and172, 0
  br i1 %tobool173, label %if.then174, label %if.else176

if.then174:                                       ; preds = %if.else170
  store i32 1, i32* @last_command_exit_value, align 4
  %call175 = call i8* @libintl_gettext(i8* getelementptr inbounds ([60 x i8], [60 x i8]* @.str.8, i32 0, i32 0))
  %119 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %name = getelementptr inbounds %struct.variable, %struct.variable* %119, i32 0, i32 0
  %120 = load i8*, i8** %name, align 4
  %121 = load i8*, i8** %w, align 4
  call void (i8*, ...) @report_error(i8* %call175, i8* %120, i8* %121)
  br label %for.inc

if.else176:                                       ; preds = %if.else170
  %122 = load i64, i64* %last_ind, align 8
  store i64 %122, i64* %ind, align 8
  %123 = load i8*, i8** %w, align 4
  store i8* %123, i8** %val, align 4
  br label %if.end177

if.end177:                                        ; preds = %if.else176
  br label %if.end178

if.end178:                                        ; preds = %if.end177, %if.end169
  store i32 0, i32* %free_val, align 4
  %124 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %attributes179 = getelementptr inbounds %struct.variable, %struct.variable* %124, i32 0, i32 5
  %125 = load i32, i32* %attributes179, align 4
  %and180 = and i32 %125, 64
  %tobool181 = icmp ne i32 %and180, 0
  br i1 %tobool181, label %if.then182, label %if.end190

if.then182:                                       ; preds = %if.end178
  %126 = load i8*, i8** %val, align 4
  %call183 = call i8* @expand_assignment_string_to_string(i8* %126, i32 0)
  store i8* %call183, i8** %val, align 4
  %127 = load i8*, i8** %val, align 4
  %cmp184 = icmp eq i8* %127, null
  br i1 %cmp184, label %if.then186, label %if.end189

if.then186:                                       ; preds = %if.then182
  %call187 = call i8* @sh_xmalloc(i32 1, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 641)
  store i8* %call187, i8** %val, align 4
  %128 = load i8*, i8** %val, align 4
  %arrayidx188 = getelementptr inbounds i8, i8* %128, i32 0
  store i8 0, i8* %arrayidx188, align 1
  br label %if.end189

if.end189:                                        ; preds = %if.then186, %if.then182
  store i32 1, i32* %free_val, align 4
  br label %if.end190

if.end190:                                        ; preds = %if.end189, %if.end178
  %129 = load i8*, i8** @this_command_name, align 4
  store i8* %129, i8** %savecmd, align 4
  %130 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %attributes191 = getelementptr inbounds %struct.variable, %struct.variable* %130, i32 0, i32 5
  %131 = load i32, i32* %attributes191, align 4
  %and192 = and i32 %131, 16
  %tobool193 = icmp ne i32 %and192, 0
  br i1 %tobool193, label %if.then194, label %if.end195

if.then194:                                       ; preds = %if.end190
  store i8* null, i8** @this_command_name, align 4
  br label %if.end195

if.end195:                                        ; preds = %if.then194, %if.end190
  %132 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %133 = load i64, i64* %ind, align 8
  %134 = load i8*, i8** %akey, align 4
  %135 = load i8*, i8** %val, align 4
  %136 = load i32, i32* %iflags, align 4
  %call196 = call %struct.variable* @bind_array_var_internal(%struct.variable* %132, i64 %133, i8* %134, i8* %135, i32 %136)
  %137 = load i64, i64* %last_ind, align 8
  %inc197 = add nsw i64 %137, 1
  store i64 %inc197, i64* %last_ind, align 8
  %138 = load i8*, i8** %savecmd, align 4
  store i8* %138, i8** @this_command_name, align 4
  %139 = load i32, i32* %free_val, align 4
  %tobool198 = icmp ne i32 %139, 0
  br i1 %tobool198, label %if.then199, label %if.end200

if.then199:                                       ; preds = %if.end195
  %140 = load i8*, i8** %val, align 4
  call void @sh_xfree(i8* %140, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 655)
  br label %if.end200

if.end200:                                        ; preds = %if.then199, %if.end195
  br label %for.inc

for.inc:                                          ; preds = %if.end200, %if.then174, %do.end148, %if.then126, %if.end109, %if.then87, %do.end, %if.then71
  %141 = load %struct.word_list*, %struct.word_list** %list, align 4
  %next = getelementptr inbounds %struct.word_list, %struct.word_list* %141, i32 0, i32 0
  %142 = load %struct.word_list*, %struct.word_list** %next, align 4
  store %struct.word_list* %142, %struct.word_list** %list, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

declare void @array_flush(%struct.array*) #1

declare void @assoc_flush(%struct.hash_table*) #1

declare i32 @skipsubscript(i8*, i32, i32) #1

; Function Attrs: noinline nounwind
define i64 @array_expand_index(%struct.variable* %var, i8* %s, i32 %len) #0 {
entry:
  %retval = alloca i64, align 8
  %var.addr = alloca %struct.variable*, align 4
  %s.addr = alloca i8*, align 4
  %len.addr = alloca i32, align 4
  %exp = alloca i8*, align 4
  %t = alloca i8*, align 4
  %savecmd = alloca i8*, align 4
  %expok = alloca i32, align 4
  %val = alloca i64, align 8
  store %struct.variable* %var, %struct.variable** %var.addr, align 4
  store i8* %s, i8** %s.addr, align 4
  store i32 %len, i32* %len.addr, align 4
  %0 = load i32, i32* %len.addr, align 4
  %call = call i8* @sh_xmalloc(i32 %0, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 923)
  store i8* %call, i8** %exp, align 4
  %1 = load i8*, i8** %exp, align 4
  %2 = load i8*, i8** %s.addr, align 4
  %3 = load i32, i32* %len.addr, align 4
  %sub = sub nsw i32 %3, 1
  %call1 = call i8* @strncpy(i8* %1, i8* %2, i32 %sub)
  %4 = load i8*, i8** %exp, align 4
  %5 = load i32, i32* %len.addr, align 4
  %sub2 = sub nsw i32 %5, 1
  %arrayidx = getelementptr inbounds i8, i8* %4, i32 %sub2
  store i8 0, i8* %arrayidx, align 1
  %6 = load i8*, i8** %exp, align 4
  %call3 = call i8* @expand_arith_string(i8* %6, i32 769)
  store i8* %call3, i8** %t, align 4
  %7 = load i8*, i8** @this_command_name, align 4
  store i8* %7, i8** %savecmd, align 4
  store i8* null, i8** @this_command_name, align 4
  %8 = load i8*, i8** %t, align 4
  %call4 = call i64 @evalexp(i8* %8, i32* %expok)
  store i64 %call4, i64* %val, align 8
  %9 = load i8*, i8** %savecmd, align 4
  store i8* %9, i8** @this_command_name, align 4
  %10 = load i8*, i8** %t, align 4
  call void @sh_xfree(i8* %10, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 931)
  %11 = load i8*, i8** %exp, align 4
  call void @sh_xfree(i8* %11, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 932)
  %12 = load i32, i32* %expok, align 4
  %cmp = icmp eq i32 %12, 0
  br i1 %cmp, label %if.then, label %if.end6

if.then:                                          ; preds = %entry
  store i32 1, i32* @last_command_exit_value, align 4
  %13 = load i32, i32* @no_longjmp_on_fatal_error, align 4
  %tobool = icmp ne i32 %13, 0
  br i1 %tobool, label %if.then5, label %if.end

if.then5:                                         ; preds = %if.then
  store i64 0, i64* %retval, align 8
  br label %return

if.end:                                           ; preds = %if.then
  call void @top_level_cleanup()
  call void @jump_to_top_level(i32 2) #4
  unreachable

if.end6:                                          ; preds = %entry
  %14 = load i64, i64* %val, align 8
  store i64 %14, i64* %retval, align 8
  br label %return

return:                                           ; preds = %if.end6, %if.then5
  %15 = load i64, i64* %retval, align 8
  ret i64 %15
}

declare i8* @expand_assignment_string_to_string(i8*, i32) #1

; Function Attrs: noinline nounwind
define i32 @unbind_array_element(%struct.variable* %var, i8* %sub) #0 {
entry:
  %retval = alloca i32, align 4
  %var.addr = alloca %struct.variable*, align 4
  %sub.addr = alloca i8*, align 4
  %len = alloca i32, align 4
  %ind = alloca i64, align 8
  %akey = alloca i8*, align 4
  %ae = alloca %struct.array_element*, align 4
  store %struct.variable* %var, %struct.variable** %var.addr, align 4
  store i8* %sub, i8** %sub.addr, align 4
  %0 = load i8*, i8** %sub.addr, align 4
  %1 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %tobool = icmp ne %struct.variable* %1, null
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %entry
  %2 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %2, i32 0, i32 5
  %3 = load i32, i32* %attributes, align 4
  %and = and i32 %3, 64
  %tobool1 = icmp ne i32 %and, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %4 = phi i1 [ false, %entry ], [ %tobool1, %land.rhs ]
  %land.ext = zext i1 %4 to i32
  %call = call i32 @skipsubscript(i8* %0, i32 0, i32 %land.ext)
  store i32 %call, i32* %len, align 4
  %5 = load i8*, i8** %sub.addr, align 4
  %6 = load i32, i32* %len, align 4
  %arrayidx = getelementptr inbounds i8, i8* %5, i32 %6
  %7 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %7 to i32
  %cmp = icmp ne i32 %conv, 93
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.end
  %8 = load i32, i32* %len, align 4
  %cmp3 = icmp eq i32 %8, 0
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %land.end
  %9 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %name = getelementptr inbounds %struct.variable, %struct.variable* %9, i32 0, i32 0
  %10 = load i8*, i8** %name, align 4
  %11 = load i8*, i8** %sub.addr, align 4
  %call5 = call i8* @libintl_gettext(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str, i32 0, i32 0))
  call void (i8*, ...) @builtin_error(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.9, i32 0, i32 0), i8* %10, i8* %11, i8* %call5)
  store i32 -1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %12 = load i8*, i8** %sub.addr, align 4
  %13 = load i32, i32* %len, align 4
  %arrayidx6 = getelementptr inbounds i8, i8* %12, i32 %13
  store i8 0, i8* %arrayidx6, align 1
  %14 = load i8*, i8** %sub.addr, align 4
  %arrayidx7 = getelementptr inbounds i8, i8* %14, i32 0
  %15 = load i8, i8* %arrayidx7, align 1
  %conv8 = sext i8 %15 to i32
  %cmp9 = icmp eq i32 %conv8, 64
  br i1 %cmp9, label %land.lhs.true, label %lor.lhs.false11

lor.lhs.false11:                                  ; preds = %if.end
  %16 = load i8*, i8** %sub.addr, align 4
  %arrayidx12 = getelementptr inbounds i8, i8* %16, i32 0
  %17 = load i8, i8* %arrayidx12, align 1
  %conv13 = sext i8 %17 to i32
  %cmp14 = icmp eq i32 %conv13, 42
  br i1 %cmp14, label %land.lhs.true, label %if.end31

land.lhs.true:                                    ; preds = %lor.lhs.false11, %if.end
  %18 = load i8*, i8** %sub.addr, align 4
  %arrayidx16 = getelementptr inbounds i8, i8* %18, i32 1
  %19 = load i8, i8* %arrayidx16, align 1
  %conv17 = sext i8 %19 to i32
  %cmp18 = icmp eq i32 %conv17, 0
  br i1 %cmp18, label %if.then20, label %if.end31

if.then20:                                        ; preds = %land.lhs.true
  %20 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %attributes21 = getelementptr inbounds %struct.variable, %struct.variable* %20, i32 0, i32 5
  %21 = load i32, i32* %attributes21, align 4
  %and22 = and i32 %21, 4
  %tobool23 = icmp ne i32 %and22, 0
  br i1 %tobool23, label %if.then28, label %lor.lhs.false24

lor.lhs.false24:                                  ; preds = %if.then20
  %22 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %attributes25 = getelementptr inbounds %struct.variable, %struct.variable* %22, i32 0, i32 5
  %23 = load i32, i32* %attributes25, align 4
  %and26 = and i32 %23, 64
  %tobool27 = icmp ne i32 %and26, 0
  br i1 %tobool27, label %if.then28, label %if.else

if.then28:                                        ; preds = %lor.lhs.false24, %if.then20
  %24 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %name29 = getelementptr inbounds %struct.variable, %struct.variable* %24, i32 0, i32 0
  %25 = load i8*, i8** %name29, align 4
  %call30 = call i32 @unbind_variable(i8* %25)
  store i32 0, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %lor.lhs.false24
  store i32 -2, i32* %retval, align 4
  br label %return

if.end31:                                         ; preds = %land.lhs.true, %lor.lhs.false11
  %26 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %attributes32 = getelementptr inbounds %struct.variable, %struct.variable* %26, i32 0, i32 5
  %27 = load i32, i32* %attributes32, align 4
  %and33 = and i32 %27, 64
  %tobool34 = icmp ne i32 %and33, 0
  br i1 %tobool34, label %if.then35, label %if.else49

if.then35:                                        ; preds = %if.end31
  %28 = load i8*, i8** %sub.addr, align 4
  %call36 = call i8* @expand_assignment_string_to_string(i8* %28, i32 0)
  store i8* %call36, i8** %akey, align 4
  %29 = load i8*, i8** %akey, align 4
  %cmp37 = icmp eq i8* %29, null
  br i1 %cmp37, label %if.then43, label %lor.lhs.false39

lor.lhs.false39:                                  ; preds = %if.then35
  %30 = load i8*, i8** %akey, align 4
  %31 = load i8, i8* %30, align 1
  %conv40 = sext i8 %31 to i32
  %cmp41 = icmp eq i32 %conv40, 0
  br i1 %cmp41, label %if.then43, label %if.end48

if.then43:                                        ; preds = %lor.lhs.false39, %if.then35
  %32 = load i8*, i8** %sub.addr, align 4
  %call44 = call i8* @libintl_gettext(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str, i32 0, i32 0))
  call void (i8*, ...) @builtin_error(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.10, i32 0, i32 0), i8* %32, i8* %call44)
  br label %do.body

do.body:                                          ; preds = %if.then43
  %33 = load i8*, i8** %akey, align 4
  %tobool45 = icmp ne i8* %33, null
  br i1 %tobool45, label %if.then46, label %if.end47

if.then46:                                        ; preds = %do.body
  %34 = load i8*, i8** %akey, align 4
  call void @sh_xfree(i8* %34, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 797)
  br label %if.end47

if.end47:                                         ; preds = %if.then46, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end47
  store i32 -1, i32* %retval, align 4
  br label %return

if.end48:                                         ; preds = %lor.lhs.false39
  %35 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %value = getelementptr inbounds %struct.variable, %struct.variable* %35, i32 0, i32 1
  %36 = load i8*, i8** %value, align 4
  %37 = bitcast i8* %36 to %struct.hash_table*
  %38 = load i8*, i8** %akey, align 4
  call void @assoc_remove(%struct.hash_table* %37, i8* %38)
  %39 = load i8*, i8** %akey, align 4
  call void @sh_xfree(i8* %39, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 801)
  br label %if.end82

if.else49:                                        ; preds = %if.end31
  %40 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %attributes50 = getelementptr inbounds %struct.variable, %struct.variable* %40, i32 0, i32 5
  %41 = load i32, i32* %attributes50, align 4
  %and51 = and i32 %41, 4
  %tobool52 = icmp ne i32 %and51, 0
  br i1 %tobool52, label %if.then53, label %if.else72

if.then53:                                        ; preds = %if.else49
  %42 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %43 = load i8*, i8** %sub.addr, align 4
  %44 = load i32, i32* %len, align 4
  %add = add nsw i32 %44, 1
  %call54 = call i64 @array_expand_index(%struct.variable* %42, i8* %43, i32 %add)
  store i64 %call54, i64* %ind, align 8
  %45 = load i64, i64* %ind, align 8
  %cmp55 = icmp slt i64 %45, 0
  br i1 %cmp55, label %if.then57, label %if.end61

if.then57:                                        ; preds = %if.then53
  %46 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %value58 = getelementptr inbounds %struct.variable, %struct.variable* %46, i32 0, i32 1
  %47 = load i8*, i8** %value58, align 4
  %48 = bitcast i8* %47 to %struct.array*
  %max_index = getelementptr inbounds %struct.array, %struct.array* %48, i32 0, i32 1
  %49 = load i64, i64* %max_index, align 8
  %add59 = add nsw i64 %49, 1
  %50 = load i64, i64* %ind, align 8
  %add60 = add nsw i64 %add59, %50
  store i64 %add60, i64* %ind, align 8
  br label %if.end61

if.end61:                                         ; preds = %if.then57, %if.then53
  %51 = load i64, i64* %ind, align 8
  %cmp62 = icmp slt i64 %51, 0
  br i1 %cmp62, label %if.then64, label %if.end66

if.then64:                                        ; preds = %if.end61
  %52 = load i8*, i8** %sub.addr, align 4
  %call65 = call i8* @libintl_gettext(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str, i32 0, i32 0))
  call void (i8*, ...) @builtin_error(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.10, i32 0, i32 0), i8* %52, i8* %call65)
  store i32 -1, i32* %retval, align 4
  br label %return

if.end66:                                         ; preds = %if.end61
  %53 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %value67 = getelementptr inbounds %struct.variable, %struct.variable* %53, i32 0, i32 1
  %54 = load i8*, i8** %value67, align 4
  %55 = bitcast i8* %54 to %struct.array*
  %56 = load i64, i64* %ind, align 8
  %call68 = call %struct.array_element* @array_remove(%struct.array* %55, i64 %56)
  store %struct.array_element* %call68, %struct.array_element** %ae, align 4
  %57 = load %struct.array_element*, %struct.array_element** %ae, align 4
  %tobool69 = icmp ne %struct.array_element* %57, null
  br i1 %tobool69, label %if.then70, label %if.end71

if.then70:                                        ; preds = %if.end66
  %58 = load %struct.array_element*, %struct.array_element** %ae, align 4
  call void @array_dispose_element(%struct.array_element* %58)
  br label %if.end71

if.end71:                                         ; preds = %if.then70, %if.end66
  br label %if.end81

if.else72:                                        ; preds = %if.else49
  %59 = load i8*, i8** @this_command_name, align 4
  store i8* %59, i8** %akey, align 4
  %60 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %61 = load i8*, i8** %sub.addr, align 4
  %62 = load i32, i32* %len, align 4
  %add73 = add nsw i32 %62, 1
  %call74 = call i64 @array_expand_index(%struct.variable* %60, i8* %61, i32 %add73)
  store i64 %call74, i64* %ind, align 8
  %63 = load i8*, i8** %akey, align 4
  store i8* %63, i8** @this_command_name, align 4
  %64 = load i64, i64* %ind, align 8
  %cmp75 = icmp eq i64 %64, 0
  br i1 %cmp75, label %if.then77, label %if.else80

if.then77:                                        ; preds = %if.else72
  %65 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %name78 = getelementptr inbounds %struct.variable, %struct.variable* %65, i32 0, i32 0
  %66 = load i8*, i8** %name78, align 4
  %call79 = call i32 @unbind_variable(i8* %66)
  store i32 0, i32* %retval, align 4
  br label %return

if.else80:                                        ; preds = %if.else72
  store i32 -2, i32* %retval, align 4
  br label %return

if.end81:                                         ; preds = %if.end71
  br label %if.end82

if.end82:                                         ; preds = %if.end81, %if.end48
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end82, %if.else80, %if.then77, %if.then64, %do.end, %if.else, %if.then28, %if.then
  %67 = load i32, i32* %retval, align 4
  ret i32 %67
}

declare void @builtin_error(i8*, ...) #1

declare i32 @unbind_variable(i8*) #1

declare void @assoc_remove(%struct.hash_table*, i8*) #1

declare %struct.array_element* @array_remove(%struct.array*, i64) #1

declare void @array_dispose_element(%struct.array_element*) #1

; Function Attrs: noinline nounwind
define void @print_array_assignment(%struct.variable* %var, i32 %quoted) #0 {
entry:
  %var.addr = alloca %struct.variable*, align 4
  %quoted.addr = alloca i32, align 4
  %vstr = alloca i8*, align 4
  store %struct.variable* %var, %struct.variable** %var.addr, align 4
  store i32 %quoted, i32* %quoted.addr, align 4
  %0 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %value = getelementptr inbounds %struct.variable, %struct.variable* %0, i32 0, i32 1
  %1 = load i8*, i8** %value, align 4
  %2 = bitcast i8* %1 to %struct.array*
  %3 = load i32, i32* %quoted.addr, align 4
  %call = call i8* @array_to_assign(%struct.array* %2, i32 %3)
  store i8* %call, i8** %vstr, align 4
  %4 = load i8*, i8** %vstr, align 4
  %cmp = icmp eq i8* %4, null
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %5 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %name = getelementptr inbounds %struct.variable, %struct.variable* %5, i32 0, i32 0
  %6 = load i8*, i8** %name, align 4
  %7 = load i32, i32* %quoted.addr, align 4
  %tobool = icmp ne i32 %7, 0
  %cond = select i1 %tobool, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.12, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.13, i32 0, i32 0)
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.11, i32 0, i32 0), i8* %6, i8* %cond)
  br label %if.end

if.else:                                          ; preds = %entry
  %8 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %name2 = getelementptr inbounds %struct.variable, %struct.variable* %8, i32 0, i32 0
  %9 = load i8*, i8** %name2, align 4
  %10 = load i8*, i8** %vstr, align 4
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.11, i32 0, i32 0), i8* %9, i8* %10)
  %11 = load i8*, i8** %vstr, align 4
  call void @sh_xfree(i8* %11, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 851)
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void
}

declare i8* @array_to_assign(%struct.array*, i32) #1

declare i32 @printf(i8*, ...) #1

; Function Attrs: noinline nounwind
define void @print_assoc_assignment(%struct.variable* %var, i32 %quoted) #0 {
entry:
  %var.addr = alloca %struct.variable*, align 4
  %quoted.addr = alloca i32, align 4
  %vstr = alloca i8*, align 4
  store %struct.variable* %var, %struct.variable** %var.addr, align 4
  store i32 %quoted, i32* %quoted.addr, align 4
  %0 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %value = getelementptr inbounds %struct.variable, %struct.variable* %0, i32 0, i32 1
  %1 = load i8*, i8** %value, align 4
  %2 = bitcast i8* %1 to %struct.hash_table*
  %3 = load i32, i32* %quoted.addr, align 4
  %call = call i8* @assoc_to_assign(%struct.hash_table* %2, i32 %3)
  store i8* %call, i8** %vstr, align 4
  %4 = load i8*, i8** %vstr, align 4
  %cmp = icmp eq i8* %4, null
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %5 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %name = getelementptr inbounds %struct.variable, %struct.variable* %5, i32 0, i32 0
  %6 = load i8*, i8** %name, align 4
  %7 = load i32, i32* %quoted.addr, align 4
  %tobool = icmp ne i32 %7, 0
  %cond = select i1 %tobool, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.12, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.13, i32 0, i32 0)
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.11, i32 0, i32 0), i8* %6, i8* %cond)
  br label %if.end

if.else:                                          ; preds = %entry
  %8 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %name2 = getelementptr inbounds %struct.variable, %struct.variable* %8, i32 0, i32 0
  %9 = load i8*, i8** %name2, align 4
  %10 = load i8*, i8** %vstr, align 4
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.11, i32 0, i32 0), i8* %9, i8* %10)
  %11 = load i8*, i8** %vstr, align 4
  call void @sh_xfree(i8* %11, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 871)
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void
}

declare i8* @assoc_to_assign(%struct.hash_table*, i32) #1

; Function Attrs: noinline nounwind
define i32 @valid_array_reference(i8* %name, i32 %flags) #0 {
entry:
  %retval = alloca i32, align 4
  %name.addr = alloca i8*, align 4
  %flags.addr = alloca i32, align 4
  %t = alloca i8*, align 4
  %r = alloca i32, align 4
  %len = alloca i32, align 4
  store i8* %name, i8** %name.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %0 = load i8*, i8** %name.addr, align 4
  %call = call i8* @mbschr(i8* %0, i32 91)
  store i8* %call, i8** %t, align 4
  %1 = load i8*, i8** %t, align 4
  %tobool = icmp ne i8* %1, null
  br i1 %tobool, label %if.then, label %if.end30

if.then:                                          ; preds = %entry
  %2 = load i8*, i8** %t, align 4
  store i8 0, i8* %2, align 1
  %3 = load i8*, i8** %name.addr, align 4
  %call1 = call i32 @legal_identifier(i8* %3)
  store i32 %call1, i32* %r, align 4
  %4 = load i8*, i8** %t, align 4
  store i8 91, i8* %4, align 1
  %5 = load i32, i32* %r, align 4
  %cmp = icmp eq i32 %5, 0
  br i1 %cmp, label %if.then2, label %if.end

if.then2:                                         ; preds = %if.then
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %if.then
  %6 = load i8*, i8** %t, align 4
  %call3 = call i32 @skipsubscript(i8* %6, i32 0, i32 0)
  store i32 %call3, i32* %len, align 4
  %7 = load i8*, i8** %t, align 4
  %8 = load i32, i32* %len, align 4
  %arrayidx = getelementptr inbounds i8, i8* %7, i32 %8
  %9 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %9 to i32
  %cmp4 = icmp ne i32 %conv, 93
  br i1 %cmp4, label %if.then8, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end
  %10 = load i32, i32* %len, align 4
  %cmp6 = icmp eq i32 %10, 1
  br i1 %cmp6, label %if.then8, label %if.end9

if.then8:                                         ; preds = %lor.lhs.false, %if.end
  store i32 0, i32* %retval, align 4
  br label %return

if.end9:                                          ; preds = %lor.lhs.false
  %11 = load i8*, i8** %t, align 4
  %12 = load i32, i32* %len, align 4
  %add = add nsw i32 %12, 1
  %arrayidx10 = getelementptr inbounds i8, i8* %11, i32 %add
  %13 = load i8, i8* %arrayidx10, align 1
  %conv11 = sext i8 %13 to i32
  %cmp12 = icmp ne i32 %conv11, 0
  br i1 %cmp12, label %if.then14, label %if.end15

if.then14:                                        ; preds = %if.end9
  store i32 0, i32* %retval, align 4
  br label %return

if.end15:                                         ; preds = %if.end9
  store i32 1, i32* %r, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end15
  %14 = load i32, i32* %r, align 4
  %15 = load i32, i32* %len, align 4
  %cmp16 = icmp slt i32 %14, %15
  br i1 %cmp16, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %16 = load i8*, i8** %t, align 4
  %17 = load i32, i32* %r, align 4
  %arrayidx18 = getelementptr inbounds i8, i8* %16, i32 %17
  %18 = load i8, i8* %arrayidx18, align 1
  %conv19 = sext i8 %18 to i32
  %cmp20 = icmp eq i32 %conv19, 32
  br i1 %cmp20, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %for.body
  %19 = load i8*, i8** %t, align 4
  %20 = load i32, i32* %r, align 4
  %arrayidx22 = getelementptr inbounds i8, i8* %19, i32 %20
  %21 = load i8, i8* %arrayidx22, align 1
  %conv23 = sext i8 %21 to i32
  %cmp24 = icmp eq i32 %conv23, 9
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %for.body
  %22 = phi i1 [ true, %for.body ], [ %cmp24, %lor.rhs ]
  %lor.ext = zext i1 %22 to i32
  %cmp26 = icmp eq i32 %lor.ext, 0
  br i1 %cmp26, label %if.then28, label %if.end29

if.then28:                                        ; preds = %lor.end
  store i32 1, i32* %retval, align 4
  br label %return

if.end29:                                         ; preds = %lor.end
  br label %for.inc

for.inc:                                          ; preds = %if.end29
  %23 = load i32, i32* %r, align 4
  %inc = add nsw i32 %23, 1
  store i32 %inc, i32* %r, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %retval, align 4
  br label %return

if.end30:                                         ; preds = %entry
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end30, %for.end, %if.then28, %if.then14, %if.then8, %if.then2
  %24 = load i32, i32* %retval, align 4
  ret i32 %24
}

declare i8* @mbschr(i8*, i32) #1

declare i32 @legal_identifier(i8*) #1

declare i8* @strncpy(i8*, i8*, i32) #1

declare i8* @expand_arith_string(i8*, i32) #1

declare i64 @evalexp(i8*, i32*) #1

declare void @top_level_cleanup() #1

; Function Attrs: noreturn
declare void @jump_to_top_level(i32) #2

; Function Attrs: noinline nounwind
define %struct.variable* @array_variable_part(i8* %s, i8** %subp, i32* %lenp) #0 {
entry:
  %retval = alloca %struct.variable*, align 4
  %s.addr = alloca i8*, align 4
  %subp.addr = alloca i8**, align 4
  %lenp.addr = alloca i32*, align 4
  %t = alloca i8*, align 4
  %var = alloca %struct.variable*, align 4
  store i8* %s, i8** %s.addr, align 4
  store i8** %subp, i8*** %subp.addr, align 4
  store i32* %lenp, i32** %lenp.addr, align 4
  %0 = load i8*, i8** %s.addr, align 4
  %1 = load i8**, i8*** %subp.addr, align 4
  %2 = load i32*, i32** %lenp.addr, align 4
  %call = call i8* @array_variable_name(i8* %0, i8** %1, i32* %2)
  store i8* %call, i8** %t, align 4
  %3 = load i8*, i8** %t, align 4
  %cmp = icmp eq i8* %3, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store %struct.variable* null, %struct.variable** %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %4 = load i8*, i8** %t, align 4
  %call1 = call %struct.variable* @find_variable(i8* %4)
  store %struct.variable* %call1, %struct.variable** %var, align 4
  %5 = load i8*, i8** %t, align 4
  call void @sh_xfree(i8* %5, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 1008)
  %6 = load %struct.variable*, %struct.variable** %var, align 4
  store %struct.variable* %6, %struct.variable** %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %7 = load %struct.variable*, %struct.variable** %retval, align 4
  ret %struct.variable* %7
}

; Function Attrs: noinline nounwind
define i8* @array_value(i8* %s, i32 %quoted, i32 %flags, i32* %rtype, i64* %indp) #0 {
entry:
  %s.addr = alloca i8*, align 4
  %quoted.addr = alloca i32, align 4
  %flags.addr = alloca i32, align 4
  %rtype.addr = alloca i32*, align 4
  %indp.addr = alloca i64*, align 4
  store i8* %s, i8** %s.addr, align 4
  store i32 %quoted, i32* %quoted.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  store i32* %rtype, i32** %rtype.addr, align 4
  store i64* %indp, i64** %indp.addr, align 4
  %0 = load i8*, i8** %s.addr, align 4
  %1 = load i32, i32* %quoted.addr, align 4
  %2 = load i32, i32* %flags.addr, align 4
  %or = or i32 %2, 1
  %3 = load i32*, i32** %rtype.addr, align 4
  %4 = load i64*, i64** %indp.addr, align 4
  %call = call i8* @array_value_internal(i8* %0, i32 %1, i32 %or, i32* %3, i64* %4)
  ret i8* %call
}

; Function Attrs: noinline nounwind
define internal i8* @array_value_internal(i8* %s, i32 %quoted, i32 %flags, i32* %rtype, i64* %indp) #0 {
entry:
  %retval = alloca i8*, align 4
  %s.addr = alloca i8*, align 4
  %quoted.addr = alloca i32, align 4
  %flags.addr = alloca i32, align 4
  %rtype.addr = alloca i32*, align 4
  %indp.addr = alloca i64*, align 4
  %len = alloca i32, align 4
  %ind = alloca i64, align 8
  %akey = alloca i8*, align 4
  %retval1 = alloca i8*, align 4
  %t = alloca i8*, align 4
  %temp = alloca i8*, align 4
  %l = alloca %struct.word_list*, align 4
  %var = alloca %struct.variable*, align 4
  store i8* %s, i8** %s.addr, align 4
  store i32 %quoted, i32* %quoted.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  store i32* %rtype, i32** %rtype.addr, align 4
  store i64* %indp, i64** %indp.addr, align 4
  %0 = load i8*, i8** %s.addr, align 4
  %call = call %struct.variable* @array_variable_part(i8* %0, i8** %t, i32* %len)
  store %struct.variable* %call, %struct.variable** %var, align 4
  %1 = load i32, i32* %len, align 4
  %cmp = icmp eq i32 %1, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i8* null, i8** %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  store i8* null, i8** %akey, align 4
  %2 = load i8*, i8** %t, align 4
  %arrayidx = getelementptr inbounds i8, i8* %2, i32 0
  %3 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %3 to i32
  %cmp2 = icmp eq i32 %conv, 64
  br i1 %cmp2, label %land.lhs.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end
  %4 = load i8*, i8** %t, align 4
  %arrayidx4 = getelementptr inbounds i8, i8* %4, i32 0
  %5 = load i8, i8* %arrayidx4, align 1
  %conv5 = sext i8 %5 to i32
  %cmp6 = icmp eq i32 %conv5, 42
  br i1 %cmp6, label %land.lhs.true, label %if.else79

land.lhs.true:                                    ; preds = %lor.lhs.false, %if.end
  %6 = load i8*, i8** %t, align 4
  %arrayidx8 = getelementptr inbounds i8, i8* %6, i32 1
  %7 = load i8, i8* %arrayidx8, align 1
  %conv9 = sext i8 %7 to i32
  %cmp10 = icmp eq i32 %conv9, 93
  br i1 %cmp10, label %if.then12, label %if.else79

if.then12:                                        ; preds = %land.lhs.true
  %8 = load i32*, i32** %rtype.addr, align 4
  %tobool = icmp ne i32* %8, null
  br i1 %tobool, label %if.then13, label %if.end18

if.then13:                                        ; preds = %if.then12
  %9 = load i8*, i8** %t, align 4
  %arrayidx14 = getelementptr inbounds i8, i8* %9, i32 0
  %10 = load i8, i8* %arrayidx14, align 1
  %conv15 = sext i8 %10 to i32
  %cmp16 = icmp eq i32 %conv15, 42
  %cond = select i1 %cmp16, i32 1, i32 2
  %11 = load i32*, i32** %rtype.addr, align 4
  store i32 %cond, i32* %11, align 4
  br label %if.end18

if.end18:                                         ; preds = %if.then13, %if.then12
  %12 = load i32, i32* %flags.addr, align 4
  %and = and i32 %12, 1
  %cmp19 = icmp eq i32 %and, 0
  br i1 %cmp19, label %if.then21, label %if.else

if.then21:                                        ; preds = %if.end18
  %13 = load i8*, i8** %s.addr, align 4
  call void @err_badarraysub(i8* %13)
  store i8* null, i8** %retval, align 4
  br label %return

if.else:                                          ; preds = %if.end18
  %14 = load %struct.variable*, %struct.variable** %var, align 4
  %cmp22 = icmp eq %struct.variable* %14, null
  br i1 %cmp22, label %if.then27, label %lor.lhs.false24

lor.lhs.false24:                                  ; preds = %if.else
  %15 = load %struct.variable*, %struct.variable** %var, align 4
  %value = getelementptr inbounds %struct.variable, %struct.variable* %15, i32 0, i32 1
  %16 = load i8*, i8** %value, align 4
  %cmp25 = icmp eq i8* %16, null
  br i1 %cmp25, label %if.then27, label %if.else28

if.then27:                                        ; preds = %lor.lhs.false24, %if.else
  store i8* null, i8** %retval, align 4
  br label %return

if.else28:                                        ; preds = %lor.lhs.false24
  %17 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %17, i32 0, i32 5
  %18 = load i32, i32* %attributes, align 4
  %and29 = and i32 %18, 4
  %cmp30 = icmp eq i32 %and29, 0
  br i1 %cmp30, label %land.lhs.true32, label %if.else41

land.lhs.true32:                                  ; preds = %if.else28
  %19 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes33 = getelementptr inbounds %struct.variable, %struct.variable* %19, i32 0, i32 5
  %20 = load i32, i32* %attributes33, align 4
  %and34 = and i32 %20, 64
  %cmp35 = icmp eq i32 %and34, 0
  br i1 %cmp35, label %if.then37, label %if.else41

if.then37:                                        ; preds = %land.lhs.true32
  %21 = load %struct.variable*, %struct.variable** %var, align 4
  %value38 = getelementptr inbounds %struct.variable, %struct.variable* %21, i32 0, i32 1
  %22 = load i8*, i8** %value38, align 4
  %call39 = call %struct.word_desc* @make_word(i8* %22)
  %call40 = call %struct.word_list* @make_word_list(%struct.word_desc* %call39, %struct.word_list* null)
  store %struct.word_list* %call40, %struct.word_list** %l, align 4
  br label %if.end60

if.else41:                                        ; preds = %land.lhs.true32, %if.else28
  %23 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes42 = getelementptr inbounds %struct.variable, %struct.variable* %23, i32 0, i32 5
  %24 = load i32, i32* %attributes42, align 4
  %and43 = and i32 %24, 64
  %tobool44 = icmp ne i32 %and43, 0
  br i1 %tobool44, label %if.then45, label %if.else52

if.then45:                                        ; preds = %if.else41
  %25 = load %struct.variable*, %struct.variable** %var, align 4
  %value46 = getelementptr inbounds %struct.variable, %struct.variable* %25, i32 0, i32 1
  %26 = load i8*, i8** %value46, align 4
  %27 = bitcast i8* %26 to %struct.hash_table*
  %call47 = call %struct.word_list* @assoc_to_word_list(%struct.hash_table* %27)
  store %struct.word_list* %call47, %struct.word_list** %l, align 4
  %28 = load %struct.word_list*, %struct.word_list** %l, align 4
  %cmp48 = icmp eq %struct.word_list* %28, null
  br i1 %cmp48, label %if.then50, label %if.end51

if.then50:                                        ; preds = %if.then45
  store i8* null, i8** %retval, align 4
  br label %return

if.end51:                                         ; preds = %if.then45
  br label %if.end59

if.else52:                                        ; preds = %if.else41
  %29 = load %struct.variable*, %struct.variable** %var, align 4
  %value53 = getelementptr inbounds %struct.variable, %struct.variable* %29, i32 0, i32 1
  %30 = load i8*, i8** %value53, align 4
  %31 = bitcast i8* %30 to %struct.array*
  %call54 = call %struct.word_list* @array_to_word_list(%struct.array* %31)
  store %struct.word_list* %call54, %struct.word_list** %l, align 4
  %32 = load %struct.word_list*, %struct.word_list** %l, align 4
  %cmp55 = icmp eq %struct.word_list* %32, null
  br i1 %cmp55, label %if.then57, label %if.end58

if.then57:                                        ; preds = %if.else52
  store i8* null, i8** %retval, align 4
  br label %return

if.end58:                                         ; preds = %if.else52
  br label %if.end59

if.end59:                                         ; preds = %if.end58, %if.end51
  br label %if.end60

if.end60:                                         ; preds = %if.end59, %if.then37
  br label %if.end61

if.end61:                                         ; preds = %if.end60
  br label %if.end62

if.end62:                                         ; preds = %if.end61
  %33 = load i8*, i8** %t, align 4
  %arrayidx63 = getelementptr inbounds i8, i8* %33, i32 0
  %34 = load i8, i8* %arrayidx63, align 1
  %conv64 = sext i8 %34 to i32
  %cmp65 = icmp eq i32 %conv64, 42
  br i1 %cmp65, label %land.lhs.true67, label %if.else73

land.lhs.true67:                                  ; preds = %if.end62
  %35 = load i32, i32* %quoted.addr, align 4
  %and68 = and i32 %35, 3
  %tobool69 = icmp ne i32 %and68, 0
  br i1 %tobool69, label %if.then70, label %if.else73

if.then70:                                        ; preds = %land.lhs.true67
  %36 = load %struct.word_list*, %struct.word_list** %l, align 4
  %call71 = call i8* @string_list_dollar_star(%struct.word_list* %36)
  store i8* %call71, i8** %temp, align 4
  %37 = load i8*, i8** %temp, align 4
  %call72 = call i8* @quote_string(i8* %37)
  store i8* %call72, i8** %retval1, align 4
  %38 = load i8*, i8** %temp, align 4
  call void @sh_xfree(i8* %38, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 1089)
  br label %if.end78

if.else73:                                        ; preds = %land.lhs.true67, %if.end62
  %39 = load %struct.word_list*, %struct.word_list** %l, align 4
  %40 = load i32, i32* %quoted.addr, align 4
  %41 = load i32, i32* %flags.addr, align 4
  %and74 = and i32 %41, 16
  %tobool75 = icmp ne i32 %and74, 0
  %cond76 = select i1 %tobool75, i32 8, i32 0
  %call77 = call i8* @string_list_dollar_at(%struct.word_list* %39, i32 %40, i32 %cond76)
  store i8* %call77, i8** %retval1, align 4
  br label %if.end78

if.end78:                                         ; preds = %if.else73, %if.then70
  %42 = load %struct.word_list*, %struct.word_list** %l, align 4
  call void @dispose_words(%struct.word_list* %42)
  br label %if.end206

if.else79:                                        ; preds = %land.lhs.true, %lor.lhs.false
  %43 = load i32*, i32** %rtype.addr, align 4
  %tobool80 = icmp ne i32* %43, null
  br i1 %tobool80, label %if.then81, label %if.end82

if.then81:                                        ; preds = %if.else79
  %44 = load i32*, i32** %rtype.addr, align 4
  store i32 0, i32* %44, align 4
  br label %if.end82

if.end82:                                         ; preds = %if.then81, %if.else79
  %45 = load %struct.variable*, %struct.variable** %var, align 4
  %cmp83 = icmp eq %struct.variable* %45, null
  br i1 %cmp83, label %if.then94, label %lor.lhs.false85

lor.lhs.false85:                                  ; preds = %if.end82
  %46 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes86 = getelementptr inbounds %struct.variable, %struct.variable* %46, i32 0, i32 5
  %47 = load i32, i32* %attributes86, align 4
  %and87 = and i32 %47, 4
  %tobool88 = icmp ne i32 %and87, 0
  br i1 %tobool88, label %if.then94, label %lor.lhs.false89

lor.lhs.false89:                                  ; preds = %lor.lhs.false85
  %48 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes90 = getelementptr inbounds %struct.variable, %struct.variable* %48, i32 0, i32 5
  %49 = load i32, i32* %attributes90, align 4
  %and91 = and i32 %49, 64
  %cmp92 = icmp eq i32 %and91, 0
  br i1 %cmp92, label %if.then94, label %if.else134

if.then94:                                        ; preds = %lor.lhs.false89, %lor.lhs.false85, %if.end82
  %50 = load i32, i32* %flags.addr, align 4
  %and95 = and i32 %50, 4
  %cmp96 = icmp eq i32 %and95, 0
  br i1 %cmp96, label %if.then101, label %lor.lhs.false98

lor.lhs.false98:                                  ; preds = %if.then94
  %51 = load i64*, i64** %indp.addr, align 4
  %cmp99 = icmp eq i64* %51, null
  br i1 %cmp99, label %if.then101, label %if.else129

if.then101:                                       ; preds = %lor.lhs.false98, %if.then94
  %52 = load %struct.variable*, %struct.variable** %var, align 4
  %53 = load i8*, i8** %t, align 4
  %54 = load i32, i32* %len, align 4
  %call102 = call i64 @array_expand_index(%struct.variable* %52, i8* %53, i32 %54)
  store i64 %call102, i64* %ind, align 8
  %55 = load i64, i64* %ind, align 8
  %cmp103 = icmp slt i64 %55, 0
  br i1 %cmp103, label %if.then105, label %if.end125

if.then105:                                       ; preds = %if.then101
  %56 = load %struct.variable*, %struct.variable** %var, align 4
  %tobool106 = icmp ne %struct.variable* %56, null
  br i1 %tobool106, label %land.lhs.true107, label %if.end114

land.lhs.true107:                                 ; preds = %if.then105
  %57 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes108 = getelementptr inbounds %struct.variable, %struct.variable* %57, i32 0, i32 5
  %58 = load i32, i32* %attributes108, align 4
  %and109 = and i32 %58, 4
  %tobool110 = icmp ne i32 %and109, 0
  br i1 %tobool110, label %if.then111, label %if.end114

if.then111:                                       ; preds = %land.lhs.true107
  %59 = load %struct.variable*, %struct.variable** %var, align 4
  %value112 = getelementptr inbounds %struct.variable, %struct.variable* %59, i32 0, i32 1
  %60 = load i8*, i8** %value112, align 4
  %61 = bitcast i8* %60 to %struct.array*
  %max_index = getelementptr inbounds %struct.array, %struct.array* %61, i32 0, i32 1
  %62 = load i64, i64* %max_index, align 8
  %add = add nsw i64 %62, 1
  %63 = load i64, i64* %ind, align 8
  %add113 = add nsw i64 %add, %63
  store i64 %add113, i64* %ind, align 8
  br label %if.end114

if.end114:                                        ; preds = %if.then111, %land.lhs.true107, %if.then105
  %64 = load i64, i64* %ind, align 8
  %cmp115 = icmp slt i64 %64, 0
  br i1 %cmp115, label %if.then117, label %if.end124

if.then117:                                       ; preds = %if.end114
  br label %do.body

do.body:                                          ; preds = %if.then117
  %65 = load %struct.variable*, %struct.variable** %var, align 4
  %tobool118 = icmp ne %struct.variable* %65, null
  br i1 %tobool118, label %if.then119, label %if.else120

if.then119:                                       ; preds = %do.body
  %66 = load %struct.variable*, %struct.variable** %var, align 4
  %name = getelementptr inbounds %struct.variable, %struct.variable* %66, i32 0, i32 0
  %67 = load i8*, i8** %name, align 4
  call void @err_badarraysub(i8* %67)
  br label %if.end123

if.else120:                                       ; preds = %do.body
  %68 = load i8*, i8** %t, align 4
  %arrayidx121 = getelementptr inbounds i8, i8* %68, i32 -1
  store i8 0, i8* %arrayidx121, align 1
  %69 = load i8*, i8** %s.addr, align 4
  call void @err_badarraysub(i8* %69)
  %70 = load i8*, i8** %t, align 4
  %arrayidx122 = getelementptr inbounds i8, i8* %70, i32 -1
  store i8 91, i8* %arrayidx122, align 1
  br label %if.end123

if.end123:                                        ; preds = %if.else120, %if.then119
  store i8* null, i8** %retval, align 4
  br label %return

do.end:                                           ; No predecessors!
  br label %if.end124

if.end124:                                        ; preds = %do.end, %if.end114
  br label %if.end125

if.end125:                                        ; preds = %if.end124, %if.then101
  %71 = load i64*, i64** %indp.addr, align 4
  %tobool126 = icmp ne i64* %71, null
  br i1 %tobool126, label %if.then127, label %if.end128

if.then127:                                       ; preds = %if.end125
  %72 = load i64, i64* %ind, align 8
  %73 = load i64*, i64** %indp.addr, align 4
  store i64 %72, i64* %73, align 8
  br label %if.end128

if.end128:                                        ; preds = %if.then127, %if.end125
  br label %if.end133

if.else129:                                       ; preds = %lor.lhs.false98
  %74 = load i64*, i64** %indp.addr, align 4
  %tobool130 = icmp ne i64* %74, null
  br i1 %tobool130, label %if.then131, label %if.end132

if.then131:                                       ; preds = %if.else129
  %75 = load i64*, i64** %indp.addr, align 4
  %76 = load i64, i64* %75, align 8
  store i64 %76, i64* %ind, align 8
  br label %if.end132

if.end132:                                        ; preds = %if.then131, %if.else129
  br label %if.end133

if.end133:                                        ; preds = %if.end132, %if.end128
  br label %if.end166

if.else134:                                       ; preds = %lor.lhs.false89
  %77 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes135 = getelementptr inbounds %struct.variable, %struct.variable* %77, i32 0, i32 5
  %78 = load i32, i32* %attributes135, align 4
  %and136 = and i32 %78, 64
  %tobool137 = icmp ne i32 %and136, 0
  br i1 %tobool137, label %if.then138, label %if.end165

if.then138:                                       ; preds = %if.else134
  %79 = load i8*, i8** %t, align 4
  %80 = load i32, i32* %len, align 4
  %sub = sub nsw i32 %80, 1
  %arrayidx139 = getelementptr inbounds i8, i8* %79, i32 %sub
  store i8 0, i8* %arrayidx139, align 1
  %81 = load i8*, i8** %t, align 4
  %call140 = call i8* @expand_assignment_string_to_string(i8* %81, i32 0)
  store i8* %call140, i8** %akey, align 4
  %82 = load i8*, i8** %t, align 4
  %83 = load i32, i32* %len, align 4
  %sub141 = sub nsw i32 %83, 1
  %arrayidx142 = getelementptr inbounds i8, i8* %82, i32 %sub141
  store i8 93, i8* %arrayidx142, align 1
  %84 = load i8*, i8** %akey, align 4
  %cmp143 = icmp eq i8* %84, null
  br i1 %cmp143, label %if.then149, label %lor.lhs.false145

lor.lhs.false145:                                 ; preds = %if.then138
  %85 = load i8*, i8** %akey, align 4
  %86 = load i8, i8* %85, align 1
  %conv146 = sext i8 %86 to i32
  %cmp147 = icmp eq i32 %conv146, 0
  br i1 %cmp147, label %if.then149, label %if.end164

if.then149:                                       ; preds = %lor.lhs.false145, %if.then138
  br label %do.body150

do.body150:                                       ; preds = %if.then149
  %87 = load i8*, i8** %akey, align 4
  %tobool151 = icmp ne i8* %87, null
  br i1 %tobool151, label %if.then152, label %if.end153

if.then152:                                       ; preds = %do.body150
  %88 = load i8*, i8** %akey, align 4
  call void @sh_xfree(i8* %88, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 1127)
  br label %if.end153

if.end153:                                        ; preds = %if.then152, %do.body150
  br label %do.end154

do.end154:                                        ; preds = %if.end153
  br label %do.body155

do.body155:                                       ; preds = %do.end154
  %89 = load %struct.variable*, %struct.variable** %var, align 4
  %tobool156 = icmp ne %struct.variable* %89, null
  br i1 %tobool156, label %if.then157, label %if.else159

if.then157:                                       ; preds = %do.body155
  %90 = load %struct.variable*, %struct.variable** %var, align 4
  %name158 = getelementptr inbounds %struct.variable, %struct.variable* %90, i32 0, i32 0
  %91 = load i8*, i8** %name158, align 4
  call void @err_badarraysub(i8* %91)
  br label %if.end162

if.else159:                                       ; preds = %do.body155
  %92 = load i8*, i8** %t, align 4
  %arrayidx160 = getelementptr inbounds i8, i8* %92, i32 -1
  store i8 0, i8* %arrayidx160, align 1
  %93 = load i8*, i8** %s.addr, align 4
  call void @err_badarraysub(i8* %93)
  %94 = load i8*, i8** %t, align 4
  %arrayidx161 = getelementptr inbounds i8, i8* %94, i32 -1
  store i8 91, i8* %arrayidx161, align 1
  br label %if.end162

if.end162:                                        ; preds = %if.else159, %if.then157
  store i8* null, i8** %retval, align 4
  br label %return

do.end163:                                        ; No predecessors!
  br label %if.end164

if.end164:                                        ; preds = %do.end163, %lor.lhs.false145
  br label %if.end165

if.end165:                                        ; preds = %if.end164, %if.else134
  br label %if.end166

if.end166:                                        ; preds = %if.end165, %if.end133
  %95 = load %struct.variable*, %struct.variable** %var, align 4
  %cmp167 = icmp eq %struct.variable* %95, null
  br i1 %cmp167, label %if.then173, label %lor.lhs.false169

lor.lhs.false169:                                 ; preds = %if.end166
  %96 = load %struct.variable*, %struct.variable** %var, align 4
  %value170 = getelementptr inbounds %struct.variable, %struct.variable* %96, i32 0, i32 1
  %97 = load i8*, i8** %value170, align 4
  %cmp171 = icmp eq i8* %97, null
  br i1 %cmp171, label %if.then173, label %if.end179

if.then173:                                       ; preds = %lor.lhs.false169, %if.end166
  br label %do.body174

do.body174:                                       ; preds = %if.then173
  %98 = load i8*, i8** %akey, align 4
  %tobool175 = icmp ne i8* %98, null
  br i1 %tobool175, label %if.then176, label %if.end177

if.then176:                                       ; preds = %do.body174
  %99 = load i8*, i8** %akey, align 4
  call void @sh_xfree(i8* %99, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 1134)
  br label %if.end177

if.end177:                                        ; preds = %if.then176, %do.body174
  br label %do.end178

do.end178:                                        ; preds = %if.end177
  store i8* null, i8** %retval, align 4
  br label %return

if.end179:                                        ; preds = %lor.lhs.false169
  %100 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes180 = getelementptr inbounds %struct.variable, %struct.variable* %100, i32 0, i32 5
  %101 = load i32, i32* %attributes180, align 4
  %and181 = and i32 %101, 4
  %cmp182 = icmp eq i32 %and181, 0
  br i1 %cmp182, label %land.lhs.true184, label %if.else194

land.lhs.true184:                                 ; preds = %if.end179
  %102 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes185 = getelementptr inbounds %struct.variable, %struct.variable* %102, i32 0, i32 5
  %103 = load i32, i32* %attributes185, align 4
  %and186 = and i32 %103, 64
  %cmp187 = icmp eq i32 %and186, 0
  br i1 %cmp187, label %if.then189, label %if.else194

if.then189:                                       ; preds = %land.lhs.true184
  %104 = load i64, i64* %ind, align 8
  %cmp190 = icmp eq i64 %104, 0
  br i1 %cmp190, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then189
  %105 = load %struct.variable*, %struct.variable** %var, align 4
  %value192 = getelementptr inbounds %struct.variable, %struct.variable* %105, i32 0, i32 1
  %106 = load i8*, i8** %value192, align 4
  br label %cond.end

cond.false:                                       ; preds = %if.then189
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond193 = phi i8* [ %106, %cond.true ], [ null, %cond.false ]
  store i8* %cond193, i8** %retval, align 4
  br label %return

if.else194:                                       ; preds = %land.lhs.true184, %if.end179
  %107 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes195 = getelementptr inbounds %struct.variable, %struct.variable* %107, i32 0, i32 5
  %108 = load i32, i32* %attributes195, align 4
  %and196 = and i32 %108, 64
  %tobool197 = icmp ne i32 %and196, 0
  br i1 %tobool197, label %if.then198, label %if.else201

if.then198:                                       ; preds = %if.else194
  %109 = load %struct.variable*, %struct.variable** %var, align 4
  %value199 = getelementptr inbounds %struct.variable, %struct.variable* %109, i32 0, i32 1
  %110 = load i8*, i8** %value199, align 4
  %111 = bitcast i8* %110 to %struct.hash_table*
  %112 = load i8*, i8** %akey, align 4
  %call200 = call i8* @assoc_reference(%struct.hash_table* %111, i8* %112)
  store i8* %call200, i8** %retval1, align 4
  %113 = load i8*, i8** %akey, align 4
  call void @sh_xfree(i8* %113, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 1142)
  br label %if.end204

if.else201:                                       ; preds = %if.else194
  %114 = load %struct.variable*, %struct.variable** %var, align 4
  %value202 = getelementptr inbounds %struct.variable, %struct.variable* %114, i32 0, i32 1
  %115 = load i8*, i8** %value202, align 4
  %116 = bitcast i8* %115 to %struct.array*
  %117 = load i64, i64* %ind, align 8
  %call203 = call i8* @array_reference(%struct.array* %116, i64 %117)
  store i8* %call203, i8** %retval1, align 4
  br label %if.end204

if.end204:                                        ; preds = %if.else201, %if.then198
  br label %if.end205

if.end205:                                        ; preds = %if.end204
  br label %if.end206

if.end206:                                        ; preds = %if.end205, %if.end78
  %118 = load i8*, i8** %retval1, align 4
  store i8* %118, i8** %retval, align 4
  br label %return

return:                                           ; preds = %if.end206, %cond.end, %do.end178, %if.end162, %if.end123, %if.then57, %if.then50, %if.then27, %if.then21, %if.then
  %119 = load i8*, i8** %retval, align 4
  ret i8* %119
}

; Function Attrs: noinline nounwind
define i8* @get_array_value(i8* %s, i32 %flags, i32* %rtype, i64* %indp) #0 {
entry:
  %s.addr = alloca i8*, align 4
  %flags.addr = alloca i32, align 4
  %rtype.addr = alloca i32*, align 4
  %indp.addr = alloca i64*, align 4
  store i8* %s, i8** %s.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  store i32* %rtype, i32** %rtype.addr, align 4
  store i64* %indp, i64** %indp.addr, align 4
  %0 = load i8*, i8** %s.addr, align 4
  %1 = load i32, i32* %flags.addr, align 4
  %2 = load i32*, i32** %rtype.addr, align 4
  %3 = load i64*, i64** %indp.addr, align 4
  %call = call i8* @array_value_internal(i8* %0, i32 0, i32 %1, i32* %2, i64* %3)
  ret i8* %call
}

; Function Attrs: noinline nounwind
define i8* @array_keys(i8* %s, i32 %quoted) #0 {
entry:
  %retval = alloca i8*, align 4
  %s.addr = alloca i8*, align 4
  %quoted.addr = alloca i32, align 4
  %len = alloca i32, align 4
  %retval1 = alloca i8*, align 4
  %t = alloca i8*, align 4
  %temp = alloca i8*, align 4
  %l = alloca %struct.word_list*, align 4
  %var = alloca %struct.variable*, align 4
  store i8* %s, i8** %s.addr, align 4
  store i32 %quoted, i32* %quoted.addr, align 4
  %0 = load i8*, i8** %s.addr, align 4
  %call = call %struct.variable* @array_variable_part(i8* %0, i8** %t, i32* %len)
  store %struct.variable* %call, %struct.variable** %var, align 4
  %1 = load %struct.variable*, %struct.variable** %var, align 4
  %cmp = icmp eq %struct.variable* %1, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %2 = load i8*, i8** %t, align 4
  %arrayidx = getelementptr inbounds i8, i8* %2, i32 0
  %3 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %3 to i32
  %cmp2 = icmp eq i32 %conv, 64
  br i1 %cmp2, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %lor.lhs.false
  %4 = load i8*, i8** %t, align 4
  %arrayidx4 = getelementptr inbounds i8, i8* %4, i32 0
  %5 = load i8, i8* %arrayidx4, align 1
  %conv5 = sext i8 %5 to i32
  %cmp6 = icmp eq i32 %conv5, 42
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %lor.lhs.false
  %6 = phi i1 [ true, %lor.lhs.false ], [ %cmp6, %lor.rhs ]
  %lor.ext = zext i1 %6 to i32
  %cmp8 = icmp eq i32 %lor.ext, 0
  br i1 %cmp8, label %if.then, label %lor.lhs.false10

lor.lhs.false10:                                  ; preds = %lor.end
  %7 = load i8*, i8** %t, align 4
  %arrayidx11 = getelementptr inbounds i8, i8* %7, i32 1
  %8 = load i8, i8* %arrayidx11, align 1
  %conv12 = sext i8 %8 to i32
  %cmp13 = icmp ne i32 %conv12, 93
  br i1 %cmp13, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false10, %lor.end, %entry
  store i8* null, i8** %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false10
  %9 = load %struct.variable*, %struct.variable** %var, align 4
  %value = getelementptr inbounds %struct.variable, %struct.variable* %9, i32 0, i32 1
  %10 = load i8*, i8** %value, align 4
  %cmp15 = icmp ne i8* %10, null
  %conv16 = zext i1 %cmp15 to i32
  %cmp17 = icmp eq i32 %conv16, 0
  br i1 %cmp17, label %if.then20, label %lor.lhs.false19

lor.lhs.false19:                                  ; preds = %if.end
  %11 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %11, i32 0, i32 5
  %12 = load i32, i32* %attributes, align 4
  %and = and i32 %12, 4096
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then20, label %if.end21

if.then20:                                        ; preds = %lor.lhs.false19, %if.end
  store i8* null, i8** %retval, align 4
  br label %return

if.end21:                                         ; preds = %lor.lhs.false19
  %13 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes22 = getelementptr inbounds %struct.variable, %struct.variable* %13, i32 0, i32 5
  %14 = load i32, i32* %attributes22, align 4
  %and23 = and i32 %14, 4
  %cmp24 = icmp eq i32 %and23, 0
  br i1 %cmp24, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %if.end21
  %15 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes26 = getelementptr inbounds %struct.variable, %struct.variable* %15, i32 0, i32 5
  %16 = load i32, i32* %attributes26, align 4
  %and27 = and i32 %16, 64
  %cmp28 = icmp eq i32 %and27, 0
  br i1 %cmp28, label %if.then30, label %if.else

if.then30:                                        ; preds = %land.lhs.true
  %call31 = call %struct.word_desc* @make_word(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i32 0, i32 0))
  %call32 = call %struct.word_list* @make_word_list(%struct.word_desc* %call31, %struct.word_list* null)
  store %struct.word_list* %call32, %struct.word_list** %l, align 4
  br label %if.end43

if.else:                                          ; preds = %land.lhs.true, %if.end21
  %17 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes33 = getelementptr inbounds %struct.variable, %struct.variable* %17, i32 0, i32 5
  %18 = load i32, i32* %attributes33, align 4
  %and34 = and i32 %18, 64
  %tobool35 = icmp ne i32 %and34, 0
  br i1 %tobool35, label %if.then36, label %if.else39

if.then36:                                        ; preds = %if.else
  %19 = load %struct.variable*, %struct.variable** %var, align 4
  %value37 = getelementptr inbounds %struct.variable, %struct.variable* %19, i32 0, i32 1
  %20 = load i8*, i8** %value37, align 4
  %21 = bitcast i8* %20 to %struct.hash_table*
  %call38 = call %struct.word_list* @assoc_keys_to_word_list(%struct.hash_table* %21)
  store %struct.word_list* %call38, %struct.word_list** %l, align 4
  br label %if.end42

if.else39:                                        ; preds = %if.else
  %22 = load %struct.variable*, %struct.variable** %var, align 4
  %value40 = getelementptr inbounds %struct.variable, %struct.variable* %22, i32 0, i32 1
  %23 = load i8*, i8** %value40, align 4
  %24 = bitcast i8* %23 to %struct.array*
  %call41 = call %struct.word_list* @array_keys_to_word_list(%struct.array* %24)
  store %struct.word_list* %call41, %struct.word_list** %l, align 4
  br label %if.end42

if.end42:                                         ; preds = %if.else39, %if.then36
  br label %if.end43

if.end43:                                         ; preds = %if.end42, %if.then30
  %25 = load %struct.word_list*, %struct.word_list** %l, align 4
  %cmp44 = icmp eq %struct.word_list* %25, null
  br i1 %cmp44, label %if.then46, label %if.end47

if.then46:                                        ; preds = %if.end43
  store i8* null, i8** %retval, align 4
  br label %return

if.end47:                                         ; preds = %if.end43
  %26 = load i8*, i8** %t, align 4
  %arrayidx48 = getelementptr inbounds i8, i8* %26, i32 0
  %27 = load i8, i8* %arrayidx48, align 1
  %conv49 = sext i8 %27 to i32
  %cmp50 = icmp eq i32 %conv49, 42
  br i1 %cmp50, label %land.lhs.true52, label %if.else58

land.lhs.true52:                                  ; preds = %if.end47
  %28 = load i32, i32* %quoted.addr, align 4
  %and53 = and i32 %28, 3
  %tobool54 = icmp ne i32 %and53, 0
  br i1 %tobool54, label %if.then55, label %if.else58

if.then55:                                        ; preds = %land.lhs.true52
  %29 = load %struct.word_list*, %struct.word_list** %l, align 4
  %call56 = call i8* @string_list_dollar_star(%struct.word_list* %29)
  store i8* %call56, i8** %temp, align 4
  %30 = load i8*, i8** %temp, align 4
  %call57 = call i8* @quote_string(i8* %30)
  store i8* %call57, i8** %retval1, align 4
  %31 = load i8*, i8** %temp, align 4
  call void @sh_xfree(i8* %31, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 1207)
  br label %if.end60

if.else58:                                        ; preds = %land.lhs.true52, %if.end47
  %32 = load %struct.word_list*, %struct.word_list** %l, align 4
  %33 = load i32, i32* %quoted.addr, align 4
  %call59 = call i8* @string_list_dollar_at(%struct.word_list* %32, i32 %33, i32 0)
  store i8* %call59, i8** %retval1, align 4
  br label %if.end60

if.end60:                                         ; preds = %if.else58, %if.then55
  %34 = load %struct.word_list*, %struct.word_list** %l, align 4
  call void @dispose_words(%struct.word_list* %34)
  %35 = load i8*, i8** %retval1, align 4
  store i8* %35, i8** %retval, align 4
  br label %return

return:                                           ; preds = %if.end60, %if.then46, %if.then20, %if.then
  %36 = load i8*, i8** %retval, align 4
  ret i8* %36
}

declare %struct.word_list* @make_word_list(%struct.word_desc*, %struct.word_list*) #1

declare %struct.word_desc* @make_word(i8*) #1

declare %struct.word_list* @assoc_keys_to_word_list(%struct.hash_table*) #1

declare %struct.word_list* @array_keys_to_word_list(%struct.array*) #1

declare i8* @string_list_dollar_star(%struct.word_list*) #1

declare i8* @quote_string(i8*) #1

declare i8* @string_list_dollar_at(%struct.word_list*, i32, i32) #1

; Function Attrs: noinline nounwind
define internal i8* @quote_assign(i8* %string) #0 {
entry:
  %string.addr = alloca i8*, align 4
  %slen = alloca i32, align 4
  %saw_eq = alloca i32, align 4
  %temp = alloca i8*, align 4
  %t = alloca i8*, align 4
  %subs = alloca i8*, align 4
  %s = alloca i8*, align 4
  %send = alloca i8*, align 4
  %ss = alloca i32, align 4
  %se = alloca i32, align 4
  %state = alloca %struct.__mbstate_t, align 4
  %state_bak = alloca %struct.__mbstate_t, align 4
  %mblength = alloca i32, align 4
  %_k = alloca i32, align 4
  store i8* %string, i8** %string.addr, align 4
  %0 = bitcast %struct.__mbstate_t* %state to i8*
  call void @llvm.memset.p0i8.i32(i8* %0, i8 0, i32 8, i32 4, i1 false)
  %1 = load i8*, i8** %string.addr, align 4
  %call = call i32 @strlen(i8* %1)
  store i32 %call, i32* %slen, align 4
  %2 = load i8*, i8** %string.addr, align 4
  %3 = load i32, i32* %slen, align 4
  %add.ptr = getelementptr inbounds i8, i8* %2, i32 %3
  store i8* %add.ptr, i8** %send, align 4
  %4 = load i32, i32* %slen, align 4
  %mul = mul i32 %4, 2
  %add = add i32 %mul, 1
  %call1 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 701)
  store i8* %call1, i8** %temp, align 4
  store i8* %call1, i8** %t, align 4
  store i32 0, i32* %saw_eq, align 4
  %5 = load i8*, i8** %string.addr, align 4
  store i8* %5, i8** %s, align 4
  br label %for.cond

for.cond:                                         ; preds = %do.end, %if.then8, %entry
  %6 = load i8*, i8** %s, align 4
  %7 = load i8, i8* %6, align 1
  %tobool = icmp ne i8 %7, 0
  br i1 %tobool, label %for.body, label %for.end60

for.body:                                         ; preds = %for.cond
  %8 = load i8*, i8** %s, align 4
  %9 = load i8, i8* %8, align 1
  %conv = sext i8 %9 to i32
  %cmp = icmp eq i32 %conv, 61
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  store i32 1, i32* %saw_eq, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  %10 = load i32, i32* %saw_eq, align 4
  %cmp3 = icmp eq i32 %10, 0
  br i1 %cmp3, label %land.lhs.true, label %if.end17

land.lhs.true:                                    ; preds = %if.end
  %11 = load i8*, i8** %s, align 4
  %12 = load i8, i8* %11, align 1
  %conv5 = sext i8 %12 to i32
  %cmp6 = icmp eq i32 %conv5, 91
  br i1 %cmp6, label %if.then8, label %if.end17

if.then8:                                         ; preds = %land.lhs.true
  %13 = load i8*, i8** %s, align 4
  %14 = load i8*, i8** %string.addr, align 4
  %sub.ptr.lhs.cast = ptrtoint i8* %13 to i32
  %sub.ptr.rhs.cast = ptrtoint i8* %14 to i32
  %sub.ptr.sub = sub i32 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  store i32 %sub.ptr.sub, i32* %ss, align 4
  %15 = load i8*, i8** %string.addr, align 4
  %16 = load i32, i32* %ss, align 4
  %call9 = call i32 @skipsubscript(i8* %15, i32 %16, i32 0)
  store i32 %call9, i32* %se, align 4
  %17 = load i8*, i8** %s, align 4
  %18 = load i32, i32* %ss, align 4
  %19 = load i32, i32* %se, align 4
  %call10 = call i8* @substring(i8* %17, i32 %18, i32 %19)
  store i8* %call10, i8** %subs, align 4
  %20 = load i8*, i8** %t, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %20, i32 1
  store i8* %incdec.ptr, i8** %t, align 4
  store i8 92, i8* %20, align 1
  %21 = load i8*, i8** %t, align 4
  %22 = load i8*, i8** %subs, align 4
  %call11 = call i8* @strcpy(i8* %21, i8* %22)
  %23 = load i32, i32* %se, align 4
  %24 = load i32, i32* %ss, align 4
  %sub = sub nsw i32 %23, %24
  %25 = load i8*, i8** %t, align 4
  %add.ptr12 = getelementptr inbounds i8, i8* %25, i32 %sub
  store i8* %add.ptr12, i8** %t, align 4
  %26 = load i8*, i8** %t, align 4
  %incdec.ptr13 = getelementptr inbounds i8, i8* %26, i32 1
  store i8* %incdec.ptr13, i8** %t, align 4
  store i8 92, i8* %26, align 1
  %27 = load i8*, i8** %t, align 4
  %incdec.ptr14 = getelementptr inbounds i8, i8* %27, i32 1
  store i8* %incdec.ptr14, i8** %t, align 4
  store i8 93, i8* %27, align 1
  %28 = load i32, i32* %se, align 4
  %add15 = add nsw i32 %28, 1
  %29 = load i8*, i8** %s, align 4
  %add.ptr16 = getelementptr inbounds i8, i8* %29, i32 %add15
  store i8* %add.ptr16, i8** %s, align 4
  %30 = load i8*, i8** %subs, align 4
  call void @sh_xfree(i8* %30, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 718)
  br label %for.cond

if.end17:                                         ; preds = %land.lhs.true, %if.end
  %31 = load i32, i32* %saw_eq, align 4
  %cmp18 = icmp eq i32 %31, 0
  br i1 %cmp18, label %land.lhs.true20, label %if.end28

land.lhs.true20:                                  ; preds = %if.end17
  %32 = load i8*, i8** %s, align 4
  %call21 = call i32 @glob_char_p(i8* %32)
  %tobool22 = icmp ne i32 %call21, 0
  br i1 %tobool22, label %if.then26, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true20
  %33 = load i8*, i8** %s, align 4
  %34 = load i8, i8* %33, align 1
  %idxprom = zext i8 %34 to i32
  %arrayidx = getelementptr inbounds [0 x i8], [0 x i8]* @ifs_cmap, i32 0, i32 %idxprom
  %35 = load i8, i8* %arrayidx, align 1
  %conv23 = zext i8 %35 to i32
  %cmp24 = icmp ne i32 %conv23, 0
  br i1 %cmp24, label %if.then26, label %if.end28

if.then26:                                        ; preds = %lor.lhs.false, %land.lhs.true20
  %36 = load i8*, i8** %t, align 4
  %incdec.ptr27 = getelementptr inbounds i8, i8* %36, i32 1
  store i8* %incdec.ptr27, i8** %t, align 4
  store i8 92, i8* %36, align 1
  br label %if.end28

if.end28:                                         ; preds = %if.then26, %lor.lhs.false, %if.end17
  br label %do.body

do.body:                                          ; preds = %if.end28
  %37 = load i32, i32* @locale_mb_cur_max, align 4
  %cmp29 = icmp sgt i32 %37, 1
  br i1 %cmp29, label %if.then31, label %if.else56

if.then31:                                        ; preds = %do.body
  %38 = load i8*, i8** %s, align 4
  %39 = load i8, i8* %38, align 1
  %call32 = call i32 @is_basic(i8 signext %39)
  store i32 %call32, i32* %_k, align 4
  %40 = load i32, i32* %_k, align 4
  %tobool33 = icmp ne i32 %40, 0
  br i1 %tobool33, label %if.then34, label %if.else

if.then34:                                        ; preds = %if.then31
  store i32 1, i32* %mblength, align 4
  br label %if.end39

if.else:                                          ; preds = %if.then31
  %41 = bitcast %struct.__mbstate_t* %state_bak to i8*
  %42 = bitcast %struct.__mbstate_t* %state to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %41, i8* %42, i32 8, i32 4, i1 false)
  %43 = load i8*, i8** %s, align 4
  %44 = load i8*, i8** %send, align 4
  %45 = load i8*, i8** %s, align 4
  %sub.ptr.lhs.cast35 = ptrtoint i8* %44 to i32
  %sub.ptr.rhs.cast36 = ptrtoint i8* %45 to i32
  %sub.ptr.sub37 = sub i32 %sub.ptr.lhs.cast35, %sub.ptr.rhs.cast36
  %call38 = call i32 @mbrlen(i8* %43, i32 %sub.ptr.sub37, %struct.__mbstate_t* %state)
  store i32 %call38, i32* %mblength, align 4
  br label %if.end39

if.end39:                                         ; preds = %if.else, %if.then34
  %46 = load i32, i32* %mblength, align 4
  %cmp40 = icmp eq i32 %46, -2
  br i1 %cmp40, label %if.then45, label %lor.lhs.false42

lor.lhs.false42:                                  ; preds = %if.end39
  %47 = load i32, i32* %mblength, align 4
  %cmp43 = icmp eq i32 %47, -1
  br i1 %cmp43, label %if.then45, label %if.else46

if.then45:                                        ; preds = %lor.lhs.false42, %if.end39
  %48 = bitcast %struct.__mbstate_t* %state to i8*
  %49 = bitcast %struct.__mbstate_t* %state_bak to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %48, i8* %49, i32 8, i32 4, i1 false)
  store i32 1, i32* %mblength, align 4
  br label %if.end49

if.else46:                                        ; preds = %lor.lhs.false42
  %50 = load i32, i32* %mblength, align 4
  %cmp47 = icmp ult i32 %50, 1
  br i1 %cmp47, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.else46
  br label %cond.end

cond.false:                                       ; preds = %if.else46
  %51 = load i32, i32* %mblength, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 1, %cond.true ], [ %51, %cond.false ]
  store i32 %cond, i32* %mblength, align 4
  br label %if.end49

if.end49:                                         ; preds = %cond.end, %if.then45
  store i32 0, i32* %_k, align 4
  br label %for.cond50

for.cond50:                                       ; preds = %for.inc, %if.end49
  %52 = load i32, i32* %_k, align 4
  %53 = load i32, i32* %mblength, align 4
  %cmp51 = icmp ult i32 %52, %53
  br i1 %cmp51, label %for.body53, label %for.end

for.body53:                                       ; preds = %for.cond50
  %54 = load i8*, i8** %s, align 4
  %incdec.ptr54 = getelementptr inbounds i8, i8* %54, i32 1
  store i8* %incdec.ptr54, i8** %s, align 4
  %55 = load i8, i8* %54, align 1
  %56 = load i8*, i8** %t, align 4
  %incdec.ptr55 = getelementptr inbounds i8, i8* %56, i32 1
  store i8* %incdec.ptr55, i8** %t, align 4
  store i8 %55, i8* %56, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body53
  %57 = load i32, i32* %_k, align 4
  %inc = add nsw i32 %57, 1
  store i32 %inc, i32* %_k, align 4
  br label %for.cond50

for.end:                                          ; preds = %for.cond50
  br label %if.end59

if.else56:                                        ; preds = %do.body
  %58 = load i8*, i8** %s, align 4
  %incdec.ptr57 = getelementptr inbounds i8, i8* %58, i32 1
  store i8* %incdec.ptr57, i8** %s, align 4
  %59 = load i8, i8* %58, align 1
  %60 = load i8*, i8** %t, align 4
  %incdec.ptr58 = getelementptr inbounds i8, i8* %60, i32 1
  store i8* %incdec.ptr58, i8** %t, align 4
  store i8 %59, i8* %60, align 1
  br label %if.end59

if.end59:                                         ; preds = %if.else56, %for.end
  br label %do.end

do.end:                                           ; preds = %if.end59
  br label %for.cond

for.end60:                                        ; preds = %for.cond
  %61 = load i8*, i8** %t, align 4
  store i8 0, i8* %61, align 1
  %62 = load i8*, i8** %temp, align 4
  ret i8* %62
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #3

declare i8* @substring(i8*, i32, i32) #1

declare i32 @glob_char_p(i8*) #1

; Function Attrs: noinline nounwind
define internal i32 @is_basic(i8 signext %c) #0 {
entry:
  %c.addr = alloca i8, align 1
  store i8 %c, i8* %c.addr, align 1
  %0 = load i8, i8* %c.addr, align 1
  %conv = zext i8 %0 to i32
  %shr = ashr i32 %conv, 5
  %arrayidx = getelementptr inbounds [0 x i32], [0 x i32]* @is_basic_table, i32 0, i32 %shr
  %1 = load i32, i32* %arrayidx, align 4
  %2 = load i8, i8* %c.addr, align 1
  %conv1 = zext i8 %2 to i32
  %and = and i32 %conv1, 31
  %shr2 = lshr i32 %1, %and
  %and3 = and i32 %shr2, 1
  ret i32 %and3
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* nocapture writeonly, i8* nocapture readonly, i32, i32, i1) #3

declare i32 @mbrlen(i8*, i32, %struct.__mbstate_t*) #1

declare %struct.word_list* @assoc_to_word_list(%struct.hash_table*) #1

declare %struct.word_list* @array_to_word_list(%struct.array*) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { noreturn }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
