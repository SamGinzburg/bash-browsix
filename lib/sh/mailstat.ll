; ModuleID = 'mailstat.c'
source_filename = "mailstat.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.stat = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }
%struct.timespec = type { i32, i32 }
%struct.__dirstream = type opaque
%struct.dirent = type { i32, i32, i32, i32, i16, i8, [256 x i8] }

@mailstat.st_new_last = internal global %struct.stat zeroinitializer, align 8
@mailstat.st_ret_last = internal global %struct.stat zeroinitializer, align 8
@.str = private unnamed_addr constant [7 x i8] c"%s/cur\00", align 1
@.str.1 = private unnamed_addr constant [7 x i8] c"%s/tmp\00", align 1
@.str.2 = private unnamed_addr constant [7 x i8] c"%s/new\00", align 1
@.str.3 = private unnamed_addr constant [6 x i8] c"%s/%s\00", align 1
@.str.4 = private unnamed_addr constant [4 x i8] c"cur\00", align 1
@.str.5 = private unnamed_addr constant [4 x i8] c"new\00", align 1
@.str.6 = private unnamed_addr constant [4 x i8] c"%s/\00", align 1

; Function Attrs: noinline nounwind
define i32 @mailstat(i8* %path, %struct.stat* %st) #0 {
entry:
  %retval = alloca i32, align 4
  %path.addr = alloca i8*, align 4
  %st.addr = alloca %struct.stat*, align 4
  %st_ret = alloca %struct.stat, align 8
  %st_tmp = alloca %struct.stat, align 8
  %dd = alloca %struct.__dirstream*, align 4
  %fn = alloca %struct.dirent*, align 4
  %dir = alloca [8192 x i8], align 1
  %file = alloca [8192 x i8], align 1
  %i = alloca i32, align 4
  %l = alloca i32, align 4
  %atime = alloca i32, align 4
  %mtime = alloca i32, align 4
  store i8* %path, i8** %path.addr, align 4
  store %struct.stat* %st, %struct.stat** %st.addr, align 4
  store i32 0, i32* %mtime, align 4
  store i32 0, i32* %atime, align 4
  %0 = load i8*, i8** %path.addr, align 4
  %1 = load %struct.stat*, %struct.stat** %st.addr, align 4
  %call = call i32 @stat(i8* %0, %struct.stat* %1)
  store i32 %call, i32* %i, align 4
  %cmp = icmp ne i32 %call, 0
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %2 = load %struct.stat*, %struct.stat** %st.addr, align 4
  %st_mode = getelementptr inbounds %struct.stat, %struct.stat* %2, i32 0, i32 6
  %3 = load i32, i32* %st_mode, align 8
  %and = and i32 %3, 61440
  %cmp1 = icmp eq i32 %and, 16384
  %conv = zext i1 %cmp1 to i32
  %cmp2 = icmp eq i32 %conv, 0
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  %4 = load i32, i32* %i, align 4
  store i32 %4, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %5 = load i8*, i8** %path.addr, align 4
  %call4 = call i32 @strlen(i8* %5)
  %cmp5 = icmp ugt i32 %call4, 8187
  br i1 %cmp5, label %if.then7, label %if.end9

if.then7:                                         ; preds = %if.end
  %call8 = call i32* @__errno_location()
  store i32 36, i32* %call8, align 4
  store i32 -1, i32* %retval, align 4
  br label %return

