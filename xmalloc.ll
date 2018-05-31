; ModuleID = 'xmalloc.c'
source_filename = "xmalloc.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

@brkfound = internal global i32 0, align 4
@lbreak = internal global i8* null, align 4
@.str = private unnamed_addr constant [8 x i8] c"xmalloc\00", align 1
@.str.1 = private unnamed_addr constant [9 x i8] c"xrealloc\00", align 1
@allocated = internal global i32 0, align 4
@.str.2 = private unnamed_addr constant [52 x i8] c"%s: cannot allocate %lu bytes (%lu bytes allocated)\00", align 1
@.str.3 = private unnamed_addr constant [59 x i8] c"%s: %s:%d: cannot allocate %lu bytes (%lu bytes allocated)\00", align 1

; Function Attrs: noinline nounwind
define i8* @xmalloc(i32 %bytes) #0 {
entry:
  %bytes.addr = alloca i32, align 4
  %temp = alloca i8*, align 4
  store i32 %bytes, i32* %bytes.addr, align 4
  br label %do.body

do.body:                                          ; preds = %entry
  %0 = load i32, i32* @brkfound, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %do.body
  %call = call i8* @sbrk(i32 0)
  store i8* %call, i8** @lbreak, align 4
  %1 = load i32, i32* @brkfound, align 4
  %inc = add nsw i32 %1, 1
  store i32 %inc, i32* @brkfound, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  %2 = load i32, i32* %bytes.addr, align 4
  %call1 = call i8* @malloc(i32 %2)
  store i8* %call1, i8** %temp, align 4
  %3 = load i8*, i8** %temp, align 4
  %cmp2 = icmp eq i8* %3, null
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %do.end
  %4 = load i32, i32* %bytes.addr, align 4
  call void @allocerr(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 %4)
  br label %if.end4

if.end4:                                          ; preds = %if.then3, %do.end
  %5 = load i8*, i8** %temp, align 4
  ret i8* %5
}

declare i8* @sbrk(i32) #1

declare i8* @malloc(i32) #1

; Function Attrs: noinline nounwind
define internal void @allocerr(i8* %func, i32 %bytes) #0 {
entry:
  %func.addr = alloca i8*, align 4
  %bytes.addr = alloca i32, align 4
  store i8* %func, i8** %func.addr, align 4
  store i32 %bytes, i32* %bytes.addr, align 4
  %call = call i32 @findbrk()
  store i32 %call, i32* @allocated, align 4
  %call1 = call i8* @libintl_gettext(i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.2, i32 0, i32 0))
  %0 = load i8*, i8** %func.addr, align 4
  %1 = load i32, i32* %bytes.addr, align 4
  %2 = load i32, i32* @allocated, align 4
  call void (i8*, ...) @fatal_error(i8* %call1, i8* %0, i32 %1, i32 %2)
  ret void
}

; Function Attrs: noinline nounwind
define i8* @xrealloc(i8* %pointer, i32 %bytes) #0 {
entry:
  %pointer.addr = alloca i8*, align 4
  %bytes.addr = alloca i32, align 4
  %temp = alloca i8*, align 4
  store i8* %pointer, i8** %pointer.addr, align 4
  store i32 %bytes, i32* %bytes.addr, align 4
  br label %do.body

do.body:                                          ; preds = %entry
  %0 = load i32, i32* @brkfound, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %do.body
  %call = call i8* @sbrk(i32 0)
  store i8* %call, i8** @lbreak, align 4
  %1 = load i32, i32* @brkfound, align 4
  %inc = add nsw i32 %1, 1
  store i32 %inc, i32* @brkfound, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  %2 = load i8*, i8** %pointer.addr, align 4
  %tobool = icmp ne i8* %2, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %do.end
  %3 = load i8*, i8** %pointer.addr, align 4
  %4 = load i32, i32* %bytes.addr, align 4
  %call1 = call i8* @realloc(i8* %3, i32 %4)
  br label %cond.end

