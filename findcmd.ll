; ModuleID = 'findcmd.c'
source_filename = "findcmd.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.ignorevar = type { i8*, %struct.ign*, i32, i8*, i32 (%struct.ign*)* }
%struct.ign = type { i8*, i32, i32 }
%struct.user_info = type { i32, i32, i32, i32, i8*, i8*, i8* }
%struct.stat = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }
%struct.timespec = type { i32, i32 }
%struct.variable = type { i8*, i8*, i8*, %struct.variable* (%struct.variable*)*, %struct.variable* (%struct.variable*, i8*, i64, i8*)*, i32, i32 }

@check_hashed_filenames = global i32 0, align 4
@dot_found_in_search = global i32 0, align 4
@execignore = internal global %struct.ignorevar { i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.3, i32 0, i32 0), %struct.ign* null, i32 0, i8* null, i32 (%struct.ign*)* null }, align 4
@current_user = external global %struct.user_info, align 4
@.str = private unnamed_addr constant [5 x i8] c"PATH\00", align 1
@posixly_correct = external global i32, align 4
@.str.1 = private unnamed_addr constant [10 x i8] c"findcmd.c\00", align 1
@hashing_enabled = external global i32, align 4
@user_command_matches.match_list = internal global i8** null, align 4
@user_command_matches.match_list_size = internal global i32 0, align 4
@user_command_matches.match_index = internal global i32 0, align 4
@file_to_lose_on = internal global i8* null, align 4
@.str.2 = private unnamed_addr constant [2 x i8] c".\00", align 1
@.str.3 = private unnamed_addr constant [11 x i8] c"EXECIGNORE\00", align 1
@extended_glob = external global i32, align 4
@terminating_signal = external global i32, align 4
@interrupt_state = external global i32, align 4

; Function Attrs: noinline nounwind
define void @setup_exec_ignore(i8* %varname) #0 {
entry:
  %varname.addr = alloca i8*, align 4
  store i8* %varname, i8** %varname.addr, align 4
  call void @setup_ignore_patterns(%struct.ignorevar* @execignore)
  ret void
}

declare void @setup_ignore_patterns(%struct.ignorevar*) #1

; Function Attrs: noinline nounwind
define i32 @file_status(i8* %name) #0 {
entry:
  %retval = alloca i32, align 4
  %name.addr = alloca i8*, align 4
  %finfo = alloca %struct.stat, align 8
  %r = alloca i32, align 4
  store i8* %name, i8** %name.addr, align 4
  %0 = load i8*, i8** %name.addr, align 4
  %call = call i32 @stat(i8* %0, %struct.stat* %finfo)
  %cmp = icmp slt i32 %call, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %st_mode = getelementptr inbounds %struct.stat, %struct.stat* %finfo, i32 0, i32 6
  %1 = load i32, i32* %st_mode, align 8
  %and = and i32 %1, 61440
  %cmp1 = icmp eq i32 %and, 16384
  br i1 %cmp1, label %if.then2, label %if.end3

if.then2:                                         ; preds = %if.end
  store i32 17, i32* %retval, align 4
  br label %return

if.end3:                                          ; preds = %if.end
  store i32 1, i32* %r, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.user_info, %struct.user_info* @current_user, i32 0, i32 1), align 4
  %cmp4 = icmp eq i32 %2, 0
  br i1 %cmp4, label %if.then5, label %if.end13

if.then5:                                         ; preds = %if.end3
  %3 = load i32, i32* %r, align 4
  %or = or i32 %3, 64
  store i32 %or, i32* %r, align 4
  %4 = load i8*, i8** %name.addr, align 4
  %call6 = call i32 @exec_name_should_ignore(i8* %4)
  %cmp7 = icmp eq i32 %call6, 0
  br i1 %cmp7, label %land.lhs.true, label %if.end12

land.lhs.true:                                    ; preds = %if.then5
  %st_mode8 = getelementptr inbounds %struct.stat, %struct.stat* %finfo, i32 0, i32 6
  %5 = load i32, i32* %st_mode8, align 8
  %and9 = and i32 %5, 73
  %tobool = icmp ne i32 %and9, 0
  br i1 %tobool, label %if.then10, label %if.end12

if.then10:                                        ; preds = %land.lhs.true
  %6 = load i32, i32* %r, align 4
  %or11 = or i32 %6, 2
  store i32 %or11, i32* %r, align 4
  br label %if.end12

if.end12:                                         ; preds = %if.then10, %land.lhs.true, %if.then5
  %7 = load i32, i32* %r, align 4
  store i32 %7, i32* %retval, align 4
  br label %return

if.end13:                                         ; preds = %if.end3
  %8 = load i32, i32* getelementptr inbounds (%struct.user_info, %struct.user_info* @current_user, i32 0, i32 1), align 4
  %st_uid = getelementptr inbounds %struct.stat, %struct.stat* %finfo, i32 0, i32 7
  %9 = load i32, i32* %st_uid, align 4
  %cmp14 = icmp eq i32 %8, %9
  br i1 %cmp14, label %if.then15, label %if.else

if.then15:                                        ; preds = %if.end13
  %10 = load i8*, i8** %name.addr, align 4
  %call16 = call i32 @exec_name_should_ignore(i8* %10)
  %cmp17 = icmp eq i32 %call16, 0
  br i1 %cmp17, label %land.lhs.true18, label %if.end24

land.lhs.true18:                                  ; preds = %if.then15
  %st_mode19 = getelementptr inbounds %struct.stat, %struct.stat* %finfo, i32 0, i32 6
  %11 = load i32, i32* %st_mode19, align 8
  %and20 = and i32 %11, 64
  %tobool21 = icmp ne i32 %and20, 0
  br i1 %tobool21, label %if.then22, label %if.end24

if.then22:                                        ; preds = %land.lhs.true18
  %12 = load i32, i32* %r, align 4
  %or23 = or i32 %12, 2
  store i32 %or23, i32* %r, align 4
  br label %if.end24

if.end24:                                         ; preds = %if.then22, %land.lhs.true18, %if.then15
  %st_mode25 = getelementptr inbounds %struct.stat, %struct.stat* %finfo, i32 0, i32 6
  %13 = load i32, i32* %st_mode25, align 8
  %and26 = and i32 %13, 256
  %tobool27 = icmp ne i32 %and26, 0
  br i1 %tobool27, label %if.then28, label %if.end30

if.then28:                                        ; preds = %if.end24
  %14 = load i32, i32* %r, align 4
  %or29 = or i32 %14, 64
  store i32 %or29, i32* %r, align 4
  br label %if.end30

if.end30:                                         ; preds = %if.then28, %if.end24
  br label %if.end66

if.else:                                          ; preds = %if.end13
  %st_gid = getelementptr inbounds %struct.stat, %struct.stat* %finfo, i32 0, i32 8
  %15 = load i32, i32* %st_gid, align 8
  %call31 = call i32 @group_member(i32 %15)
  %tobool32 = icmp ne i32 %call31, 0
  br i1 %tobool32, label %if.then33, label %if.else49

if.then33:                                        ; preds = %if.else
  %16 = load i8*, i8** %name.addr, align 4
  %call34 = call i32 @exec_name_should_ignore(i8* %16)
  %cmp35 = icmp eq i32 %call34, 0
  br i1 %cmp35, label %land.lhs.true36, label %if.end42

land.lhs.true36:                                  ; preds = %if.then33
  %st_mode37 = getelementptr inbounds %struct.stat, %struct.stat* %finfo, i32 0, i32 6
  %17 = load i32, i32* %st_mode37, align 8
  %and38 = and i32 %17, 8
  %tobool39 = icmp ne i32 %and38, 0
  br i1 %tobool39, label %if.then40, label %if.end42

if.then40:                                        ; preds = %land.lhs.true36
  %18 = load i32, i32* %r, align 4
  %or41 = or i32 %18, 2
  store i32 %or41, i32* %r, align 4
  br label %if.end42

