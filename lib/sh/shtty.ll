; ModuleID = 'shtty.c'
source_filename = "shtty.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.termios = type { i32, i32, i32, i32, i8, [32 x i8], i32, i32 }

@ttsaved = internal global i32 0, align 4
@ttin = internal global %struct.termios zeroinitializer, align 4
@ttout = internal global %struct.termios zeroinitializer, align 4

; Function Attrs: noinline nounwind
define i32 @ttgetattr(i32 %fd, %struct.termios* %ttp) #0 {
entry:
  %fd.addr = alloca i32, align 4
  %ttp.addr = alloca %struct.termios*, align 4
  store i32 %fd, i32* %fd.addr, align 4
  store %struct.termios* %ttp, %struct.termios** %ttp.addr, align 4
  %0 = load i32, i32* %fd.addr, align 4
  %1 = load %struct.termios*, %struct.termios** %ttp.addr, align 4
  %call = call i32 @tcgetattr(i32 %0, %struct.termios* %1)
  ret i32 %call
}

declare i32 @tcgetattr(i32, %struct.termios*) #1

; Function Attrs: noinline nounwind
define i32 @ttsetattr(i32 %fd, %struct.termios* %ttp) #0 {
entry:
  %fd.addr = alloca i32, align 4
  %ttp.addr = alloca %struct.termios*, align 4
  store i32 %fd, i32* %fd.addr, align 4
  store %struct.termios* %ttp, %struct.termios** %ttp.addr, align 4
  %0 = load i32, i32* %fd.addr, align 4
  %1 = load %struct.termios*, %struct.termios** %ttp.addr, align 4
  %call = call i32 @tcsetattr(i32 %0, i32 1, %struct.termios* %1)
  ret i32 %call
}

declare i32 @tcsetattr(i32, i32, %struct.termios*) #1

; Function Attrs: noinline nounwind
define void @ttsave() #0 {
entry:
  %0 = load i32, i32* @ttsaved, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %return

if.end:                                           ; preds = %entry
  %call = call i32 @ttgetattr(i32 0, %struct.termios* @ttin)
  %call1 = call i32 @ttgetattr(i32 1, %struct.termios* @ttout)
  store i32 1, i32* @ttsaved, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  ret void
}

; Function Attrs: noinline nounwind
define void @ttrestore() #0 {
entry:
  %0 = load i32, i32* @ttsaved, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %return

if.end:                                           ; preds = %entry
  %call = call i32 @ttsetattr(i32 0, %struct.termios* @ttin)
  %call1 = call i32 @ttsetattr(i32 1, %struct.termios* @ttout)
  store i32 0, i32* @ttsaved, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  ret void
}

; Function Attrs: noinline nounwind
define %struct.termios* @ttattr(i32 %fd) #0 {
entry:
  %retval = alloca %struct.termios*, align 4
  %fd.addr = alloca i32, align 4
  store i32 %fd, i32* %fd.addr, align 4
  %0 = load i32, i32* @ttsaved, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store %struct.termios* null, %struct.termios** %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i32, i32* %fd.addr, align 4
  %cmp1 = icmp eq i32 %1, 0
  br i1 %cmp1, label %if.then2, label %if.else

if.then2:                                         ; preds = %if.end
  store %struct.termios* @ttin, %struct.termios** %retval, align 4
  br label %return

if.else:                                          ; preds = %if.end
  %2 = load i32, i32* %fd.addr, align 4
  %cmp3 = icmp eq i32 %2, 1
  br i1 %cmp3, label %if.then4, label %if.else5

if.then4:                                         ; preds = %if.else
  store %struct.termios* @ttout, %struct.termios** %retval, align 4
  br label %return

if.else5:                                         ; preds = %if.else
  store %struct.termios* null, %struct.termios** %retval, align 4
  br label %return

return:                                           ; preds = %if.else5, %if.then4, %if.then2, %if.then
  %3 = load %struct.termios*, %struct.termios** %retval, align 4
  ret %struct.termios* %3
}

