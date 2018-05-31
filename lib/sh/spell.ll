; ModuleID = 'spell.c'
source_filename = "spell.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.__dirstream = type opaque
%struct.dirent = type { i32, i32, i32, i32, i16, i8, [256 x i8] }

@.str = private unnamed_addr constant [2 x i8] c".\00", align 1

; Function Attrs: noinline nounwind
define i32 @spname(i8* %oldname, i8* %newname) #0 {
entry:
  %retval = alloca i32, align 4
  %oldname.addr = alloca i8*, align 4
  %newname.addr = alloca i8*, align 4
  %op = alloca i8*, align 4
  %np = alloca i8*, align 4
  %p = alloca i8*, align 4
  %guess = alloca [4097 x i8], align 1
  %best = alloca [4097 x i8], align 1
  store i8* %oldname, i8** %oldname.addr, align 4
  store i8* %newname, i8** %newname.addr, align 4
  %0 = load i8*, i8** %oldname.addr, align 4
  store i8* %0, i8** %op, align 4
  %1 = load i8*, i8** %newname.addr, align 4
  store i8* %1, i8** %np, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.end54, %entry
  br label %while.cond

while.cond:                                       ; preds = %while.body, %for.cond
  %2 = load i8*, i8** %op, align 4
  %3 = load i8, i8* %2, align 1
  %conv = sext i8 %3 to i32
  %cmp = icmp eq i32 %conv, 47
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %4 = load i8*, i8** %op, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %4, i32 1
  store i8* %incdec.ptr, i8** %op, align 4
  %5 = load i8, i8* %4, align 1
  %6 = load i8*, i8** %np, align 4
  %incdec.ptr2 = getelementptr inbounds i8, i8* %6, i32 1
  store i8* %incdec.ptr2, i8** %np, align 4
  store i8 %5, i8* %6, align 1
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %7 = load i8*, i8** %np, align 4
  store i8 0, i8* %7, align 1
  %8 = load i8*, i8** %op, align 4
  %9 = load i8, i8* %8, align 1
  %conv3 = sext i8 %9 to i32
  %cmp4 = icmp eq i32 %conv3, 0
  br i1 %cmp4, label %if.then, label %if.end26

if.then:                                          ; preds = %while.end
  %10 = load i8*, i8** %oldname.addr, align 4
  %arrayidx = getelementptr inbounds i8, i8* %10, i32 1
  %11 = load i8, i8* %arrayidx, align 1
  %conv6 = sext i8 %11 to i32
  %cmp7 = icmp eq i32 %conv6, 0
  br i1 %cmp7, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %if.then
  %12 = load i8*, i8** %newname.addr, align 4
  %arrayidx9 = getelementptr inbounds i8, i8* %12, i32 1
  %13 = load i8, i8* %arrayidx9, align 1
  %conv10 = sext i8 %13 to i32
  %cmp11 = icmp eq i32 %conv10, 0
  br i1 %cmp11, label %land.lhs.true13, label %if.end

land.lhs.true13:                                  ; preds = %land.lhs.true
  %14 = load i8*, i8** %oldname.addr, align 4
  %arrayidx14 = getelementptr inbounds i8, i8* %14, i32 0
  %15 = load i8, i8* %arrayidx14, align 1
  %conv15 = sext i8 %15 to i32
  %cmp16 = icmp ne i32 %conv15, 46
  br i1 %cmp16, label %land.lhs.true18, label %if.end

land.lhs.true18:                                  ; preds = %land.lhs.true13
  %16 = load i8*, i8** %newname.addr, align 4
  %arrayidx19 = getelementptr inbounds i8, i8* %16, i32 0
  %17 = load i8, i8* %arrayidx19, align 1
  %conv20 = sext i8 %17 to i32
  %cmp21 = icmp eq i32 %conv20, 46
  br i1 %cmp21, label %if.then23, label %if.end

