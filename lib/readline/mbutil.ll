; ModuleID = 'mbutil.c'
source_filename = "mbutil.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.__mbstate_t = type { i32, i32 }

@rl_byte_oriented = global i32 0, align 4
@_rl_utf8locale = global i32 0, align 4

; Function Attrs: noinline nounwind
define i32 @_rl_find_prev_mbchar_internal(i8* %string, i32 %seed, i32 %find_non_zero) #0 {
entry:
  %retval = alloca i32, align 4
  %string.addr = alloca i8*, align 4
  %seed.addr = alloca i32, align 4
  %find_non_zero.addr = alloca i32, align 4
  %ps = alloca %struct.__mbstate_t, align 4
  %prev = alloca i32, align 4
  %non_zero_prev = alloca i32, align 4
  %point = alloca i32, align 4
  %length = alloca i32, align 4
  %tmp = alloca i32, align 4
  %wc = alloca i32, align 4
  store i8* %string, i8** %string.addr, align 4
  store i32 %seed, i32* %seed.addr, align 4
  store i32 %find_non_zero, i32* %find_non_zero.addr, align 4
  %0 = bitcast %struct.__mbstate_t* %ps to i8*
  call void @llvm.memset.p0i8.i32(i8* %0, i8 0, i32 8, i32 4, i1 false)
  %1 = load i8*, i8** %string.addr, align 4
  %call = call i32 @strlen(i8* %1)
  store i32 %call, i32* %length, align 4
  %2 = load i32, i32* %seed.addr, align 4
  %cmp = icmp slt i32 %2, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %entry
  %3 = load i32, i32* %length, align 4
  %4 = load i32, i32* %seed.addr, align 4
  %cmp2 = icmp slt i32 %3, %4
  br i1 %cmp2, label %if.then3, label %if.end

if.then3:                                         ; preds = %if.else
  %5 = load i32, i32* %length, align 4
  store i32 %5, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %if.else
  br label %if.end4

if.end4:                                          ; preds = %if.end
  store i32 0, i32* %point, align 4
  store i32 0, i32* %non_zero_prev, align 4
  store i32 0, i32* %prev, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end22, %if.end4
  %6 = load i32, i32* %point, align 4
  %7 = load i32, i32* %seed.addr, align 4
  %cmp5 = icmp slt i32 %6, %7
  br i1 %cmp5, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %8 = load i8*, i8** %string.addr, align 4
  %9 = load i32, i32* %point, align 4
  %add.ptr = getelementptr inbounds i8, i8* %8, i32 %9
  %10 = load i32, i32* %length, align 4
  %11 = load i32, i32* %point, align 4
  %sub = sub nsw i32 %10, %11
  %call6 = call i32 @mbrtowc(i32* %wc, i8* %add.ptr, i32 %sub, %struct.__mbstate_t* %ps)
  store i32 %call6, i32* %tmp, align 4
  %12 = load i32, i32* %tmp, align 4
  %cmp7 = icmp eq i32 %12, -1
  br i1 %cmp7, label %if.then9, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %while.body
  %13 = load i32, i32* %tmp, align 4
  %cmp8 = icmp eq i32 %13, -2
  br i1 %cmp8, label %if.then9, label %if.else10

if.then9:                                         ; preds = %lor.lhs.false, %while.body
  store i32 1, i32* %tmp, align 4
  %14 = bitcast %struct.__mbstate_t* %ps to i8*
  call void @llvm.memset.p0i8.i32(i8* %14, i8 0, i32 8, i32 4, i1 false)
  %15 = load i32, i32* %point, align 4
  store i32 %15, i32* %prev, align 4
  br label %if.end22

if.else10:                                        ; preds = %lor.lhs.false
  %16 = load i32, i32* %tmp, align 4
  %cmp11 = icmp eq i32 %16, 0
  br i1 %cmp11, label %if.then12, label %if.else13

if.then12:                                        ; preds = %if.else10
  br label %while.end

if.else13:                                        ; preds = %if.else10
  %17 = load i32, i32* %find_non_zero.addr, align 4
  %tobool = icmp ne i32 %17, 0
  br i1 %tobool, label %if.then14, label %if.else19

if.then14:                                        ; preds = %if.else13
  %18 = load i32, i32* %wc, align 4
  %call15 = call i32 @_rl_wcwidth(i32 %18)
  %cmp16 = icmp ne i32 %call15, 0
  br i1 %cmp16, label %if.then17, label %if.end18

if.then17:                                        ; preds = %if.then14
  %19 = load i32, i32* %point, align 4
  store i32 %19, i32* %prev, align 4
  br label %if.end18

if.end18:                                         ; preds = %if.then17, %if.then14
  br label %if.end20

if.else19:                                        ; preds = %if.else13
  %20 = load i32, i32* %point, align 4
  store i32 %20, i32* %prev, align 4
  br label %if.end20

if.end20:                                         ; preds = %if.else19, %if.end18
  br label %if.end21

if.end21:                                         ; preds = %if.end20
  br label %if.end22

