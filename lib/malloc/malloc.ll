; ModuleID = 'malloc.c'
source_filename = "malloc.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%union.mhead = type { double }
%struct._IO_FILE = type opaque
%struct.__sigset_t = type { [32 x i32] }
%union._malloc_guard = type { i32 }
%struct.anon = type { i8, i8, i16, i32 }

@malloc_flags = global i32 0, align 4
@malloc_trace = global i32 0, align 4
@malloc_register = global i32 0, align 4
@pagesz = internal global i32 0, align 4
@pagebucket = internal global i32 0, align 4
@binsizes = internal constant [30 x i32] [i32 8, i32 16, i32 32, i32 64, i32 128, i32 256, i32 512, i32 1024, i32 2048, i32 4096, i32 8192, i32 16384, i32 32768, i32 65536, i32 131072, i32 262144, i32 524288, i32 1048576, i32 2097152, i32 4194304, i32 8388608, i32 16777216, i32 33554432, i32 67108864, i32 134217728, i32 268435456, i32 536870912, i32 1073741824, i32 -2147483648, i32 -1], align 4
@busy = internal global [30 x i8] zeroinitializer, align 1
@maxbuck = internal global i32 0, align 4
@nextf = internal global [30 x %union.mhead*] zeroinitializer, align 4
@.str = private unnamed_addr constant [37 x i8] c"malloc: block on free list clobbered\00", align 1
@memtop = internal global i8* null, align 4
@interrupt_immediately = external global i32, align 4
@running_trap = external global i32, align 4
@.str.1 = private unnamed_addr constant [29 x i8] c"bcoalesce: CHAIN(mp2) != mp1\00", align 1
@stderr = external constant %struct._IO_FILE*, align 4
@.str.2 = private unnamed_addr constant [37 x i8] c"\0D\0Amalloc: %s:%d: assertion botched\0D\0A\00", align 1
@.str.3 = private unnamed_addr constant [8 x i8] c"unknown\00", align 1
@.str.4 = private unnamed_addr constant [12 x i8] c"nunits < 30\00", align 1
@.str.5 = private unnamed_addr constant [48 x i8] c"realloc: called with unallocated block argument\00", align 1
@.str.6 = private unnamed_addr constant [29 x i8] c"p->minfo.mi_magic2 == 0x5555\00", align 1
@.str.7 = private unnamed_addr constant [52 x i8] c"realloc: underflow detected; mh_nbytes out of range\00", align 1
@.str.8 = private unnamed_addr constant [42 x i8] c"realloc: start and end chunk sizes differ\00", align 1
@.str.9 = private unnamed_addr constant [47 x i8] c"free: called with already freed block argument\00", align 1
@.str.10 = private unnamed_addr constant [45 x i8] c"free: called with unallocated block argument\00", align 1
@.str.11 = private unnamed_addr constant [49 x i8] c"free: underflow detected; mh_nbytes out of range\00", align 1
@.str.12 = private unnamed_addr constant [39 x i8] c"free: start and end chunk sizes differ\00", align 1

; Function Attrs: noinline nounwind
define void @_malloc_block_signals(%struct.__sigset_t* %setp, %struct.__sigset_t* %osetp) #0 {
entry:
  %setp.addr = alloca %struct.__sigset_t*, align 4
  %osetp.addr = alloca %struct.__sigset_t*, align 4
  store %struct.__sigset_t* %setp, %struct.__sigset_t** %setp.addr, align 4
  store %struct.__sigset_t* %osetp, %struct.__sigset_t** %osetp.addr, align 4
  ret void
}

; Function Attrs: noinline nounwind
define void @_malloc_unblock_signals(%struct.__sigset_t* %setp, %struct.__sigset_t* %osetp) #0 {
entry:
  %setp.addr = alloca %struct.__sigset_t*, align 4
  %osetp.addr = alloca %struct.__sigset_t*, align 4
  store %struct.__sigset_t* %setp, %struct.__sigset_t** %setp.addr, align 4
  store %struct.__sigset_t* %osetp, %struct.__sigset_t** %osetp.addr, align 4
  ret void
}

; Function Attrs: noinline nounwind
define i8* @sh_malloc(i32 %bytes, i8* %file, i32 %line) #0 {
entry:
  %bytes.addr = alloca i32, align 4
  %file.addr = alloca i8*, align 4
  %line.addr = alloca i32, align 4
  store i32 %bytes, i32* %bytes.addr, align 4
  store i8* %file, i8** %file.addr, align 4
  store i32 %line, i32* %line.addr, align 4
  %0 = load i32, i32* %bytes.addr, align 4
  %1 = load i8*, i8** %file.addr, align 4
  %2 = load i32, i32* %line.addr, align 4
  %call = call i8* @internal_malloc(i32 %0, i8* %1, i32 %2, i32 1)
  ret i8* %call
}

; Function Attrs: noinline nounwind
define internal i8* @internal_malloc(i32 %n, i8* %file, i32 %line, i32 %flags) #0 {
entry:
  %retval = alloca i8*, align 4
  %n.addr = alloca i32, align 4
  %file.addr = alloca i8*, align 4
  %line.addr = alloca i32, align 4
  %flags.addr = alloca i32, align 4
  %p = alloca %union.mhead*, align 4
  %nunits = alloca i32, align 4
  %m = alloca i8*, align 4
  %z = alloca i8*, align 4
  %nbytes = alloca i32, align 4
  %mg = alloca %union._malloc_guard, align 4
  %mzp = alloca i8*, align 4
  %mctmp = alloca i32, align 4
  %mcn = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  store i8* %file, i8** %file.addr, align 4
  store i32 %line, i32* %line.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %0 = load i32, i32* @pagesz, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end3

if.then:                                          ; preds = %entry
  %call = call i32 @pagealign()
  %cmp1 = icmp slt i32 %call, 0
  br i1 %cmp1, label %if.then2, label %if.end

if.then2:                                         ; preds = %if.then
  store i8* null, i8** %retval, align 4
  br label %return

if.end:                                           ; preds = %if.then
  br label %if.end3

if.end3:                                          ; preds = %if.end, %entry
  %1 = load i32, i32* %n.addr, align 4
  %add = add i32 %1, 8
  %add4 = add i32 %add, 4
  %add5 = add i32 %add4, 7
  %and = and i32 %add5, -8
  store i32 %and, i32* %nbytes, align 4
  %2 = load i32, i32* %nbytes, align 4
  %3 = load i32, i32* @pagesz, align 4
  %shr = ashr i32 %3, 1
  %cmp6 = icmp sle i32 %2, %shr
  br i1 %cmp6, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end3
  br label %cond.end

cond.false:                                       ; preds = %if.end3
  %4 = load i32, i32* @pagebucket, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 1, %cond.true ], [ %4, %cond.false ]
  store i32 %cond, i32* %nunits, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %cond.end
  %5 = load i32, i32* %nunits, align 4
  %cmp7 = icmp slt i32 %5, 30
  br i1 %cmp7, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %nbytes, align 4
  %7 = load i32, i32* %nunits, align 4
  %arrayidx = getelementptr inbounds [30 x i32], [30 x i32]* @binsizes, i32 0, i32 %7
  %8 = load i32, i32* %arrayidx, align 4
  %cmp8 = icmp ule i32 %6, %8
  br i1 %cmp8, label %if.then9, label %if.end10

if.then9:                                         ; preds = %for.body
  br label %for.end

if.end10:                                         ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end10
  %9 = load i32, i32* %nunits, align 4
  %inc = add nsw i32 %9, 1
  store i32 %inc, i32* %nunits, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then9, %for.cond
  %10 = load i32, i32* %nunits, align 4
  %cmp11 = icmp sge i32 %10, 30
  br i1 %cmp11, label %if.then12, label %if.end13

if.then12:                                        ; preds = %for.end
  store i8* null, i8** %retval, align 4
  br label %return

if.end13:                                         ; preds = %for.end
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.end13
  %11 = load i32, i32* %nunits, align 4
  %arrayidx14 = getelementptr inbounds [30 x i8], [30 x i8]* @busy, i32 0, i32 %11
  %12 = load i8, i8* %arrayidx14, align 1
  %tobool = icmp ne i8 %12, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %13 = load i32, i32* %nunits, align 4
  %inc15 = add nsw i32 %13, 1
  store i32 %inc15, i32* %nunits, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %14 = load i32, i32* %nunits, align 4
  %arrayidx16 = getelementptr inbounds [30 x i8], [30 x i8]* @busy, i32 0, i32 %14
  store i8 1, i8* %arrayidx16, align 1
  %15 = load i32, i32* %nunits, align 4
  %16 = load i32, i32* @maxbuck, align 4
  %cmp17 = icmp sgt i32 %15, %16
  br i1 %cmp17, label %if.then18, label %if.end19

if.then18:                                        ; preds = %while.end
  %17 = load i32, i32* %nunits, align 4
  store i32 %17, i32* @maxbuck, align 4
  br label %if.end19

if.end19:                                         ; preds = %if.then18, %while.end
  %18 = load i32, i32* %nunits, align 4
  %arrayidx20 = getelementptr inbounds [30 x %union.mhead*], [30 x %union.mhead*]* @nextf, i32 0, i32 %18
  %19 = load %union.mhead*, %union.mhead** %arrayidx20, align 4
  %cmp21 = icmp eq %union.mhead* %19, null
  br i1 %cmp21, label %if.then22, label %if.end23

if.then22:                                        ; preds = %if.end19
  %20 = load i32, i32* %nunits, align 4
  call void @morecore(i32 %20)
  br label %if.end23

if.end23:                                         ; preds = %if.then22, %if.end19
  %21 = load i32, i32* %nunits, align 4
  %arrayidx24 = getelementptr inbounds [30 x %union.mhead*], [30 x %union.mhead*]* @nextf, i32 0, i32 %21
  %22 = load %union.mhead*, %union.mhead** %arrayidx24, align 4
  store %union.mhead* %22, %union.mhead** %p, align 4
  %cmp25 = icmp eq %union.mhead* %22, null
  br i1 %cmp25, label %if.then26, label %if.end28

if.then26:                                        ; preds = %if.end23
  %23 = load i32, i32* %nunits, align 4
  %arrayidx27 = getelementptr inbounds [30 x i8], [30 x i8]* @busy, i32 0, i32 %23
  store i8 0, i8* %arrayidx27, align 1
  store i8* null, i8** %retval, align 4
  br label %return

if.end28:                                         ; preds = %if.end23
  %24 = load %union.mhead*, %union.mhead** %p, align 4
  %25 = bitcast %union.mhead* %24 to i8*
  %add.ptr = getelementptr inbounds i8, i8* %25, i32 4
  %26 = bitcast i8* %add.ptr to %union.mhead**
  %27 = load %union.mhead*, %union.mhead** %26, align 4
  %28 = load i32, i32* %nunits, align 4
  %arrayidx29 = getelementptr inbounds [30 x %union.mhead*], [30 x %union.mhead*]* @nextf, i32 0, i32 %28
  store %union.mhead* %27, %union.mhead** %arrayidx29, align 4
  %29 = load i32, i32* %nunits, align 4
  %arrayidx30 = getelementptr inbounds [30 x i8], [30 x i8]* @busy, i32 0, i32 %29
  store i8 0, i8* %arrayidx30, align 1
  %30 = load %union.mhead*, %union.mhead** %p, align 4
  %minfo = bitcast %union.mhead* %30 to %struct.anon*
  %mi_alloc = getelementptr inbounds %struct.anon, %struct.anon* %minfo, i32 0, i32 0
  %31 = load i8, i8* %mi_alloc, align 8
  %conv = sext i8 %31 to i32
  %cmp31 = icmp ne i32 %conv, 84
  br i1 %cmp31, label %if.then37, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end28
  %32 = load %union.mhead*, %union.mhead** %p, align 4
  %minfo33 = bitcast %union.mhead* %32 to %struct.anon*
  %mi_index = getelementptr inbounds %struct.anon, %struct.anon* %minfo33, i32 0, i32 1
  %33 = load i8, i8* %mi_index, align 1
  %conv34 = sext i8 %33 to i32
  %34 = load i32, i32* %nunits, align 4
  %cmp35 = icmp ne i32 %conv34, %34
  br i1 %cmp35, label %if.then37, label %if.end40

if.then37:                                        ; preds = %lor.lhs.false, %if.end28
  %35 = load %union.mhead*, %union.mhead** %p, align 4
  %add.ptr38 = getelementptr inbounds %union.mhead, %union.mhead* %35, i32 1
  %36 = bitcast %union.mhead* %add.ptr38 to i8*
  %call39 = call i8* @libintl_gettext(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str, i32 0, i32 0))
  %37 = load i8*, i8** %file.addr, align 4
  %38 = load i32, i32* %line.addr, align 4
  call void @xbotch(i8* %36, i32 0, i8* %call39, i8* %37, i32 %38)
  br label %if.end40

if.end40:                                         ; preds = %if.then37, %lor.lhs.false
  %39 = load %union.mhead*, %union.mhead** %p, align 4
  %minfo41 = bitcast %union.mhead* %39 to %struct.anon*
  %mi_alloc42 = getelementptr inbounds %struct.anon, %struct.anon* %minfo41, i32 0, i32 0
  store i8 -9, i8* %mi_alloc42, align 8
  %40 = load %union.mhead*, %union.mhead** %p, align 4
  %minfo43 = bitcast %union.mhead* %40 to %struct.anon*
  %mi_magic2 = getelementptr inbounds %struct.anon, %struct.anon* %minfo43, i32 0, i32 2
  store i16 21845, i16* %mi_magic2, align 2
  %41 = load i32, i32* %n.addr, align 4
  %42 = load %union.mhead*, %union.mhead** %p, align 4
  %minfo44 = bitcast %union.mhead* %42 to %struct.anon*
  %mi_nbytes = getelementptr inbounds %struct.anon, %struct.anon* %minfo44, i32 0, i32 3
  store i32 %41, i32* %mi_nbytes, align 4
  %43 = load i32, i32* %n.addr, align 4
  %i = bitcast %union._malloc_guard* %mg to i32*
  store i32 %43, i32* %i, align 4
  %s = bitcast %union._malloc_guard* %mg to [4 x i8]*
  %arraydecay = getelementptr inbounds [4 x i8], [4 x i8]* %s, i32 0, i32 0
  store i8* %arraydecay, i8** %z, align 4
  %44 = load %union.mhead*, %union.mhead** %p, align 4
  %add.ptr45 = getelementptr inbounds %union.mhead, %union.mhead* %44, i32 1
  %45 = bitcast %union.mhead* %add.ptr45 to i8*
  %46 = load i32, i32* %n.addr, align 4
  %add.ptr46 = getelementptr inbounds i8, i8* %45, i32 %46
  store i8* %add.ptr46, i8** %m, align 4
  %47 = load i8*, i8** %z, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %47, i32 1
  store i8* %incdec.ptr, i8** %z, align 4
  %48 = load i8, i8* %47, align 1
  %49 = load i8*, i8** %m, align 4
  %incdec.ptr47 = getelementptr inbounds i8, i8* %49, i32 1
  store i8* %incdec.ptr47, i8** %m, align 4
  store i8 %48, i8* %49, align 1
  %50 = load i8*, i8** %z, align 4
  %incdec.ptr48 = getelementptr inbounds i8, i8* %50, i32 1
  store i8* %incdec.ptr48, i8** %z, align 4
  %51 = load i8, i8* %50, align 1
  %52 = load i8*, i8** %m, align 4
  %incdec.ptr49 = getelementptr inbounds i8, i8* %52, i32 1
  store i8* %incdec.ptr49, i8** %m, align 4
  store i8 %51, i8* %52, align 1
  %53 = load i8*, i8** %z, align 4
  %incdec.ptr50 = getelementptr inbounds i8, i8* %53, i32 1
  store i8* %incdec.ptr50, i8** %z, align 4
  %54 = load i8, i8* %53, align 1
  %55 = load i8*, i8** %m, align 4
  %incdec.ptr51 = getelementptr inbounds i8, i8* %55, i32 1
  store i8* %incdec.ptr51, i8** %m, align 4
  store i8 %54, i8* %55, align 1
  %56 = load i8*, i8** %z, align 4
  %incdec.ptr52 = getelementptr inbounds i8, i8* %56, i32 1
  store i8* %incdec.ptr52, i8** %z, align 4
  %57 = load i8, i8* %56, align 1
  %58 = load i8*, i8** %m, align 4
  %incdec.ptr53 = getelementptr inbounds i8, i8* %58, i32 1
  store i8* %incdec.ptr53, i8** %m, align 4
  store i8 %57, i8* %58, align 1
  %59 = load i32, i32* %n.addr, align 4
  %tobool54 = icmp ne i32 %59, 0
  br i1 %tobool54, label %if.then55, label %if.end89