if.then23:                                        ; preds = %land.lhs.true18
  store i32 -1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %land.lhs.true18, %land.lhs.true13, %land.lhs.true, %if.then
  %18 = load i8*, i8** %oldname.addr, align 4
  %19 = load i8*, i8** %newname.addr, align 4
  %call = call i32 @strcmp(i8* %18, i8* %19)
  %cmp24 = icmp ne i32 %call, 0
  %conv25 = zext i1 %cmp24 to i32
  store i32 %conv25, i32* %retval, align 4
  br label %return

if.end26:                                         ; preds = %while.end
  %arraydecay = getelementptr inbounds [4097 x i8], [4097 x i8]* %guess, i32 0, i32 0
  store i8* %arraydecay, i8** %p, align 4
  br label %for.cond27

for.cond27:                                       ; preds = %for.inc, %if.end26
  %20 = load i8*, i8** %op, align 4
  %21 = load i8, i8* %20, align 1
  %conv28 = sext i8 %21 to i32
  %cmp29 = icmp ne i32 %conv28, 47
  br i1 %cmp29, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.cond27
  %22 = load i8*, i8** %op, align 4
  %23 = load i8, i8* %22, align 1
  %conv31 = sext i8 %23 to i32
  %cmp32 = icmp ne i32 %conv31, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond27
  %24 = phi i1 [ false, %for.cond27 ], [ %cmp32, %land.rhs ]
  br i1 %24, label %for.body, label %for.end

for.body:                                         ; preds = %land.end
  %25 = load i8*, i8** %p, align 4
  %arraydecay34 = getelementptr inbounds [4097 x i8], [4097 x i8]* %guess, i32 0, i32 0
  %add.ptr = getelementptr inbounds i8, i8* %arraydecay34, i32 4096
  %cmp35 = icmp ult i8* %25, %add.ptr
  br i1 %cmp35, label %if.then37, label %if.end39

if.then37:                                        ; preds = %for.body
  %26 = load i8*, i8** %op, align 4
  %27 = load i8, i8* %26, align 1
  %28 = load i8*, i8** %p, align 4
  %incdec.ptr38 = getelementptr inbounds i8, i8* %28, i32 1
  store i8* %incdec.ptr38, i8** %p, align 4
  store i8 %27, i8* %28, align 1
  br label %if.end39

if.end39:                                         ; preds = %if.then37, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end39
  %29 = load i8*, i8** %op, align 4
  %incdec.ptr40 = getelementptr inbounds i8, i8* %29, i32 1
  store i8* %incdec.ptr40, i8** %op, align 4
  br label %for.cond27

for.end:                                          ; preds = %land.end
  %30 = load i8*, i8** %p, align 4
  store i8 0, i8* %30, align 1
  %31 = load i8*, i8** %newname.addr, align 4
  %arraydecay41 = getelementptr inbounds [4097 x i8], [4097 x i8]* %guess, i32 0, i32 0
  %arraydecay42 = getelementptr inbounds [4097 x i8], [4097 x i8]* %best, i32 0, i32 0
  %call43 = call i32 @mindist(i8* %31, i8* %arraydecay41, i8* %arraydecay42)
  %cmp44 = icmp sge i32 %call43, 3
  br i1 %cmp44, label %if.then46, label %if.end47

if.then46:                                        ; preds = %for.end
  store i32 -1, i32* %retval, align 4
  br label %return

if.end47:                                         ; preds = %for.end
  %arraydecay48 = getelementptr inbounds [4097 x i8], [4097 x i8]* %best, i32 0, i32 0
  store i8* %arraydecay48, i8** %p, align 4
  br label %for.cond49

for.cond49:                                       ; preds = %for.inc52, %if.end47
  %32 = load i8*, i8** %p, align 4
  %incdec.ptr50 = getelementptr inbounds i8, i8* %32, i32 1
  store i8* %incdec.ptr50, i8** %p, align 4
  %33 = load i8, i8* %32, align 1
  %34 = load i8*, i8** %np, align 4
  store i8 %33, i8* %34, align 1
  %tobool = icmp ne i8 %33, 0
  br i1 %tobool, label %for.body51, label %for.end54

