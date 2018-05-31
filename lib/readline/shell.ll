; ModuleID = 'shell.c'
source_filename = "shell.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.passwd = type { i8*, i8*, i32, i32, i8*, i8*, i8* }

@setenv_buf = internal global [12 x i8] zeroinitializer, align 1
@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.1 = private unnamed_addr constant [6 x i8] c"LINES\00", align 1
@.str.2 = private unnamed_addr constant [8 x i8] c"COLUMNS\00", align 1
@sh_get_home_dir.home_dir = internal global i8* null, align 4

; Function Attrs: noinline nounwind
define i8* @sh_single_quote(i8* %string) #0 {
entry:
  %string.addr = alloca i8*, align 4
  %c = alloca i32, align 4
  %result = alloca i8*, align 4
  %r = alloca i8*, align 4
  %s = alloca i8*, align 4
  store i8* %string, i8** %string.addr, align 4
  %0 = load i8*, i8** %string.addr, align 4
  %call = call i32 @strlen(i8* %0)
  %mul = mul i32 4, %call
  %add = add i32 3, %mul
  %call1 = call i8* @xmalloc(i32 %add)
  store i8* %call1, i8** %result, align 4
  %1 = load i8*, i8** %result, align 4
  store i8* %1, i8** %r, align 4
  %2 = load i8*, i8** %r, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %2, i32 1
  store i8* %incdec.ptr, i8** %r, align 4
  store i8 39, i8* %2, align 1
  %3 = load i8*, i8** %string.addr, align 4
  store i8* %3, i8** %s, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i8*, i8** %s, align 4
  %tobool = icmp ne i8* %4, null
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.cond
  %5 = load i8*, i8** %s, align 4
  %6 = load i8, i8* %5, align 1
  %conv = sext i8 %6 to i32
  store i32 %conv, i32* %c, align 4
  %tobool2 = icmp ne i32 %conv, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %7 = phi i1 [ false, %for.cond ], [ %tobool2, %land.rhs ]
  br i1 %7, label %for.body, label %for.end

for.body:                                         ; preds = %land.end
  %8 = load i32, i32* %c, align 4
  %conv3 = trunc i32 %8 to i8
  %9 = load i8*, i8** %r, align 4
  %incdec.ptr4 = getelementptr inbounds i8, i8* %9, i32 1
  store i8* %incdec.ptr4, i8** %r, align 4
  store i8 %conv3, i8* %9, align 1
  %10 = load i32, i32* %c, align 4
  %cmp = icmp eq i32 %10, 39
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %11 = load i8*, i8** %r, align 4
  %incdec.ptr6 = getelementptr inbounds i8, i8* %11, i32 1
  store i8* %incdec.ptr6, i8** %r, align 4
  store i8 92, i8* %11, align 1
  %12 = load i8*, i8** %r, align 4
  %incdec.ptr7 = getelementptr inbounds i8, i8* %12, i32 1
  store i8* %incdec.ptr7, i8** %r, align 4
  store i8 39, i8* %12, align 1
  %13 = load i8*, i8** %r, align 4
  %incdec.ptr8 = getelementptr inbounds i8, i8* %13, i32 1
  store i8* %incdec.ptr8, i8** %r, align 4
  store i8 39, i8* %13, align 1
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %14 = load i8*, i8** %s, align 4
  %incdec.ptr9 = getelementptr inbounds i8, i8* %14, i32 1
  store i8* %incdec.ptr9, i8** %s, align 4
  br label %for.cond

for.end:                                          ; preds = %land.end
  %15 = load i8*, i8** %r, align 4
  %incdec.ptr10 = getelementptr inbounds i8, i8* %15, i32 1
  store i8* %incdec.ptr10, i8** %r, align 4
  store i8 39, i8* %15, align 1
  %16 = load i8*, i8** %r, align 4
  store i8 0, i8* %16, align 1
  %17 = load i8*, i8** %result, align 4
  ret i8* %17
}

declare i8* @xmalloc(i32) #1

declare i32 @strlen(i8*) #1

