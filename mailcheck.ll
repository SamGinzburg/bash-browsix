; ModuleID = 'mailcheck.c'
source_filename = "mailcheck.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct._fileinfo = type { i8*, i8*, i32, i32, i32, i32 }
%struct.user_info = type { i32, i32, i32, i32, i8*, i8*, i8* }
%struct.stat = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }
%struct.timespec = type { i32, i32 }
%struct.variable = type { i8*, i8*, i8*, %struct.variable* (%struct.variable*)*, %struct.variable* (%struct.variable*, i8*, i64, i8*)*, i32, i32 }

@.str = private unnamed_addr constant [10 x i8] c"MAILCHECK\00", align 1
@last_time_mail_checked = internal global i32 0, align 4
@mailfiles_count = internal global i32 0, align 4
@mailfiles = internal global %struct._fileinfo** null, align 4
@.str.1 = private unnamed_addr constant [12 x i8] c"mailcheck.c\00", align 1
@current_user = external global %struct.user_info, align 4
@.str.2 = private unnamed_addr constant [10 x i8] c"/var/mail\00", align 1
@.str.3 = private unnamed_addr constant [9 x i8] c"MAILPATH\00", align 1
@.str.4 = private unnamed_addr constant [5 x i8] c"MAIL\00", align 1
@.str.5 = private unnamed_addr constant [2 x i8] c"_\00", align 1
@.str.6 = private unnamed_addr constant [20 x i8] c"You have mail in $_\00", align 1
@.str.7 = private unnamed_addr constant [24 x i8] c"You have new mail in $_\00", align 1
@mail_warning = common global i32 0, align 4
@.str.8 = private unnamed_addr constant [30 x i8] c"The mail in %s has been read\0A\00", align 1
@shell_start_time = external global i32, align 4

; Function Attrs: noinline nounwind
define i32 @time_to_check_mail() #0 {
entry:
  %retval = alloca i32, align 4
  %temp = alloca i8*, align 4
  %now = alloca i32, align 4
  %seconds = alloca i64, align 8
  %call = call i8* @get_string_value(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i32 0, i32 0))
  store i8* %call, i8** %temp, align 4
  %0 = load i8*, i8** %temp, align 4
  %cmp = icmp eq i8* %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i8*, i8** %temp, align 4
  %call1 = call i32 @legal_number(i8* %1, i64* %seconds)
  %cmp2 = icmp eq i32 %call1, 0
  br i1 %cmp2, label %if.then, label %lor.lhs.false3

lor.lhs.false3:                                   ; preds = %lor.lhs.false
  %2 = load i64, i64* %seconds, align 8
  %cmp4 = icmp slt i64 %2, 0
  br i1 %cmp4, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false3, %lor.lhs.false, %entry
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false3
  %call5 = call i32 @time(i32* null)
  store i32 %call5, i32* %now, align 4
  %3 = load i64, i64* %seconds, align 8
  %cmp6 = icmp eq i64 %3, 0
  br i1 %cmp6, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %if.end
  %4 = load i32, i32* %now, align 4
  %5 = load i32, i32* @last_time_mail_checked, align 4
  %sub = sub nsw i32 %4, %5
  %conv = sext i32 %sub to i64
  %6 = load i64, i64* %seconds, align 8
  %cmp7 = icmp sge i64 %conv, %6
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %if.end
  %7 = phi i1 [ true, %if.end ], [ %cmp7, %lor.rhs ]
  %lor.ext = zext i1 %7 to i32
  store i32 %lor.ext, i32* %retval, align 4
  br label %return

return:                                           ; preds = %lor.end, %if.then
  %8 = load i32, i32* %retval, align 4
  ret i32 %8
}

declare i8* @get_string_value(i8*) #1

declare i32 @legal_number(i8*, i64*) #1

declare i32 @time(i32*) #1

; Function Attrs: noinline nounwind
define void @reset_mail_timer() #0 {
entry:
  %call = call i32 @time(i32* null)
  store i32 %call, i32* @last_time_mail_checked, align 4
  ret void
}

; Function Attrs: noinline nounwind
define void @reset_mail_files() #0 {
entry:
  %i = alloca i32, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %1 = load i32, i32* @mailfiles_count, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  br label %do.body

do.body:                                          ; preds = %for.body
  %2 = load %struct._fileinfo**, %struct._fileinfo*** @mailfiles, align 4
  %3 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds %struct._fileinfo*, %struct._fileinfo** %2, i32 %3
  %4 = load %struct._fileinfo*, %struct._fileinfo** %arrayidx, align 4
  %mod_time = getelementptr inbounds %struct._fileinfo, %struct._fileinfo* %4, i32 0, i32 3
  store i32 0, i32* %mod_time, align 4
  %5 = load %struct._fileinfo**, %struct._fileinfo*** @mailfiles, align 4
  %6 = load i32, i32* %i, align 4
  %arrayidx1 = getelementptr inbounds %struct._fileinfo*, %struct._fileinfo** %5, i32 %6
  %7 = load %struct._fileinfo*, %struct._fileinfo** %arrayidx1, align 4
  %access_time = getelementptr inbounds %struct._fileinfo, %struct._fileinfo* %7, i32 0, i32 2
  store i32 0, i32* %access_time, align 4
  %8 = load %struct._fileinfo**, %struct._fileinfo*** @mailfiles, align 4
  %9 = load i32, i32* %i, align 4
  %arrayidx2 = getelementptr inbounds %struct._fileinfo*, %struct._fileinfo** %8, i32 %9
  %10 = load %struct._fileinfo*, %struct._fileinfo** %arrayidx2, align 4
  %file_size = getelementptr inbounds %struct._fileinfo, %struct._fileinfo* %10, i32 0, i32 4
  store i32 0, i32* %file_size, align 4
  %11 = load %struct._fileinfo**, %struct._fileinfo*** @mailfiles, align 4
  %12 = load i32, i32* %i, align 4
  %arrayidx3 = getelementptr inbounds %struct._fileinfo*, %struct._fileinfo** %11, i32 %12
  %13 = load %struct._fileinfo*, %struct._fileinfo** %arrayidx3, align 4
  %flags = getelementptr inbounds %struct._fileinfo, %struct._fileinfo* %13, i32 0, i32 5
  store i32 0, i32* %flags, align 4
  br label %do.end

do.end:                                           ; preds = %do.body
  br label %for.inc

for.inc:                                          ; preds = %do.end
  %14 = load i32, i32* %i, align 4
  %inc = add nsw i32 %14, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

; Function Attrs: noinline nounwind
define void @free_mail_files() #0 {
entry:
  %i = alloca i32, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %1 = load i32, i32* @mailfiles_count, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load %struct._fileinfo**, %struct._fileinfo*** @mailfiles, align 4
  %3 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds %struct._fileinfo*, %struct._fileinfo** %2, i32 %3
  %4 = load %struct._fileinfo*, %struct._fileinfo** %arrayidx, align 4
  call void @dispose_mail_file(%struct._fileinfo* %4)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4
  %inc = add nsw i32 %5, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %6 = load %struct._fileinfo**, %struct._fileinfo*** @mailfiles, align 4
  %tobool = icmp ne %struct._fileinfo** %6, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %for.end
  %7 = load %struct._fileinfo**, %struct._fileinfo*** @mailfiles, align 4
  %8 = bitcast %struct._fileinfo** %7 to i8*
  call void @sh_xfree(i8* %8, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 243)
  br label %if.end

if.end:                                           ; preds = %if.then, %for.end
  store i32 0, i32* @mailfiles_count, align 4
  store %struct._fileinfo** null, %struct._fileinfo*** @mailfiles, align 4
  ret void
}

