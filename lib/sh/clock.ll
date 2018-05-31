; ModuleID = 'clock.c'
source_filename = "clock.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct._IO_FILE = type opaque

@clock_t_to_secs.clk_tck = internal global i32 -1, align 4
@.str = private unnamed_addr constant [13 x i8] c"%ldm%d.%03ds\00", align 1

; Function Attrs: noinline nounwind
define void @clock_t_to_secs(i32 %t, i32* %sp, i32* %sfp) #0 {
entry:
  %t.addr = alloca i32, align 4
  %sp.addr = alloca i32*, align 4
  %sfp.addr = alloca i32*, align 4
  store i32 %t, i32* %t.addr, align 4
  store i32* %sp, i32** %sp.addr, align 4
  store i32* %sfp, i32** %sfp.addr, align 4
  %0 = load i32, i32* @clock_t_to_secs.clk_tck, align 4
  %cmp = icmp eq i32 %0, -1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call = call i32 @get_clk_tck()
  store i32 %call, i32* @clock_t_to_secs.clk_tck, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* %t.addr, align 4
  %2 = load i32, i32* @clock_t_to_secs.clk_tck, align 4
  %rem = srem i32 %1, %2
  %3 = load i32*, i32** %sfp.addr, align 4
  store i32 %rem, i32* %3, align 4
  %4 = load i32*, i32** %sfp.addr, align 4
  %5 = load i32, i32* %4, align 4
  %mul = mul nsw i32 %5, 1000
  %6 = load i32, i32* @clock_t_to_secs.clk_tck, align 4
  %div = sdiv i32 %mul, %6
  %7 = load i32*, i32** %sfp.addr, align 4
  store i32 %div, i32* %7, align 4
  %8 = load i32, i32* %t.addr, align 4
  %9 = load i32, i32* @clock_t_to_secs.clk_tck, align 4
  %div1 = sdiv i32 %8, %9
  %10 = load i32*, i32** %sp.addr, align 4
  store i32 %div1, i32* %10, align 4
  %11 = load i32*, i32** %sfp.addr, align 4
  %12 = load i32, i32* %11, align 4
  %cmp2 = icmp sge i32 %12, 1000
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  %13 = load i32*, i32** %sp.addr, align 4
  %14 = load i32, i32* %13, align 4
  %add = add nsw i32 %14, 1
  store i32 %add, i32* %13, align 4
  %15 = load i32*, i32** %sfp.addr, align 4
  %16 = load i32, i32* %15, align 4
  %sub = sub nsw i32 %16, 1000
  store i32 %sub, i32* %15, align 4
  br label %if.end4

if.end4:                                          ; preds = %if.then3, %if.end
  ret void
}

declare i32 @get_clk_tck() #1

; Function Attrs: noinline nounwind
define void @print_clock_t(%struct._IO_FILE* %fp, i32 %t) #0 {
entry:
  %fp.addr = alloca %struct._IO_FILE*, align 4
  %t.addr = alloca i32, align 4
  %timestamp = alloca i32, align 4
  %minutes = alloca i32, align 4
  %seconds = alloca i32, align 4
  %seconds_fraction = alloca i32, align 4
  store %struct._IO_FILE* %fp, %struct._IO_FILE** %fp.addr, align 4
  store i32 %t, i32* %t.addr, align 4
  %0 = load i32, i32* %t.addr, align 4
  call void @clock_t_to_secs(i32 %0, i32* %timestamp, i32* %seconds_fraction)
  %1 = load i32, i32* %timestamp, align 4
  %div = sdiv i32 %1, 60
  store i32 %div, i32* %minutes, align 4
  %2 = load i32, i32* %timestamp, align 4
  %rem = srem i32 %2, 60
  store i32 %rem, i32* %seconds, align 4
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** %fp.addr, align 4
  %4 = load i32, i32* %minutes, align 4
  %5 = load i32, i32* %seconds, align 4
  %6 = load i32, i32* %seconds_fraction, align 4
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str, i32 0, i32 0), i32 %4, i32 %5, i32 %6)
  ret void
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