if.then55:                                        ; preds = %if.end40
  br label %do.body

do.body:                                          ; preds = %if.then55
  %60 = load i32, i32* %n.addr, align 4
  %cmp56 = icmp ule i32 %60, 32
  br i1 %cmp56, label %if.then58, label %if.else86

if.then58:                                        ; preds = %do.body
  %61 = load %union.mhead*, %union.mhead** %p, align 4
  %add.ptr59 = getelementptr inbounds %union.mhead, %union.mhead* %61, i32 1
  %62 = bitcast %union.mhead* %add.ptr59 to i8*
  store i8* %62, i8** %mzp, align 4
  %63 = load i32, i32* %n.addr, align 4
  store i32 %63, i32* %mctmp, align 4
  %64 = load i32, i32* %mctmp, align 4
  %cmp60 = icmp ult i32 %64, 8
  br i1 %cmp60, label %if.then62, label %if.else

if.then62:                                        ; preds = %if.then58
  store i32 0, i32* %mcn, align 4
  br label %if.end64

if.else:                                          ; preds = %if.then58
  %65 = load i32, i32* %mctmp, align 4
  %sub = sub i32 %65, 1
  %div = udiv i32 %sub, 8
  store i32 %div, i32* %mcn, align 4
  %66 = load i32, i32* %mctmp, align 4
  %and63 = and i32 %66, 7
  store i32 %and63, i32* %mctmp, align 4
  br label %if.end64

if.end64:                                         ; preds = %if.else, %if.then62
  %67 = load i32, i32* %mctmp, align 4
  switch i32 %67, label %sw.epilog [
    i32 0, label %sw.bb
    i32 7, label %sw.bb67
    i32 6, label %sw.bb69
    i32 5, label %sw.bb71
    i32 4, label %sw.bb73
    i32 3, label %sw.bb75
    i32 2, label %sw.bb77
    i32 1, label %sw.bb79
  ]

sw.bb:                                            ; preds = %if.end64
  br label %for.cond65

for.cond65:                                       ; preds = %if.end84, %sw.bb
  %68 = load i8*, i8** %mzp, align 4
  %incdec.ptr66 = getelementptr inbounds i8, i8* %68, i32 1
  store i8* %incdec.ptr66, i8** %mzp, align 4
  store i8 -33, i8* %68, align 1
  br label %sw.bb67

sw.bb67:                                          ; preds = %if.end64, %for.cond65
  %69 = load i8*, i8** %mzp, align 4
  %incdec.ptr68 = getelementptr inbounds i8, i8* %69, i32 1
  store i8* %incdec.ptr68, i8** %mzp, align 4
  store i8 -33, i8* %69, align 1
  br label %sw.bb69

sw.bb69:                                          ; preds = %if.end64, %sw.bb67
  %70 = load i8*, i8** %mzp, align 4
  %incdec.ptr70 = getelementptr inbounds i8, i8* %70, i32 1
  store i8* %incdec.ptr70, i8** %mzp, align 4
  store i8 -33, i8* %70, align 1
  br label %sw.bb71

sw.bb71:                                          ; preds = %if.end64, %sw.bb69
  %71 = load i8*, i8** %mzp, align 4
  %incdec.ptr72 = getelementptr inbounds i8, i8* %71, i32 1
  store i8* %incdec.ptr72, i8** %mzp, align 4
  store i8 -33, i8* %71, align 1
  br label %sw.bb73

sw.bb73:                                          ; preds = %if.end64, %sw.bb71
  %72 = load i8*, i8** %mzp, align 4
  %incdec.ptr74 = getelementptr inbounds i8, i8* %72, i32 1
  store i8* %incdec.ptr74, i8** %mzp, align 4
  store i8 -33, i8* %72, align 1
  br label %sw.bb75

sw.bb75:                                          ; preds = %if.end64, %sw.bb73
  %73 = load i8*, i8** %mzp, align 4
  %incdec.ptr76 = getelementptr inbounds i8, i8* %73, i32 1
  store i8* %incdec.ptr76, i8** %mzp, align 4
  store i8 -33, i8* %73, align 1
  br label %sw.bb77

sw.bb77:                                          ; preds = %if.end64, %sw.bb75
  %74 = load i8*, i8** %mzp, align 4
  %incdec.ptr78 = getelementptr inbounds i8, i8* %74, i32 1
  store i8* %incdec.ptr78, i8** %mzp, align 4
  store i8 -33, i8* %74, align 1
  br label %sw.bb79

sw.bb79:                                          ; preds = %if.end64, %sw.bb77
  %75 = load i8*, i8** %mzp, align 4
  %incdec.ptr80 = getelementptr inbounds i8, i8* %75, i32 1
  store i8* %incdec.ptr80, i8** %mzp, align 4
  store i8 -33, i8* %75, align 1
  %76 = load i32, i32* %mcn, align 4
  %cmp81 = icmp sle i32 %76, 0
  br i1 %cmp81, label %if.then83, label %if.end84

if.then83:                                        ; preds = %sw.bb79
  br label %for.end85

if.end84:                                         ; preds = %sw.bb79
  %77 = load i32, i32* %mcn, align 4
  %dec = add nsw i32 %77, -1
  store i32 %dec, i32* %mcn, align 4
  br label %for.cond65

for.end85:                                        ; preds = %if.then83
  br label %sw.epilog

sw.epilog:                                        ; preds = %for.end85, %if.end64
  br label %if.end88

if.else86:                                        ; preds = %do.body
  %78 = load %union.mhead*, %union.mhead** %p, align 4
  %add.ptr87 = getelementptr inbounds %union.mhead, %union.mhead* %78, i32 1
  %79 = bitcast %union.mhead* %add.ptr87 to i8*
  %80 = load i32, i32* %n.addr, align 4
  call void @llvm.memset.p0i8.i32(i8* %79, i8 -33, i32 %80, i32 1, i1 false)
  br label %if.end88

if.end88:                                         ; preds = %if.else86, %sw.epilog
  br label %do.end

do.end:                                           ; preds = %if.end88
  br label %if.end89

if.end89:                                         ; preds = %do.end, %if.end40
  %81 = load %union.mhead*, %union.mhead** %p, align 4
  %add.ptr90 = getelementptr inbounds %union.mhead, %union.mhead* %81, i32 1
  %82 = bitcast %union.mhead* %add.ptr90 to i8*
  store i8* %82, i8** %retval, align 4
  br label %return

return:                                           ; preds = %if.end89, %if.then26, %if.then12, %if.then2
  %83 = load i8*, i8** %retval, align 4
  ret i8* %83
}

; Function Attrs: noinline nounwind
define i8* @sh_realloc(i8* %ptr, i32 %size, i8* %file, i32 %line) #0 {
entry:
  %ptr.addr = alloca i8*, align 4
  %size.addr = alloca i32, align 4
  %file.addr = alloca i8*, align 4
  %line.addr = alloca i32, align 4
  store i8* %ptr, i8** %ptr.addr, align 4
  store i32 %size, i32* %size.addr, align 4
  store i8* %file, i8** %file.addr, align 4
  store i32 %line, i32* %line.addr, align 4
  %0 = load i8*, i8** %ptr.addr, align 4
  %1 = load i32, i32* %size.addr, align 4
  %2 = load i8*, i8** %file.addr, align 4
  %3 = load i32, i32* %line.addr, align 4
  %call = call i8* @internal_realloc(i8* %0, i32 %1, i8* %2, i32 %3, i32 1)
  ret i8* %call
}

; Function Attrs: noinline nounwind
define internal i8* @internal_realloc(i8* %mem, i32 %n, i8* %file, i32 %line, i32 %flags) #0 {
entry:
  %retval = alloca i8*, align 4
  %mem.addr = alloca i8*, align 4
  %n.addr = alloca i32, align 4
  %file.addr = alloca i8*, align 4
  %line.addr = alloca i32, align 4
  %flags.addr = alloca i32, align 4
  %p = alloca %union.mhead*, align 4
  %tocopy = alloca i32, align 4
  %nbytes = alloca i32, align 4
  %nunits = alloca i32, align 4
  %m = alloca i8*, align 4
  %z = alloca i8*, align 4
  %mg = alloca %union._malloc_guard, align 4
  store i8* %mem, i8** %mem.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i8* %file, i8** %file.addr, align 4
  store i32 %line, i32* %line.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %0 = load i32, i32* %n.addr, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %mem.addr, align 4
  %2 = load i8*, i8** %file.addr, align 4
  %3 = load i32, i32* %line.addr, align 4
  call void @internal_free(i8* %1, i8* %2, i32 %3, i32 2)
  store i8* null, i8** %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %4 = load i8*, i8** %mem.addr, align 4
  %5 = bitcast i8* %4 to %union.mhead*
  store %union.mhead* %5, %union.mhead** %p, align 4
  %cmp1 = icmp eq %union.mhead* %5, null
  br i1 %cmp1, label %if.then2, label %if.end3

if.then2:                                         ; preds = %if.end
  %6 = load i32, i32* %n.addr, align 4
  %7 = load i8*, i8** %file.addr, align 4
  %8 = load i32, i32* %line.addr, align 4
  %call = call i8* @internal_malloc(i32 %6, i8* %7, i32 %8, i32 2)
  store i8* %call, i8** %retval, align 4
  br label %return

if.end3:                                          ; preds = %if.end
  %9 = load %union.mhead*, %union.mhead** %p, align 4
  %incdec.ptr = getelementptr inbounds %union.mhead, %union.mhead* %9, i32 -1
  store %union.mhead* %incdec.ptr, %union.mhead** %p, align 4
  %10 = load %union.mhead*, %union.mhead** %p, align 4
  %minfo = bitcast %union.mhead* %10 to %struct.anon*
  %mi_index = getelementptr inbounds %struct.anon, %struct.anon* %minfo, i32 0, i32 1
  %11 = load i8, i8* %mi_index, align 1
  %conv = sext i8 %11 to i32
  store i32 %conv, i32* %nunits, align 4
  br label %do.body

do.body:                                          ; preds = %if.end3
  %12 = load i32, i32* %nunits, align 4
  %cmp4 = icmp slt i32 %12, 30
  br i1 %cmp4, label %if.end7, label %if.then6

if.then6:                                         ; preds = %do.body
  %13 = load i8*, i8** %file.addr, align 4
  %14 = load i32, i32* %line.addr, align 4
  call void @xbotch(i8* null, i32 8, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.4, i32 0, i32 0), i8* %13, i32 %14)
  br label %if.end7

if.end7:                                          ; preds = %if.then6, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end7
  %15 = load %union.mhead*, %union.mhead** %p, align 4
  %minfo8 = bitcast %union.mhead* %15 to %struct.anon*
  %mi_alloc = getelementptr inbounds %struct.anon, %struct.anon* %minfo8, i32 0, i32 0
  %16 = load i8, i8* %mi_alloc, align 8
  %conv9 = sext i8 %16 to i32
  %cmp10 = icmp ne i32 %conv9, -9
  br i1 %cmp10, label %if.then12, label %if.end14

if.then12:                                        ; preds = %do.end
  %17 = load i8*, i8** %mem.addr, align 4
  %call13 = call i8* @libintl_gettext(i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.5, i32 0, i32 0))
  %18 = load i8*, i8** %file.addr, align 4
  %19 = load i32, i32* %line.addr, align 4
  call void @xbotch(i8* %17, i32 2, i8* %call13, i8* %18, i32 %19)
  br label %if.end14

if.end14:                                         ; preds = %if.then12, %do.end
  br label %do.body15

do.body15:                                        ; preds = %if.end14
  %20 = load %union.mhead*, %union.mhead** %p, align 4
  %minfo16 = bitcast %union.mhead* %20 to %struct.anon*
  %mi_magic2 = getelementptr inbounds %struct.anon, %struct.anon* %minfo16, i32 0, i32 2
  %21 = load i16, i16* %mi_magic2, align 2
  %conv17 = zext i16 %21 to i32
  %cmp18 = icmp eq i32 %conv17, 21845
  br i1 %cmp18, label %if.end21, label %if.then20

if.then20:                                        ; preds = %do.body15
  %22 = load i8*, i8** %file.addr, align 4
  %23 = load i32, i32* %line.addr, align 4
  call void @xbotch(i8* null, i32 8, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.6, i32 0, i32 0), i8* %22, i32 %23)
  br label %if.end21

if.end21:                                         ; preds = %if.then20, %do.body15
  br label %do.end22

do.end22:                                         ; preds = %if.end21
  %24 = load %union.mhead*, %union.mhead** %p, align 4
  %minfo23 = bitcast %union.mhead* %24 to %struct.anon*
  %mi_nbytes = getelementptr inbounds %struct.anon, %struct.anon* %minfo23, i32 0, i32 3
  %25 = load i32, i32* %mi_nbytes, align 4
  %add = add i32 %25, 8
  %add24 = add i32 %add, 4
  %add25 = add i32 %add24, 7
  %and = and i32 %add25, -8
  store i32 %and, i32* %nbytes, align 4
  %26 = load i32, i32* %nbytes, align 4
  %27 = load i32, i32* %nunits, align 4
  %arrayidx = getelementptr inbounds [30 x i32], [30 x i32]* @binsizes, i32 0, i32 %27
  %28 = load i32, i32* %arrayidx, align 4
  %cmp26 = icmp ule i32 %26, %28
  %conv27 = zext i1 %cmp26 to i32
  %cmp28 = icmp eq i32 %conv27, 0
  br i1 %cmp28, label %if.then30, label %if.end32

if.then30:                                        ; preds = %do.end22
  %29 = load i8*, i8** %mem.addr, align 4
  %call31 = call i8* @libintl_gettext(i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.7, i32 0, i32 0))
  %30 = load i8*, i8** %file.addr, align 4
  %31 = load i32, i32* %line.addr, align 4
  call void @xbotch(i8* %29, i32 4, i8* %call31, i8* %30, i32 %31)
  br label %if.end32

if.end32:                                         ; preds = %if.then30, %do.end22
  %32 = load i8*, i8** %mem.addr, align 4
  %33 = load %union.mhead*, %union.mhead** %p, align 4
  %minfo33 = bitcast %union.mhead* %33 to %struct.anon*
  %mi_nbytes34 = getelementptr inbounds %struct.anon, %struct.anon* %minfo33, i32 0, i32 3
  %34 = load i32, i32* %mi_nbytes34, align 4
  store i32 %34, i32* %tocopy, align 4
  %add.ptr = getelementptr inbounds i8, i8* %32, i32 %34
  store i8* %add.ptr, i8** %m, align 4
  %s = bitcast %union._malloc_guard* %mg to [4 x i8]*
  %arraydecay = getelementptr inbounds [4 x i8], [4 x i8]* %s, i32 0, i32 0
  store i8* %arraydecay, i8** %z, align 4
  %35 = load i8*, i8** %m, align 4
  %incdec.ptr35 = getelementptr inbounds i8, i8* %35, i32 1
  store i8* %incdec.ptr35, i8** %m, align 4
  %36 = load i8, i8* %35, align 1
  %37 = load i8*, i8** %z, align 4
  %incdec.ptr36 = getelementptr inbounds i8, i8* %37, i32 1
  store i8* %incdec.ptr36, i8** %z, align 4
  store i8 %36, i8* %37, align 1
  %38 = load i8*, i8** %m, align 4
  %incdec.ptr37 = getelementptr inbounds i8, i8* %38, i32 1
  store i8* %incdec.ptr37, i8** %m, align 4
  %39 = load i8, i8* %38, align 1
  %40 = load i8*, i8** %z, align 4
  %incdec.ptr38 = getelementptr inbounds i8, i8* %40, i32 1
  store i8* %incdec.ptr38, i8** %z, align 4
  store i8 %39, i8* %40, align 1
  %41 = load i8*, i8** %m, align 4
  %incdec.ptr39 = getelementptr inbounds i8, i8* %41, i32 1
  store i8* %incdec.ptr39, i8** %m, align 4
  %42 = load i8, i8* %41, align 1
  %43 = load i8*, i8** %z, align 4
  %incdec.ptr40 = getelementptr inbounds i8, i8* %43, i32 1
  store i8* %incdec.ptr40, i8** %z, align 4
  store i8 %42, i8* %43, align 1
  %44 = load i8*, i8** %m, align 4
  %incdec.ptr41 = getelementptr inbounds i8, i8* %44, i32 1
  store i8* %incdec.ptr41, i8** %m, align 4
  %45 = load i8, i8* %44, align 1
  %46 = load i8*, i8** %z, align 4
  %incdec.ptr42 = getelementptr inbounds i8, i8* %46, i32 1
  store i8* %incdec.ptr42, i8** %z, align 4
  store i8 %45, i8* %46, align 1
  %i = bitcast %union._malloc_guard* %mg to i32*
  %47 = load i32, i32* %i, align 4
  %48 = load %union.mhead*, %union.mhead** %p, align 4
  %minfo43 = bitcast %union.mhead* %48 to %struct.anon*
  %mi_nbytes44 = getelementptr inbounds %struct.anon, %struct.anon* %minfo43, i32 0, i32 3
  %49 = load i32, i32* %mi_nbytes44, align 4
  %cmp45 = icmp ne i32 %47, %49
  br i1 %cmp45, label %if.then47, label %if.end49

