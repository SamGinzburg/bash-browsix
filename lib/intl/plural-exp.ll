; ModuleID = 'plural-exp.c'
source_filename = "plural-exp.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.expression = type { i32, i32, %union.anon }
%union.anon = type { [3 x %struct.expression*] }
%struct.parse_args = type { i8*, %struct.expression* }

@plvar = internal constant %struct.expression zeroinitializer, align 4
@libintl_gettext_germanic_plural = global %struct.expression { i32 2, i32 13, %union.anon { [3 x %struct.expression*] [%struct.expression* @plvar, %struct.expression* bitcast ({ i32, i32, { i32, [8 x i8] } }* @plone to %struct.expression*), %struct.expression* null] } }, align 4
@.str = private unnamed_addr constant [8 x i8] c"plural=\00", align 1
@.str.1 = private unnamed_addr constant [10 x i8] c"nplurals=\00", align 1
@plone = internal constant { i32, i32, { i32, [8 x i8] } } { i32 0, i32 1, { i32, [8 x i8] } { i32 1, [8 x i8] undef } }, align 4

; Function Attrs: noinline nounwind
define void @libintl_gettext_extract_plural(i8* %nullentry, %struct.expression** %pluralp, i32* %npluralsp) #0 {
entry:
  %nullentry.addr = alloca i8*, align 4
  %pluralp.addr = alloca %struct.expression**, align 4
  %npluralsp.addr = alloca i32*, align 4
  %plural = alloca i8*, align 4
  %nplurals = alloca i8*, align 4
  %endp = alloca i8*, align 4
  %n = alloca i32, align 4
  %args = alloca %struct.parse_args, align 4
  store i8* %nullentry, i8** %nullentry.addr, align 4
  store %struct.expression** %pluralp, %struct.expression*** %pluralp.addr, align 4
  store i32* %npluralsp, i32** %npluralsp.addr, align 4
  %0 = load i8*, i8** %nullentry.addr, align 4
  %cmp = icmp ne i8* %0, null
  br i1 %cmp, label %if.then, label %if.else28

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %nullentry.addr, align 4
  %call = call i8* @strstr(i8* %1, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0))
  store i8* %call, i8** %plural, align 4
  %2 = load i8*, i8** %nullentry.addr, align 4
  %call1 = call i8* @strstr(i8* %2, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i32 0, i32 0))
  store i8* %call1, i8** %nplurals, align 4
  %3 = load i8*, i8** %plural, align 4
  %cmp2 = icmp eq i8* %3, null
  br i1 %cmp2, label %if.then4, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.then
  %4 = load i8*, i8** %nplurals, align 4
  %cmp3 = icmp eq i8* %4, null
  br i1 %cmp3, label %if.then4, label %if.else

if.then4:                                         ; preds = %lor.lhs.false, %if.then
  br label %no_plural

if.else:                                          ; preds = %lor.lhs.false
  %5 = load i8*, i8** %nplurals, align 4
  %add.ptr = getelementptr inbounds i8, i8* %5, i32 9
  store i8* %add.ptr, i8** %nplurals, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.else
  %6 = load i8*, i8** %nplurals, align 4
  %7 = load i8, i8* %6, align 1
  %conv = sext i8 %7 to i32
  %cmp5 = icmp ne i32 %conv, 0
  br i1 %cmp5, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond
  %8 = load i8*, i8** %nplurals, align 4
  %9 = load i8, i8* %8, align 1
  %conv7 = zext i8 %9 to i32
  %call8 = call i32 @isspace(i32 %conv7) #3
  %tobool = icmp ne i32 %call8, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %10 = phi i1 [ false, %while.cond ], [ %tobool, %land.rhs ]
  br i1 %10, label %while.body, label %while.end

while.body:                                       ; preds = %land.end
  %11 = load i8*, i8** %nplurals, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %11, i32 1
  store i8* %incdec.ptr, i8** %nplurals, align 4
  br label %while.cond

while.end:                                        ; preds = %land.end
  %12 = load i8*, i8** %nplurals, align 4
  %13 = load i8, i8* %12, align 1
  %conv9 = sext i8 %13 to i32
  %cmp10 = icmp sge i32 %conv9, 48
  br i1 %cmp10, label %land.lhs.true, label %if.then15

land.lhs.true:                                    ; preds = %while.end
  %14 = load i8*, i8** %nplurals, align 4
  %15 = load i8, i8* %14, align 1
  %conv12 = sext i8 %15 to i32
  %cmp13 = icmp sle i32 %conv12, 57
  br i1 %cmp13, label %if.end, label %if.then15

if.then15:                                        ; preds = %land.lhs.true, %while.end
  br label %no_plural

if.end:                                           ; preds = %land.lhs.true
  %16 = load i8*, i8** %nplurals, align 4
  %call16 = call i32 @strtoul(i8* %16, i8** %endp, i32 10)
  store i32 %call16, i32* %n, align 4
  %17 = load i8*, i8** %nplurals, align 4
  %18 = load i8*, i8** %endp, align 4
  %cmp17 = icmp eq i8* %17, %18
  br i1 %cmp17, label %if.then19, label %if.end20

if.then19:                                        ; preds = %if.end
  br label %no_plural

if.end20:                                         ; preds = %if.end
  %19 = load i32, i32* %n, align 4
  %20 = load i32*, i32** %npluralsp.addr, align 4
  store i32 %19, i32* %20, align 4
  %21 = load i8*, i8** %plural, align 4
  %add.ptr21 = getelementptr inbounds i8, i8* %21, i32 7
  store i8* %add.ptr21, i8** %plural, align 4
  %22 = load i8*, i8** %plural, align 4
  %cp = getelementptr inbounds %struct.parse_args, %struct.parse_args* %args, i32 0, i32 0
  store i8* %22, i8** %cp, align 4
  %23 = bitcast %struct.parse_args* %args to i8*
  %call22 = call i32 @libintl_gettextparse(i8* %23)
  %cmp23 = icmp ne i32 %call22, 0
  br i1 %cmp23, label %if.then25, label %if.end26

if.then25:                                        ; preds = %if.end20
  br label %no_plural

if.end26:                                         ; preds = %if.end20
  %res = getelementptr inbounds %struct.parse_args, %struct.parse_args* %args, i32 0, i32 1
  %24 = load %struct.expression*, %struct.expression** %res, align 4
  %25 = load %struct.expression**, %struct.expression*** %pluralp.addr, align 4
  store %struct.expression* %24, %struct.expression** %25, align 4
  br label %if.end27

if.end27:                                         ; preds = %if.end26
  br label %if.end29

if.else28:                                        ; preds = %entry
  br label %no_plural

no_plural:                                        ; preds = %if.else28, %if.then25, %if.then19, %if.then15, %if.then4
  %26 = load %struct.expression**, %struct.expression*** %pluralp.addr, align 4
  store %struct.expression* @libintl_gettext_germanic_plural, %struct.expression** %26, align 4
  %27 = load i32*, i32** %npluralsp.addr, align 4
  store i32 2, i32* %27, align 4
  br label %if.end29

if.end29:                                         ; preds = %no_plural, %if.end27
  ret void
}

declare i8* @strstr(i8*, i8*) #1

; Function Attrs: nounwind readonly
declare i32 @isspace(i32) #2

declare i32 @strtoul(i8*, i8**, i32) #1

declare i32 @libintl_gettextparse(i8*) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
