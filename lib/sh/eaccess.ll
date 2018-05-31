; ModuleID = 'eaccess.c'
source_filename = "eaccess.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.user_info = type { i32, i32, i32, i32, i8*, i8*, i8* }
%struct.stat = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }
%struct.timespec = type { i32, i32 }

@sh_stat.pbuf = internal global i8* null, align 4
@.str = private unnamed_addr constant [9 x i8] c"/dev/fd/\00", align 1
@.str.1 = private unnamed_addr constant [10 x i8] c"eaccess.c\00", align 1
@current_user = external global %struct.user_info, align 4
@.str.2 = private unnamed_addr constant [9 x i8] c"/dev/std\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"in\00", align 1
@.str.4 = private unnamed_addr constant [4 x i8] c"out\00", align 1
@.str.5 = private unnamed_addr constant [4 x i8] c"err\00", align 1

; Function Attrs: noinline nounwind
define i32 @sh_stat(i8* %path, %struct.stat* %finfo) #0 {
entry:
  %retval = alloca i32, align 4
  %path.addr = alloca i8*, align 4
  %finfo.addr = alloca %struct.stat*, align 4
  store i8* %path, i8** %path.addr, align 4
  store %struct.stat* %finfo, %struct.stat** %finfo.addr, align 4
  %0 = load i8*, i8** %path.addr, align 4
  %1 = load i8, i8* %0, align 1
  %conv = sext i8 %1 to i32
  %cmp = icmp eq i32 %conv, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call = call i32* @__errno_location()
  store i32 2, i32* %call, align 4
  store i32 -1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %2 = load i8*, i8** %path.addr, align 4
  %arrayidx = getelementptr inbounds i8, i8* %2, i32 0
  %3 = load i8, i8* %arrayidx, align 1
  %conv2 = sext i8 %3 to i32
  %cmp3 = icmp eq i32 %conv2, 47
  br i1 %cmp3, label %land.lhs.true, label %if.end20

land.lhs.true:                                    ; preds = %if.end
  %4 = load i8*, i8** %path.addr, align 4
  %arrayidx5 = getelementptr inbounds i8, i8* %4, i32 1
  %5 = load i8, i8* %arrayidx5, align 1
  %conv6 = sext i8 %5 to i32
  %cmp7 = icmp eq i32 %conv6, 100
  br i1 %cmp7, label %land.lhs.true9, label %if.end20

land.lhs.true9:                                   ; preds = %land.lhs.true
  %6 = load i8*, i8** %path.addr, align 4
  %call10 = call i32 @strncmp(i8* %6, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i32 0, i32 0), i32 8)
  %cmp11 = icmp eq i32 %call10, 0
  br i1 %cmp11, label %if.then13, label %if.end20

if.then13:                                        ; preds = %land.lhs.true9
  %7 = load i8*, i8** @sh_stat.pbuf, align 4
  %8 = load i8*, i8** %path.addr, align 4
  %add.ptr = getelementptr inbounds i8, i8* %8, i32 8
  %call14 = call i32 @strlen(i8* %add.ptr)
  %add = add i32 9, %call14
  %call15 = call i8* @sh_xrealloc(i8* %7, i32 %add, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i32 0, i32 0), i32 111)
  store i8* %call15, i8** @sh_stat.pbuf, align 4
  %9 = load i8*, i8** @sh_stat.pbuf, align 4
  %call16 = call i8* @strcpy(i8* %9, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i32 0, i32 0))
  %10 = load i8*, i8** @sh_stat.pbuf, align 4
  %11 = load i8*, i8** %path.addr, align 4
  %add.ptr17 = getelementptr inbounds i8, i8* %11, i32 8
  %call18 = call i8* @strcat(i8* %10, i8* %add.ptr17)
  %12 = load i8*, i8** @sh_stat.pbuf, align 4
  %13 = load %struct.stat*, %struct.stat** %finfo.addr, align 4
  %call19 = call i32 @stat(i8* %12, %struct.stat* %13)
  store i32 %call19, i32* %retval, align 4
  br label %return