if.then47:                                        ; preds = %if.end32
  %50 = load i8*, i8** %mem.addr, align 4
  %call48 = call i8* @libintl_gettext(i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.8, i32 0, i32 0))
  %51 = load i8*, i8** %file.addr, align 4
  %52 = load i32, i32* %line.addr, align 4
  call void @xbotch(i8* %50, i32 8, i8* %call48, i8* %51, i32 %52)
  br label %if.end49

if.end49:                                         ; preds = %if.then47, %if.end32
  %53 = load i32, i32* %n.addr, align 4
  %add50 = add i32 %53, 8
  %add51 = add i32 %add50, 4
  %add52 = add i32 %add51, 7
  %and53 = and i32 %add52, -8
  store i32 %and53, i32* %nbytes, align 4
  %54 = load i32, i32* %nbytes, align 4
  %55 = load i32, i32* %nunits, align 4
  %sub = sub nsw i32 %55, 1
  %arrayidx54 = getelementptr inbounds [30 x i32], [30 x i32]* @binsizes, i32 0, i32 %sub
  %56 = load i32, i32* %arrayidx54, align 4
  %cmp55 = icmp ugt i32 %54, %56
  br i1 %cmp55, label %land.lhs.true, label %if.end80

land.lhs.true:                                    ; preds = %if.end49
  %57 = load i32, i32* %nbytes, align 4
  %58 = load i32, i32* %nunits, align 4
  %arrayidx57 = getelementptr inbounds [30 x i32], [30 x i32]* @binsizes, i32 0, i32 %58
  %59 = load i32, i32* %arrayidx57, align 4
  %cmp58 = icmp ule i32 %57, %59
  br i1 %cmp58, label %if.then60, label %if.end80

if.then60:                                        ; preds = %land.lhs.true
  %60 = load i8*, i8** %m, align 4
  %add.ptr61 = getelementptr inbounds i8, i8* %60, i32 -4
  store i8* %add.ptr61, i8** %m, align 4
  %61 = load i8*, i8** %m, align 4
  %incdec.ptr62 = getelementptr inbounds i8, i8* %61, i32 1
  store i8* %incdec.ptr62, i8** %m, align 4
  store i8 0, i8* %61, align 1
  %62 = load i8*, i8** %m, align 4
  %incdec.ptr63 = getelementptr inbounds i8, i8* %62, i32 1
  store i8* %incdec.ptr63, i8** %m, align 4
  store i8 0, i8* %62, align 1
  %63 = load i8*, i8** %m, align 4
  %incdec.ptr64 = getelementptr inbounds i8, i8* %63, i32 1
  store i8* %incdec.ptr64, i8** %m, align 4
  store i8 0, i8* %63, align 1
  %64 = load i8*, i8** %m, align 4
  %incdec.ptr65 = getelementptr inbounds i8, i8* %64, i32 1
  store i8* %incdec.ptr65, i8** %m, align 4
  store i8 0, i8* %64, align 1
  %65 = load i8*, i8** %mem.addr, align 4
  %66 = load i32, i32* %n.addr, align 4
  %67 = load %union.mhead*, %union.mhead** %p, align 4
  %minfo66 = bitcast %union.mhead* %67 to %struct.anon*
  %mi_nbytes67 = getelementptr inbounds %struct.anon, %struct.anon* %minfo66, i32 0, i32 3
  store i32 %66, i32* %mi_nbytes67, align 4
  %add.ptr68 = getelementptr inbounds i8, i8* %65, i32 %66
  store i8* %add.ptr68, i8** %m, align 4
  %68 = load i32, i32* %n.addr, align 4
  %i69 = bitcast %union._malloc_guard* %mg to i32*
  store i32 %68, i32* %i69, align 4
  %s70 = bitcast %union._malloc_guard* %mg to [4 x i8]*
  %arraydecay71 = getelementptr inbounds [4 x i8], [4 x i8]* %s70, i32 0, i32 0
  store i8* %arraydecay71, i8** %z, align 4
  %69 = load i8*, i8** %z, align 4
  %incdec.ptr72 = getelementptr inbounds i8, i8* %69, i32 1
  store i8* %incdec.ptr72, i8** %z, align 4
  %70 = load i8, i8* %69, align 1
  %71 = load i8*, i8** %m, align 4
  %incdec.ptr73 = getelementptr inbounds i8, i8* %71, i32 1
  store i8* %incdec.ptr73, i8** %m, align 4
  store i8 %70, i8* %71, align 1
  %72 = load i8*, i8** %z, align 4
  %incdec.ptr74 = getelementptr inbounds i8, i8* %72, i32 1
  store i8* %incdec.ptr74, i8** %z, align 4
  %73 = load i8, i8* %72, align 1
  %74 = load i8*, i8** %m, align 4
  %incdec.ptr75 = getelementptr inbounds i8, i8* %74, i32 1
  store i8* %incdec.ptr75, i8** %m, align 4
  store i8 %73, i8* %74, align 1
  %75 = load i8*, i8** %z, align 4
  %incdec.ptr76 = getelementptr inbounds i8, i8* %75, i32 1
  store i8* %incdec.ptr76, i8** %z, align 4
  %76 = load i8, i8* %75, align 1
  %77 = load i8*, i8** %m, align 4
  %incdec.ptr77 = getelementptr inbounds i8, i8* %77, i32 1
  store i8* %incdec.ptr77, i8** %m, align 4
  store i8 %76, i8* %77, align 1
  %78 = load i8*, i8** %z, align 4
  %incdec.ptr78 = getelementptr inbounds i8, i8* %78, i32 1
  store i8* %incdec.ptr78, i8** %z, align 4
  %79 = load i8, i8* %78, align 1
  %80 = load i8*, i8** %m, align 4
  %incdec.ptr79 = getelementptr inbounds i8, i8* %80, i32 1
  store i8* %incdec.ptr79, i8** %m, align 4
  store i8 %79, i8* %80, align 1
  %81 = load i8*, i8** %mem.addr, align 4
  store i8* %81, i8** %retval, align 4
  br label %return

if.end80:                                         ; preds = %land.lhs.true, %if.end49
  %82 = load i32, i32* %n.addr, align 4
  %83 = load i32, i32* %tocopy, align 4
  %cmp81 = icmp ult i32 %82, %83
  br i1 %cmp81, label %if.then83, label %if.end84

if.then83:                                        ; preds = %if.end80
  %84 = load i32, i32* %n.addr, align 4
  store i32 %84, i32* %tocopy, align 4
  br label %if.end84

if.end84:                                         ; preds = %if.then83, %if.end80
  %85 = load i32, i32* %n.addr, align 4
  %86 = load i8*, i8** %file.addr, align 4
  %87 = load i32, i32* %line.addr, align 4
  %call85 = call i8* @internal_malloc(i32 %85, i8* %86, i32 %87, i32 14)
  store i8* %call85, i8** %m, align 4
  %cmp86 = icmp eq i8* %call85, null
  br i1 %cmp86, label %if.then88, label %if.end89

if.then88:                                        ; preds = %if.end84
  store i8* null, i8** %retval, align 4
  br label %return

if.end89:                                         ; preds = %if.end84
  %88 = load i8*, i8** %m, align 4
  %89 = load i8*, i8** %mem.addr, align 4
  %90 = load i32, i32* %tocopy, align 4
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %88, i8* %89, i32 %90, i32 1, i1 false)
  %91 = load i8*, i8** %mem.addr, align 4
  %92 = load i8*, i8** %file.addr, align 4
  %93 = load i32, i32* %line.addr, align 4
  call void @internal_free(i8* %91, i8* %92, i32 %93, i32 2)
  %94 = load i8*, i8** %m, align 4
  store i8* %94, i8** %retval, align 4
  br label %return

return:                                           ; preds = %if.end89, %if.then88, %if.then60, %if.then2, %if.then
  %95 = load i8*, i8** %retval, align 4
  ret i8* %95
}

; Function Attrs: noinline nounwind
define void @sh_free(i8* %mem, i8* %file, i32 %line) #0 {
entry:
  %mem.addr = alloca i8*, align 4
  %file.addr = alloca i8*, align 4
  %line.addr = alloca i32, align 4
  store i8* %mem, i8** %mem.addr, align 4
  store i8* %file, i8** %file.addr, align 4
  store i32 %line, i32* %line.addr, align 4
  %0 = load i8*, i8** %mem.addr, align 4
  %1 = load i8*, i8** %file.addr, align 4
  %2 = load i32, i32* %line.addr, align 4
  call void @internal_free(i8* %0, i8* %1, i32 %2, i32 1)
  ret void
}

; Function Attrs: noinline nounwind
define internal void @internal_free(i8* %mem, i8* %file, i32 %line, i32 %flags) #0 {
entry:
  %mem.addr = alloca i8*, align 4
  %file.addr = alloca i8*, align 4
  %line.addr = alloca i32, align 4
  %flags.addr = alloca i32, align 4
  %p = alloca %union.mhead*, align 4
  %ap = alloca i8*, align 4
  %z = alloca i8*, align 4
  %nunits = alloca i32, align 4
  %nbytes = alloca i32, align 4
  %ubytes = alloca i32, align 4
  %mg = alloca %union._malloc_guard, align 4
  %mzp = alloca i8*, align 4
  %mctmp = alloca i32, align 4
  %mcn = alloca i32, align 4
  store i8* %mem, i8** %mem.addr, align 4
  store i8* %file, i8** %file.addr, align 4
  store i32 %line, i32* %line.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %0 = load i8*, i8** %mem.addr, align 4
  store i8* %0, i8** %ap, align 4
  %cmp = icmp eq i8* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %free_return

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %ap, align 4
  %2 = bitcast i8* %1 to %union.mhead*
  %add.ptr = getelementptr inbounds %union.mhead, %union.mhead* %2, i32 -1
  store %union.mhead* %add.ptr, %union.mhead** %p, align 4
  %3 = load %union.mhead*, %union.mhead** %p, align 4
  %minfo = bitcast %union.mhead* %3 to %struct.anon*
  %mi_alloc = getelementptr inbounds %struct.anon, %struct.anon* %minfo, i32 0, i32 0
  %4 = load i8, i8* %mi_alloc, align 8
  %conv = sext i8 %4 to i32
  %cmp1 = icmp eq i32 %conv, -42
  br i1 %cmp1, label %if.then3, label %if.end7

if.then3:                                         ; preds = %if.end
  %5 = load %union.mhead*, %union.mhead** %p, align 4
  %minfo4 = bitcast %union.mhead* %5 to %struct.anon*
  %mi_nbytes = getelementptr inbounds %struct.anon, %struct.anon* %minfo4, i32 0, i32 3
  %6 = load i32, i32* %mi_nbytes, align 4
  %7 = load i8*, i8** %ap, align 4
  %idx.neg = sub i32 0, %6
  %add.ptr5 = getelementptr inbounds i8, i8* %7, i32 %idx.neg
  store i8* %add.ptr5, i8** %ap, align 4
  %8 = load i8*, i8** %ap, align 4
  %9 = bitcast i8* %8 to %union.mhead*
  %add.ptr6 = getelementptr inbounds %union.mhead, %union.mhead* %9, i32 -1
  store %union.mhead* %add.ptr6, %union.mhead** %p, align 4
  br label %if.end7

if.end7:                                          ; preds = %if.then3, %if.end
  %10 = load %union.mhead*, %union.mhead** %p, align 4
  %minfo8 = bitcast %union.mhead* %10 to %struct.anon*
  %mi_alloc9 = getelementptr inbounds %struct.anon, %struct.anon* %minfo8, i32 0, i32 0
  %11 = load i8, i8* %mi_alloc9, align 8
  %conv10 = sext i8 %11 to i32
  %cmp11 = icmp ne i32 %conv10, -9
  br i1 %cmp11, label %if.then13, label %if.end22

if.then13:                                        ; preds = %if.end7
  %12 = load %union.mhead*, %union.mhead** %p, align 4
  %minfo14 = bitcast %union.mhead* %12 to %struct.anon*
  %mi_alloc15 = getelementptr inbounds %struct.anon, %struct.anon* %minfo14, i32 0, i32 0
  %13 = load i8, i8* %mi_alloc15, align 8
  %conv16 = sext i8 %13 to i32
  %cmp17 = icmp eq i32 %conv16, 84
  br i1 %cmp17, label %if.then19, label %if.else

if.then19:                                        ; preds = %if.then13
  %14 = load i8*, i8** %mem.addr, align 4
  %call = call i8* @libintl_gettext(i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.9, i32 0, i32 0))
  %15 = load i8*, i8** %file.addr, align 4
  %16 = load i32, i32* %line.addr, align 4
  call void @xbotch(i8* %14, i32 1, i8* %call, i8* %15, i32 %16)
  br label %if.end21

if.else:                                          ; preds = %if.then13
  %17 = load i8*, i8** %mem.addr, align 4
  %call20 = call i8* @libintl_gettext(i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.10, i32 0, i32 0))
  %18 = load i8*, i8** %file.addr, align 4
  %19 = load i32, i32* %line.addr, align 4
  call void @xbotch(i8* %17, i32 2, i8* %call20, i8* %18, i32 %19)
  br label %if.end21

if.end21:                                         ; preds = %if.else, %if.then19
  br label %if.end22

if.end22:                                         ; preds = %if.end21, %if.end7
  br label %do.body

do.body:                                          ; preds = %if.end22
  %20 = load %union.mhead*, %union.mhead** %p, align 4
  %minfo23 = bitcast %union.mhead* %20 to %struct.anon*
  %mi_magic2 = getelementptr inbounds %struct.anon, %struct.anon* %minfo23, i32 0, i32 2
  %21 = load i16, i16* %mi_magic2, align 2
  %conv24 = zext i16 %21 to i32
  %cmp25 = icmp eq i32 %conv24, 21845
  br i1 %cmp25, label %if.end28, label %if.then27

if.then27:                                        ; preds = %do.body
  %22 = load i8*, i8** %file.addr, align 4
  %23 = load i32, i32* %line.addr, align 4
  call void @xbotch(i8* null, i32 8, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.6, i32 0, i32 0), i8* %22, i32 %23)
  br label %if.end28

