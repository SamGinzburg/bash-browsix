; ModuleID = 'unwind_prot.c'
source_filename = "unwind_prot.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.objcache = type { i8*, i32, i32 }
%union.uwp = type { %struct.anon.0 }
%struct.anon.0 = type { %struct.uwp_head, %struct.SAVED_VAR }
%struct.uwp_head = type { %union.uwp*, i32 (...)* }
%struct.SAVED_VAR = type { i8*, i32, [1 x i8] }
%struct.anon = type { %struct.uwp_head, i8* }

@uwcache = global %struct.objcache zeroinitializer, align 4
@.str = private unnamed_addr constant [14 x i8] c"unwind_prot.c\00", align 1
@unwind_protect_list = internal global %union.uwp* null, align 4
@.str.1 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@interrupt_immediately = external global i32, align 4
@.str.2 = private unnamed_addr constant [42 x i8] c"unwind_frame_discard: %s: frame not found\00", align 1
@.str.3 = private unnamed_addr constant [38 x i8] c"unwind_frame_run: %s: frame not found\00", align 1

; Function Attrs: noinline nounwind
define void @uwp_init() #0 {
entry:
  br label %do.body

do.body:                                          ; preds = %entry
  %call = call i8* @sh_xmalloc(i32 512, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 107)
  store i8* %call, i8** getelementptr inbounds (%struct.objcache, %struct.objcache* @uwcache, i32 0, i32 0), align 4
  store i32 128, i32* getelementptr inbounds (%struct.objcache, %struct.objcache* @uwcache, i32 0, i32 1), align 4
  store i32 0, i32* getelementptr inbounds (%struct.objcache, %struct.objcache* @uwcache, i32 0, i32 2), align 4
  br label %do.end

do.end:                                           ; preds = %do.body
  ret void
}

declare i8* @sh_xmalloc(i32, i8*, i32) #1

; Function Attrs: noinline nounwind
define void @begin_unwind_frame(i8* %tag) #0 {
entry:
  %tag.addr = alloca i8*, align 4
  store i8* %tag, i8** %tag.addr, align 4
  %0 = load i8*, i8** %tag.addr, align 4
  call void @add_unwind_protect(i32 (...)* null, i8* %0)
  ret void
}

; Function Attrs: noinline nounwind
define void @discard_unwind_frame(i8* %tag) #0 {
entry:
  %tag.addr = alloca i8*, align 4
  store i8* %tag, i8** %tag.addr, align 4
  %0 = load %union.uwp*, %union.uwp** @unwind_protect_list, align 4
  %tobool = icmp ne %union.uwp* %0, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %tag.addr, align 4
  call void @without_interrupts(void (...)* bitcast (void (i8*, i8*)* @unwind_frame_discard_internal to void (...)*), i8* %1, i8* null)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

; Function Attrs: noinline nounwind
define internal void @without_interrupts(void (...)* %function, i8* %arg1, i8* %arg2) #0 {
entry:
  %function.addr = alloca void (...)*, align 4
  %arg1.addr = alloca i8*, align 4
  %arg2.addr = alloca i8*, align 4
  %old_interrupt_immediately = alloca i32, align 4
  store void (...)* %function, void (...)** %function.addr, align 4
  store i8* %arg1, i8** %arg1.addr, align 4
  store i8* %arg2, i8** %arg2.addr, align 4
  %0 = load i32, i32* @interrupt_immediately, align 4
  store i32 %0, i32* %old_interrupt_immediately, align 4
  store i32 0, i32* @interrupt_immediately, align 4
  %1 = load void (...)*, void (...)** %function.addr, align 4
  %2 = load i8*, i8** %arg1.addr, align 4
  %3 = load i8*, i8** %arg2.addr, align 4
  %callee.knr.cast = bitcast void (...)* %1 to void (i8*, i8*)*
  call void %callee.knr.cast(i8* %2, i8* %3)
  %4 = load i32, i32* %old_interrupt_immediately, align 4
  store i32 %4, i32* @interrupt_immediately, align 4
  ret void
}

; Function Attrs: noinline nounwind
define internal void @unwind_frame_discard_internal(i8* %tag, i8* %ignore) #0 {
entry:
  %tag.addr = alloca i8*, align 4
  %ignore.addr = alloca i8*, align 4
  %elt = alloca %union.uwp*, align 4
  %found = alloca i32, align 4
  %mzp = alloca i8*, align 4
  %mctmp = alloca i32, align 4
  %mcn = alloca i32, align 4
  %mzp46 = alloca i8*, align 4
  %mctmp47 = alloca i32, align 4
  %mcn48 = alloca i32, align 4
  store i8* %tag, i8** %tag.addr, align 4
  store i8* %ignore, i8** %ignore.addr, align 4
  store i32 0, i32* %found, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end87, %entry
  %0 = load %union.uwp*, %union.uwp** @unwind_protect_list, align 4
  store %union.uwp* %0, %union.uwp** %elt, align 4
  %tobool = icmp ne %union.uwp* %0, null
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %1 = load %union.uwp*, %union.uwp** @unwind_protect_list, align 4
  %head = bitcast %union.uwp* %1 to %struct.uwp_head*
  %next = getelementptr inbounds %struct.uwp_head, %struct.uwp_head* %head, i32 0, i32 0
  %2 = load %union.uwp*, %union.uwp** %next, align 4
  store %union.uwp* %2, %union.uwp** @unwind_protect_list, align 4
  %3 = load %union.uwp*, %union.uwp** %elt, align 4
  %head1 = bitcast %union.uwp* %3 to %struct.uwp_head*
  %cleanup = getelementptr inbounds %struct.uwp_head, %struct.uwp_head* %head1, i32 0, i32 1
  %4 = load i32 (...)*, i32 (...)** %cleanup, align 4
  %cmp = icmp eq i32 (...)* %4, null
  br i1 %cmp, label %land.lhs.true, label %if.else40

land.lhs.true:                                    ; preds = %while.body
  %5 = load %union.uwp*, %union.uwp** %elt, align 4
  %arg = bitcast %union.uwp* %5 to %struct.anon*
  %v = getelementptr inbounds %struct.anon, %struct.anon* %arg, i32 0, i32 1
  %6 = load i8*, i8** %v, align 4
  %arrayidx = getelementptr inbounds i8, i8* %6, i32 0
  %7 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %7 to i32
  %8 = load i8*, i8** %tag.addr, align 4
  %arrayidx2 = getelementptr inbounds i8, i8* %8, i32 0
  %9 = load i8, i8* %arrayidx2, align 1
  %conv3 = sext i8 %9 to i32
  %cmp4 = icmp eq i32 %conv, %conv3
  br i1 %cmp4, label %land.lhs.true6, label %if.else40

land.lhs.true6:                                   ; preds = %land.lhs.true
  %10 = load %union.uwp*, %union.uwp** %elt, align 4
  %arg7 = bitcast %union.uwp* %10 to %struct.anon*
  %v8 = getelementptr inbounds %struct.anon, %struct.anon* %arg7, i32 0, i32 1
  %11 = load i8*, i8** %v8, align 4
  %12 = load i8*, i8** %tag.addr, align 4
  %call = call i32 @strcmp(i8* %11, i8* %12)
  %cmp9 = icmp eq i32 %call, 0
  br i1 %cmp9, label %if.then, label %if.else40

if.then:                                          ; preds = %land.lhs.true6
  br label %do.body

do.body:                                          ; preds = %if.then
  %13 = load i32, i32* getelementptr inbounds (%struct.objcache, %struct.objcache* @uwcache, i32 0, i32 2), align 4
  %14 = load i32, i32* getelementptr inbounds (%struct.objcache, %struct.objcache* @uwcache, i32 0, i32 1), align 4
  %cmp11 = icmp slt i32 %13, %14
  br i1 %cmp11, label %if.then13, label %if.else37

if.then13:                                        ; preds = %do.body
  br label %do.body14

do.body14:                                        ; preds = %if.then13
  %15 = load %union.uwp*, %union.uwp** %elt, align 4
  %16 = bitcast %union.uwp* %15 to i8*
  store i8* %16, i8** %mzp, align 4
  store i32 20, i32* %mctmp, align 4
  %17 = load i32, i32* %mctmp, align 4
  %cmp15 = icmp ult i32 %17, 8
  br i1 %cmp15, label %if.then17, label %if.else

