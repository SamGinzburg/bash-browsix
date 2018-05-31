; ModuleID = 'pathexp.c'
source_filename = "pathexp.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.ignorevar = type { i8*, %struct.ign*, i32, i8*, i32 (%struct.ign*)* }
%struct.ign = type { i8*, i32, i32 }
%struct.__mbstate_t = type { i32, i32 }

@extended_glob = global i32 0, align 4
@glob_star = global i32 0, align 4
@locale_mb_cur_max = external global i32, align 4
@.str = private unnamed_addr constant [10 x i8] c"pathexp.c\00", align 1
@glob_dot_filenames = common global i32 0, align 4
@noglob_dot_filenames = external global i32, align 4
@glob_error_return = external global i8*, align 4
@globignore = internal global %struct.ignorevar { i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i32 0, i32 0), %struct.ign* null, i32 0, i8* null, i32 (%struct.ign*)* null }, align 4
@is_basic_table = external constant [0 x i32], align 4
@.str.1 = private unnamed_addr constant [11 x i8] c"GLOBIGNORE\00", align 1
@glob_ignore_case = external global i32, align 4
@.str.2 = private unnamed_addr constant [2 x i8] c":\00", align 1

; Function Attrs: noinline nounwind
define i32 @unquoted_glob_pattern_p(i8* %string) #0 {
entry:
  %retval = alloca i32, align 4
  %string.addr = alloca i8*, align 4
  %c = alloca i32, align 4
  %send = alloca i8*, align 4
  %open = alloca i32, align 4
  %state = alloca %struct.__mbstate_t, align 4
  %state_bak = alloca %struct.__mbstate_t, align 4
  %mblength = alloca i32, align 4
  %_f = alloca i32, align 4
  store i8* %string, i8** %string.addr, align 4
  %0 = bitcast %struct.__mbstate_t* %state to i8*
  call void @llvm.memset.p0i8.i32(i8* %0, i8 0, i32 8, i32 4, i1 false)
  store i32 0, i32* %open, align 4
  %1 = load i8*, i8** %string.addr, align 4
  %2 = load i8*, i8** %string.addr, align 4
  %call = call i32 @strlen(i8* %2)
  %add.ptr = getelementptr inbounds i8, i8* %1, i32 %call
  store i8* %add.ptr, i8** %send, align 4
  br label %while.cond

while.cond:                                       ; preds = %do.end, %if.end8, %if.end, %sw.bb1, %entry
  %3 = load i8*, i8** %string.addr, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %3, i32 1
  store i8* %incdec.ptr, i8** %string.addr, align 4
  %4 = load i8, i8* %3, align 1
  %conv = sext i8 %4 to i32
  store i32 %conv, i32* %c, align 4
  %tobool = icmp ne i32 %conv, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %5 = load i32, i32* %c, align 4
  switch i32 %5, label %sw.epilog [
    i32 63, label %sw.bb
    i32 42, label %sw.bb
    i32 91, label %sw.bb1
    i32 93, label %sw.bb2
    i32 43, label %sw.bb4
    i32 64, label %sw.bb4
    i32 33, label %sw.bb4
    i32 1, label %sw.bb9
    i32 92, label %sw.bb9
  ]

sw.bb:                                            ; preds = %while.body, %while.body
  store i32 1, i32* %retval, align 4
  br label %return

sw.bb1:                                           ; preds = %while.body
  %6 = load i32, i32* %open, align 4
  %inc = add nsw i32 %6, 1
  store i32 %inc, i32* %open, align 4
  br label %while.cond

sw.bb2:                                           ; preds = %while.body
  %7 = load i32, i32* %open, align 4
  %tobool3 = icmp ne i32 %7, 0
  br i1 %tobool3, label %if.then, label %if.end

if.then:                                          ; preds = %sw.bb2
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %sw.bb2
  br label %while.cond

sw.bb4:                                           ; preds = %while.body, %while.body, %while.body
  %8 = load i8*, i8** %string.addr, align 4
  %9 = load i8, i8* %8, align 1
  %conv5 = sext i8 %9 to i32
  %cmp = icmp eq i32 %conv5, 40
  br i1 %cmp, label %if.then7, label %if.end8

if.then7:                                         ; preds = %sw.bb4
  store i32 1, i32* %retval, align 4
  br label %return

if.end8:                                          ; preds = %sw.bb4
  br label %while.cond

sw.bb9:                                           ; preds = %while.body, %while.body
  %10 = load i8*, i8** %string.addr, align 4
  %incdec.ptr10 = getelementptr inbounds i8, i8* %10, i32 1
  store i8* %incdec.ptr10, i8** %string.addr, align 4
  %11 = load i8, i8* %10, align 1
  %conv11 = sext i8 %11 to i32
  %cmp12 = icmp eq i32 %conv11, 0
  br i1 %cmp12, label %if.then14, label %if.end15

if.then14:                                        ; preds = %sw.bb9
  store i32 0, i32* %retval, align 4
  br label %return

if.end15:                                         ; preds = %sw.bb9
  br label %sw.epilog

sw.epilog:                                        ; preds = %if.end15, %while.body
  %12 = load i8*, i8** %string.addr, align 4
  %incdec.ptr16 = getelementptr inbounds i8, i8* %12, i32 -1
  store i8* %incdec.ptr16, i8** %string.addr, align 4
  br label %do.body

do.body:                                          ; preds = %sw.epilog
  %13 = load i32, i32* @locale_mb_cur_max, align 4
  %cmp17 = icmp sgt i32 %13, 1
  br i1 %cmp17, label %if.then19, label %if.end35

if.then19:                                        ; preds = %do.body
  %14 = load i8*, i8** %string.addr, align 4
  %15 = load i8, i8* %14, align 1
  %call20 = call i32 @is_basic(i8 signext %15)
  store i32 %call20, i32* %_f, align 4
  %16 = load i32, i32* %_f, align 4
  %tobool21 = icmp ne i32 %16, 0
  br i1 %tobool21, label %if.then22, label %if.else

if.then22:                                        ; preds = %if.then19
  store i32 1, i32* %mblength, align 4
  br label %if.end24

if.else:                                          ; preds = %if.then19
  %17 = bitcast %struct.__mbstate_t* %state_bak to i8*
  %18 = bitcast %struct.__mbstate_t* %state to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %17, i8* %18, i32 8, i32 4, i1 false)
  %19 = load i8*, i8** %string.addr, align 4
  %20 = load i8*, i8** %send, align 4
  %21 = load i8*, i8** %string.addr, align 4
  %sub.ptr.lhs.cast = ptrtoint i8* %20 to i32
  %sub.ptr.rhs.cast = ptrtoint i8* %21 to i32
  %sub.ptr.sub = sub i32 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %call23 = call i32 @mbrlen(i8* %19, i32 %sub.ptr.sub, %struct.__mbstate_t* %state)
  store i32 %call23, i32* %mblength, align 4
  br label %if.end24

if.end24:                                         ; preds = %if.else, %if.then22
  %22 = load i32, i32* %mblength, align 4
  %cmp25 = icmp eq i32 %22, -2
  br i1 %cmp25, label %if.then29, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end24
  %23 = load i32, i32* %mblength, align 4
  %cmp27 = icmp eq i32 %23, -1
  br i1 %cmp27, label %if.then29, label %if.else30

if.then29:                                        ; preds = %lor.lhs.false, %if.end24
  %24 = bitcast %struct.__mbstate_t* %state to i8*
  %25 = bitcast %struct.__mbstate_t* %state_bak to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %24, i8* %25, i32 8, i32 4, i1 false)
  store i32 1, i32* %mblength, align 4
  br label %if.end34

if.else30:                                        ; preds = %lor.lhs.false
  %26 = load i32, i32* %mblength, align 4
  %cmp31 = icmp ult i32 %26, 1
  br i1 %cmp31, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.else30
  br label %cond.end

cond.false:                                       ; preds = %if.else30
  %27 = load i32, i32* %mblength, align 4
  %sub = sub i32 %27, 1
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 0, %cond.true ], [ %sub, %cond.false ]
  %28 = load i8*, i8** %string.addr, align 4
  %add.ptr33 = getelementptr inbounds i8, i8* %28, i32 %cond
  store i8* %add.ptr33, i8** %string.addr, align 4
  br label %if.end34

if.end34:                                         ; preds = %cond.end, %if.then29
  br label %if.end35

if.end35:                                         ; preds = %if.end34, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end35
  %29 = load i8*, i8** %string.addr, align 4
  %incdec.ptr36 = getelementptr inbounds i8, i8* %29, i32 1
  store i8* %incdec.ptr36, i8** %string.addr, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %while.end, %if.then14, %if.then7, %if.then, %sw.bb
  %30 = load i32, i32* %retval, align 4
  ret i32 %30
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #1

declare i32 @strlen(i8*) #2

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
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* nocapture writeonly, i8* nocapture readonly, i32, i32, i1) #1

declare i32 @mbrlen(i8*, i32, %struct.__mbstate_t*) #2

; Function Attrs: noinline nounwind
define i32 @glob_char_p(i8* %s) #0 {
entry:
  %retval = alloca i32, align 4
  %s.addr = alloca i8*, align 4
  store i8* %s, i8** %s.addr, align 4
  %0 = load i8*, i8** %s.addr, align 4
  %1 = load i8, i8* %0, align 1
  %conv = sext i8 %1 to i32
  switch i32 %conv, label %sw.epilog [
    i32 42, label %sw.bb
    i32 91, label %sw.bb
    i32 93, label %sw.bb
    i32 63, label %sw.bb
    i32 92, label %sw.bb
    i32 43, label %sw.bb1
    i32 64, label %sw.bb1
    i32 33, label %sw.bb1
  ]

sw.bb:                                            ; preds = %entry, %entry, %entry, %entry, %entry
  store i32 1, i32* %retval, align 4
  br label %return

sw.bb1:                                           ; preds = %entry, %entry, %entry
  %2 = load i8*, i8** %s.addr, align 4
  %arrayidx = getelementptr inbounds i8, i8* %2, i32 1
  %3 = load i8, i8* %arrayidx, align 1
  %conv2 = sext i8 %3 to i32
  %cmp = icmp eq i32 %conv2, 40
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %sw.bb1
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %sw.bb1
  br label %sw.epilog

sw.epilog:                                        ; preds = %entry, %if.end
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %sw.epilog, %if.then, %sw.bb
  %4 = load i32, i32* %retval, align 4
  ret i32 %4
}

; Function Attrs: noinline nounwind
define i8* @quote_string_for_globbing(i8* %pathname, i32 %qflags) #0 {
entry:
  %retval = alloca i8*, align 4
  %pathname.addr = alloca i8*, align 4
  %qflags.addr = alloca i32, align 4
  %temp = alloca i8*, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %brack = alloca i32, align 4
  %cclass = alloca i32, align 4
  %collsym = alloca i32, align 4
  %equiv = alloca i32, align 4
  %c = alloca i32, align 4
  %last_was_backslash = alloca i32, align 4
  %savei = alloca i32, align 4
  %savej = alloca i32, align 4
  store i8* %pathname, i8** %pathname.addr, align 4
  store i32 %qflags, i32* %qflags.addr, align 4
  %0 = load i8*, i8** %pathname.addr, align 4
  %call = call i32 @strlen(i8* %0)
  %mul = mul i32 2, %call
  %add = add i32 %mul, 1
  %call1 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i32 0, i32 0), i32 189)
  store i8* %call1, i8** %temp, align 4
  %1 = load i32, i32* %qflags.addr, align 4
  %and = and i32 %1, 1
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %2 = load i8*, i8** %pathname.addr, align 4
  %arrayidx = getelementptr inbounds i8, i8* %2, i32 0
  %3 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %3 to i32
  %cmp = icmp eq i32 %conv, 127
  br i1 %cmp, label %land.lhs.true3, label %if.end

