; ModuleID = 'parens.c'
source_filename = "parens.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct._keymap_entry = type { i8, i32 (i32, i32)* }
%struct._IO_FILE = type opaque
%struct.timeval = type { i32, i32 }
%struct.fd_set = type { [32 x i32] }

@rl_blink_matching_paren = global i32 0, align 4
@emacs_standard_keymap = external global [257 x %struct._keymap_entry], align 4
@vi_insertion_keymap = external global [257 x %struct._keymap_entry], align 4
@_paren_blink_usec = internal global i32 500000, align 4
@rl_explicit_arg = external global i32, align 4
@rl_redisplay_function = external global void ()*, align 4
@rl_line_buffer = external global i8*, align 4
@rl_point = external global i32, align 4
@rl_instream = external global %struct._IO_FILE*, align 4
@rl_basic_quote_characters = external global i8*, align 4

; Function Attrs: noinline nounwind
define void @_rl_enable_paren_matching(i32 %on_or_off) #0 {
entry:
  %on_or_off.addr = alloca i32, align 4
  store i32 %on_or_off, i32* %on_or_off.addr, align 4
  %0 = load i32, i32* %on_or_off.addr, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %call = call i32 @rl_bind_key_in_map(i32 41, i32 (i32, i32)* @rl_insert_close, %struct._keymap_entry* getelementptr inbounds ([257 x %struct._keymap_entry], [257 x %struct._keymap_entry]* @emacs_standard_keymap, i32 0, i32 0))
  %call1 = call i32 @rl_bind_key_in_map(i32 93, i32 (i32, i32)* @rl_insert_close, %struct._keymap_entry* getelementptr inbounds ([257 x %struct._keymap_entry], [257 x %struct._keymap_entry]* @emacs_standard_keymap, i32 0, i32 0))
  %call2 = call i32 @rl_bind_key_in_map(i32 125, i32 (i32, i32)* @rl_insert_close, %struct._keymap_entry* getelementptr inbounds ([257 x %struct._keymap_entry], [257 x %struct._keymap_entry]* @emacs_standard_keymap, i32 0, i32 0))
  %call3 = call i32 @rl_bind_key_in_map(i32 41, i32 (i32, i32)* @rl_insert_close, %struct._keymap_entry* getelementptr inbounds ([257 x %struct._keymap_entry], [257 x %struct._keymap_entry]* @vi_insertion_keymap, i32 0, i32 0))
  %call4 = call i32 @rl_bind_key_in_map(i32 93, i32 (i32, i32)* @rl_insert_close, %struct._keymap_entry* getelementptr inbounds ([257 x %struct._keymap_entry], [257 x %struct._keymap_entry]* @vi_insertion_keymap, i32 0, i32 0))
  %call5 = call i32 @rl_bind_key_in_map(i32 125, i32 (i32, i32)* @rl_insert_close, %struct._keymap_entry* getelementptr inbounds ([257 x %struct._keymap_entry], [257 x %struct._keymap_entry]* @vi_insertion_keymap, i32 0, i32 0))
  br label %if.end