if.end9:                                          ; preds = %if.end
  %6 = load %struct.stat*, %struct.stat** %st.addr, align 4
  %7 = bitcast %struct.stat* %st_ret to i8*
  %8 = bitcast %struct.stat* %6 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %7, i8* %8, i32 120, i32 8, i1 false)
  %st_nlink = getelementptr inbounds %struct.stat, %struct.stat* %st_ret, i32 0, i32 4
  store i32 1, i32* %st_nlink, align 8
  %st_size = getelementptr inbounds %struct.stat, %struct.stat* %st_ret, i32 0, i32 12
  store i32 0, i32* %st_size, align 8
  %st_blocks = getelementptr inbounds %struct.stat, %struct.stat* %st_ret, i32 0, i32 16
  store i32 0, i32* %st_blocks, align 8
  %st_mode10 = getelementptr inbounds %struct.stat, %struct.stat* %st_ret, i32 0, i32 6
  %9 = load i32, i32* %st_mode10, align 8
  %and11 = and i32 %9, -16385
  store i32 %and11, i32* %st_mode10, align 8
  %st_mode12 = getelementptr inbounds %struct.stat, %struct.stat* %st_ret, i32 0, i32 6
  %10 = load i32, i32* %st_mode12, align 8
  %or = or i32 %10, 32768
  store i32 %or, i32* %st_mode12, align 8
  %arraydecay = getelementptr inbounds [8192 x i8], [8192 x i8]* %dir, i32 0, i32 0
  %11 = load i8*, i8** %path.addr, align 4
  %call13 = call i32 (i8*, i8*, ...) @sprintf(i8* %arraydecay, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* %11)
  %arraydecay14 = getelementptr inbounds [8192 x i8], [8192 x i8]* %dir, i32 0, i32 0
  %call15 = call i32 @stat(i8* %arraydecay14, %struct.stat* %st_tmp)
  %tobool = icmp ne i32 %call15, 0
  br i1 %tobool, label %if.then23, label %lor.lhs.false16

lor.lhs.false16:                                  ; preds = %if.end9
  %st_mode17 = getelementptr inbounds %struct.stat, %struct.stat* %st_tmp, i32 0, i32 6
  %12 = load i32, i32* %st_mode17, align 8
  %and18 = and i32 %12, 61440
  %cmp19 = icmp eq i32 %and18, 16384
  %conv20 = zext i1 %cmp19 to i32
  %cmp21 = icmp eq i32 %conv20, 0
  br i1 %cmp21, label %if.then23, label %if.end24

if.then23:                                        ; preds = %lor.lhs.false16, %if.end9
  store i32 0, i32* %retval, align 4
  br label %return

if.end24:                                         ; preds = %lor.lhs.false16
  %st_atim = getelementptr inbounds %struct.stat, %struct.stat* %st_tmp, i32 0, i32 18
  %tv_sec = getelementptr inbounds %struct.timespec, %struct.timespec* %st_atim, i32 0, i32 0
  %13 = load i32, i32* %tv_sec, align 8
  %st_atim25 = getelementptr inbounds %struct.stat, %struct.stat* %st_ret, i32 0, i32 18
  %tv_sec26 = getelementptr inbounds %struct.timespec, %struct.timespec* %st_atim25, i32 0, i32 0
  store i32 %13, i32* %tv_sec26, align 8
  %arraydecay27 = getelementptr inbounds [8192 x i8], [8192 x i8]* %dir, i32 0, i32 0
  %14 = load i8*, i8** %path.addr, align 4
  %call28 = call i32 (i8*, i8*, ...) @sprintf(i8* %arraydecay27, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i32 0, i32 0), i8* %14)
  %arraydecay29 = getelementptr inbounds [8192 x i8], [8192 x i8]* %dir, i32 0, i32 0
  %call30 = call i32 @stat(i8* %arraydecay29, %struct.stat* %st_tmp)
  %tobool31 = icmp ne i32 %call30, 0
  br i1 %tobool31, label %if.then39, label %lor.lhs.false32

lor.lhs.false32:                                  ; preds = %if.end24
  %st_mode33 = getelementptr inbounds %struct.stat, %struct.stat* %st_tmp, i32 0, i32 6
  %15 = load i32, i32* %st_mode33, align 8
  %and34 = and i32 %15, 61440
  %cmp35 = icmp eq i32 %and34, 16384
  %conv36 = zext i1 %cmp35 to i32
  %cmp37 = icmp eq i32 %conv36, 0
  br i1 %cmp37, label %if.then39, label %if.end40

if.then39:                                        ; preds = %lor.lhs.false32, %if.end24
  store i32 0, i32* %retval, align 4
  br label %return

