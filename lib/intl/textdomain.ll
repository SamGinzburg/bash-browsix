; ModuleID = 'textdomain.c'
source_filename = "textdomain.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

@libintl_nl_current_default_domain = external global i8*, align 4
@libintl_nl_default_default_domain = external constant [0 x i8], align 1
@_nl_msg_cat_cntr = external global i32, align 4

; Function Attrs: noinline nounwind
define i8* @libintl_textdomain(i8* %domainname) #0 {
entry:
  %retval = alloca i8*, align 4
  %domainname.addr = alloca i8*, align 4
  %new_domain = alloca i8*, align 4
  %old_domain = alloca i8*, align 4
  store i8* %domainname, i8** %domainname.addr, align 4
  %0 = load i8*, i8** %domainname.addr, align 4
  %cmp = icmp eq i8* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** @libintl_nl_current_default_domain, align 4
  store i8* %1, i8** %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %2 = load i8*, i8** @libintl_nl_current_default_domain, align 4
  store i8* %2, i8** %old_domain, align 4
  %3 = load i8*, i8** %domainname.addr, align 4
  %arrayidx = getelementptr inbounds i8, i8* %3, i32 0
  %4 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %4 to i32
  %cmp1 = icmp eq i32 %conv, 0
  br i1 %cmp1, label %if.then5, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end
  %5 = load i8*, i8** %domainname.addr, align 4
  %call = call i32 @strcmp(i8* %5, i8* getelementptr inbounds ([0 x i8], [0 x i8]* @libintl_nl_default_default_domain, i32 0, i32 0))
  %cmp3 = icmp eq i32 %call, 0
  br i1 %cmp3, label %if.then5, label %if.else

if.then5:                                         ; preds = %lor.lhs.false, %if.end
  store i8* getelementptr inbounds ([0 x i8], [0 x i8]* @libintl_nl_default_default_domain, i32 0, i32 0), i8** @libintl_nl_current_default_domain, align 4
  %6 = load i8*, i8** @libintl_nl_current_default_domain, align 4
  store i8* %6, i8** %new_domain, align 4
  br label %if.end17

if.else:                                          ; preds = %lor.lhs.false
  %7 = load i8*, i8** %domainname.addr, align 4
  %8 = load i8*, i8** %old_domain, align 4
  %call6 = call i32 @strcmp(i8* %7, i8* %8)
  %cmp7 = icmp eq i32 %call6, 0
  br i1 %cmp7, label %if.then9, label %if.else10

if.then9:                                         ; preds = %if.else
  %9 = load i8*, i8** %old_domain, align 4
  store i8* %9, i8** %new_domain, align 4
  br label %if.end16

if.else10:                                        ; preds = %if.else
  %10 = load i8*, i8** %domainname.addr, align 4
  %call11 = call i8* @strdup(i8* %10)
  store i8* %call11, i8** %new_domain, align 4
  %11 = load i8*, i8** %new_domain, align 4
  %cmp12 = icmp ne i8* %11, null
  br i1 %cmp12, label %if.then14, label %if.end15

if.then14:                                        ; preds = %if.else10
  %12 = load i8*, i8** %new_domain, align 4
  store i8* %12, i8** @libintl_nl_current_default_domain, align 4
  br label %if.end15

if.end15:                                         ; preds = %if.then14, %if.else10
  br label %if.end16

if.end16:                                         ; preds = %if.end15, %if.then9
  br label %if.end17

if.end17:                                         ; preds = %if.end16, %if.then5
  %13 = load i8*, i8** %new_domain, align 4
  %cmp18 = icmp ne i8* %13, null
  br i1 %cmp18, label %if.then20, label %if.end27

if.then20:                                        ; preds = %if.end17
  %14 = load i32, i32* @_nl_msg_cat_cntr, align 4
  %inc = add nsw i32 %14, 1
  store i32 %inc, i32* @_nl_msg_cat_cntr, align 4
  %15 = load i8*, i8** %old_domain, align 4
  %16 = load i8*, i8** %new_domain, align 4
  %cmp21 = icmp ne i8* %15, %16
  br i1 %cmp21, label %land.lhs.true, label %if.end26

land.lhs.true:                                    ; preds = %if.then20
  %17 = load i8*, i8** %old_domain, align 4
  %cmp23 = icmp ne i8* %17, getelementptr inbounds ([0 x i8], [0 x i8]* @libintl_nl_default_default_domain, i32 0, i32 0)
  br i1 %cmp23, label %if.then25, label %if.end26

if.then25:                                        ; preds = %land.lhs.true
  %18 = load i8*, i8** %old_domain, align 4
  call void @free(i8* %18)
  br label %if.end26

if.end26:                                         ; preds = %if.then25, %land.lhs.true, %if.then20
  br label %if.end27

if.end27:                                         ; preds = %if.end26, %if.end17
  %19 = load i8*, i8** %new_domain, align 4
  store i8* %19, i8** %retval, align 4
  br label %return

return:                                           ; preds = %if.end27, %if.then
  %20 = load i8*, i8** %retval, align 4
  ret i8* %20
}

declare i32 @strcmp(i8*, i8*) #1

declare i8* @strdup(i8*) #1

declare void @free(i8*) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