if.end42:                                         ; preds = %if.then40, %land.lhs.true36, %if.then33
  %st_mode43 = getelementptr inbounds %struct.stat, %struct.stat* %finfo, i32 0, i32 6
  %19 = load i32, i32* %st_mode43, align 8
  %and44 = and i32 %19, 32
  %tobool45 = icmp ne i32 %and44, 0
  br i1 %tobool45, label %if.then46, label %if.end48

if.then46:                                        ; preds = %if.end42
  %20 = load i32, i32* %r, align 4
  %or47 = or i32 %20, 64
  store i32 %or47, i32* %r, align 4
  br label %if.end48

if.end48:                                         ; preds = %if.then46, %if.end42
  br label %if.end65

if.else49:                                        ; preds = %if.else
  %21 = load i8*, i8** %name.addr, align 4
  %call50 = call i32 @exec_name_should_ignore(i8* %21)
  %cmp51 = icmp eq i32 %call50, 0
  br i1 %cmp51, label %land.lhs.true52, label %if.end58

land.lhs.true52:                                  ; preds = %if.else49
  %st_mode53 = getelementptr inbounds %struct.stat, %struct.stat* %finfo, i32 0, i32 6
  %22 = load i32, i32* %st_mode53, align 8
  %and54 = and i32 %22, 1
  %tobool55 = icmp ne i32 %and54, 0
  br i1 %tobool55, label %if.then56, label %if.end58

if.then56:                                        ; preds = %land.lhs.true52
  %23 = load i32, i32* %r, align 4
  %or57 = or i32 %23, 2
  store i32 %or57, i32* %r, align 4
  br label %if.end58

if.end58:                                         ; preds = %if.then56, %land.lhs.true52, %if.else49
  %st_mode59 = getelementptr inbounds %struct.stat, %struct.stat* %finfo, i32 0, i32 6
  %24 = load i32, i32* %st_mode59, align 8
  %and60 = and i32 %24, 4
  %tobool61 = icmp ne i32 %and60, 0
  br i1 %tobool61, label %if.then62, label %if.end64

if.then62:                                        ; preds = %if.end58
  %25 = load i32, i32* %r, align 4
  %or63 = or i32 %25, 64
  store i32 %or63, i32* %r, align 4
  br label %if.end64

if.end64:                                         ; preds = %if.then62, %if.end58
  br label %if.end65

if.end65:                                         ; preds = %if.end64, %if.end48
  br label %if.end66

if.end66:                                         ; preds = %if.end65, %if.end30
  %26 = load i32, i32* %r, align 4
  store i32 %26, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end66, %if.end12, %if.then2, %if.then
  %27 = load i32, i32* %retval, align 4
  ret i32 %27
}

declare i32 @stat(i8*, %struct.stat*) #1

; Function Attrs: noinline nounwind
define internal i32 @exec_name_should_ignore(i8* %name) #0 {
entry:
  %retval = alloca i32, align 4
  %name.addr = alloca i8*, align 4
  %p = alloca %struct.ign*, align 4
  store i8* %name, i8** %name.addr, align 4
  %0 = load %struct.ign*, %struct.ign** getelementptr inbounds (%struct.ignorevar, %struct.ignorevar* @execignore, i32 0, i32 1), align 4
  store %struct.ign* %0, %struct.ign** %p, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load %struct.ign*, %struct.ign** %p, align 4
  %tobool = icmp ne %struct.ign* %1, null
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.cond
  %2 = load %struct.ign*, %struct.ign** %p, align 4
  %val = getelementptr inbounds %struct.ign, %struct.ign* %2, i32 0, i32 0
  %3 = load i8*, i8** %val, align 4
  %tobool1 = icmp ne i8* %3, null
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %4 = phi i1 [ false, %for.cond ], [ %tobool1, %land.rhs ]
  br i1 %4, label %for.body, label %for.end

for.body:                                         ; preds = %land.end
  %5 = load %struct.ign*, %struct.ign** %p, align 4
  %val2 = getelementptr inbounds %struct.ign, %struct.ign* %5, i32 0, i32 0
  %6 = load i8*, i8** %val2, align 4
  %7 = load i8*, i8** %name.addr, align 4
  %8 = load i32, i32* @extended_glob, align 4
  %tobool3 = icmp ne i32 %8, 0
  %cond = select i1 %tobool3, i32 32, i32 0
  %or = or i32 %cond, 16
  %call = call i32 @strmatch(i8* %6, i8* %7, i32 %or)
  %cmp = icmp ne i32 %call, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %9 = load %struct.ign*, %struct.ign** %p, align 4
  %incdec.ptr = getelementptr inbounds %struct.ign, %struct.ign* %9, i32 1
  store %struct.ign* %incdec.ptr, %struct.ign** %p, align 4
  br label %for.cond

for.end:                                          ; preds = %land.end
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then
  %10 = load i32, i32* %retval, align 4
  ret i32 %10
}

declare i32 @group_member(i32) #1

; Function Attrs: noinline nounwind
define i32 @executable_file(i8* %file) #0 {
entry:
  %file.addr = alloca i8*, align 4
  %s = alloca i32, align 4
  store i8* %file, i8** %file.addr, align 4
  %0 = load i8*, i8** %file.addr, align 4
  %call = call i32 @file_status(i8* %0)
  store i32 %call, i32* %s, align 4
  %1 = load i32, i32* %s, align 4
  %and = and i32 %1, 16
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call1 = call i32* @__errno_location()
  store i32 21, i32* %call1, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %2 = load i32, i32* %s, align 4
  %and2 = and i32 %2, 2
  %tobool3 = icmp ne i32 %and2, 0
  br i1 %tobool3, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %if.end
  %3 = load i32, i32* %s, align 4
  %and4 = and i32 %3, 16
  %cmp = icmp eq i32 %and4, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %if.end
  %4 = phi i1 [ false, %if.end ], [ %cmp, %land.rhs ]
  %land.ext = zext i1 %4 to i32
  ret i32 %land.ext
}

declare i32* @__errno_location() #1

; Function Attrs: noinline nounwind
define i32 @is_directory(i8* %file) #0 {
entry:
  %file.addr = alloca i8*, align 4
  store i8* %file, i8** %file.addr, align 4
  %0 = load i8*, i8** %file.addr, align 4
  %call = call i32 @file_status(i8* %0)
  %and = and i32 %call, 16
  ret i32 %and
}

; Function Attrs: noinline nounwind
define i32 @executable_or_directory(i8* %file) #0 {
entry:
  %file.addr = alloca i8*, align 4
  %s = alloca i32, align 4
  store i8* %file, i8** %file.addr, align 4
  %0 = load i8*, i8** %file.addr, align 4
  %call = call i32 @file_status(i8* %0)
  store i32 %call, i32* %s, align 4
  %1 = load i32, i32* %s, align 4
  %and = and i32 %1, 2
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %entry
  %2 = load i32, i32* %s, align 4
  %and1 = and i32 %2, 16
  %tobool2 = icmp ne i32 %and1, 0
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %entry
  %3 = phi i1 [ true, %entry ], [ %tobool2, %lor.rhs ]
  %lor.ext = zext i1 %3 to i32
  ret i32 %lor.ext
}

; Function Attrs: noinline nounwind
define i8* @find_user_command(i8* %name) #0 {
entry:
  %name.addr = alloca i8*, align 4
  store i8* %name, i8** %name.addr, align 4
  %0 = load i8*, i8** %name.addr, align 4
  %call = call i8* @find_user_command_internal(i8* %0, i32 36)
  ret i8* %call
}

; Function Attrs: noinline nounwind
define internal i8* @find_user_command_internal(i8* %name, i32 %flags) #0 {
entry:
  %name.addr = alloca i8*, align 4
  %flags.addr = alloca i32, align 4
  store i8* %name, i8** %name.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %0 = load i8*, i8** %name.addr, align 4
  %1 = load i32, i32* %flags.addr, align 4
  %call = call i8* @_find_user_command_internal(i8* %0, i32 %1)
  ret i8* %call
}