if.end20:                                         ; preds = %land.lhs.true9, %land.lhs.true, %if.end
  %14 = load i8*, i8** %path.addr, align 4
  %15 = load %struct.stat*, %struct.stat** %finfo.addr, align 4
  %call21 = call i32 @stat(i8* %14, %struct.stat* %15)
  store i32 %call21, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end20, %if.then13, %if.then
  %16 = load i32, i32* %retval, align 4
  ret i32 %16
}

declare i32* @__errno_location() #1

declare i32 @strncmp(i8*, i8*, i32) #1

declare i8* @sh_xrealloc(i8*, i32, i8*, i32) #1

declare i32 @strlen(i8*) #1

declare i8* @strcpy(i8*, i8*) #1

declare i8* @strcat(i8*, i8*) #1

declare i32 @stat(i8*, %struct.stat*) #1

; Function Attrs: noinline nounwind
define i32 @sh_eaccess(i8* %path, i32 %mode) #0 {
entry:
  %retval = alloca i32, align 4
  %path.addr = alloca i8*, align 4
  %mode.addr = alloca i32, align 4
  %ret = alloca i32, align 4
  store i8* %path, i8** %path.addr, align 4
  store i32 %mode, i32* %mode.addr, align 4
  %0 = load i8*, i8** %path.addr, align 4
  %call = call i32 @path_is_devfd(i8* %0)
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %path.addr, align 4
  %2 = load i32, i32* %mode.addr, align 4
  %call1 = call i32 @sh_stataccess(i8* %1, i32 %2)
  store i32 %call1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %3 = load i32, i32* %mode.addr, align 4
  %cmp = icmp eq i32 %3, 0
  br i1 %cmp, label %if.then2, label %if.end4

if.then2:                                         ; preds = %if.end
  %4 = load i8*, i8** %path.addr, align 4
  %5 = load i32, i32* %mode.addr, align 4
  %call3 = call i32 @sh_stataccess(i8* %4, i32 %5)
  store i32 %call3, i32* %retval, align 4
  br label %return

if.end4:                                          ; preds = %if.end
  %6 = load i32, i32* getelementptr inbounds (%struct.user_info, %struct.user_info* @current_user, i32 0, i32 0), align 4
  %7 = load i32, i32* getelementptr inbounds (%struct.user_info, %struct.user_info* @current_user, i32 0, i32 1), align 4
  %cmp5 = icmp ne i32 %6, %7
  br i1 %cmp5, label %if.then7, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end4
  %8 = load i32, i32* getelementptr inbounds (%struct.user_info, %struct.user_info* @current_user, i32 0, i32 2), align 4
  %9 = load i32, i32* getelementptr inbounds (%struct.user_info, %struct.user_info* @current_user, i32 0, i32 3), align 4
  %cmp6 = icmp ne i32 %8, %9
  br i1 %cmp6, label %if.then7, label %if.end9

if.then7:                                         ; preds = %lor.lhs.false, %if.end4
  %10 = load i8*, i8** %path.addr, align 4
  %11 = load i32, i32* %mode.addr, align 4
  %call8 = call i32 @sh_euidaccess(i8* %10, i32 %11)
  store i32 %call8, i32* %retval, align 4
  br label %return

if.end9:                                          ; preds = %lor.lhs.false
  %12 = load i32, i32* getelementptr inbounds (%struct.user_info, %struct.user_info* @current_user, i32 0, i32 0), align 4
  %13 = load i32, i32* getelementptr inbounds (%struct.user_info, %struct.user_info* @current_user, i32 0, i32 1), align 4
  %cmp10 = icmp eq i32 %12, %13
  br i1 %cmp10, label %land.lhs.true, label %if.end14