if.end22:                                         ; preds = %if.end21, %if.then9
  %21 = load i32, i32* %tmp, align 4
  %22 = load i32, i32* %point, align 4
  %add = add i32 %22, %21
  store i32 %add, i32* %point, align 4
  br label %while.cond

while.end:                                        ; preds = %if.then12, %while.cond
  %23 = load i32, i32* %prev, align 4
  store i32 %23, i32* %retval, align 4
  br label %return

return:                                           ; preds = %while.end, %if.then3, %if.then
  %24 = load i32, i32* %retval, align 4
  ret i32 %24
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #1

declare i32 @strlen(i8*) #2

declare i32 @mbrtowc(i32*, i8*, i32, %struct.__mbstate_t*) #2

; Function Attrs: noinline nounwind
define internal i32 @_rl_wcwidth(i32 %wc) #0 {
entry:
  %retval = alloca i32, align 4
  %wc.addr = alloca i32, align 4
  store i32 %wc, i32* %wc.addr, align 4
  %0 = load i32, i32* %wc.addr, align 4
  switch i32 %0, label %sw.default [
    i32 32, label %sw.bb
    i32 33, label %sw.bb
    i32 34, label %sw.bb
    i32 35, label %sw.bb
    i32 37, label %sw.bb
    i32 38, label %sw.bb
    i32 39, label %sw.bb
    i32 40, label %sw.bb
    i32 41, label %sw.bb
    i32 42, label %sw.bb
    i32 43, label %sw.bb
    i32 44, label %sw.bb
    i32 45, label %sw.bb
    i32 46, label %sw.bb
    i32 47, label %sw.bb
    i32 48, label %sw.bb
    i32 49, label %sw.bb
    i32 50, label %sw.bb
    i32 51, label %sw.bb
    i32 52, label %sw.bb
    i32 53, label %sw.bb
    i32 54, label %sw.bb
    i32 55, label %sw.bb
    i32 56, label %sw.bb
    i32 57, label %sw.bb
    i32 58, label %sw.bb
    i32 59, label %sw.bb
    i32 60, label %sw.bb
    i32 61, label %sw.bb
    i32 62, label %sw.bb
    i32 63, label %sw.bb
    i32 65, label %sw.bb
    i32 66, label %sw.bb
    i32 67, label %sw.bb
    i32 68, label %sw.bb
    i32 69, label %sw.bb
    i32 70, label %sw.bb
    i32 71, label %sw.bb
    i32 72, label %sw.bb
    i32 73, label %sw.bb
    i32 74, label %sw.bb
    i32 75, label %sw.bb
    i32 76, label %sw.bb
    i32 77, label %sw.bb
    i32 78, label %sw.bb
    i32 79, label %sw.bb
    i32 80, label %sw.bb
    i32 81, label %sw.bb
    i32 82, label %sw.bb
    i32 83, label %sw.bb
    i32 84, label %sw.bb
    i32 85, label %sw.bb
    i32 86, label %sw.bb
    i32 87, label %sw.bb
    i32 88, label %sw.bb
    i32 89, label %sw.bb
    i32 90, label %sw.bb
    i32 91, label %sw.bb
    i32 92, label %sw.bb
    i32 93, label %sw.bb
    i32 94, label %sw.bb
    i32 95, label %sw.bb
    i32 97, label %sw.bb
    i32 98, label %sw.bb
    i32 99, label %sw.bb
    i32 100, label %sw.bb
    i32 101, label %sw.bb
    i32 102, label %sw.bb
    i32 103, label %sw.bb
    i32 104, label %sw.bb
    i32 105, label %sw.bb
    i32 106, label %sw.bb
    i32 107, label %sw.bb
    i32 108, label %sw.bb
    i32 109, label %sw.bb
    i32 110, label %sw.bb
    i32 111, label %sw.bb
    i32 112, label %sw.bb
    i32 113, label %sw.bb
    i32 114, label %sw.bb
    i32 115, label %sw.bb
    i32 116, label %sw.bb
    i32 117, label %sw.bb
    i32 118, label %sw.bb
    i32 119, label %sw.bb
    i32 120, label %sw.bb
    i32 121, label %sw.bb
    i32 122, label %sw.bb
    i32 123, label %sw.bb
    i32 124, label %sw.bb
    i32 125, label %sw.bb
    i32 126, label %sw.bb
  ]

sw.bb:                                            ; preds = %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry
  store i32 1, i32* %retval, align 4
  br label %return

sw.default:                                       ; preds = %entry
  %1 = load i32, i32* %wc.addr, align 4
  %call = call i32 @wcwidth(i32 %1)
  store i32 %call, i32* %retval, align 4
  br label %return

return:                                           ; preds = %sw.default, %sw.bb
  %2 = load i32, i32* %retval, align 4
  ret i32 %2
}