; Function Attrs: noinline nounwind
define i8* @find_path_file(i8* %name) #0 {
entry:
  %name.addr = alloca i8*, align 4
  store i8* %name, i8** %name.addr, align 4
  %0 = load i8*, i8** %name.addr, align 4
  %call = call i8* @find_user_command_internal(i8* %0, i32 64)
  ret i8* %call
}

; Function Attrs: noinline nounwind
define i8* @search_for_command(i8* %pathname, i32 %flags) #0 {
entry:
  %pathname.addr = alloca i8*, align 4
  %flags.addr = alloca i32, align 4
  %hashed_file = alloca i8*, align 4
  %command = alloca i8*, align 4
  %pathlist = alloca i8*, align 4
  %temp_path = alloca i32, align 4
  %st = alloca i32, align 4
  %path = alloca %struct.variable*, align 4
  store i8* %pathname, i8** %pathname.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  store i8* null, i8** %command, align 4
  store i8* null, i8** %hashed_file, align 4
  %call = call %struct.variable* @find_variable_tempenv(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i32 0, i32 0))
  store %struct.variable* %call, %struct.variable** %path, align 4
  %0 = load %struct.variable*, %struct.variable** %path, align 4
  %tobool = icmp ne %struct.variable* %0, null
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %entry
  %1 = load %struct.variable*, %struct.variable** %path, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %1, i32 0, i32 5
  %2 = load i32, i32* %attributes, align 4
  %and = and i32 %2, 1048576
  %tobool1 = icmp ne i32 %and, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %3 = phi i1 [ false, %entry ], [ %tobool1, %land.rhs ]
  %land.ext = zext i1 %3 to i32
  store i32 %land.ext, i32* %temp_path, align 4
  %4 = load i32, i32* %temp_path, align 4
  %cmp = icmp eq i32 %4, 0
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %land.end
  %5 = load i8*, i8** %pathname.addr, align 4
  %call2 = call i32 @absolute_program(i8* %5)
  %cmp3 = icmp eq i32 %call2, 0
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %6 = load i8*, i8** %pathname.addr, align 4
  %call4 = call i8* @phash_search(i8* %6)
  store i8* %call4, i8** %hashed_file, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %land.end
  %7 = load i8*, i8** %hashed_file, align 4
  %tobool5 = icmp ne i8* %7, null
  br i1 %tobool5, label %land.lhs.true6, label %if.end16

land.lhs.true6:                                   ; preds = %if.end
  %8 = load i32, i32* @posixly_correct, align 4
  %tobool7 = icmp ne i32 %8, 0
  br i1 %tobool7, label %if.then9, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true6
  %9 = load i32, i32* @check_hashed_filenames, align 4
  %tobool8 = icmp ne i32 %9, 0
  br i1 %tobool8, label %if.then9, label %if.end16

if.then9:                                         ; preds = %lor.lhs.false, %land.lhs.true6
  %10 = load i8*, i8** %hashed_file, align 4
  %call10 = call i32 @file_status(i8* %10)
  store i32 %call10, i32* %st, align 4
  %11 = load i32, i32* %st, align 4
  %and11 = and i32 %11, 3
  %cmp12 = icmp ne i32 %and11, 3
  br i1 %cmp12, label %if.then13, label %if.end15

if.then13:                                        ; preds = %if.then9
  %12 = load i8*, i8** %pathname.addr, align 4
  %call14 = call i32 @phash_remove(i8* %12)
  %13 = load i8*, i8** %hashed_file, align 4
  call void @sh_xfree(i8* %13, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i32 0, i32 0), i32 369)
  store i8* null, i8** %hashed_file, align 4
  br label %if.end15

if.end15:                                         ; preds = %if.then13, %if.then9
  br label %if.end16

if.end16:                                         ; preds = %if.end15, %lor.lhs.false, %if.end
  %14 = load i8*, i8** %hashed_file, align 4
  %tobool17 = icmp ne i8* %14, null
  br i1 %tobool17, label %if.then18, label %if.else

if.then18:                                        ; preds = %if.end16
  %15 = load i8*, i8** %hashed_file, align 4
  store i8* %15, i8** %command, align 4
  br label %if.end70

if.else:                                          ; preds = %if.end16
  %16 = load i8*, i8** %pathname.addr, align 4
  %call19 = call i32 @absolute_program(i8* %16)
  %tobool20 = icmp ne i32 %call19, 0
  br i1 %tobool20, label %if.then21, label %if.else25

if.then21:                                        ; preds = %if.else
  %17 = load i8*, i8** %pathname.addr, align 4
  %call22 = call i32 @strlen(i8* %17)
  %add = add i32 1, %call22
  %call23 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i32 0, i32 0), i32 379)
  %18 = load i8*, i8** %pathname.addr, align 4
  %call24 = call i8* @strcpy(i8* %call23, i8* %18)
  store i8* %call24, i8** %command, align 4
  br label %if.end69

if.else25:                                        ; preds = %if.else
  %19 = load i32, i32* %flags.addr, align 4
  %and26 = and i32 %19, 2
  %tobool27 = icmp ne i32 %and26, 0
  br i1 %tobool27, label %if.then28, label %if.else30

if.then28:                                        ; preds = %if.else25
  %call29 = call i8* @conf_standard_path()
  store i8* %call29, i8** %pathlist, align 4
  br label %if.end37

if.else30:                                        ; preds = %if.else25
  %20 = load i32, i32* %temp_path, align 4
  %tobool31 = icmp ne i32 %20, 0
  br i1 %tobool31, label %if.then34, label %lor.lhs.false32

lor.lhs.false32:                                  ; preds = %if.else30
  %21 = load %struct.variable*, %struct.variable** %path, align 4
  %tobool33 = icmp ne %struct.variable* %21, null
  br i1 %tobool33, label %if.then34, label %if.else35

if.then34:                                        ; preds = %lor.lhs.false32, %if.else30
  %22 = load %struct.variable*, %struct.variable** %path, align 4
  %value = getelementptr inbounds %struct.variable, %struct.variable* %22, i32 0, i32 1
  %23 = load i8*, i8** %value, align 4
  store i8* %23, i8** %pathlist, align 4
  br label %if.end36

if.else35:                                        ; preds = %lor.lhs.false32
  store i8* null, i8** %pathlist, align 4
  br label %if.end36

if.end36:                                         ; preds = %if.else35, %if.then34
  br label %if.end37

if.end37:                                         ; preds = %if.end36, %if.then28
  %24 = load i8*, i8** %pathname.addr, align 4
  %25 = load i8*, i8** %pathlist, align 4
  %call38 = call i8* @find_user_command_in_path(i8* %24, i8* %25, i32 36)
  store i8* %call38, i8** %command, align 4
  %26 = load i8*, i8** %command, align 4
  %tobool39 = icmp ne i8* %26, null
  br i1 %tobool39, label %land.lhs.true40, label %if.end64

land.lhs.true40:                                  ; preds = %if.end37
  %27 = load i32, i32* @hashing_enabled, align 4
  %tobool41 = icmp ne i32 %27, 0
  br i1 %tobool41, label %land.lhs.true42, label %if.end64

land.lhs.true42:                                  ; preds = %land.lhs.true40
  %28 = load i32, i32* %temp_path, align 4
  %cmp43 = icmp eq i32 %28, 0
  br i1 %cmp43, label %land.lhs.true44, label %if.end64

land.lhs.true44:                                  ; preds = %land.lhs.true42
  %29 = load i32, i32* %flags.addr, align 4
  %and45 = and i32 %29, 1
  %tobool46 = icmp ne i32 %and45, 0
  br i1 %tobool46, label %if.then47, label %if.end64