land.lhs.true3:                                   ; preds = %land.lhs.true
  %4 = load i8*, i8** %pathname.addr, align 4
  %arrayidx4 = getelementptr inbounds i8, i8* %4, i32 1
  %5 = load i8, i8* %arrayidx4, align 1
  %conv5 = sext i8 %5 to i32
  %cmp6 = icmp eq i32 %conv5, 0
  br i1 %cmp6, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true3
  %6 = load i8*, i8** %temp, align 4
  %arrayidx8 = getelementptr inbounds i8, i8* %6, i32 0
  store i8 0, i8* %arrayidx8, align 1
  %7 = load i8*, i8** %temp, align 4
  store i8* %7, i8** %retval, align 4
  br label %return

if.end:                                           ; preds = %land.lhs.true3, %land.lhs.true, %entry
  store i32 0, i32* %last_was_backslash, align 4
  store i32 0, i32* %equiv, align 4
  store i32 0, i32* %collsym, align 4
  store i32 0, i32* %cclass, align 4
  store i32 0, i32* %brack, align 4
  store i32 0, i32* %j, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %8 = load i8*, i8** %pathname.addr, align 4
  %9 = load i32, i32* %i, align 4
  %arrayidx9 = getelementptr inbounds i8, i8* %8, i32 %9
  %10 = load i8, i8* %arrayidx9, align 1
  %tobool10 = icmp ne i8 %10, 0
  br i1 %tobool10, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %11 = load i8*, i8** %pathname.addr, align 4
  %12 = load i32, i32* %i, align 4
  %arrayidx11 = getelementptr inbounds i8, i8* %11, i32 %12
  %13 = load i8, i8* %arrayidx11, align 1
  %conv12 = sext i8 %13 to i32
  %cmp13 = icmp eq i32 %conv12, 1
  br i1 %cmp13, label %land.lhs.true15, label %if.else

land.lhs.true15:                                  ; preds = %for.body
  %14 = load i8*, i8** %pathname.addr, align 4
  %15 = load i32, i32* %i, align 4
  %add16 = add nsw i32 %15, 1
  %arrayidx17 = getelementptr inbounds i8, i8* %14, i32 %add16
  %16 = load i8, i8* %arrayidx17, align 1
  %conv18 = sext i8 %16 to i32
  %cmp19 = icmp eq i32 %conv18, 0
  br i1 %cmp19, label %if.then21, label %if.else

if.then21:                                        ; preds = %land.lhs.true15
  %17 = load i8*, i8** %pathname.addr, align 4
  %18 = load i32, i32* %i, align 4
  %inc = add nsw i32 %18, 1
  store i32 %inc, i32* %i, align 4
  %arrayidx22 = getelementptr inbounds i8, i8* %17, i32 %18
  %19 = load i8, i8* %arrayidx22, align 1
  %20 = load i8*, i8** %temp, align 4
  %21 = load i32, i32* %j, align 4
  %inc23 = add nsw i32 %21, 1
  store i32 %inc23, i32* %j, align 4
  %arrayidx24 = getelementptr inbounds i8, i8* %20, i32 %21
  store i8 %19, i8* %arrayidx24, align 1
  br label %for.end

if.else:                                          ; preds = %land.lhs.true15, %for.body
  %22 = load i32, i32* %qflags.addr, align 4
  %and25 = and i32 %22, 4
  %tobool26 = icmp ne i32 %and25, 0
  br i1 %tobool26, label %land.lhs.true27, label %if.else43

land.lhs.true27:                                  ; preds = %if.else
  %23 = load i8*, i8** %pathname.addr, align 4
  %24 = load i32, i32* %i, align 4
  %arrayidx28 = getelementptr inbounds i8, i8* %23, i32 %24
  %25 = load i8, i8* %arrayidx28, align 1
  %conv29 = sext i8 %25 to i32
  %cmp30 = icmp eq i32 %conv29, 1
  br i1 %cmp30, label %land.lhs.true32, label %if.else43

land.lhs.true32:                                  ; preds = %land.lhs.true27
  %26 = load i8*, i8** %pathname.addr, align 4
  %27 = load i32, i32* %i, align 4
  %add33 = add nsw i32 %27, 1
  %arrayidx34 = getelementptr inbounds i8, i8* %26, i32 %add33
  %28 = load i8, i8* %arrayidx34, align 1
  %conv35 = sext i8 %28 to i32
  %cmp36 = icmp eq i32 %conv35, 1
  br i1 %cmp36, label %if.then38, label %if.else43

if.then38:                                        ; preds = %land.lhs.true32
  %29 = load i32, i32* %i, align 4
  %inc39 = add nsw i32 %29, 1
  store i32 %inc39, i32* %i, align 4
  %30 = load i8*, i8** %pathname.addr, align 4
  %31 = load i32, i32* %i, align 4
  %arrayidx40 = getelementptr inbounds i8, i8* %30, i32 %31
  %32 = load i8, i8* %arrayidx40, align 1
  %33 = load i8*, i8** %temp, align 4
  %34 = load i32, i32* %j, align 4
  %inc41 = add nsw i32 %34, 1
  store i32 %inc41, i32* %j, align 4
  %arrayidx42 = getelementptr inbounds i8, i8* %33, i32 %34
  store i8 %32, i8* %arrayidx42, align 1
  br label %for.inc

if.else43:                                        ; preds = %land.lhs.true32, %land.lhs.true27, %if.else
  %35 = load i8*, i8** %pathname.addr, align 4
  %36 = load i32, i32* %i, align 4
  %arrayidx44 = getelementptr inbounds i8, i8* %35, i32 %36
  %37 = load i8, i8* %arrayidx44, align 1
  %conv45 = sext i8 %37 to i32
  %cmp46 = icmp eq i32 %conv45, 1
  br i1 %cmp46, label %if.then48, label %if.else85

if.then48:                                        ; preds = %if.else43
  %38 = load i32, i32* %qflags.addr, align 4
  %and49 = and i32 %38, 2
  %tobool50 = icmp ne i32 %and49, 0
  br i1 %tobool50, label %land.lhs.true51, label %if.end58

land.lhs.true51:                                  ; preds = %if.then48
  %39 = load i8*, i8** %pathname.addr, align 4
  %40 = load i32, i32* %i, align 4
  %add52 = add nsw i32 %40, 1
  %arrayidx53 = getelementptr inbounds i8, i8* %39, i32 %add52
  %41 = load i8, i8* %arrayidx53, align 1
  %conv54 = sext i8 %41 to i32
  %cmp55 = icmp eq i32 %conv54, 47
  br i1 %cmp55, label %if.then57, label %if.end58

if.then57:                                        ; preds = %land.lhs.true51
  br label %for.inc

if.end58:                                         ; preds = %land.lhs.true51, %if.then48
  %42 = load i8*, i8** %pathname.addr, align 4
  %43 = load i32, i32* %i, align 4
  %add59 = add nsw i32 %43, 1
  %arrayidx60 = getelementptr inbounds i8, i8* %42, i32 %add59
  %44 = load i8, i8* %arrayidx60, align 1
  %conv61 = sext i8 %44 to i32
  %cmp62 = icmp ne i32 %conv61, 1
  br i1 %cmp62, label %land.lhs.true64, label %if.end75

land.lhs.true64:                                  ; preds = %if.end58
  %45 = load i32, i32* %qflags.addr, align 4
  %and65 = and i32 %45, 4
  %tobool66 = icmp ne i32 %and65, 0
  br i1 %tobool66, label %land.lhs.true67, label %if.end75

land.lhs.true67:                                  ; preds = %land.lhs.true64
  %46 = load i8*, i8** %pathname.addr, align 4
  %47 = load i32, i32* %i, align 4
  %add68 = add nsw i32 %47, 1
  %arrayidx69 = getelementptr inbounds i8, i8* %46, i32 %add68
  %48 = load i8, i8* %arrayidx69, align 1
  %conv70 = sext i8 %48 to i32
  %call71 = call i32 @ere_char(i32 %conv70)
  %cmp72 = icmp eq i32 %call71, 0
  br i1 %cmp72, label %if.then74, label %if.end75

if.then74:                                        ; preds = %land.lhs.true67
  br label %for.inc

if.end75:                                         ; preds = %land.lhs.true67, %land.lhs.true64, %if.end58
  %49 = load i8*, i8** %temp, align 4
  %50 = load i32, i32* %j, align 4
  %inc76 = add nsw i32 %50, 1
  store i32 %inc76, i32* %j, align 4
  %arrayidx77 = getelementptr inbounds i8, i8* %49, i32 %50
  store i8 92, i8* %arrayidx77, align 1
  %51 = load i32, i32* %i, align 4
  %inc78 = add nsw i32 %51, 1
  store i32 %inc78, i32* %i, align 4
  %52 = load i8*, i8** %pathname.addr, align 4
  %53 = load i32, i32* %i, align 4
  %arrayidx79 = getelementptr inbounds i8, i8* %52, i32 %53
  %54 = load i8, i8* %arrayidx79, align 1
  %conv80 = sext i8 %54 to i32
  %cmp81 = icmp eq i32 %conv80, 0
  br i1 %cmp81, label %if.then83, label %if.end84

if.then83:                                        ; preds = %if.end75
  br label %for.end

if.end84:                                         ; preds = %if.end75
  br label %if.end305

if.else85:                                        ; preds = %if.else43
  %55 = load i32, i32* %qflags.addr, align 4
  %and86 = and i32 %55, 4
  %tobool87 = icmp ne i32 %and86, 0
  br i1 %tobool87, label %land.lhs.true88, label %if.else274

land.lhs.true88:                                  ; preds = %if.else85
  %56 = load i32, i32* %i, align 4
  %cmp89 = icmp eq i32 %56, 0
  br i1 %cmp89, label %land.lhs.true95, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true88
  %57 = load i8*, i8** %pathname.addr, align 4
  %58 = load i32, i32* %i, align 4
  %sub = sub nsw i32 %58, 1
  %arrayidx91 = getelementptr inbounds i8, i8* %57, i32 %sub
  %59 = load i8, i8* %arrayidx91, align 1
  %conv92 = sext i8 %59 to i32
  %cmp93 = icmp ne i32 %conv92, 1
  br i1 %cmp93, label %land.lhs.true95, label %if.else274

land.lhs.true95:                                  ; preds = %lor.lhs.false, %land.lhs.true88
  %60 = load i8*, i8** %pathname.addr, align 4
  %61 = load i32, i32* %i, align 4
  %arrayidx96 = getelementptr inbounds i8, i8* %60, i32 %61
  %62 = load i8, i8* %arrayidx96, align 1
  %conv97 = sext i8 %62 to i32
  %cmp98 = icmp eq i32 %conv97, 91
  br i1 %cmp98, label %if.then100, label %if.else274

