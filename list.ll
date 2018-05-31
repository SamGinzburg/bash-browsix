; ModuleID = 'list.c'
source_filename = "list.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.g_list = type { %struct.g_list* }

@global_error_list = common global %struct.g_list zeroinitializer, align 4

; Function Attrs: noinline nounwind
define %struct.g_list* @list_reverse(%struct.g_list* %list) #0 {
entry:
  %list.addr = alloca %struct.g_list*, align 4
  %next = alloca %struct.g_list*, align 4
  %prev = alloca %struct.g_list*, align 4
  store %struct.g_list* %list, %struct.g_list** %list.addr, align 4
  store %struct.g_list* null, %struct.g_list** %prev, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.body, %entry
  %0 = load %struct.g_list*, %struct.g_list** %list.addr, align 4
  %tobool = icmp ne %struct.g_list* %0, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load %struct.g_list*, %struct.g_list** %list.addr, align 4
  %next1 = getelementptr inbounds %struct.g_list, %struct.g_list* %1, i32 0, i32 0
  %2 = load %struct.g_list*, %struct.g_list** %next1, align 4
  store %struct.g_list* %2, %struct.g_list** %next, align 4
  %3 = load %struct.g_list*, %struct.g_list** %prev, align 4
  %4 = load %struct.g_list*, %struct.g_list** %list.addr, align 4
  %next2 = getelementptr inbounds %struct.g_list, %struct.g_list* %4, i32 0, i32 0
  store %struct.g_list* %3, %struct.g_list** %next2, align 4
  %5 = load %struct.g_list*, %struct.g_list** %list.addr, align 4
  store %struct.g_list* %5, %struct.g_list** %prev, align 4
  %6 = load %struct.g_list*, %struct.g_list** %next, align 4
  store %struct.g_list* %6, %struct.g_list** %list.addr, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %7 = load %struct.g_list*, %struct.g_list** %prev, align 4
  ret %struct.g_list* %7
}

; Function Attrs: noinline nounwind
define i32 @list_length(%struct.g_list* %list) #0 {
entry:
  %list.addr = alloca %struct.g_list*, align 4
  %i = alloca i32, align 4
  store %struct.g_list* %list, %struct.g_list** %list.addr, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load %struct.g_list*, %struct.g_list** %list.addr, align 4
  %tobool = icmp ne %struct.g_list* %0, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %1 = load %struct.g_list*, %struct.g_list** %list.addr, align 4
  %next = getelementptr inbounds %struct.g_list, %struct.g_list* %1, i32 0, i32 0
  %2 = load %struct.g_list*, %struct.g_list** %next, align 4
  store %struct.g_list* %2, %struct.g_list** %list.addr, align 4
  %3 = load i32, i32* %i, align 4
  %inc = add nsw i32 %3, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %4 = load i32, i32* %i, align 4
  ret i32 %4
}

; Function Attrs: noinline nounwind
define %struct.g_list* @list_append(%struct.g_list* %head, %struct.g_list* %tail) #0 {
entry:
  %retval = alloca %struct.g_list*, align 4
  %head.addr = alloca %struct.g_list*, align 4
  %tail.addr = alloca %struct.g_list*, align 4
  %t_head = alloca %struct.g_list*, align 4
  store %struct.g_list* %head, %struct.g_list** %head.addr, align 4
  store %struct.g_list* %tail, %struct.g_list** %tail.addr, align 4
  %0 = load %struct.g_list*, %struct.g_list** %head.addr, align 4
  %cmp = icmp eq %struct.g_list* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load %struct.g_list*, %struct.g_list** %tail.addr, align 4
  store %struct.g_list* %1, %struct.g_list** %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %2 = load %struct.g_list*, %struct.g_list** %head.addr, align 4
  store %struct.g_list* %2, %struct.g_list** %t_head, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load %struct.g_list*, %struct.g_list** %t_head, align 4
  %next = getelementptr inbounds %struct.g_list, %struct.g_list* %3, i32 0, i32 0
  %4 = load %struct.g_list*, %struct.g_list** %next, align 4
  %tobool = icmp ne %struct.g_list* %4, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %5 = load %struct.g_list*, %struct.g_list** %t_head, align 4
  %next1 = getelementptr inbounds %struct.g_list, %struct.g_list* %5, i32 0, i32 0
  %6 = load %struct.g_list*, %struct.g_list** %next1, align 4
  store %struct.g_list* %6, %struct.g_list** %t_head, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %7 = load %struct.g_list*, %struct.g_list** %tail.addr, align 4
  %8 = load %struct.g_list*, %struct.g_list** %t_head, align 4
  %next2 = getelementptr inbounds %struct.g_list, %struct.g_list* %8, i32 0, i32 0
  store %struct.g_list* %7, %struct.g_list** %next2, align 4
  %9 = load %struct.g_list*, %struct.g_list** %head.addr, align 4
  store %struct.g_list* %9, %struct.g_list** %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then
  %10 = load %struct.g_list*, %struct.g_list** %retval, align 4
  ret %struct.g_list* %10
}

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