; Function Attrs: noinline nounwind
define internal void @dispose_mail_file(%struct._fileinfo* %mf) #0 {
entry:
  %mf.addr = alloca %struct._fileinfo*, align 4
  store %struct._fileinfo* %mf, %struct._fileinfo** %mf.addr, align 4
  %0 = load %struct._fileinfo*, %struct._fileinfo** %mf.addr, align 4
  %name = getelementptr inbounds %struct._fileinfo, %struct._fileinfo* %0, i32 0, i32 0
  %1 = load i8*, i8** %name, align 4
  call void @sh_xfree(i8* %1, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 228)
  br label %do.body

do.body:                                          ; preds = %entry
  %2 = load %struct._fileinfo*, %struct._fileinfo** %mf.addr, align 4
  %msg = getelementptr inbounds %struct._fileinfo, %struct._fileinfo* %2, i32 0, i32 1
  %3 = load i8*, i8** %msg, align 4
  %tobool = icmp ne i8* %3, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %do.body
  %4 = load %struct._fileinfo*, %struct._fileinfo** %mf.addr, align 4
  %msg1 = getelementptr inbounds %struct._fileinfo, %struct._fileinfo* %4, i32 0, i32 1
  %5 = load i8*, i8** %msg1, align 4
  call void @sh_xfree(i8* %5, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 229)
  br label %if.end

if.end:                                           ; preds = %if.then, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  %6 = load %struct._fileinfo*, %struct._fileinfo** %mf.addr, align 4
  %7 = bitcast %struct._fileinfo* %6 to i8*
  call void @sh_xfree(i8* %7, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 230)
  ret void
}

declare void @sh_xfree(i8*, i8*, i32) #1

; Function Attrs: noinline nounwind
define void @init_mail_dates() #0 {
entry:
  %0 = load %struct._fileinfo**, %struct._fileinfo*** @mailfiles, align 4
  %cmp = icmp eq %struct._fileinfo** %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @remember_mail_dates()
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

; Function Attrs: noinline nounwind
define void @remember_mail_dates() #0 {
entry:
  %mailpaths = alloca i8*, align 4
  %mailfile = alloca i8*, align 4
  %mp = alloca i8*, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %i, align 4
  %call = call i8* @get_string_value(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i32 0, i32 0))
  store i8* %call, i8** %mailpaths, align 4
  %0 = load i8*, i8** %mailpaths, align 4
  %cmp = icmp eq i8* %0, null
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %call1 = call i8* @get_string_value(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.4, i32 0, i32 0))
  store i8* %call1, i8** %mailpaths, align 4
  %tobool = icmp ne i8* %call1, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %1 = load i8*, i8** %mailpaths, align 4
  %call2 = call i32 @add_mail_file(i8* %1, i8* null)
  br label %while.end

if.end:                                           ; preds = %land.lhs.true, %entry
  %2 = load i8*, i8** %mailpaths, align 4
  %cmp3 = icmp eq i8* %2, null
  br i1 %cmp3, label %if.then4, label %if.end10

if.then4:                                         ; preds = %if.end
  %call5 = call i8* @make_default_mailpath()
  store i8* %call5, i8** %mailpaths, align 4
  %3 = load i8*, i8** %mailpaths, align 4
  %tobool6 = icmp ne i8* %3, null
  br i1 %tobool6, label %if.then7, label %if.end9

if.then7:                                         ; preds = %if.then4
  %4 = load i8*, i8** %mailpaths, align 4
  %call8 = call i32 @add_mail_file(i8* %4, i8* null)
  %5 = load i8*, i8** %mailpaths, align 4
  call void @sh_xfree(i8* %5, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 389)
  br label %if.end9

if.end9:                                          ; preds = %if.then7, %if.then4
  br label %while.end

if.end10:                                         ; preds = %if.end
  br label %while.cond

while.cond:                                       ; preds = %if.end18, %if.end10
  %6 = load i8*, i8** %mailpaths, align 4
  %call11 = call i8* @extract_colon_unit(i8* %6, i32* %i)
  store i8* %call11, i8** %mailfile, align 4
  %tobool12 = icmp ne i8* %call11, null
  br i1 %tobool12, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %7 = load i8*, i8** %mailfile, align 4
  %call13 = call i8* @parse_mailpath_spec(i8* %7)
  store i8* %call13, i8** %mp, align 4
  %8 = load i8*, i8** %mp, align 4
  %tobool14 = icmp ne i8* %8, null
  br i1 %tobool14, label %land.lhs.true15, label %if.end18

land.lhs.true15:                                  ; preds = %while.body
  %9 = load i8*, i8** %mp, align 4
  %10 = load i8, i8* %9, align 1
  %conv = sext i8 %10 to i32
  %tobool16 = icmp ne i32 %conv, 0
  br i1 %tobool16, label %if.then17, label %if.end18

if.then17:                                        ; preds = %land.lhs.true15
  %11 = load i8*, i8** %mp, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %11, i32 1
  store i8* %incdec.ptr, i8** %mp, align 4
  store i8 0, i8* %11, align 1
  br label %if.end18

if.end18:                                         ; preds = %if.then17, %land.lhs.true15, %while.body
  %12 = load i8*, i8** %mailfile, align 4
  %13 = load i8*, i8** %mp, align 4
  %call19 = call i32 @add_mail_file(i8* %12, i8* %13)
  %14 = load i8*, i8** %mailfile, align 4
  call void @sh_xfree(i8* %14, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 400)
  br label %while.cond

while.end:                                        ; preds = %if.then, %if.end9, %while.cond
  ret void
}

; Function Attrs: noinline nounwind
define i8* @make_default_mailpath() #0 {
entry:
  %mp = alloca i8*, align 4
  call void @get_current_user_info()
  %0 = load i8*, i8** getelementptr inbounds (%struct.user_info, %struct.user_info* @current_user, i32 0, i32 4), align 4
  %call = call i32 @strlen(i8* %0)
  %add = add i32 12, %call
  %call1 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 353)
  store i8* %call1, i8** %mp, align 4
  %1 = load i8*, i8** %mp, align 4
  %call2 = call i8* @strcpy(i8* %1, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.2, i32 0, i32 0))
  %2 = load i8*, i8** %mp, align 4
  %arrayidx = getelementptr inbounds i8, i8* %2, i32 9
  store i8 47, i8* %arrayidx, align 1
  %3 = load i8*, i8** %mp, align 4
  %add.ptr = getelementptr inbounds i8, i8* %3, i32 10
  %4 = load i8*, i8** getelementptr inbounds (%struct.user_info, %struct.user_info* @current_user, i32 0, i32 4), align 4
  %call3 = call i8* @strcpy(i8* %add.ptr, i8* %4)
  %5 = load i8*, i8** %mp, align 4
  ret i8* %5
}

declare void @get_current_user_info() #1

declare i8* @sh_xmalloc(i32, i8*, i32) #1

declare i32 @strlen(i8*) #1

declare i8* @strcpy(i8*, i8*) #1

; Function Attrs: noinline nounwind
define internal i32 @add_mail_file(i8* %file, i8* %msg) #0 {
entry:
  %retval = alloca i32, align 4
  %file.addr = alloca i8*, align 4
  %msg.addr = alloca i8*, align 4
  %finfo = alloca %struct.stat, align 8
  %filename = alloca i8*, align 4
  %i = alloca i32, align 4
  store i8* %file, i8** %file.addr, align 4
  store i8* %msg, i8** %msg.addr, align 4
  %0 = load i8*, i8** %file.addr, align 4
  %call = call i8* @full_pathname(i8* %0)
  store i8* %call, i8** %filename, align 4
  %1 = load i8*, i8** %filename, align 4
  %call1 = call i32 @find_mail_file(i8* %1)
  store i32 %call1, i32* %i, align 4
  %2 = load i32, i32* %i, align 4
  %cmp = icmp sge i32 %2, 0
  br i1 %cmp, label %if.then, label %if.end9

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %filename, align 4
  %call2 = call i32 @mailstat(i8* %3, %struct.stat* %finfo)
  %cmp3 = icmp eq i32 %call2, 0
  br i1 %cmp3, label %if.then4, label %if.end