if.end40:                                         ; preds = %lor.lhs.false32
  %st_mtim = getelementptr inbounds %struct.stat, %struct.stat* %st_tmp, i32 0, i32 19
  %tv_sec41 = getelementptr inbounds %struct.timespec, %struct.timespec* %st_mtim, i32 0, i32 0
  %16 = load i32, i32* %tv_sec41, align 8
  %st_mtim42 = getelementptr inbounds %struct.stat, %struct.stat* %st_ret, i32 0, i32 19
  %tv_sec43 = getelementptr inbounds %struct.timespec, %struct.timespec* %st_mtim42, i32 0, i32 0
  store i32 %16, i32* %tv_sec43, align 8
  %arraydecay44 = getelementptr inbounds [8192 x i8], [8192 x i8]* %dir, i32 0, i32 0
  %17 = load i8*, i8** %path.addr, align 4
  %call45 = call i32 (i8*, i8*, ...) @sprintf(i8* %arraydecay44, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.2, i32 0, i32 0), i8* %17)
  %arraydecay46 = getelementptr inbounds [8192 x i8], [8192 x i8]* %dir, i32 0, i32 0
  %call47 = call i32 @stat(i8* %arraydecay46, %struct.stat* %st_tmp)
  %tobool48 = icmp ne i32 %call47, 0
  br i1 %tobool48, label %if.then56, label %lor.lhs.false49

lor.lhs.false49:                                  ; preds = %if.end40
  %st_mode50 = getelementptr inbounds %struct.stat, %struct.stat* %st_tmp, i32 0, i32 6
  %18 = load i32, i32* %st_mode50, align 8
  %and51 = and i32 %18, 61440
  %cmp52 = icmp eq i32 %and51, 16384
  %conv53 = zext i1 %cmp52 to i32
  %cmp54 = icmp eq i32 %conv53, 0
  br i1 %cmp54, label %if.then56, label %if.end57

if.then56:                                        ; preds = %lor.lhs.false49, %if.end40
  store i32 0, i32* %retval, align 4
  br label %return

if.end57:                                         ; preds = %lor.lhs.false49
  %st_mtim58 = getelementptr inbounds %struct.stat, %struct.stat* %st_tmp, i32 0, i32 19
  %tv_sec59 = getelementptr inbounds %struct.timespec, %struct.timespec* %st_mtim58, i32 0, i32 0
  %19 = load i32, i32* %tv_sec59, align 8
  %st_mtim60 = getelementptr inbounds %struct.stat, %struct.stat* %st_ret, i32 0, i32 19
  %tv_sec61 = getelementptr inbounds %struct.timespec, %struct.timespec* %st_mtim60, i32 0, i32 0
  store i32 %19, i32* %tv_sec61, align 8
  %st_dev = getelementptr inbounds %struct.stat, %struct.stat* %st_tmp, i32 0, i32 0
  %20 = load i32, i32* %st_dev, align 8
  %21 = load i32, i32* getelementptr inbounds (%struct.stat, %struct.stat* @mailstat.st_new_last, i32 0, i32 0), align 8
  %cmp62 = icmp eq i32 %20, %21
  br i1 %cmp62, label %land.lhs.true, label %if.end77

land.lhs.true:                                    ; preds = %if.end57
  %st_ino = getelementptr inbounds %struct.stat, %struct.stat* %st_tmp, i32 0, i32 2
  %22 = load i32, i32* %st_ino, align 8
  %23 = load i32, i32* getelementptr inbounds (%struct.stat, %struct.stat* @mailstat.st_new_last, i32 0, i32 2), align 8
  %cmp64 = icmp eq i32 %22, %23
  br i1 %cmp64, label %land.lhs.true66, label %if.end77

land.lhs.true66:                                  ; preds = %land.lhs.true
  %st_atim67 = getelementptr inbounds %struct.stat, %struct.stat* %st_tmp, i32 0, i32 18
  %tv_sec68 = getelementptr inbounds %struct.timespec, %struct.timespec* %st_atim67, i32 0, i32 0
  %24 = load i32, i32* %tv_sec68, align 8
  %25 = load i32, i32* getelementptr inbounds (%struct.stat, %struct.stat* @mailstat.st_new_last, i32 0, i32 18, i32 0), align 8
  %cmp69 = icmp eq i32 %24, %25
  br i1 %cmp69, label %land.lhs.true71, label %if.end77