if.then17:                                        ; preds = %do.body14
  store i32 0, i32* %mcn, align 4
  br label %if.end

if.else:                                          ; preds = %do.body14
  %18 = load i32, i32* %mctmp, align 4
  %sub = sub i32 %18, 1
  %div = udiv i32 %sub, 8
  store i32 %div, i32* %mcn, align 4
  %19 = load i32, i32* %mctmp, align 4
  %and = and i32 %19, 7
  store i32 %and, i32* %mctmp, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then17
  %20 = load i32, i32* %mctmp, align 4
  switch i32 %20, label %sw.epilog [
    i32 0, label %sw.bb
    i32 7, label %sw.bb18
    i32 6, label %sw.bb20
    i32 5, label %sw.bb22
    i32 4, label %sw.bb24
    i32 3, label %sw.bb26
    i32 2, label %sw.bb28
    i32 1, label %sw.bb30
  ]

sw.bb:                                            ; preds = %if.end
  br label %for.cond

for.cond:                                         ; preds = %if.end35, %sw.bb
  %21 = load i8*, i8** %mzp, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %21, i32 1
  store i8* %incdec.ptr, i8** %mzp, align 4
  store i8 -33, i8* %21, align 1
  br label %sw.bb18

sw.bb18:                                          ; preds = %if.end, %for.cond
  %22 = load i8*, i8** %mzp, align 4
  %incdec.ptr19 = getelementptr inbounds i8, i8* %22, i32 1
  store i8* %incdec.ptr19, i8** %mzp, align 4
  store i8 -33, i8* %22, align 1
  br label %sw.bb20

sw.bb20:                                          ; preds = %if.end, %sw.bb18
  %23 = load i8*, i8** %mzp, align 4
  %incdec.ptr21 = getelementptr inbounds i8, i8* %23, i32 1
  store i8* %incdec.ptr21, i8** %mzp, align 4
  store i8 -33, i8* %23, align 1
  br label %sw.bb22

sw.bb22:                                          ; preds = %if.end, %sw.bb20
  %24 = load i8*, i8** %mzp, align 4
  %incdec.ptr23 = getelementptr inbounds i8, i8* %24, i32 1
  store i8* %incdec.ptr23, i8** %mzp, align 4
  store i8 -33, i8* %24, align 1
  br label %sw.bb24

sw.bb24:                                          ; preds = %if.end, %sw.bb22
  %25 = load i8*, i8** %mzp, align 4
  %incdec.ptr25 = getelementptr inbounds i8, i8* %25, i32 1
  store i8* %incdec.ptr25, i8** %mzp, align 4
  store i8 -33, i8* %25, align 1
  br label %sw.bb26

sw.bb26:                                          ; preds = %if.end, %sw.bb24
  %26 = load i8*, i8** %mzp, align 4
  %incdec.ptr27 = getelementptr inbounds i8, i8* %26, i32 1
  store i8* %incdec.ptr27, i8** %mzp, align 4
  store i8 -33, i8* %26, align 1
  br label %sw.bb28

sw.bb28:                                          ; preds = %if.end, %sw.bb26
  %27 = load i8*, i8** %mzp, align 4
  %incdec.ptr29 = getelementptr inbounds i8, i8* %27, i32 1
  store i8* %incdec.ptr29, i8** %mzp, align 4
  store i8 -33, i8* %27, align 1
  br label %sw.bb30

sw.bb30:                                          ; preds = %if.end, %sw.bb28
  %28 = load i8*, i8** %mzp, align 4
  %incdec.ptr31 = getelementptr inbounds i8, i8* %28, i32 1
  store i8* %incdec.ptr31, i8** %mzp, align 4
  store i8 -33, i8* %28, align 1
  %29 = load i32, i32* %mcn, align 4
  %cmp32 = icmp sle i32 %29, 0
  br i1 %cmp32, label %if.then34, label %if.end35

if.then34:                                        ; preds = %sw.bb30
  br label %for.end

if.end35:                                         ; preds = %sw.bb30
  %30 = load i32, i32* %mcn, align 4
  %dec = add nsw i32 %30, -1
  store i32 %dec, i32* %mcn, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then34
  br label %sw.epilog

sw.epilog:                                        ; preds = %for.end, %if.end
  br label %do.end

do.end:                                           ; preds = %sw.epilog
  %31 = load %union.uwp*, %union.uwp** %elt, align 4
  %32 = load i8*, i8** getelementptr inbounds (%struct.objcache, %struct.objcache* @uwcache, i32 0, i32 0), align 4
  %33 = bitcast i8* %32 to %union.uwp**
  %34 = load i32, i32* getelementptr inbounds (%struct.objcache, %struct.objcache* @uwcache, i32 0, i32 2), align 4
  %inc = add nsw i32 %34, 1
  store i32 %inc, i32* getelementptr inbounds (%struct.objcache, %struct.objcache* @uwcache, i32 0, i32 2), align 4
  %arrayidx36 = getelementptr inbounds %union.uwp*, %union.uwp** %33, i32 %34
  store %union.uwp* %31, %union.uwp** %arrayidx36, align 4
  br label %if.end38

if.else37:                                        ; preds = %do.body
  %35 = load %union.uwp*, %union.uwp** %elt, align 4
  %36 = bitcast %union.uwp* %35 to i8*
  call void @sh_xfree(i8* %36, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 284)
  br label %if.end38

if.end38:                                         ; preds = %if.else37, %do.end
  br label %do.end39

do.end39:                                         ; preds = %if.end38
  store i32 1, i32* %found, align 4
  br label %while.end

if.else40:                                        ; preds = %land.lhs.true6, %land.lhs.true, %while.body
  br label %do.body41

do.body41:                                        ; preds = %if.else40
  %37 = load i32, i32* getelementptr inbounds (%struct.objcache, %struct.objcache* @uwcache, i32 0, i32 2), align 4
  %38 = load i32, i32* getelementptr inbounds (%struct.objcache, %struct.objcache* @uwcache, i32 0, i32 1), align 4
  %cmp42 = icmp slt i32 %37, %38
  br i1 %cmp42, label %if.then44, label %if.else84

if.then44:                                        ; preds = %do.body41
  br label %do.body45

do.body45:                                        ; preds = %if.then44
  %39 = load %union.uwp*, %union.uwp** %elt, align 4
  %40 = bitcast %union.uwp* %39 to i8*
  store i8* %40, i8** %mzp46, align 4
  store i32 20, i32* %mctmp47, align 4
  %41 = load i32, i32* %mctmp47, align 4
  %cmp49 = icmp ult i32 %41, 8
  br i1 %cmp49, label %if.then51, label %if.else52

if.then51:                                        ; preds = %do.body45
  store i32 0, i32* %mcn48, align 4
  br label %if.end56

if.else52:                                        ; preds = %do.body45
  %42 = load i32, i32* %mctmp47, align 4
  %sub53 = sub i32 %42, 1
  %div54 = udiv i32 %sub53, 8
  store i32 %div54, i32* %mcn48, align 4
  %43 = load i32, i32* %mctmp47, align 4
  %and55 = and i32 %43, 7
  store i32 %and55, i32* %mctmp47, align 4
  br label %if.end56

if.end56:                                         ; preds = %if.else52, %if.then51
  %44 = load i32, i32* %mctmp47, align 4
  switch i32 %44, label %sw.epilog80 [
    i32 0, label %sw.bb57
    i32 7, label %sw.bb60
    i32 6, label %sw.bb62
    i32 5, label %sw.bb64
    i32 4, label %sw.bb66
    i32 3, label %sw.bb68
    i32 2, label %sw.bb70
    i32 1, label %sw.bb72
  ]

sw.bb57:                                          ; preds = %if.end56
  br label %for.cond58

for.cond58:                                       ; preds = %if.end77, %sw.bb57
  %45 = load i8*, i8** %mzp46, align 4
  %incdec.ptr59 = getelementptr inbounds i8, i8* %45, i32 1
  store i8* %incdec.ptr59, i8** %mzp46, align 4
  store i8 -33, i8* %45, align 1
  br label %sw.bb60