if.end28:                                         ; preds = %if.then27, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end28
  %24 = load %union.mhead*, %union.mhead** %p, align 4
  %minfo29 = bitcast %union.mhead* %24 to %struct.anon*
  %mi_index = getelementptr inbounds %struct.anon, %struct.anon* %minfo29, i32 0, i32 1
  %25 = load i8, i8* %mi_index, align 1
  %conv30 = sext i8 %25 to i32
  store i32 %conv30, i32* %nunits, align 4
  %26 = load %union.mhead*, %union.mhead** %p, align 4
  %minfo31 = bitcast %union.mhead* %26 to %struct.anon*
  %mi_nbytes32 = getelementptr inbounds %struct.anon, %struct.anon* %minfo31, i32 0, i32 3
  %27 = load i32, i32* %mi_nbytes32, align 4
  %add = add i32 %27, 8
  %add33 = add i32 %add, 4
  %add34 = add i32 %add33, 7
  %and = and i32 %add34, -8
  store i32 %and, i32* %nbytes, align 4
  %28 = load i32, i32* %nbytes, align 4
  %29 = load i32, i32* %nunits, align 4
  %arrayidx = getelementptr inbounds [30 x i32], [30 x i32]* @binsizes, i32 0, i32 %29
  %30 = load i32, i32* %arrayidx, align 4
  %cmp35 = icmp ule i32 %28, %30
  %conv36 = zext i1 %cmp35 to i32
  %cmp37 = icmp eq i32 %conv36, 0
  br i1 %cmp37, label %if.then39, label %if.end41

if.then39:                                        ; preds = %do.end
  %31 = load i8*, i8** %mem.addr, align 4
  %call40 = call i8* @libintl_gettext(i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.11, i32 0, i32 0))
  %32 = load i8*, i8** %file.addr, align 4
  %33 = load i32, i32* %line.addr, align 4
  call void @xbotch(i8* %31, i32 4, i8* %call40, i8* %32, i32 %33)
  br label %if.end41

if.end41:                                         ; preds = %if.then39, %do.end
  %34 = load %union.mhead*, %union.mhead** %p, align 4
  %minfo42 = bitcast %union.mhead* %34 to %struct.anon*
  %mi_nbytes43 = getelementptr inbounds %struct.anon, %struct.anon* %minfo42, i32 0, i32 3
  %35 = load i32, i32* %mi_nbytes43, align 4
  %36 = load i8*, i8** %ap, align 4
  %add.ptr44 = getelementptr inbounds i8, i8* %36, i32 %35
  store i8* %add.ptr44, i8** %ap, align 4
  %s = bitcast %union._malloc_guard* %mg to [4 x i8]*
  %arraydecay = getelementptr inbounds [4 x i8], [4 x i8]* %s, i32 0, i32 0
  store i8* %arraydecay, i8** %z, align 4
  %37 = load i8*, i8** %ap, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %37, i32 1
  store i8* %incdec.ptr, i8** %ap, align 4
  %38 = load i8, i8* %37, align 1
  %39 = load i8*, i8** %z, align 4
  %incdec.ptr45 = getelementptr inbounds i8, i8* %39, i32 1
  store i8* %incdec.ptr45, i8** %z, align 4
  store i8 %38, i8* %39, align 1
  %40 = load i8*, i8** %ap, align 4
  %incdec.ptr46 = getelementptr inbounds i8, i8* %40, i32 1
  store i8* %incdec.ptr46, i8** %ap, align 4
  %41 = load i8, i8* %40, align 1
  %42 = load i8*, i8** %z, align 4
  %incdec.ptr47 = getelementptr inbounds i8, i8* %42, i32 1
  store i8* %incdec.ptr47, i8** %z, align 4
  store i8 %41, i8* %42, align 1
  %43 = load i8*, i8** %ap, align 4
  %incdec.ptr48 = getelementptr inbounds i8, i8* %43, i32 1
  store i8* %incdec.ptr48, i8** %ap, align 4
  %44 = load i8, i8* %43, align 1
  %45 = load i8*, i8** %z, align 4
  %incdec.ptr49 = getelementptr inbounds i8, i8* %45, i32 1
  store i8* %incdec.ptr49, i8** %z, align 4
  store i8 %44, i8* %45, align 1
  %46 = load i8*, i8** %ap, align 4
  %incdec.ptr50 = getelementptr inbounds i8, i8* %46, i32 1
  store i8* %incdec.ptr50, i8** %ap, align 4
  %47 = load i8, i8* %46, align 1
  %48 = load i8*, i8** %z, align 4
  %incdec.ptr51 = getelementptr inbounds i8, i8* %48, i32 1
  store i8* %incdec.ptr51, i8** %z, align 4
  store i8 %47, i8* %48, align 1
  %i = bitcast %union._malloc_guard* %mg to i32*
  %49 = load i32, i32* %i, align 4
  %50 = load %union.mhead*, %union.mhead** %p, align 4
  %minfo52 = bitcast %union.mhead* %50 to %struct.anon*
  %mi_nbytes53 = getelementptr inbounds %struct.anon, %struct.anon* %minfo52, i32 0, i32 3
  %51 = load i32, i32* %mi_nbytes53, align 4
  %cmp54 = icmp ne i32 %49, %51
  br i1 %cmp54, label %if.then56, label %if.end58

if.then56:                                        ; preds = %if.end41
  %52 = load i8*, i8** %mem.addr, align 4
  %call57 = call i8* @libintl_gettext(i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str.12, i32 0, i32 0))
  %53 = load i8*, i8** %file.addr, align 4
  %54 = load i32, i32* %line.addr, align 4
  call void @xbotch(i8* %52, i32 8, i8* %call57, i8* %53, i32 %54)
  br label %if.end58

if.end58:                                         ; preds = %if.then56, %if.end41
  %55 = load i32, i32* %nunits, align 4
  %cmp59 = icmp sge i32 %55, 10
  br i1 %cmp59, label %land.lhs.true, label %if.end76

land.lhs.true:                                    ; preds = %if.end58
  %56 = load %union.mhead*, %union.mhead** %p, align 4
  %57 = bitcast %union.mhead* %56 to i8*
  %58 = load i32, i32* %nunits, align 4
  %arrayidx61 = getelementptr inbounds [30 x i32], [30 x i32]* @binsizes, i32 0, i32 %58
  %59 = load i32, i32* %arrayidx61, align 4
  %add.ptr62 = getelementptr inbounds i8, i8* %57, i32 %59
  %60 = load i8*, i8** @memtop, align 4
  %cmp63 = icmp eq i8* %add.ptr62, %60
  br i1 %cmp63, label %if.then65, label %if.end76

if.then65:                                        ; preds = %land.lhs.true
  %61 = load i32, i32* %nunits, align 4
  %cmp66 = icmp sge i32 %61, 13
  br i1 %cmp66, label %if.then74, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.then65
  %62 = load i32, i32* %nunits, align 4
  %arrayidx68 = getelementptr inbounds [30 x i8], [30 x i8]* @busy, i32 0, i32 %62
  %63 = load i8, i8* %arrayidx68, align 1
  %conv69 = sext i8 %63 to i32
  %tobool = icmp ne i32 %conv69, 0
  br i1 %tobool, label %if.then74, label %lor.lhs.false70

lor.lhs.false70:                                  ; preds = %lor.lhs.false
  %64 = load i32, i32* %nunits, align 4
  %arrayidx71 = getelementptr inbounds [30 x %union.mhead*], [30 x %union.mhead*]* @nextf, i32 0, i32 %64
  %65 = load %union.mhead*, %union.mhead** %arrayidx71, align 4
  %cmp72 = icmp ne %union.mhead* %65, null
  br i1 %cmp72, label %if.then74, label %if.end75

if.then74:                                        ; preds = %lor.lhs.false70, %lor.lhs.false, %if.then65
  %66 = load i32, i32* %nunits, align 4
  call void @lesscore(i32 %66)
  br label %free_return

if.end75:                                         ; preds = %lor.lhs.false70
  br label %if.end76

if.end76:                                         ; preds = %if.end75, %land.lhs.true, %if.end58
  %67 = load %union.mhead*, %union.mhead** %p, align 4
  %minfo77 = bitcast %union.mhead* %67 to %struct.anon*
  %mi_nbytes78 = getelementptr inbounds %struct.anon, %struct.anon* %minfo77, i32 0, i32 3
  %68 = load i32, i32* %mi_nbytes78, align 4
  %tobool79 = icmp ne i32 %68, 0
  br i1 %tobool79, label %if.then80, label %if.end119

if.then80:                                        ; preds = %if.end76
  br label %do.body81

do.body81:                                        ; preds = %if.then80
  %69 = load %union.mhead*, %union.mhead** %p, align 4
  %minfo82 = bitcast %union.mhead* %69 to %struct.anon*
  %mi_nbytes83 = getelementptr inbounds %struct.anon, %struct.anon* %minfo82, i32 0, i32 3
  %70 = load i32, i32* %mi_nbytes83, align 4
  %cmp84 = icmp ule i32 %70, 32
  br i1 %cmp84, label %if.then86, label %if.else114

if.then86:                                        ; preds = %do.body81
  %71 = load i8*, i8** %mem.addr, align 4
  store i8* %71, i8** %mzp, align 4
  %72 = load %union.mhead*, %union.mhead** %p, align 4
  %minfo87 = bitcast %union.mhead* %72 to %struct.anon*
  %mi_nbytes88 = getelementptr inbounds %struct.anon, %struct.anon* %minfo87, i32 0, i32 3
  %73 = load i32, i32* %mi_nbytes88, align 4
  store i32 %73, i32* %mctmp, align 4
  %74 = load i32, i32* %mctmp, align 4
  %cmp89 = icmp ult i32 %74, 8
  br i1 %cmp89, label %if.then91, label %if.else92

if.then91:                                        ; preds = %if.then86
  store i32 0, i32* %mcn, align 4
  br label %if.end94

if.else92:                                        ; preds = %if.then86
  %75 = load i32, i32* %mctmp, align 4
  %sub = sub i32 %75, 1
  %div = udiv i32 %sub, 8
  store i32 %div, i32* %mcn, align 4
  %76 = load i32, i32* %mctmp, align 4
  %and93 = and i32 %76, 7
  store i32 %and93, i32* %mctmp, align 4
  br label %if.end94

if.end94:                                         ; preds = %if.else92, %if.then91
  %77 = load i32, i32* %mctmp, align 4
  switch i32 %77, label %sw.epilog [
    i32 0, label %sw.bb
    i32 7, label %sw.bb96
    i32 6, label %sw.bb98
    i32 5, label %sw.bb100
    i32 4, label %sw.bb102
    i32 3, label %sw.bb104
    i32 2, label %sw.bb106
    i32 1, label %sw.bb108
  ]

sw.bb:                                            ; preds = %if.end94
  br label %for.cond

for.cond:                                         ; preds = %if.end113, %sw.bb
  %78 = load i8*, i8** %mzp, align 4
  %incdec.ptr95 = getelementptr inbounds i8, i8* %78, i32 1
  store i8* %incdec.ptr95, i8** %mzp, align 4
  store i8 -49, i8* %78, align 1
  br label %sw.bb96

sw.bb96:                                          ; preds = %if.end94, %for.cond
  %79 = load i8*, i8** %mzp, align 4
  %incdec.ptr97 = getelementptr inbounds i8, i8* %79, i32 1
  store i8* %incdec.ptr97, i8** %mzp, align 4
  store i8 -49, i8* %79, align 1
  br label %sw.bb98

sw.bb98:                                          ; preds = %if.end94, %sw.bb96
  %80 = load i8*, i8** %mzp, align 4
  %incdec.ptr99 = getelementptr inbounds i8, i8* %80, i32 1
  store i8* %incdec.ptr99, i8** %mzp, align 4
  store i8 -49, i8* %80, align 1
  br label %sw.bb100

sw.bb100:                                         ; preds = %if.end94, %sw.bb98
  %81 = load i8*, i8** %mzp, align 4
  %incdec.ptr101 = getelementptr inbounds i8, i8* %81, i32 1
  store i8* %incdec.ptr101, i8** %mzp, align 4
  store i8 -49, i8* %81, align 1
  br label %sw.bb102

sw.bb102:                                         ; preds = %if.end94, %sw.bb100
  %82 = load i8*, i8** %mzp, align 4
  %incdec.ptr103 = getelementptr inbounds i8, i8* %82, i32 1
  store i8* %incdec.ptr103, i8** %mzp, align 4
  store i8 -49, i8* %82, align 1
  br label %sw.bb104

sw.bb104:                                         ; preds = %if.end94, %sw.bb102
  %83 = load i8*, i8** %mzp, align 4
  %incdec.ptr105 = getelementptr inbounds i8, i8* %83, i32 1
  store i8* %incdec.ptr105, i8** %mzp, align 4
  store i8 -49, i8* %83, align 1
  br label %sw.bb106

sw.bb106:                                         ; preds = %if.end94, %sw.bb104
  %84 = load i8*, i8** %mzp, align 4
  %incdec.ptr107 = getelementptr inbounds i8, i8* %84, i32 1
  store i8* %incdec.ptr107, i8** %mzp, align 4
  store i8 -49, i8* %84, align 1
  br label %sw.bb108

sw.bb108:                                         ; preds = %if.end94, %sw.bb106
  %85 = load i8*, i8** %mzp, align 4
  %incdec.ptr109 = getelementptr inbounds i8, i8* %85, i32 1
  store i8* %incdec.ptr109, i8** %mzp, align 4
  store i8 -49, i8* %85, align 1
  %86 = load i32, i32* %mcn, align 4
  %cmp110 = icmp sle i32 %86, 0
  br i1 %cmp110, label %if.then112, label %if.end113

if.then112:                                       ; preds = %sw.bb108
  br label %for.end

if.end113:                                        ; preds = %sw.bb108
  %87 = load i32, i32* %mcn, align 4
  %dec = add nsw i32 %87, -1
  store i32 %dec, i32* %mcn, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then112
  br label %sw.epilog

sw.epilog:                                        ; preds = %for.end, %if.end94
  br label %if.end117

if.else114:                                       ; preds = %do.body81
  %88 = load i8*, i8** %mem.addr, align 4
  %89 = load %union.mhead*, %union.mhead** %p, align 4
  %minfo115 = bitcast %union.mhead* %89 to %struct.anon*
  %mi_nbytes116 = getelementptr inbounds %struct.anon, %struct.anon* %minfo115, i32 0, i32 3
  %90 = load i32, i32* %mi_nbytes116, align 4
  call void @llvm.memset.p0i8.i32(i8* %88, i8 -49, i32 %90, i32 1, i1 false)
  br label %if.end117

if.end117:                                        ; preds = %if.else114, %sw.epilog
  br label %do.end118

do.end118:                                        ; preds = %if.end117
  br label %if.end119

if.end119:                                        ; preds = %do.end118, %if.end76
  br label %do.body120

do.body120:                                       ; preds = %if.end119
  %91 = load i32, i32* %nunits, align 4
  %cmp121 = icmp slt i32 %91, 30
  br i1 %cmp121, label %if.end124, label %if.then123

if.then123:                                       ; preds = %do.body120
  %92 = load i8*, i8** %file.addr, align 4
  %93 = load i32, i32* %line.addr, align 4
  call void @xbotch(i8* null, i32 8, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.4, i32 0, i32 0), i8* %92, i32 %93)
  br label %if.end124

if.end124:                                        ; preds = %if.then123, %do.body120
  br label %do.end125

do.end125:                                        ; preds = %if.end124
  %94 = load i32, i32* %nunits, align 4
  %arrayidx126 = getelementptr inbounds [30 x i8], [30 x i8]* @busy, i32 0, i32 %94
  %95 = load i8, i8* %arrayidx126, align 1
  %conv127 = sext i8 %95 to i32
  %cmp128 = icmp eq i32 %conv127, 1
  br i1 %cmp128, label %if.then130, label %if.end131

if.then130:                                       ; preds = %do.end125
  %96 = load %union.mhead*, %union.mhead** %p, align 4
  %97 = load i32, i32* %nunits, align 4
  call void @xsplit(%union.mhead* %96, i32 %97)
  br label %free_return