if.then100:                                       ; preds = %land.lhs.true95
  store i32 1, i32* %brack, align 4
  %63 = load i8*, i8** %pathname.addr, align 4
  %64 = load i32, i32* %i, align 4
  %inc101 = add nsw i32 %64, 1
  store i32 %inc101, i32* %i, align 4
  %arrayidx102 = getelementptr inbounds i8, i8* %63, i32 %64
  %65 = load i8, i8* %arrayidx102, align 1
  %66 = load i8*, i8** %temp, align 4
  %67 = load i32, i32* %j, align 4
  %inc103 = add nsw i32 %67, 1
  store i32 %inc103, i32* %j, align 4
  %arrayidx104 = getelementptr inbounds i8, i8* %66, i32 %67
  store i8 %65, i8* %arrayidx104, align 1
  %68 = load i32, i32* %j, align 4
  store i32 %68, i32* %savej, align 4
  %69 = load i32, i32* %i, align 4
  store i32 %69, i32* %savei, align 4
  %70 = load i8*, i8** %pathname.addr, align 4
  %71 = load i32, i32* %i, align 4
  %inc105 = add nsw i32 %71, 1
  store i32 %inc105, i32* %i, align 4
  %arrayidx106 = getelementptr inbounds i8, i8* %70, i32 %71
  %72 = load i8, i8* %arrayidx106, align 1
  %conv107 = sext i8 %72 to i32
  store i32 %conv107, i32* %c, align 4
  br label %do.body

do.body:                                          ; preds = %land.end, %if.then100
  %73 = load i32, i32* %c, align 4
  %cmp108 = icmp eq i32 %73, 0
  br i1 %cmp108, label %if.then110, label %if.else111

if.then110:                                       ; preds = %do.body
  br label %endpat

if.else111:                                       ; preds = %do.body
  %74 = load i32, i32* %c, align 4
  %cmp112 = icmp eq i32 %74, 1
  br i1 %cmp112, label %if.then114, label %if.else125

if.then114:                                       ; preds = %if.else111
  %75 = load i8*, i8** %pathname.addr, align 4
  %76 = load i32, i32* %i, align 4
  %arrayidx115 = getelementptr inbounds i8, i8* %75, i32 %76
  %77 = load i8, i8* %arrayidx115, align 1
  %conv116 = sext i8 %77 to i32
  %cmp117 = icmp eq i32 %conv116, 0
  br i1 %cmp117, label %if.then119, label %if.end120

if.then119:                                       ; preds = %if.then114
  br label %endpat

if.end120:                                        ; preds = %if.then114
  %78 = load i8*, i8** %pathname.addr, align 4
  %79 = load i32, i32* %i, align 4
  %inc121 = add nsw i32 %79, 1
  store i32 %inc121, i32* %i, align 4
  %arrayidx122 = getelementptr inbounds i8, i8* %78, i32 %79
  %80 = load i8, i8* %arrayidx122, align 1
  %81 = load i8*, i8** %temp, align 4
  %82 = load i32, i32* %j, align 4
  %inc123 = add nsw i32 %82, 1
  store i32 %inc123, i32* %j, align 4
  %arrayidx124 = getelementptr inbounds i8, i8* %81, i32 %82
  store i8 %80, i8* %arrayidx124, align 1
  br label %if.end257

if.else125:                                       ; preds = %if.else111
  %83 = load i32, i32* %c, align 4
  %cmp126 = icmp eq i32 %83, 91
  br i1 %cmp126, label %land.lhs.true128, label %if.else141

land.lhs.true128:                                 ; preds = %if.else125
  %84 = load i8*, i8** %pathname.addr, align 4
  %85 = load i32, i32* %i, align 4
  %arrayidx129 = getelementptr inbounds i8, i8* %84, i32 %85
  %86 = load i8, i8* %arrayidx129, align 1
  %conv130 = sext i8 %86 to i32
  %cmp131 = icmp eq i32 %conv130, 58
  br i1 %cmp131, label %if.then133, label %if.else141

if.then133:                                       ; preds = %land.lhs.true128
  %87 = load i32, i32* %c, align 4
  %conv134 = trunc i32 %87 to i8
  %88 = load i8*, i8** %temp, align 4
  %89 = load i32, i32* %j, align 4
  %inc135 = add nsw i32 %89, 1
  store i32 %inc135, i32* %j, align 4
  %arrayidx136 = getelementptr inbounds i8, i8* %88, i32 %89
  store i8 %conv134, i8* %arrayidx136, align 1
  %90 = load i8*, i8** %pathname.addr, align 4
  %91 = load i32, i32* %i, align 4
  %inc137 = add nsw i32 %91, 1
  store i32 %inc137, i32* %i, align 4
  %arrayidx138 = getelementptr inbounds i8, i8* %90, i32 %91
  %92 = load i8, i8* %arrayidx138, align 1
  %93 = load i8*, i8** %temp, align 4
  %94 = load i32, i32* %j, align 4
  %inc139 = add nsw i32 %94, 1
  store i32 %inc139, i32* %j, align 4
  %arrayidx140 = getelementptr inbounds i8, i8* %93, i32 %94
  store i8 %92, i8* %arrayidx140, align 1
  store i32 1, i32* %cclass, align 4
  br label %if.end256

if.else141:                                       ; preds = %land.lhs.true128, %if.else125
  %95 = load i32, i32* %cclass, align 4
  %tobool142 = icmp ne i32 %95, 0
  br i1 %tobool142, label %land.lhs.true143, label %if.else159

land.lhs.true143:                                 ; preds = %if.else141
  %96 = load i32, i32* %c, align 4
  %cmp144 = icmp eq i32 %96, 58
  br i1 %cmp144, label %land.lhs.true146, label %if.else159

land.lhs.true146:                                 ; preds = %land.lhs.true143
  %97 = load i8*, i8** %pathname.addr, align 4
  %98 = load i32, i32* %i, align 4
  %arrayidx147 = getelementptr inbounds i8, i8* %97, i32 %98
  %99 = load i8, i8* %arrayidx147, align 1
  %conv148 = sext i8 %99 to i32
  %cmp149 = icmp eq i32 %conv148, 93
  br i1 %cmp149, label %if.then151, label %if.else159

if.then151:                                       ; preds = %land.lhs.true146
  %100 = load i32, i32* %c, align 4
  %conv152 = trunc i32 %100 to i8
  %101 = load i8*, i8** %temp, align 4
  %102 = load i32, i32* %j, align 4
  %inc153 = add nsw i32 %102, 1
  store i32 %inc153, i32* %j, align 4
  %arrayidx154 = getelementptr inbounds i8, i8* %101, i32 %102
  store i8 %conv152, i8* %arrayidx154, align 1
  %103 = load i8*, i8** %pathname.addr, align 4
  %104 = load i32, i32* %i, align 4
  %inc155 = add nsw i32 %104, 1
  store i32 %inc155, i32* %i, align 4
  %arrayidx156 = getelementptr inbounds i8, i8* %103, i32 %104
  %105 = load i8, i8* %arrayidx156, align 1
  %106 = load i8*, i8** %temp, align 4
  %107 = load i32, i32* %j, align 4
  %inc157 = add nsw i32 %107, 1
  store i32 %inc157, i32* %j, align 4
  %arrayidx158 = getelementptr inbounds i8, i8* %106, i32 %107
  store i8 %105, i8* %arrayidx158, align 1
  store i32 0, i32* %cclass, align 4
  br label %if.end255

if.else159:                                       ; preds = %land.lhs.true146, %land.lhs.true143, %if.else141
  %108 = load i32, i32* %c, align 4
  %cmp160 = icmp eq i32 %108, 91
  br i1 %cmp160, label %land.lhs.true162, label %if.else185

land.lhs.true162:                                 ; preds = %if.else159
  %109 = load i8*, i8** %pathname.addr, align 4
  %110 = load i32, i32* %i, align 4
  %arrayidx163 = getelementptr inbounds i8, i8* %109, i32 %110
  %111 = load i8, i8* %arrayidx163, align 1
  %conv164 = sext i8 %111 to i32
  %cmp165 = icmp eq i32 %conv164, 61
  br i1 %cmp165, label %if.then167, label %if.else185

if.then167:                                       ; preds = %land.lhs.true162
  %112 = load i32, i32* %c, align 4
  %conv168 = trunc i32 %112 to i8
  %113 = load i8*, i8** %temp, align 4
  %114 = load i32, i32* %j, align 4
  %inc169 = add nsw i32 %114, 1
  store i32 %inc169, i32* %j, align 4
  %arrayidx170 = getelementptr inbounds i8, i8* %113, i32 %114
  store i8 %conv168, i8* %arrayidx170, align 1
  %115 = load i8*, i8** %pathname.addr, align 4
  %116 = load i32, i32* %i, align 4
  %inc171 = add nsw i32 %116, 1
  store i32 %inc171, i32* %i, align 4
  %arrayidx172 = getelementptr inbounds i8, i8* %115, i32 %116
  %117 = load i8, i8* %arrayidx172, align 1
  %118 = load i8*, i8** %temp, align 4
  %119 = load i32, i32* %j, align 4
  %inc173 = add nsw i32 %119, 1
  store i32 %inc173, i32* %j, align 4
  %arrayidx174 = getelementptr inbounds i8, i8* %118, i32 %119
  store i8 %117, i8* %arrayidx174, align 1
  %120 = load i8*, i8** %pathname.addr, align 4
  %121 = load i32, i32* %i, align 4
  %arrayidx175 = getelementptr inbounds i8, i8* %120, i32 %121
  %122 = load i8, i8* %arrayidx175, align 1
  %conv176 = sext i8 %122 to i32
  %cmp177 = icmp eq i32 %conv176, 93
  br i1 %cmp177, label %if.then179, label %if.end184

if.then179:                                       ; preds = %if.then167
  %123 = load i8*, i8** %pathname.addr, align 4
  %124 = load i32, i32* %i, align 4
  %inc180 = add nsw i32 %124, 1
  store i32 %inc180, i32* %i, align 4
  %arrayidx181 = getelementptr inbounds i8, i8* %123, i32 %124
  %125 = load i8, i8* %arrayidx181, align 1
  %126 = load i8*, i8** %temp, align 4
  %127 = load i32, i32* %j, align 4
  %inc182 = add nsw i32 %127, 1
  store i32 %inc182, i32* %j, align 4
  %arrayidx183 = getelementptr inbounds i8, i8* %126, i32 %127
  store i8 %125, i8* %arrayidx183, align 1
  br label %if.end184

if.end184:                                        ; preds = %if.then179, %if.then167
  store i32 1, i32* %equiv, align 4
  br label %if.end254

if.else185:                                       ; preds = %land.lhs.true162, %if.else159
  %128 = load i32, i32* %equiv, align 4
  %tobool186 = icmp ne i32 %128, 0
  br i1 %tobool186, label %land.lhs.true187, label %if.else203

land.lhs.true187:                                 ; preds = %if.else185
  %129 = load i32, i32* %c, align 4
  %cmp188 = icmp eq i32 %129, 61
  br i1 %cmp188, label %land.lhs.true190, label %if.else203

land.lhs.true190:                                 ; preds = %land.lhs.true187
  %130 = load i8*, i8** %pathname.addr, align 4
  %131 = load i32, i32* %i, align 4
  %arrayidx191 = getelementptr inbounds i8, i8* %130, i32 %131
  %132 = load i8, i8* %arrayidx191, align 1
  %conv192 = sext i8 %132 to i32
  %cmp193 = icmp eq i32 %conv192, 93
  br i1 %cmp193, label %if.then195, label %if.else203