; Function Attrs: noinline nounwind
define i32 @_rl_get_char_len(i8* %src, %struct.__mbstate_t* %ps) #0 {
entry:
  %retval = alloca i32, align 4
  %src.addr = alloca i8*, align 4
  %ps.addr = alloca %struct.__mbstate_t*, align 4
  %tmp = alloca i32, align 4
  store i8* %src, i8** %src.addr, align 4
  store %struct.__mbstate_t* %ps, %struct.__mbstate_t** %ps.addr, align 4
  %0 = load i8*, i8** %src.addr, align 4
  %1 = load i8*, i8** %src.addr, align 4
  %call = call i32 @strlen(i8* %1)
  %2 = load %struct.__mbstate_t*, %struct.__mbstate_t** %ps.addr, align 4
  %call1 = call i32 @mbrlen(i8* %0, i32 %call, %struct.__mbstate_t* %2)
  store i32 %call1, i32* %tmp, align 4
  %3 = load i32, i32* %tmp, align 4
  %cmp = icmp eq i32 %3, -2
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %4 = load %struct.__mbstate_t*, %struct.__mbstate_t** %ps.addr, align 4
  %tobool = icmp ne %struct.__mbstate_t* %4, null
  br i1 %tobool, label %if.then2, label %if.end

if.then2:                                         ; preds = %if.then
  %5 = load %struct.__mbstate_t*, %struct.__mbstate_t** %ps.addr, align 4
  %6 = bitcast %struct.__mbstate_t* %5 to i8*
  call void @llvm.memset.p0i8.i32(i8* %6, i8 0, i32 8, i32 4, i1 false)
  br label %if.end

if.end:                                           ; preds = %if.then2, %if.then
  store i32 -2, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %entry
  %7 = load i32, i32* %tmp, align 4
  %cmp3 = icmp eq i32 %7, -1
  br i1 %cmp3, label %if.then4, label %if.else8

if.then4:                                         ; preds = %if.else
  %8 = load %struct.__mbstate_t*, %struct.__mbstate_t** %ps.addr, align 4
  %tobool5 = icmp ne %struct.__mbstate_t* %8, null
  br i1 %tobool5, label %if.then6, label %if.end7

if.then6:                                         ; preds = %if.then4
  %9 = load %struct.__mbstate_t*, %struct.__mbstate_t** %ps.addr, align 4
  %10 = bitcast %struct.__mbstate_t* %9 to i8*
  call void @llvm.memset.p0i8.i32(i8* %10, i8 0, i32 8, i32 4, i1 false)
  br label %if.end7

if.end7:                                          ; preds = %if.then6, %if.then4
  store i32 -1, i32* %retval, align 4
  br label %return

if.else8:                                         ; preds = %if.else
  %11 = load i32, i32* %tmp, align 4
  %cmp9 = icmp eq i32 %11, 0
  br i1 %cmp9, label %if.then10, label %if.else11

if.then10:                                        ; preds = %if.else8
  store i32 0, i32* %retval, align 4
  br label %return

if.else11:                                        ; preds = %if.else8
  %12 = load i32, i32* %tmp, align 4
  store i32 %12, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.else11, %if.then10, %if.end7, %if.end
  %13 = load i32, i32* %retval, align 4
  ret i32 %13
}

declare i32 @mbrlen(i8*, i32, %struct.__mbstate_t*) #2

; Function Attrs: noinline nounwind
define i32 @_rl_compare_chars(i8* %buf1, i32 %pos1, %struct.__mbstate_t* %ps1, i8* %buf2, i32 %pos2, %struct.__mbstate_t* %ps2) #0 {
entry:
  %retval = alloca i32, align 4
  %buf1.addr = alloca i8*, align 4
  %pos1.addr = alloca i32, align 4
  %ps1.addr = alloca %struct.__mbstate_t*, align 4
  %buf2.addr = alloca i8*, align 4
  %pos2.addr = alloca i32, align 4
  %ps2.addr = alloca %struct.__mbstate_t*, align 4
  %i = alloca i32, align 4
  %w1 = alloca i32, align 4
  %w2 = alloca i32, align 4
  store i8* %buf1, i8** %buf1.addr, align 4
  store i32 %pos1, i32* %pos1.addr, align 4
  store %struct.__mbstate_t* %ps1, %struct.__mbstate_t** %ps1.addr, align 4
  store i8* %buf2, i8** %buf2.addr, align 4
  store i32 %pos2, i32* %pos2.addr, align 4
  store %struct.__mbstate_t* %ps2, %struct.__mbstate_t** %ps2.addr, align 4
  %0 = load i8*, i8** %buf1.addr, align 4
  %1 = load i32, i32* %pos1.addr, align 4
  %arrayidx = getelementptr inbounds i8, i8* %0, i32 %1
  %2 = load %struct.__mbstate_t*, %struct.__mbstate_t** %ps1.addr, align 4
  %call = call i32 @_rl_get_char_len(i8* %arrayidx, %struct.__mbstate_t* %2)
  store i32 %call, i32* %w1, align 4
  %cmp = icmp sle i32 %call, 0
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %3 = load i8*, i8** %buf2.addr, align 4
  %4 = load i32, i32* %pos2.addr, align 4
  %arrayidx1 = getelementptr inbounds i8, i8* %3, i32 %4
  %5 = load %struct.__mbstate_t*, %struct.__mbstate_t** %ps2.addr, align 4
  %call2 = call i32 @_rl_get_char_len(i8* %arrayidx1, %struct.__mbstate_t* %5)
  store i32 %call2, i32* %w2, align 4
  %cmp3 = icmp sle i32 %call2, 0
  br i1 %cmp3, label %if.then, label %lor.lhs.false4