land.lhs.true71:                                  ; preds = %land.lhs.true66
  %st_mtim72 = getelementptr inbounds %struct.stat, %struct.stat* %st_tmp, i32 0, i32 19
  %tv_sec73 = getelementptr inbounds %struct.timespec, %struct.timespec* %st_mtim72, i32 0, i32 0
  %26 = load i32, i32* %tv_sec73, align 8
  %27 = load i32, i32* getelementptr inbounds (%struct.stat, %struct.stat* @mailstat.st_new_last, i32 0, i32 19, i32 0), align 8
  %cmp74 = icmp eq i32 %26, %27
  br i1 %cmp74, label %if.then76, label %if.end77

if.then76:                                        ; preds = %land.lhs.true71
  %28 = load %struct.stat*, %struct.stat** %st.addr, align 4
  %29 = bitcast %struct.stat* %28 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %29, i8* bitcast (%struct.stat* @mailstat.st_ret_last to i8*), i32 120, i32 8, i1 false)
  store i32 0, i32* %retval, align 4
  br label %return

if.end77:                                         ; preds = %land.lhs.true71, %land.lhs.true66, %land.lhs.true, %if.end57
  %30 = bitcast %struct.stat* %st_tmp to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* bitcast (%struct.stat* @mailstat.st_new_last to i8*), i8* %30, i32 120, i32 8, i1 false)
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end77
  %31 = load i32, i32* %i, align 4
  %cmp78 = icmp slt i32 %31, 2
  br i1 %cmp78, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %arraydecay80 = getelementptr inbounds [8192 x i8], [8192 x i8]* %dir, i32 0, i32 0
  %32 = load i8*, i8** %path.addr, align 4
  %33 = load i32, i32* %i, align 4
  %tobool81 = icmp ne i32 %33, 0
  %cond = select i1 %tobool81, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i32 0, i32 0)
  %call82 = call i32 (i8*, i8*, ...) @sprintf(i8* %arraydecay80, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i32 0, i32 0), i8* %32, i8* %cond)
  %arraydecay83 = getelementptr inbounds [8192 x i8], [8192 x i8]* %file, i32 0, i32 0
  %arraydecay84 = getelementptr inbounds [8192 x i8], [8192 x i8]* %dir, i32 0, i32 0
  %call85 = call i32 (i8*, i8*, ...) @sprintf(i8* %arraydecay83, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.6, i32 0, i32 0), i8* %arraydecay84)
  %arraydecay86 = getelementptr inbounds [8192 x i8], [8192 x i8]* %file, i32 0, i32 0
  %call87 = call i32 @strlen(i8* %arraydecay86)
  store i32 %call87, i32* %l, align 4
  %arraydecay88 = getelementptr inbounds [8192 x i8], [8192 x i8]* %dir, i32 0, i32 0
  %call89 = call %struct.__dirstream* @opendir(i8* %arraydecay88)
  store %struct.__dirstream* %call89, %struct.__dirstream** %dd, align 4
  %cmp90 = icmp eq %struct.__dirstream* %call89, null
  br i1 %cmp90, label %if.then92, label %if.end93

if.then92:                                        ; preds = %for.body
  store i32 0, i32* %retval, align 4
  br label %return

if.end93:                                         ; preds = %for.body
  br label %while.cond

while.cond:                                       ; preds = %if.end144, %if.then116, %if.then106, %if.end93
  %34 = load %struct.__dirstream*, %struct.__dirstream** %dd, align 4
  %call94 = call %struct.dirent* @readdir(%struct.__dirstream* %34)
  store %struct.dirent* %call94, %struct.dirent** %fn, align 4
  %cmp95 = icmp ne %struct.dirent* %call94, null
  br i1 %cmp95, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %35 = load %struct.dirent*, %struct.dirent** %fn, align 4
  %d_name = getelementptr inbounds %struct.dirent, %struct.dirent* %35, i32 0, i32 6
  %arrayidx = getelementptr inbounds [256 x i8], [256 x i8]* %d_name, i32 0, i32 0
  %36 = load i8, i8* %arrayidx, align 1
  %conv97 = sext i8 %36 to i32
  %cmp98 = icmp eq i32 %conv97, 46
  br i1 %cmp98, label %if.then106, label %lor.lhs.false100