if.else:                                          ; preds = %entry
  %call6 = call i32 @rl_bind_key_in_map(i32 41, i32 (i32, i32)* @rl_insert, %struct._keymap_entry* getelementptr inbounds ([257 x %struct._keymap_entry], [257 x %struct._keymap_entry]* @emacs_standard_keymap, i32 0, i32 0))
  %call7 = call i32 @rl_bind_key_in_map(i32 93, i32 (i32, i32)* @rl_insert, %struct._keymap_entry* getelementptr inbounds ([257 x %struct._keymap_entry], [257 x %struct._keymap_entry]* @emacs_standard_keymap, i32 0, i32 0))
  %call8 = call i32 @rl_bind_key_in_map(i32 125, i32 (i32, i32)* @rl_insert, %struct._keymap_entry* getelementptr inbounds ([257 x %struct._keymap_entry], [257 x %struct._keymap_entry]* @emacs_standard_keymap, i32 0, i32 0))
  %call9 = call i32 @rl_bind_key_in_map(i32 41, i32 (i32, i32)* @rl_insert, %struct._keymap_entry* getelementptr inbounds ([257 x %struct._keymap_entry], [257 x %struct._keymap_entry]* @vi_insertion_keymap, i32 0, i32 0))
  %call10 = call i32 @rl_bind_key_in_map(i32 93, i32 (i32, i32)* @rl_insert, %struct._keymap_entry* getelementptr inbounds ([257 x %struct._keymap_entry], [257 x %struct._keymap_entry]* @vi_insertion_keymap, i32 0, i32 0))
  %call11 = call i32 @rl_bind_key_in_map(i32 125, i32 (i32, i32)* @rl_insert, %struct._keymap_entry* getelementptr inbounds ([257 x %struct._keymap_entry], [257 x %struct._keymap_entry]* @vi_insertion_keymap, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void
}

declare i32 @rl_bind_key_in_map(i32, i32 (i32, i32)*, %struct._keymap_entry*) #1

; Function Attrs: noinline nounwind
define i32 @rl_insert_close(i32 %count, i32 %invoking_key) #0 {
entry:
  %retval = alloca i32, align 4
  %count.addr = alloca i32, align 4
  %invoking_key.addr = alloca i32, align 4
  %orig_point = alloca i32, align 4
  %match_point = alloca i32, align 4
  %ready = alloca i32, align 4
  %timer = alloca %struct.timeval, align 4
  %readfds = alloca %struct.fd_set, align 4
  %__i = alloca i32, align 4
  %__b = alloca i32*, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %invoking_key, i32* %invoking_key.addr, align 4
  %0 = load i32, i32* @rl_explicit_arg, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i32, i32* @rl_blink_matching_paren, align 4
  %tobool1 = icmp ne i32 %1, 0
  br i1 %tobool1, label %if.else, label %if.then

if.then:                                          ; preds = %lor.lhs.false, %entry
  %2 = load i32, i32* %count.addr, align 4
  %3 = load i32, i32* %invoking_key.addr, align 4
  %call = call i32 @_rl_insert_char(i32 %2, i32 %3)
  br label %if.end14

if.else:                                          ; preds = %lor.lhs.false
  %4 = load i32, i32* %invoking_key.addr, align 4
  %call2 = call i32 @_rl_insert_char(i32 1, i32 %4)
  %5 = load void ()*, void ()** @rl_redisplay_function, align 4
  call void %5()
  %6 = load i8*, i8** @rl_line_buffer, align 4
  %7 = load i32, i32* @rl_point, align 4
  %sub = sub nsw i32 %7, 2
  %8 = load i32, i32* %invoking_key.addr, align 4
  %call3 = call i32 @find_matching_open(i8* %6, i32 %sub, i32 %8)
  store i32 %call3, i32* %match_point, align 4
  %9 = load i32, i32* %match_point, align 4
  %cmp = icmp slt i32 %9, 0
  br i1 %cmp, label %if.then4, label %if.end

if.then4:                                         ; preds = %if.else
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %if.else
  br label %do.body

do.body:                                          ; preds = %if.end
  %fds_bits = getelementptr inbounds %struct.fd_set, %struct.fd_set* %readfds, i32 0, i32 0
  %arraydecay = getelementptr inbounds [32 x i32], [32 x i32]* %fds_bits, i32 0, i32 0
  store i32* %arraydecay, i32** %__b, align 4
  store i32 32, i32* %__i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %do.body
  %10 = load i32, i32* %__i, align 4
  %tobool5 = icmp ne i32 %10, 0
  br i1 %tobool5, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %11 = load i32*, i32** %__b, align 4
  %incdec.ptr = getelementptr inbounds i32, i32* %11, i32 1
  store i32* %incdec.ptr, i32** %__b, align 4
  store i32 0, i32* %11, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %12 = load i32, i32* %__i, align 4
  %dec = add nsw i32 %12, -1
  store i32 %dec, i32* %__i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  br label %do.end

do.end:                                           ; preds = %for.end
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @rl_instream, align 4
  %call6 = call i32 @fileno(%struct._IO_FILE* %13)
  %rem = urem i32 %call6, 32
  %shl = shl i32 1, %rem
  %fds_bits7 = getelementptr inbounds %struct.fd_set, %struct.fd_set* %readfds, i32 0, i32 0
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @rl_instream, align 4
  %call8 = call i32 @fileno(%struct._IO_FILE* %14)
  %div = udiv i32 %call8, 32
  %arrayidx = getelementptr inbounds [32 x i32], [32 x i32]* %fds_bits7, i32 0, i32 %div
  %15 = load i32, i32* %arrayidx, align 4
  %or = or i32 %15, %shl
  store i32 %or, i32* %arrayidx, align 4
  br label %do.body9

do.body9:                                         ; preds = %do.end
  %16 = load i32, i32* @_paren_blink_usec, align 4
  %div10 = sdiv i32 %16, 1000000
  %tv_sec = getelementptr inbounds %struct.timeval, %struct.timeval* %timer, i32 0, i32 0
  store i32 %div10, i32* %tv_sec, align 4
  %17 = load i32, i32* @_paren_blink_usec, align 4
  %rem11 = srem i32 %17, 1000000
  %tv_usec = getelementptr inbounds %struct.timeval, %struct.timeval* %timer, i32 0, i32 1
  store i32 %rem11, i32* %tv_usec, align 4
  br label %do.end12

do.end12:                                         ; preds = %do.body9
  %18 = load i32, i32* @rl_point, align 4
  store i32 %18, i32* %orig_point, align 4
  %19 = load i32, i32* %match_point, align 4
  store i32 %19, i32* @rl_point, align 4
  %20 = load void ()*, void ()** @rl_redisplay_function, align 4
  call void %20()
  %call13 = call i32 @select(i32 1, %struct.fd_set* %readfds, %struct.fd_set* null, %struct.fd_set* null, %struct.timeval* %timer)
  store i32 %call13, i32* %ready, align 4
  %21 = load i32, i32* %orig_point, align 4
  store i32 %21, i32* @rl_point, align 4
  br label %if.end14

if.end14:                                         ; preds = %do.end12, %if.then
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end14, %if.then4
  %22 = load i32, i32* %retval, align 4
  ret i32 %22
}