sw.bb60:                                          ; preds = %if.end56, %for.cond58
  %46 = load i8*, i8** %mzp46, align 4
  %incdec.ptr61 = getelementptr inbounds i8, i8* %46, i32 1
  store i8* %incdec.ptr61, i8** %mzp46, align 4
  store i8 -33, i8* %46, align 1
  br label %sw.bb62

sw.bb62:                                          ; preds = %if.end56, %sw.bb60
  %47 = load i8*, i8** %mzp46, align 4
  %incdec.ptr63 = getelementptr inbounds i8, i8* %47, i32 1
  store i8* %incdec.ptr63, i8** %mzp46, align 4
  store i8 -33, i8* %47, align 1
  br label %sw.bb64

sw.bb64:                                          ; preds = %if.end56, %sw.bb62
  %48 = load i8*, i8** %mzp46, align 4
  %incdec.ptr65 = getelementptr inbounds i8, i8* %48, i32 1
  store i8* %incdec.ptr65, i8** %mzp46, align 4
  store i8 -33, i8* %48, align 1
  br label %sw.bb66

sw.bb66:                                          ; preds = %if.end56, %sw.bb64
  %49 = load i8*, i8** %mzp46, align 4
  %incdec.ptr67 = getelementptr inbounds i8, i8* %49, i32 1
  store i8* %incdec.ptr67, i8** %mzp46, align 4
  store i8 -33, i8* %49, align 1
  br label %sw.bb68

sw.bb68:                                          ; preds = %if.end56, %sw.bb66
  %50 = load i8*, i8** %mzp46, align 4
  %incdec.ptr69 = getelementptr inbounds i8, i8* %50, i32 1
  store i8* %incdec.ptr69, i8** %mzp46, align 4
  store i8 -33, i8* %50, align 1
  br label %sw.bb70

sw.bb70:                                          ; preds = %if.end56, %sw.bb68
  %51 = load i8*, i8** %mzp46, align 4
  %incdec.ptr71 = getelementptr inbounds i8, i8* %51, i32 1
  store i8* %incdec.ptr71, i8** %mzp46, align 4
  store i8 -33, i8* %51, align 1
  br label %sw.bb72

sw.bb72:                                          ; preds = %if.end56, %sw.bb70
  %52 = load i8*, i8** %mzp46, align 4
  %incdec.ptr73 = getelementptr inbounds i8, i8* %52, i32 1
  store i8* %incdec.ptr73, i8** %mzp46, align 4
  store i8 -33, i8* %52, align 1
  %53 = load i32, i32* %mcn48, align 4
  %cmp74 = icmp sle i32 %53, 0
  br i1 %cmp74, label %if.then76, label %if.end77

if.then76:                                        ; preds = %sw.bb72
  br label %for.end79

if.end77:                                         ; preds = %sw.bb72
  %54 = load i32, i32* %mcn48, align 4
  %dec78 = add nsw i32 %54, -1
  store i32 %dec78, i32* %mcn48, align 4
  br label %for.cond58

for.end79:                                        ; preds = %if.then76
  br label %sw.epilog80

sw.epilog80:                                      ; preds = %for.end79, %if.end56
  br label %do.end81

do.end81:                                         ; preds = %sw.epilog80
  %55 = load %union.uwp*, %union.uwp** %elt, align 4
  %56 = load i8*, i8** getelementptr inbounds (%struct.objcache, %struct.objcache* @uwcache, i32 0, i32 0), align 4
  %57 = bitcast i8* %56 to %union.uwp**
  %58 = load i32, i32* getelementptr inbounds (%struct.objcache, %struct.objcache* @uwcache, i32 0, i32 2), align 4
  %inc82 = add nsw i32 %58, 1
  store i32 %inc82, i32* getelementptr inbounds (%struct.objcache, %struct.objcache* @uwcache, i32 0, i32 2), align 4
  %arrayidx83 = getelementptr inbounds %union.uwp*, %union.uwp** %57, i32 %58
  store %union.uwp* %55, %union.uwp** %arrayidx83, align 4
  br label %if.end85

if.else84:                                        ; preds = %do.body41
  %59 = load %union.uwp*, %union.uwp** %elt, align 4
  %60 = bitcast %union.uwp* %59 to i8*
  call void @sh_xfree(i8* %60, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 289)
  br label %if.end85

if.end85:                                         ; preds = %if.else84, %do.end81
  br label %do.end86

do.end86:                                         ; preds = %if.end85
  br label %if.end87

if.end87:                                         ; preds = %do.end86
  br label %while.cond

while.end:                                        ; preds = %do.end39, %while.cond
  %61 = load i32, i32* %found, align 4
  %cmp88 = icmp eq i32 %61, 0
  br i1 %cmp88, label %if.then90, label %if.end91

if.then90:                                        ; preds = %while.end
  %62 = load i8*, i8** %tag.addr, align 4
  call void (i8*, ...) @internal_warning(i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.2, i32 0, i32 0), i8* %62)
  br label %if.end91

if.end91:                                         ; preds = %if.then90, %while.end
  ret void
}

; Function Attrs: noinline nounwind
define void @run_unwind_frame(i8* %tag) #0 {
entry:
  %tag.addr = alloca i8*, align 4
  store i8* %tag, i8** %tag.addr, align 4
  %0 = load %union.uwp*, %union.uwp** @unwind_protect_list, align 4
  %tobool = icmp ne %union.uwp* %0, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %tag.addr, align 4
  call void @without_interrupts(void (...)* bitcast (void (i8*, i8*)* @unwind_frame_run_internal to void (...)*), i8* %1, i8* null)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

; Function Attrs: noinline nounwind
define internal void @unwind_frame_run_internal(i8* %tag, i8* %ignore) #0 {
entry:
  %tag.addr = alloca i8*, align 4
  %ignore.addr = alloca i8*, align 4
  %elt = alloca %union.uwp*, align 4
  %found = alloca i32, align 4
  %mzp = alloca i8*, align 4
  %mctmp = alloca i32, align 4
  %mcn = alloca i32, align 4
  %mzp63 = alloca i8*, align 4
  %mctmp64 = alloca i32, align 4
  %mcn65 = alloca i32, align 4
  store i8* %tag, i8** %tag.addr, align 4
  store i8* %ignore, i8** %ignore.addr, align 4
  store i32 0, i32* %found, align 4
  br label %while.cond

while.cond:                                       ; preds = %do.end103, %entry
  %0 = load %union.uwp*, %union.uwp** @unwind_protect_list, align 4
  store %union.uwp* %0, %union.uwp** %elt, align 4
  %tobool = icmp ne %union.uwp* %0, null
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %1 = load %union.uwp*, %union.uwp** %elt, align 4
  %head = bitcast %union.uwp* %1 to %struct.uwp_head*
  %next = getelementptr inbounds %struct.uwp_head, %struct.uwp_head* %head, i32 0, i32 0
  %2 = load %union.uwp*, %union.uwp** %next, align 4
  store %union.uwp* %2, %union.uwp** @unwind_protect_list, align 4
  %3 = load %union.uwp*, %union.uwp** %elt, align 4
  %head1 = bitcast %union.uwp* %3 to %struct.uwp_head*
  %cleanup = getelementptr inbounds %struct.uwp_head, %struct.uwp_head* %head1, i32 0, i32 1
  %4 = load i32 (...)*, i32 (...)** %cleanup, align 4
  %cmp = icmp eq i32 (...)* %4, null
  br i1 %cmp, label %if.then, label %if.else43

if.then:                                          ; preds = %while.body
  %5 = load i8*, i8** %tag.addr, align 4
  %tobool2 = icmp ne i8* %5, null
  br i1 %tobool2, label %land.lhs.true, label %if.end42

land.lhs.true:                                    ; preds = %if.then
  %6 = load %union.uwp*, %union.uwp** %elt, align 4
  %arg = bitcast %union.uwp* %6 to %struct.anon*
  %v = getelementptr inbounds %struct.anon, %struct.anon* %arg, i32 0, i32 1
  %7 = load i8*, i8** %v, align 4
  %arrayidx = getelementptr inbounds i8, i8* %7, i32 0
  %8 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %8 to i32
  %9 = load i8*, i8** %tag.addr, align 4
  %arrayidx3 = getelementptr inbounds i8, i8* %9, i32 0
  %10 = load i8, i8* %arrayidx3, align 1
  %conv4 = sext i8 %10 to i32
  %cmp5 = icmp eq i32 %conv, %conv4
  br i1 %cmp5, label %land.lhs.true7, label %if.end42