if.then47:                                        ; preds = %land.lhs.true44
  %30 = load i8*, i8** %command, align 4
  %arrayidx = getelementptr inbounds i8, i8* %30, i32 0
  %31 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %31 to i32
  %32 = load i8*, i8** %pathname.addr, align 4
  %arrayidx48 = getelementptr inbounds i8, i8* %32, i32 0
  %33 = load i8, i8* %arrayidx48, align 1
  %conv49 = sext i8 %33 to i32
  %cmp50 = icmp eq i32 %conv, %conv49
  br i1 %cmp50, label %land.lhs.true52, label %if.else62

land.lhs.true52:                                  ; preds = %if.then47
  %34 = load i8*, i8** %command, align 4
  %35 = load i8*, i8** %pathname.addr, align 4
  %call53 = call i32 @strcmp(i8* %34, i8* %35)
  %cmp54 = icmp eq i32 %call53, 0
  br i1 %cmp54, label %if.then56, label %if.else62

if.then56:                                        ; preds = %land.lhs.true52
  %36 = load i8*, i8** %command, align 4
  %call57 = call i32 @file_status(i8* %36)
  store i32 %call57, i32* %st, align 4
  %37 = load i32, i32* %st, align 4
  %and58 = and i32 %37, 2
  %tobool59 = icmp ne i32 %and58, 0
  br i1 %tobool59, label %if.then60, label %if.end61

if.then60:                                        ; preds = %if.then56
  %38 = load i8*, i8** %pathname.addr, align 4
  %39 = load i8*, i8** %command, align 4
  %40 = load i32, i32* @dot_found_in_search, align 4
  call void @phash_insert(i8* %38, i8* %39, i32 %40, i32 1)
  br label %if.end61

if.end61:                                         ; preds = %if.then60, %if.then56
  br label %if.end63

if.else62:                                        ; preds = %land.lhs.true52, %if.then47
  %41 = load i8*, i8** %pathname.addr, align 4
  %42 = load i8*, i8** %command, align 4
  %43 = load i32, i32* @dot_found_in_search, align 4
  call void @phash_insert(i8* %41, i8* %42, i32 %43, i32 1)
  br label %if.end63

if.end63:                                         ; preds = %if.else62, %if.end61
  br label %if.end64

if.end64:                                         ; preds = %if.end63, %land.lhs.true44, %land.lhs.true42, %land.lhs.true40, %if.end37
  %44 = load i32, i32* %flags.addr, align 4
  %and65 = and i32 %44, 2
  %tobool66 = icmp ne i32 %and65, 0
  br i1 %tobool66, label %if.then67, label %if.end68

if.then67:                                        ; preds = %if.end64
  %45 = load i8*, i8** %pathlist, align 4
  call void @sh_xfree(i8* %45, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i32 0, i32 0), i32 407)
  br label %if.end68

if.end68:                                         ; preds = %if.then67, %if.end64
  br label %if.end69

if.end69:                                         ; preds = %if.end68, %if.then21
  br label %if.end70

if.end70:                                         ; preds = %if.end69, %if.then18
  %46 = load i8*, i8** %command, align 4
  ret i8* %46
}

declare %struct.variable* @find_variable_tempenv(i8*) #1

declare i32 @absolute_program(i8*) #1

declare i8* @phash_search(i8*) #1

declare i32 @phash_remove(i8*) #1

declare void @sh_xfree(i8*, i8*, i32) #1

declare i8* @strcpy(i8*, i8*) #1

declare i8* @sh_xmalloc(i32, i8*, i32) #1

declare i32 @strlen(i8*) #1

declare i8* @conf_standard_path() #1

; Function Attrs: noinline nounwind
define internal i8* @find_user_command_in_path(i8* %name, i8* %path_list, i32 %flags) #0 {
entry:
  %retval = alloca i8*, align 4
  %name.addr = alloca i8*, align 4
  %path_list.addr = alloca i8*, align 4
  %flags.addr = alloca i32, align 4
  %full_path = alloca i8*, align 4
  %path = alloca i8*, align 4
  %path_index = alloca i32, align 4
  %name_len = alloca i32, align 4
  %dotinfo = alloca %struct.stat, align 8
  store i8* %name, i8** %name.addr, align 4
  store i8* %path_list, i8** %path_list.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  store i32 0, i32* @dot_found_in_search, align 4
  %0 = load i8*, i8** %name.addr, align 4
  %call = call i32 @absolute_program(i8* %0)
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %name.addr, align 4
  %2 = load i32, i32* %flags.addr, align 4
  %call1 = call i8* @find_absolute_program(i8* %1, i32 %2)
  store i8* %call1, i8** %full_path, align 4
  %3 = load i8*, i8** %full_path, align 4
  store i8* %3, i8** %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %4 = load i8*, i8** %path_list.addr, align 4
  %cmp = icmp eq i8* %4, null
  br i1 %cmp, label %if.then4, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end
  %5 = load i8*, i8** %path_list.addr, align 4
  %6 = load i8, i8* %5, align 1
  %conv = sext i8 %6 to i32
  %cmp2 = icmp eq i32 %conv, 0
  br i1 %cmp2, label %if.then4, label %if.end8

if.then4:                                         ; preds = %lor.lhs.false, %if.end
  %7 = load i8*, i8** %name.addr, align 4
  %call5 = call i32 @strlen(i8* %7)
  %add = add i32 1, %call5
  %call6 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i32 0, i32 0), i32 621)
  %8 = load i8*, i8** %name.addr, align 4
  %call7 = call i8* @strcpy(i8* %call6, i8* %8)
  store i8* %call7, i8** %retval, align 4
  br label %return

if.end8:                                          ; preds = %lor.lhs.false
  store i8* null, i8** @file_to_lose_on, align 4
  %9 = load i8*, i8** %name.addr, align 4
  %call9 = call i32 @strlen(i8* %9)
  store i32 %call9, i32* %name_len, align 4
  %call10 = call i32 @stat(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i32 0, i32 0), %struct.stat* %dotinfo)
  %cmp11 = icmp slt i32 %call10, 0
  br i1 %cmp11, label %if.then13, label %if.end14

if.then13:                                        ; preds = %if.end8
  %st_ino = getelementptr inbounds %struct.stat, %struct.stat* %dotinfo, i32 0, i32 2
  store i32 0, i32* %st_ino, align 8
  %st_dev = getelementptr inbounds %struct.stat, %struct.stat* %dotinfo, i32 0, i32 0
  store i32 0, i32* %st_dev, align 8
  br label %if.end14

if.end14:                                         ; preds = %if.then13, %if.end8
  store i32 0, i32* %path_index, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end40, %if.then31, %if.end14
  %10 = load i8*, i8** %path_list.addr, align 4
  %11 = load i32, i32* %path_index, align 4
  %arrayidx = getelementptr inbounds i8, i8* %10, i32 %11
  %12 = load i8, i8* %arrayidx, align 1
  %tobool15 = icmp ne i8 %12, 0
  br i1 %tobool15, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  br label %do.body

do.body:                                          ; preds = %while.body
  %13 = load volatile i32, i32* @terminating_signal, align 4
  %tobool16 = icmp ne i32 %13, 0
  br i1 %tobool16, label %if.then17, label %if.end18

if.then17:                                        ; preds = %do.body
  %14 = load volatile i32, i32* @terminating_signal, align 4
  call void @termsig_handler(i32 %14)
  br label %if.end18

if.end18:                                         ; preds = %if.then17, %do.body
  %15 = load volatile i32, i32* @interrupt_state, align 4
  %tobool19 = icmp ne i32 %15, 0
  br i1 %tobool19, label %if.then20, label %if.end21

if.then20:                                        ; preds = %if.end18
  call void @throw_to_top_level()
  br label %if.end21

if.end21:                                         ; preds = %if.then20, %if.end18
  br label %do.end

do.end:                                           ; preds = %if.end21
  %16 = load i8*, i8** %path_list.addr, align 4
  %call22 = call i8* @get_next_path_element(i8* %16, i32* %path_index)
  store i8* %call22, i8** %path, align 4
  %17 = load i8*, i8** %path, align 4
  %cmp23 = icmp eq i8* %17, null
  br i1 %cmp23, label %if.then25, label %if.end26