for.body51:                                       ; preds = %for.cond49
  br label %for.inc52

for.inc52:                                        ; preds = %for.body51
  %35 = load i8*, i8** %np, align 4
  %incdec.ptr53 = getelementptr inbounds i8, i8* %35, i32 1
  store i8* %incdec.ptr53, i8** %np, align 4
  br label %for.cond49

for.end54:                                        ; preds = %for.cond49
  br label %for.cond

return:                                           ; preds = %if.then46, %if.end, %if.then23
  %36 = load i32, i32* %retval, align 4
  ret i32 %36
}

declare i32 @strcmp(i8*, i8*) #1

; Function Attrs: noinline nounwind
define internal i32 @mindist(i8* %dir, i8* %guess, i8* %best) #0 {
entry:
  %retval = alloca i32, align 4
  %dir.addr = alloca i8*, align 4
  %guess.addr = alloca i8*, align 4
  %best.addr = alloca i8*, align 4
  %fd = alloca %struct.__dirstream*, align 4
  %dp = alloca %struct.dirent*, align 4
  %dist = alloca i32, align 4
  %x = alloca i32, align 4
  store i8* %dir, i8** %dir.addr, align 4
  store i8* %guess, i8** %guess.addr, align 4
  store i8* %best, i8** %best.addr, align 4
  store i32 3, i32* %dist, align 4
  %0 = load i8*, i8** %dir.addr, align 4
  %1 = load i8, i8* %0, align 1
  %conv = sext i8 %1 to i32
  %cmp = icmp eq i32 %conv, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0), i8** %dir.addr, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %2 = load i8*, i8** %dir.addr, align 4
  %call = call %struct.__dirstream* @opendir(i8* %2)
  store %struct.__dirstream* %call, %struct.__dirstream** %fd, align 4
  %cmp2 = icmp eq %struct.__dirstream* %call, null
  br i1 %cmp2, label %if.then4, label %if.end5

if.then4:                                         ; preds = %if.end
  %3 = load i32, i32* %dist, align 4
  store i32 %3, i32* %retval, align 4
  br label %return

if.end5:                                          ; preds = %if.end
  br label %while.cond

while.cond:                                       ; preds = %if.end22, %if.end5
  %4 = load %struct.__dirstream*, %struct.__dirstream** %fd, align 4
  %call6 = call %struct.dirent* @readdir(%struct.__dirstream* %4)
  store %struct.dirent* %call6, %struct.dirent** %dp, align 4
  %cmp7 = icmp ne %struct.dirent* %call6, null
  br i1 %cmp7, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %5 = load %struct.dirent*, %struct.dirent** %dp, align 4
  %d_name = getelementptr inbounds %struct.dirent, %struct.dirent* %5, i32 0, i32 6
  %arraydecay = getelementptr inbounds [256 x i8], [256 x i8]* %d_name, i32 0, i32 0
  %6 = load i8*, i8** %guess.addr, align 4
  %call9 = call i32 @spdist(i8* %arraydecay, i8* %6)
  store i32 %call9, i32* %x, align 4
  %7 = load i32, i32* %x, align 4
  %8 = load i32, i32* %dist, align 4
  %cmp10 = icmp sle i32 %7, %8
  br i1 %cmp10, label %land.lhs.true, label %if.end22

land.lhs.true:                                    ; preds = %while.body
  %9 = load i32, i32* %x, align 4
  %cmp12 = icmp ne i32 %9, 3
  br i1 %cmp12, label %if.then14, label %if.end22

if.then14:                                        ; preds = %land.lhs.true
  %10 = load i8*, i8** %best.addr, align 4
  %11 = load %struct.dirent*, %struct.dirent** %dp, align 4
  %d_name15 = getelementptr inbounds %struct.dirent, %struct.dirent* %11, i32 0, i32 6
  %arraydecay16 = getelementptr inbounds [256 x i8], [256 x i8]* %d_name15, i32 0, i32 0
  %call17 = call i8* @strcpy(i8* %10, i8* %arraydecay16)
  %12 = load i32, i32* %x, align 4
  store i32 %12, i32* %dist, align 4
  %13 = load i32, i32* %dist, align 4
  %cmp18 = icmp eq i32 %13, 0
  br i1 %cmp18, label %if.then20, label %if.end21