declare i32 @rl_insert(i32, i32) #1

; Function Attrs: noinline nounwind
define i32 @rl_set_paren_blink_timeout(i32 %u) #0 {
entry:
  %u.addr = alloca i32, align 4
  %o = alloca i32, align 4
  store i32 %u, i32* %u.addr, align 4
  %0 = load i32, i32* @_paren_blink_usec, align 4
  store i32 %0, i32* %o, align 4
  %1 = load i32, i32* %u.addr, align 4
  %cmp = icmp sgt i32 %1, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %u.addr, align 4
  store i32 %2, i32* @_paren_blink_usec, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %3 = load i32, i32* %o, align 4
  ret i32 %3
}

declare i32 @_rl_insert_char(i32, i32) #1

; Function Attrs: noinline nounwind
define internal i32 @find_matching_open(i8* %string, i32 %from, i32 %closer) #0 {
entry:
  %retval = alloca i32, align 4
  %string.addr = alloca i8*, align 4
  %from.addr = alloca i32, align 4
  %closer.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %opener = alloca i32, align 4
  %level = alloca i32, align 4
  %delimiter = alloca i32, align 4
  store i8* %string, i8** %string.addr, align 4
  store i32 %from, i32* %from.addr, align 4
  store i32 %closer, i32* %closer.addr, align 4
  %0 = load i32, i32* %closer.addr, align 4
  switch i32 %0, label %sw.default [
    i32 93, label %sw.bb
    i32 125, label %sw.bb1
    i32 41, label %sw.bb2
  ]

sw.bb:                                            ; preds = %entry
  store i32 91, i32* %opener, align 4
  br label %sw.epilog

sw.bb1:                                           ; preds = %entry
  store i32 123, i32* %opener, align 4
  br label %sw.epilog

sw.bb2:                                           ; preds = %entry
  store i32 40, i32* %opener, align 4
  br label %sw.epilog

sw.default:                                       ; preds = %entry
  store i32 -1, i32* %retval, align 4
  br label %return

sw.epilog:                                        ; preds = %sw.bb2, %sw.bb1, %sw.bb
  store i32 1, i32* %level, align 4
  store i32 0, i32* %delimiter, align 4
  %1 = load i32, i32* %from.addr, align 4
  store i32 %1, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %sw.epilog
  %2 = load i32, i32* %i, align 4
  %cmp = icmp sgt i32 %2, -1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load i32, i32* %delimiter, align 4
  %tobool = icmp ne i32 %3, 0
  br i1 %tobool, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %for.body
  %4 = load i8*, i8** %string.addr, align 4
  %5 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds i8, i8* %4, i32 %5
  %6 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %6 to i32
  %7 = load i32, i32* %delimiter, align 4
  %cmp3 = icmp eq i32 %conv, %7
  br i1 %cmp3, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true
  store i32 0, i32* %delimiter, align 4
  br label %if.end31

if.else:                                          ; preds = %land.lhs.true, %for.body
  %8 = load i8*, i8** @rl_basic_quote_characters, align 4
  %tobool5 = icmp ne i8* %8, null
  br i1 %tobool5, label %land.lhs.true6, label %if.else13