if.then25:                                        ; preds = %do.end
  br label %while.end

if.end26:                                         ; preds = %do.end
  %18 = load i8*, i8** %name.addr, align 4
  %19 = load i8*, i8** %path, align 4
  %20 = load i32, i32* %flags.addr, align 4
  %21 = load i32, i32* %name_len, align 4
  %call27 = call i8* @find_in_path_element(i8* %18, i8* %19, i32 %20, i32 %21, %struct.stat* %dotinfo)
  store i8* %call27, i8** %full_path, align 4
  %22 = load i8*, i8** %path, align 4
  call void @sh_xfree(i8* %22, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i32 0, i32 0), i32 641)
  %23 = load i8*, i8** %full_path, align 4
  %tobool28 = icmp ne i8* %23, null
  br i1 %tobool28, label %land.lhs.true, label %if.end32

land.lhs.true:                                    ; preds = %if.end26
  %24 = load i8*, i8** %full_path, align 4
  %call29 = call i32 @is_directory(i8* %24)
  %tobool30 = icmp ne i32 %call29, 0
  br i1 %tobool30, label %if.then31, label %if.end32

if.then31:                                        ; preds = %land.lhs.true
  %25 = load i8*, i8** %full_path, align 4
  call void @sh_xfree(i8* %25, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i32 0, i32 0), i32 647)
  br label %while.cond

if.end32:                                         ; preds = %land.lhs.true, %if.end26
  %26 = load i8*, i8** %full_path, align 4
  %tobool33 = icmp ne i8* %26, null
  br i1 %tobool33, label %if.then34, label %if.end40

if.then34:                                        ; preds = %if.end32
  br label %do.body35

do.body35:                                        ; preds = %if.then34
  %27 = load i8*, i8** @file_to_lose_on, align 4
  %tobool36 = icmp ne i8* %27, null
  br i1 %tobool36, label %if.then37, label %if.end38

if.then37:                                        ; preds = %do.body35
  %28 = load i8*, i8** @file_to_lose_on, align 4
  call void @sh_xfree(i8* %28, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i32 0, i32 0), i32 653)
  br label %if.end38

if.end38:                                         ; preds = %if.then37, %do.body35
  br label %do.end39

do.end39:                                         ; preds = %if.end38
  %29 = load i8*, i8** %full_path, align 4
  store i8* %29, i8** %retval, align 4
  br label %return

if.end40:                                         ; preds = %if.end32
  br label %while.cond

while.end:                                        ; preds = %if.then25, %while.cond
  %30 = load i8*, i8** @file_to_lose_on, align 4
  %tobool41 = icmp ne i8* %30, null
  br i1 %tobool41, label %land.lhs.true42, label %if.end48

land.lhs.true42:                                  ; preds = %while.end
  %31 = load i32, i32* %flags.addr, align 4
  %and = and i32 %31, 32
  %tobool43 = icmp ne i32 %and, 0
  br i1 %tobool43, label %land.lhs.true44, label %if.end48

land.lhs.true44:                                  ; preds = %land.lhs.true42
  %32 = load i8*, i8** @file_to_lose_on, align 4
  %call45 = call i32 @is_directory(i8* %32)
  %tobool46 = icmp ne i32 %call45, 0
  br i1 %tobool46, label %if.then47, label %if.end48

if.then47:                                        ; preds = %land.lhs.true44
  %33 = load i8*, i8** @file_to_lose_on, align 4
  call void @sh_xfree(i8* %33, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i32 0, i32 0), i32 666)
  store i8* null, i8** @file_to_lose_on, align 4
  br label %if.end48

if.end48:                                         ; preds = %if.then47, %land.lhs.true44, %land.lhs.true42, %while.end
  %34 = load i8*, i8** @file_to_lose_on, align 4
  store i8* %34, i8** %retval, align 4
  br label %return

return:                                           ; preds = %if.end48, %do.end39, %if.then4, %if.then
  %35 = load i8*, i8** %retval, align 4
  ret i8* %35
}

declare i32 @strcmp(i8*, i8*) #1

declare void @phash_insert(i8*, i8*, i32, i32) #1

; Function Attrs: noinline nounwind
define i8* @user_command_matches(i8* %name, i32 %flags, i32 %state) #0 {
entry:
  %name.addr = alloca i8*, align 4
  %flags.addr = alloca i32, align 4
  %state.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %path_index = alloca i32, align 4
  %name_len = alloca i32, align 4
  %path_list = alloca i8*, align 4
  %path_element = alloca i8*, align 4
  %match = alloca i8*, align 4
  %dotinfo = alloca %struct.stat, align 8
  store i8* %name, i8** %name.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  store i32 %state, i32* %state.addr, align 4
  %0 = load i32, i32* %state.addr, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end42

if.then:                                          ; preds = %entry
  %1 = load i8**, i8*** @user_command_matches.match_list, align 4
  %cmp1 = icmp eq i8** %1, null
  br i1 %cmp1, label %if.then2, label %if.end

if.then2:                                         ; preds = %if.then
  store i32 5, i32* @user_command_matches.match_list_size, align 4
  %2 = load i32, i32* @user_command_matches.match_list_size, align 4
  %call = call i8** @strvec_create(i32 %2)
  store i8** %call, i8*** @user_command_matches.match_list, align 4
  br label %if.end

if.end:                                           ; preds = %if.then2, %if.then
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4
  %4 = load i32, i32* @user_command_matches.match_list_size, align 4
  %cmp3 = icmp slt i32 %3, %4
  br i1 %cmp3, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %5 = load i8**, i8*** @user_command_matches.match_list, align 4
  %6 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %5, i32 %6
  store i8* null, i8** %arrayidx, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4
  %inc = add nsw i32 %7, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* @user_command_matches.match_index, align 4
  %8 = load i8*, i8** %name.addr, align 4
  %call4 = call i32 @absolute_program(i8* %8)
  %tobool = icmp ne i32 %call4, 0
  br i1 %tobool, label %if.then5, label %if.else

if.then5:                                         ; preds = %for.end
  %9 = load i8*, i8** %name.addr, align 4
  %10 = load i32, i32* %flags.addr, align 4
  %call6 = call i8* @find_absolute_program(i8* %9, i32 %10)
  %11 = load i8**, i8*** @user_command_matches.match_list, align 4
  %arrayidx7 = getelementptr inbounds i8*, i8** %11, i32 0
  store i8* %call6, i8** %arrayidx7, align 4
  %12 = load i8**, i8*** @user_command_matches.match_list, align 4
  %arrayidx8 = getelementptr inbounds i8*, i8** %12, i32 1
  store i8* null, i8** %arrayidx8, align 4
  store i8* null, i8** %path_list, align 4
  br label %if.end15

if.else:                                          ; preds = %for.end
  %13 = load i8*, i8** %name.addr, align 4
  %call9 = call i32 @strlen(i8* %13)
  store i32 %call9, i32* %name_len, align 4
  store i8* null, i8** @file_to_lose_on, align 4
  store i32 0, i32* @dot_found_in_search, align 4
  %call10 = call i32 @stat(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i32 0, i32 0), %struct.stat* %dotinfo)
  %cmp11 = icmp slt i32 %call10, 0
  br i1 %cmp11, label %if.then12, label %if.end13

if.then12:                                        ; preds = %if.else
  %st_ino = getelementptr inbounds %struct.stat, %struct.stat* %dotinfo, i32 0, i32 2
  store i32 0, i32* %st_ino, align 8
  %st_dev = getelementptr inbounds %struct.stat, %struct.stat* %dotinfo, i32 0, i32 0
  store i32 0, i32* %st_dev, align 8
  br label %if.end13