land.lhs.true:                                    ; preds = %if.end9
  %14 = load i32, i32* getelementptr inbounds (%struct.user_info, %struct.user_info* @current_user, i32 0, i32 2), align 4
  %15 = load i32, i32* getelementptr inbounds (%struct.user_info, %struct.user_info* @current_user, i32 0, i32 3), align 4
  %cmp11 = icmp eq i32 %14, %15
  br i1 %cmp11, label %if.then12, label %if.end14

if.then12:                                        ; preds = %land.lhs.true
  %16 = load i8*, i8** %path.addr, align 4
  %17 = load i32, i32* %mode.addr, align 4
  %call13 = call i32 @access(i8* %16, i32 %17)
  store i32 %call13, i32* %ret, align 4
  %18 = load i32, i32* %ret, align 4
  store i32 %18, i32* %retval, align 4
  br label %return

if.end14:                                         ; preds = %land.lhs.true, %if.end9
  %19 = load i8*, i8** %path.addr, align 4
  %20 = load i32, i32* %mode.addr, align 4
  %call15 = call i32 @sh_stataccess(i8* %19, i32 %20)
  store i32 %call15, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end14, %if.then12, %if.then7, %if.then2, %if.then
  %21 = load i32, i32* %retval, align 4
  ret i32 %21
}

; Function Attrs: noinline nounwind
define internal i32 @path_is_devfd(i8* %path) #0 {
entry:
  %retval = alloca i32, align 4
  %path.addr = alloca i8*, align 4
  store i8* %path, i8** %path.addr, align 4
  %0 = load i8*, i8** %path.addr, align 4
  %arrayidx = getelementptr inbounds i8, i8* %0, i32 0
  %1 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %1 to i32
  %cmp = icmp eq i32 %conv, 47
  br i1 %cmp, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %entry
  %2 = load i8*, i8** %path.addr, align 4
  %arrayidx2 = getelementptr inbounds i8, i8* %2, i32 1
  %3 = load i8, i8* %arrayidx2, align 1
  %conv3 = sext i8 %3 to i32
  %cmp4 = icmp eq i32 %conv3, 100
  br i1 %cmp4, label %land.lhs.true6, label %if.else

land.lhs.true6:                                   ; preds = %land.lhs.true
  %4 = load i8*, i8** %path.addr, align 4
  %call = call i32 @strncmp(i8* %4, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i32 0, i32 0), i32 8)
  %cmp7 = icmp eq i32 %call, 0
  br i1 %cmp7, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true6
  store i32 1, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %land.lhs.true6, %land.lhs.true, %entry
  br i1 false, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.else
  br i1 true, label %if.then18, label %if.else54

cond.false:                                       ; preds = %if.else
  %5 = load i8*, i8** %path.addr, align 4
  %arrayidx9 = getelementptr inbounds i8, i8* %5, i32 0
  %6 = load i8, i8* %arrayidx9, align 1
  %conv10 = sext i8 %6 to i32
  %7 = load i8, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.2, i32 0, i32 0), align 1
  %conv11 = sext i8 %7 to i32
  %cmp12 = icmp eq i32 %conv10, %conv11
  br i1 %cmp12, label %land.lhs.true14, label %if.else54

land.lhs.true14:                                  ; preds = %cond.false
  %8 = load i8*, i8** %path.addr, align 4
  %call15 = call i32 @strncmp(i8* %8, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.2, i32 0, i32 0), i32 8)
  %cmp16 = icmp eq i32 %call15, 0
  br i1 %cmp16, label %if.then18, label %if.else54

if.then18:                                        ; preds = %land.lhs.true14, %cond.true
  %9 = load i8*, i8** %path.addr, align 4
  %add.ptr = getelementptr inbounds i8, i8* %9, i32 8
  %arrayidx19 = getelementptr inbounds i8, i8* %add.ptr, i32 0
  %10 = load i8, i8* %arrayidx19, align 1
  %conv20 = sext i8 %10 to i32
  %11 = load i8, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i32 0, i32 0), align 1
  %conv21 = sext i8 %11 to i32
  %cmp22 = icmp eq i32 %conv20, %conv21
  br i1 %cmp22, label %land.lhs.true24, label %lor.lhs.false