if.then195:                                       ; preds = %land.lhs.true190
  %133 = load i32, i32* %c, align 4
  %conv196 = trunc i32 %133 to i8
  %134 = load i8*, i8** %temp, align 4
  %135 = load i32, i32* %j, align 4
  %inc197 = add nsw i32 %135, 1
  store i32 %inc197, i32* %j, align 4
  %arrayidx198 = getelementptr inbounds i8, i8* %134, i32 %135
  store i8 %conv196, i8* %arrayidx198, align 1
  %136 = load i8*, i8** %pathname.addr, align 4
  %137 = load i32, i32* %i, align 4
  %inc199 = add nsw i32 %137, 1
  store i32 %inc199, i32* %i, align 4
  %arrayidx200 = getelementptr inbounds i8, i8* %136, i32 %137
  %138 = load i8, i8* %arrayidx200, align 1
  %139 = load i8*, i8** %temp, align 4
  %140 = load i32, i32* %j, align 4
  %inc201 = add nsw i32 %140, 1
  store i32 %inc201, i32* %j, align 4
  %arrayidx202 = getelementptr inbounds i8, i8* %139, i32 %140
  store i8 %138, i8* %arrayidx202, align 1
  store i32 0, i32* %equiv, align 4
  br label %if.end253

if.else203:                                       ; preds = %land.lhs.true190, %land.lhs.true187, %if.else185
  %141 = load i32, i32* %c, align 4
  %cmp204 = icmp eq i32 %141, 91
  br i1 %cmp204, label %land.lhs.true206, label %if.else229

land.lhs.true206:                                 ; preds = %if.else203
  %142 = load i8*, i8** %pathname.addr, align 4
  %143 = load i32, i32* %i, align 4
  %arrayidx207 = getelementptr inbounds i8, i8* %142, i32 %143
  %144 = load i8, i8* %arrayidx207, align 1
  %conv208 = sext i8 %144 to i32
  %cmp209 = icmp eq i32 %conv208, 46
  br i1 %cmp209, label %if.then211, label %if.else229

if.then211:                                       ; preds = %land.lhs.true206
  %145 = load i32, i32* %c, align 4
  %conv212 = trunc i32 %145 to i8
  %146 = load i8*, i8** %temp, align 4
  %147 = load i32, i32* %j, align 4
  %inc213 = add nsw i32 %147, 1
  store i32 %inc213, i32* %j, align 4
  %arrayidx214 = getelementptr inbounds i8, i8* %146, i32 %147
  store i8 %conv212, i8* %arrayidx214, align 1
  %148 = load i8*, i8** %pathname.addr, align 4
  %149 = load i32, i32* %i, align 4
  %inc215 = add nsw i32 %149, 1
  store i32 %inc215, i32* %i, align 4
  %arrayidx216 = getelementptr inbounds i8, i8* %148, i32 %149
  %150 = load i8, i8* %arrayidx216, align 1
  %151 = load i8*, i8** %temp, align 4
  %152 = load i32, i32* %j, align 4
  %inc217 = add nsw i32 %152, 1
  store i32 %inc217, i32* %j, align 4
  %arrayidx218 = getelementptr inbounds i8, i8* %151, i32 %152
  store i8 %150, i8* %arrayidx218, align 1
  %153 = load i8*, i8** %pathname.addr, align 4
  %154 = load i32, i32* %i, align 4
  %arrayidx219 = getelementptr inbounds i8, i8* %153, i32 %154
  %155 = load i8, i8* %arrayidx219, align 1
  %conv220 = sext i8 %155 to i32
  %cmp221 = icmp eq i32 %conv220, 93
  br i1 %cmp221, label %if.then223, label %if.end228

if.then223:                                       ; preds = %if.then211
  %156 = load i8*, i8** %pathname.addr, align 4
  %157 = load i32, i32* %i, align 4
  %inc224 = add nsw i32 %157, 1
  store i32 %inc224, i32* %i, align 4
  %arrayidx225 = getelementptr inbounds i8, i8* %156, i32 %157
  %158 = load i8, i8* %arrayidx225, align 1
  %159 = load i8*, i8** %temp, align 4
  %160 = load i32, i32* %j, align 4
  %inc226 = add nsw i32 %160, 1
  store i32 %inc226, i32* %j, align 4
  %arrayidx227 = getelementptr inbounds i8, i8* %159, i32 %160
  store i8 %158, i8* %arrayidx227, align 1
  br label %if.end228

if.end228:                                        ; preds = %if.then223, %if.then211
  store i32 1, i32* %collsym, align 4
  br label %if.end252

if.else229:                                       ; preds = %land.lhs.true206, %if.else203
  %161 = load i32, i32* %collsym, align 4
  %tobool230 = icmp ne i32 %161, 0
  br i1 %tobool230, label %land.lhs.true231, label %if.else247

land.lhs.true231:                                 ; preds = %if.else229
  %162 = load i32, i32* %c, align 4
  %cmp232 = icmp eq i32 %162, 46
  br i1 %cmp232, label %land.lhs.true234, label %if.else247

land.lhs.true234:                                 ; preds = %land.lhs.true231
  %163 = load i8*, i8** %pathname.addr, align 4
  %164 = load i32, i32* %i, align 4
  %arrayidx235 = getelementptr inbounds i8, i8* %163, i32 %164
  %165 = load i8, i8* %arrayidx235, align 1
  %conv236 = sext i8 %165 to i32
  %cmp237 = icmp eq i32 %conv236, 93
  br i1 %cmp237, label %if.then239, label %if.else247

if.then239:                                       ; preds = %land.lhs.true234
  %166 = load i32, i32* %c, align 4
  %conv240 = trunc i32 %166 to i8
  %167 = load i8*, i8** %temp, align 4
  %168 = load i32, i32* %j, align 4
  %inc241 = add nsw i32 %168, 1
  store i32 %inc241, i32* %j, align 4
  %arrayidx242 = getelementptr inbounds i8, i8* %167, i32 %168
  store i8 %conv240, i8* %arrayidx242, align 1
  %169 = load i8*, i8** %pathname.addr, align 4
  %170 = load i32, i32* %i, align 4
  %inc243 = add nsw i32 %170, 1
  store i32 %inc243, i32* %i, align 4
  %arrayidx244 = getelementptr inbounds i8, i8* %169, i32 %170
  %171 = load i8, i8* %arrayidx244, align 1
  %172 = load i8*, i8** %temp, align 4
  %173 = load i32, i32* %j, align 4
  %inc245 = add nsw i32 %173, 1
  store i32 %inc245, i32* %j, align 4
  %arrayidx246 = getelementptr inbounds i8, i8* %172, i32 %173
  store i8 %171, i8* %arrayidx246, align 1
  store i32 0, i32* %collsym, align 4
  br label %if.end251

if.else247:                                       ; preds = %land.lhs.true234, %land.lhs.true231, %if.else229
  %174 = load i32, i32* %c, align 4
  %conv248 = trunc i32 %174 to i8
  %175 = load i8*, i8** %temp, align 4
  %176 = load i32, i32* %j, align 4
  %inc249 = add nsw i32 %176, 1
  store i32 %inc249, i32* %j, align 4
  %arrayidx250 = getelementptr inbounds i8, i8* %175, i32 %176
  store i8 %conv248, i8* %arrayidx250, align 1
  br label %if.end251

if.end251:                                        ; preds = %if.else247, %if.then239
  br label %if.end252

if.end252:                                        ; preds = %if.end251, %if.end228
  br label %if.end253

if.end253:                                        ; preds = %if.end252, %if.then195
  br label %if.end254

if.end254:                                        ; preds = %if.end253, %if.end184
  br label %if.end255

if.end255:                                        ; preds = %if.end254, %if.then151
  br label %if.end256

if.end256:                                        ; preds = %if.end255, %if.then133
  br label %if.end257

if.end257:                                        ; preds = %if.end256, %if.end120
  br label %if.end258

if.end258:                                        ; preds = %if.end257
  br label %do.cond

do.cond:                                          ; preds = %if.end258
  %177 = load i8*, i8** %pathname.addr, align 4
  %178 = load i32, i32* %i, align 4
  %inc259 = add nsw i32 %178, 1
  store i32 %inc259, i32* %i, align 4
  %arrayidx260 = getelementptr inbounds i8, i8* %177, i32 %178
  %179 = load i8, i8* %arrayidx260, align 1
  %conv261 = sext i8 %179 to i32
  store i32 %conv261, i32* %c, align 4
  %cmp262 = icmp ne i32 %conv261, 93
  br i1 %cmp262, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %do.cond
  %180 = load i32, i32* %c, align 4
  %cmp264 = icmp ne i32 %180, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %do.cond
  %181 = phi i1 [ false, %do.cond ], [ %cmp264, %land.rhs ]
  br i1 %181, label %do.body, label %do.end

do.end:                                           ; preds = %land.end
  %182 = load i32, i32* %c, align 4
  %cmp266 = icmp eq i32 %182, 0
  br i1 %cmp266, label %if.then268, label %if.end270

if.then268:                                       ; preds = %do.end
  %183 = load i32, i32* %savei, align 4
  %sub269 = sub nsw i32 %183, 1
  store i32 %sub269, i32* %i, align 4
  %184 = load i32, i32* %savej, align 4
  store i32 %184, i32* %j, align 4
  br label %for.inc

if.end270:                                        ; preds = %do.end
  %185 = load i32, i32* %c, align 4
  %conv271 = trunc i32 %185 to i8
  %186 = load i8*, i8** %temp, align 4
  %187 = load i32, i32* %j, align 4
  %inc272 = add nsw i32 %187, 1
  store i32 %inc272, i32* %j, align 4
  %arrayidx273 = getelementptr inbounds i8, i8* %186, i32 %187
  store i8 %conv271, i8* %arrayidx273, align 1
  %188 = load i32, i32* %i, align 4
  %dec = add nsw i32 %188, -1
  store i32 %dec, i32* %i, align 4
  br label %for.inc

if.else274:                                       ; preds = %land.lhs.true95, %lor.lhs.false, %if.else85
  %189 = load i8*, i8** %pathname.addr, align 4
  %190 = load i32, i32* %i, align 4
  %arrayidx275 = getelementptr inbounds i8, i8* %189, i32 %190
  %191 = load i8, i8* %arrayidx275, align 1
  %conv276 = sext i8 %191 to i32
  %cmp277 = icmp eq i32 %conv276, 92
  br i1 %cmp277, label %land.lhs.true279, label %if.else293

land.lhs.true279:                                 ; preds = %if.else274
  %192 = load i32, i32* %qflags.addr, align 4
  %and280 = and i32 %192, 4
  %cmp281 = icmp eq i32 %and280, 0
  br i1 %cmp281, label %if.then283, label %if.else293

if.then283:                                       ; preds = %land.lhs.true279
  %193 = load i8*, i8** %temp, align 4
  %194 = load i32, i32* %j, align 4
  %inc284 = add nsw i32 %194, 1
  store i32 %inc284, i32* %j, align 4
  %arrayidx285 = getelementptr inbounds i8, i8* %193, i32 %194
  store i8 92, i8* %arrayidx285, align 1
  %195 = load i32, i32* %i, align 4
  %inc286 = add nsw i32 %195, 1
  store i32 %inc286, i32* %i, align 4
  %196 = load i8*, i8** %pathname.addr, align 4
  %197 = load i32, i32* %i, align 4
  %arrayidx287 = getelementptr inbounds i8, i8* %196, i32 %197
  %198 = load i8, i8* %arrayidx287, align 1
  %conv288 = sext i8 %198 to i32
  %cmp289 = icmp eq i32 %conv288, 0
  br i1 %cmp289, label %if.then291, label %if.end292

