; ModuleID = 'oslib.c'
source_filename = "oslib.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

@getmaxgroups.maxgroups = internal global i32 -1, align 4
@getmaxchild.maxchild = internal global i32 -1, align 4

; Function Attrs: noinline nounwind
define i32 @getdtablesize() #0 {
entry:
  %call = call i32 @sysconf(i32 4)
  ret i32 %call
}

declare i32 @sysconf(i32) #1

; Function Attrs: noinline nounwind
define i32 @getmaxgroups() #0 {
entry:
  %retval = alloca i32, align 4
  %0 = load i32, i32* @getmaxgroups.maxgroups, align 4
  %cmp = icmp sgt i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i32, i32* @getmaxgroups.maxgroups, align 4
  store i32 %1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %call = call i32 @sysconf(i32 3)
  store i32 %call, i32* @getmaxgroups.maxgroups, align 4
  %2 = load i32, i32* @getmaxgroups.maxgroups, align 4
  %cmp1 = icmp sle i32 %2, 0
  br i1 %cmp1, label %if.then2, label %if.end3

if.then2:                                         ; preds = %if.end
  store i32 64, i32* @getmaxgroups.maxgroups, align 4
  br label %if.end3

if.end3:                                          ; preds = %if.then2, %if.end
  %3 = load i32, i32* @getmaxgroups.maxgroups, align 4
  store i32 %3, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end3, %if.then
  %4 = load i32, i32* %retval, align 4
  ret i32 %4
}

; Function Attrs: noinline nounwind
define i32 @getmaxchild() #0 {
entry:
  %retval = alloca i32, align 4
  %0 = load i32, i32* @getmaxchild.maxchild, align 4
  %cmp = icmp sgt i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i32, i32* @getmaxchild.maxchild, align 4
  store i32 %1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %call = call i32 @sysconf(i32 1)
  store i32 %call, i32* @getmaxchild.maxchild, align 4
  %2 = load i32, i32* @getmaxchild.maxchild, align 4
  store i32 %2, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %3 = load i32, i32* %retval, align 4
  ret i32 %3
}

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
