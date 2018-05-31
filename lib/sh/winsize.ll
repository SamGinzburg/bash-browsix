; ModuleID = 'winsize.c'
source_filename = "winsize.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct._IO_FILE = type opaque
%struct.winsize = type { i16, i16, i16, i16 }

@shell_tty = external global i32, align 4
@stderr = external constant %struct._IO_FILE*, align 4

; Function Attrs: noinline nounwind
define void @get_new_window_size(i32 %from_sig, i32* %rp, i32* %cp) #0 {
entry:
  %from_sig.addr = alloca i32, align 4
  %rp.addr = alloca i32*, align 4
  %cp.addr = alloca i32*, align 4
  %win = alloca %struct.winsize, align 2
  %tty = alloca i32, align 4
  store i32 %from_sig, i32* %from_sig.addr, align 4
  store i32* %rp, i32** %rp.addr, align 4
  store i32* %cp, i32** %cp.addr, align 4
  %0 = load i32, i32* @shell_tty, align 4
  %cmp = icmp ne i32 %0, -1
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %1 = load i32, i32* @shell_tty, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %call = call i32 @fileno(%struct._IO_FILE* %2)
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %1, %cond.true ], [ %call, %cond.false ]
  store i32 %cond, i32* %tty, align 4
  %3 = load i32, i32* %tty, align 4
  %cmp1 = icmp sge i32 %3, 0
  br i1 %cmp1, label %land.lhs.true, label %if.end27

land.lhs.true:                                    ; preds = %cond.end
  %4 = load i32, i32* %tty, align 4
  %call2 = call i32 (i32, i32, ...) @ioctl(i32 %4, i32 21523, %struct.winsize* %win)
  %cmp3 = icmp eq i32 %call2, 0
  br i1 %cmp3, label %land.lhs.true4, label %if.end27

land.lhs.true4:                                   ; preds = %land.lhs.true
  %ws_row = getelementptr inbounds %struct.winsize, %struct.winsize* %win, i32 0, i32 0
  %5 = load i16, i16* %ws_row, align 2
  %conv = zext i16 %5 to i32
  %cmp5 = icmp sgt i32 %conv, 0
  br i1 %cmp5, label %land.lhs.true7, label %if.end27

land.lhs.true7:                                   ; preds = %land.lhs.true4
  %ws_col = getelementptr inbounds %struct.winsize, %struct.winsize* %win, i32 0, i32 1
  %6 = load i16, i16* %ws_col, align 2
  %conv8 = zext i16 %6 to i32
  %cmp9 = icmp sgt i32 %conv8, 0
  br i1 %cmp9, label %if.then, label %if.end27

if.then:                                          ; preds = %land.lhs.true7
  %ws_row11 = getelementptr inbounds %struct.winsize, %struct.winsize* %win, i32 0, i32 0
  %7 = load i16, i16* %ws_row11, align 2
  %conv12 = zext i16 %7 to i32
  %ws_col13 = getelementptr inbounds %struct.winsize, %struct.winsize* %win, i32 0, i32 1
  %8 = load i16, i16* %ws_col13, align 2
  %conv14 = zext i16 %8 to i32
  call void @sh_set_lines_and_columns(i32 %conv12, i32 %conv14)
  %ws_row15 = getelementptr inbounds %struct.winsize, %struct.winsize* %win, i32 0, i32 0
  %9 = load i16, i16* %ws_row15, align 2
  %conv16 = zext i16 %9 to i32
  %ws_col17 = getelementptr inbounds %struct.winsize, %struct.winsize* %win, i32 0, i32 1
  %10 = load i16, i16* %ws_col17, align 2
  %conv18 = zext i16 %10 to i32
  call void @rl_set_screen_size(i32 %conv16, i32 %conv18)
  %11 = load i32*, i32** %rp.addr, align 4
  %tobool = icmp ne i32* %11, null
  br i1 %tobool, label %if.then19, label %if.end

if.then19:                                        ; preds = %if.then
  %ws_row20 = getelementptr inbounds %struct.winsize, %struct.winsize* %win, i32 0, i32 0
  %12 = load i16, i16* %ws_row20, align 2
  %conv21 = zext i16 %12 to i32
  %13 = load i32*, i32** %rp.addr, align 4
  store i32 %conv21, i32* %13, align 4
  br label %if.end

if.end:                                           ; preds = %if.then19, %if.then
  %14 = load i32*, i32** %cp.addr, align 4
  %tobool22 = icmp ne i32* %14, null
  br i1 %tobool22, label %if.then23, label %if.end26

if.then23:                                        ; preds = %if.end
  %ws_col24 = getelementptr inbounds %struct.winsize, %struct.winsize* %win, i32 0, i32 1
  %15 = load i16, i16* %ws_col24, align 2
  %conv25 = zext i16 %15 to i32
  %16 = load i32*, i32** %cp.addr, align 4
  store i32 %conv25, i32* %16, align 4
  br label %if.end26

if.end26:                                         ; preds = %if.then23, %if.end
  br label %if.end27

if.end27:                                         ; preds = %if.end26, %land.lhs.true7, %land.lhs.true4, %land.lhs.true, %cond.end
  ret void
}

declare i32 @fileno(%struct._IO_FILE*) #1

declare i32 @ioctl(i32, i32, ...) #1

declare void @sh_set_lines_and_columns(i32, i32) #1

declare void @rl_set_screen_size(i32, i32) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