if.then4:                                         ; preds = %if.then
  br label %do.body

do.body:                                          ; preds = %if.then4
  %st_atim = getelementptr inbounds %struct.stat, %struct.stat* %finfo, i32 0, i32 18
  %tv_sec = getelementptr inbounds %struct.timespec, %struct.timespec* %st_atim, i32 0, i32 0
  %4 = load i32, i32* %tv_sec, align 8
  %5 = load %struct._fileinfo**, %struct._fileinfo*** @mailfiles, align 4
  %6 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds %struct._fileinfo*, %struct._fileinfo** %5, i32 %6
  %7 = load %struct._fileinfo*, %struct._fileinfo** %arrayidx, align 4
  %access_time = getelementptr inbounds %struct._fileinfo, %struct._fileinfo* %7, i32 0, i32 2
  store i32 %4, i32* %access_time, align 4
  %st_mtim = getelementptr inbounds %struct.stat, %struct.stat* %finfo, i32 0, i32 19
  %tv_sec5 = getelementptr inbounds %struct.timespec, %struct.timespec* %st_mtim, i32 0, i32 0
  %8 = load i32, i32* %tv_sec5, align 8
  %9 = load %struct._fileinfo**, %struct._fileinfo*** @mailfiles, align 4
  %10 = load i32, i32* %i, align 4
  %arrayidx6 = getelementptr inbounds %struct._fileinfo*, %struct._fileinfo** %9, i32 %10
  %11 = load %struct._fileinfo*, %struct._fileinfo** %arrayidx6, align 4
  %mod_time = getelementptr inbounds %struct._fileinfo, %struct._fileinfo* %11, i32 0, i32 3
  store i32 %8, i32* %mod_time, align 4
  %st_size = getelementptr inbounds %struct.stat, %struct.stat* %finfo, i32 0, i32 12
  %12 = load i32, i32* %st_size, align 8
  %13 = load %struct._fileinfo**, %struct._fileinfo*** @mailfiles, align 4
  %14 = load i32, i32* %i, align 4
  %arrayidx7 = getelementptr inbounds %struct._fileinfo*, %struct._fileinfo** %13, i32 %14
  %15 = load %struct._fileinfo*, %struct._fileinfo** %arrayidx7, align 4
  %file_size = getelementptr inbounds %struct._fileinfo, %struct._fileinfo* %15, i32 0, i32 4
  store i32 %12, i32* %file_size, align 4
  %16 = load %struct._fileinfo**, %struct._fileinfo*** @mailfiles, align 4
  %17 = load i32, i32* %i, align 4
  %arrayidx8 = getelementptr inbounds %struct._fileinfo*, %struct._fileinfo** %16, i32 %17
  %18 = load %struct._fileinfo*, %struct._fileinfo** %arrayidx8, align 4
  %flags = getelementptr inbounds %struct._fileinfo, %struct._fileinfo* %18, i32 0, i32 5
  %19 = load i32, i32* %flags, align 4
  %or = or i32 %19, 1
  store i32 %or, i32* %flags, align 4
  br label %do.end

do.end:                                           ; preds = %do.body
  br label %if.end

if.end:                                           ; preds = %do.end, %if.then
  %20 = load i8*, i8** %filename, align 4
  call void @sh_xfree(i8* %20, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 186)
  %21 = load i32, i32* %i, align 4
  store i32 %21, i32* %retval, align 4
  br label %return

if.end9:                                          ; preds = %entry
  %22 = load i32, i32* @mailfiles_count, align 4
  %inc = add nsw i32 %22, 1
  store i32 %inc, i32* @mailfiles_count, align 4
  store i32 %22, i32* %i, align 4
  %23 = load %struct._fileinfo**, %struct._fileinfo*** @mailfiles, align 4
  %24 = bitcast %struct._fileinfo** %23 to i8*
  %25 = load i32, i32* @mailfiles_count, align 4
  %mul = mul i32 %25, 4
  %call10 = call i8* @sh_xrealloc(i8* %24, i32 %mul, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 192)
  %26 = bitcast i8* %call10 to %struct._fileinfo**
  store %struct._fileinfo** %26, %struct._fileinfo*** @mailfiles, align 4
  %27 = load i8*, i8** %filename, align 4
  %28 = load i8*, i8** %msg.addr, align 4
  %call11 = call %struct._fileinfo* @alloc_mail_file(i8* %27, i8* %28)
  %29 = load %struct._fileinfo**, %struct._fileinfo*** @mailfiles, align 4
  %30 = load i32, i32* %i, align 4
  %arrayidx12 = getelementptr inbounds %struct._fileinfo*, %struct._fileinfo** %29, i32 %30
  store %struct._fileinfo* %call11, %struct._fileinfo** %arrayidx12, align 4
  %31 = load i32, i32* %i, align 4
  call void @init_mail_file(i32 %31)
  %32 = load i32, i32* %i, align 4
  store i32 %32, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end9, %if.end
  %33 = load i32, i32* %retval, align 4
  ret i32 %33
}

declare i8* @extract_colon_unit(i8*, i32*) #1

; Function Attrs: noinline nounwind
define internal i8* @parse_mailpath_spec(i8* %str) #0 {
entry:
  %retval = alloca i8*, align 4
  %str.addr = alloca i8*, align 4
  %s = alloca i8*, align 4
  %pass_next = alloca i32, align 4
  store i8* %str, i8** %str.addr, align 4
  %0 = load i8*, i8** %str.addr, align 4
  store i8* %0, i8** %s, align 4
  store i32 0, i32* %pass_next, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i8*, i8** %s, align 4
  %tobool = icmp ne i8* %1, null
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.cond
  %2 = load i8*, i8** %s, align 4
  %3 = load i8, i8* %2, align 1
  %conv = sext i8 %3 to i32
  %tobool1 = icmp ne i32 %conv, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %4 = phi i1 [ false, %for.cond ], [ %tobool1, %land.rhs ]
  br i1 %4, label %for.body, label %for.end

for.body:                                         ; preds = %land.end
  %5 = load i32, i32* %pass_next, align 4
  %tobool2 = icmp ne i32 %5, 0
  br i1 %tobool2, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  store i32 0, i32* %pass_next, align 4
  br label %for.inc

if.end:                                           ; preds = %for.body
  %6 = load i8*, i8** %s, align 4
  %7 = load i8, i8* %6, align 1
  %conv3 = sext i8 %7 to i32
  %cmp = icmp eq i32 %conv3, 92
  br i1 %cmp, label %if.then5, label %if.end6

if.then5:                                         ; preds = %if.end
  %8 = load i32, i32* %pass_next, align 4
  %inc = add nsw i32 %8, 1
  store i32 %inc, i32* %pass_next, align 4
  br label %for.inc

if.end6:                                          ; preds = %if.end
  %9 = load i8*, i8** %s, align 4
  %10 = load i8, i8* %9, align 1
  %conv7 = sext i8 %10 to i32
  %cmp8 = icmp eq i32 %conv7, 63
  br i1 %cmp8, label %if.then13, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end6
  %11 = load i8*, i8** %s, align 4
  %12 = load i8, i8* %11, align 1
  %conv10 = sext i8 %12 to i32
  %cmp11 = icmp eq i32 %conv10, 37
  br i1 %cmp11, label %if.then13, label %if.end14