lor.lhs.false4:                                   ; preds = %lor.lhs.false
  %6 = load i32, i32* %w1, align 4
  %7 = load i32, i32* %w2, align 4
  %cmp5 = icmp ne i32 %6, %7
  br i1 %cmp5, label %if.then, label %lor.lhs.false6

lor.lhs.false6:                                   ; preds = %lor.lhs.false4
  %8 = load i8*, i8** %buf1.addr, align 4
  %9 = load i32, i32* %pos1.addr, align 4
  %arrayidx7 = getelementptr inbounds i8, i8* %8, i32 %9
  %10 = load i8, i8* %arrayidx7, align 1
  %conv = sext i8 %10 to i32
  %11 = load i8*, i8** %buf2.addr, align 4
  %12 = load i32, i32* %pos2.addr, align 4
  %arrayidx8 = getelementptr inbounds i8, i8* %11, i32 %12
  %13 = load i8, i8* %arrayidx8, align 1
  %conv9 = sext i8 %13 to i32
  %cmp10 = icmp ne i32 %conv, %conv9
  br i1 %cmp10, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false6, %lor.lhs.false4, %lor.lhs.false, %entry
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false6
  store i32 1, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %14 = load i32, i32* %i, align 4
  %15 = load i32, i32* %w1, align 4
  %cmp12 = icmp slt i32 %14, %15
  br i1 %cmp12, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %16 = load i8*, i8** %buf1.addr, align 4
  %17 = load i32, i32* %pos1.addr, align 4
  %18 = load i32, i32* %i, align 4
  %add = add nsw i32 %17, %18
  %arrayidx14 = getelementptr inbounds i8, i8* %16, i32 %add
  %19 = load i8, i8* %arrayidx14, align 1
  %conv15 = sext i8 %19 to i32
  %20 = load i8*, i8** %buf2.addr, align 4
  %21 = load i32, i32* %pos2.addr, align 4
  %22 = load i32, i32* %i, align 4
  %add16 = add nsw i32 %21, %22
  %arrayidx17 = getelementptr inbounds i8, i8* %20, i32 %add16
  %23 = load i8, i8* %arrayidx17, align 1
  %conv18 = sext i8 %23 to i32
  %cmp19 = icmp ne i32 %conv15, %conv18
  br i1 %cmp19, label %if.then21, label %if.end22

if.then21:                                        ; preds = %for.body
  store i32 0, i32* %retval, align 4
  br label %return

if.end22:                                         ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end22
  %24 = load i32, i32* %i, align 4
  %inc = add nsw i32 %24, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then21, %if.then
  %25 = load i32, i32* %retval, align 4
  ret i32 %25
}

; Function Attrs: noinline nounwind
define i32 @_rl_adjust_point(i8* %string, i32 %point, %struct.__mbstate_t* %ps) #0 {
entry:
  %retval = alloca i32, align 4
  %string.addr = alloca i8*, align 4
  %point.addr = alloca i32, align 4
  %ps.addr = alloca %struct.__mbstate_t*, align 4
  %tmp = alloca i32, align 4
  %length = alloca i32, align 4
  %pos = alloca i32, align 4
  store i8* %string, i8** %string.addr, align 4
  store i32 %point, i32* %point.addr, align 4
  store %struct.__mbstate_t* %ps, %struct.__mbstate_t** %ps.addr, align 4
  store i32 0, i32* %tmp, align 4
  store i32 0, i32* %pos, align 4
  %0 = load i8*, i8** %string.addr, align 4
  %call = call i32 @strlen(i8* %0)
  store i32 %call, i32* %length, align 4
  %1 = load i32, i32* %point.addr, align 4
  %cmp = icmp slt i32 %1, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %2 = load i32, i32* %length, align 4
  %3 = load i32, i32* %point.addr, align 4
  %cmp3 = icmp slt i32 %2, %3
  br i1 %cmp3, label %if.then4, label %if.end5

if.then4:                                         ; preds = %if.end
  store i32 -1, i32* %retval, align 4
  br label %return

if.end5:                                          ; preds = %if.end
  br label %while.cond

while.cond:                                       ; preds = %if.end18, %if.end5
  %4 = load i32, i32* %pos, align 4
  %5 = load i32, i32* %point.addr, align 4
  %cmp6 = icmp slt i32 %4, %5
  br i1 %cmp6, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %6 = load i8*, i8** %string.addr, align 4
  %7 = load i32, i32* %pos, align 4
  %add.ptr = getelementptr inbounds i8, i8* %6, i32 %7
  %8 = load i32, i32* %length, align 4
  %9 = load i32, i32* %pos, align 4
  %sub = sub nsw i32 %8, %9
  %10 = load %struct.__mbstate_t*, %struct.__mbstate_t** %ps.addr, align 4
  %call7 = call i32 @mbrlen(i8* %add.ptr, i32 %sub, %struct.__mbstate_t* %10)
  store i32 %call7, i32* %tmp, align 4
  %11 = load i32, i32* %tmp, align 4
  %cmp8 = icmp eq i32 %11, -1
  br i1 %cmp8, label %if.then10, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %while.body
  %12 = load i32, i32* %tmp, align 4
  %cmp9 = icmp eq i32 %12, -2
  br i1 %cmp9, label %if.then10, label %if.else