if.then291:                                       ; preds = %if.then283
  br label %for.end

if.end292:                                        ; preds = %if.then283
  br label %if.end303

if.else293:                                       ; preds = %land.lhs.true279, %if.else274
  %199 = load i8*, i8** %pathname.addr, align 4
  %200 = load i32, i32* %i, align 4
  %arrayidx294 = getelementptr inbounds i8, i8* %199, i32 %200
  %201 = load i8, i8* %arrayidx294, align 1
  %conv295 = sext i8 %201 to i32
  %cmp296 = icmp eq i32 %conv295, 92
  br i1 %cmp296, label %land.lhs.true298, label %if.end302

land.lhs.true298:                                 ; preds = %if.else293
  %202 = load i32, i32* %qflags.addr, align 4
  %and299 = and i32 %202, 4
  %tobool300 = icmp ne i32 %and299, 0
  br i1 %tobool300, label %if.then301, label %if.end302

if.then301:                                       ; preds = %land.lhs.true298
  store i32 1, i32* %last_was_backslash, align 4
  br label %if.end302

if.end302:                                        ; preds = %if.then301, %land.lhs.true298, %if.else293
  br label %if.end303

if.end303:                                        ; preds = %if.end302, %if.end292
  br label %if.end304

if.end304:                                        ; preds = %if.end303
  br label %if.end305

if.end305:                                        ; preds = %if.end304, %if.end84
  br label %if.end306

if.end306:                                        ; preds = %if.end305
  br label %if.end307

if.end307:                                        ; preds = %if.end306
  %203 = load i8*, i8** %pathname.addr, align 4
  %204 = load i32, i32* %i, align 4
  %arrayidx308 = getelementptr inbounds i8, i8* %203, i32 %204
  %205 = load i8, i8* %arrayidx308, align 1
  %206 = load i8*, i8** %temp, align 4
  %207 = load i32, i32* %j, align 4
  %inc309 = add nsw i32 %207, 1
  store i32 %inc309, i32* %j, align 4
  %arrayidx310 = getelementptr inbounds i8, i8* %206, i32 %207
  store i8 %205, i8* %arrayidx310, align 1
  br label %for.inc

for.inc:                                          ; preds = %if.end307, %if.end270, %if.then268, %if.then74, %if.then57, %if.then38
  %208 = load i32, i32* %i, align 4
  %inc311 = add nsw i32 %208, 1
  store i32 %inc311, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then291, %if.then83, %if.then21, %for.cond
  br label %endpat

endpat:                                           ; preds = %for.end, %if.then119, %if.then110
  %209 = load i8*, i8** %temp, align 4
  %210 = load i32, i32* %j, align 4
  %arrayidx312 = getelementptr inbounds i8, i8* %209, i32 %210
  store i8 0, i8* %arrayidx312, align 1
  %211 = load i8*, i8** %temp, align 4
  store i8* %211, i8** %retval, align 4
  br label %return

return:                                           ; preds = %endpat, %if.then
  %212 = load i8*, i8** %retval, align 4
  ret i8* %212
}

declare i8* @sh_xmalloc(i32, i8*, i32) #2

; Function Attrs: noinline nounwind
define internal i32 @ere_char(i32 %c) #0 {
entry:
  %retval = alloca i32, align 4
  %c.addr = alloca i32, align 4
  store i32 %c, i32* %c.addr, align 4
  %0 = load i32, i32* %c.addr, align 4
  switch i32 %0, label %sw.default [
    i32 46, label %sw.bb
    i32 91, label %sw.bb
    i32 92, label %sw.bb
    i32 40, label %sw.bb
    i32 41, label %sw.bb
    i32 42, label %sw.bb
    i32 43, label %sw.bb
    i32 63, label %sw.bb
    i32 123, label %sw.bb
    i32 124, label %sw.bb
    i32 94, label %sw.bb
    i32 36, label %sw.bb
  ]

sw.bb:                                            ; preds = %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry
  store i32 1, i32* %retval, align 4
  br label %return

sw.default:                                       ; preds = %entry
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %sw.default, %sw.bb
  %1 = load i32, i32* %retval, align 4
  ret i32 %1
}

; Function Attrs: noinline nounwind
define i8* @quote_globbing_chars(i8* %string) #0 {
entry:
  %string.addr = alloca i8*, align 4
  %slen = alloca i32, align 4
  %temp = alloca i8*, align 4
  %t = alloca i8*, align 4
  %s = alloca i8*, align 4
  %send = alloca i8*, align 4
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
  %call1 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i32 0, i32 0), i32 341)
  store i8* %call1, i8** %temp, align 4
  %5 = load i8*, i8** %temp, align 4
  store i8* %5, i8** %t, align 4
  %6 = load i8*, i8** %string.addr, align 4
  store i8* %6, i8** %s, align 4
  br label %for.cond

for.cond:                                         ; preds = %do.end, %entry
  %7 = load i8*, i8** %s, align 4
  %8 = load i8, i8* %7, align 1
  %tobool = icmp ne i8 %8, 0
  br i1 %tobool, label %for.body, label %for.end25

for.body:                                         ; preds = %for.cond
  %9 = load i8*, i8** %s, align 4
  %call2 = call i32 @glob_char_p(i8* %9)
  %tobool3 = icmp ne i32 %call2, 0
  br i1 %tobool3, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %10 = load i8*, i8** %t, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %10, i32 1
  store i8* %incdec.ptr, i8** %t, align 4
  store i8 92, i8* %10, align 1
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  br label %do.body

do.body:                                          ; preds = %if.end
  %11 = load i32, i32* @locale_mb_cur_max, align 4
  %cmp = icmp sgt i32 %11, 1
  br i1 %cmp, label %if.then4, label %if.else21

if.then4:                                         ; preds = %do.body
  %12 = load i8*, i8** %s, align 4
  %13 = load i8, i8* %12, align 1
  %call5 = call i32 @is_basic(i8 signext %13)
  store i32 %call5, i32* %_k, align 4
  %14 = load i32, i32* %_k, align 4
  %tobool6 = icmp ne i32 %14, 0
  br i1 %tobool6, label %if.then7, label %if.else

if.then7:                                         ; preds = %if.then4
  store i32 1, i32* %mblength, align 4
  br label %if.end9

if.else:                                          ; preds = %if.then4
  %15 = bitcast %struct.__mbstate_t* %state_bak to i8*
  %16 = bitcast %struct.__mbstate_t* %state to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %15, i8* %16, i32 8, i32 4, i1 false)
  %17 = load i8*, i8** %s, align 4
  %18 = load i8*, i8** %send, align 4
  %19 = load i8*, i8** %s, align 4
  %sub.ptr.lhs.cast = ptrtoint i8* %18 to i32
  %sub.ptr.rhs.cast = ptrtoint i8* %19 to i32
  %sub.ptr.sub = sub i32 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %call8 = call i32 @mbrlen(i8* %17, i32 %sub.ptr.sub, %struct.__mbstate_t* %state)
  store i32 %call8, i32* %mblength, align 4
  br label %if.end9

if.end9:                                          ; preds = %if.else, %if.then7
  %20 = load i32, i32* %mblength, align 4
  %cmp10 = icmp eq i32 %20, -2
  br i1 %cmp10, label %if.then12, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end9
  %21 = load i32, i32* %mblength, align 4
  %cmp11 = icmp eq i32 %21, -1
  br i1 %cmp11, label %if.then12, label %if.else13

if.then12:                                        ; preds = %lor.lhs.false, %if.end9
  %22 = bitcast %struct.__mbstate_t* %state to i8*
  %23 = bitcast %struct.__mbstate_t* %state_bak to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %22, i8* %23, i32 8, i32 4, i1 false)
  store i32 1, i32* %mblength, align 4
  br label %if.end15

if.else13:                                        ; preds = %lor.lhs.false
  %24 = load i32, i32* %mblength, align 4
  %cmp14 = icmp ult i32 %24, 1
  br i1 %cmp14, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.else13
  br label %cond.end

cond.false:                                       ; preds = %if.else13
  %25 = load i32, i32* %mblength, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 1, %cond.true ], [ %25, %cond.false ]
  store i32 %cond, i32* %mblength, align 4
  br label %if.end15

if.end15:                                         ; preds = %cond.end, %if.then12
  store i32 0, i32* %_k, align 4
  br label %for.cond16

for.cond16:                                       ; preds = %for.inc, %if.end15
  %26 = load i32, i32* %_k, align 4
  %27 = load i32, i32* %mblength, align 4
  %cmp17 = icmp ult i32 %26, %27
  br i1 %cmp17, label %for.body18, label %for.end

for.body18:                                       ; preds = %for.cond16
  %28 = load i8*, i8** %s, align 4
  %incdec.ptr19 = getelementptr inbounds i8, i8* %28, i32 1
  store i8* %incdec.ptr19, i8** %s, align 4
  %29 = load i8, i8* %28, align 1
  %30 = load i8*, i8** %t, align 4
  %incdec.ptr20 = getelementptr inbounds i8, i8* %30, i32 1
  store i8* %incdec.ptr20, i8** %t, align 4
  store i8 %29, i8* %30, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body18
  %31 = load i32, i32* %_k, align 4
  %inc = add nsw i32 %31, 1
  store i32 %inc, i32* %_k, align 4
  br label %for.cond16

for.end:                                          ; preds = %for.cond16
  br label %if.end24

if.else21:                                        ; preds = %do.body
  %32 = load i8*, i8** %s, align 4
  %incdec.ptr22 = getelementptr inbounds i8, i8* %32, i32 1
  store i8* %incdec.ptr22, i8** %s, align 4
  %33 = load i8, i8* %32, align 1
  %34 = load i8*, i8** %t, align 4
  %incdec.ptr23 = getelementptr inbounds i8, i8* %34, i32 1
  store i8* %incdec.ptr23, i8** %t, align 4
  store i8 %33, i8* %34, align 1
  br label %if.end24

if.end24:                                         ; preds = %if.else21, %for.end
  br label %do.end

do.end:                                           ; preds = %if.end24
  br label %for.cond

for.end25:                                        ; preds = %for.cond
  %35 = load i8*, i8** %t, align 4
  store i8 0, i8* %35, align 1
  %36 = load i8*, i8** %temp, align 4
  ret i8* %36
}