; Function Attrs: noinline nounwind
define i32 @tt_setonechar(%struct.termios* %ttp) #0 {
entry:
  %ttp.addr = alloca %struct.termios*, align 4
  store %struct.termios* %ttp, %struct.termios** %ttp.addr, align 4
  %0 = load %struct.termios*, %struct.termios** %ttp.addr, align 4
  %c_lflag = getelementptr inbounds %struct.termios, %struct.termios* %0, i32 0, i32 3
  %1 = load i32, i32* %c_lflag, align 4
  %and = and i32 %1, -3
  store i32 %and, i32* %c_lflag, align 4
  %2 = load %struct.termios*, %struct.termios** %ttp.addr, align 4
  %c_lflag1 = getelementptr inbounds %struct.termios, %struct.termios* %2, i32 0, i32 3
  %3 = load i32, i32* %c_lflag1, align 4
  %or = or i32 %3, 1
  store i32 %or, i32* %c_lflag1, align 4
  %4 = load %struct.termios*, %struct.termios** %ttp.addr, align 4
  %c_lflag2 = getelementptr inbounds %struct.termios, %struct.termios* %4, i32 0, i32 3
  %5 = load i32, i32* %c_lflag2, align 4
  %or3 = or i32 %5, 32768
  store i32 %or3, i32* %c_lflag2, align 4
  %6 = load %struct.termios*, %struct.termios** %ttp.addr, align 4
  %c_iflag = getelementptr inbounds %struct.termios, %struct.termios* %6, i32 0, i32 0
  %7 = load i32, i32* %c_iflag, align 4
  %or4 = or i32 %7, 256
  store i32 %or4, i32* %c_iflag, align 4
  %8 = load %struct.termios*, %struct.termios** %ttp.addr, align 4
  %c_iflag5 = getelementptr inbounds %struct.termios, %struct.termios* %8, i32 0, i32 0
  %9 = load i32, i32* %c_iflag5, align 4
  %and6 = and i32 %9, -65
  store i32 %and6, i32* %c_iflag5, align 4
  %10 = load %struct.termios*, %struct.termios** %ttp.addr, align 4
  %c_oflag = getelementptr inbounds %struct.termios, %struct.termios* %10, i32 0, i32 1
  %11 = load i32, i32* %c_oflag, align 4
  %or7 = or i32 %11, 1
  store i32 %or7, i32* %c_oflag, align 4
  %12 = load %struct.termios*, %struct.termios** %ttp.addr, align 4
  %c_oflag8 = getelementptr inbounds %struct.termios, %struct.termios* %12, i32 0, i32 1
  %13 = load i32, i32* %c_oflag8, align 4
  %or9 = or i32 %13, 4
  store i32 %or9, i32* %c_oflag8, align 4
  %14 = load %struct.termios*, %struct.termios** %ttp.addr, align 4
  %c_oflag10 = getelementptr inbounds %struct.termios, %struct.termios* %14, i32 0, i32 1
  %15 = load i32, i32* %c_oflag10, align 4
  %and11 = and i32 %15, -9
  store i32 %and11, i32* %c_oflag10, align 4
  %16 = load %struct.termios*, %struct.termios** %ttp.addr, align 4
  %c_oflag12 = getelementptr inbounds %struct.termios, %struct.termios* %16, i32 0, i32 1
  %17 = load i32, i32* %c_oflag12, align 4
  %and13 = and i32 %17, -17
  store i32 %and13, i32* %c_oflag12, align 4
  %18 = load %struct.termios*, %struct.termios** %ttp.addr, align 4
  %c_oflag14 = getelementptr inbounds %struct.termios, %struct.termios* %18, i32 0, i32 1
  %19 = load i32, i32* %c_oflag14, align 4
  %and15 = and i32 %19, -33
  store i32 %and15, i32* %c_oflag14, align 4
  %20 = load %struct.termios*, %struct.termios** %ttp.addr, align 4
  %c_cc = getelementptr inbounds %struct.termios, %struct.termios* %20, i32 0, i32 5
  %arrayidx = getelementptr inbounds [32 x i8], [32 x i8]* %c_cc, i32 0, i32 6
  store i8 1, i8* %arrayidx, align 1
  %21 = load %struct.termios*, %struct.termios** %ttp.addr, align 4
  %c_cc16 = getelementptr inbounds %struct.termios, %struct.termios* %21, i32 0, i32 5
  %arrayidx17 = getelementptr inbounds [32 x i8], [32 x i8]* %c_cc16, i32 0, i32 5
  store i8 0, i8* %arrayidx17, align 1
  ret i32 0
}