if.then10:                                        ; preds = %lor.lhs.false, %while.body
  %13 = load i32, i32* %pos, align 4
  %inc = add nsw i32 %13, 1
  store i32 %inc, i32* %pos, align 4
  %14 = load %struct.__mbstate_t*, %struct.__mbstate_t** %ps.addr, align 4
  %tobool = icmp ne %struct.__mbstate_t* %14, null
  br i1 %tobool, label %if.then11, label %if.end12

if.then11:                                        ; preds = %if.then10
  %15 = load %struct.__mbstate_t*, %struct.__mbstate_t** %ps.addr, align 4
  %16 = bitcast %struct.__mbstate_t* %15 to i8*
  call void @llvm.memset.p0i8.i32(i8* %16, i8 0, i32 8, i32 4, i1 false)
  br label %if.end12

if.end12:                                         ; preds = %if.then11, %if.then10
  br label %if.end18

if.else:                                          ; preds = %lor.lhs.false
  %17 = load i32, i32* %tmp, align 4
  %cmp13 = icmp eq i32 %17, 0
  br i1 %cmp13, label %if.then14, label %if.else16

if.then14:                                        ; preds = %if.else
  %18 = load i32, i32* %pos, align 4
  %inc15 = add nsw i32 %18, 1
  store i32 %inc15, i32* %pos, align 4
  br label %if.end17

if.else16:                                        ; preds = %if.else
  %19 = load i32, i32* %tmp, align 4
  %20 = load i32, i32* %pos, align 4
  %add = add i32 %20, %19
  store i32 %add, i32* %pos, align 4
  br label %if.end17

if.end17:                                         ; preds = %if.else16, %if.then14
  br label %if.end18

if.end18:                                         ; preds = %if.end17, %if.end12
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %21 = load i32, i32* %pos, align 4
  %22 = load i32, i32* %point.addr, align 4
  %sub19 = sub nsw i32 %21, %22
  store i32 %sub19, i32* %retval, align 4
  br label %return

return:                                           ; preds = %while.end, %if.then4, %if.then
  %23 = load i32, i32* %retval, align 4
  ret i32 %23
}

; Function Attrs: noinline nounwind
define i32 @_rl_is_mbchar_matched(i8* %string, i32 %seed, i32 %end, i8* %mbchar, i32 %length) #0 {
entry:
  %retval = alloca i32, align 4
  %string.addr = alloca i8*, align 4
  %seed.addr = alloca i32, align 4
  %end.addr = alloca i32, align 4
  %mbchar.addr = alloca i8*, align 4
  %length.addr = alloca i32, align 4
  %i = alloca i32, align 4
  store i8* %string, i8** %string.addr, align 4
  store i32 %seed, i32* %seed.addr, align 4
  store i32 %end, i32* %end.addr, align 4
  store i8* %mbchar, i8** %mbchar.addr, align 4
  store i32 %length, i32* %length.addr, align 4
  %0 = load i32, i32* %end.addr, align 4
  %1 = load i32, i32* %seed.addr, align 4
  %sub = sub nsw i32 %0, %1
  %2 = load i32, i32* %length.addr, align 4
  %cmp = icmp slt i32 %sub, %2
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4
  %4 = load i32, i32* %length.addr, align 4
  %cmp1 = icmp slt i32 %3, %4
  br i1 %cmp1, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %5 = load i8*, i8** %string.addr, align 4
  %6 = load i32, i32* %seed.addr, align 4
  %7 = load i32, i32* %i, align 4
  %add = add nsw i32 %6, %7
  %arrayidx = getelementptr inbounds i8, i8* %5, i32 %add
  %8 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %8 to i32
  %9 = load i8*, i8** %mbchar.addr, align 4
  %10 = load i32, i32* %i, align 4
  %arrayidx2 = getelementptr inbounds i8, i8* %9, i32 %10
  %11 = load i8, i8* %arrayidx2, align 1
  %conv3 = sext i8 %11 to i32
  %cmp4 = icmp ne i32 %conv, %conv3
  br i1 %cmp4, label %if.then6, label %if.end7

if.then6:                                         ; preds = %for.body
  store i32 0, i32* %retval, align 4
  br label %return

if.end7:                                          ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end7
  %12 = load i32, i32* %i, align 4
  %inc = add nsw i32 %12, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then6, %if.then
  %13 = load i32, i32* %retval, align 4
  ret i32 %13
}