lor.lhs.false100:                                 ; preds = %while.body
  %37 = load %struct.dirent*, %struct.dirent** %fn, align 4
  %d_name101 = getelementptr inbounds %struct.dirent, %struct.dirent* %37, i32 0, i32 6
  %arraydecay102 = getelementptr inbounds [256 x i8], [256 x i8]* %d_name101, i32 0, i32 0
  %call103 = call i32 @strlen(i8* %arraydecay102)
  %38 = load i32, i32* %l, align 4
  %add = add i32 %call103, %38
  %cmp104 = icmp uge i32 %add, 8192
  br i1 %cmp104, label %if.then106, label %if.end107

if.then106:                                       ; preds = %lor.lhs.false100, %while.body
  br label %while.cond

if.end107:                                        ; preds = %lor.lhs.false100
  %arraydecay108 = getelementptr inbounds [8192 x i8], [8192 x i8]* %file, i32 0, i32 0
  %39 = load i32, i32* %l, align 4
  %add.ptr = getelementptr inbounds i8, i8* %arraydecay108, i32 %39
  %40 = load %struct.dirent*, %struct.dirent** %fn, align 4
  %d_name109 = getelementptr inbounds %struct.dirent, %struct.dirent* %40, i32 0, i32 6
  %arraydecay110 = getelementptr inbounds [256 x i8], [256 x i8]* %d_name109, i32 0, i32 0
  %call111 = call i8* @strcpy(i8* %add.ptr, i8* %arraydecay110)
  %arraydecay112 = getelementptr inbounds [8192 x i8], [8192 x i8]* %file, i32 0, i32 0
  %call113 = call i32 @stat(i8* %arraydecay112, %struct.stat* %st_tmp)
  %cmp114 = icmp ne i32 %call113, 0
  br i1 %cmp114, label %if.then116, label %if.end117

if.then116:                                       ; preds = %if.end107
  br label %while.cond

if.end117:                                        ; preds = %if.end107
  %st_size118 = getelementptr inbounds %struct.stat, %struct.stat* %st_tmp, i32 0, i32 12
  %41 = load i32, i32* %st_size118, align 8
  %st_size119 = getelementptr inbounds %struct.stat, %struct.stat* %st_ret, i32 0, i32 12
  %42 = load i32, i32* %st_size119, align 8
  %add120 = add nsw i32 %42, %41
  store i32 %add120, i32* %st_size119, align 8
  %st_blocks121 = getelementptr inbounds %struct.stat, %struct.stat* %st_ret, i32 0, i32 16
  %43 = load i32, i32* %st_blocks121, align 8
  %inc = add nsw i32 %43, 1
  store i32 %inc, i32* %st_blocks121, align 8
  %st_atim122 = getelementptr inbounds %struct.stat, %struct.stat* %st_tmp, i32 0, i32 18
  %tv_sec123 = getelementptr inbounds %struct.timespec, %struct.timespec* %st_atim122, i32 0, i32 0
  %44 = load i32, i32* %tv_sec123, align 8
  %st_mtim124 = getelementptr inbounds %struct.stat, %struct.stat* %st_tmp, i32 0, i32 19
  %tv_sec125 = getelementptr inbounds %struct.timespec, %struct.timespec* %st_mtim124, i32 0, i32 0
  %45 = load i32, i32* %tv_sec125, align 8
  %cmp126 = icmp ne i32 %44, %45
  br i1 %cmp126, label %land.lhs.true128, label %if.end136

land.lhs.true128:                                 ; preds = %if.end117
  %st_atim129 = getelementptr inbounds %struct.stat, %struct.stat* %st_tmp, i32 0, i32 18
  %tv_sec130 = getelementptr inbounds %struct.timespec, %struct.timespec* %st_atim129, i32 0, i32 0
  %46 = load i32, i32* %tv_sec130, align 8
  %47 = load i32, i32* %atime, align 4
  %cmp131 = icmp sgt i32 %46, %47
  br i1 %cmp131, label %if.then133, label %if.end136