land.lhs.true24:                                  ; preds = %if.then18
  %12 = load i8*, i8** %path.addr, align 4
  %add.ptr25 = getelementptr inbounds i8, i8* %12, i32 8
  %call26 = call i32 @strcmp(i8* %add.ptr25, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i32 0, i32 0))
  %cmp27 = icmp eq i32 %call26, 0
  br i1 %cmp27, label %if.then52, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true24, %if.then18
  %13 = load i8*, i8** %path.addr, align 4
  %add.ptr29 = getelementptr inbounds i8, i8* %13, i32 8
  %arrayidx30 = getelementptr inbounds i8, i8* %add.ptr29, i32 0
  %14 = load i8, i8* %arrayidx30, align 1
  %conv31 = sext i8 %14 to i32
  %15 = load i8, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4, i32 0, i32 0), align 1
  %conv32 = sext i8 %15 to i32
  %cmp33 = icmp eq i32 %conv31, %conv32
  br i1 %cmp33, label %land.lhs.true35, label %lor.lhs.false40

land.lhs.true35:                                  ; preds = %lor.lhs.false
  %16 = load i8*, i8** %path.addr, align 4
  %add.ptr36 = getelementptr inbounds i8, i8* %16, i32 8
  %call37 = call i32 @strcmp(i8* %add.ptr36, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4, i32 0, i32 0))
  %cmp38 = icmp eq i32 %call37, 0
  br i1 %cmp38, label %if.then52, label %lor.lhs.false40

lor.lhs.false40:                                  ; preds = %land.lhs.true35, %lor.lhs.false
  %17 = load i8*, i8** %path.addr, align 4
  %add.ptr41 = getelementptr inbounds i8, i8* %17, i32 8
  %arrayidx42 = getelementptr inbounds i8, i8* %add.ptr41, i32 0
  %18 = load i8, i8* %arrayidx42, align 1
  %conv43 = sext i8 %18 to i32
  %19 = load i8, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i32 0, i32 0), align 1
  %conv44 = sext i8 %19 to i32
  %cmp45 = icmp eq i32 %conv43, %conv44
  br i1 %cmp45, label %land.lhs.true47, label %if.else53

land.lhs.true47:                                  ; preds = %lor.lhs.false40
  %20 = load i8*, i8** %path.addr, align 4
  %add.ptr48 = getelementptr inbounds i8, i8* %20, i32 8
  %call49 = call i32 @strcmp(i8* %add.ptr48, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i32 0, i32 0))
  %cmp50 = icmp eq i32 %call49, 0
  br i1 %cmp50, label %if.then52, label %if.else53

if.then52:                                        ; preds = %land.lhs.true47, %land.lhs.true35, %land.lhs.true24
  store i32 1, i32* %retval, align 4
  br label %return

if.else53:                                        ; preds = %land.lhs.true47, %lor.lhs.false40
  store i32 0, i32* %retval, align 4
  br label %return

if.else54:                                        ; preds = %land.lhs.true14, %cond.false, %cond.true
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.else54, %if.else53, %if.then52, %if.then
  %21 = load i32, i32* %retval, align 4
  ret i32 %21
}

; Function Attrs: noinline nounwind
define internal i32 @sh_stataccess(i8* %path, i32 %mode) #0 {
entry:
  %retval = alloca i32, align 4
  %path.addr = alloca i8*, align 4
  %mode.addr = alloca i32, align 4
  %st = alloca %struct.stat, align 8
  store i8* %path, i8** %path.addr, align 4
  store i32 %mode, i32* %mode.addr, align 4
  %0 = load i8*, i8** %path.addr, align 4
  %call = call i32 @sh_stat(i8* %0, %struct.stat* %st)
  %cmp = icmp slt i32 %call, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i32, i32* getelementptr inbounds (%struct.user_info, %struct.user_info* @current_user, i32 0, i32 1), align 4
  %cmp1 = icmp eq i32 %1, 0
  br i1 %cmp1, label %if.then2, label %if.end9