; Function Attrs: noinline nounwind
define i32 @_rl_char_value(i8* %buf, i32 %ind) #0 {
entry:
  %retval = alloca i32, align 4
  %buf.addr = alloca i8*, align 4
  %ind.addr = alloca i32, align 4
  %tmp = alloca i32, align 4
  %wc = alloca i32, align 4
  %ps = alloca %struct.__mbstate_t, align 4
  %l = alloca i32, align 4
  store i8* %buf, i8** %buf.addr, align 4
  store i32 %ind, i32* %ind.addr, align 4
  %0 = load i32, i32* @rl_byte_oriented, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %buf.addr, align 4
  %2 = load i32, i32* %ind.addr, align 4
  %arrayidx = getelementptr inbounds i8, i8* %1, i32 %2
  %3 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %3 to i32
  store i32 %conv, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %4 = load i8*, i8** %buf.addr, align 4
  %call = call i32 @strlen(i8* %4)
  store i32 %call, i32* %l, align 4
  %5 = load i32, i32* %ind.addr, align 4
  %6 = load i32, i32* %l, align 4
  %sub = sub nsw i32 %6, 1
  %cmp = icmp sge i32 %5, %sub
  br i1 %cmp, label %if.then5, label %if.end8

if.then5:                                         ; preds = %if.end
  %7 = load i8*, i8** %buf.addr, align 4
  %8 = load i32, i32* %ind.addr, align 4
  %arrayidx6 = getelementptr inbounds i8, i8* %7, i32 %8
  %9 = load i8, i8* %arrayidx6, align 1
  %conv7 = sext i8 %9 to i32
  store i32 %conv7, i32* %retval, align 4
  br label %return

if.end8:                                          ; preds = %if.end
  %10 = bitcast %struct.__mbstate_t* %ps to i8*
  call void @llvm.memset.p0i8.i32(i8* %10, i8 0, i32 8, i32 4, i1 false)
  %11 = load i8*, i8** %buf.addr, align 4
  %12 = load i32, i32* %ind.addr, align 4
  %add.ptr = getelementptr inbounds i8, i8* %11, i32 %12
  %13 = load i32, i32* %l, align 4
  %14 = load i32, i32* %ind.addr, align 4
  %sub9 = sub nsw i32 %13, %14
  %call10 = call i32 @mbrtowc(i32* %wc, i8* %add.ptr, i32 %sub9, %struct.__mbstate_t* %ps)
  store i32 %call10, i32* %tmp, align 4
  %15 = load i32, i32* %tmp, align 4
  %cmp11 = icmp eq i32 %15, -1
  br i1 %cmp11, label %if.then18, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end8
  %16 = load i32, i32* %tmp, align 4
  %cmp13 = icmp eq i32 %16, -2
  br i1 %cmp13, label %if.then18, label %lor.lhs.false15

lor.lhs.false15:                                  ; preds = %lor.lhs.false
  %17 = load i32, i32* %tmp, align 4
  %cmp16 = icmp eq i32 %17, 0
  br i1 %cmp16, label %if.then18, label %if.end21

if.then18:                                        ; preds = %lor.lhs.false15, %lor.lhs.false, %if.end8
  %18 = load i8*, i8** %buf.addr, align 4
  %19 = load i32, i32* %ind.addr, align 4
  %arrayidx19 = getelementptr inbounds i8, i8* %18, i32 %19
  %20 = load i8, i8* %arrayidx19, align 1
  %conv20 = sext i8 %20 to i32
  store i32 %conv20, i32* %retval, align 4
  br label %return

if.end21:                                         ; preds = %lor.lhs.false15
  %21 = load i32, i32* %wc, align 4
  store i32 %21, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end21, %if.then18, %if.then5, %if.then
  %22 = load i32, i32* %retval, align 4
  ret i32 %22
}

; Function Attrs: noinline nounwind
define i32 @_rl_find_next_mbchar(i8* %string, i32 %seed, i32 %count, i32 %flags) #0 {
entry:
  %string.addr = alloca i8*, align 4
  %seed.addr = alloca i32, align 4
  %count.addr = alloca i32, align 4
  %flags.addr = alloca i32, align 4
  store i8* %string, i8** %string.addr, align 4
  store i32 %seed, i32* %seed.addr, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %0 = load i8*, i8** %string.addr, align 4
  %1 = load i32, i32* %seed.addr, align 4
  %2 = load i32, i32* %count.addr, align 4
  %3 = load i32, i32* %flags.addr, align 4
  %call = call i32 @_rl_find_next_mbchar_internal(i8* %0, i32 %1, i32 %2, i32 %3)
  ret i32 %call
}