; Function Attrs: noinline nounwind
define i8** @shell_glob_filename(i8* %pathname) #0 {
entry:
  %pathname.addr = alloca i8*, align 4
  %temp = alloca i8*, align 4
  %results = alloca i8**, align 4
  store i8* %pathname, i8** %pathname.addr, align 4
  %0 = load i32, i32* @glob_dot_filenames, align 4
  %cmp = icmp eq i32 %0, 0
  %conv = zext i1 %cmp to i32
  store i32 %conv, i32* @noglob_dot_filenames, align 4
  %1 = load i8*, i8** %pathname.addr, align 4
  %call = call i8* @quote_string_for_globbing(i8* %1, i32 2)
  store i8* %call, i8** %temp, align 4
  %2 = load i8*, i8** %temp, align 4
  %3 = load i32, i32* @glob_star, align 4
  %tobool = icmp ne i32 %3, 0
  %cond = select i1 %tobool, i32 1024, i32 0
  %call1 = call i8** @glob_filename(i8* %2, i32 %cond)
  store i8** %call1, i8*** %results, align 4
  %4 = load i8*, i8** %temp, align 4
  call void @sh_xfree(i8* %4, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i32 0, i32 0), i32 414)
  %5 = load i8**, i8*** %results, align 4
  %tobool2 = icmp ne i8** %5, null
  br i1 %tobool2, label %land.lhs.true, label %if.end18

land.lhs.true:                                    ; preds = %entry
  %6 = load i8**, i8*** %results, align 4
  %cmp3 = icmp eq i8** %6, @glob_error_return
  %conv4 = zext i1 %cmp3 to i32
  %cmp5 = icmp eq i32 %conv4, 0
  br i1 %cmp5, label %if.then, label %if.end18

if.then:                                          ; preds = %land.lhs.true
  %call7 = call i32 @should_ignore_glob_matches()
  %tobool8 = icmp ne i32 %call7, 0
  br i1 %tobool8, label %if.then9, label %if.end

if.then9:                                         ; preds = %if.then
  %7 = load i8**, i8*** %results, align 4
  call void @ignore_glob_matches(i8** %7)
  br label %if.end

if.end:                                           ; preds = %if.then9, %if.then
  %8 = load i8**, i8*** %results, align 4
  %tobool10 = icmp ne i8** %8, null
  br i1 %tobool10, label %land.lhs.true11, label %if.else

land.lhs.true11:                                  ; preds = %if.end
  %9 = load i8**, i8*** %results, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %9, i32 0
  %10 = load i8*, i8** %arrayidx, align 4
  %tobool12 = icmp ne i8* %10, null
  br i1 %tobool12, label %if.then13, label %if.else

if.then13:                                        ; preds = %land.lhs.true11
  %11 = load i8**, i8*** %results, align 4
  call void @strvec_sort(i8** %11)
  br label %if.end17

if.else:                                          ; preds = %land.lhs.true11, %if.end
  br label %do.body

do.body:                                          ; preds = %if.else
  %12 = load i8**, i8*** %results, align 4
  %tobool14 = icmp ne i8** %12, null
  br i1 %tobool14, label %if.then15, label %if.end16

if.then15:                                        ; preds = %do.body
  %13 = load i8**, i8*** %results, align 4
  %14 = bitcast i8** %13 to i8*
  call void @sh_xfree(i8* %14, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i32 0, i32 0), i32 424)
  br label %if.end16

if.end16:                                         ; preds = %if.then15, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end16
  store i8** @glob_error_return, i8*** %results, align 4
  br label %if.end17

if.end17:                                         ; preds = %do.end, %if.then13
  br label %if.end18

if.end18:                                         ; preds = %if.end17, %land.lhs.true, %entry
  %15 = load i8**, i8*** %results, align 4
  ret i8** %15
}

declare i8** @glob_filename(i8*, i32) #2

declare void @sh_xfree(i8*, i8*, i32) #2

; Function Attrs: noinline nounwind
define i32 @should_ignore_glob_matches() #0 {
entry:
  %0 = load i32, i32* getelementptr inbounds (%struct.ignorevar, %struct.ignorevar* @globignore, i32 0, i32 2), align 4
  ret i32 %0
}

; Function Attrs: noinline nounwind
define void @ignore_glob_matches(i8** %names) #0 {
entry:
  %names.addr = alloca i8**, align 4
  store i8** %names, i8*** %names.addr, align 4
  %0 = load i32, i32* getelementptr inbounds (%struct.ignorevar, %struct.ignorevar* @globignore, i32 0, i32 2), align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i8**, i8*** %names.addr, align 4
  call void @ignore_globbed_names(i8** %1, i32 (i8*)* @glob_name_is_acceptable)
  br label %return

return:                                           ; preds = %if.end, %if.then
  ret void
}

declare void @strvec_sort(i8**) #2

; Function Attrs: noinline nounwind
define void @setup_glob_ignore(i8* %name) #0 {
entry:
  %name.addr = alloca i8*, align 4
  %v = alloca i8*, align 4
  store i8* %name, i8** %name.addr, align 4
  %0 = load i8*, i8** %name.addr, align 4
  %call = call i8* @get_string_value(i8* %0)
  store i8* %call, i8** %v, align 4
  call void @setup_ignore_patterns(%struct.ignorevar* @globignore)
  %1 = load i32, i32* getelementptr inbounds (%struct.ignorevar, %struct.ignorevar* @globignore, i32 0, i32 2), align 4
  %tobool = icmp ne i32 %1, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i32 1, i32* @glob_dot_filenames, align 4
  br label %if.end2

if.else:                                          ; preds = %entry
  %2 = load i8*, i8** %v, align 4
  %cmp = icmp eq i8* %2, null
  br i1 %cmp, label %if.then1, label %if.end

if.then1:                                         ; preds = %if.else
  store i32 0, i32* @glob_dot_filenames, align 4
  br label %if.end

if.end:                                           ; preds = %if.then1, %if.else
  br label %if.end2

if.end2:                                          ; preds = %if.end, %if.then
  ret void
}

declare i8* @get_string_value(i8*) #2

; Function Attrs: noinline nounwind
define void @setup_ignore_patterns(%struct.ignorevar* %ivp) #0 {
entry:
  %ivp.addr = alloca %struct.ignorevar*, align 4
  %numitems = alloca i32, align 4
  %maxitems = alloca i32, align 4
  %ptr = alloca i32, align 4
  %colon_bit = alloca i8*, align 4
  %this_ignoreval = alloca i8*, align 4
  %p = alloca %struct.ign*, align 4
  store %struct.ignorevar* %ivp, %struct.ignorevar** %ivp.addr, align 4
  %0 = load %struct.ignorevar*, %struct.ignorevar** %ivp.addr, align 4
  %varname = getelementptr inbounds %struct.ignorevar, %struct.ignorevar* %0, i32 0, i32 0
  %1 = load i8*, i8** %varname, align 4
  %call = call i8* @get_string_value(i8* %1)
  store i8* %call, i8** %this_ignoreval, align 4
  %2 = load i8*, i8** %this_ignoreval, align 4
  %tobool = icmp ne i8* %2, null
  br i1 %tobool, label %land.lhs.true, label %lor.lhs.false

land.lhs.true:                                    ; preds = %entry
  %3 = load %struct.ignorevar*, %struct.ignorevar** %ivp.addr, align 4
  %last_ignoreval = getelementptr inbounds %struct.ignorevar, %struct.ignorevar* %3, i32 0, i32 3
  %4 = load i8*, i8** %last_ignoreval, align 4
  %tobool1 = icmp ne i8* %4, null
  br i1 %tobool1, label %land.lhs.true2, label %lor.lhs.false

land.lhs.true2:                                   ; preds = %land.lhs.true
  %5 = load i8*, i8** %this_ignoreval, align 4
  %arrayidx = getelementptr inbounds i8, i8* %5, i32 0
  %6 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %6 to i32
  %7 = load %struct.ignorevar*, %struct.ignorevar** %ivp.addr, align 4
  %last_ignoreval3 = getelementptr inbounds %struct.ignorevar, %struct.ignorevar* %7, i32 0, i32 3
  %8 = load i8*, i8** %last_ignoreval3, align 4
  %arrayidx4 = getelementptr inbounds i8, i8* %8, i32 0
  %9 = load i8, i8* %arrayidx4, align 1
  %conv5 = sext i8 %9 to i32
  %cmp = icmp eq i32 %conv, %conv5
  br i1 %cmp, label %land.lhs.true7, label %lor.lhs.false

land.lhs.true7:                                   ; preds = %land.lhs.true2
  %10 = load i8*, i8** %this_ignoreval, align 4
  %11 = load %struct.ignorevar*, %struct.ignorevar** %ivp.addr, align 4
  %last_ignoreval8 = getelementptr inbounds %struct.ignorevar, %struct.ignorevar* %11, i32 0, i32 3
  %12 = load i8*, i8** %last_ignoreval8, align 4
  %call9 = call i32 @strcmp(i8* %10, i8* %12)
  %cmp10 = icmp eq i32 %call9, 0
  br i1 %cmp10, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true7, %land.lhs.true2, %land.lhs.true, %entry
  %13 = load i8*, i8** %this_ignoreval, align 4
  %tobool12 = icmp ne i8* %13, null
  br i1 %tobool12, label %if.end, label %land.lhs.true13

land.lhs.true13:                                  ; preds = %lor.lhs.false
  %14 = load %struct.ignorevar*, %struct.ignorevar** %ivp.addr, align 4
  %last_ignoreval14 = getelementptr inbounds %struct.ignorevar, %struct.ignorevar* %14, i32 0, i32 3
  %15 = load i8*, i8** %last_ignoreval14, align 4
  %tobool15 = icmp ne i8* %15, null
  br i1 %tobool15, label %if.end, label %if.then

if.then:                                          ; preds = %land.lhs.true13, %land.lhs.true7
  br label %return

if.end:                                           ; preds = %land.lhs.true13, %lor.lhs.false
  %16 = load %struct.ignorevar*, %struct.ignorevar** %ivp.addr, align 4
  %num_ignores = getelementptr inbounds %struct.ignorevar, %struct.ignorevar* %16, i32 0, i32 2
  store i32 0, i32* %num_ignores, align 4
  %17 = load %struct.ignorevar*, %struct.ignorevar** %ivp.addr, align 4
  %ignores = getelementptr inbounds %struct.ignorevar, %struct.ignorevar* %17, i32 0, i32 1
  %18 = load %struct.ign*, %struct.ign** %ignores, align 4
  %tobool16 = icmp ne %struct.ign* %18, null
  br i1 %tobool16, label %if.then17, label %if.end23

if.then17:                                        ; preds = %if.end
  %19 = load %struct.ignorevar*, %struct.ignorevar** %ivp.addr, align 4
  %ignores18 = getelementptr inbounds %struct.ignorevar, %struct.ignorevar* %19, i32 0, i32 1
  %20 = load %struct.ign*, %struct.ign** %ignores18, align 4
  store %struct.ign* %20, %struct.ign** %p, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then17
  %21 = load %struct.ign*, %struct.ign** %p, align 4
  %val = getelementptr inbounds %struct.ign, %struct.ign* %21, i32 0, i32 0
  %22 = load i8*, i8** %val, align 4
  %tobool19 = icmp ne i8* %22, null
  br i1 %tobool19, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %23 = load %struct.ign*, %struct.ign** %p, align 4
  %val20 = getelementptr inbounds %struct.ign, %struct.ign* %23, i32 0, i32 0
  %24 = load i8*, i8** %val20, align 4
  call void @sh_xfree(i8* %24, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i32 0, i32 0), i32 587)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %25 = load %struct.ign*, %struct.ign** %p, align 4
  %incdec.ptr = getelementptr inbounds %struct.ign, %struct.ign* %25, i32 1
  store %struct.ign* %incdec.ptr, %struct.ign** %p, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %26 = load %struct.ignorevar*, %struct.ignorevar** %ivp.addr, align 4
  %ignores21 = getelementptr inbounds %struct.ignorevar, %struct.ignorevar* %26, i32 0, i32 1
  %27 = load %struct.ign*, %struct.ign** %ignores21, align 4
  %28 = bitcast %struct.ign* %27 to i8*
  call void @sh_xfree(i8* %28, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i32 0, i32 0), i32 588)
  %29 = load %struct.ignorevar*, %struct.ignorevar** %ivp.addr, align 4
  %ignores22 = getelementptr inbounds %struct.ignorevar, %struct.ignorevar* %29, i32 0, i32 1
  store %struct.ign* null, %struct.ign** %ignores22, align 4
  br label %if.end23