if.then2:                                         ; preds = %if.end
  %2 = load i32, i32* %mode.addr, align 4
  %and = and i32 %2, 1
  %cmp3 = icmp eq i32 %and, 0
  br i1 %cmp3, label %if.then4, label %if.end5

if.then4:                                         ; preds = %if.then2
  store i32 0, i32* %retval, align 4
  br label %return

if.end5:                                          ; preds = %if.then2
  %st_mode = getelementptr inbounds %struct.stat, %struct.stat* %st, i32 0, i32 6
  %3 = load i32, i32* %st_mode, align 8
  %and6 = and i32 %3, 73
  %tobool = icmp ne i32 %and6, 0
  br i1 %tobool, label %if.then7, label %if.end8

if.then7:                                         ; preds = %if.end5
  store i32 0, i32* %retval, align 4
  br label %return

if.end8:                                          ; preds = %if.end5
  br label %if.end9

if.end9:                                          ; preds = %if.end8, %if.end
  %st_uid = getelementptr inbounds %struct.stat, %struct.stat* %st, i32 0, i32 7
  %4 = load i32, i32* %st_uid, align 4
  %5 = load i32, i32* getelementptr inbounds (%struct.user_info, %struct.user_info* @current_user, i32 0, i32 1), align 4
  %cmp10 = icmp eq i32 %4, %5
  br i1 %cmp10, label %if.then11, label %if.else

if.then11:                                        ; preds = %if.end9
  %6 = load i32, i32* %mode.addr, align 4
  %shl = shl i32 %6, 6
  store i32 %shl, i32* %mode.addr, align 4
  br label %if.end17

if.else:                                          ; preds = %if.end9
  %st_gid = getelementptr inbounds %struct.stat, %struct.stat* %st, i32 0, i32 8
  %7 = load i32, i32* %st_gid, align 8
  %call12 = call i32 @group_member(i32 %7)
  %tobool13 = icmp ne i32 %call12, 0
  br i1 %tobool13, label %if.then14, label %if.end16

if.then14:                                        ; preds = %if.else
  %8 = load i32, i32* %mode.addr, align 4
  %shl15 = shl i32 %8, 3
  store i32 %shl15, i32* %mode.addr, align 4
  br label %if.end16

if.end16:                                         ; preds = %if.then14, %if.else
  br label %if.end17

if.end17:                                         ; preds = %if.end16, %if.then11
  %st_mode18 = getelementptr inbounds %struct.stat, %struct.stat* %st, i32 0, i32 6
  %9 = load i32, i32* %st_mode18, align 8
  %10 = load i32, i32* %mode.addr, align 4
  %and19 = and i32 %9, %10
  %tobool20 = icmp ne i32 %and19, 0
  br i1 %tobool20, label %if.then21, label %if.end22

if.then21:                                        ; preds = %if.end17
  store i32 0, i32* %retval, align 4
  br label %return

if.end22:                                         ; preds = %if.end17
  %call23 = call i32* @__errno_location()
  store i32 13, i32* %call23, align 4
  store i32 -1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end22, %if.then21, %if.then7, %if.then4, %if.then
  %11 = load i32, i32* %retval, align 4
  ret i32 %11
}