; Function Attrs: noinline nounwind
define i32 @ttfd_onechar(i32 %fd, %struct.termios* %ttp) #0 {
entry:
  %retval = alloca i32, align 4
  %fd.addr = alloca i32, align 4
  %ttp.addr = alloca %struct.termios*, align 4
  store i32 %fd, i32* %fd.addr, align 4
  store %struct.termios* %ttp, %struct.termios** %ttp.addr, align 4
  %0 = load %struct.termios*, %struct.termios** %ttp.addr, align 4
  %call = call i32 @tt_setonechar(%struct.termios* %0)
  %cmp = icmp slt i32 %call, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i32, i32* %fd.addr, align 4
  %2 = load %struct.termios*, %struct.termios** %ttp.addr, align 4
  %call1 = call i32 @ttsetattr(i32 %1, %struct.termios* %2)
  store i32 %call1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %3 = load i32, i32* %retval, align 4
  ret i32 %3
}

; Function Attrs: noinline nounwind
define i32 @ttonechar() #0 {
entry:
  %retval = alloca i32, align 4
  %tt = alloca %struct.termios, align 4
  %0 = load i32, i32* @ttsaved, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = bitcast %struct.termios* %tt to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %1, i8* bitcast (%struct.termios* @ttin to i8*), i32 60, i32 4, i1 false)
  %call = call i32 @ttfd_onechar(i32 0, %struct.termios* %tt)
  store i32 %call, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %2 = load i32, i32* %retval, align 4
  ret i32 %2
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* nocapture writeonly, i8* nocapture readonly, i32, i32, i1) #2

; Function Attrs: noinline nounwind
define i32 @tt_setnoecho(%struct.termios* %ttp) #0 {
entry:
  %ttp.addr = alloca %struct.termios*, align 4
  store %struct.termios* %ttp, %struct.termios** %ttp.addr, align 4
  %0 = load %struct.termios*, %struct.termios** %ttp.addr, align 4
  %c_lflag = getelementptr inbounds %struct.termios, %struct.termios* %0, i32 0, i32 3
  %1 = load i32, i32* %c_lflag, align 4
  %and = and i32 %1, -105
  store i32 %and, i32* %c_lflag, align 4
  ret i32 0
}

; Function Attrs: noinline nounwind
define i32 @ttfd_noecho(i32 %fd, %struct.termios* %ttp) #0 {
entry:
  %retval = alloca i32, align 4
  %fd.addr = alloca i32, align 4
  %ttp.addr = alloca %struct.termios*, align 4
  store i32 %fd, i32* %fd.addr, align 4
  store %struct.termios* %ttp, %struct.termios** %ttp.addr, align 4
  %0 = load %struct.termios*, %struct.termios** %ttp.addr, align 4
  %call = call i32 @tt_setnoecho(%struct.termios* %0)
  %cmp = icmp slt i32 %call, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i32, i32* %fd.addr, align 4
  %2 = load %struct.termios*, %struct.termios** %ttp.addr, align 4
  %call1 = call i32 @ttsetattr(i32 %1, %struct.termios* %2)
  store i32 %call1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %3 = load i32, i32* %retval, align 4
  ret i32 %3
}