; Function Attrs: noinline nounwind
define internal i32 @_rl_find_next_mbchar_internal(i8* %string, i32 %seed, i32 %count, i32 %find_non_zero) #0 {
entry:
  %retval = alloca i32, align 4
  %string.addr = alloca i8*, align 4
  %seed.addr = alloca i32, align 4
  %count.addr = alloca i32, align 4
  %find_non_zero.addr = alloca i32, align 4
  %tmp = alloca i32, align 4
  %len = alloca i32, align 4
  %ps = alloca %struct.__mbstate_t, align 4
  %point = alloca i32, align 4
  %wc = alloca i32, align 4
  store i8* %string, i8** %string.addr, align 4
  store i32 %seed, i32* %seed.addr, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %find_non_zero, i32* %find_non_zero.addr, align 4
  store i32 0, i32* %tmp, align 4
  %0 = bitcast %struct.__mbstate_t* %ps to i8*
  call void @llvm.memset.p0i8.i32(i8* %0, i8 0, i32 8, i32 4, i1 false)
  %1 = load i32, i32* %seed.addr, align 4
  %cmp = icmp slt i32 %1, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, i32* %seed.addr, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %2 = load i32, i32* %count.addr, align 4
  %cmp5 = icmp sle i32 %2, 0
  br i1 %cmp5, label %if.then6, label %if.end7

if.then6:                                         ; preds = %if.end
  %3 = load i32, i32* %seed.addr, align 4
  store i32 %3, i32* %retval, align 4
  br label %return

if.end7:                                          ; preds = %if.end
  %4 = load i32, i32* %seed.addr, align 4
  %5 = load i8*, i8** %string.addr, align 4
  %6 = load i32, i32* %seed.addr, align 4
  %call = call i32 @_rl_adjust_point(i8* %5, i32 %6, %struct.__mbstate_t* %ps)
  %add = add nsw i32 %4, %call
  store i32 %add, i32* %point, align 4
  %7 = load i32, i32* %seed.addr, align 4
  %8 = load i32, i32* %point, align 4
  %cmp8 = icmp slt i32 %7, %8
  br i1 %cmp8, label %if.then9, label %if.end10

if.then9:                                         ; preds = %if.end7
  %9 = load i32, i32* %count.addr, align 4
  %dec = add nsw i32 %9, -1
  store i32 %dec, i32* %count.addr, align 4
  br label %if.end10

if.end10:                                         ; preds = %if.then9, %if.end7
  br label %while.cond

while.cond:                                       ; preds = %if.end37, %if.then29, %if.end10
  %10 = load i32, i32* %count.addr, align 4
  %cmp11 = icmp sgt i32 %10, 0
  br i1 %cmp11, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %11 = load i8*, i8** %string.addr, align 4
  %12 = load i32, i32* %point, align 4
  %add.ptr = getelementptr inbounds i8, i8* %11, i32 %12
  %call12 = call i32 @strlen(i8* %add.ptr)
  store i32 %call12, i32* %len, align 4
  %13 = load i32, i32* %len, align 4
  %cmp13 = icmp eq i32 %13, 0
  br i1 %cmp13, label %if.then14, label %if.end15

if.then14:                                        ; preds = %while.body
  br label %while.end

if.end15:                                         ; preds = %while.body
  %14 = load i8*, i8** %string.addr, align 4
  %15 = load i32, i32* %point, align 4
  %add.ptr16 = getelementptr inbounds i8, i8* %14, i32 %15
  %16 = load i32, i32* %len, align 4
  %call17 = call i32 @mbrtowc(i32* %wc, i8* %add.ptr16, i32 %16, %struct.__mbstate_t* %ps)
  store i32 %call17, i32* %tmp, align 4
  %17 = load i32, i32* %tmp, align 4
  %cmp18 = icmp eq i32 %17, -1
  br i1 %cmp18, label %if.then20, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end15
  %18 = load i32, i32* %tmp, align 4
  %cmp19 = icmp eq i32 %18, -2
  br i1 %cmp19, label %if.then20, label %if.else

if.then20:                                        ; preds = %lor.lhs.false, %if.end15
  %19 = load i32, i32* %point, align 4
  %inc = add nsw i32 %19, 1
  store i32 %inc, i32* %point, align 4
  %20 = load i32, i32* %count.addr, align 4
  %dec21 = add nsw i32 %20, -1
  store i32 %dec21, i32* %count.addr, align 4
  %21 = bitcast %struct.__mbstate_t* %ps to i8*
  call void @llvm.memset.p0i8.i32(i8* %21, i8 0, i32 8, i32 4, i1 false)
  br label %if.end37

if.else:                                          ; preds = %lor.lhs.false
  %22 = load i32, i32* %tmp, align 4
  %cmp22 = icmp eq i32 %22, 0
  br i1 %cmp22, label %if.then23, label %if.else24

if.then23:                                        ; preds = %if.else
  br label %while.end

if.else24:                                        ; preds = %if.else
  %23 = load i32, i32* %tmp, align 4
  %24 = load i32, i32* %point, align 4
  %add25 = add i32 %24, %23
  store i32 %add25, i32* %point, align 4
  %25 = load i32, i32* %find_non_zero.addr, align 4
  %tobool = icmp ne i32 %25, 0
  br i1 %tobool, label %if.then26, label %if.else33

if.then26:                                        ; preds = %if.else24
  %26 = load i32, i32* %wc, align 4
  %call27 = call i32 @_rl_wcwidth(i32 %26)
  %cmp28 = icmp eq i32 %call27, 0
  br i1 %cmp28, label %if.then29, label %if.else30

if.then29:                                        ; preds = %if.then26
  br label %while.cond