land.lhs.true7:                                   ; preds = %land.lhs.true
  %11 = load %union.uwp*, %union.uwp** %elt, align 4
  %arg8 = bitcast %union.uwp* %11 to %struct.anon*
  %v9 = getelementptr inbounds %struct.anon, %struct.anon* %arg8, i32 0, i32 1
  %12 = load i8*, i8** %v9, align 4
  %13 = load i8*, i8** %tag.addr, align 4
  %call = call i32 @strcmp(i8* %12, i8* %13)
  %cmp10 = icmp eq i32 %call, 0
  br i1 %cmp10, label %if.then12, label %if.end42

if.then12:                                        ; preds = %land.lhs.true7
  br label %do.body

do.body:                                          ; preds = %if.then12
  %14 = load i32, i32* getelementptr inbounds (%struct.objcache, %struct.objcache* @uwcache, i32 0, i32 2), align 4
  %15 = load i32, i32* getelementptr inbounds (%struct.objcache, %struct.objcache* @uwcache, i32 0, i32 1), align 4
  %cmp13 = icmp slt i32 %14, %15
  br i1 %cmp13, label %if.then15, label %if.else39

if.then15:                                        ; preds = %do.body
  br label %do.body16

do.body16:                                        ; preds = %if.then15
  %16 = load %union.uwp*, %union.uwp** %elt, align 4
  %17 = bitcast %union.uwp* %16 to i8*
  store i8* %17, i8** %mzp, align 4
  store i32 20, i32* %mctmp, align 4
  %18 = load i32, i32* %mctmp, align 4
  %cmp17 = icmp ult i32 %18, 8
  br i1 %cmp17, label %if.then19, label %if.else

if.then19:                                        ; preds = %do.body16
  store i32 0, i32* %mcn, align 4
  br label %if.end

if.else:                                          ; preds = %do.body16
  %19 = load i32, i32* %mctmp, align 4
  %sub = sub i32 %19, 1
  %div = udiv i32 %sub, 8
  store i32 %div, i32* %mcn, align 4
  %20 = load i32, i32* %mctmp, align 4
  %and = and i32 %20, 7
  store i32 %and, i32* %mctmp, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then19
  %21 = load i32, i32* %mctmp, align 4
  switch i32 %21, label %sw.epilog [
    i32 0, label %sw.bb
    i32 7, label %sw.bb20
    i32 6, label %sw.bb22
    i32 5, label %sw.bb24
    i32 4, label %sw.bb26
    i32 3, label %sw.bb28
    i32 2, label %sw.bb30
    i32 1, label %sw.bb32
  ]

sw.bb:                                            ; preds = %if.end
  br label %for.cond

for.cond:                                         ; preds = %if.end37, %sw.bb
  %22 = load i8*, i8** %mzp, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %22, i32 1
  store i8* %incdec.ptr, i8** %mzp, align 4
  store i8 -33, i8* %22, align 1
  br label %sw.bb20

sw.bb20:                                          ; preds = %if.end, %for.cond
  %23 = load i8*, i8** %mzp, align 4
  %incdec.ptr21 = getelementptr inbounds i8, i8* %23, i32 1
  store i8* %incdec.ptr21, i8** %mzp, align 4
  store i8 -33, i8* %23, align 1
  br label %sw.bb22

sw.bb22:                                          ; preds = %if.end, %sw.bb20
  %24 = load i8*, i8** %mzp, align 4
  %incdec.ptr23 = getelementptr inbounds i8, i8* %24, i32 1
  store i8* %incdec.ptr23, i8** %mzp, align 4
  store i8 -33, i8* %24, align 1
  br label %sw.bb24

sw.bb24:                                          ; preds = %if.end, %sw.bb22
  %25 = load i8*, i8** %mzp, align 4
  %incdec.ptr25 = getelementptr inbounds i8, i8* %25, i32 1
  store i8* %incdec.ptr25, i8** %mzp, align 4
  store i8 -33, i8* %25, align 1
  br label %sw.bb26

sw.bb26:                                          ; preds = %if.end, %sw.bb24
  %26 = load i8*, i8** %mzp, align 4
  %incdec.ptr27 = getelementptr inbounds i8, i8* %26, i32 1
  store i8* %incdec.ptr27, i8** %mzp, align 4
  store i8 -33, i8* %26, align 1
  br label %sw.bb28

sw.bb28:                                          ; preds = %if.end, %sw.bb26
  %27 = load i8*, i8** %mzp, align 4
  %incdec.ptr29 = getelementptr inbounds i8, i8* %27, i32 1
  store i8* %incdec.ptr29, i8** %mzp, align 4
  store i8 -33, i8* %27, align 1
  br label %sw.bb30

sw.bb30:                                          ; preds = %if.end, %sw.bb28
  %28 = load i8*, i8** %mzp, align 4
  %incdec.ptr31 = getelementptr inbounds i8, i8* %28, i32 1
  store i8* %incdec.ptr31, i8** %mzp, align 4
  store i8 -33, i8* %28, align 1
  br label %sw.bb32

sw.bb32:                                          ; preds = %if.end, %sw.bb30
  %29 = load i8*, i8** %mzp, align 4
  %incdec.ptr33 = getelementptr inbounds i8, i8* %29, i32 1
  store i8* %incdec.ptr33, i8** %mzp, align 4
  store i8 -33, i8* %29, align 1
  %30 = load i32, i32* %mcn, align 4
  %cmp34 = icmp sle i32 %30, 0
  br i1 %cmp34, label %if.then36, label %if.end37

if.then36:                                        ; preds = %sw.bb32
  br label %for.end

if.end37:                                         ; preds = %sw.bb32
  %31 = load i32, i32* %mcn, align 4
  %dec = add nsw i32 %31, -1
  store i32 %dec, i32* %mcn, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then36
  br label %sw.epilog

sw.epilog:                                        ; preds = %for.end, %if.end
  br label %do.end

do.end:                                           ; preds = %sw.epilog
  %32 = load %union.uwp*, %union.uwp** %elt, align 4
  %33 = load i8*, i8** getelementptr inbounds (%struct.objcache, %struct.objcache* @uwcache, i32 0, i32 0), align 4
  %34 = bitcast i8* %33 to %union.uwp**
  %35 = load i32, i32* getelementptr inbounds (%struct.objcache, %struct.objcache* @uwcache, i32 0, i32 2), align 4
  %inc = add nsw i32 %35, 1
  store i32 %inc, i32* getelementptr inbounds (%struct.objcache, %struct.objcache* @uwcache, i32 0, i32 2), align 4
  %arrayidx38 = getelementptr inbounds %union.uwp*, %union.uwp** %34, i32 %35
  store %union.uwp* %32, %union.uwp** %arrayidx38, align 4
  br label %if.end40

if.else39:                                        ; preds = %do.body
  %36 = load %union.uwp*, %union.uwp** %elt, align 4
  %37 = bitcast %union.uwp* %36 to i8*
  call void @sh_xfree(i8* %37, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 323)
  br label %if.end40

if.end40:                                         ; preds = %if.else39, %do.end
  br label %do.end41

do.end41:                                         ; preds = %if.end40
  store i32 1, i32* %found, align 4
  br label %while.end

if.end42:                                         ; preds = %land.lhs.true7, %land.lhs.true, %if.then
  br label %if.end57

if.else43:                                        ; preds = %while.body
  %38 = load %union.uwp*, %union.uwp** %elt, align 4
  %head44 = bitcast %union.uwp* %38 to %struct.uwp_head*
  %cleanup45 = getelementptr inbounds %struct.uwp_head, %struct.uwp_head* %head44, i32 0, i32 1
  %39 = load i32 (...)*, i32 (...)** %cleanup45, align 4
  %cmp46 = icmp eq i32 (...)* %39, bitcast (void (%struct.SAVED_VAR*)* @restore_variable to i32 (...)*)
  br i1 %cmp46, label %if.then48, label %if.else50