if.end13:                                         ; preds = %if.then12, %if.else
  %call14 = call i8* @get_string_value(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i32 0, i32 0))
  store i8* %call14, i8** %path_list, align 4
  store i32 0, i32* %path_index, align 4
  br label %if.end15

if.end15:                                         ; preds = %if.end13, %if.then5
  br label %while.cond

while.cond:                                       ; preds = %do.end, %if.then27, %if.end15
  %14 = load i8*, i8** %path_list, align 4
  %tobool16 = icmp ne i8* %14, null
  br i1 %tobool16, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond
  %15 = load i8*, i8** %path_list, align 4
  %16 = load i32, i32* %path_index, align 4
  %arrayidx17 = getelementptr inbounds i8, i8* %15, i32 %16
  %17 = load i8, i8* %arrayidx17, align 1
  %conv = sext i8 %17 to i32
  %tobool18 = icmp ne i32 %conv, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %18 = phi i1 [ false, %while.cond ], [ %tobool18, %land.rhs ]
  br i1 %18, label %while.body, label %while.end

while.body:                                       ; preds = %land.end
  %19 = load i8*, i8** %path_list, align 4
  %call19 = call i8* @get_next_path_element(i8* %19, i32* %path_index)
  store i8* %call19, i8** %path_element, align 4
  %20 = load i8*, i8** %path_element, align 4
  %cmp20 = icmp eq i8* %20, null
  br i1 %cmp20, label %if.then22, label %if.end23

if.then22:                                        ; preds = %while.body
  br label %while.end

if.end23:                                         ; preds = %while.body
  %21 = load i8*, i8** %name.addr, align 4
  %22 = load i8*, i8** %path_element, align 4
  %23 = load i32, i32* %flags.addr, align 4
  %24 = load i32, i32* %name_len, align 4
  %call24 = call i8* @find_in_path_element(i8* %21, i8* %22, i32 %23, i32 %24, %struct.stat* %dotinfo)
  store i8* %call24, i8** %match, align 4
  %25 = load i8*, i8** %path_element, align 4
  call void @sh_xfree(i8* %25, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i32 0, i32 0), i32 468)
  %26 = load i8*, i8** %match, align 4
  %cmp25 = icmp eq i8* %26, null
  br i1 %cmp25, label %if.then27, label %if.end28

if.then27:                                        ; preds = %if.end23
  br label %while.cond

if.end28:                                         ; preds = %if.end23
  %27 = load i32, i32* @user_command_matches.match_index, align 4
  %add = add nsw i32 %27, 1
  %28 = load i32, i32* @user_command_matches.match_list_size, align 4
  %cmp29 = icmp eq i32 %add, %28
  br i1 %cmp29, label %if.then31, label %if.end35

if.then31:                                        ; preds = %if.end28
  %29 = load i32, i32* @user_command_matches.match_list_size, align 4
  %add32 = add nsw i32 %29, 10
  store i32 %add32, i32* @user_command_matches.match_list_size, align 4
  %30 = load i8**, i8*** @user_command_matches.match_list, align 4
  %31 = load i32, i32* @user_command_matches.match_list_size, align 4
  %add33 = add nsw i32 %31, 1
  %call34 = call i8** @strvec_resize(i8** %30, i32 %add33)
  store i8** %call34, i8*** @user_command_matches.match_list, align 4
  br label %if.end35

if.end35:                                         ; preds = %if.then31, %if.end28
  %32 = load i8*, i8** %match, align 4
  %33 = load i8**, i8*** @user_command_matches.match_list, align 4
  %34 = load i32, i32* @user_command_matches.match_index, align 4
  %inc36 = add nsw i32 %34, 1
  store i32 %inc36, i32* @user_command_matches.match_index, align 4
  %arrayidx37 = getelementptr inbounds i8*, i8** %33, i32 %34
  store i8* %32, i8** %arrayidx37, align 4
  %35 = load i8**, i8*** @user_command_matches.match_list, align 4
  %36 = load i32, i32* @user_command_matches.match_index, align 4
  %arrayidx38 = getelementptr inbounds i8*, i8** %35, i32 %36
  store i8* null, i8** %arrayidx38, align 4
  br label %do.body

do.body:                                          ; preds = %if.end35
  %37 = load i8*, i8** @file_to_lose_on, align 4
  %tobool39 = icmp ne i8* %37, null
  br i1 %tobool39, label %if.then40, label %if.end41

if.then40:                                        ; preds = %do.body
  %38 = load i8*, i8** @file_to_lose_on, align 4
  call void @sh_xfree(i8* %38, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i32 0, i32 0), i32 481)
  br label %if.end41

if.end41:                                         ; preds = %if.then40, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end41
  store i8* null, i8** @file_to_lose_on, align 4
  br label %while.cond

while.end:                                        ; preds = %if.then22, %land.end
  store i32 0, i32* @user_command_matches.match_index, align 4
  br label %if.end42

if.end42:                                         ; preds = %while.end, %entry
  %39 = load i8**, i8*** @user_command_matches.match_list, align 4
  %40 = load i32, i32* @user_command_matches.match_index, align 4
  %arrayidx43 = getelementptr inbounds i8*, i8** %39, i32 %40
  %41 = load i8*, i8** %arrayidx43, align 4
  store i8* %41, i8** %match, align 4
  %42 = load i8*, i8** %match, align 4
  %tobool44 = icmp ne i8* %42, null
  br i1 %tobool44, label %if.then45, label %if.end47

if.then45:                                        ; preds = %if.end42
  %43 = load i32, i32* @user_command_matches.match_index, align 4
  %inc46 = add nsw i32 %43, 1
  store i32 %inc46, i32* @user_command_matches.match_index, align 4
  br label %if.end47

if.end47:                                         ; preds = %if.then45, %if.end42
  %44 = load i8*, i8** %match, align 4
  ret i8* %44
}

declare i8** @strvec_create(i32) #1

; Function Attrs: noinline nounwind
define internal i8* @find_absolute_program(i8* %name, i32 %flags) #0 {
entry:
  %retval = alloca i8*, align 4
  %name.addr = alloca i8*, align 4
  %flags.addr = alloca i32, align 4
  %st = alloca i32, align 4
  store i8* %name, i8** %name.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %0 = load i8*, i8** %name.addr, align 4
  %call = call i32 @file_status(i8* %0)
  store i32 %call, i32* %st, align 4
  %1 = load i32, i32* %st, align 4
  %and = and i32 %1, 1
  %cmp = icmp eq i32 %and, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i8* null, i8** %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %2 = load i32, i32* %flags.addr, align 4
  %and1 = and i32 %2, 1
  %tobool = icmp ne i32 %and1, 0
  br i1 %tobool, label %if.then6, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end
  %3 = load i32, i32* %flags.addr, align 4
  %and2 = and i32 %3, 8
  %tobool3 = icmp ne i32 %and2, 0
  br i1 %tobool3, label %land.lhs.true, label %if.end10

land.lhs.true:                                    ; preds = %lor.lhs.false
  %4 = load i32, i32* %st, align 4
  %and4 = and i32 %4, 2
  %tobool5 = icmp ne i32 %and4, 0
  br i1 %tobool5, label %if.then6, label %if.end10

if.then6:                                         ; preds = %land.lhs.true, %if.end
  %5 = load i8*, i8** %name.addr, align 4
  %call7 = call i32 @strlen(i8* %5)
  %add = add i32 1, %call7
  %call8 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i32 0, i32 0), i32 514)
  %6 = load i8*, i8** %name.addr, align 4
  %call9 = call i8* @strcpy(i8* %call8, i8* %6)
  store i8* %call9, i8** %retval, align 4
  br label %return

if.end10:                                         ; preds = %land.lhs.true, %lor.lhs.false
  store i8* null, i8** %retval, align 4
  br label %return

return:                                           ; preds = %if.end10, %if.then6, %if.then
  %7 = load i8*, i8** %retval, align 4
  ret i8* %7
}

declare i8* @get_string_value(i8*) #1