if.then13:                                        ; preds = %lor.lhs.false, %if.end6
  %13 = load i8*, i8** %s, align 4
  store i8* %13, i8** %retval, align 4
  br label %return

if.end14:                                         ; preds = %lor.lhs.false
  br label %for.inc

for.inc:                                          ; preds = %if.end14, %if.then5, %if.then
  %14 = load i8*, i8** %s, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %14, i32 1
  store i8* %incdec.ptr, i8** %s, align 4
  br label %for.cond

for.end:                                          ; preds = %land.end
  store i8* null, i8** %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then13
  %15 = load i8*, i8** %retval, align 4
  ret i8* %15
}

; Function Attrs: noinline nounwind
define void @check_mail() #0 {
entry:
  %current_mail_file = alloca i8*, align 4
  %message = alloca i8*, align 4
  %i = alloca i32, align 4
  %use_user_notification = alloca i32, align 4
  %dollar_underscore = alloca i8*, align 4
  %temp = alloca i8*, align 4
  %file_is_bigger = alloca i32, align 4
  %call = call i8* @get_string_value(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.5, i32 0, i32 0))
  store i8* %call, i8** %dollar_underscore, align 4
  %0 = load i8*, i8** %dollar_underscore, align 4
  %tobool = icmp ne i8* %0, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %dollar_underscore, align 4
  %call1 = call i32 @strlen(i8* %1)
  %add = add i32 1, %call1
  %call2 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 425)
  %2 = load i8*, i8** %dollar_underscore, align 4
  %call3 = call i8* @strcpy(i8* %call2, i8* %2)
  store i8* %call3, i8** %dollar_underscore, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4
  %4 = load i32, i32* @mailfiles_count, align 4
  %cmp = icmp slt i32 %3, %4
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %5 = load %struct._fileinfo**, %struct._fileinfo*** @mailfiles, align 4
  %6 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds %struct._fileinfo*, %struct._fileinfo** %5, i32 %6
  %7 = load %struct._fileinfo*, %struct._fileinfo** %arrayidx, align 4
  %name = getelementptr inbounds %struct._fileinfo, %struct._fileinfo* %7, i32 0, i32 0
  %8 = load i8*, i8** %name, align 4
  store i8* %8, i8** %current_mail_file, align 4
  %9 = load i8*, i8** %current_mail_file, align 4
  %10 = load i8, i8* %9, align 1
  %conv = sext i8 %10 to i32
  %cmp4 = icmp eq i32 %conv, 0
  br i1 %cmp4, label %if.then6, label %if.end7

if.then6:                                         ; preds = %for.body
  br label %for.inc

if.end7:                                          ; preds = %for.body
  %11 = load i32, i32* %i, align 4
  %call8 = call i32 @file_mod_date_changed(i32 %11)
  %tobool9 = icmp ne i32 %call8, 0
  br i1 %tobool9, label %if.then10, label %if.end49

if.then10:                                        ; preds = %if.end7
  %12 = load %struct._fileinfo**, %struct._fileinfo*** @mailfiles, align 4
  %13 = load i32, i32* %i, align 4
  %arrayidx11 = getelementptr inbounds %struct._fileinfo*, %struct._fileinfo** %12, i32 %13
  %14 = load %struct._fileinfo*, %struct._fileinfo** %arrayidx11, align 4
  %msg = getelementptr inbounds %struct._fileinfo, %struct._fileinfo* %14, i32 0, i32 1
  %15 = load i8*, i8** %msg, align 4
  %cmp12 = icmp ne i8* %15, null
  %conv13 = zext i1 %cmp12 to i32
  store i32 %conv13, i32* %use_user_notification, align 4
  %16 = load %struct._fileinfo**, %struct._fileinfo*** @mailfiles, align 4
  %17 = load i32, i32* %i, align 4
  %arrayidx14 = getelementptr inbounds %struct._fileinfo*, %struct._fileinfo** %16, i32 %17
  %18 = load %struct._fileinfo*, %struct._fileinfo** %arrayidx14, align 4
  %msg15 = getelementptr inbounds %struct._fileinfo, %struct._fileinfo* %18, i32 0, i32 1
  %19 = load i8*, i8** %msg15, align 4
  %tobool16 = icmp ne i8* %19, null
  br i1 %tobool16, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then10
  %20 = load %struct._fileinfo**, %struct._fileinfo*** @mailfiles, align 4
  %21 = load i32, i32* %i, align 4
  %arrayidx17 = getelementptr inbounds %struct._fileinfo*, %struct._fileinfo** %20, i32 %21
  %22 = load %struct._fileinfo*, %struct._fileinfo** %arrayidx17, align 4
  %msg18 = getelementptr inbounds %struct._fileinfo, %struct._fileinfo* %22, i32 0, i32 1
  %23 = load i8*, i8** %msg18, align 4
  br label %cond.end

cond.false:                                       ; preds = %if.then10
  %call19 = call i8* @libintl_gettext(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.6, i32 0, i32 0))
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %23, %cond.true ], [ %call19, %cond.false ]
  store i8* %cond, i8** %message, align 4
  %24 = load i8*, i8** %current_mail_file, align 4
  %call20 = call %struct.variable* @bind_variable(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.5, i32 0, i32 0), i8* %24, i32 0)
  %25 = load i32, i32* %i, align 4
  %call21 = call i32 @file_has_grown(i32 %25)
  store i32 %call21, i32* %file_is_bigger, align 4
  %26 = load i32, i32* %i, align 4
  call void @update_mail_file(i32 %26)
  %27 = load %struct._fileinfo**, %struct._fileinfo*** @mailfiles, align 4
  %28 = load i32, i32* %i, align 4
  %arrayidx22 = getelementptr inbounds %struct._fileinfo*, %struct._fileinfo** %27, i32 %28
  %29 = load %struct._fileinfo*, %struct._fileinfo** %arrayidx22, align 4
  %access_time = getelementptr inbounds %struct._fileinfo, %struct._fileinfo* %29, i32 0, i32 2
  %30 = load i32, i32* %access_time, align 4
  %31 = load %struct._fileinfo**, %struct._fileinfo*** @mailfiles, align 4
  %32 = load i32, i32* %i, align 4
  %arrayidx23 = getelementptr inbounds %struct._fileinfo*, %struct._fileinfo** %31, i32 %32
  %33 = load %struct._fileinfo*, %struct._fileinfo** %arrayidx23, align 4
  %mod_time = getelementptr inbounds %struct._fileinfo, %struct._fileinfo* %33, i32 0, i32 3
  %34 = load i32, i32* %mod_time, align 4
  %cmp24 = icmp sge i32 %30, %34
  br i1 %cmp24, label %land.lhs.true, label %if.end28

land.lhs.true:                                    ; preds = %cond.end
  %35 = load i32, i32* %file_is_bigger, align 4
  %tobool26 = icmp ne i32 %35, 0
  br i1 %tobool26, label %if.end28, label %if.then27

if.then27:                                        ; preds = %land.lhs.true
  br label %for.inc

if.end28:                                         ; preds = %land.lhs.true, %cond.end
  %36 = load i32, i32* %use_user_notification, align 4
  %cmp29 = icmp eq i32 %36, 0
  br i1 %cmp29, label %land.lhs.true31, label %if.end42