if.else30:                                        ; preds = %if.then26
  %27 = load i32, i32* %count.addr, align 4
  %dec31 = add nsw i32 %27, -1
  store i32 %dec31, i32* %count.addr, align 4
  br label %if.end32

if.end32:                                         ; preds = %if.else30
  br label %if.end35

if.else33:                                        ; preds = %if.else24
  %28 = load i32, i32* %count.addr, align 4
  %dec34 = add nsw i32 %28, -1
  store i32 %dec34, i32* %count.addr, align 4
  br label %if.end35

if.end35:                                         ; preds = %if.else33, %if.end32
  br label %if.end36

if.end36:                                         ; preds = %if.end35
  br label %if.end37

if.end37:                                         ; preds = %if.end36, %if.then20
  br label %while.cond

while.end:                                        ; preds = %if.then23, %if.then14, %while.cond
  %29 = load i32, i32* %find_non_zero.addr, align 4
  %tobool38 = icmp ne i32 %29, 0
  br i1 %tobool38, label %if.then39, label %if.end64

if.then39:                                        ; preds = %while.end
  %30 = load i8*, i8** %string.addr, align 4
  %31 = load i32, i32* %point, align 4
  %add.ptr40 = getelementptr inbounds i8, i8* %30, i32 %31
  %32 = load i8*, i8** %string.addr, align 4
  %33 = load i32, i32* %point, align 4
  %add.ptr41 = getelementptr inbounds i8, i8* %32, i32 %33
  %call42 = call i32 @strlen(i8* %add.ptr41)
  %call43 = call i32 @mbrtowc(i32* %wc, i8* %add.ptr40, i32 %call42, %struct.__mbstate_t* %ps)
  store i32 %call43, i32* %tmp, align 4
  br label %while.cond44

while.cond44:                                     ; preds = %while.body57, %if.then39
  %34 = load i32, i32* %tmp, align 4
  %cmp45 = icmp eq i32 %34, 0
  %conv = zext i1 %cmp45 to i32
  %cmp46 = icmp eq i32 %conv, 0
  br i1 %cmp46, label %land.lhs.true, label %land.end

land.lhs.true:                                    ; preds = %while.cond44
  %35 = load i32, i32* %tmp, align 4
  %cmp48 = icmp eq i32 %35, -1
  br i1 %cmp48, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %land.lhs.true
  %36 = load i32, i32* %tmp, align 4
  %cmp50 = icmp eq i32 %36, -2
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %land.lhs.true
  %37 = phi i1 [ true, %land.lhs.true ], [ %cmp50, %lor.rhs ]
  %lor.ext = zext i1 %37 to i32
  %cmp52 = icmp eq i32 %lor.ext, 0
  br i1 %cmp52, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %lor.end
  %38 = load i32, i32* %wc, align 4
  %call54 = call i32 @_rl_wcwidth(i32 %38)
  %cmp55 = icmp eq i32 %call54, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %lor.end, %while.cond44
  %39 = phi i1 [ false, %lor.end ], [ false, %while.cond44 ], [ %cmp55, %land.rhs ]
  br i1 %39, label %while.body57, label %while.end63

while.body57:                                     ; preds = %land.end
  %40 = load i32, i32* %tmp, align 4
  %41 = load i32, i32* %point, align 4
  %add58 = add i32 %41, %40
  store i32 %add58, i32* %point, align 4
  %42 = load i8*, i8** %string.addr, align 4
  %43 = load i32, i32* %point, align 4
  %add.ptr59 = getelementptr inbounds i8, i8* %42, i32 %43
  %44 = load i8*, i8** %string.addr, align 4
  %45 = load i32, i32* %point, align 4
  %add.ptr60 = getelementptr inbounds i8, i8* %44, i32 %45
  %call61 = call i32 @strlen(i8* %add.ptr60)
  %call62 = call i32 @mbrtowc(i32* %wc, i8* %add.ptr59, i32 %call61, %struct.__mbstate_t* %ps)
  store i32 %call62, i32* %tmp, align 4
  br label %while.cond44

while.end63:                                      ; preds = %land.end
  br label %if.end64

if.end64:                                         ; preds = %while.end63, %while.end
  %46 = load i32, i32* %point, align 4
  store i32 %46, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end64, %if.then6
  %47 = load i32, i32* %retval, align 4
  ret i32 %47
}

; Function Attrs: noinline nounwind
define i32 @_rl_find_prev_mbchar(i8* %string, i32 %seed, i32 %flags) #0 {
entry:
  %string.addr = alloca i8*, align 4
  %seed.addr = alloca i32, align 4
  %flags.addr = alloca i32, align 4
  store i8* %string, i8** %string.addr, align 4
  store i32 %seed, i32* %seed.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %0 = load i8*, i8** %string.addr, align 4
  %1 = load i32, i32* %seed.addr, align 4
  %2 = load i32, i32* %flags.addr, align 4
  %call = call i32 @_rl_find_prev_mbchar_internal(i8* %0, i32 %1, i32 %2)
  ret i32 %call
}

declare i32 @wcwidth(i32) #2

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