if.end131:                                        ; preds = %do.end125
  %98 = load %union.mhead*, %union.mhead** %p, align 4
  %minfo132 = bitcast %union.mhead* %98 to %struct.anon*
  %mi_alloc133 = getelementptr inbounds %struct.anon, %struct.anon* %minfo132, i32 0, i32 0
  store i8 84, i8* %mi_alloc133, align 8
  %99 = load i32, i32* %nunits, align 4
  %arrayidx134 = getelementptr inbounds [30 x i8], [30 x i8]* @busy, i32 0, i32 %99
  store i8 1, i8* %arrayidx134, align 1
  %100 = load i32, i32* %nunits, align 4
  %arrayidx135 = getelementptr inbounds [30 x %union.mhead*], [30 x %union.mhead*]* @nextf, i32 0, i32 %100
  %101 = load %union.mhead*, %union.mhead** %arrayidx135, align 4
  %102 = load %union.mhead*, %union.mhead** %p, align 4
  %103 = bitcast %union.mhead* %102 to i8*
  %add.ptr136 = getelementptr inbounds i8, i8* %103, i32 4
  %104 = bitcast i8* %add.ptr136 to %union.mhead**
  store %union.mhead* %101, %union.mhead** %104, align 4
  %105 = load %union.mhead*, %union.mhead** %p, align 4
  %106 = load i32, i32* %nunits, align 4
  %arrayidx137 = getelementptr inbounds [30 x %union.mhead*], [30 x %union.mhead*]* @nextf, i32 0, i32 %106
  store %union.mhead* %105, %union.mhead** %arrayidx137, align 4
  %107 = load i32, i32* %nunits, align 4
  %arrayidx138 = getelementptr inbounds [30 x i8], [30 x i8]* @busy, i32 0, i32 %107
  store i8 0, i8* %arrayidx138, align 1
  br label %free_return

free_return:                                      ; preds = %if.then, %if.end131, %if.then130, %if.then74
  ret void
}

; Function Attrs: noinline nounwind
define i8* @sh_memalign(i32 %alignment, i32 %size, i8* %file, i32 %line) #0 {
entry:
  %alignment.addr = alloca i32, align 4
  %size.addr = alloca i32, align 4
  %file.addr = alloca i8*, align 4
  %line.addr = alloca i32, align 4
  store i32 %alignment, i32* %alignment.addr, align 4
  store i32 %size, i32* %size.addr, align 4
  store i8* %file, i8** %file.addr, align 4
  store i32 %line, i32* %line.addr, align 4
  %0 = load i32, i32* %alignment.addr, align 4
  %1 = load i32, i32* %size.addr, align 4
  %2 = load i8*, i8** %file.addr, align 4
  %3 = load i32, i32* %line.addr, align 4
  %call = call i8* @internal_memalign(i32 %0, i32 %1, i8* %2, i32 %3, i32 1)
  ret i8* %call
}

; Function Attrs: noinline nounwind
define internal i8* @internal_memalign(i32 %alignment, i32 %size, i8* %file, i32 %line, i32 %flags) #0 {
entry:
  %retval = alloca i8*, align 4
  %alignment.addr = alloca i32, align 4
  %size.addr = alloca i32, align 4
  %file.addr = alloca i8*, align 4
  %line.addr = alloca i32, align 4
  %flags.addr = alloca i32, align 4
  %ptr = alloca i8*, align 4
  %aligned = alloca i8*, align 4
  %p = alloca %union.mhead*, align 4
  store i32 %alignment, i32* %alignment.addr, align 4
  store i32 %size, i32* %size.addr, align 4
  store i8* %file, i8** %file.addr, align 4
  store i32 %line, i32* %line.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %0 = load i32, i32* %size.addr, align 4
  %1 = load i32, i32* %alignment.addr, align 4
  %add = add i32 %0, %1
  %2 = load i8*, i8** %file.addr, align 4
  %3 = load i32, i32* %line.addr, align 4
  %call = call i8* @internal_malloc(i32 %add, i8* %2, i32 %3, i32 2)
  store i8* %call, i8** %ptr, align 4
  %4 = load i8*, i8** %ptr, align 4
  %cmp = icmp eq i8* %4, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i8* null, i8** %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %5 = load i8*, i8** %ptr, align 4
  %6 = ptrtoint i8* %5 to i32
  %7 = load i32, i32* %alignment.addr, align 4
  %sub = sub i32 %7, 1
  %and = and i32 %6, %sub
  %cmp1 = icmp eq i32 %and, 0
  br i1 %cmp1, label %if.then2, label %if.end3

if.then2:                                         ; preds = %if.end
  %8 = load i8*, i8** %ptr, align 4
  store i8* %8, i8** %retval, align 4
  br label %return

if.end3:                                          ; preds = %if.end
  %9 = load i8*, i8** %ptr, align 4
  %10 = ptrtoint i8* %9 to i32
  %11 = load i32, i32* %alignment.addr, align 4
  %add4 = add i32 %10, %11
  %sub5 = sub i32 %add4, 1
  %12 = load i32, i32* %alignment.addr, align 4
  %neg = xor i32 %12, -1
  %add6 = add i32 %neg, 1
  %and7 = and i32 %sub5, %add6
  %13 = inttoptr i32 %and7 to i8*
  store i8* %13, i8** %aligned, align 4
  %14 = load i8*, i8** %aligned, align 4
  %15 = bitcast i8* %14 to %union.mhead*
  %add.ptr = getelementptr inbounds %union.mhead, %union.mhead* %15, i32 -1
  store %union.mhead* %add.ptr, %union.mhead** %p, align 4
  %16 = load i8*, i8** %aligned, align 4
  %17 = load i8*, i8** %ptr, align 4
  %sub.ptr.lhs.cast = ptrtoint i8* %16 to i32
  %sub.ptr.rhs.cast = ptrtoint i8* %17 to i32
  %sub.ptr.sub = sub i32 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %18 = load %union.mhead*, %union.mhead** %p, align 4
  %minfo = bitcast %union.mhead* %18 to %struct.anon*
  %mi_nbytes = getelementptr inbounds %struct.anon, %struct.anon* %minfo, i32 0, i32 3
  store i32 %sub.ptr.sub, i32* %mi_nbytes, align 4
  %19 = load %union.mhead*, %union.mhead** %p, align 4
  %minfo8 = bitcast %union.mhead* %19 to %struct.anon*
  %mi_alloc = getelementptr inbounds %struct.anon, %struct.anon* %minfo8, i32 0, i32 0
  store i8 -42, i8* %mi_alloc, align 8
  %20 = load i8*, i8** %aligned, align 4
  store i8* %20, i8** %retval, align 4
  br label %return

return:                                           ; preds = %if.end3, %if.then2, %if.then
  %21 = load i8*, i8** %retval, align 4
  ret i8* %21
}

; Function Attrs: noinline nounwind
define i8* @sh_calloc(i32 %n, i32 %s, i8* %file, i32 %line) #0 {
entry:
  %n.addr = alloca i32, align 4
  %s.addr = alloca i32, align 4
  %file.addr = alloca i8*, align 4
  %line.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  store i32 %s, i32* %s.addr, align 4
  store i8* %file, i8** %file.addr, align 4
  store i32 %line, i32* %line.addr, align 4
  %0 = load i32, i32* %n.addr, align 4
  %1 = load i32, i32* %s.addr, align 4
  %2 = load i8*, i8** %file.addr, align 4
  %3 = load i32, i32* %line.addr, align 4
  %call = call i8* @internal_calloc(i32 %0, i32 %1, i8* %2, i32 %3, i32 1)
  ret i8* %call
}

; Function Attrs: noinline nounwind
define internal i8* @internal_calloc(i32 %n, i32 %s, i8* %file, i32 %line, i32 %flags) #0 {
entry:
  %n.addr = alloca i32, align 4
  %s.addr = alloca i32, align 4
  %file.addr = alloca i8*, align 4
  %line.addr = alloca i32, align 4
  %flags.addr = alloca i32, align 4
  %total = alloca i32, align 4
  %result = alloca i8*, align 4
  store i32 %n, i32* %n.addr, align 4
  store i32 %s, i32* %s.addr, align 4
  store i8* %file, i8** %file.addr, align 4
  store i32 %line, i32* %line.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %0 = load i32, i32* %n.addr, align 4
  %1 = load i32, i32* %s.addr, align 4
  %mul = mul i32 %0, %1
  store i32 %mul, i32* %total, align 4
  %2 = load i32, i32* %total, align 4
  %3 = load i8*, i8** %file.addr, align 4
  %4 = load i32, i32* %line.addr, align 4
  %5 = load i32, i32* %flags.addr, align 4
  %or = or i32 %5, 2
  %call = call i8* @internal_malloc(i32 %2, i8* %3, i32 %4, i32 %or)
  store i8* %call, i8** %result, align 4
  %6 = load i8*, i8** %result, align 4
  %tobool = icmp ne i8* %6, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %7 = load i8*, i8** %result, align 4
  %8 = load i32, i32* %total, align 4
  call void @llvm.memset.p0i8.i32(i8* %7, i8 0, i32 %8, i32 1, i1 false)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %9 = load i8*, i8** %result, align 4
  ret i8* %9
}

; Function Attrs: noinline nounwind
define void @sh_cfree(i8* %mem, i8* %file, i32 %line) #0 {
entry:
  %mem.addr = alloca i8*, align 4
  %file.addr = alloca i8*, align 4
  %line.addr = alloca i32, align 4
  store i8* %mem, i8** %mem.addr, align 4
  store i8* %file, i8** %file.addr, align 4
  store i32 %line, i32* %line.addr, align 4
  %0 = load i8*, i8** %mem.addr, align 4
  %1 = load i8*, i8** %file.addr, align 4
  %2 = load i32, i32* %line.addr, align 4
  call void @internal_cfree(i8* %0, i8* %1, i32 %2, i32 1)
  ret void
}

; Function Attrs: noinline nounwind
define internal void @internal_cfree(i8* %p, i8* %file, i32 %line, i32 %flags) #0 {
entry:
  %p.addr = alloca i8*, align 4
  %file.addr = alloca i8*, align 4
  %line.addr = alloca i32, align 4
  %flags.addr = alloca i32, align 4
  store i8* %p, i8** %p.addr, align 4
  store i8* %file, i8** %file.addr, align 4
  store i32 %line, i32* %line.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %0 = load i8*, i8** %p.addr, align 4
  %1 = load i8*, i8** %file.addr, align 4
  %2 = load i32, i32* %line.addr, align 4
  %3 = load i32, i32* %flags.addr, align 4
  %or = or i32 %3, 2
  call void @internal_free(i8* %0, i8* %1, i32 %2, i32 %or)
  ret void
}

; Function Attrs: noinline nounwind
define i8* @sh_valloc(i32 %size, i8* %file, i32 %line) #0 {
entry:
  %size.addr = alloca i32, align 4
  %file.addr = alloca i8*, align 4
  %line.addr = alloca i32, align 4
  store i32 %size, i32* %size.addr, align 4
  store i8* %file, i8** %file.addr, align 4
  store i32 %line, i32* %line.addr, align 4
  %0 = load i32, i32* %size.addr, align 4
  %1 = load i8*, i8** %file.addr, align 4
  %2 = load i32, i32* %line.addr, align 4
  %call = call i8* @internal_valloc(i32 %0, i8* %1, i32 %2, i32 1)
  ret i8* %call
}

; Function Attrs: noinline nounwind
define internal i8* @internal_valloc(i32 %size, i8* %file, i32 %line, i32 %flags) #0 {
entry:
  %size.addr = alloca i32, align 4
  %file.addr = alloca i8*, align 4
  %line.addr = alloca i32, align 4
  %flags.addr = alloca i32, align 4
  store i32 %size, i32* %size.addr, align 4
  store i8* %file, i8** %file.addr, align 4
  store i32 %line, i32* %line.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %call = call i32 @getpagesize()
  %0 = load i32, i32* %size.addr, align 4
  %1 = load i8*, i8** %file.addr, align 4
  %2 = load i32, i32* %line.addr, align 4
  %3 = load i32, i32* %flags.addr, align 4
  %or = or i32 %3, 2
  %call1 = call i8* @internal_memalign(i32 %call, i32 %0, i8* %1, i32 %2, i32 %or)
  ret i8* %call1
}

; Function Attrs: noinline nounwind
define i8* @malloc(i32 %size) #0 {
entry:
  %size.addr = alloca i32, align 4
  store i32 %size, i32* %size.addr, align 4
  %0 = load i32, i32* %size.addr, align 4
  %call = call i8* @internal_malloc(i32 %0, i8* null, i32 0, i32 0)
  ret i8* %call
}

; Function Attrs: noinline nounwind
define i8* @realloc(i8* %mem, i32 %nbytes) #0 {
entry:
  %mem.addr = alloca i8*, align 4
  %nbytes.addr = alloca i32, align 4
  store i8* %mem, i8** %mem.addr, align 4
  store i32 %nbytes, i32* %nbytes.addr, align 4
  %0 = load i8*, i8** %mem.addr, align 4
  %1 = load i32, i32* %nbytes.addr, align 4
  %call = call i8* @internal_realloc(i8* %0, i32 %1, i8* null, i32 0, i32 0)
  ret i8* %call
}

; Function Attrs: noinline nounwind
define void @free(i8* %mem) #0 {
entry:
  %mem.addr = alloca i8*, align 4
  store i8* %mem, i8** %mem.addr, align 4
  %0 = load i8*, i8** %mem.addr, align 4
  call void @internal_free(i8* %0, i8* null, i32 0, i32 0)
  ret void
}

; Function Attrs: noinline nounwind
define i8* @memalign(i32 %alignment, i32 %size) #0 {
entry:
  %alignment.addr = alloca i32, align 4
  %size.addr = alloca i32, align 4
  store i32 %alignment, i32* %alignment.addr, align 4
  store i32 %size, i32* %size.addr, align 4
  %0 = load i32, i32* %alignment.addr, align 4
  %1 = load i32, i32* %size.addr, align 4
  %call = call i8* @internal_memalign(i32 %0, i32 %1, i8* null, i32 0, i32 0)
  ret i8* %call
}

; Function Attrs: noinline nounwind
define i8* @valloc(i32 %size) #0 {
entry:
  %size.addr = alloca i32, align 4
  store i32 %size, i32* %size.addr, align 4
  %0 = load i32, i32* %size.addr, align 4
  %call = call i8* @internal_valloc(i32 %0, i8* null, i32 0, i32 0)
  ret i8* %call
}

; Function Attrs: noinline nounwind
define i8* @calloc(i32 %n, i32 %s) #0 {
entry:
  %n.addr = alloca i32, align 4
  %s.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  store i32 %s, i32* %s.addr, align 4
  %0 = load i32, i32* %n.addr, align 4
  %1 = load i32, i32* %s.addr, align 4
  %call = call i8* @internal_calloc(i32 %0, i32 %1, i8* null, i32 0, i32 0)
  ret i8* %call
}

; Function Attrs: noinline nounwind
define void @cfree(i8* %mem) #0 {
entry:
  %mem.addr = alloca i8*, align 4
  store i8* %mem, i8** %mem.addr, align 4
  %0 = load i8*, i8** %mem.addr, align 4
  call void @internal_cfree(i8* %0, i8* null, i32 0, i32 0)
  ret void
}

; Function Attrs: noinline nounwind
define internal void @morecore(i32 %nu) #0 {
entry:
  %nu.addr = alloca i32, align 4
  %mp = alloca %union.mhead*, align 4
  %nblks = alloca i32, align 4
  %siz = alloca i32, align 4
  %sbrk_amt = alloca i32, align 4
  %set = alloca %struct.__sigset_t, align 4
  %oset = alloca %struct.__sigset_t, align 4
  %blocked_sigs = alloca i32, align 4
  store i32 %nu, i32* %nu.addr, align 4
  store i32 0, i32* %blocked_sigs, align 4
  %0 = load i32, i32* @interrupt_immediately, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i32, i32* @running_trap, align 4
  %tobool1 = icmp ne i32 %1, 0
  br i1 %tobool1, label %if.then, label %lor.lhs.false2

lor.lhs.false2:                                   ; preds = %lor.lhs.false
  %call = call i32 @signal_is_trapped(i32 2)
  %tobool3 = icmp ne i32 %call, 0
  br i1 %tobool3, label %if.then, label %lor.lhs.false4