if.then20:                                        ; preds = %if.then14
  br label %while.end

if.end21:                                         ; preds = %if.then14
  br label %if.end22

if.end22:                                         ; preds = %if.end21, %land.lhs.true, %while.body
  br label %while.cond

while.end:                                        ; preds = %if.then20, %while.cond
  %14 = load %struct.__dirstream*, %struct.__dirstream** %fd, align 4
  %call23 = call i32 @closedir(%struct.__dirstream* %14)
  %15 = load i8*, i8** %best.addr, align 4
  %arrayidx = getelementptr inbounds i8, i8* %15, i32 0
  %16 = load i8, i8* %arrayidx, align 1
  %conv24 = sext i8 %16 to i32
  %cmp25 = icmp eq i32 %conv24, 46
  br i1 %cmp25, label %land.lhs.true27, label %if.end33

land.lhs.true27:                                  ; preds = %while.end
  %17 = load i8*, i8** %best.addr, align 4
  %arrayidx28 = getelementptr inbounds i8, i8* %17, i32 1
  %18 = load i8, i8* %arrayidx28, align 1
  %conv29 = sext i8 %18 to i32
  %cmp30 = icmp eq i32 %conv29, 0
  br i1 %cmp30, label %if.then32, label %if.end33

if.then32:                                        ; preds = %land.lhs.true27
  store i32 3, i32* %dist, align 4
  br label %if.end33

if.end33:                                         ; preds = %if.then32, %land.lhs.true27, %while.end
  %19 = load i32, i32* %dist, align 4
  store i32 %19, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end33, %if.then4
  %20 = load i32, i32* %retval, align 4
  ret i32 %20
}

; Function Attrs: noinline nounwind
define i8* @dirspell(i8* %dirname) #0 {
entry:
  %retval = alloca i8*, align 4
  %dirname.addr = alloca i8*, align 4
  %n = alloca i32, align 4
  %guess = alloca i8*, align 4
  store i8* %dirname, i8** %dirname.addr, align 4
  %0 = load i8*, i8** %dirname.addr, align 4
  %call = call i32 @strlen(i8* %0)
  %mul = mul i32 %call, 3
  %add = add i32 %mul, 1
  %div = udiv i32 %add, 2
  %add1 = add i32 %div, 1
  store i32 %add1, i32* %n, align 4
  %1 = load i32, i32* %n, align 4
  %call2 = call i8* @malloc(i32 %1)
  store i8* %call2, i8** %guess, align 4
  %2 = load i8*, i8** %guess, align 4
  %cmp = icmp eq i8* %2, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i8* null, i8** %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %3 = load i8*, i8** %dirname.addr, align 4
  %4 = load i8*, i8** %guess, align 4
  %call3 = call i32 @spname(i8* %3, i8* %4)
  switch i32 %call3, label %sw.default [
    i32 -1, label %sw.bb
    i32 0, label %sw.bb4
    i32 1, label %sw.bb4
  ]

sw.bb:                                            ; preds = %if.end
  br label %sw.default

sw.default:                                       ; preds = %if.end, %sw.bb
  %5 = load i8*, i8** %guess, align 4
  call void @free(i8* %5)
  store i8* null, i8** %retval, align 4
  br label %return

sw.bb4:                                           ; preds = %if.end, %if.end
  %6 = load i8*, i8** %guess, align 4
  store i8* %6, i8** %retval, align 4
  br label %return

return:                                           ; preds = %sw.bb4, %sw.default, %if.then
  %7 = load i8*, i8** %retval, align 4
  ret i8* %7
}

declare i32 @strlen(i8*) #1