if.then48:                                        ; preds = %if.else43
  %40 = load %union.uwp*, %union.uwp** %elt, align 4
  %sv = bitcast %union.uwp* %40 to %struct.anon.0*
  %v49 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %sv, i32 0, i32 1
  call void @restore_variable(%struct.SAVED_VAR* %v49)
  br label %if.end56

if.else50:                                        ; preds = %if.else43
  %41 = load %union.uwp*, %union.uwp** %elt, align 4
  %head51 = bitcast %union.uwp* %41 to %struct.uwp_head*
  %cleanup52 = getelementptr inbounds %struct.uwp_head, %struct.uwp_head* %head51, i32 0, i32 1
  %42 = load i32 (...)*, i32 (...)** %cleanup52, align 4
  %43 = load %union.uwp*, %union.uwp** %elt, align 4
  %arg53 = bitcast %union.uwp* %43 to %struct.anon*
  %v54 = getelementptr inbounds %struct.anon, %struct.anon* %arg53, i32 0, i32 1
  %44 = load i8*, i8** %v54, align 4
  %callee.knr.cast = bitcast i32 (...)* %42 to i32 (i8*)*
  %call55 = call i32 %callee.knr.cast(i8* %44)
  br label %if.end56

if.end56:                                         ; preds = %if.else50, %if.then48
  br label %if.end57

if.end57:                                         ; preds = %if.end56, %if.end42
  br label %do.body58

do.body58:                                        ; preds = %if.end57
  %45 = load i32, i32* getelementptr inbounds (%struct.objcache, %struct.objcache* @uwcache, i32 0, i32 2), align 4
  %46 = load i32, i32* getelementptr inbounds (%struct.objcache, %struct.objcache* @uwcache, i32 0, i32 1), align 4
  %cmp59 = icmp slt i32 %45, %46
  br i1 %cmp59, label %if.then61, label %if.else101

if.then61:                                        ; preds = %do.body58
  br label %do.body62

do.body62:                                        ; preds = %if.then61
  %47 = load %union.uwp*, %union.uwp** %elt, align 4
  %48 = bitcast %union.uwp* %47 to i8*
  store i8* %48, i8** %mzp63, align 4
  store i32 20, i32* %mctmp64, align 4
  %49 = load i32, i32* %mctmp64, align 4
  %cmp66 = icmp ult i32 %49, 8
  br i1 %cmp66, label %if.then68, label %if.else69

if.then68:                                        ; preds = %do.body62
  store i32 0, i32* %mcn65, align 4
  br label %if.end73

if.else69:                                        ; preds = %do.body62
  %50 = load i32, i32* %mctmp64, align 4
  %sub70 = sub i32 %50, 1
  %div71 = udiv i32 %sub70, 8
  store i32 %div71, i32* %mcn65, align 4
  %51 = load i32, i32* %mctmp64, align 4
  %and72 = and i32 %51, 7
  store i32 %and72, i32* %mctmp64, align 4
  br label %if.end73

if.end73:                                         ; preds = %if.else69, %if.then68
  %52 = load i32, i32* %mctmp64, align 4
  switch i32 %52, label %sw.epilog97 [
    i32 0, label %sw.bb74
    i32 7, label %sw.bb77
    i32 6, label %sw.bb79
    i32 5, label %sw.bb81
    i32 4, label %sw.bb83
    i32 3, label %sw.bb85
    i32 2, label %sw.bb87
    i32 1, label %sw.bb89
  ]

sw.bb74:                                          ; preds = %if.end73
  br label %for.cond75

for.cond75:                                       ; preds = %if.end94, %sw.bb74
  %53 = load i8*, i8** %mzp63, align 4
  %incdec.ptr76 = getelementptr inbounds i8, i8* %53, i32 1
  store i8* %incdec.ptr76, i8** %mzp63, align 4
  store i8 -33, i8* %53, align 1
  br label %sw.bb77

sw.bb77:                                          ; preds = %if.end73, %for.cond75
  %54 = load i8*, i8** %mzp63, align 4
  %incdec.ptr78 = getelementptr inbounds i8, i8* %54, i32 1
  store i8* %incdec.ptr78, i8** %mzp63, align 4
  store i8 -33, i8* %54, align 1
  br label %sw.bb79

sw.bb79:                                          ; preds = %if.end73, %sw.bb77
  %55 = load i8*, i8** %mzp63, align 4
  %incdec.ptr80 = getelementptr inbounds i8, i8* %55, i32 1
  store i8* %incdec.ptr80, i8** %mzp63, align 4
  store i8 -33, i8* %55, align 1
  br label %sw.bb81

sw.bb81:                                          ; preds = %if.end73, %sw.bb79
  %56 = load i8*, i8** %mzp63, align 4
  %incdec.ptr82 = getelementptr inbounds i8, i8* %56, i32 1
  store i8* %incdec.ptr82, i8** %mzp63, align 4
  store i8 -33, i8* %56, align 1
  br label %sw.bb83

sw.bb83:                                          ; preds = %if.end73, %sw.bb81
  %57 = load i8*, i8** %mzp63, align 4
  %incdec.ptr84 = getelementptr inbounds i8, i8* %57, i32 1
  store i8* %incdec.ptr84, i8** %mzp63, align 4
  store i8 -33, i8* %57, align 1
  br label %sw.bb85

sw.bb85:                                          ; preds = %if.end73, %sw.bb83
  %58 = load i8*, i8** %mzp63, align 4
  %incdec.ptr86 = getelementptr inbounds i8, i8* %58, i32 1
  store i8* %incdec.ptr86, i8** %mzp63, align 4
  store i8 -33, i8* %58, align 1
  br label %sw.bb87

sw.bb87:                                          ; preds = %if.end73, %sw.bb85
  %59 = load i8*, i8** %mzp63, align 4
  %incdec.ptr88 = getelementptr inbounds i8, i8* %59, i32 1
  store i8* %incdec.ptr88, i8** %mzp63, align 4
  store i8 -33, i8* %59, align 1
  br label %sw.bb89

sw.bb89:                                          ; preds = %if.end73, %sw.bb87
  %60 = load i8*, i8** %mzp63, align 4
  %incdec.ptr90 = getelementptr inbounds i8, i8* %60, i32 1
  store i8* %incdec.ptr90, i8** %mzp63, align 4
  store i8 -33, i8* %60, align 1
  %61 = load i32, i32* %mcn65, align 4
  %cmp91 = icmp sle i32 %61, 0
  br i1 %cmp91, label %if.then93, label %if.end94

if.then93:                                        ; preds = %sw.bb89
  br label %for.end96

if.end94:                                         ; preds = %sw.bb89
  %62 = load i32, i32* %mcn65, align 4
  %dec95 = add nsw i32 %62, -1
  store i32 %dec95, i32* %mcn65, align 4
  br label %for.cond75

for.end96:                                        ; preds = %if.then93
  br label %sw.epilog97

sw.epilog97:                                      ; preds = %for.end96, %if.end73
  br label %do.end98

do.end98:                                         ; preds = %sw.epilog97
  %63 = load %union.uwp*, %union.uwp** %elt, align 4
  %64 = load i8*, i8** getelementptr inbounds (%struct.objcache, %struct.objcache* @uwcache, i32 0, i32 0), align 4
  %65 = bitcast i8* %64 to %union.uwp**
  %66 = load i32, i32* getelementptr inbounds (%struct.objcache, %struct.objcache* @uwcache, i32 0, i32 2), align 4
  %inc99 = add nsw i32 %66, 1
  store i32 %inc99, i32* getelementptr inbounds (%struct.objcache, %struct.objcache* @uwcache, i32 0, i32 2), align 4
  %arrayidx100 = getelementptr inbounds %union.uwp*, %union.uwp** %65, i32 %66
  store %union.uwp* %63, %union.uwp** %arrayidx100, align 4
  br label %if.end102

if.else101:                                       ; preds = %do.body58
  %67 = load %union.uwp*, %union.uwp** %elt, align 4
  %68 = bitcast %union.uwp* %67 to i8*
  call void @sh_xfree(i8* %68, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 336)
  br label %if.end102

if.end102:                                        ; preds = %if.else101, %do.end98
  br label %do.end103

do.end103:                                        ; preds = %if.end102
  br label %while.cond