if.end23:                                         ; preds = %for.end, %if.end
  %30 = load %struct.ignorevar*, %struct.ignorevar** %ivp.addr, align 4
  %last_ignoreval24 = getelementptr inbounds %struct.ignorevar, %struct.ignorevar* %30, i32 0, i32 3
  %31 = load i8*, i8** %last_ignoreval24, align 4
  %tobool25 = icmp ne i8* %31, null
  br i1 %tobool25, label %if.then26, label %if.end29

if.then26:                                        ; preds = %if.end23
  %32 = load %struct.ignorevar*, %struct.ignorevar** %ivp.addr, align 4
  %last_ignoreval27 = getelementptr inbounds %struct.ignorevar, %struct.ignorevar* %32, i32 0, i32 3
  %33 = load i8*, i8** %last_ignoreval27, align 4
  call void @sh_xfree(i8* %33, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i32 0, i32 0), i32 594)
  %34 = load %struct.ignorevar*, %struct.ignorevar** %ivp.addr, align 4
  %last_ignoreval28 = getelementptr inbounds %struct.ignorevar, %struct.ignorevar* %34, i32 0, i32 3
  store i8* null, i8** %last_ignoreval28, align 4
  br label %if.end29

if.end29:                                         ; preds = %if.then26, %if.end23
  %35 = load i8*, i8** %this_ignoreval, align 4
  %cmp30 = icmp eq i8* %35, null
  br i1 %cmp30, label %if.then36, label %lor.lhs.false32

lor.lhs.false32:                                  ; preds = %if.end29
  %36 = load i8*, i8** %this_ignoreval, align 4
  %37 = load i8, i8* %36, align 1
  %conv33 = sext i8 %37 to i32
  %cmp34 = icmp eq i32 %conv33, 0
  br i1 %cmp34, label %if.then36, label %if.end37

if.then36:                                        ; preds = %lor.lhs.false32, %if.end29
  br label %return

if.end37:                                         ; preds = %lor.lhs.false32
  %38 = load i8*, i8** %this_ignoreval, align 4
  %call38 = call i32 @strlen(i8* %38)
  %add = add i32 1, %call38
  %call39 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i32 0, i32 0), i32 601)
  %39 = load i8*, i8** %this_ignoreval, align 4
  %call40 = call i8* @strcpy(i8* %call39, i8* %39)
  %40 = load %struct.ignorevar*, %struct.ignorevar** %ivp.addr, align 4
  %last_ignoreval41 = getelementptr inbounds %struct.ignorevar, %struct.ignorevar* %40, i32 0, i32 3
  store i8* %call40, i8** %last_ignoreval41, align 4
  store i32 0, i32* %ptr, align 4
  store i32 0, i32* %maxitems, align 4
  store i32 0, i32* %numitems, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end67, %if.end37
  %41 = load i8*, i8** %this_ignoreval, align 4
  %call42 = call i8* @split_ignorespec(i8* %41, i32* %ptr)
  store i8* %call42, i8** %colon_bit, align 4
  %tobool43 = icmp ne i8* %call42, null
  br i1 %tobool43, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %42 = load i32, i32* %numitems, align 4
  %add44 = add nsw i32 %42, 1
  %43 = load i32, i32* %maxitems, align 4
  %cmp45 = icmp sge i32 %add44, %43
  br i1 %cmp45, label %if.then47, label %if.end52

if.then47:                                        ; preds = %while.body
  %44 = load i32, i32* %maxitems, align 4
  %add48 = add nsw i32 %44, 10
  store i32 %add48, i32* %maxitems, align 4
  %45 = load %struct.ignorevar*, %struct.ignorevar** %ivp.addr, align 4
  %ignores49 = getelementptr inbounds %struct.ignorevar, %struct.ignorevar* %45, i32 0, i32 1
  %46 = load %struct.ign*, %struct.ign** %ignores49, align 4
  %47 = bitcast %struct.ign* %46 to i8*
  %48 = load i32, i32* %maxitems, align 4
  %mul = mul i32 %48, 12
  %call50 = call i8* @sh_xrealloc(i8* %47, i32 %mul, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i32 0, i32 0), i32 614)
  %49 = bitcast i8* %call50 to %struct.ign*
  %50 = load %struct.ignorevar*, %struct.ignorevar** %ivp.addr, align 4
  %ignores51 = getelementptr inbounds %struct.ignorevar, %struct.ignorevar* %50, i32 0, i32 1
  store %struct.ign* %49, %struct.ign** %ignores51, align 4
  br label %if.end52

if.end52:                                         ; preds = %if.then47, %while.body
  %51 = load i8*, i8** %colon_bit, align 4
  %52 = load %struct.ignorevar*, %struct.ignorevar** %ivp.addr, align 4
  %ignores53 = getelementptr inbounds %struct.ignorevar, %struct.ignorevar* %52, i32 0, i32 1
  %53 = load %struct.ign*, %struct.ign** %ignores53, align 4
  %54 = load i32, i32* %numitems, align 4
  %arrayidx54 = getelementptr inbounds %struct.ign, %struct.ign* %53, i32 %54
  %val55 = getelementptr inbounds %struct.ign, %struct.ign* %arrayidx54, i32 0, i32 0
  store i8* %51, i8** %val55, align 4
  %55 = load i8*, i8** %colon_bit, align 4
  %call56 = call i32 @strlen(i8* %55)
  %56 = load %struct.ignorevar*, %struct.ignorevar** %ivp.addr, align 4
  %ignores57 = getelementptr inbounds %struct.ignorevar, %struct.ignorevar* %56, i32 0, i32 1
  %57 = load %struct.ign*, %struct.ign** %ignores57, align 4
  %58 = load i32, i32* %numitems, align 4
  %arrayidx58 = getelementptr inbounds %struct.ign, %struct.ign* %57, i32 %58
  %len = getelementptr inbounds %struct.ign, %struct.ign* %arrayidx58, i32 0, i32 1
  store i32 %call56, i32* %len, align 4
  %59 = load %struct.ignorevar*, %struct.ignorevar** %ivp.addr, align 4
  %ignores59 = getelementptr inbounds %struct.ignorevar, %struct.ignorevar* %59, i32 0, i32 1
  %60 = load %struct.ign*, %struct.ign** %ignores59, align 4
  %61 = load i32, i32* %numitems, align 4
  %arrayidx60 = getelementptr inbounds %struct.ign, %struct.ign* %60, i32 %61
  %flags = getelementptr inbounds %struct.ign, %struct.ign* %arrayidx60, i32 0, i32 2
  store i32 0, i32* %flags, align 4
  %62 = load %struct.ignorevar*, %struct.ignorevar** %ivp.addr, align 4
  %item_func = getelementptr inbounds %struct.ignorevar, %struct.ignorevar* %62, i32 0, i32 4
  %63 = load i32 (%struct.ign*)*, i32 (%struct.ign*)** %item_func, align 4
  %tobool61 = icmp ne i32 (%struct.ign*)* %63, null
  br i1 %tobool61, label %if.then62, label %if.end67

if.then62:                                        ; preds = %if.end52
  %64 = load %struct.ignorevar*, %struct.ignorevar** %ivp.addr, align 4
  %item_func63 = getelementptr inbounds %struct.ignorevar, %struct.ignorevar* %64, i32 0, i32 4
  %65 = load i32 (%struct.ign*)*, i32 (%struct.ign*)** %item_func63, align 4
  %66 = load %struct.ignorevar*, %struct.ignorevar** %ivp.addr, align 4
  %ignores64 = getelementptr inbounds %struct.ignorevar, %struct.ignorevar* %66, i32 0, i32 1
  %67 = load %struct.ign*, %struct.ign** %ignores64, align 4
  %68 = load i32, i32* %numitems, align 4
  %arrayidx65 = getelementptr inbounds %struct.ign, %struct.ign* %67, i32 %68
  %call66 = call i32 %65(%struct.ign* %arrayidx65)
  br label %if.end67

if.end67:                                         ; preds = %if.then62, %if.end52
  %69 = load i32, i32* %numitems, align 4
  %inc = add nsw i32 %69, 1
  store i32 %inc, i32* %numitems, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %70 = load %struct.ignorevar*, %struct.ignorevar** %ivp.addr, align 4
  %ignores68 = getelementptr inbounds %struct.ignorevar, %struct.ignorevar* %70, i32 0, i32 1
  %71 = load %struct.ign*, %struct.ign** %ignores68, align 4
  %72 = load i32, i32* %numitems, align 4
  %arrayidx69 = getelementptr inbounds %struct.ign, %struct.ign* %71, i32 %72
  %val70 = getelementptr inbounds %struct.ign, %struct.ign* %arrayidx69, i32 0, i32 0
  store i8* null, i8** %val70, align 4
  %73 = load i32, i32* %numitems, align 4
  %74 = load %struct.ignorevar*, %struct.ignorevar** %ivp.addr, align 4
  %num_ignores71 = getelementptr inbounds %struct.ignorevar, %struct.ignorevar* %74, i32 0, i32 2
  store i32 %73, i32* %num_ignores71, align 4
  br label %return

return:                                           ; preds = %while.end, %if.then36, %if.then
  ret void
}

; Function Attrs: noinline nounwind
define internal void @ignore_globbed_names(i8** %names, i32 (i8*)* %name_func) #0 {
entry:
  %names.addr = alloca i8**, align 4
  %name_func.addr = alloca i32 (i8*)*, align 4
  %newnames = alloca i8**, align 4
  %n = alloca i32, align 4
  %i = alloca i32, align 4
  store i8** %names, i8*** %names.addr, align 4
  store i32 (i8*)* %name_func, i32 (i8*)** %name_func.addr, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i8**, i8*** %names.addr, align 4
  %1 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %0, i32 %1
  %2 = load i8*, i8** %arrayidx, align 4
  %tobool = icmp ne i8* %2, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %3 = load i32, i32* %i, align 4
  %inc = add nsw i32 %3, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %4 = load i32, i32* %i, align 4
  %add = add nsw i32 %4, 1
  %call = call i8** @strvec_create(i32 %add)
  store i8** %call, i8*** %newnames, align 4
  store i32 0, i32* %i, align 4
  store i32 0, i32* %n, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc12, %for.end
  %5 = load i8**, i8*** %names.addr, align 4
  %6 = load i32, i32* %i, align 4
  %arrayidx2 = getelementptr inbounds i8*, i8** %5, i32 %6
  %7 = load i8*, i8** %arrayidx2, align 4
  %tobool3 = icmp ne i8* %7, null
  br i1 %tobool3, label %for.body4, label %for.end14