lor.lhs.false4:                                   ; preds = %lor.lhs.false2
  %call5 = call i32 @signal_is_trapped(i32 17)
  %tobool6 = icmp ne i32 %call5, 0
  br i1 %tobool6, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false4, %lor.lhs.false2, %lor.lhs.false, %entry
  call void @_malloc_block_signals(%struct.__sigset_t* %set, %struct.__sigset_t* %oset)
  store i32 1, i32* %blocked_sigs, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %lor.lhs.false4
  %2 = load i32, i32* %nu.addr, align 4
  %arrayidx = getelementptr inbounds [30 x i32], [30 x i32]* @binsizes, i32 0, i32 %2
  %3 = load i32, i32* %arrayidx, align 4
  store i32 %3, i32* %siz, align 4
  %4 = load i32, i32* %siz, align 4
  %cmp = icmp slt i32 %4, 0
  br i1 %cmp, label %if.then7, label %if.end8

if.then7:                                         ; preds = %if.end
  br label %morecore_done

if.end8:                                          ; preds = %if.end
  %5 = load i32, i32* %nu.addr, align 4
  %cmp9 = icmp sge i32 %5, 2
  br i1 %cmp9, label %if.then10, label %if.end15

if.then10:                                        ; preds = %if.end8
  %6 = load i32, i32* %nu.addr, align 4
  call void @bsplit(i32 %6)
  %7 = load i32, i32* %nu.addr, align 4
  %arrayidx11 = getelementptr inbounds [30 x %union.mhead*], [30 x %union.mhead*]* @nextf, i32 0, i32 %7
  %8 = load %union.mhead*, %union.mhead** %arrayidx11, align 4
  %cmp12 = icmp ne %union.mhead* %8, null
  br i1 %cmp12, label %if.then13, label %if.end14

if.then13:                                        ; preds = %if.then10
  br label %morecore_done

if.end14:                                         ; preds = %if.then10
  br label %if.end15

if.end15:                                         ; preds = %if.end14, %if.end8
  %9 = load i32, i32* %nu.addr, align 4
  %cmp16 = icmp sge i32 %9, 2
  br i1 %cmp16, label %land.lhs.true, label %if.end33

land.lhs.true:                                    ; preds = %if.end15
  %10 = load i32, i32* %nu.addr, align 4
  %11 = load i32, i32* @pagebucket, align 4
  %sub = sub nsw i32 %11, 1
  %cmp17 = icmp slt i32 %10, %sub
  br i1 %cmp17, label %land.lhs.true18, label %if.end33

land.lhs.true18:                                  ; preds = %land.lhs.true
  %12 = load i32, i32* %nu.addr, align 4
  %sub19 = sub nsw i32 %12, 1
  %arrayidx20 = getelementptr inbounds [30 x i8], [30 x i8]* @busy, i32 0, i32 %sub19
  %13 = load i8, i8* %arrayidx20, align 1
  %conv = sext i8 %13 to i32
  %cmp21 = icmp eq i32 %conv, 0
  br i1 %cmp21, label %land.lhs.true23, label %if.end33

land.lhs.true23:                                  ; preds = %land.lhs.true18
  %14 = load i32, i32* %nu.addr, align 4
  %sub24 = sub nsw i32 %14, 1
  %arrayidx25 = getelementptr inbounds [30 x %union.mhead*], [30 x %union.mhead*]* @nextf, i32 0, i32 %sub24
  %15 = load %union.mhead*, %union.mhead** %arrayidx25, align 4
  %tobool26 = icmp ne %union.mhead* %15, null
  br i1 %tobool26, label %if.then27, label %if.end33

if.then27:                                        ; preds = %land.lhs.true23
  %16 = load i32, i32* %nu.addr, align 4
  call void @bcoalesce(i32 %16)
  %17 = load i32, i32* %nu.addr, align 4
  %arrayidx28 = getelementptr inbounds [30 x %union.mhead*], [30 x %union.mhead*]* @nextf, i32 0, i32 %17
  %18 = load %union.mhead*, %union.mhead** %arrayidx28, align 4
  %cmp29 = icmp ne %union.mhead* %18, null
  br i1 %cmp29, label %if.then31, label %if.end32

if.then31:                                        ; preds = %if.then27
  br label %morecore_done

if.end32:                                         ; preds = %if.then27
  br label %if.end33

if.end33:                                         ; preds = %if.end32, %land.lhs.true23, %land.lhs.true18, %land.lhs.true, %if.end15
  %19 = load i32, i32* %siz, align 4
  %20 = load i32, i32* @pagesz, align 4
  %cmp34 = icmp sle i32 %19, %20
  br i1 %cmp34, label %if.then36, label %if.else

if.then36:                                        ; preds = %if.end33
  %21 = load i32, i32* @pagesz, align 4
  store i32 %21, i32* %sbrk_amt, align 4
  %22 = load i32, i32* %sbrk_amt, align 4
  %23 = load i32, i32* %siz, align 4
  %div = sdiv i32 %22, %23
  store i32 %div, i32* %nblks, align 4
  br label %if.end44

if.else:                                          ; preds = %if.end33
  %24 = load i32, i32* %siz, align 4
  %25 = load i32, i32* @pagesz, align 4
  %sub37 = sub nsw i32 %25, 1
  %and = and i32 %24, %sub37
  store i32 %and, i32* %sbrk_amt, align 4
  %26 = load i32, i32* %sbrk_amt, align 4
  %cmp38 = icmp eq i32 %26, 0
  br i1 %cmp38, label %if.then40, label %if.else41

if.then40:                                        ; preds = %if.else
  %27 = load i32, i32* %siz, align 4
  store i32 %27, i32* %sbrk_amt, align 4
  br label %if.end43

if.else41:                                        ; preds = %if.else
  %28 = load i32, i32* %siz, align 4
  %29 = load i32, i32* @pagesz, align 4
  %add = add nsw i32 %28, %29
  %30 = load i32, i32* %sbrk_amt, align 4
  %sub42 = sub nsw i32 %add, %30
  store i32 %sub42, i32* %sbrk_amt, align 4
  br label %if.end43

if.end43:                                         ; preds = %if.else41, %if.then40
  store i32 1, i32* %nblks, align 4
  br label %if.end44

if.end44:                                         ; preds = %if.end43, %if.then36
  %31 = load i32, i32* %sbrk_amt, align 4
  %call45 = call i8* @sbrk(i32 %31)
  %32 = bitcast i8* %call45 to %union.mhead*
  store %union.mhead* %32, %union.mhead** %mp, align 4
  %33 = load %union.mhead*, %union.mhead** %mp, align 4
  %34 = ptrtoint %union.mhead* %33 to i32
  %cmp46 = icmp eq i32 %34, -1
  br i1 %cmp46, label %if.then48, label %if.end49

if.then48:                                        ; preds = %if.end44
  br label %morecore_done

if.end49:                                         ; preds = %if.end44
  %35 = load i32, i32* %sbrk_amt, align 4
  %36 = load i8*, i8** @memtop, align 4
  %add.ptr = getelementptr inbounds i8, i8* %36, i32 %35
  store i8* %add.ptr, i8** @memtop, align 4
  %37 = load %union.mhead*, %union.mhead** %mp, align 4
  %38 = ptrtoint %union.mhead* %37 to i32
  %and50 = and i32 %38, 7
  %tobool51 = icmp ne i32 %and50, 0
  br i1 %tobool51, label %if.then52, label %if.end55

if.then52:                                        ; preds = %if.end49
  %39 = load %union.mhead*, %union.mhead** %mp, align 4
  %40 = ptrtoint %union.mhead* %39 to i32
  %add53 = add nsw i32 %40, 7
  %and54 = and i32 %add53, -8
  %41 = inttoptr i32 %and54 to %union.mhead*
  store %union.mhead* %41, %union.mhead** %mp, align 4
  %42 = load i32, i32* %nblks, align 4
  %dec = add nsw i32 %42, -1
  store i32 %dec, i32* %nblks, align 4
  br label %if.end55

if.end55:                                         ; preds = %if.then52, %if.end49
  %43 = load %union.mhead*, %union.mhead** %mp, align 4
  %44 = load i32, i32* %nu.addr, align 4
  %arrayidx56 = getelementptr inbounds [30 x %union.mhead*], [30 x %union.mhead*]* @nextf, i32 0, i32 %44
  store %union.mhead* %43, %union.mhead** %arrayidx56, align 4
  br label %while.body

while.body:                                       ; preds = %if.end55, %if.end63
  %45 = load %union.mhead*, %union.mhead** %mp, align 4
  %minfo = bitcast %union.mhead* %45 to %struct.anon*
  %mi_alloc = getelementptr inbounds %struct.anon, %struct.anon* %minfo, i32 0, i32 0
  store i8 84, i8* %mi_alloc, align 8
  %46 = load i32, i32* %nu.addr, align 4
  %conv57 = trunc i32 %46 to i8
  %47 = load %union.mhead*, %union.mhead** %mp, align 4
  %minfo58 = bitcast %union.mhead* %47 to %struct.anon*
  %mi_index = getelementptr inbounds %struct.anon, %struct.anon* %minfo58, i32 0, i32 1
  store i8 %conv57, i8* %mi_index, align 1
  %48 = load i32, i32* %nblks, align 4
  %dec59 = add nsw i32 %48, -1
  store i32 %dec59, i32* %nblks, align 4
  %cmp60 = icmp sle i32 %dec59, 0
  br i1 %cmp60, label %if.then62, label %if.end63

if.then62:                                        ; preds = %while.body
  br label %while.end

if.end63:                                         ; preds = %while.body
  %49 = load %union.mhead*, %union.mhead** %mp, align 4
  %50 = bitcast %union.mhead* %49 to i8*
  %51 = load i32, i32* %siz, align 4
  %add.ptr64 = getelementptr inbounds i8, i8* %50, i32 %51
  %52 = bitcast i8* %add.ptr64 to %union.mhead*
  %53 = load %union.mhead*, %union.mhead** %mp, align 4
  %54 = bitcast %union.mhead* %53 to i8*
  %add.ptr65 = getelementptr inbounds i8, i8* %54, i32 4
  %55 = bitcast i8* %add.ptr65 to %union.mhead**
  store %union.mhead* %52, %union.mhead** %55, align 4
  %56 = load %union.mhead*, %union.mhead** %mp, align 4
  %57 = bitcast %union.mhead* %56 to i8*
  %58 = load i32, i32* %siz, align 4
  %add.ptr66 = getelementptr inbounds i8, i8* %57, i32 %58
  %59 = bitcast i8* %add.ptr66 to %union.mhead*
  store %union.mhead* %59, %union.mhead** %mp, align 4
  br label %while.body

while.end:                                        ; preds = %if.then62
  %60 = load %union.mhead*, %union.mhead** %mp, align 4
  %61 = bitcast %union.mhead* %60 to i8*
  %add.ptr67 = getelementptr inbounds i8, i8* %61, i32 4
  %62 = bitcast i8* %add.ptr67 to %union.mhead**
  store %union.mhead* null, %union.mhead** %62, align 4
  br label %morecore_done

morecore_done:                                    ; preds = %while.end, %if.then48, %if.then31, %if.then13, %if.then7
  %63 = load i32, i32* %blocked_sigs, align 4
  %tobool68 = icmp ne i32 %63, 0
  br i1 %tobool68, label %if.then69, label %if.end70

if.then69:                                        ; preds = %morecore_done
  call void @_malloc_unblock_signals(%struct.__sigset_t* %set, %struct.__sigset_t* %oset)
  br label %if.end70

if.end70:                                         ; preds = %if.then69, %morecore_done
  ret void
}

; Function Attrs: noinline nounwind
define internal void @xbotch(i8* %mem, i32 %e, i8* %s, i8* %file, i32 %line) #0 {
entry:
  %mem.addr = alloca i8*, align 4
  %e.addr = alloca i32, align 4
  %s.addr = alloca i8*, align 4
  %file.addr = alloca i8*, align 4
  %line.addr = alloca i32, align 4
  store i8* %mem, i8** %mem.addr, align 4
  store i32 %e, i32* %e.addr, align 4
  store i8* %s, i8** %s.addr, align 4
  store i8* %file, i8** %file.addr, align 4
  store i32 %line, i32* %line.addr, align 4
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %call = call i8* @libintl_gettext(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.2, i32 0, i32 0))
  %1 = load i8*, i8** %file.addr, align 4
  %tobool = icmp ne i8* %1, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %2 = load i8*, i8** %file.addr, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  %call1 = call i8* @libintl_gettext(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.3, i32 0, i32 0))
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %2, %cond.true ], [ %call1, %cond.false ]
  %3 = load i32, i32* %line.addr, align 4
  %call2 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %0, i8* %call, i8* %cond, i32 %3)
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %call3 = call i32 @fflush(%struct._IO_FILE* %4)
  %5 = load i8*, i8** %s.addr, align 4
  %6 = load i8*, i8** %file.addr, align 4
  %7 = load i32, i32* %line.addr, align 4
  call void bitcast (void (...)* @programming_error to void (i8*, i8*, i32)*)(i8* %5, i8* %6, i32 %7)
  ret void
}

declare i8* @libintl_gettext(i8*) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #2

; Function Attrs: noinline nounwind
define internal i32 @pagealign() #0 {
entry:
  %retval = alloca i32, align 4
  %nunits = alloca i32, align 4
  %mp = alloca %union.mhead*, align 4
  %sbrk_needed = alloca i32, align 4
  %curbrk = alloca i8*, align 4
  %call = call i32 @getpagesize()
  store i32 %call, i32* @pagesz, align 4
  %0 = load i32, i32* @pagesz, align 4
  %cmp = icmp slt i32 %0, 1024
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 1024, i32* @pagesz, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %call1 = call i8* @sbrk(i32 0)
  store i8* %call1, i8** %curbrk, align 4
  store i8* %call1, i8** @memtop, align 4
  %1 = load i32, i32* @pagesz, align 4
  %2 = load i8*, i8** %curbrk, align 4
  %3 = ptrtoint i8* %2 to i32
  %4 = load i32, i32* @pagesz, align 4
  %sub = sub nsw i32 %4, 1
  %and = and i32 %3, %sub
  %sub2 = sub nsw i32 %1, %and
  store i32 %sub2, i32* %sbrk_needed, align 4
  %5 = load i32, i32* %sbrk_needed, align 4
  %cmp3 = icmp slt i32 %5, 0
  br i1 %cmp3, label %if.then4, label %if.end5

if.then4:                                         ; preds = %if.end
  %6 = load i32, i32* @pagesz, align 4
  %7 = load i32, i32* %sbrk_needed, align 4
  %add = add nsw i32 %7, %6
  store i32 %add, i32* %sbrk_needed, align 4
  br label %if.end5

if.end5:                                          ; preds = %if.then4, %if.end
  %8 = load i32, i32* %sbrk_needed, align 4
  %tobool = icmp ne i32 %8, 0
  br i1 %tobool, label %if.then6, label %if.end26

if.then6:                                         ; preds = %if.end5
  %9 = load i32, i32* %sbrk_needed, align 4
  %call7 = call i8* @sbrk(i32 %9)
  store i8* %call7, i8** %curbrk, align 4
  %10 = load i8*, i8** %curbrk, align 4
  %11 = ptrtoint i8* %10 to i32
  %cmp8 = icmp eq i32 %11, -1
  br i1 %cmp8, label %if.then9, label %if.end10

if.then9:                                         ; preds = %if.then6
  store i32 -1, i32* %retval, align 4
  br label %return

if.end10:                                         ; preds = %if.then6
  %12 = load i32, i32* %sbrk_needed, align 4
  %13 = load i8*, i8** @memtop, align 4
  %add.ptr = getelementptr inbounds i8, i8* %13, i32 %12
  store i8* %add.ptr, i8** @memtop, align 4
  %14 = load i32, i32* %sbrk_needed, align 4
  %and11 = and i32 %14, 31
  %15 = load i8*, i8** %curbrk, align 4
  %add.ptr12 = getelementptr inbounds i8, i8* %15, i32 %and11
  store i8* %add.ptr12, i8** %curbrk, align 4
  %16 = load i32, i32* %sbrk_needed, align 4
  %and13 = and i32 %16, 31
  %17 = load i32, i32* %sbrk_needed, align 4
  %sub14 = sub nsw i32 %17, %and13
  store i32 %sub14, i32* %sbrk_needed, align 4
  %18 = load i32, i32* %sbrk_needed, align 4
  %div = sdiv i32 %18, 32
  store i32 %div, i32* %nunits, align 4
  %19 = load i32, i32* %nunits, align 4
  %cmp15 = icmp sgt i32 %19, 0
  br i1 %cmp15, label %if.then16, label %if.end25