land.lhs.true31:                                  ; preds = %if.end28
  %37 = load %struct._fileinfo**, %struct._fileinfo*** @mailfiles, align 4
  %38 = load i32, i32* %i, align 4
  %arrayidx32 = getelementptr inbounds %struct._fileinfo*, %struct._fileinfo** %37, i32 %38
  %39 = load %struct._fileinfo*, %struct._fileinfo** %arrayidx32, align 4
  %access_time33 = getelementptr inbounds %struct._fileinfo, %struct._fileinfo* %39, i32 0, i32 2
  %40 = load i32, i32* %access_time33, align 4
  %41 = load %struct._fileinfo**, %struct._fileinfo*** @mailfiles, align 4
  %42 = load i32, i32* %i, align 4
  %arrayidx34 = getelementptr inbounds %struct._fileinfo*, %struct._fileinfo** %41, i32 %42
  %43 = load %struct._fileinfo*, %struct._fileinfo** %arrayidx34, align 4
  %mod_time35 = getelementptr inbounds %struct._fileinfo, %struct._fileinfo* %43, i32 0, i32 3
  %44 = load i32, i32* %mod_time35, align 4
  %cmp36 = icmp slt i32 %40, %44
  br i1 %cmp36, label %land.lhs.true38, label %if.end42

land.lhs.true38:                                  ; preds = %land.lhs.true31
  %45 = load i32, i32* %file_is_bigger, align 4
  %tobool39 = icmp ne i32 %45, 0
  br i1 %tobool39, label %if.then40, label %if.end42

if.then40:                                        ; preds = %land.lhs.true38
  %call41 = call i8* @libintl_gettext(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.7, i32 0, i32 0))
  store i8* %call41, i8** %message, align 4
  br label %if.end42

if.end42:                                         ; preds = %if.then40, %land.lhs.true38, %land.lhs.true31, %if.end28
  %46 = load i8*, i8** %message, align 4
  %call43 = call i8* @expand_string_to_string(i8* %46, i32 1)
  store i8* %call43, i8** %temp, align 4
  %tobool44 = icmp ne i8* %call43, null
  br i1 %tobool44, label %if.then45, label %if.else

if.then45:                                        ; preds = %if.end42
  %47 = load i8*, i8** %temp, align 4
  %call46 = call i32 @puts(i8* %47)
  %48 = load i8*, i8** %temp, align 4
  call void @sh_xfree(i8* %48, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 471)
  br label %if.end48

if.else:                                          ; preds = %if.end42
  %call47 = call i32 @putchar(i32 10)
  br label %if.end48

if.end48:                                         ; preds = %if.else, %if.then45
  br label %if.end49

if.end49:                                         ; preds = %if.end48, %if.end7
  %49 = load i32, i32* @mail_warning, align 4
  %tobool50 = icmp ne i32 %49, 0
  br i1 %tobool50, label %land.lhs.true51, label %if.end57

land.lhs.true51:                                  ; preds = %if.end49
  %50 = load i32, i32* %i, align 4
  %call52 = call i32 @file_access_date_changed(i32 %50)
  %tobool53 = icmp ne i32 %call52, 0
  br i1 %tobool53, label %if.then54, label %if.end57

if.then54:                                        ; preds = %land.lhs.true51
  %51 = load i32, i32* %i, align 4
  call void @update_mail_file(i32 %51)
  %call55 = call i8* @libintl_gettext(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.8, i32 0, i32 0))
  %52 = load i8*, i8** %current_mail_file, align 4
  %call56 = call i32 (i8*, ...) @printf(i8* %call55, i8* %52)
  br label %if.end57

if.end57:                                         ; preds = %if.then54, %land.lhs.true51, %if.end49
  br label %for.inc

for.inc:                                          ; preds = %if.end57, %if.then27, %if.then6
  %53 = load i32, i32* %i, align 4
  %inc = add nsw i32 %53, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %54 = load i8*, i8** %dollar_underscore, align 4
  %tobool58 = icmp ne i8* %54, null
  br i1 %tobool58, label %if.then59, label %if.else61

if.then59:                                        ; preds = %for.end
  %55 = load i8*, i8** %dollar_underscore, align 4
  %call60 = call %struct.variable* @bind_variable(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.5, i32 0, i32 0), i8* %55, i32 0)
  %56 = load i8*, i8** %dollar_underscore, align 4
  call void @sh_xfree(i8* %56, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 487)
  br label %if.end63

if.else61:                                        ; preds = %for.end
  %call62 = call i32 @unbind_variable(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.5, i32 0, i32 0))
  br label %if.end63

if.end63:                                         ; preds = %if.else61, %if.then59
  ret void
}

; Function Attrs: noinline nounwind
define internal i32 @file_mod_date_changed(i32 %i) #0 {
entry:
  %retval = alloca i32, align 4
  %i.addr = alloca i32, align 4
  %mtime = alloca i32, align 4
  %finfo = alloca %struct.stat, align 8
  %file = alloca i8*, align 4
  store i32 %i, i32* %i.addr, align 4
  %0 = load %struct._fileinfo**, %struct._fileinfo*** @mailfiles, align 4
  %1 = load i32, i32* %i.addr, align 4
  %arrayidx = getelementptr inbounds %struct._fileinfo*, %struct._fileinfo** %0, i32 %1
  %2 = load %struct._fileinfo*, %struct._fileinfo** %arrayidx, align 4
  %name = getelementptr inbounds %struct._fileinfo, %struct._fileinfo* %2, i32 0, i32 0
  %3 = load i8*, i8** %name, align 4
  store i8* %3, i8** %file, align 4
  %4 = load %struct._fileinfo**, %struct._fileinfo*** @mailfiles, align 4
  %5 = load i32, i32* %i.addr, align 4
  %arrayidx1 = getelementptr inbounds %struct._fileinfo*, %struct._fileinfo** %4, i32 %5
  %6 = load %struct._fileinfo*, %struct._fileinfo** %arrayidx1, align 4
  %mod_time = getelementptr inbounds %struct._fileinfo, %struct._fileinfo* %6, i32 0, i32 3
  %7 = load i32, i32* %mod_time, align 4
  store i32 %7, i32* %mtime, align 4
  %8 = load i8*, i8** %file, align 4
  %call = call i32 @mailstat(i8* %8, %struct.stat* %finfo)
  %cmp = icmp ne i32 %call, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %st_size = getelementptr inbounds %struct.stat, %struct.stat* %finfo, i32 0, i32 12
  %9 = load i32, i32* %st_size, align 8
  %cmp2 = icmp sgt i32 %9, 0
  br i1 %cmp2, label %if.then3, label %if.end5

if.then3:                                         ; preds = %if.end
  %10 = load i32, i32* %mtime, align 4
  %st_mtim = getelementptr inbounds %struct.stat, %struct.stat* %finfo, i32 0, i32 19
  %tv_sec = getelementptr inbounds %struct.timespec, %struct.timespec* %st_mtim, i32 0, i32 0
  %11 = load i32, i32* %tv_sec, align 8
  %cmp4 = icmp slt i32 %10, %11
  %conv = zext i1 %cmp4 to i32
  store i32 %conv, i32* %retval, align 4
  br label %return

if.end5:                                          ; preds = %if.end
  %st_size6 = getelementptr inbounds %struct.stat, %struct.stat* %finfo, i32 0, i32 12
  %12 = load i32, i32* %st_size6, align 8
  %cmp7 = icmp eq i32 %12, 0
  br i1 %cmp7, label %land.lhs.true, label %if.end23