; Function Attrs: noinline nounwind
define void @sh_set_lines_and_columns(i32 %lines, i32 %cols) #0 {
entry:
  %lines.addr = alloca i32, align 4
  %cols.addr = alloca i32, align 4
  store i32 %lines, i32* %lines.addr, align 4
  store i32 %cols, i32* %cols.addr, align 4
  %0 = load i32, i32* %lines.addr, align 4
  %call = call i32 (i8*, i8*, ...) @sprintf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @setenv_buf, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i32 0, i32 0), i32 %0)
  %call1 = call i32 @setenv(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @setenv_buf, i32 0, i32 0), i32 1)
  %1 = load i32, i32* %cols.addr, align 4
  %call2 = call i32 (i8*, i8*, ...) @sprintf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @setenv_buf, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i32 0, i32 0), i32 %1)
  %call3 = call i32 @setenv(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @setenv_buf, i32 0, i32 0), i32 1)
  ret void
}

declare i32 @sprintf(i8*, i8*, ...) #1

declare i32 @setenv(i8*, i8*, i32) #1

; Function Attrs: noinline nounwind
define i8* @sh_get_env_value(i8* %varname) #0 {
entry:
  %varname.addr = alloca i8*, align 4
  store i8* %varname, i8** %varname.addr, align 4
  %0 = load i8*, i8** %varname.addr, align 4
  %call = call i8* @getenv(i8* %0)
  ret i8* %call
}

declare i8* @getenv(i8*) #1

; Function Attrs: noinline nounwind
define i8* @sh_get_home_dir() #0 {
entry:
  %retval = alloca i8*, align 4
  %entry1 = alloca %struct.passwd*, align 4
  %0 = load i8*, i8** @sh_get_home_dir.home_dir, align 4
  %tobool = icmp ne i8* %0, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** @sh_get_home_dir.home_dir, align 4
  store i8* %1, i8** %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  store i8* null, i8** @sh_get_home_dir.home_dir, align 4
  call void @endpwent()
  %2 = load i8*, i8** @sh_get_home_dir.home_dir, align 4
  store i8* %2, i8** %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %3 = load i8*, i8** %retval, align 4
  ret i8* %3
}

declare void @endpwent() #1

; Function Attrs: noinline nounwind
define i32 @sh_unset_nodelay_mode(i32 %fd) #0 {
entry:
  %retval = alloca i32, align 4
  %fd.addr = alloca i32, align 4
  %flags = alloca i32, align 4
  %bflags = alloca i32, align 4
  store i32 %fd, i32* %fd.addr, align 4
  %0 = load i32, i32* %fd.addr, align 4
  %call = call i32 (i32, i32, ...) @fcntl(i32 %0, i32 3, i32 0)
  store i32 %call, i32* %flags, align 4
  %cmp = icmp slt i32 %call, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  store i32 0, i32* %bflags, align 4
  %1 = load i32, i32* %bflags, align 4
  %or = or i32 %1, 2048
  store i32 %or, i32* %bflags, align 4
  %2 = load i32, i32* %bflags, align 4
  %or1 = or i32 %2, 2048
  store i32 %or1, i32* %bflags, align 4
  %3 = load i32, i32* %flags, align 4
  %4 = load i32, i32* %bflags, align 4
  %and = and i32 %3, %4
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then2, label %if.end5

if.then2:                                         ; preds = %if.end
  %5 = load i32, i32* %bflags, align 4
  %neg = xor i32 %5, -1
  %6 = load i32, i32* %flags, align 4
  %and3 = and i32 %6, %neg
  store i32 %and3, i32* %flags, align 4
  %7 = load i32, i32* %fd.addr, align 4
  %8 = load i32, i32* %flags, align 4
  %call4 = call i32 (i32, i32, ...) @fcntl(i32 %7, i32 4, i32 %8)
  store i32 %call4, i32* %retval, align 4
  br label %return

if.end5:                                          ; preds = %if.end
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end5, %if.then2, %if.then
  %9 = load i32, i32* %retval, align 4
  ret i32 %9
}

declare i32 @fcntl(i32, i32, ...) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