; Function Attrs: noinline nounwind
define internal i32 @sh_euidaccess(i8* %path, i32 %mode) #0 {
entry:
  %path.addr = alloca i8*, align 4
  %mode.addr = alloca i32, align 4
  %r = alloca i32, align 4
  %e = alloca i32, align 4
  store i8* %path, i8** %path.addr, align 4
  store i32 %mode, i32* %mode.addr, align 4
  %0 = load i32, i32* getelementptr inbounds (%struct.user_info, %struct.user_info* @current_user, i32 0, i32 0), align 4
  %1 = load i32, i32* getelementptr inbounds (%struct.user_info, %struct.user_info* @current_user, i32 0, i32 1), align 4
  %cmp = icmp ne i32 %0, %1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load i32, i32* getelementptr inbounds (%struct.user_info, %struct.user_info* @current_user, i32 0, i32 1), align 4
  %3 = load i32, i32* getelementptr inbounds (%struct.user_info, %struct.user_info* @current_user, i32 0, i32 0), align 4
  %call = call i32 @setreuid(i32 %2, i32 %3)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %4 = load i32, i32* getelementptr inbounds (%struct.user_info, %struct.user_info* @current_user, i32 0, i32 2), align 4
  %5 = load i32, i32* getelementptr inbounds (%struct.user_info, %struct.user_info* @current_user, i32 0, i32 3), align 4
  %cmp1 = icmp ne i32 %4, %5
  br i1 %cmp1, label %if.then2, label %if.end4

if.then2:                                         ; preds = %if.end
  %6 = load i32, i32* getelementptr inbounds (%struct.user_info, %struct.user_info* @current_user, i32 0, i32 3), align 4
  %7 = load i32, i32* getelementptr inbounds (%struct.user_info, %struct.user_info* @current_user, i32 0, i32 2), align 4
  %call3 = call i32 @setregid(i32 %6, i32 %7)
  br label %if.end4

if.end4:                                          ; preds = %if.then2, %if.end
  %8 = load i8*, i8** %path.addr, align 4
  %9 = load i32, i32* %mode.addr, align 4
  %call5 = call i32 @access(i8* %8, i32 %9)
  store i32 %call5, i32* %r, align 4
  %call6 = call i32* @__errno_location()
  %10 = load i32, i32* %call6, align 4
  store i32 %10, i32* %e, align 4
  %11 = load i32, i32* getelementptr inbounds (%struct.user_info, %struct.user_info* @current_user, i32 0, i32 0), align 4
  %12 = load i32, i32* getelementptr inbounds (%struct.user_info, %struct.user_info* @current_user, i32 0, i32 1), align 4
  %cmp7 = icmp ne i32 %11, %12
  br i1 %cmp7, label %if.then8, label %if.end10

if.then8:                                         ; preds = %if.end4
  %13 = load i32, i32* getelementptr inbounds (%struct.user_info, %struct.user_info* @current_user, i32 0, i32 0), align 4
  %14 = load i32, i32* getelementptr inbounds (%struct.user_info, %struct.user_info* @current_user, i32 0, i32 1), align 4
  %call9 = call i32 @setreuid(i32 %13, i32 %14)
  br label %if.end10

if.end10:                                         ; preds = %if.then8, %if.end4
  %15 = load i32, i32* getelementptr inbounds (%struct.user_info, %struct.user_info* @current_user, i32 0, i32 2), align 4
  %16 = load i32, i32* getelementptr inbounds (%struct.user_info, %struct.user_info* @current_user, i32 0, i32 3), align 4
  %cmp11 = icmp ne i32 %15, %16
  br i1 %cmp11, label %if.then12, label %if.end14

if.then12:                                        ; preds = %if.end10
  %17 = load i32, i32* getelementptr inbounds (%struct.user_info, %struct.user_info* @current_user, i32 0, i32 2), align 4
  %18 = load i32, i32* getelementptr inbounds (%struct.user_info, %struct.user_info* @current_user, i32 0, i32 3), align 4
  %call13 = call i32 @setregid(i32 %17, i32 %18)
  br label %if.end14

if.end14:                                         ; preds = %if.then12, %if.end10
  %19 = load i32, i32* %e, align 4
  %call15 = call i32* @__errno_location()
  store i32 %19, i32* %call15, align 4
  %20 = load i32, i32* %r, align 4
  ret i32 %20
}

declare i32 @access(i8*, i32) #1

declare i32 @strcmp(i8*, i8*) #1

declare i32 @group_member(i32) #1

declare i32 @setreuid(i32, i32) #1

declare i32 @setregid(i32, i32) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