land.lhs.true:                                    ; preds = %if.end5
  %13 = load %struct._fileinfo**, %struct._fileinfo*** @mailfiles, align 4
  %14 = load i32, i32* %i.addr, align 4
  %arrayidx9 = getelementptr inbounds %struct._fileinfo*, %struct._fileinfo** %13, i32 %14
  %15 = load %struct._fileinfo*, %struct._fileinfo** %arrayidx9, align 4
  %file_size = getelementptr inbounds %struct._fileinfo, %struct._fileinfo* %15, i32 0, i32 4
  %16 = load i32, i32* %file_size, align 4
  %cmp10 = icmp sgt i32 %16, 0
  br i1 %cmp10, label %if.then12, label %if.end23

if.then12:                                        ; preds = %land.lhs.true
  br label %do.body

do.body:                                          ; preds = %if.then12
  %st_atim = getelementptr inbounds %struct.stat, %struct.stat* %finfo, i32 0, i32 18
  %tv_sec13 = getelementptr inbounds %struct.timespec, %struct.timespec* %st_atim, i32 0, i32 0
  %17 = load i32, i32* %tv_sec13, align 8
  %18 = load %struct._fileinfo**, %struct._fileinfo*** @mailfiles, align 4
  %19 = load i32, i32* %i.addr, align 4
  %arrayidx14 = getelementptr inbounds %struct._fileinfo*, %struct._fileinfo** %18, i32 %19
  %20 = load %struct._fileinfo*, %struct._fileinfo** %arrayidx14, align 4
  %access_time = getelementptr inbounds %struct._fileinfo, %struct._fileinfo* %20, i32 0, i32 2
  store i32 %17, i32* %access_time, align 4
  %st_mtim15 = getelementptr inbounds %struct.stat, %struct.stat* %finfo, i32 0, i32 19
  %tv_sec16 = getelementptr inbounds %struct.timespec, %struct.timespec* %st_mtim15, i32 0, i32 0
  %21 = load i32, i32* %tv_sec16, align 8
  %22 = load %struct._fileinfo**, %struct._fileinfo*** @mailfiles, align 4
  %23 = load i32, i32* %i.addr, align 4
  %arrayidx17 = getelementptr inbounds %struct._fileinfo*, %struct._fileinfo** %22, i32 %23
  %24 = load %struct._fileinfo*, %struct._fileinfo** %arrayidx17, align 4
  %mod_time18 = getelementptr inbounds %struct._fileinfo, %struct._fileinfo* %24, i32 0, i32 3
  store i32 %21, i32* %mod_time18, align 4
  %st_size19 = getelementptr inbounds %struct.stat, %struct.stat* %finfo, i32 0, i32 12
  %25 = load i32, i32* %st_size19, align 8
  %26 = load %struct._fileinfo**, %struct._fileinfo*** @mailfiles, align 4
  %27 = load i32, i32* %i.addr, align 4
  %arrayidx20 = getelementptr inbounds %struct._fileinfo*, %struct._fileinfo** %26, i32 %27
  %28 = load %struct._fileinfo*, %struct._fileinfo** %arrayidx20, align 4
  %file_size21 = getelementptr inbounds %struct._fileinfo, %struct._fileinfo* %28, i32 0, i32 4
  store i32 %25, i32* %file_size21, align 4
  %29 = load %struct._fileinfo**, %struct._fileinfo*** @mailfiles, align 4
  %30 = load i32, i32* %i.addr, align 4
  %arrayidx22 = getelementptr inbounds %struct._fileinfo*, %struct._fileinfo** %29, i32 %30
  %31 = load %struct._fileinfo*, %struct._fileinfo** %arrayidx22, align 4
  %flags = getelementptr inbounds %struct._fileinfo, %struct._fileinfo* %31, i32 0, i32 5
  %32 = load i32, i32* %flags, align 4
  %or = or i32 %32, 1
  store i32 %or, i32* %flags, align 4
  br label %do.end

do.end:                                           ; preds = %do.body
  br label %if.end23

if.end23:                                         ; preds = %do.end, %land.lhs.true, %if.end5
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end23, %if.then3, %if.then
  %33 = load i32, i32* %retval, align 4
  ret i32 %33
}

declare i8* @libintl_gettext(i8*) #1

declare %struct.variable* @bind_variable(i8*, i8*, i32) #1

; Function Attrs: noinline nounwind
define internal i32 @file_has_grown(i32 %i) #0 {
entry:
  %i.addr = alloca i32, align 4
  %size = alloca i32, align 4
  %finfo = alloca %struct.stat, align 8
  %file = alloca i8*, align 4
  store i32 %i, i32* %i.addr, align 4
  %0 = load %struct._fileinfo**, %struct._fileinfo*** @mailfiles, align 4
  %1 = load i32, i32* %i.addr, align 4
  %arrayidx = getelementptr inbounds %struct._fileinfo*, %struct._fileinfo** %0, i32 %1
  %2 = load %struct._fileinfo*, %struct._fileinfo** %arrayidx, align 4
  %name = getelementptr inbounds %struct._fileinfo, %struct._fileinfo* %2, i32 0, i32 0
  %3 = load i8*, i8** %name, align 4
  store i8* %3, i8** %file, align 4
  %4 = load %struct._fileinfo**, %struct._fileinfo*** @mailfiles, align 4
  %5 = load i32, i32* %i.addr, align 4
  %arrayidx1 = getelementptr inbounds %struct._fileinfo*, %struct._fileinfo** %4, i32 %5
  %6 = load %struct._fileinfo*, %struct._fileinfo** %arrayidx1, align 4
  %file_size = getelementptr inbounds %struct._fileinfo, %struct._fileinfo* %6, i32 0, i32 4
  %7 = load i32, i32* %file_size, align 4
  store i32 %7, i32* %size, align 4
  %8 = load i8*, i8** %file, align 4
  %call = call i32 @mailstat(i8* %8, %struct.stat* %finfo)
  %cmp = icmp eq i32 %call, 0
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %entry
  %st_size = getelementptr inbounds %struct.stat, %struct.stat* %finfo, i32 0, i32 12
  %9 = load i32, i32* %st_size, align 8
  %10 = load i32, i32* %size, align 4
  %cmp2 = icmp sgt i32 %9, %10
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %11 = phi i1 [ false, %entry ], [ %cmp2, %land.rhs ]
  %land.ext = zext i1 %11 to i32
  ret i32 %land.ext
}

; Function Attrs: noinline nounwind
define internal void @update_mail_file(i32 %i) #0 {
entry:
  %i.addr = alloca i32, align 4
  %file = alloca i8*, align 4
  %finfo = alloca %struct.stat, align 8
  store i32 %i, i32* %i.addr, align 4
  %0 = load %struct._fileinfo**, %struct._fileinfo*** @mailfiles, align 4
  %1 = load i32, i32* %i.addr, align 4
  %arrayidx = getelementptr inbounds %struct._fileinfo*, %struct._fileinfo** %0, i32 %1
  %2 = load %struct._fileinfo*, %struct._fileinfo** %arrayidx, align 4
  %name = getelementptr inbounds %struct._fileinfo, %struct._fileinfo* %2, i32 0, i32 0
  %3 = load i8*, i8** %name, align 4
  store i8* %3, i8** %file, align 4
  %4 = load i8*, i8** %file, align 4
  %call = call i32 @mailstat(i8* %4, %struct.stat* %finfo)
  %cmp = icmp eq i32 %call, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  br label %do.body