if.then16:                                        ; preds = %if.end10
  %20 = load i8*, i8** %curbrk, align 4
  %21 = bitcast i8* %20 to %union.mhead*
  store %union.mhead* %21, %union.mhead** %mp, align 4
  %22 = load %union.mhead*, %union.mhead** %mp, align 4
  store %union.mhead* %22, %union.mhead** getelementptr inbounds ([30 x %union.mhead*], [30 x %union.mhead*]* @nextf, i32 0, i32 2), align 4
  br label %while.body

while.body:                                       ; preds = %if.then16, %if.end20
  %23 = load %union.mhead*, %union.mhead** %mp, align 4
  %minfo = bitcast %union.mhead* %23 to %struct.anon*
  %mi_alloc = getelementptr inbounds %struct.anon, %struct.anon* %minfo, i32 0, i32 0
  store i8 84, i8* %mi_alloc, align 8
  %24 = load %union.mhead*, %union.mhead** %mp, align 4
  %minfo17 = bitcast %union.mhead* %24 to %struct.anon*
  %mi_index = getelementptr inbounds %struct.anon, %struct.anon* %minfo17, i32 0, i32 1
  store i8 2, i8* %mi_index, align 1
  %25 = load i32, i32* %nunits, align 4
  %dec = add nsw i32 %25, -1
  store i32 %dec, i32* %nunits, align 4
  %cmp18 = icmp sle i32 %dec, 0
  br i1 %cmp18, label %if.then19, label %if.end20

if.then19:                                        ; preds = %while.body
  br label %while.end

if.end20:                                         ; preds = %while.body
  %26 = load %union.mhead*, %union.mhead** %mp, align 4
  %27 = bitcast %union.mhead* %26 to i8*
  %add.ptr21 = getelementptr inbounds i8, i8* %27, i32 32
  %28 = bitcast i8* %add.ptr21 to %union.mhead*
  %29 = load %union.mhead*, %union.mhead** %mp, align 4
  %30 = bitcast %union.mhead* %29 to i8*
  %add.ptr22 = getelementptr inbounds i8, i8* %30, i32 4
  %31 = bitcast i8* %add.ptr22 to %union.mhead**
  store %union.mhead* %28, %union.mhead** %31, align 4
  %32 = load %union.mhead*, %union.mhead** %mp, align 4
  %33 = bitcast %union.mhead* %32 to i8*
  %add.ptr23 = getelementptr inbounds i8, i8* %33, i32 32
  %34 = bitcast i8* %add.ptr23 to %union.mhead*
  store %union.mhead* %34, %union.mhead** %mp, align 4
  br label %while.body

while.end:                                        ; preds = %if.then19
  %35 = load %union.mhead*, %union.mhead** %mp, align 4
  %36 = bitcast %union.mhead* %35 to i8*
  %add.ptr24 = getelementptr inbounds i8, i8* %36, i32 4
  %37 = bitcast i8* %add.ptr24 to %union.mhead**
  store %union.mhead* null, %union.mhead** %37, align 4
  br label %if.end25

if.end25:                                         ; preds = %while.end, %if.end10
  br label %if.end26

if.end26:                                         ; preds = %if.end25, %if.end5
  store i32 7, i32* %nunits, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end26
  %38 = load i32, i32* %nunits, align 4
  %cmp27 = icmp slt i32 %38, 30
  br i1 %cmp27, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %39 = load i32, i32* @pagesz, align 4
  %40 = load i32, i32* %nunits, align 4
  %arrayidx = getelementptr inbounds [30 x i32], [30 x i32]* @binsizes, i32 0, i32 %40
  %41 = load i32, i32* %arrayidx, align 4
  %cmp28 = icmp ule i32 %39, %41
  br i1 %cmp28, label %if.then29, label %if.end30

if.then29:                                        ; preds = %for.body
  br label %for.end

if.end30:                                         ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end30
  %42 = load i32, i32* %nunits, align 4
  %inc = add nsw i32 %42, 1
  store i32 %inc, i32* %nunits, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then29, %for.cond
  %43 = load i32, i32* %nunits, align 4
  store i32 %43, i32* @pagebucket, align 4
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then9
  %44 = load i32, i32* %retval, align 4
  ret i32 %44
}

declare i32 @getpagesize() #1

declare i8* @sbrk(i32) #1

declare i32 @signal_is_trapped(i32) #1

; Function Attrs: noinline nounwind
define internal void @bsplit(i32 %nu) #0 {
entry:
  %nu.addr = alloca i32, align 4
  %mp = alloca %union.mhead*, align 4
  %nbuck = alloca i32, align 4
  %nblks = alloca i32, align 4
  %split_max = alloca i32, align 4
  %siz = alloca i32, align 4
  store i32 %nu, i32* %nu.addr, align 4
  %0 = load i32, i32* @maxbuck, align 4
  %cmp = icmp sgt i32 %0, 14
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %1 = load i32, i32* @maxbuck, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %1, %cond.true ], [ 14, %cond.false ]
  store i32 %cond, i32* %split_max, align 4
  %2 = load i32, i32* %nu.addr, align 4
  %cmp1 = icmp sge i32 %2, 11
  br i1 %cmp1, label %if.then, label %if.else

if.then:                                          ; preds = %cond.end
  %3 = load i32, i32* %split_max, align 4
  store i32 %3, i32* %nbuck, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then
  %4 = load i32, i32* %nbuck, align 4
  %5 = load i32, i32* %nu.addr, align 4
  %cmp2 = icmp sgt i32 %4, %5
  br i1 %cmp2, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %nbuck, align 4
  %arrayidx = getelementptr inbounds [30 x i8], [30 x i8]* @busy, i32 0, i32 %6
  %7 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %7 to i32
  %tobool = icmp ne i32 %conv, 0
  br i1 %tobool, label %if.then6, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %for.body
  %8 = load i32, i32* %nbuck, align 4
  %arrayidx3 = getelementptr inbounds [30 x %union.mhead*], [30 x %union.mhead*]* @nextf, i32 0, i32 %8
  %9 = load %union.mhead*, %union.mhead** %arrayidx3, align 4
  %cmp4 = icmp eq %union.mhead* %9, null
  br i1 %cmp4, label %if.then6, label %if.end

if.then6:                                         ; preds = %lor.lhs.false, %for.body
  br label %for.inc

if.end:                                           ; preds = %lor.lhs.false
  br label %for.end

for.inc:                                          ; preds = %if.then6
  %10 = load i32, i32* %nbuck, align 4
  %dec = add nsw i32 %10, -1
  store i32 %dec, i32* %nbuck, align 4
  br label %for.cond

for.end:                                          ; preds = %if.end, %for.cond
  br label %if.end22

if.else:                                          ; preds = %cond.end
  %11 = load i32, i32* %nu.addr, align 4
  %add = add nsw i32 %11, 1
  store i32 %add, i32* %nbuck, align 4
  br label %for.cond7

for.cond7:                                        ; preds = %for.inc20, %if.else
  %12 = load i32, i32* %nbuck, align 4
  %13 = load i32, i32* %split_max, align 4
  %cmp8 = icmp sle i32 %12, %13
  br i1 %cmp8, label %for.body10, label %for.end21

for.body10:                                       ; preds = %for.cond7
  %14 = load i32, i32* %nbuck, align 4
  %arrayidx11 = getelementptr inbounds [30 x i8], [30 x i8]* @busy, i32 0, i32 %14
  %15 = load i8, i8* %arrayidx11, align 1
  %conv12 = sext i8 %15 to i32
  %tobool13 = icmp ne i32 %conv12, 0
  br i1 %tobool13, label %if.then18, label %lor.lhs.false14

lor.lhs.false14:                                  ; preds = %for.body10
  %16 = load i32, i32* %nbuck, align 4
  %arrayidx15 = getelementptr inbounds [30 x %union.mhead*], [30 x %union.mhead*]* @nextf, i32 0, i32 %16
  %17 = load %union.mhead*, %union.mhead** %arrayidx15, align 4
  %cmp16 = icmp eq %union.mhead* %17, null
  br i1 %cmp16, label %if.then18, label %if.end19

if.then18:                                        ; preds = %lor.lhs.false14, %for.body10
  br label %for.inc20

if.end19:                                         ; preds = %lor.lhs.false14
  br label %for.end21

for.inc20:                                        ; preds = %if.then18
  %18 = load i32, i32* %nbuck, align 4
  %inc = add nsw i32 %18, 1
  store i32 %inc, i32* %nbuck, align 4
  br label %for.cond7

for.end21:                                        ; preds = %if.end19, %for.cond7
  br label %if.end22

if.end22:                                         ; preds = %for.end21, %for.end
  %19 = load i32, i32* %nbuck, align 4
  %20 = load i32, i32* %split_max, align 4
  %cmp23 = icmp sgt i32 %19, %20
  br i1 %cmp23, label %if.then28, label %lor.lhs.false25

lor.lhs.false25:                                  ; preds = %if.end22
  %21 = load i32, i32* %nbuck, align 4
  %22 = load i32, i32* %nu.addr, align 4
  %cmp26 = icmp sle i32 %21, %22
  br i1 %cmp26, label %if.then28, label %if.end29

if.then28:                                        ; preds = %lor.lhs.false25, %if.end22
  br label %return

if.end29:                                         ; preds = %lor.lhs.false25
  %23 = load i32, i32* %nbuck, align 4
  %arrayidx30 = getelementptr inbounds [30 x i8], [30 x i8]* @busy, i32 0, i32 %23
  store i8 1, i8* %arrayidx30, align 1
  %24 = load i32, i32* %nbuck, align 4
  %arrayidx31 = getelementptr inbounds [30 x %union.mhead*], [30 x %union.mhead*]* @nextf, i32 0, i32 %24
  %25 = load %union.mhead*, %union.mhead** %arrayidx31, align 4
  store %union.mhead* %25, %union.mhead** %mp, align 4
  %26 = load %union.mhead*, %union.mhead** %mp, align 4
  %27 = bitcast %union.mhead* %26 to i8*
  %add.ptr = getelementptr inbounds i8, i8* %27, i32 4
  %28 = bitcast i8* %add.ptr to %union.mhead**
  %29 = load %union.mhead*, %union.mhead** %28, align 4
  %30 = load i32, i32* %nbuck, align 4
  %arrayidx32 = getelementptr inbounds [30 x %union.mhead*], [30 x %union.mhead*]* @nextf, i32 0, i32 %30
  store %union.mhead* %29, %union.mhead** %arrayidx32, align 4
  %31 = load i32, i32* %nbuck, align 4
  %arrayidx33 = getelementptr inbounds [30 x i8], [30 x i8]* @busy, i32 0, i32 %31
  store i8 0, i8* %arrayidx33, align 1
  %32 = load i32, i32* %nu.addr, align 4
  %arrayidx34 = getelementptr inbounds [30 x i32], [30 x i32]* @binsizes, i32 0, i32 %32
  %33 = load i32, i32* %arrayidx34, align 4
  store i32 %33, i32* %siz, align 4
  %34 = load i32, i32* %nbuck, align 4
  %arrayidx35 = getelementptr inbounds [30 x i32], [30 x i32]* @binsizes, i32 0, i32 %34
  %35 = load i32, i32* %arrayidx35, align 4
  %36 = load i32, i32* %siz, align 4
  %div = udiv i32 %35, %36
  store i32 %div, i32* %nblks, align 4
  %37 = load %union.mhead*, %union.mhead** %mp, align 4
  %38 = load i32, i32* %nu.addr, align 4
  %arrayidx36 = getelementptr inbounds [30 x %union.mhead*], [30 x %union.mhead*]* @nextf, i32 0, i32 %38
  store %union.mhead* %37, %union.mhead** %arrayidx36, align 4
  br label %while.body

while.body:                                       ; preds = %if.end29, %if.end43
  %39 = load %union.mhead*, %union.mhead** %mp, align 4
  %minfo = bitcast %union.mhead* %39 to %struct.anon*
  %mi_alloc = getelementptr inbounds %struct.anon, %struct.anon* %minfo, i32 0, i32 0
  store i8 84, i8* %mi_alloc, align 8
  %40 = load i32, i32* %nu.addr, align 4
  %conv37 = trunc i32 %40 to i8
  %41 = load %union.mhead*, %union.mhead** %mp, align 4
  %minfo38 = bitcast %union.mhead* %41 to %struct.anon*
  %mi_index = getelementptr inbounds %struct.anon, %struct.anon* %minfo38, i32 0, i32 1
  store i8 %conv37, i8* %mi_index, align 1
  %42 = load i32, i32* %nblks, align 4
  %dec39 = add nsw i32 %42, -1
  store i32 %dec39, i32* %nblks, align 4
  %cmp40 = icmp sle i32 %dec39, 0
  br i1 %cmp40, label %if.then42, label %if.end43

if.then42:                                        ; preds = %while.body
  br label %while.end

if.end43:                                         ; preds = %while.body
  %43 = load %union.mhead*, %union.mhead** %mp, align 4
  %44 = bitcast %union.mhead* %43 to i8*
  %45 = load i32, i32* %siz, align 4
  %add.ptr44 = getelementptr inbounds i8, i8* %44, i32 %45
  %46 = bitcast i8* %add.ptr44 to %union.mhead*
  %47 = load %union.mhead*, %union.mhead** %mp, align 4
  %48 = bitcast %union.mhead* %47 to i8*
  %add.ptr45 = getelementptr inbounds i8, i8* %48, i32 4
  %49 = bitcast i8* %add.ptr45 to %union.mhead**
  store %union.mhead* %46, %union.mhead** %49, align 4
  %50 = load %union.mhead*, %union.mhead** %mp, align 4
  %51 = bitcast %union.mhead* %50 to i8*
  %52 = load i32, i32* %siz, align 4
  %add.ptr46 = getelementptr inbounds i8, i8* %51, i32 %52
  %53 = bitcast i8* %add.ptr46 to %union.mhead*
  store %union.mhead* %53, %union.mhead** %mp, align 4
  br label %while.body

while.end:                                        ; preds = %if.then42
  %54 = load %union.mhead*, %union.mhead** %mp, align 4
  %55 = bitcast %union.mhead* %54 to i8*
  %add.ptr47 = getelementptr inbounds i8, i8* %55, i32 4
  %56 = bitcast i8* %add.ptr47 to %union.mhead**
  store %union.mhead* null, %union.mhead** %56, align 4
  br label %return

return:                                           ; preds = %while.end, %if.then28
  ret void
}

; Function Attrs: noinline nounwind
define internal void @bcoalesce(i32 %nu) #0 {
entry:
  %nu.addr = alloca i32, align 4
  %mp = alloca %union.mhead*, align 4
  %mp1 = alloca %union.mhead*, align 4
  %mp2 = alloca %union.mhead*, align 4
  %nbuck = alloca i32, align 4
  %siz = alloca i32, align 4
  store i32 %nu, i32* %nu.addr, align 4
  %0 = load i32, i32* %nu.addr, align 4
  %sub = sub nsw i32 %0, 1
  store i32 %sub, i32* %nbuck, align 4
  %1 = load i32, i32* %nbuck, align 4
  %arrayidx = getelementptr inbounds [30 x %union.mhead*], [30 x %union.mhead*]* @nextf, i32 0, i32 %1
  %2 = load %union.mhead*, %union.mhead** %arrayidx, align 4
  %cmp = icmp eq %union.mhead* %2, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %3 = load i32, i32* %nbuck, align 4
  %arrayidx1 = getelementptr inbounds [30 x i8], [30 x i8]* @busy, i32 0, i32 %3
  %4 = load i8, i8* %arrayidx1, align 1
  %conv = sext i8 %4 to i32
  %tobool = icmp ne i32 %conv, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %5 = load i32, i32* %nbuck, align 4
  %arrayidx2 = getelementptr inbounds [30 x i8], [30 x i8]* @busy, i32 0, i32 %5
  store i8 1, i8* %arrayidx2, align 1
  %6 = load i32, i32* %nbuck, align 4
  %arrayidx3 = getelementptr inbounds [30 x i32], [30 x i32]* @binsizes, i32 0, i32 %6
  %7 = load i32, i32* %arrayidx3, align 4
  store i32 %7, i32* %siz, align 4
  %8 = load i32, i32* %nbuck, align 4
  %arrayidx4 = getelementptr inbounds [30 x %union.mhead*], [30 x %union.mhead*]* @nextf, i32 0, i32 %8
  %9 = load %union.mhead*, %union.mhead** %arrayidx4, align 4
  store %union.mhead* %9, %union.mhead** %mp1, align 4
  store %union.mhead* %9, %union.mhead** %mp2, align 4
  %10 = load %union.mhead*, %union.mhead** %mp1, align 4
  %11 = bitcast %union.mhead* %10 to i8*
  %add.ptr = getelementptr inbounds i8, i8* %11, i32 4
  %12 = bitcast i8* %add.ptr to %union.mhead**
  %13 = load %union.mhead*, %union.mhead** %12, align 4
  store %union.mhead* %13, %union.mhead** %mp, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.end
  %14 = load %union.mhead*, %union.mhead** %mp, align 4
  %tobool5 = icmp ne %union.mhead* %14, null
  br i1 %tobool5, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond
  %15 = load %union.mhead*, %union.mhead** %mp, align 4
  %16 = load %union.mhead*, %union.mhead** %mp1, align 4
  %17 = bitcast %union.mhead* %16 to i8*
  %18 = load i32, i32* %siz, align 4
  %add.ptr6 = getelementptr inbounds i8, i8* %17, i32 %18
  %19 = bitcast i8* %add.ptr6 to %union.mhead*
  %cmp7 = icmp ne %union.mhead* %15, %19
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %20 = phi i1 [ false, %while.cond ], [ %cmp7, %land.rhs ]
  br i1 %20, label %while.body, label %while.end