; Function Attrs: noinline nounwind
define internal i8* @get_next_path_element(i8* %path_list, i32* %path_index_pointer) #0 {
entry:
  %retval = alloca i8*, align 4
  %path_list.addr = alloca i8*, align 4
  %path_index_pointer.addr = alloca i32*, align 4
  %path = alloca i8*, align 4
  store i8* %path_list, i8** %path_list.addr, align 4
  store i32* %path_index_pointer, i32** %path_index_pointer.addr, align 4
  %0 = load i8*, i8** %path_list.addr, align 4
  %1 = load i32*, i32** %path_index_pointer.addr, align 4
  %call = call i8* @extract_colon_unit(i8* %0, i32* %1)
  store i8* %call, i8** %path, align 4
  %2 = load i8*, i8** %path, align 4
  %cmp = icmp eq i8* %2, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %path, align 4
  store i8* %3, i8** %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %4 = load i8*, i8** %path, align 4
  %5 = load i8, i8* %4, align 1
  %conv = sext i8 %5 to i32
  %cmp1 = icmp eq i32 %conv, 0
  br i1 %cmp1, label %if.then3, label %if.end6

if.then3:                                         ; preds = %if.end
  %6 = load i8*, i8** %path, align 4
  call void @sh_xfree(i8* %6, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i32 0, i32 0), i32 323)
  %call4 = call i8* @sh_xmalloc(i32 2, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i32 0, i32 0), i32 324)
  %call5 = call i8* @strcpy(i8* %call4, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i32 0, i32 0))
  store i8* %call5, i8** %path, align 4
  br label %if.end6

if.end6:                                          ; preds = %if.then3, %if.end
  %7 = load i8*, i8** %path, align 4
  store i8* %7, i8** %retval, align 4
  br label %return

return:                                           ; preds = %if.end6, %if.then
  %8 = load i8*, i8** %retval, align 4
  ret i8* %8
}

; Function Attrs: noinline nounwind
define internal i8* @find_in_path_element(i8* %name, i8* %path, i32 %flags, i32 %name_len, %struct.stat* %dotinfop) #0 {
entry:
  %retval = alloca i8*, align 4
  %name.addr = alloca i8*, align 4
  %path.addr = alloca i8*, align 4
  %flags.addr = alloca i32, align 4
  %name_len.addr = alloca i32, align 4
  %dotinfop.addr = alloca %struct.stat*, align 4
  %status = alloca i32, align 4
  %full_path = alloca i8*, align 4
  %xpath = alloca i8*, align 4
  store i8* %name, i8** %name.addr, align 4
  store i8* %path, i8** %path.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  store i32 %name_len, i32* %name_len.addr, align 4
  store %struct.stat* %dotinfop, %struct.stat** %dotinfop.addr, align 4
  %0 = load i32, i32* @posixly_correct, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %land.lhs.true, label %cond.false

land.lhs.true:                                    ; preds = %entry
  %1 = load i8*, i8** %path.addr, align 4
  %2 = load i8, i8* %1, align 1
  %conv = sext i8 %2 to i32
  %cmp1 = icmp eq i32 %conv, 126
  br i1 %cmp1, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true
  %3 = load i8*, i8** %path.addr, align 4
  %call = call i8* @bash_tilde_expand(i8* %3, i32 0)
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true, %entry
  %4 = load i8*, i8** %path.addr, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %call, %cond.true ], [ %4, %cond.false ]
  store i8* %cond, i8** %xpath, align 4
  %5 = load i32, i32* @dot_found_in_search, align 4
  %cmp3 = icmp eq i32 %5, 0
  br i1 %cmp3, label %land.lhs.true5, label %if.end

land.lhs.true5:                                   ; preds = %cond.end
  %6 = load i8*, i8** %xpath, align 4
  %7 = load i8, i8* %6, align 1
  %conv6 = sext i8 %7 to i32
  %cmp7 = icmp eq i32 %conv6, 46
  br i1 %cmp7, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true5
  %8 = load i8*, i8** %xpath, align 4
  %9 = load %struct.stat*, %struct.stat** %dotinfop.addr, align 4
  %call9 = call i32 @same_file(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i32 0, i32 0), i8* %8, %struct.stat* %9, %struct.stat* null)
  store i32 %call9, i32* @dot_found_in_search, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true5, %cond.end
  %10 = load i8*, i8** %xpath, align 4
  %11 = load i8*, i8** %name.addr, align 4
  %call10 = call i8* @sh_makepath(i8* %10, i8* %11, i32 0)
  store i8* %call10, i8** %full_path, align 4
  %12 = load i8*, i8** %full_path, align 4
  %call11 = call i32 @file_status(i8* %12)
  store i32 %call11, i32* %status, align 4
  %13 = load i8*, i8** %xpath, align 4
  %14 = load i8*, i8** %path.addr, align 4
  %cmp12 = icmp ne i8* %13, %14
  br i1 %cmp12, label %if.then14, label %if.end15

if.then14:                                        ; preds = %if.end
  %15 = load i8*, i8** %xpath, align 4
  call void @sh_xfree(i8* %15, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i32 0, i32 0), i32 541)
  br label %if.end15

if.end15:                                         ; preds = %if.then14, %if.end
  %16 = load i32, i32* %status, align 4
  %and = and i32 %16, 1
  %cmp16 = icmp eq i32 %and, 0
  br i1 %cmp16, label %if.then18, label %if.end19

if.then18:                                        ; preds = %if.end15
  %17 = load i8*, i8** %full_path, align 4
  call void @sh_xfree(i8* %17, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i32 0, i32 0), i32 545)
  store i8* null, i8** %retval, align 4
  br label %return

if.end19:                                         ; preds = %if.end15
  %18 = load i32, i32* %flags.addr, align 4
  %and20 = and i32 %18, 1
  %tobool = icmp ne i32 %and20, 0
  br i1 %tobool, label %if.then21, label %if.end22

if.then21:                                        ; preds = %if.end19
  %19 = load i8*, i8** %full_path, align 4
  store i8* %19, i8** %retval, align 4
  br label %return

if.end22:                                         ; preds = %if.end19
  %20 = load i32, i32* %flags.addr, align 4
  %and23 = and i32 %20, 64
  %tobool24 = icmp ne i32 %and23, 0
  br i1 %tobool24, label %land.lhs.true25, label %if.end29

land.lhs.true25:                                  ; preds = %if.end22
  %21 = load i32, i32* %status, align 4
  %and26 = and i32 %21, 64
  %tobool27 = icmp ne i32 %and26, 0
  br i1 %tobool27, label %if.then28, label %if.end29

if.then28:                                        ; preds = %land.lhs.true25
  %22 = load i8*, i8** %full_path, align 4
  store i8* %22, i8** %retval, align 4
  br label %return

if.end29:                                         ; preds = %land.lhs.true25, %if.end22
  %23 = load i32, i32* %status, align 4
  %and30 = and i32 %23, 2
  %tobool31 = icmp ne i32 %and30, 0
  br i1 %tobool31, label %land.lhs.true32, label %if.end46

land.lhs.true32:                                  ; preds = %if.end29
  %24 = load i32, i32* %flags.addr, align 4
  %and33 = and i32 %24, 12
  %tobool34 = icmp ne i32 %and33, 0
  br i1 %tobool34, label %land.lhs.true35, label %if.end46

land.lhs.true35:                                  ; preds = %land.lhs.true32
  %25 = load i32, i32* %flags.addr, align 4
  %and36 = and i32 %25, 32
  %cmp37 = icmp eq i32 %and36, 0
  br i1 %cmp37, label %if.then42, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true35
  %26 = load i32, i32* %status, align 4
  %and39 = and i32 %26, 16
  %cmp40 = icmp eq i32 %and39, 0
  br i1 %cmp40, label %if.then42, label %if.end46

if.then42:                                        ; preds = %lor.lhs.false, %land.lhs.true35
  br label %do.body