while.end:                                        ; preds = %do.end41, %while.cond
  %69 = load i8*, i8** %tag.addr, align 4
  %tobool104 = icmp ne i8* %69, null
  br i1 %tobool104, label %land.lhs.true105, label %if.end109

land.lhs.true105:                                 ; preds = %while.end
  %70 = load i32, i32* %found, align 4
  %cmp106 = icmp eq i32 %70, 0
  br i1 %cmp106, label %if.then108, label %if.end109

if.then108:                                       ; preds = %land.lhs.true105
  %71 = load i8*, i8** %tag.addr, align 4
  call void (i8*, ...) @internal_warning(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.3, i32 0, i32 0), i8* %71)
  br label %if.end109

if.end109:                                        ; preds = %if.then108, %land.lhs.true105, %while.end
  ret void
}

; Function Attrs: noinline nounwind
define void @add_unwind_protect(i32 (...)* %cleanup, i8* %arg) #0 {
entry:
  %cleanup.addr = alloca i32 (...)*, align 4
  %arg.addr = alloca i8*, align 4
  store i32 (...)* %cleanup, i32 (...)** %cleanup.addr, align 4
  store i8* %arg, i8** %arg.addr, align 4
  %0 = load i32 (...)*, i32 (...)** %cleanup.addr, align 4
  %1 = bitcast i32 (...)* %0 to i8*
  %2 = load i8*, i8** %arg.addr, align 4
  call void @without_interrupts(void (...)* bitcast (void (i32 (...)*, i8*)* @add_unwind_protect_internal to void (...)*), i8* %1, i8* %2)
  ret void
}

; Function Attrs: noinline nounwind
define internal void @add_unwind_protect_internal(i32 (...)* %cleanup, i8* %arg) #0 {
entry:
  %cleanup.addr = alloca i32 (...)*, align 4
  %arg.addr = alloca i8*, align 4
  %elt = alloca %union.uwp*, align 4
  store i32 (...)* %cleanup, i32 (...)** %cleanup.addr, align 4
  store i8* %arg, i8** %arg.addr, align 4
  br label %do.body

do.body:                                          ; preds = %entry
  %0 = load i32, i32* getelementptr inbounds (%struct.objcache, %struct.objcache* @uwcache, i32 0, i32 2), align 4
  %cmp = icmp sgt i32 %0, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %do.body
  %1 = load i8*, i8** getelementptr inbounds (%struct.objcache, %struct.objcache* @uwcache, i32 0, i32 0), align 4
  %2 = bitcast i8* %1 to %union.uwp**
  %3 = load i32, i32* getelementptr inbounds (%struct.objcache, %struct.objcache* @uwcache, i32 0, i32 2), align 4
  %dec = add nsw i32 %3, -1
  store i32 %dec, i32* getelementptr inbounds (%struct.objcache, %struct.objcache* @uwcache, i32 0, i32 2), align 4
  %arrayidx = getelementptr inbounds %union.uwp*, %union.uwp** %2, i32 %dec
  %4 = load %union.uwp*, %union.uwp** %arrayidx, align 4
  store %union.uwp* %4, %union.uwp** %elt, align 4
  br label %if.end

if.else:                                          ; preds = %do.body
  %call = call i8* @sh_xmalloc(i32 20, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 231)
  %5 = bitcast i8* %call to %union.uwp*
  store %union.uwp* %5, %union.uwp** %elt, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %do.end

do.end:                                           ; preds = %if.end
  %6 = load %union.uwp*, %union.uwp** @unwind_protect_list, align 4
  %7 = load %union.uwp*, %union.uwp** %elt, align 4
  %head = bitcast %union.uwp* %7 to %struct.uwp_head*
  %next = getelementptr inbounds %struct.uwp_head, %struct.uwp_head* %head, i32 0, i32 0
  store %union.uwp* %6, %union.uwp** %next, align 4
  %8 = load i32 (...)*, i32 (...)** %cleanup.addr, align 4
  %9 = load %union.uwp*, %union.uwp** %elt, align 4
  %head1 = bitcast %union.uwp* %9 to %struct.uwp_head*
  %cleanup2 = getelementptr inbounds %struct.uwp_head, %struct.uwp_head* %head1, i32 0, i32 1
  store i32 (...)* %8, i32 (...)** %cleanup2, align 4
  %10 = load i8*, i8** %arg.addr, align 4
  %11 = load %union.uwp*, %union.uwp** %elt, align 4
  %arg3 = bitcast %union.uwp* %11 to %struct.anon*
  %v = getelementptr inbounds %struct.anon, %struct.anon* %arg3, i32 0, i32 1
  store i8* %10, i8** %v, align 4
  %12 = load %union.uwp*, %union.uwp** %elt, align 4
  store %union.uwp* %12, %union.uwp** @unwind_protect_list, align 4
  ret void
}

; Function Attrs: noinline nounwind
define void @remove_unwind_protect() #0 {
entry:
  %0 = load %union.uwp*, %union.uwp** @unwind_protect_list, align 4
  %tobool = icmp ne %union.uwp* %0, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @without_interrupts(void (...)* bitcast (void (i8*, i8*)* @remove_unwind_protect_internal to void (...)*), i8* null, i8* null)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

; Function Attrs: noinline nounwind
define internal void @remove_unwind_protect_internal(i8* %ignore1, i8* %ignore2) #0 {
entry:
  %ignore1.addr = alloca i8*, align 4
  %ignore2.addr = alloca i8*, align 4
  %elt = alloca %union.uwp*, align 4
  %mzp = alloca i8*, align 4
  %mctmp = alloca i32, align 4
  %mcn = alloca i32, align 4
  store i8* %ignore1, i8** %ignore1.addr, align 4
  store i8* %ignore2, i8** %ignore2.addr, align 4
  %0 = load %union.uwp*, %union.uwp** @unwind_protect_list, align 4
  store %union.uwp* %0, %union.uwp** %elt, align 4
  %1 = load %union.uwp*, %union.uwp** %elt, align 4
  %tobool = icmp ne %union.uwp* %1, null
  br i1 %tobool, label %if.then, label %if.end25

if.then:                                          ; preds = %entry
  %2 = load %union.uwp*, %union.uwp** @unwind_protect_list, align 4
  %head = bitcast %union.uwp* %2 to %struct.uwp_head*
  %next = getelementptr inbounds %struct.uwp_head, %struct.uwp_head* %head, i32 0, i32 0
  %3 = load %union.uwp*, %union.uwp** %next, align 4
  store %union.uwp* %3, %union.uwp** @unwind_protect_list, align 4
  br label %do.body

do.body:                                          ; preds = %if.then
  %4 = load i32, i32* getelementptr inbounds (%struct.objcache, %struct.objcache* @uwcache, i32 0, i32 2), align 4
  %5 = load i32, i32* getelementptr inbounds (%struct.objcache, %struct.objcache* @uwcache, i32 0, i32 1), align 4
  %cmp = icmp slt i32 %4, %5
  br i1 %cmp, label %if.then1, label %if.else22

if.then1:                                         ; preds = %do.body
  br label %do.body2

do.body2:                                         ; preds = %if.then1
  %6 = load %union.uwp*, %union.uwp** %elt, align 4
  %7 = bitcast %union.uwp* %6 to i8*
  store i8* %7, i8** %mzp, align 4
  store i32 20, i32* %mctmp, align 4
  %8 = load i32, i32* %mctmp, align 4
  %cmp3 = icmp ult i32 %8, 8
  br i1 %cmp3, label %if.then4, label %if.else

if.then4:                                         ; preds = %do.body2
  store i32 0, i32* %mcn, align 4
  br label %if.end

if.else:                                          ; preds = %do.body2
  %9 = load i32, i32* %mctmp, align 4
  %sub = sub i32 %9, 1
  %div = udiv i32 %sub, 8
  store i32 %div, i32* %mcn, align 4
  %10 = load i32, i32* %mctmp, align 4
  %and = and i32 %10, 7
  store i32 %and, i32* %mctmp, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then4
  %11 = load i32, i32* %mctmp, align 4
  switch i32 %11, label %sw.epilog [
    i32 0, label %sw.bb
    i32 7, label %sw.bb5
    i32 6, label %sw.bb7
    i32 5, label %sw.bb9
    i32 4, label %sw.bb11
    i32 3, label %sw.bb13
    i32 2, label %sw.bb15
    i32 1, label %sw.bb17
  ]