cond.false:                                       ; preds = %do.end
  %5 = load i32, i32* %bytes.addr, align 4
  %call2 = call i8* @malloc(i32 %5)
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %call1, %cond.true ], [ %call2, %cond.false ]
  store i8* %cond, i8** %temp, align 4
  %6 = load i8*, i8** %temp, align 4
  %cmp3 = icmp eq i8* %6, null
  br i1 %cmp3, label %if.then4, label %if.end5

if.then4:                                         ; preds = %cond.end
  %7 = load i32, i32* %bytes.addr, align 4
  call void @allocerr(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i32 %7)
  br label %if.end5

if.end5:                                          ; preds = %if.then4, %cond.end
  %8 = load i8*, i8** %temp, align 4
  ret i8* %8
}

declare i8* @realloc(i8*, i32) #1

; Function Attrs: noinline nounwind
define void @xfree(i8* %string) #0 {
entry:
  %string.addr = alloca i8*, align 4
  store i8* %string, i8** %string.addr, align 4
  %0 = load i8*, i8** %string.addr, align 4
  %tobool = icmp ne i8* %0, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %string.addr, align 4
  call void @free(i8* %1)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

declare void @free(i8*) #1

; Function Attrs: noinline nounwind
define i8* @sh_xmalloc(i32 %bytes, i8* %file, i32 %line) #0 {
entry:
  %bytes.addr = alloca i32, align 4
  %file.addr = alloca i8*, align 4
  %line.addr = alloca i32, align 4
  %temp = alloca i8*, align 4
  store i32 %bytes, i32* %bytes.addr, align 4
  store i8* %file, i8** %file.addr, align 4
  store i32 %line, i32* %line.addr, align 4
  br label %do.body

do.body:                                          ; preds = %entry
  %0 = load i32, i32* @brkfound, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %do.body
  %call = call i8* @sbrk(i32 0)
  store i8* %call, i8** @lbreak, align 4
  %1 = load i32, i32* @brkfound, align 4
  %inc = add nsw i32 %1, 1
  store i32 %inc, i32* @brkfound, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  %2 = load i32, i32* %bytes.addr, align 4
  %3 = load i8*, i8** %file.addr, align 4
  %4 = load i32, i32* %line.addr, align 4
  %call1 = call i8* @sh_malloc(i32 %2, i8* %3, i32 %4)
  store i8* %call1, i8** %temp, align 4
  %5 = load i8*, i8** %temp, align 4
  %cmp2 = icmp eq i8* %5, null
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %do.end
  %6 = load i32, i32* %bytes.addr, align 4
  %7 = load i8*, i8** %file.addr, align 4
  %8 = load i32, i32* %line.addr, align 4
  call void @sh_allocerr(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 %6, i8* %7, i32 %8)
  br label %if.end4

if.end4:                                          ; preds = %if.then3, %do.end
  %9 = load i8*, i8** %temp, align 4
  ret i8* %9
}

declare i8* @sh_malloc(i32, i8*, i32) #1

; Function Attrs: noinline nounwind
define internal void @sh_allocerr(i8* %func, i32 %bytes, i8* %file, i32 %line) #0 {
entry:
  %func.addr = alloca i8*, align 4
  %bytes.addr = alloca i32, align 4
  %file.addr = alloca i8*, align 4
  %line.addr = alloca i32, align 4
  store i8* %func, i8** %func.addr, align 4
  store i32 %bytes, i32* %bytes.addr, align 4
  store i8* %file, i8** %file.addr, align 4
  store i32 %line, i32* %line.addr, align 4
  %call = call i32 @findbrk()
  store i32 %call, i32* @allocated, align 4
  %call1 = call i8* @libintl_gettext(i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str.3, i32 0, i32 0))
  %0 = load i8*, i8** %func.addr, align 4
  %1 = load i8*, i8** %file.addr, align 4
  %2 = load i32, i32* %line.addr, align 4
  %3 = load i32, i32* %bytes.addr, align 4
  %4 = load i32, i32* @allocated, align 4
  call void (i8*, ...) @fatal_error(i8* %call1, i8* %0, i8* %1, i32 %2, i32 %3, i32 %4)
  ret void
}