declare i8* @malloc(i32) #1

declare void @free(i8*) #1

declare %struct.__dirstream* @opendir(i8*) #1

declare %struct.dirent* @readdir(%struct.__dirstream*) #1

; Function Attrs: noinline nounwind
define internal i32 @spdist(i8* %cur, i8* %new) #0 {
entry:
  %retval = alloca i32, align 4
  %cur.addr = alloca i8*, align 4
  %new.addr = alloca i8*, align 4
  store i8* %cur, i8** %cur.addr, align 4
  store i8* %new, i8** %new.addr, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end, %entry
  %0 = load i8*, i8** %cur.addr, align 4
  %1 = load i8, i8* %0, align 1
  %conv = sext i8 %1 to i32
  %2 = load i8*, i8** %new.addr, align 4
  %3 = load i8, i8* %2, align 1
  %conv1 = sext i8 %3 to i32
  %cmp = icmp eq i32 %conv, %conv1
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %4 = load i8*, i8** %cur.addr, align 4
  %5 = load i8, i8* %4, align 1
  %conv3 = sext i8 %5 to i32
  %cmp4 = icmp eq i32 %conv3, 0
  br i1 %cmp4, label %if.then, label %if.end

if.then:                                          ; preds = %while.body
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %while.body
  %6 = load i8*, i8** %cur.addr, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %6, i32 1
  store i8* %incdec.ptr, i8** %cur.addr, align 4
  %7 = load i8*, i8** %new.addr, align 4
  %incdec.ptr6 = getelementptr inbounds i8, i8* %7, i32 1
  store i8* %incdec.ptr6, i8** %new.addr, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %8 = load i8*, i8** %cur.addr, align 4
  %9 = load i8, i8* %8, align 1
  %tobool = icmp ne i8 %9, 0
  br i1 %tobool, label %if.then7, label %if.end50

if.then7:                                         ; preds = %while.end
  %10 = load i8*, i8** %new.addr, align 4
  %11 = load i8, i8* %10, align 1
  %tobool8 = icmp ne i8 %11, 0
  br i1 %tobool8, label %if.then9, label %if.end42

if.then9:                                         ; preds = %if.then7
  %12 = load i8*, i8** %cur.addr, align 4
  %arrayidx = getelementptr inbounds i8, i8* %12, i32 1
  %13 = load i8, i8* %arrayidx, align 1
  %conv10 = sext i8 %13 to i32
  %tobool11 = icmp ne i32 %conv10, 0
  br i1 %tobool11, label %land.lhs.true, label %if.end34

land.lhs.true:                                    ; preds = %if.then9
  %14 = load i8*, i8** %new.addr, align 4
  %arrayidx12 = getelementptr inbounds i8, i8* %14, i32 1
  %15 = load i8, i8* %arrayidx12, align 1
  %conv13 = sext i8 %15 to i32
  %tobool14 = icmp ne i32 %conv13, 0
  br i1 %tobool14, label %land.lhs.true15, label %if.end34

land.lhs.true15:                                  ; preds = %land.lhs.true
  %16 = load i8*, i8** %cur.addr, align 4
  %arrayidx16 = getelementptr inbounds i8, i8* %16, i32 0
  %17 = load i8, i8* %arrayidx16, align 1
  %conv17 = sext i8 %17 to i32
  %18 = load i8*, i8** %new.addr, align 4
  %arrayidx18 = getelementptr inbounds i8, i8* %18, i32 1
  %19 = load i8, i8* %arrayidx18, align 1
  %conv19 = sext i8 %19 to i32
  %cmp20 = icmp eq i32 %conv17, %conv19
  br i1 %cmp20, label %land.lhs.true22, label %if.end34

