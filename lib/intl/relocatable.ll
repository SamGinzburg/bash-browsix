; ModuleID = 'relocatable.c'
source_filename = "relocatable.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

@orig_prefix = internal global i8* null, align 4
@curr_prefix = internal global i8* null, align 4
@orig_prefix_len = internal global i32 0, align 4
@curr_prefix_len = internal global i32 0, align 4

; Function Attrs: noinline nounwind
define void @libintl_set_relocation_prefix(i8* %orig_prefix_arg, i8* %curr_prefix_arg) #0 {
entry:
  %orig_prefix_arg.addr = alloca i8*, align 4
  %curr_prefix_arg.addr = alloca i8*, align 4
  store i8* %orig_prefix_arg, i8** %orig_prefix_arg.addr, align 4
  store i8* %curr_prefix_arg, i8** %curr_prefix_arg.addr, align 4
  %0 = load i8*, i8** %orig_prefix_arg.addr, align 4
  %1 = load i8*, i8** %curr_prefix_arg.addr, align 4
  call void @set_this_relocation_prefix(i8* %0, i8* %1)
  ret void
}

; Function Attrs: noinline nounwind
define internal void @set_this_relocation_prefix(i8* %orig_prefix_arg, i8* %curr_prefix_arg) #0 {
entry:
  %orig_prefix_arg.addr = alloca i8*, align 4
  %curr_prefix_arg.addr = alloca i8*, align 4
  %memory = alloca i8*, align 4
  store i8* %orig_prefix_arg, i8** %orig_prefix_arg.addr, align 4
  store i8* %curr_prefix_arg, i8** %curr_prefix_arg.addr, align 4
  %0 = load i8*, i8** %orig_prefix_arg.addr, align 4
  %cmp = icmp ne i8* %0, null
  br i1 %cmp, label %land.lhs.true, label %if.end14

land.lhs.true:                                    ; preds = %entry
  %1 = load i8*, i8** %curr_prefix_arg.addr, align 4
  %cmp1 = icmp ne i8* %1, null
  br i1 %cmp1, label %land.lhs.true2, label %if.end14

land.lhs.true2:                                   ; preds = %land.lhs.true
  %2 = load i8*, i8** %orig_prefix_arg.addr, align 4
  %3 = load i8*, i8** %curr_prefix_arg.addr, align 4
  %call = call i32 @strcmp(i8* %2, i8* %3)
  %cmp3 = icmp ne i32 %call, 0
  br i1 %cmp3, label %if.then, label %if.end14

if.then:                                          ; preds = %land.lhs.true2
  %4 = load i8*, i8** %orig_prefix_arg.addr, align 4
  %call4 = call i32 @strlen(i8* %4)
  store i32 %call4, i32* @orig_prefix_len, align 4
  %5 = load i8*, i8** %curr_prefix_arg.addr, align 4
  %call5 = call i32 @strlen(i8* %5)
  store i32 %call5, i32* @curr_prefix_len, align 4
  %6 = load i32, i32* @orig_prefix_len, align 4
  %add = add i32 %6, 1
  %7 = load i32, i32* @curr_prefix_len, align 4
  %add6 = add i32 %add, %7
  %add7 = add i32 %add6, 1
  %call8 = call i8* @malloc(i32 %add7)
  store i8* %call8, i8** %memory, align 4
  %8 = load i8*, i8** %memory, align 4
  %cmp9 = icmp ne i8* %8, null
  br i1 %cmp9, label %if.then10, label %if.end

if.then10:                                        ; preds = %if.then
  %9 = load i8*, i8** %memory, align 4
  %10 = load i8*, i8** %orig_prefix_arg.addr, align 4
  %11 = load i32, i32* @orig_prefix_len, align 4
  %add11 = add i32 %11, 1
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %9, i8* %10, i32 %add11, i32 1, i1 false)
  %12 = load i8*, i8** %memory, align 4
  store i8* %12, i8** @orig_prefix, align 4
  %13 = load i32, i32* @orig_prefix_len, align 4
  %add12 = add i32 %13, 1
  %14 = load i8*, i8** %memory, align 4
  %add.ptr = getelementptr inbounds i8, i8* %14, i32 %add12
  store i8* %add.ptr, i8** %memory, align 4
  %15 = load i8*, i8** %memory, align 4
  %16 = load i8*, i8** %curr_prefix_arg.addr, align 4
  %17 = load i32, i32* @curr_prefix_len, align 4
  %add13 = add i32 %17, 1
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %15, i8* %16, i32 %add13, i32 1, i1 false)
  %18 = load i8*, i8** %memory, align 4
  store i8* %18, i8** @curr_prefix, align 4
  br label %return

if.end:                                           ; preds = %if.then
  br label %if.end14

if.end14:                                         ; preds = %if.end, %land.lhs.true2, %land.lhs.true, %entry
  store i8* null, i8** @orig_prefix, align 4
  store i8* null, i8** @curr_prefix, align 4
  br label %return