if.then133:                                       ; preds = %land.lhs.true128
  %st_atim134 = getelementptr inbounds %struct.stat, %struct.stat* %st_tmp, i32 0, i32 18
  %tv_sec135 = getelementptr inbounds %struct.timespec, %struct.timespec* %st_atim134, i32 0, i32 0
  %48 = load i32, i32* %tv_sec135, align 8
  store i32 %48, i32* %atime, align 4
  br label %if.end136

if.end136:                                        ; preds = %if.then133, %land.lhs.true128, %if.end117
  %st_mtim137 = getelementptr inbounds %struct.stat, %struct.stat* %st_tmp, i32 0, i32 19
  %tv_sec138 = getelementptr inbounds %struct.timespec, %struct.timespec* %st_mtim137, i32 0, i32 0
  %49 = load i32, i32* %tv_sec138, align 8
  %50 = load i32, i32* %mtime, align 4
  %cmp139 = icmp sgt i32 %49, %50
  br i1 %cmp139, label %if.then141, label %if.end144

if.then141:                                       ; preds = %if.end136
  %st_mtim142 = getelementptr inbounds %struct.stat, %struct.stat* %st_tmp, i32 0, i32 19
  %tv_sec143 = getelementptr inbounds %struct.timespec, %struct.timespec* %st_mtim142, i32 0, i32 0
  %51 = load i32, i32* %tv_sec143, align 8
  store i32 %51, i32* %mtime, align 4
  br label %if.end144

if.end144:                                        ; preds = %if.then141, %if.end136
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %52 = load %struct.__dirstream*, %struct.__dirstream** %dd, align 4
  %call145 = call i32 @closedir(%struct.__dirstream* %52)
  br label %for.inc

for.inc:                                          ; preds = %while.end
  %53 = load i32, i32* %i, align 4
  %inc146 = add nsw i32 %53, 1
  store i32 %inc146, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %54 = load i32, i32* %atime, align 4
  %st_atim147 = getelementptr inbounds %struct.stat, %struct.stat* %st_ret, i32 0, i32 18
  %tv_sec148 = getelementptr inbounds %struct.timespec, %struct.timespec* %st_atim147, i32 0, i32 0
  store i32 %54, i32* %tv_sec148, align 8
  %55 = load i32, i32* %mtime, align 4
  %tobool149 = icmp ne i32 %55, 0
  br i1 %tobool149, label %if.then150, label %if.end153

if.then150:                                       ; preds = %for.end
  %56 = load i32, i32* %mtime, align 4
  %st_mtim151 = getelementptr inbounds %struct.stat, %struct.stat* %st_ret, i32 0, i32 19
  %tv_sec152 = getelementptr inbounds %struct.timespec, %struct.timespec* %st_mtim151, i32 0, i32 0
  store i32 %56, i32* %tv_sec152, align 8
  br label %if.end153

if.end153:                                        ; preds = %if.then150, %for.end
  %57 = load %struct.stat*, %struct.stat** %st.addr, align 4
  %58 = bitcast %struct.stat* %st_ret to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* bitcast (%struct.stat* @mailstat.st_ret_last to i8*), i8* %58, i32 120, i32 8, i1 false)
  %59 = bitcast %struct.stat* %57 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %59, i8* bitcast (%struct.stat* @mailstat.st_ret_last to i8*), i32 120, i32 8, i1 false)
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end153, %if.then92, %if.then76, %if.then56, %if.then39, %if.then23, %if.then7, %if.then
  %60 = load i32, i32* %retval, align 4
  ret i32 %60
}

declare i32 @stat(i8*, %struct.stat*) #1

declare i32 @strlen(i8*) #1

declare i32* @__errno_location() #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* nocapture writeonly, i8* nocapture readonly, i32, i32, i1) #2

declare i32 @sprintf(i8*, i8*, ...) #1

declare %struct.__dirstream* @opendir(i8*) #1

declare %struct.dirent* @readdir(%struct.__dirstream*) #1

declare i8* @strcpy(i8*, i8*) #1

declare i32 @closedir(%struct.__dirstream*) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