; Function Attrs: noinline nounwind
define i32 @ttnoecho() #0 {
entry:
  %retval = alloca i32, align 4
  %tt = alloca %struct.termios, align 4
  %0 = load i32, i32* @ttsaved, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = bitcast %struct.termios* %tt to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %1, i8* bitcast (%struct.termios* @ttin to i8*), i32 60, i32 4, i1 false)
  %call = call i32 @ttfd_noecho(i32 0, %struct.termios* %tt)
  store i32 %call, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %2 = load i32, i32* %retval, align 4
  ret i32 %2
}

; Function Attrs: noinline nounwind
define i32 @tt_seteightbit(%struct.termios* %ttp) #0 {
entry:
  %ttp.addr = alloca %struct.termios*, align 4
  store %struct.termios* %ttp, %struct.termios** %ttp.addr, align 4
  %0 = load %struct.termios*, %struct.termios** %ttp.addr, align 4
  %c_iflag = getelementptr inbounds %struct.termios, %struct.termios* %0, i32 0, i32 0
  %1 = load i32, i32* %c_iflag, align 4
  %and = and i32 %1, -33
  store i32 %and, i32* %c_iflag, align 4
  %2 = load %struct.termios*, %struct.termios** %ttp.addr, align 4
  %c_cflag = getelementptr inbounds %struct.termios, %struct.termios* %2, i32 0, i32 2
  %3 = load i32, i32* %c_cflag, align 4
  %or = or i32 %3, 48
  store i32 %or, i32* %c_cflag, align 4
  %4 = load %struct.termios*, %struct.termios** %ttp.addr, align 4
  %c_cflag1 = getelementptr inbounds %struct.termios, %struct.termios* %4, i32 0, i32 2
  %5 = load i32, i32* %c_cflag1, align 4
  %and2 = and i32 %5, -257
  store i32 %and2, i32* %c_cflag1, align 4
  ret i32 0
}

; Function Attrs: noinline nounwind
define i32 @ttfd_eightbit(i32 %fd, %struct.termios* %ttp) #0 {
entry:
  %retval = alloca i32, align 4
  %fd.addr = alloca i32, align 4
  %ttp.addr = alloca %struct.termios*, align 4
  store i32 %fd, i32* %fd.addr, align 4
  store %struct.termios* %ttp, %struct.termios** %ttp.addr, align 4
  %0 = load %struct.termios*, %struct.termios** %ttp.addr, align 4
  %call = call i32 @tt_seteightbit(%struct.termios* %0)
  %cmp = icmp slt i32 %call, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i32, i32* %fd.addr, align 4
  %2 = load %struct.termios*, %struct.termios** %ttp.addr, align 4
  %call1 = call i32 @ttsetattr(i32 %1, %struct.termios* %2)
  store i32 %call1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %3 = load i32, i32* %retval, align 4
  ret i32 %3
}

; Function Attrs: noinline nounwind
define i32 @tteightbit() #0 {
entry:
  %retval = alloca i32, align 4
  %tt = alloca %struct.termios, align 4
  %0 = load i32, i32* @ttsaved, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = bitcast %struct.termios* %tt to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %1, i8* bitcast (%struct.termios* @ttin to i8*), i32 60, i32 4, i1 false)
  %call = call i32 @ttfd_eightbit(i32 0, %struct.termios* %tt)
  store i32 %call, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %2 = load i32, i32* %retval, align 4
  ret i32 %2
}

; Function Attrs: noinline nounwind
define i32 @tt_setnocanon(%struct.termios* %ttp) #0 {
entry:
  %ttp.addr = alloca %struct.termios*, align 4
  store %struct.termios* %ttp, %struct.termios** %ttp.addr, align 4
  %0 = load %struct.termios*, %struct.termios** %ttp.addr, align 4
  %c_lflag = getelementptr inbounds %struct.termios, %struct.termios* %0, i32 0, i32 3
  %1 = load i32, i32* %c_lflag, align 4
  %and = and i32 %1, -3
  store i32 %and, i32* %c_lflag, align 4
  ret i32 0
}