sw.bb:                                            ; preds = %if.end
  br label %for.cond

for.cond:                                         ; preds = %if.end21, %sw.bb
  %12 = load i8*, i8** %mzp, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %12, i32 1
  store i8* %incdec.ptr, i8** %mzp, align 4
  store i8 -33, i8* %12, align 1
  br label %sw.bb5

sw.bb5:                                           ; preds = %if.end, %for.cond
  %13 = load i8*, i8** %mzp, align 4
  %incdec.ptr6 = getelementptr inbounds i8, i8* %13, i32 1
  store i8* %incdec.ptr6, i8** %mzp, align 4
  store i8 -33, i8* %13, align 1
  br label %sw.bb7

sw.bb7:                                           ; preds = %if.end, %sw.bb5
  %14 = load i8*, i8** %mzp, align 4
  %incdec.ptr8 = getelementptr inbounds i8, i8* %14, i32 1
  store i8* %incdec.ptr8, i8** %mzp, align 4
  store i8 -33, i8* %14, align 1
  br label %sw.bb9

sw.bb9:                                           ; preds = %if.end, %sw.bb7
  %15 = load i8*, i8** %mzp, align 4
  %incdec.ptr10 = getelementptr inbounds i8, i8* %15, i32 1
  store i8* %incdec.ptr10, i8** %mzp, align 4
  store i8 -33, i8* %15, align 1
  br label %sw.bb11

sw.bb11:                                          ; preds = %if.end, %sw.bb9
  %16 = load i8*, i8** %mzp, align 4
  %incdec.ptr12 = getelementptr inbounds i8, i8* %16, i32 1
  store i8* %incdec.ptr12, i8** %mzp, align 4
  store i8 -33, i8* %16, align 1
  br label %sw.bb13

sw.bb13:                                          ; preds = %if.end, %sw.bb11
  %17 = load i8*, i8** %mzp, align 4
  %incdec.ptr14 = getelementptr inbounds i8, i8* %17, i32 1
  store i8* %incdec.ptr14, i8** %mzp, align 4
  store i8 -33, i8* %17, align 1
  br label %sw.bb15

sw.bb15:                                          ; preds = %if.end, %sw.bb13
  %18 = load i8*, i8** %mzp, align 4
  %incdec.ptr16 = getelementptr inbounds i8, i8* %18, i32 1
  store i8* %incdec.ptr16, i8** %mzp, align 4
  store i8 -33, i8* %18, align 1
  br label %sw.bb17

sw.bb17:                                          ; preds = %if.end, %sw.bb15
  %19 = load i8*, i8** %mzp, align 4
  %incdec.ptr18 = getelementptr inbounds i8, i8* %19, i32 1
  store i8* %incdec.ptr18, i8** %mzp, align 4
  store i8 -33, i8* %19, align 1
  %20 = load i32, i32* %mcn, align 4
  %cmp19 = icmp sle i32 %20, 0
  br i1 %cmp19, label %if.then20, label %if.end21

if.then20:                                        ; preds = %sw.bb17
  br label %for.end

if.end21:                                         ; preds = %sw.bb17
  %21 = load i32, i32* %mcn, align 4
  %dec = add nsw i32 %21, -1
  store i32 %dec, i32* %mcn, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then20
  br label %sw.epilog

sw.epilog:                                        ; preds = %for.end, %if.end
  br label %do.end

do.end:                                           ; preds = %sw.epilog
  %22 = load %union.uwp*, %union.uwp** %elt, align 4
  %23 = load i8*, i8** getelementptr inbounds (%struct.objcache, %struct.objcache* @uwcache, i32 0, i32 0), align 4
  %24 = bitcast i8* %23 to %union.uwp**
  %25 = load i32, i32* getelementptr inbounds (%struct.objcache, %struct.objcache* @uwcache, i32 0, i32 2), align 4
  %inc = add nsw i32 %25, 1
  store i32 %inc, i32* getelementptr inbounds (%struct.objcache, %struct.objcache* @uwcache, i32 0, i32 2), align 4
  %arrayidx = getelementptr inbounds %union.uwp*, %union.uwp** %24, i32 %25
  store %union.uwp* %22, %union.uwp** %arrayidx, align 4
  br label %if.end23

if.else22:                                        ; preds = %do.body
  %26 = load %union.uwp*, %union.uwp** %elt, align 4
  %27 = bitcast %union.uwp* %26 to i8*
  call void @sh_xfree(i8* %27, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 248)
  br label %if.end23

if.end23:                                         ; preds = %if.else22, %do.end
  br label %do.end24

do.end24:                                         ; preds = %if.end23
  br label %if.end25

if.end25:                                         ; preds = %do.end24, %entry
  ret void
}

; Function Attrs: noinline nounwind
define void @run_unwind_protects() #0 {
entry:
  %0 = load %union.uwp*, %union.uwp** @unwind_protect_list, align 4
  %tobool = icmp ne %union.uwp* %0, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @without_interrupts(void (...)* bitcast (void (i8*, i8*)* @run_unwind_protects_internal to void (...)*), i8* null, i8* null)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

; Function Attrs: noinline nounwind
define internal void @run_unwind_protects_internal(i8* %ignore1, i8* %ignore2) #0 {
entry:
  %ignore1.addr = alloca i8*, align 4
  %ignore2.addr = alloca i8*, align 4
  store i8* %ignore1, i8** %ignore1.addr, align 4
  store i8* %ignore2, i8** %ignore2.addr, align 4
  call void @unwind_frame_run_internal(i8* null, i8* null)
  ret void
}

; Function Attrs: noinline nounwind
define void @clear_unwind_protect_list(i32 %flags) #0 {
entry:
  %flags.addr = alloca i32, align 4
  %flag = alloca i8*, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %0 = load %union.uwp*, %union.uwp** @unwind_protect_list, align 4
  %tobool = icmp ne %union.uwp* %0, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %flags.addr, align 4
  %tobool1 = icmp ne i32 %1, 0
  %cond = select i1 %tobool1, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.1, i32 0, i32 0), i8* null
  store i8* %cond, i8** %flag, align 4
  %2 = load i8*, i8** %flag, align 4
  call void @without_interrupts(void (...)* bitcast (void (i8*, i8*)* @clear_unwind_protects_internal to void (...)*), i8* %2, i8* null)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

; Function Attrs: noinline nounwind
define internal void @clear_unwind_protects_internal(i8* %flag, i8* %ignore) #0 {
entry:
  %flag.addr = alloca i8*, align 4
  %ignore.addr = alloca i8*, align 4
  store i8* %flag, i8** %flag.addr, align 4
  store i8* %ignore, i8** %ignore.addr, align 4
  %0 = load i8*, i8** %flag.addr, align 4
  %tobool = icmp ne i8* %0, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.then
  %1 = load %union.uwp*, %union.uwp** @unwind_protect_list, align 4
  %tobool1 = icmp ne %union.uwp* %1, null
  br i1 %tobool1, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  call void @remove_unwind_protect_internal(i8* null, i8* null)
  br label %while.cond

while.end:                                        ; preds = %while.cond
  br label %if.end

if.end:                                           ; preds = %while.end, %entry
  store %union.uwp* null, %union.uwp** @unwind_protect_list, align 4
  ret void
}

; Function Attrs: noinline nounwind
define i32 @have_unwind_protects() #0 {
entry:
  %0 = load %union.uwp*, %union.uwp** @unwind_protect_list, align 4
  %cmp = icmp ne %union.uwp* %0, null
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