return:                                           ; preds = %if.end14, %if.then10
  ret void
}

; Function Attrs: noinline nounwind
define i8* @libintl_relocate(i8* %pathname) #0 {
entry:
  %retval = alloca i8*, align 4
  %pathname.addr = alloca i8*, align 4
  %pathname_tail = alloca i8*, align 4
  %result = alloca i8*, align 4
  store i8* %pathname, i8** %pathname.addr, align 4
  %0 = load i8*, i8** @orig_prefix, align 4
  %cmp = icmp ne i8* %0, null
  br i1 %cmp, label %land.lhs.true, label %if.end22

land.lhs.true:                                    ; preds = %entry
  %1 = load i8*, i8** @curr_prefix, align 4
  %cmp1 = icmp ne i8* %1, null
  br i1 %cmp1, label %land.lhs.true2, label %if.end22

land.lhs.true2:                                   ; preds = %land.lhs.true
  %2 = load i8*, i8** %pathname.addr, align 4
  %3 = load i8*, i8** @orig_prefix, align 4
  %4 = load i32, i32* @orig_prefix_len, align 4
  %call = call i32 @strncmp(i8* %2, i8* %3, i32 %4)
  %cmp3 = icmp eq i32 %call, 0
  br i1 %cmp3, label %if.then, label %if.end22

if.then:                                          ; preds = %land.lhs.true2
  %5 = load i8*, i8** %pathname.addr, align 4
  %6 = load i32, i32* @orig_prefix_len, align 4
  %arrayidx = getelementptr inbounds i8, i8* %5, i32 %6
  %7 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %7 to i32
  %cmp4 = icmp eq i32 %conv, 0
  br i1 %cmp4, label %if.then6, label %if.end

if.then6:                                         ; preds = %if.then
  %8 = load i8*, i8** @curr_prefix, align 4
  store i8* %8, i8** %retval, align 4
  br label %return

if.end:                                           ; preds = %if.then
  %9 = load i8*, i8** %pathname.addr, align 4
  %10 = load i32, i32* @orig_prefix_len, align 4
  %arrayidx7 = getelementptr inbounds i8, i8* %9, i32 %10
  %11 = load i8, i8* %arrayidx7, align 1
  %conv8 = sext i8 %11 to i32
  %cmp9 = icmp eq i32 %conv8, 47
  br i1 %cmp9, label %if.then11, label %if.end21

if.then11:                                        ; preds = %if.end
  %12 = load i8*, i8** %pathname.addr, align 4
  %13 = load i32, i32* @orig_prefix_len, align 4
  %arrayidx12 = getelementptr inbounds i8, i8* %12, i32 %13
  store i8* %arrayidx12, i8** %pathname_tail, align 4
  %14 = load i32, i32* @curr_prefix_len, align 4
  %15 = load i8*, i8** %pathname_tail, align 4
  %call13 = call i32 @strlen(i8* %15)
  %add = add i32 %14, %call13
  %add14 = add i32 %add, 1
  %call15 = call i8* @malloc(i32 %add14)
  store i8* %call15, i8** %result, align 4
  %16 = load i8*, i8** %result, align 4
  %cmp16 = icmp ne i8* %16, null
  br i1 %cmp16, label %if.then18, label %if.end20

if.then18:                                        ; preds = %if.then11
  %17 = load i8*, i8** %result, align 4
  %18 = load i8*, i8** @curr_prefix, align 4
  %19 = load i32, i32* @curr_prefix_len, align 4
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %17, i8* %18, i32 %19, i32 1, i1 false)
  %20 = load i8*, i8** %result, align 4
  %21 = load i32, i32* @curr_prefix_len, align 4
  %add.ptr = getelementptr inbounds i8, i8* %20, i32 %21
  %22 = load i8*, i8** %pathname_tail, align 4
  %call19 = call i8* @strcpy(i8* %add.ptr, i8* %22)
  %23 = load i8*, i8** %result, align 4
  store i8* %23, i8** %retval, align 4
  br label %return

if.end20:                                         ; preds = %if.then11
  br label %if.end21

if.end21:                                         ; preds = %if.end20, %if.end
  br label %if.end22

if.end22:                                         ; preds = %if.end21, %land.lhs.true2, %land.lhs.true, %entry
  %24 = load i8*, i8** %pathname.addr, align 4
  store i8* %24, i8** %retval, align 4
  br label %return

return:                                           ; preds = %if.end22, %if.then18, %if.then6
  %25 = load i8*, i8** %retval, align 4
  ret i8* %25
}

declare i32 @strncmp(i8*, i8*, i32) #1

declare i8* @malloc(i32) #1

declare i32 @strlen(i8*) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* nocapture writeonly, i8* nocapture readonly, i32, i32, i1) #2

declare i8* @strcpy(i8*, i8*) #1

declare i32 @strcmp(i8*, i8*) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