while.body:                                       ; preds = %land.end
  %21 = load %union.mhead*, %union.mhead** %mp1, align 4
  store %union.mhead* %21, %union.mhead** %mp2, align 4
  %22 = load %union.mhead*, %union.mhead** %mp, align 4
  store %union.mhead* %22, %union.mhead** %mp1, align 4
  %23 = load %union.mhead*, %union.mhead** %mp, align 4
  %24 = bitcast %union.mhead* %23 to i8*
  %add.ptr9 = getelementptr inbounds i8, i8* %24, i32 4
  %25 = bitcast i8* %add.ptr9 to %union.mhead**
  %26 = load %union.mhead*, %union.mhead** %25, align 4
  store %union.mhead* %26, %union.mhead** %mp, align 4
  br label %while.cond

while.end:                                        ; preds = %land.end
  %27 = load %union.mhead*, %union.mhead** %mp, align 4
  %cmp10 = icmp eq %union.mhead* %27, null
  br i1 %cmp10, label %if.then12, label %if.end14

if.then12:                                        ; preds = %while.end
  %28 = load i32, i32* %nbuck, align 4
  %arrayidx13 = getelementptr inbounds [30 x i8], [30 x i8]* @busy, i32 0, i32 %28
  store i8 0, i8* %arrayidx13, align 1
  br label %return

if.end14:                                         ; preds = %while.end
  %29 = load %union.mhead*, %union.mhead** %mp2, align 4
  %30 = load %union.mhead*, %union.mhead** %mp1, align 4
  %cmp15 = icmp ne %union.mhead* %29, %30
  br i1 %cmp15, label %land.lhs.true, label %if.end22

land.lhs.true:                                    ; preds = %if.end14
  %31 = load %union.mhead*, %union.mhead** %mp2, align 4
  %32 = bitcast %union.mhead* %31 to i8*
  %add.ptr17 = getelementptr inbounds i8, i8* %32, i32 4
  %33 = bitcast i8* %add.ptr17 to %union.mhead**
  %34 = load %union.mhead*, %union.mhead** %33, align 4
  %35 = load %union.mhead*, %union.mhead** %mp1, align 4
  %cmp18 = icmp ne %union.mhead* %34, %35
  br i1 %cmp18, label %if.then20, label %if.end22

if.then20:                                        ; preds = %land.lhs.true
  %36 = load i32, i32* %nbuck, align 4
  %arrayidx21 = getelementptr inbounds [30 x i8], [30 x i8]* @busy, i32 0, i32 %36
  store i8 0, i8* %arrayidx21, align 1
  call void @xbotch(i8* null, i32 0, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.1, i32 0, i32 0), i8* null, i32 0)
  br label %if.end22

if.end22:                                         ; preds = %if.then20, %land.lhs.true, %if.end14
  %37 = load %union.mhead*, %union.mhead** %mp1, align 4
  %38 = load i32, i32* %nbuck, align 4
  %arrayidx23 = getelementptr inbounds [30 x %union.mhead*], [30 x %union.mhead*]* @nextf, i32 0, i32 %38
  %39 = load %union.mhead*, %union.mhead** %arrayidx23, align 4
  %cmp24 = icmp eq %union.mhead* %37, %39
  br i1 %cmp24, label %if.then26, label %if.else

if.then26:                                        ; preds = %if.end22
  %40 = load %union.mhead*, %union.mhead** %mp, align 4
  %41 = bitcast %union.mhead* %40 to i8*
  %add.ptr27 = getelementptr inbounds i8, i8* %41, i32 4
  %42 = bitcast i8* %add.ptr27 to %union.mhead**
  %43 = load %union.mhead*, %union.mhead** %42, align 4
  %44 = load i32, i32* %nbuck, align 4
  %arrayidx28 = getelementptr inbounds [30 x %union.mhead*], [30 x %union.mhead*]* @nextf, i32 0, i32 %44
  store %union.mhead* %43, %union.mhead** %arrayidx28, align 4
  br label %if.end31

if.else:                                          ; preds = %if.end22
  %45 = load %union.mhead*, %union.mhead** %mp, align 4
  %46 = bitcast %union.mhead* %45 to i8*
  %add.ptr29 = getelementptr inbounds i8, i8* %46, i32 4
  %47 = bitcast i8* %add.ptr29 to %union.mhead**
  %48 = load %union.mhead*, %union.mhead** %47, align 4
  %49 = load %union.mhead*, %union.mhead** %mp2, align 4
  %50 = bitcast %union.mhead* %49 to i8*
  %add.ptr30 = getelementptr inbounds i8, i8* %50, i32 4
  %51 = bitcast i8* %add.ptr30 to %union.mhead**
  store %union.mhead* %48, %union.mhead** %51, align 4
  br label %if.end31

if.end31:                                         ; preds = %if.else, %if.then26
  %52 = load i32, i32* %nbuck, align 4
  %arrayidx32 = getelementptr inbounds [30 x i8], [30 x i8]* @busy, i32 0, i32 %52
  store i8 0, i8* %arrayidx32, align 1
  %53 = load %union.mhead*, %union.mhead** %mp1, align 4
  %minfo = bitcast %union.mhead* %53 to %struct.anon*
  %mi_alloc = getelementptr inbounds %struct.anon, %struct.anon* %minfo, i32 0, i32 0
  store i8 84, i8* %mi_alloc, align 8
  %54 = load i32, i32* %nu.addr, align 4
  %conv33 = trunc i32 %54 to i8
  %55 = load %union.mhead*, %union.mhead** %mp1, align 4
  %minfo34 = bitcast %union.mhead* %55 to %struct.anon*
  %mi_index = getelementptr inbounds %struct.anon, %struct.anon* %minfo34, i32 0, i32 1
  store i8 %conv33, i8* %mi_index, align 1
  %56 = load i32, i32* %nu.addr, align 4
  %arrayidx35 = getelementptr inbounds [30 x %union.mhead*], [30 x %union.mhead*]* @nextf, i32 0, i32 %56
  %57 = load %union.mhead*, %union.mhead** %arrayidx35, align 4
  %58 = load %union.mhead*, %union.mhead** %mp1, align 4
  %59 = bitcast %union.mhead* %58 to i8*
  %add.ptr36 = getelementptr inbounds i8, i8* %59, i32 4
  %60 = bitcast i8* %add.ptr36 to %union.mhead**
  store %union.mhead* %57, %union.mhead** %60, align 4
  %61 = load %union.mhead*, %union.mhead** %mp1, align 4
  %62 = load i32, i32* %nu.addr, align 4
  %arrayidx37 = getelementptr inbounds [30 x %union.mhead*], [30 x %union.mhead*]* @nextf, i32 0, i32 %62
  store %union.mhead* %61, %union.mhead** %arrayidx37, align 4
  br label %return

return:                                           ; preds = %if.end31, %if.then12, %if.then
  ret void
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

declare i32 @fflush(%struct._IO_FILE*) #1

declare void @programming_error(...) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* nocapture writeonly, i8* nocapture readonly, i32, i32, i1) #2

; Function Attrs: noinline nounwind
define internal void @lesscore(i32 %nu) #0 {
entry:
  %nu.addr = alloca i32, align 4
  %siz = alloca i32, align 4
  store i32 %nu, i32* %nu.addr, align 4
  %0 = load i32, i32* %nu.addr, align 4
  %arrayidx = getelementptr inbounds [30 x i32], [30 x i32]* @binsizes, i32 0, i32 %0
  %1 = load i32, i32* %arrayidx, align 4
  store i32 %1, i32* %siz, align 4
  %2 = load i32, i32* %siz, align 4
  %sub = sub nsw i32 0, %2
  %call = call i8* @sbrk(i32 %sub)
  %3 = load i32, i32* %siz, align 4
  %4 = load i8*, i8** @memtop, align 4
  %idx.neg = sub i32 0, %3
  %add.ptr = getelementptr inbounds i8, i8* %4, i32 %idx.neg
  store i8* %add.ptr, i8** @memtop, align 4
  ret void
}

; Function Attrs: noinline nounwind
define internal void @xsplit(%union.mhead* %mp, i32 %nu) #0 {
entry:
  %mp.addr = alloca %union.mhead*, align 4
  %nu.addr = alloca i32, align 4
  %nh = alloca %union.mhead*, align 4
  %nbuck = alloca i32, align 4
  %nblks = alloca i32, align 4
  %split_max = alloca i32, align 4
  %siz = alloca i32, align 4
  store %union.mhead* %mp, %union.mhead** %mp.addr, align 4
  store i32 %nu, i32* %nu.addr, align 4
  %0 = load i32, i32* %nu.addr, align 4
  %sub = sub nsw i32 %0, 1
  store i32 %sub, i32* %nbuck, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %1 = load i32, i32* %nbuck, align 4
  %cmp = icmp sge i32 %1, 2
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond
  %2 = load i32, i32* %nbuck, align 4
  %arrayidx = getelementptr inbounds [30 x i8], [30 x i8]* @busy, i32 0, i32 %2
  %3 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %3 to i32
  %tobool = icmp ne i32 %conv, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %4 = phi i1 [ false, %while.cond ], [ %tobool, %land.rhs ]
  br i1 %4, label %while.body, label %while.end

while.body:                                       ; preds = %land.end
  %5 = load i32, i32* %nbuck, align 4
  %dec = add nsw i32 %5, -1
  store i32 %dec, i32* %nbuck, align 4
  br label %while.cond

while.end:                                        ; preds = %land.end
  %6 = load i32, i32* %nbuck, align 4
  %cmp1 = icmp slt i32 %6, 2
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %while.end
  br label %return

if.end:                                           ; preds = %while.end
  %7 = load i32, i32* %nu.addr, align 4
  %arrayidx3 = getelementptr inbounds [30 x i32], [30 x i32]* @binsizes, i32 0, i32 %7
  %8 = load i32, i32* %arrayidx3, align 4
  store i32 %8, i32* %siz, align 4
  %9 = load i32, i32* %siz, align 4
  %10 = load i32, i32* %nbuck, align 4
  %arrayidx4 = getelementptr inbounds [30 x i32], [30 x i32]* @binsizes, i32 0, i32 %10
  %11 = load i32, i32* %arrayidx4, align 4
  %div = udiv i32 %9, %11
  store i32 %div, i32* %nblks, align 4
  %12 = load i32, i32* %nbuck, align 4
  %arrayidx5 = getelementptr inbounds [30 x i32], [30 x i32]* @binsizes, i32 0, i32 %12
  %13 = load i32, i32* %arrayidx5, align 4
  store i32 %13, i32* %siz, align 4
  %14 = load %union.mhead*, %union.mhead** %mp.addr, align 4
  store %union.mhead* %14, %union.mhead** %nh, align 4
  br label %while.body7

while.body7:                                      ; preds = %if.end, %if.end14
  %15 = load %union.mhead*, %union.mhead** %mp.addr, align 4
  %minfo = bitcast %union.mhead* %15 to %struct.anon*
  %mi_alloc = getelementptr inbounds %struct.anon, %struct.anon* %minfo, i32 0, i32 0
  store i8 84, i8* %mi_alloc, align 8
  %16 = load i32, i32* %nbuck, align 4
  %conv8 = trunc i32 %16 to i8
  %17 = load %union.mhead*, %union.mhead** %mp.addr, align 4
  %minfo9 = bitcast %union.mhead* %17 to %struct.anon*
  %mi_index = getelementptr inbounds %struct.anon, %struct.anon* %minfo9, i32 0, i32 1
  store i8 %conv8, i8* %mi_index, align 1
  %18 = load i32, i32* %nblks, align 4
  %dec10 = add nsw i32 %18, -1
  store i32 %dec10, i32* %nblks, align 4
  %cmp11 = icmp sle i32 %dec10, 0
  br i1 %cmp11, label %if.then13, label %if.end14

if.then13:                                        ; preds = %while.body7
  br label %while.end17

if.end14:                                         ; preds = %while.body7
  %19 = load %union.mhead*, %union.mhead** %mp.addr, align 4
  %20 = bitcast %union.mhead* %19 to i8*
  %21 = load i32, i32* %siz, align 4
  %add.ptr = getelementptr inbounds i8, i8* %20, i32 %21
  %22 = bitcast i8* %add.ptr to %union.mhead*
  %23 = load %union.mhead*, %union.mhead** %mp.addr, align 4
  %24 = bitcast %union.mhead* %23 to i8*
  %add.ptr15 = getelementptr inbounds i8, i8* %24, i32 4
  %25 = bitcast i8* %add.ptr15 to %union.mhead**
  store %union.mhead* %22, %union.mhead** %25, align 4
  %26 = load %union.mhead*, %union.mhead** %mp.addr, align 4
  %27 = bitcast %union.mhead* %26 to i8*
  %28 = load i32, i32* %siz, align 4
  %add.ptr16 = getelementptr inbounds i8, i8* %27, i32 %28
  %29 = bitcast i8* %add.ptr16 to %union.mhead*
  store %union.mhead* %29, %union.mhead** %mp.addr, align 4
  br label %while.body7

while.end17:                                      ; preds = %if.then13
  %30 = load i32, i32* %nbuck, align 4
  %arrayidx18 = getelementptr inbounds [30 x i8], [30 x i8]* @busy, i32 0, i32 %30
  store i8 1, i8* %arrayidx18, align 1
  %31 = load i32, i32* %nbuck, align 4
  %arrayidx19 = getelementptr inbounds [30 x %union.mhead*], [30 x %union.mhead*]* @nextf, i32 0, i32 %31
  %32 = load %union.mhead*, %union.mhead** %arrayidx19, align 4
  %33 = load %union.mhead*, %union.mhead** %mp.addr, align 4
  %34 = bitcast %union.mhead* %33 to i8*
  %add.ptr20 = getelementptr inbounds i8, i8* %34, i32 4
  %35 = bitcast i8* %add.ptr20 to %union.mhead**
  store %union.mhead* %32, %union.mhead** %35, align 4
  %36 = load %union.mhead*, %union.mhead** %nh, align 4
  %37 = load i32, i32* %nbuck, align 4
  %arrayidx21 = getelementptr inbounds [30 x %union.mhead*], [30 x %union.mhead*]* @nextf, i32 0, i32 %37
  store %union.mhead* %36, %union.mhead** %arrayidx21, align 4
  %38 = load i32, i32* %nbuck, align 4
  %arrayidx22 = getelementptr inbounds [30 x i8], [30 x i8]* @busy, i32 0, i32 %38
  store i8 0, i8* %arrayidx22, align 1
  br label %return

return:                                           ; preds = %while.end17, %if.then
  ret void
}

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