; Function Attrs: noinline nounwind
define i8* @sh_xrealloc(i8* %pointer, i32 %bytes, i8* %file, i32 %line) #0 {
entry:
  %pointer.addr = alloca i8*, align 4
  %bytes.addr = alloca i32, align 4
  %file.addr = alloca i8*, align 4
  %line.addr = alloca i32, align 4
  %temp = alloca i8*, align 4
  store i8* %pointer, i8** %pointer.addr, align 4
  store i32 %bytes, i32* %bytes.addr, align 4
  store i8* %file, i8** %file.addr, align 4
  store i32 %line, i32* %line.addr, align 4
  br label %do.body

do.body:                                          ; preds = %entry
  %0 = load i32, i32* @brkfound, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %do.body
  %call = call i8* @sbrk(i32 0)
  store i8* %call, i8** @lbreak, align 4
  %1 = load i32, i32* @brkfound, align 4
  %inc = add nsw i32 %1, 1
  store i32 %inc, i32* @brkfound, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  %2 = load i8*, i8** %pointer.addr, align 4
  %tobool = icmp ne i8* %2, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %do.end
  %3 = load i8*, i8** %pointer.addr, align 4
  %4 = load i32, i32* %bytes.addr, align 4
  %5 = load i8*, i8** %file.addr, align 4
  %6 = load i32, i32* %line.addr, align 4
  %call1 = call i8* @sh_realloc(i8* %3, i32 %4, i8* %5, i32 %6)
  br label %cond.end

cond.false:                                       ; preds = %do.end
  %7 = load i32, i32* %bytes.addr, align 4
  %8 = load i8*, i8** %file.addr, align 4
  %9 = load i32, i32* %line.addr, align 4
  %call2 = call i8* @sh_malloc(i32 %7, i8* %8, i32 %9)
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %call1, %cond.true ], [ %call2, %cond.false ]
  store i8* %cond, i8** %temp, align 4
  %10 = load i8*, i8** %temp, align 4
  %cmp3 = icmp eq i8* %10, null
  br i1 %cmp3, label %if.then4, label %if.end5

if.then4:                                         ; preds = %cond.end
  %11 = load i32, i32* %bytes.addr, align 4
  %12 = load i8*, i8** %file.addr, align 4
  %13 = load i32, i32* %line.addr, align 4
  call void @sh_allocerr(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i32 %11, i8* %12, i32 %13)
  br label %if.end5

if.end5:                                          ; preds = %if.then4, %cond.end
  %14 = load i8*, i8** %temp, align 4
  ret i8* %14
}

declare i8* @sh_realloc(i8*, i32, i8*, i32) #1

; Function Attrs: noinline nounwind
define void @sh_xfree(i8* %string, i8* %file, i32 %line) #0 {
entry:
  %string.addr = alloca i8*, align 4
  %file.addr = alloca i8*, align 4
  %line.addr = alloca i32, align 4
  store i8* %string, i8** %string.addr, align 4
  store i8* %file, i8** %file.addr, align 4
  store i32 %line, i32* %line.addr, align 4
  %0 = load i8*, i8** %string.addr, align 4
  %tobool = icmp ne i8* %0, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %string.addr, align 4
  %2 = load i8*, i8** %file.addr, align 4
  %3 = load i32, i32* %line.addr, align 4
  call void @sh_free(i8* %1, i8* %2, i32 %3)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

declare void @sh_free(i8*, i8*, i32) #1

declare void @fatal_error(i8*, ...) #1

declare i8* @libintl_gettext(i8*) #1

; Function Attrs: noinline nounwind
define internal i32 @findbrk() #0 {
entry:
  br label %do.body

do.body:                                          ; preds = %entry
  %0 = load i32, i32* @brkfound, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %do.body
  %call = call i8* @sbrk(i32 0)
  store i8* %call, i8** @lbreak, align 4
  %1 = load i32, i32* @brkfound, align 4
  %inc = add nsw i32 %1, 1
  store i32 %inc, i32* @brkfound, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  %call1 = call i8* @sbrk(i32 0)
  %2 = load i8*, i8** @lbreak, align 4
  %sub.ptr.lhs.cast = ptrtoint i8* %call1 to i32
  %sub.ptr.rhs.cast = ptrtoint i8* %2 to i32
  %sub.ptr.sub = sub i32 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  ret i32 %sub.ptr.sub
}

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