do.body:                                          ; preds = %if.then
  %st_atim = getelementptr inbounds %struct.stat, %struct.stat* %finfo, i32 0, i32 18
  %tv_sec = getelementptr inbounds %struct.timespec, %struct.timespec* %st_atim, i32 0, i32 0
  %5 = load i32, i32* %tv_sec, align 8
  %6 = load %struct._fileinfo**, %struct._fileinfo*** @mailfiles, align 4
  %7 = load i32, i32* %i.addr, align 4
  %arrayidx1 = getelementptr inbounds %struct._fileinfo*, %struct._fileinfo** %6, i32 %7
  %8 = load %struct._fileinfo*, %struct._fileinfo** %arrayidx1, align 4
  %access_time = getelementptr inbounds %struct._fileinfo, %struct._fileinfo* %8, i32 0, i32 2
  store i32 %5, i32* %access_time, align 4
  %st_mtim = getelementptr inbounds %struct.stat, %struct.stat* %finfo, i32 0, i32 19
  %tv_sec2 = getelementptr inbounds %struct.timespec, %struct.timespec* %st_mtim, i32 0, i32 0
  %9 = load i32, i32* %tv_sec2, align 8
  %10 = load %struct._fileinfo**, %struct._fileinfo*** @mailfiles, align 4
  %11 = load i32, i32* %i.addr, align 4
  %arrayidx3 = getelementptr inbounds %struct._fileinfo*, %struct._fileinfo** %10, i32 %11
  %12 = load %struct._fileinfo*, %struct._fileinfo** %arrayidx3, align 4
  %mod_time = getelementptr inbounds %struct._fileinfo, %struct._fileinfo* %12, i32 0, i32 3
  store i32 %9, i32* %mod_time, align 4
  %st_size = getelementptr inbounds %struct.stat, %struct.stat* %finfo, i32 0, i32 12
  %13 = load i32, i32* %st_size, align 8
  %14 = load %struct._fileinfo**, %struct._fileinfo*** @mailfiles, align 4
  %15 = load i32, i32* %i.addr, align 4
  %arrayidx4 = getelementptr inbounds %struct._fileinfo*, %struct._fileinfo** %14, i32 %15
  %16 = load %struct._fileinfo*, %struct._fileinfo** %arrayidx4, align 4
  %file_size = getelementptr inbounds %struct._fileinfo, %struct._fileinfo* %16, i32 0, i32 4
  store i32 %13, i32* %file_size, align 4
  %17 = load %struct._fileinfo**, %struct._fileinfo*** @mailfiles, align 4
  %18 = load i32, i32* %i.addr, align 4
  %arrayidx5 = getelementptr inbounds %struct._fileinfo*, %struct._fileinfo** %17, i32 %18
  %19 = load %struct._fileinfo*, %struct._fileinfo** %arrayidx5, align 4
  %flags = getelementptr inbounds %struct._fileinfo, %struct._fileinfo* %19, i32 0, i32 5
  %20 = load i32, i32* %flags, align 4
  %or = or i32 %20, 1
  store i32 %or, i32* %flags, align 4
  br label %do.end

do.end:                                           ; preds = %do.body
  br label %if.end

if.else:                                          ; preds = %entry
  br label %do.body6

do.body6:                                         ; preds = %if.else
  %21 = load %struct._fileinfo**, %struct._fileinfo*** @mailfiles, align 4
  %22 = load i32, i32* %i.addr, align 4
  %arrayidx7 = getelementptr inbounds %struct._fileinfo*, %struct._fileinfo** %21, i32 %22
  %23 = load %struct._fileinfo*, %struct._fileinfo** %arrayidx7, align 4
  %mod_time8 = getelementptr inbounds %struct._fileinfo, %struct._fileinfo* %23, i32 0, i32 3
  store i32 0, i32* %mod_time8, align 4
  %24 = load %struct._fileinfo**, %struct._fileinfo*** @mailfiles, align 4
  %25 = load i32, i32* %i.addr, align 4
  %arrayidx9 = getelementptr inbounds %struct._fileinfo*, %struct._fileinfo** %24, i32 %25
  %26 = load %struct._fileinfo*, %struct._fileinfo** %arrayidx9, align 4
  %access_time10 = getelementptr inbounds %struct._fileinfo, %struct._fileinfo* %26, i32 0, i32 2
  store i32 0, i32* %access_time10, align 4
  %27 = load %struct._fileinfo**, %struct._fileinfo*** @mailfiles, align 4
  %28 = load i32, i32* %i.addr, align 4
  %arrayidx11 = getelementptr inbounds %struct._fileinfo*, %struct._fileinfo** %27, i32 %28
  %29 = load %struct._fileinfo*, %struct._fileinfo** %arrayidx11, align 4
  %file_size12 = getelementptr inbounds %struct._fileinfo, %struct._fileinfo* %29, i32 0, i32 4
  store i32 0, i32* %file_size12, align 4
  %30 = load %struct._fileinfo**, %struct._fileinfo*** @mailfiles, align 4
  %31 = load i32, i32* %i.addr, align 4
  %arrayidx13 = getelementptr inbounds %struct._fileinfo*, %struct._fileinfo** %30, i32 %31
  %32 = load %struct._fileinfo*, %struct._fileinfo** %arrayidx13, align 4
  %flags14 = getelementptr inbounds %struct._fileinfo, %struct._fileinfo* %32, i32 0, i32 5
  store i32 0, i32* %flags14, align 4
  br label %do.end15

do.end15:                                         ; preds = %do.body6
  br label %if.end

if.end:                                           ; preds = %do.end15, %do.end
  ret void
}

declare i8* @expand_string_to_string(i8*, i32) #1

declare i32 @puts(i8*) #1

declare i32 @putchar(i32) #1

; Function Attrs: noinline nounwind
define internal i32 @file_access_date_changed(i32 %i) #0 {
entry:
  %retval = alloca i32, align 4
  %i.addr = alloca i32, align 4
  %atime = alloca i32, align 4
  %finfo = alloca %struct.stat, align 8
  %file = alloca i8*, align 4
  store i32 %i, i32* %i.addr, align 4
  %0 = load %struct._fileinfo**, %struct._fileinfo*** @mailfiles, align 4
  %1 = load i32, i32* %i.addr, align 4
  %arrayidx = getelementptr inbounds %struct._fileinfo*, %struct._fileinfo** %0, i32 %1
  %2 = load %struct._fileinfo*, %struct._fileinfo** %arrayidx, align 4
  %name = getelementptr inbounds %struct._fileinfo, %struct._fileinfo* %2, i32 0, i32 0
  %3 = load i8*, i8** %name, align 4
  store i8* %3, i8** %file, align 4
  %4 = load %struct._fileinfo**, %struct._fileinfo*** @mailfiles, align 4
  %5 = load i32, i32* %i.addr, align 4
  %arrayidx1 = getelementptr inbounds %struct._fileinfo*, %struct._fileinfo** %4, i32 %5
  %6 = load %struct._fileinfo*, %struct._fileinfo** %arrayidx1, align 4
  %access_time = getelementptr inbounds %struct._fileinfo, %struct._fileinfo* %6, i32 0, i32 2
  %7 = load i32, i32* %access_time, align 4
  store i32 %7, i32* %atime, align 4
  %8 = load i8*, i8** %file, align 4
  %call = call i32 @mailstat(i8* %8, %struct.stat* %finfo)
  %cmp = icmp ne i32 %call, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %st_size = getelementptr inbounds %struct.stat, %struct.stat* %finfo, i32 0, i32 12
  %9 = load i32, i32* %st_size, align 8
  %cmp2 = icmp sgt i32 %9, 0
  br i1 %cmp2, label %if.then3, label %if.end5

if.then3:                                         ; preds = %if.end
  %10 = load i32, i32* %atime, align 4
  %st_atim = getelementptr inbounds %struct.stat, %struct.stat* %finfo, i32 0, i32 18
  %tv_sec = getelementptr inbounds %struct.timespec, %struct.timespec* %st_atim, i32 0, i32 0
  %11 = load i32, i32* %tv_sec, align 8
  %cmp4 = icmp slt i32 %10, %11
  %conv = zext i1 %cmp4 to i32
  store i32 %conv, i32* %retval, align 4
  br label %return