; Function Attrs: noinline nounwind
define i32 @unwind_protect_tag_on_stack(i8* %tag) #0 {
entry:
  %retval = alloca i32, align 4
  %tag.addr = alloca i8*, align 4
  %elt = alloca %union.uwp*, align 4
  store i8* %tag, i8** %tag.addr, align 4
  %0 = load %union.uwp*, %union.uwp** @unwind_protect_list, align 4
  store %union.uwp* %0, %union.uwp** %elt, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end, %entry
  %1 = load %union.uwp*, %union.uwp** %elt, align 4
  %tobool = icmp ne %union.uwp* %1, null
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %2 = load %union.uwp*, %union.uwp** %elt, align 4
  %head = bitcast %union.uwp* %2 to %struct.uwp_head*
  %cleanup = getelementptr inbounds %struct.uwp_head, %struct.uwp_head* %head, i32 0, i32 1
  %3 = load i32 (...)*, i32 (...)** %cleanup, align 4
  %cmp = icmp eq i32 (...)* %3, null
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %while.body
  %4 = load %union.uwp*, %union.uwp** %elt, align 4
  %arg = bitcast %union.uwp* %4 to %struct.anon*
  %v = getelementptr inbounds %struct.anon, %struct.anon* %arg, i32 0, i32 1
  %5 = load i8*, i8** %v, align 4
  %arrayidx = getelementptr inbounds i8, i8* %5, i32 0
  %6 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %6 to i32
  %7 = load i8*, i8** %tag.addr, align 4
  %arrayidx1 = getelementptr inbounds i8, i8* %7, i32 0
  %8 = load i8, i8* %arrayidx1, align 1
  %conv2 = sext i8 %8 to i32
  %cmp3 = icmp eq i32 %conv, %conv2
  br i1 %cmp3, label %land.lhs.true5, label %if.end

land.lhs.true5:                                   ; preds = %land.lhs.true
  %9 = load %union.uwp*, %union.uwp** %elt, align 4
  %arg6 = bitcast %union.uwp* %9 to %struct.anon*
  %v7 = getelementptr inbounds %struct.anon, %struct.anon* %arg6, i32 0, i32 1
  %10 = load i8*, i8** %v7, align 4
  %11 = load i8*, i8** %tag.addr, align 4
  %call = call i32 @strcmp(i8* %10, i8* %11)
  %cmp8 = icmp eq i32 %call, 0
  br i1 %cmp8, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true5
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %land.lhs.true5, %land.lhs.true, %while.body
  %12 = load %union.uwp*, %union.uwp** %elt, align 4
  %head10 = bitcast %union.uwp* %12 to %struct.uwp_head*
  %next = getelementptr inbounds %struct.uwp_head, %struct.uwp_head* %head10, i32 0, i32 0
  %13 = load %union.uwp*, %union.uwp** %next, align 4
  store %union.uwp* %13, %union.uwp** %elt, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %while.end, %if.then
  %14 = load i32, i32* %retval, align 4
  ret i32 %14
}

declare i32 @strcmp(i8*, i8*) #1

; Function Attrs: noinline nounwind
define void @unwind_protect_mem(i8* %var, i32 %size) #0 {
entry:
  %var.addr = alloca i8*, align 4
  %size.addr = alloca i32, align 4
  store i8* %var, i8** %var.addr, align 4
  store i32 %size, i32* %size.addr, align 4
  %0 = load i8*, i8** %var.addr, align 4
  %1 = bitcast i32* %size.addr to i8*
  call void @without_interrupts(void (...)* bitcast (void (i8*, i8*)* @unwind_protect_mem_internal to void (...)*), i8* %0, i8* %1)
  ret void
}

; Function Attrs: noinline nounwind
define internal void @unwind_protect_mem_internal(i8* %var, i8* %psize) #0 {
entry:
  %var.addr = alloca i8*, align 4
  %psize.addr = alloca i8*, align 4
  %size = alloca i32, align 4
  %allocated = alloca i32, align 4
  %elt = alloca %union.uwp*, align 4
  store i8* %var, i8** %var.addr, align 4
  store i8* %psize, i8** %psize.addr, align 4
  %0 = load i8*, i8** %psize.addr, align 4
  %1 = bitcast i8* %0 to i32*
  %2 = load i32, i32* %1, align 4
  store i32 %2, i32* %size, align 4
  %3 = load i32, i32* %size, align 4
  %add = add i32 %3, 16
  store i32 %add, i32* %allocated, align 4
  %4 = load i32, i32* %allocated, align 4
  %call = call i8* @sh_xmalloc(i32 %4, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 352)
  %5 = bitcast i8* %call to %union.uwp*
  store %union.uwp* %5, %union.uwp** %elt, align 4
  %6 = load %union.uwp*, %union.uwp** @unwind_protect_list, align 4
  %7 = load %union.uwp*, %union.uwp** %elt, align 4
  %head = bitcast %union.uwp* %7 to %struct.uwp_head*
  %next = getelementptr inbounds %struct.uwp_head, %struct.uwp_head* %head, i32 0, i32 0
  store %union.uwp* %6, %union.uwp** %next, align 4
  %8 = load %union.uwp*, %union.uwp** %elt, align 4
  %head1 = bitcast %union.uwp* %8 to %struct.uwp_head*
  %cleanup = getelementptr inbounds %struct.uwp_head, %struct.uwp_head* %head1, i32 0, i32 1
  store i32 (...)* bitcast (void (%struct.SAVED_VAR*)* @restore_variable to i32 (...)*), i32 (...)** %cleanup, align 4
  %9 = load i8*, i8** %var.addr, align 4
  %10 = load %union.uwp*, %union.uwp** %elt, align 4
  %sv = bitcast %union.uwp* %10 to %struct.anon.0*
  %v = getelementptr inbounds %struct.anon.0, %struct.anon.0* %sv, i32 0, i32 1
  %variable = getelementptr inbounds %struct.SAVED_VAR, %struct.SAVED_VAR* %v, i32 0, i32 0
  store i8* %9, i8** %variable, align 4
  %11 = load i32, i32* %size, align 4
  %12 = load %union.uwp*, %union.uwp** %elt, align 4
  %sv2 = bitcast %union.uwp* %12 to %struct.anon.0*
  %v3 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %sv2, i32 0, i32 1
  %size4 = getelementptr inbounds %struct.SAVED_VAR, %struct.SAVED_VAR* %v3, i32 0, i32 1
  store i32 %11, i32* %size4, align 4
  %13 = load %union.uwp*, %union.uwp** %elt, align 4
  %sv5 = bitcast %union.uwp* %13 to %struct.anon.0*
  %v6 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %sv5, i32 0, i32 1
  %desired_setting = getelementptr inbounds %struct.SAVED_VAR, %struct.SAVED_VAR* %v6, i32 0, i32 2
  %arraydecay = getelementptr inbounds [1 x i8], [1 x i8]* %desired_setting, i32 0, i32 0
  %14 = load i8*, i8** %var.addr, align 4
  %15 = load i32, i32* %size, align 4
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %arraydecay, i8* %14, i32 %15, i32 1, i1 false)
  %16 = load %union.uwp*, %union.uwp** %elt, align 4
  store %union.uwp* %16, %union.uwp** @unwind_protect_list, align 4
  ret void
}

declare void @sh_xfree(i8*, i8*, i32) #1

declare void @internal_warning(i8*, ...) #1

; Function Attrs: noinline nounwind
define internal void @restore_variable(%struct.SAVED_VAR* %sv) #0 {
entry:
  %sv.addr = alloca %struct.SAVED_VAR*, align 4
  store %struct.SAVED_VAR* %sv, %struct.SAVED_VAR** %sv.addr, align 4
  %0 = load %struct.SAVED_VAR*, %struct.SAVED_VAR** %sv.addr, align 4
  %variable = getelementptr inbounds %struct.SAVED_VAR, %struct.SAVED_VAR* %0, i32 0, i32 0
  %1 = load i8*, i8** %variable, align 4
  %2 = load %struct.SAVED_VAR*, %struct.SAVED_VAR** %sv.addr, align 4
  %desired_setting = getelementptr inbounds %struct.SAVED_VAR, %struct.SAVED_VAR* %2, i32 0, i32 2
  %arraydecay = getelementptr inbounds [1 x i8], [1 x i8]* %desired_setting, i32 0, i32 0
  %3 = load %struct.SAVED_VAR*, %struct.SAVED_VAR** %sv.addr, align 4
  %size = getelementptr inbounds %struct.SAVED_VAR, %struct.SAVED_VAR* %3, i32 0, i32 1
  %4 = load i32, i32* %size, align 4
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %1, i8* %arraydecay, i32 %4, i32 1, i1 false)
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* nocapture writeonly, i8* nocapture readonly, i32, i32, i1) #2

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