for.body4:                                        ; preds = %for.cond1
  %8 = load i32 (i8*)*, i32 (i8*)** %name_func.addr, align 4
  %9 = load i8**, i8*** %names.addr, align 4
  %10 = load i32, i32* %i, align 4
  %arrayidx5 = getelementptr inbounds i8*, i8** %9, i32 %10
  %11 = load i8*, i8** %arrayidx5, align 4
  %call6 = call i32 %8(i8* %11)
  %tobool7 = icmp ne i32 %call6, 0
  br i1 %tobool7, label %if.then, label %if.else

if.then:                                          ; preds = %for.body4
  %12 = load i8**, i8*** %names.addr, align 4
  %13 = load i32, i32* %i, align 4
  %arrayidx8 = getelementptr inbounds i8*, i8** %12, i32 %13
  %14 = load i8*, i8** %arrayidx8, align 4
  %15 = load i8**, i8*** %newnames, align 4
  %16 = load i32, i32* %n, align 4
  %inc9 = add nsw i32 %16, 1
  store i32 %inc9, i32* %n, align 4
  %arrayidx10 = getelementptr inbounds i8*, i8** %15, i32 %16
  store i8* %14, i8** %arrayidx10, align 4
  br label %if.end

if.else:                                          ; preds = %for.body4
  %17 = load i8**, i8*** %names.addr, align 4
  %18 = load i32, i32* %i, align 4
  %arrayidx11 = getelementptr inbounds i8*, i8** %17, i32 %18
  %19 = load i8*, i8** %arrayidx11, align 4
  call void @sh_xfree(i8* %19, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i32 0, i32 0), i32 512)
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %for.inc12

for.inc12:                                        ; preds = %if.end
  %20 = load i32, i32* %i, align 4
  %inc13 = add nsw i32 %20, 1
  store i32 %inc13, i32* %i, align 4
  br label %for.cond1

for.end14:                                        ; preds = %for.cond1
  %21 = load i8**, i8*** %newnames, align 4
  %22 = load i32, i32* %n, align 4
  %arrayidx15 = getelementptr inbounds i8*, i8** %21, i32 %22
  store i8* null, i8** %arrayidx15, align 4
  %23 = load i32, i32* %n, align 4
  %cmp = icmp eq i32 %23, 0
  br i1 %cmp, label %if.then16, label %if.end18

if.then16:                                        ; preds = %for.end14
  %24 = load i8**, i8*** %names.addr, align 4
  %arrayidx17 = getelementptr inbounds i8*, i8** %24, i32 0
  store i8* null, i8** %arrayidx17, align 4
  %25 = load i8**, i8*** %newnames, align 4
  %26 = bitcast i8** %25 to i8*
  call void @sh_xfree(i8* %26, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i32 0, i32 0), i32 520)
  br label %return

if.end18:                                         ; preds = %for.end14
  store i32 0, i32* %n, align 4
  br label %for.cond19

for.cond19:                                       ; preds = %for.inc25, %if.end18
  %27 = load i8**, i8*** %newnames, align 4
  %28 = load i32, i32* %n, align 4
  %arrayidx20 = getelementptr inbounds i8*, i8** %27, i32 %28
  %29 = load i8*, i8** %arrayidx20, align 4
  %tobool21 = icmp ne i8* %29, null
  br i1 %tobool21, label %for.body22, label %for.end27

for.body22:                                       ; preds = %for.cond19
  %30 = load i8**, i8*** %newnames, align 4
  %31 = load i32, i32* %n, align 4
  %arrayidx23 = getelementptr inbounds i8*, i8** %30, i32 %31
  %32 = load i8*, i8** %arrayidx23, align 4
  %33 = load i8**, i8*** %names.addr, align 4
  %34 = load i32, i32* %n, align 4
  %arrayidx24 = getelementptr inbounds i8*, i8** %33, i32 %34
  store i8* %32, i8** %arrayidx24, align 4
  br label %for.inc25

for.inc25:                                        ; preds = %for.body22
  %35 = load i32, i32* %n, align 4
  %inc26 = add nsw i32 %35, 1
  store i32 %inc26, i32* %n, align 4
  br label %for.cond19

for.end27:                                        ; preds = %for.cond19
  %36 = load i8**, i8*** %names.addr, align 4
  %37 = load i32, i32* %n, align 4
  %arrayidx28 = getelementptr inbounds i8*, i8** %36, i32 %37
  store i8* null, i8** %arrayidx28, align 4
  %38 = load i8**, i8*** %newnames, align 4
  %39 = bitcast i8** %38 to i8*
  call void @sh_xfree(i8* %39, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i32 0, i32 0), i32 529)
  br label %return

return:                                           ; preds = %for.end27, %if.then16
  ret void
}

; Function Attrs: noinline nounwind
define internal i32 @glob_name_is_acceptable(i8* %name) #0 {
entry:
  %retval = alloca i32, align 4
  %name.addr = alloca i8*, align 4
  %p = alloca %struct.ign*, align 4
  %flags = alloca i32, align 4
  store i8* %name, i8** %name.addr, align 4
  %0 = load i8*, i8** %name.addr, align 4
  %arrayidx = getelementptr inbounds i8, i8* %0, i32 0
  %1 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %1 to i32
  %cmp = icmp eq i32 %conv, 46
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %2 = load i8*, i8** %name.addr, align 4
  %arrayidx2 = getelementptr inbounds i8, i8* %2, i32 1
  %3 = load i8, i8* %arrayidx2, align 1
  %conv3 = sext i8 %3 to i32
  %cmp4 = icmp eq i32 %conv3, 0
  br i1 %cmp4, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true
  %4 = load i8*, i8** %name.addr, align 4
  %arrayidx6 = getelementptr inbounds i8, i8* %4, i32 1
  %5 = load i8, i8* %arrayidx6, align 1
  %conv7 = sext i8 %5 to i32
  %cmp8 = icmp eq i32 %conv7, 46
  br i1 %cmp8, label %land.lhs.true10, label %if.end

land.lhs.true10:                                  ; preds = %lor.lhs.false
  %6 = load i8*, i8** %name.addr, align 4
  %arrayidx11 = getelementptr inbounds i8, i8* %6, i32 2
  %7 = load i8, i8* %arrayidx11, align 1
  %conv12 = sext i8 %7 to i32
  %cmp13 = icmp eq i32 %conv12, 0
  br i1 %cmp13, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true10, %land.lhs.true
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %land.lhs.true10, %lor.lhs.false, %entry
  %8 = load i32, i32* @extended_glob, align 4
  %tobool = icmp ne i32 %8, 0
  %cond = select i1 %tobool, i32 32, i32 0
  %or = or i32 1, %cond
  %9 = load i32, i32* @glob_ignore_case, align 4
  %tobool15 = icmp ne i32 %9, 0
  %cond16 = select i1 %tobool15, i32 16, i32 0
  %or17 = or i32 %or, %cond16
  store i32 %or17, i32* %flags, align 4
  %10 = load %struct.ign*, %struct.ign** getelementptr inbounds (%struct.ignorevar, %struct.ignorevar* @globignore, i32 0, i32 1), align 4
  store %struct.ign* %10, %struct.ign** %p, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %11 = load %struct.ign*, %struct.ign** %p, align 4
  %val = getelementptr inbounds %struct.ign, %struct.ign* %11, i32 0, i32 0
  %12 = load i8*, i8** %val, align 4
  %tobool18 = icmp ne i8* %12, null
  br i1 %tobool18, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %13 = load %struct.ign*, %struct.ign** %p, align 4
  %val19 = getelementptr inbounds %struct.ign, %struct.ign* %13, i32 0, i32 0
  %14 = load i8*, i8** %val19, align 4
  %15 = load i8*, i8** %name.addr, align 4
  %16 = load i32, i32* %flags, align 4
  %call = call i32 @strmatch(i8* %14, i8* %15, i32 %16)
  %cmp20 = icmp ne i32 %call, 1
  br i1 %cmp20, label %if.then22, label %if.end23

if.then22:                                        ; preds = %for.body
  store i32 0, i32* %retval, align 4
  br label %return

if.end23:                                         ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end23
  %17 = load %struct.ign*, %struct.ign** %p, align 4
  %incdec.ptr = getelementptr inbounds %struct.ign, %struct.ign* %17, i32 1
  store %struct.ign* %incdec.ptr, %struct.ign** %p, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then22, %if.then
  %18 = load i32, i32* %retval, align 4
  ret i32 %18
}

declare i32 @strcmp(i8*, i8*) #2

declare i8* @strcpy(i8*, i8*) #2

; Function Attrs: noinline nounwind
define internal i8* @split_ignorespec(i8* %s, i32* %ip) #0 {
entry:
  %retval = alloca i8*, align 4
  %s.addr = alloca i8*, align 4
  %ip.addr = alloca i32*, align 4
  %t = alloca i8*, align 4
  %n = alloca i32, align 4
  %i = alloca i32, align 4
  store i8* %s, i8** %s.addr, align 4
  store i32* %ip, i32** %ip.addr, align 4
  %0 = load i8*, i8** %s.addr, align 4
  %cmp = icmp eq i8* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i8* null, i8** %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i32*, i32** %ip.addr, align 4
  %2 = load i32, i32* %1, align 4
  store i32 %2, i32* %i, align 4
  %3 = load i8*, i8** %s.addr, align 4
  %4 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds i8, i8* %3, i32 %4
  %5 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %5 to i32
  %cmp1 = icmp eq i32 %conv, 0
  br i1 %cmp1, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  store i8* null, i8** %retval, align 4
  br label %return

if.end4:                                          ; preds = %if.end
  %6 = load i8*, i8** %s.addr, align 4
  %7 = load i32, i32* %i, align 4
  %call = call i32 @skip_to_delim(i8* %6, i32 %7, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i32 0, i32 0), i32 81)
  store i32 %call, i32* %n, align 4
  %8 = load i8*, i8** %s.addr, align 4
  %9 = load i32, i32* %i, align 4
  %10 = load i32, i32* %n, align 4
  %call5 = call i8* @substring(i8* %8, i32 %9, i32 %10)
  store i8* %call5, i8** %t, align 4
  %11 = load i8*, i8** %s.addr, align 4
  %12 = load i32, i32* %n, align 4
  %arrayidx6 = getelementptr inbounds i8, i8* %11, i32 %12
  %13 = load i8, i8* %arrayidx6, align 1
  %conv7 = sext i8 %13 to i32
  %cmp8 = icmp eq i32 %conv7, 58
  br i1 %cmp8, label %if.then10, label %if.end11

if.then10:                                        ; preds = %if.end4
  %14 = load i32, i32* %n, align 4
  %inc = add nsw i32 %14, 1
  store i32 %inc, i32* %n, align 4
  br label %if.end11

if.end11:                                         ; preds = %if.then10, %if.end4
  %15 = load i32, i32* %n, align 4
  %16 = load i32*, i32** %ip.addr, align 4
  store i32 %15, i32* %16, align 4
  %17 = load i8*, i8** %t, align 4
  store i8* %17, i8** %retval, align 4
  br label %return

return:                                           ; preds = %if.end11, %if.then3, %if.then
  %18 = load i8*, i8** %retval, align 4
  ret i8* %18
}

declare i8* @sh_xrealloc(i8*, i32, i8*, i32) #2

declare i8** @strvec_create(i32) #2

declare i32 @strmatch(i8*, i8*, i32) #2

declare i32 @skip_to_delim(i8*, i32, i8*, i32) #2

declare i8* @substring(i8*, i32, i32) #2

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