do.body:                                          ; preds = %if.then42
  %27 = load i8*, i8** @file_to_lose_on, align 4
  %tobool43 = icmp ne i8* %27, null
  br i1 %tobool43, label %if.then44, label %if.end45

if.then44:                                        ; preds = %do.body
  %28 = load i8*, i8** @file_to_lose_on, align 4
  call void @sh_xfree(i8* %28, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i32 0, i32 0), i32 563)
  br label %if.end45

if.end45:                                         ; preds = %if.then44, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end45
  store i8* null, i8** @file_to_lose_on, align 4
  %29 = load i8*, i8** %full_path, align 4
  store i8* %29, i8** %retval, align 4
  br label %return

if.end46:                                         ; preds = %lor.lhs.false, %land.lhs.true32, %if.end29
  %30 = load i32, i32* %flags.addr, align 4
  %and47 = and i32 %30, 4
  %tobool48 = icmp ne i32 %and47, 0
  br i1 %tobool48, label %land.lhs.true49, label %if.end60

land.lhs.true49:                                  ; preds = %if.end46
  %31 = load i8*, i8** @file_to_lose_on, align 4
  %cmp50 = icmp eq i8* %31, null
  br i1 %cmp50, label %land.lhs.true52, label %if.end60

land.lhs.true52:                                  ; preds = %land.lhs.true49
  %32 = load i8*, i8** %full_path, align 4
  %call53 = call i32 @exec_name_should_ignore(i8* %32)
  %cmp54 = icmp eq i32 %call53, 0
  br i1 %cmp54, label %if.then56, label %if.end60

if.then56:                                        ; preds = %land.lhs.true52
  %33 = load i8*, i8** %full_path, align 4
  %call57 = call i32 @strlen(i8* %33)
  %add = add i32 1, %call57
  %call58 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i32 0, i32 0), i32 572)
  %34 = load i8*, i8** %full_path, align 4
  %call59 = call i8* @strcpy(i8* %call58, i8* %34)
  store i8* %call59, i8** @file_to_lose_on, align 4
  br label %if.end60

if.end60:                                         ; preds = %if.then56, %land.lhs.true52, %land.lhs.true49, %if.end46
  %35 = load i32, i32* %flags.addr, align 4
  %and61 = and i32 %35, 12
  %tobool62 = icmp ne i32 %and61, 0
  br i1 %tobool62, label %if.then76, label %lor.lhs.false63

lor.lhs.false63:                                  ; preds = %if.end60
  %36 = load i32, i32* %flags.addr, align 4
  %and64 = and i32 %36, 32
  %tobool65 = icmp ne i32 %and64, 0
  br i1 %tobool65, label %land.lhs.true66, label %lor.lhs.false69

land.lhs.true66:                                  ; preds = %lor.lhs.false63
  %37 = load i32, i32* %status, align 4
  %and67 = and i32 %37, 16
  %tobool68 = icmp ne i32 %and67, 0
  br i1 %tobool68, label %if.then76, label %lor.lhs.false69

lor.lhs.false69:                                  ; preds = %land.lhs.true66, %lor.lhs.false63
  %38 = load i32, i32* %flags.addr, align 4
  %and70 = and i32 %38, 64
  %tobool71 = icmp ne i32 %and70, 0
  br i1 %tobool71, label %land.lhs.true72, label %if.else

land.lhs.true72:                                  ; preds = %lor.lhs.false69
  %39 = load i32, i32* %status, align 4
  %and73 = and i32 %39, 64
  %cmp74 = icmp eq i32 %and73, 0
  br i1 %cmp74, label %if.then76, label %if.else

if.then76:                                        ; preds = %land.lhs.true72, %land.lhs.true66, %if.end60
  %40 = load i8*, i8** %full_path, align 4
  call void @sh_xfree(i8* %40, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i32 0, i32 0), i32 581)
  store i8* null, i8** %retval, align 4
  br label %return

if.else:                                          ; preds = %land.lhs.true72, %lor.lhs.false69
  %41 = load i8*, i8** %full_path, align 4
  store i8* %41, i8** %retval, align 4
  br label %return

return:                                           ; preds = %if.else, %if.then76, %do.end, %if.then28, %if.then21, %if.then18
  %42 = load i8*, i8** %retval, align 4
  ret i8* %42
}

declare i8** @strvec_resize(i8**, i32) #1

; Function Attrs: noinline nounwind
define i8* @find_in_path(i8* %name, i8* %path_list, i32 %flags) #0 {
entry:
  %name.addr = alloca i8*, align 4
  %path_list.addr = alloca i8*, align 4
  %flags.addr = alloca i32, align 4
  store i8* %name, i8** %name.addr, align 4
  store i8* %path_list, i8** %path_list.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %0 = load i8*, i8** %name.addr, align 4
  %1 = load i8*, i8** %path_list.addr, align 4
  %2 = load i32, i32* %flags.addr, align 4
  %call = call i8* @find_user_command_in_path(i8* %0, i8* %1, i32 %2)
  ret i8* %call
}

declare i32 @strmatch(i8*, i8*, i32) #1

; Function Attrs: noinline nounwind
define internal i8* @_find_user_command_internal(i8* %name, i32 %flags) #0 {
entry:
  %retval = alloca i8*, align 4
  %name.addr = alloca i8*, align 4
  %flags.addr = alloca i32, align 4
  %path_list = alloca i8*, align 4
  %cmd = alloca i8*, align 4
  %var = alloca %struct.variable*, align 4
  store i8* %name, i8** %name.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %call = call %struct.variable* @find_variable_tempenv(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i32 0, i32 0))
  store %struct.variable* %call, %struct.variable** %var, align 4
  %tobool = icmp ne %struct.variable* %call, null
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %0 = load %struct.variable*, %struct.variable** %var, align 4
  %value = getelementptr inbounds %struct.variable, %struct.variable* %0, i32 0, i32 1
  %1 = load i8*, i8** %value, align 4
  store i8* %1, i8** %path_list, align 4
  br label %if.end

if.else:                                          ; preds = %entry
  store i8* null, i8** %path_list, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %2 = load i8*, i8** %path_list, align 4
  %cmp = icmp eq i8* %2, null
  br i1 %cmp, label %if.then3, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end
  %3 = load i8*, i8** %path_list, align 4
  %4 = load i8, i8* %3, align 1
  %conv = sext i8 %4 to i32
  %cmp1 = icmp eq i32 %conv, 0
  br i1 %cmp1, label %if.then3, label %if.end7

if.then3:                                         ; preds = %lor.lhs.false, %if.end
  %5 = load i8*, i8** %name.addr, align 4
  %call4 = call i32 @strlen(i8* %5)
  %add = add i32 1, %call4
  %call5 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i32 0, i32 0), i32 277)
  %6 = load i8*, i8** %name.addr, align 4
  %call6 = call i8* @strcpy(i8* %call5, i8* %6)
  store i8* %call6, i8** %retval, align 4
  br label %return

if.end7:                                          ; preds = %lor.lhs.false
  %7 = load i8*, i8** %name.addr, align 4
  %8 = load i8*, i8** %path_list, align 4
  %9 = load i32, i32* %flags.addr, align 4
  %call8 = call i8* @find_user_command_in_path(i8* %7, i8* %8, i32 %9)
  store i8* %call8, i8** %cmd, align 4
  %10 = load i8*, i8** %cmd, align 4
  store i8* %10, i8** %retval, align 4
  br label %return

return:                                           ; preds = %if.end7, %if.then3
  %11 = load i8*, i8** %retval, align 4
  ret i8* %11
}

declare i8* @extract_colon_unit(i8*, i32*) #1

declare i8* @bash_tilde_expand(i8*, i32) #1

declare i32 @same_file(i8*, i8*, %struct.stat*, %struct.stat*) #1

declare i8* @sh_makepath(i8*, i8*, i32) #1

declare void @termsig_handler(i32) #1

declare void @throw_to_top_level() #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
