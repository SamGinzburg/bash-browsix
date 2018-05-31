; ModuleID = 'times.c'
source_filename = "times.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct._IO_FILE = type opaque
%struct.word_list = type { %struct.word_list*, %struct.word_desc* }
%struct.word_desc = type { i8*, i32 }
%struct.rusage = type { %struct.timeval, %struct.timeval, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, [16 x i32] }
%struct.timeval = type { i32, i32 }

@stdout = external constant %struct._IO_FILE*, align 4

; Function Attrs: noinline nounwind
define i32 @times_builtin(%struct.word_list* %list) #0 {
entry:
  %retval = alloca i32, align 4
  %list.addr = alloca %struct.word_list*, align 4
  %self = alloca %struct.rusage, align 4
  %kids = alloca %struct.rusage, align 4
  store %struct.word_list* %list, %struct.word_list** %list.addr, align 4
  %0 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %call = call i32 @no_options(%struct.word_list* %0)
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 258, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %call1 = call i32 @getrusage(i32 0, %struct.rusage* %self)
  %call2 = call i32 @getrusage(i32 -1, %struct.rusage* %kids)
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  %ru_utime = getelementptr inbounds %struct.rusage, %struct.rusage* %self, i32 0, i32 0
  call void bitcast (void (...)* @print_timeval to void (%struct._IO_FILE*, %struct.timeval*)*)(%struct._IO_FILE* %1, %struct.timeval* %ru_utime)
  %call3 = call i32 @putchar(i32 32)
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  %ru_stime = getelementptr inbounds %struct.rusage, %struct.rusage* %self, i32 0, i32 1
  call void bitcast (void (...)* @print_timeval to void (%struct._IO_FILE*, %struct.timeval*)*)(%struct._IO_FILE* %2, %struct.timeval* %ru_stime)
  %call4 = call i32 @putchar(i32 10)
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  %ru_utime5 = getelementptr inbounds %struct.rusage, %struct.rusage* %kids, i32 0, i32 0
  call void bitcast (void (...)* @print_timeval to void (%struct._IO_FILE*, %struct.timeval*)*)(%struct._IO_FILE* %3, %struct.timeval* %ru_utime5)
  %call6 = call i32 @putchar(i32 32)
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  %ru_stime7 = getelementptr inbounds %struct.rusage, %struct.rusage* %kids, i32 0, i32 1
  call void bitcast (void (...)* @print_timeval to void (%struct._IO_FILE*, %struct.timeval*)*)(%struct._IO_FILE* %4, %struct.timeval* %ru_stime7)
  %call8 = call i32 @putchar(i32 10)
  %call9 = call i32 @sh_chkwrite(i32 0)
  store i32 %call9, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %5 = load i32, i32* %retval, align 4
  ret i32 %5
}

declare i32 @no_options(%struct.word_list*) #1

declare i32 @getrusage(i32, %struct.rusage*) #1

declare void @print_timeval(...) #1

declare i32 @putchar(i32) #1

declare i32 @sh_chkwrite(i32) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