if.end5:                                          ; preds = %if.end
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end5, %if.then3, %if.then
  %12 = load i32, i32* %retval, align 4
  ret i32 %12
}

declare i32 @printf(i8*, ...) #1

declare i32 @unbind_variable(i8*) #1

declare i8* @full_pathname(i8*) #1

; Function Attrs: noinline nounwind
define internal i32 @find_mail_file(i8* %file) #0 {
entry:
  %retval = alloca i32, align 4
  %file.addr = alloca i8*, align 4
  %i = alloca i32, align 4
  store i8* %file, i8** %file.addr, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %1 = load i32, i32* @mailfiles_count, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load %struct._fileinfo**, %struct._fileinfo*** @mailfiles, align 4
  %3 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds %struct._fileinfo*, %struct._fileinfo** %2, i32 %3
  %4 = load %struct._fileinfo*, %struct._fileinfo** %arrayidx, align 4
  %name = getelementptr inbounds %struct._fileinfo, %struct._fileinfo* %4, i32 0, i32 0
  %5 = load i8*, i8** %name, align 4
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i32 0
  %6 = load i8, i8* %arrayidx1, align 1
  %conv = sext i8 %6 to i32
  %7 = load i8*, i8** %file.addr, align 4
  %arrayidx2 = getelementptr inbounds i8, i8* %7, i32 0
  %8 = load i8, i8* %arrayidx2, align 1
  %conv3 = sext i8 %8 to i32
  %cmp4 = icmp eq i32 %conv, %conv3
  br i1 %cmp4, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %for.body
  %9 = load %struct._fileinfo**, %struct._fileinfo*** @mailfiles, align 4
  %10 = load i32, i32* %i, align 4
  %arrayidx6 = getelementptr inbounds %struct._fileinfo*, %struct._fileinfo** %9, i32 %10
  %11 = load %struct._fileinfo*, %struct._fileinfo** %arrayidx6, align 4
  %name7 = getelementptr inbounds %struct._fileinfo, %struct._fileinfo* %11, i32 0, i32 0
  %12 = load i8*, i8** %name7, align 4
  %13 = load i8*, i8** %file.addr, align 4
  %call = call i32 @strcmp(i8* %12, i8* %13)
  %cmp8 = icmp eq i32 %call, 0
  br i1 %cmp8, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %14 = load i32, i32* %i, align 4
  store i32 %14, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %land.lhs.true, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %15 = load i32, i32* %i, align 4
  %inc = add nsw i32 %15, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 -1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then
  %16 = load i32, i32* %retval, align 4
  ret i32 %16
}

declare i32 @mailstat(i8*, %struct.stat*) #1

declare i8* @sh_xrealloc(i8*, i32, i8*, i32) #1

; Function Attrs: noinline nounwind
define internal %struct._fileinfo* @alloc_mail_file(i8* %filename, i8* %msg) #0 {
entry:
  %filename.addr = alloca i8*, align 4
  %msg.addr = alloca i8*, align 4
  %mf = alloca %struct._fileinfo*, align 4
  store i8* %filename, i8** %filename.addr, align 4
  store i8* %msg, i8** %msg.addr, align 4
  %call = call i8* @sh_xmalloc(i32 24, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 216)
  %0 = bitcast i8* %call to %struct._fileinfo*
  store %struct._fileinfo* %0, %struct._fileinfo** %mf, align 4
  %1 = load i8*, i8** %filename.addr, align 4
  %2 = load %struct._fileinfo*, %struct._fileinfo** %mf, align 4
  %name = getelementptr inbounds %struct._fileinfo, %struct._fileinfo* %2, i32 0, i32 0
  store i8* %1, i8** %name, align 4
  %3 = load i8*, i8** %msg.addr, align 4
  %tobool = icmp ne i8* %3, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %4 = load i8*, i8** %msg.addr, align 4
  %call1 = call i32 @strlen(i8* %4)
  %add = add i32 1, %call1
  %call2 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 218)
  %5 = load i8*, i8** %msg.addr, align 4
  %call3 = call i8* @strcpy(i8* %call2, i8* %5)
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %call3, %cond.true ], [ null, %cond.false ]
  %6 = load %struct._fileinfo*, %struct._fileinfo** %mf, align 4
  %msg4 = getelementptr inbounds %struct._fileinfo, %struct._fileinfo* %6, i32 0, i32 1
  store i8* %cond, i8** %msg4, align 4
  %7 = load %struct._fileinfo*, %struct._fileinfo** %mf, align 4
  %flags = getelementptr inbounds %struct._fileinfo, %struct._fileinfo* %7, i32 0, i32 5
  store i32 0, i32* %flags, align 4
  %8 = load %struct._fileinfo*, %struct._fileinfo** %mf, align 4
  ret %struct._fileinfo* %8
}

; Function Attrs: noinline nounwind
define internal void @init_mail_file(i32 %i) #0 {
entry:
  %i.addr = alloca i32, align 4
  store i32 %i, i32* %i.addr, align 4
  %0 = load i32, i32* @last_time_mail_checked, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %1 = load i32, i32* @last_time_mail_checked, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  %2 = load i32, i32* @shell_start_time, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %1, %cond.true ], [ %2, %cond.false ]
  %3 = load %struct._fileinfo**, %struct._fileinfo*** @mailfiles, align 4
  %4 = load i32, i32* %i.addr, align 4
  %arrayidx = getelementptr inbounds %struct._fileinfo*, %struct._fileinfo** %3, i32 %4
  %5 = load %struct._fileinfo*, %struct._fileinfo** %arrayidx, align 4
  %mod_time = getelementptr inbounds %struct._fileinfo, %struct._fileinfo* %5, i32 0, i32 3
  store i32 %cond, i32* %mod_time, align 4
  %6 = load %struct._fileinfo**, %struct._fileinfo*** @mailfiles, align 4
  %7 = load i32, i32* %i.addr, align 4
  %arrayidx1 = getelementptr inbounds %struct._fileinfo*, %struct._fileinfo** %6, i32 %7
  %8 = load %struct._fileinfo*, %struct._fileinfo** %arrayidx1, align 4
  %access_time = getelementptr inbounds %struct._fileinfo, %struct._fileinfo* %8, i32 0, i32 2
  store i32 %cond, i32* %access_time, align 4
  %9 = load %struct._fileinfo**, %struct._fileinfo*** @mailfiles, align 4
  %10 = load i32, i32* %i.addr, align 4
  %arrayidx2 = getelementptr inbounds %struct._fileinfo*, %struct._fileinfo** %9, i32 %10
  %11 = load %struct._fileinfo*, %struct._fileinfo** %arrayidx2, align 4
  %file_size = getelementptr inbounds %struct._fileinfo, %struct._fileinfo* %11, i32 0, i32 4
  store i32 0, i32* %file_size, align 4
  %12 = load %struct._fileinfo**, %struct._fileinfo*** @mailfiles, align 4
  %13 = load i32, i32* %i.addr, align 4
  %arrayidx3 = getelementptr inbounds %struct._fileinfo*, %struct._fileinfo** %12, i32 %13
  %14 = load %struct._fileinfo*, %struct._fileinfo** %arrayidx3, align 4
  %flags = getelementptr inbounds %struct._fileinfo, %struct._fileinfo* %14, i32 0, i32 5
  store i32 0, i32* %flags, align 4
  ret void
}

declare i32 @strcmp(i8*, i8*) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