land.lhs.true6:                                   ; preds = %if.else
  %9 = load i8*, i8** @rl_basic_quote_characters, align 4
  %10 = load i8*, i8** %string.addr, align 4
  %11 = load i32, i32* %i, align 4
  %arrayidx7 = getelementptr inbounds i8, i8* %10, i32 %11
  %12 = load i8, i8* %arrayidx7, align 1
  %conv8 = sext i8 %12 to i32
  %call = call i8* @strchr(i8* %9, i32 %conv8)
  %tobool9 = icmp ne i8* %call, null
  br i1 %tobool9, label %if.then10, label %if.else13

if.then10:                                        ; preds = %land.lhs.true6
  %13 = load i8*, i8** %string.addr, align 4
  %14 = load i32, i32* %i, align 4
  %arrayidx11 = getelementptr inbounds i8, i8* %13, i32 %14
  %15 = load i8, i8* %arrayidx11, align 1
  %conv12 = sext i8 %15 to i32
  store i32 %conv12, i32* %delimiter, align 4
  br label %if.end30

if.else13:                                        ; preds = %land.lhs.true6, %if.else
  %16 = load i32, i32* %delimiter, align 4
  %tobool14 = icmp ne i32 %16, 0
  br i1 %tobool14, label %if.else21, label %land.lhs.true15

land.lhs.true15:                                  ; preds = %if.else13
  %17 = load i8*, i8** %string.addr, align 4
  %18 = load i32, i32* %i, align 4
  %arrayidx16 = getelementptr inbounds i8, i8* %17, i32 %18
  %19 = load i8, i8* %arrayidx16, align 1
  %conv17 = sext i8 %19 to i32
  %20 = load i32, i32* %closer.addr, align 4
  %cmp18 = icmp eq i32 %conv17, %20
  br i1 %cmp18, label %if.then20, label %if.else21

if.then20:                                        ; preds = %land.lhs.true15
  %21 = load i32, i32* %level, align 4
  %inc = add nsw i32 %21, 1
  store i32 %inc, i32* %level, align 4
  br label %if.end29

if.else21:                                        ; preds = %land.lhs.true15, %if.else13
  %22 = load i32, i32* %delimiter, align 4
  %tobool22 = icmp ne i32 %22, 0
  br i1 %tobool22, label %if.end, label %land.lhs.true23

land.lhs.true23:                                  ; preds = %if.else21
  %23 = load i8*, i8** %string.addr, align 4
  %24 = load i32, i32* %i, align 4
  %arrayidx24 = getelementptr inbounds i8, i8* %23, i32 %24
  %25 = load i8, i8* %arrayidx24, align 1
  %conv25 = sext i8 %25 to i32
  %26 = load i32, i32* %opener, align 4
  %cmp26 = icmp eq i32 %conv25, %26
  br i1 %cmp26, label %if.then28, label %if.end

if.then28:                                        ; preds = %land.lhs.true23
  %27 = load i32, i32* %level, align 4
  %dec = add nsw i32 %27, -1
  store i32 %dec, i32* %level, align 4
  br label %if.end

if.end:                                           ; preds = %if.then28, %land.lhs.true23, %if.else21
  br label %if.end29

if.end29:                                         ; preds = %if.end, %if.then20
  br label %if.end30

if.end30:                                         ; preds = %if.end29, %if.then10
  br label %if.end31

if.end31:                                         ; preds = %if.end30, %if.then
  %28 = load i32, i32* %level, align 4
  %tobool32 = icmp ne i32 %28, 0
  br i1 %tobool32, label %if.end34, label %if.then33

if.then33:                                        ; preds = %if.end31
  br label %for.end

if.end34:                                         ; preds = %if.end31
  br label %for.inc

for.inc:                                          ; preds = %if.end34
  %29 = load i32, i32* %i, align 4
  %dec35 = add nsw i32 %29, -1
  store i32 %dec35, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then33, %for.cond
  %30 = load i32, i32* %i, align 4
  store i32 %30, i32* %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %sw.default
  %31 = load i32, i32* %retval, align 4
  ret i32 %31
}

declare i32 @fileno(%struct._IO_FILE*) #1

declare i32 @select(i32, %struct.fd_set*, %struct.fd_set*, %struct.fd_set*, %struct.timeval*) #1

declare i8* @strchr(i8*, i32) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