land.lhs.true22:                                  ; preds = %land.lhs.true15
  %20 = load i8*, i8** %cur.addr, align 4
  %arrayidx23 = getelementptr inbounds i8, i8* %20, i32 1
  %21 = load i8, i8* %arrayidx23, align 1
  %conv24 = sext i8 %21 to i32
  %22 = load i8*, i8** %new.addr, align 4
  %arrayidx25 = getelementptr inbounds i8, i8* %22, i32 0
  %23 = load i8, i8* %arrayidx25, align 1
  %conv26 = sext i8 %23 to i32
  %cmp27 = icmp eq i32 %conv24, %conv26
  br i1 %cmp27, label %land.lhs.true29, label %if.end34

land.lhs.true29:                                  ; preds = %land.lhs.true22
  %24 = load i8*, i8** %cur.addr, align 4
  %add.ptr = getelementptr inbounds i8, i8* %24, i32 2
  %25 = load i8*, i8** %new.addr, align 4
  %add.ptr30 = getelementptr inbounds i8, i8* %25, i32 2
  %call = call i32 @strcmp(i8* %add.ptr, i8* %add.ptr30)
  %cmp31 = icmp eq i32 %call, 0
  br i1 %cmp31, label %if.then33, label %if.end34

if.then33:                                        ; preds = %land.lhs.true29
  store i32 1, i32* %retval, align 4
  br label %return

if.end34:                                         ; preds = %land.lhs.true29, %land.lhs.true22, %land.lhs.true15, %land.lhs.true, %if.then9
  %26 = load i8*, i8** %cur.addr, align 4
  %add.ptr35 = getelementptr inbounds i8, i8* %26, i32 1
  %27 = load i8*, i8** %new.addr, align 4
  %add.ptr36 = getelementptr inbounds i8, i8* %27, i32 1
  %call37 = call i32 @strcmp(i8* %add.ptr35, i8* %add.ptr36)
  %cmp38 = icmp eq i32 %call37, 0
  br i1 %cmp38, label %if.then40, label %if.end41

if.then40:                                        ; preds = %if.end34
  store i32 2, i32* %retval, align 4
  br label %return

if.end41:                                         ; preds = %if.end34
  br label %if.end42

if.end42:                                         ; preds = %if.end41, %if.then7
  %28 = load i8*, i8** %cur.addr, align 4
  %arrayidx43 = getelementptr inbounds i8, i8* %28, i32 1
  %29 = load i8*, i8** %new.addr, align 4
  %arrayidx44 = getelementptr inbounds i8, i8* %29, i32 0
  %call45 = call i32 @strcmp(i8* %arrayidx43, i8* %arrayidx44)
  %cmp46 = icmp eq i32 %call45, 0
  br i1 %cmp46, label %if.then48, label %if.end49

if.then48:                                        ; preds = %if.end42
  store i32 2, i32* %retval, align 4
  br label %return

if.end49:                                         ; preds = %if.end42
  br label %if.end50

if.end50:                                         ; preds = %if.end49, %while.end
  %30 = load i8*, i8** %new.addr, align 4
  %31 = load i8, i8* %30, align 1
  %conv51 = sext i8 %31 to i32
  %tobool52 = icmp ne i32 %conv51, 0
  br i1 %tobool52, label %land.lhs.true53, label %if.end59

land.lhs.true53:                                  ; preds = %if.end50
  %32 = load i8*, i8** %cur.addr, align 4
  %33 = load i8*, i8** %new.addr, align 4
  %add.ptr54 = getelementptr inbounds i8, i8* %33, i32 1
  %call55 = call i32 @strcmp(i8* %32, i8* %add.ptr54)
  %cmp56 = icmp eq i32 %call55, 0
  br i1 %cmp56, label %if.then58, label %if.end59

if.then58:                                        ; preds = %land.lhs.true53
  store i32 2, i32* %retval, align 4
  br label %return

if.end59:                                         ; preds = %land.lhs.true53, %if.end50
  store i32 3, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end59, %if.then58, %if.then48, %if.then40, %if.then33, %if.then
  %34 = load i32, i32* %retval, align 4
  ret i32 %34
}

declare i8* @strcpy(i8*, i8*) #1

declare i32 @closedir(%struct.__dirstream*) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