; Function Attrs: noinline nounwind
define i32 @ttfd_nocanon(i32 %fd, %struct.termios* %ttp) #0 {
entry:
  %retval = alloca i32, align 4
  %fd.addr = alloca i32, align 4
  %ttp.addr = alloca %struct.termios*, align 4
  store i32 %fd, i32* %fd.addr, align 4
  store %struct.termios* %ttp, %struct.termios** %ttp.addr, align 4
  %0 = load %struct.termios*, %struct.termios** %ttp.addr, align 4
  %call = call i32 @tt_setnocanon(%struct.termios* %0)
  %cmp = icmp slt i32 %call, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i32, i32* %fd.addr, align 4
  %2 = load %struct.termios*, %struct.termios** %ttp.addr, align 4
  %call1 = call i32 @ttsetattr(i32 %1, %struct.termios* %2)
  store i32 %call1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %3 = load i32, i32* %retval, align 4
  ret i32 %3
}

; Function Attrs: noinline nounwind
define i32 @ttnocanon() #0 {
entry:
  %retval = alloca i32, align 4
  %tt = alloca %struct.termios, align 4
  %0 = load i32, i32* @ttsaved, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = bitcast %struct.termios* %tt to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %1, i8* bitcast (%struct.termios* @ttin to i8*), i32 60, i32 4, i1 false)
  %call = call i32 @ttfd_nocanon(i32 0, %struct.termios* %tt)
  store i32 %call, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %2 = load i32, i32* %retval, align 4
  ret i32 %2
}

; Function Attrs: noinline nounwind
define i32 @tt_setcbreak(%struct.termios* %ttp) #0 {
entry:
  %retval = alloca i32, align 4
  %ttp.addr = alloca %struct.termios*, align 4
  store %struct.termios* %ttp, %struct.termios** %ttp.addr, align 4
  %0 = load %struct.termios*, %struct.termios** %ttp.addr, align 4
  %call = call i32 @tt_setonechar(%struct.termios* %0)
  %cmp = icmp slt i32 %call, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = load %struct.termios*, %struct.termios** %ttp.addr, align 4
  %call1 = call i32 @tt_setnoecho(%struct.termios* %1)
  store i32 %call1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %2 = load i32, i32* %retval, align 4
  ret i32 %2
}

; Function Attrs: noinline nounwind
define i32 @ttfd_cbreak(i32 %fd, %struct.termios* %ttp) #0 {
entry:
  %retval = alloca i32, align 4
  %fd.addr = alloca i32, align 4
  %ttp.addr = alloca %struct.termios*, align 4
  store i32 %fd, i32* %fd.addr, align 4
  store %struct.termios* %ttp, %struct.termios** %ttp.addr, align 4
  %0 = load %struct.termios*, %struct.termios** %ttp.addr, align 4
  %call = call i32 @tt_setcbreak(%struct.termios* %0)
  %cmp = icmp slt i32 %call, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i32, i32* %fd.addr, align 4
  %2 = load %struct.termios*, %struct.termios** %ttp.addr, align 4
  %call1 = call i32 @ttsetattr(i32 %1, %struct.termios* %2)
  store i32 %call1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %3 = load i32, i32* %retval, align 4
  ret i32 %3
}

; Function Attrs: noinline nounwind
define i32 @ttcbreak() #0 {
entry:
  %retval = alloca i32, align 4
  %tt = alloca %struct.termios, align 4
  %0 = load i32, i32* @ttsaved, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = bitcast %struct.termios* %tt to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %1, i8* bitcast (%struct.termios* @ttin to i8*), i32 60, i32 4, i1 false)
  %call = call i32 @ttfd_cbreak(i32 0, %struct.termios* %tt)
  store i32 %call, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %2 = load i32, i32* %retval, align 4
  ret i32 %2
}

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
