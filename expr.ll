; ModuleID = 'expr.c'
source_filename = "expr.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.__jmp_buf_tag = type { [6 x i32], i32, [32 x i32] }
%struct.EXPR_CONTEXT = type { i32, i32, i8*, i8*, i8*, i64, i8*, i32, %struct.lvalue }
%struct.lvalue = type { i8*, i64, %struct.variable*, i64 }
%struct.variable = type { i8*, i8*, i8*, %struct.variable* (%struct.variable*)*, %struct.variable* (%struct.variable*, i8*, i64, i8*)*, i32, i32 }
%struct.imaxdiv_t = type { i64, i64 }

@noeval = internal global i32 0, align 4
@evalbuf = internal global [1 x %struct.__jmp_buf_tag] zeroinitializer, align 4
@tokstr = internal global i8* null, align 4
@.str = private unnamed_addr constant [7 x i8] c"expr.c\00", align 1
@expression = internal global i8* null, align 4
@expr_depth = internal global i32 0, align 4
@expr_stack = internal global %struct.EXPR_CONTEXT** null, align 4
@tp = internal global i8* null, align 4
@lasttok = internal global i32 0, align 4
@curtok = internal global i32 0, align 4
@tokval = internal global i64 0, align 8
@curlval = internal global %struct.lvalue { i8* null, i64 0, %struct.variable* null, i64 -1 }, align 8
@lastlval = internal global %struct.lvalue { i8* null, i64 0, %struct.variable* null, i64 -1 }, align 8
@.str.1 = private unnamed_addr constant [27 x i8] c"syntax error in expression\00", align 1
@.str.2 = private unnamed_addr constant [36 x i8] c"expression recursion level exceeded\00", align 1
@expr_stack_size = internal global i32 0, align 4
@lasttp = internal global i8* null, align 4
@bash_badsub_errmsg = external constant i8*, align 4
@assigntok = internal global i32 0, align 4
@.str.3 = private unnamed_addr constant [9 x i8] c"*/%+-&^|\00", align 1
@.str.4 = private unnamed_addr constant [31 x i8] c"syntax error: operand expected\00", align 1
@.str.5 = private unnamed_addr constant [42 x i8] c"syntax error: invalid arithmetic operator\00", align 1
@unbound_vars_is_error = external global i32, align 4
@last_command_exit_value = external global i32, align 4
@no_longjmp_on_fatal_error = external global i32, align 4
@interactive_shell = external global i32, align 4
@.str.6 = private unnamed_addr constant [15 x i8] c"invalid number\00", align 1
@.str.7 = private unnamed_addr constant [24 x i8] c"invalid arithmetic base\00", align 1
@.str.8 = private unnamed_addr constant [25 x i8] c"value too great for base\00", align 1
@.str.9 = private unnamed_addr constant [37 x i8] c"attempted assignment to non-variable\00", align 1
@.str.10 = private unnamed_addr constant [14 x i8] c"division by 0\00", align 1
@.str.11 = private unnamed_addr constant [25 x i8] c"bug: bad expassign token\00", align 1
@.str.12 = private unnamed_addr constant [20 x i8] c"expression expected\00", align 1
@.str.13 = private unnamed_addr constant [40 x i8] c"`:' expected for conditional expression\00", align 1
@.str.14 = private unnamed_addr constant [21 x i8] c"exponent less than 0\00", align 1
@.str.15 = private unnamed_addr constant [57 x i8] c"identifier expected after pre-increment or pre-decrement\00", align 1
@.str.16 = private unnamed_addr constant [12 x i8] c"missing `)'\00", align 1
@.str.17 = private unnamed_addr constant [7 x i8] c"%s[%s]\00", align 1
@this_command_name = external global i8*, align 4
@.str.18 = private unnamed_addr constant [33 x i8] c"%s%s%s: %s (error token is \22%s\22)\00", align 1
@.str.19 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.20 = private unnamed_addr constant [3 x i8] c": \00", align 1
@.str.21 = private unnamed_addr constant [26 x i8] c"recursion stack underflow\00", align 1

; Function Attrs: noinline nounwind
define i64 @evalexp(i8* %expr, i32* %validp) #0 {
entry:
  %retval = alloca i64, align 8
  %expr.addr = alloca i8*, align 4
  %validp.addr = alloca i32*, align 4
  %val = alloca i64, align 8
  %c = alloca i32, align 4
  %oevalbuf = alloca [1 x %struct.__jmp_buf_tag], align 4
  store i8* %expr, i8** %expr.addr, align 4
  store i32* %validp, i32** %validp.addr, align 4
  store i64 0, i64* %val, align 8
  store i32 0, i32* @noeval, align 4
  %arraydecay = getelementptr inbounds [1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* %oevalbuf, i32 0, i32 0
  %0 = bitcast %struct.__jmp_buf_tag* %arraydecay to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %0, i8* bitcast ([1 x %struct.__jmp_buf_tag]* @evalbuf to i8*), i32 156, i32 4, i1 false)
  %call = call i32 @setjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* @evalbuf, i32 0, i32 0)) #6
  store i32 %call, i32* %c, align 4
  %1 = load i32, i32* %c, align 4
  %tobool = icmp ne i32 %1, 0
  br i1 %tobool, label %if.then, label %if.end11

if.then:                                          ; preds = %entry
  br label %do.body

do.body:                                          ; preds = %if.then
  %2 = load i8*, i8** @tokstr, align 4
  %tobool1 = icmp ne i8* %2, null
  br i1 %tobool1, label %if.then2, label %if.end

if.then2:                                         ; preds = %do.body
  %3 = load i8*, i8** @tokstr, align 4
  call void @sh_xfree(i8* %3, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i32 382)
  br label %if.end

if.end:                                           ; preds = %if.then2, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  br label %do.body3

do.body3:                                         ; preds = %do.end
  %4 = load i8*, i8** @expression, align 4
  %tobool4 = icmp ne i8* %4, null
  br i1 %tobool4, label %if.then5, label %if.end6

if.then5:                                         ; preds = %do.body3
  %5 = load i8*, i8** @expression, align 4
  call void @sh_xfree(i8* %5, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i32 383)
  br label %if.end6

if.end6:                                          ; preds = %if.then5, %do.body3
  br label %do.end7

do.end7:                                          ; preds = %if.end6
  store i8* null, i8** @expression, align 4
  store i8* null, i8** @tokstr, align 4
  call void @expr_unwind()
  %6 = load i32*, i32** %validp.addr, align 4
  %tobool8 = icmp ne i32* %6, null
  br i1 %tobool8, label %if.then9, label %if.end10

if.then9:                                         ; preds = %do.end7
  %7 = load i32*, i32** %validp.addr, align 4
  store i32 0, i32* %7, align 4
  br label %if.end10

if.end10:                                         ; preds = %if.then9, %do.end7
  store i64 0, i64* %retval, align 8
  br label %return

if.end11:                                         ; preds = %entry
  %8 = load i8*, i8** %expr.addr, align 4
  %call12 = call i64 @subexpr(i8* %8)
  store i64 %call12, i64* %val, align 8
  %9 = load i32*, i32** %validp.addr, align 4
  %tobool13 = icmp ne i32* %9, null
  br i1 %tobool13, label %if.then14, label %if.end15

if.then14:                                        ; preds = %if.end11
  %10 = load i32*, i32** %validp.addr, align 4
  store i32 1, i32* %10, align 4
  br label %if.end15

if.end15:                                         ; preds = %if.then14, %if.end11
  %arraydecay16 = getelementptr inbounds [1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* %oevalbuf, i32 0, i32 0
  %11 = bitcast %struct.__jmp_buf_tag* %arraydecay16 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* bitcast ([1 x %struct.__jmp_buf_tag]* @evalbuf to i8*), i8* %11, i32 156, i32 4, i1 false)
  %12 = load i64, i64* %val, align 8
  store i64 %12, i64* %retval, align 8
  br label %return

return:                                           ; preds = %if.end15, %if.end10
  %13 = load i64, i64* %retval, align 8
  ret i64 %13
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* nocapture writeonly, i8* nocapture readonly, i32, i32, i1) #1

; Function Attrs: returns_twice
declare i32 @setjmp(%struct.__jmp_buf_tag*) #2

declare void @sh_xfree(i8*, i8*, i32) #3

; Function Attrs: noinline nounwind
define internal void @expr_unwind() #0 {
entry:
  br label %while.cond

while.cond:                                       ; preds = %if.end8, %entry
  %0 = load i32, i32* @expr_depth, align 4
  %dec = add nsw i32 %0, -1
  store i32 %dec, i32* @expr_depth, align 4
  %cmp = icmp sgt i32 %dec, 0
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %1 = load %struct.EXPR_CONTEXT**, %struct.EXPR_CONTEXT*** @expr_stack, align 4
  %2 = load i32, i32* @expr_depth, align 4
  %arrayidx = getelementptr inbounds %struct.EXPR_CONTEXT*, %struct.EXPR_CONTEXT** %1, i32 %2
  %3 = load %struct.EXPR_CONTEXT*, %struct.EXPR_CONTEXT** %arrayidx, align 4
  %tokstr = getelementptr inbounds %struct.EXPR_CONTEXT, %struct.EXPR_CONTEXT* %3, i32 0, i32 6
  %4 = load i8*, i8** %tokstr, align 8
  %tobool = icmp ne i8* %4, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %while.body
  %5 = load %struct.EXPR_CONTEXT**, %struct.EXPR_CONTEXT*** @expr_stack, align 4
  %6 = load i32, i32* @expr_depth, align 4
  %arrayidx1 = getelementptr inbounds %struct.EXPR_CONTEXT*, %struct.EXPR_CONTEXT** %5, i32 %6
  %7 = load %struct.EXPR_CONTEXT*, %struct.EXPR_CONTEXT** %arrayidx1, align 4
  %tokstr2 = getelementptr inbounds %struct.EXPR_CONTEXT, %struct.EXPR_CONTEXT* %7, i32 0, i32 6
  %8 = load i8*, i8** %tokstr2, align 8
  call void @sh_xfree(i8* %8, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i32 299)
  br label %if.end

if.end:                                           ; preds = %if.then, %while.body
  %9 = load %struct.EXPR_CONTEXT**, %struct.EXPR_CONTEXT*** @expr_stack, align 4
  %10 = load i32, i32* @expr_depth, align 4
  %arrayidx3 = getelementptr inbounds %struct.EXPR_CONTEXT*, %struct.EXPR_CONTEXT** %9, i32 %10
  %11 = load %struct.EXPR_CONTEXT*, %struct.EXPR_CONTEXT** %arrayidx3, align 4
  %expression = getelementptr inbounds %struct.EXPR_CONTEXT, %struct.EXPR_CONTEXT* %11, i32 0, i32 2
  %12 = load i8*, i8** %expression, align 8
  %tobool4 = icmp ne i8* %12, null
  br i1 %tobool4, label %if.then5, label %if.end8

if.then5:                                         ; preds = %if.end
  %13 = load %struct.EXPR_CONTEXT**, %struct.EXPR_CONTEXT*** @expr_stack, align 4
  %14 = load i32, i32* @expr_depth, align 4
  %arrayidx6 = getelementptr inbounds %struct.EXPR_CONTEXT*, %struct.EXPR_CONTEXT** %13, i32 %14
  %15 = load %struct.EXPR_CONTEXT*, %struct.EXPR_CONTEXT** %arrayidx6, align 4
  %expression7 = getelementptr inbounds %struct.EXPR_CONTEXT, %struct.EXPR_CONTEXT* %15, i32 0, i32 2
  %16 = load i8*, i8** %expression7, align 8
  call void @sh_xfree(i8* %16, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i32 302)
  br label %if.end8

if.end8:                                          ; preds = %if.then5, %if.end
  %17 = load %struct.EXPR_CONTEXT**, %struct.EXPR_CONTEXT*** @expr_stack, align 4
  %18 = load i32, i32* @expr_depth, align 4
  %arrayidx9 = getelementptr inbounds %struct.EXPR_CONTEXT*, %struct.EXPR_CONTEXT** %17, i32 %18
  %19 = load %struct.EXPR_CONTEXT*, %struct.EXPR_CONTEXT** %arrayidx9, align 4
  %20 = bitcast %struct.EXPR_CONTEXT* %19 to i8*
  call void @sh_xfree(i8* %20, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i32 304)
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %21 = load %struct.EXPR_CONTEXT**, %struct.EXPR_CONTEXT*** @expr_stack, align 4
  %22 = load i32, i32* @expr_depth, align 4
  %arrayidx10 = getelementptr inbounds %struct.EXPR_CONTEXT*, %struct.EXPR_CONTEXT** %21, i32 %22
  %23 = load %struct.EXPR_CONTEXT*, %struct.EXPR_CONTEXT** %arrayidx10, align 4
  %24 = bitcast %struct.EXPR_CONTEXT* %23 to i8*
  call void @sh_xfree(i8* %24, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i32 306)
  store i32 0, i32* @noeval, align 4
  ret void
}

; Function Attrs: noinline nounwind
define internal i64 @subexpr(i8* %expr) #0 {
entry:
  %retval = alloca i64, align 8
  %expr.addr = alloca i8*, align 4
  %val = alloca i64, align 8
  %p = alloca i8*, align 4
  store i8* %expr, i8** %expr.addr, align 4
  %0 = load i8*, i8** %expr.addr, align 4
  store i8* %0, i8** %p, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i8*, i8** %p, align 4
  %tobool = icmp ne i8* %1, null
  br i1 %tobool, label %land.lhs.true, label %land.end

land.lhs.true:                                    ; preds = %for.cond
  %2 = load i8*, i8** %p, align 4
  %3 = load i8, i8* %2, align 1
  %conv = sext i8 %3 to i32
  %tobool1 = icmp ne i32 %conv, 0
  br i1 %tobool1, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %land.lhs.true
  %4 = load i8*, i8** %p, align 4
  %5 = load i8, i8* %4, align 1
  %conv2 = sext i8 %5 to i32
  %cmp = icmp eq i32 %conv2, 32
  br i1 %cmp, label %lor.end, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.rhs
  %6 = load i8*, i8** %p, align 4
  %7 = load i8, i8* %6, align 1
  %conv4 = sext i8 %7 to i32
  %cmp5 = icmp eq i32 %conv4, 9
  br i1 %cmp5, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %lor.lhs.false
  %8 = load i8*, i8** %p, align 4
  %9 = load i8, i8* %8, align 1
  %conv7 = sext i8 %9 to i32
  %cmp8 = icmp eq i32 %conv7, 10
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %lor.lhs.false, %land.rhs
  %10 = phi i1 [ true, %lor.lhs.false ], [ true, %land.rhs ], [ %cmp8, %lor.rhs ]
  br label %land.end

land.end:                                         ; preds = %lor.end, %land.lhs.true, %for.cond
  %11 = phi i1 [ false, %land.lhs.true ], [ false, %for.cond ], [ %10, %lor.end ]
  br i1 %11, label %for.body, label %for.end

for.body:                                         ; preds = %land.end
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %12 = load i8*, i8** %p, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %12, i32 1
  store i8* %incdec.ptr, i8** %p, align 4
  br label %for.cond

for.end:                                          ; preds = %land.end
  %13 = load i8*, i8** %p, align 4
  %cmp10 = icmp eq i8* %13, null
  br i1 %cmp10, label %if.then, label %lor.lhs.false12

lor.lhs.false12:                                  ; preds = %for.end
  %14 = load i8*, i8** %p, align 4
  %15 = load i8, i8* %14, align 1
  %conv13 = sext i8 %15 to i32
  %cmp14 = icmp eq i32 %conv13, 0
  br i1 %cmp14, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false12, %for.end
  store i64 0, i64* %retval, align 8
  br label %return

if.end:                                           ; preds = %lor.lhs.false12
  call void @pushexp()
  %16 = load i8*, i8** %expr.addr, align 4
  %call = call i32 @strlen(i8* %16)
  %add = add i32 1, %call
  %call16 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i32 417)
  %17 = load i8*, i8** %expr.addr, align 4
  %call17 = call i8* @strcpy(i8* %call16, i8* %17)
  store i8* %call17, i8** @expression, align 4
  %18 = load i8*, i8** @expression, align 4
  store i8* %18, i8** @tp, align 4
  store i32 0, i32* @lasttok, align 4
  store i32 0, i32* @curtok, align 4
  store i8* null, i8** @tokstr, align 4
  store i64 0, i64* @tokval, align 8
  call void @init_lvalue(%struct.lvalue* @curlval)
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* bitcast (%struct.lvalue* @lastlval to i8*), i8* bitcast (%struct.lvalue* @curlval to i8*), i32 32, i32 8, i1 false)
  call void @readtok()
  %call18 = call i64 @expcomma()
  store i64 %call18, i64* %val, align 8
  %19 = load i32, i32* @curtok, align 4
  %cmp19 = icmp ne i32 %19, 0
  br i1 %cmp19, label %if.then21, label %if.end23

if.then21:                                        ; preds = %if.end
  %call22 = call i8* @libintl_gettext(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.1, i32 0, i32 0))
  call void @evalerror(i8* %call22)
  br label %if.end23

if.end23:                                         ; preds = %if.then21, %if.end
  br label %do.body

do.body:                                          ; preds = %if.end23
  %20 = load i8*, i8** @tokstr, align 4
  %tobool24 = icmp ne i8* %20, null
  br i1 %tobool24, label %if.then25, label %if.end26

if.then25:                                        ; preds = %do.body
  %21 = load i8*, i8** @tokstr, align 4
  call void @sh_xfree(i8* %21, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i32 433)
  br label %if.end26

if.end26:                                         ; preds = %if.then25, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end26
  br label %do.body27

do.body27:                                        ; preds = %do.end
  %22 = load i8*, i8** @expression, align 4
  %tobool28 = icmp ne i8* %22, null
  br i1 %tobool28, label %if.then29, label %if.end30

if.then29:                                        ; preds = %do.body27
  %23 = load i8*, i8** @expression, align 4
  call void @sh_xfree(i8* %23, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i32 434)
  br label %if.end30

if.end30:                                         ; preds = %if.then29, %do.body27
  br label %do.end31

do.end31:                                         ; preds = %if.end30
  call void @popexp()
  %24 = load i64, i64* %val, align 8
  store i64 %24, i64* %retval, align 8
  br label %return

return:                                           ; preds = %do.end31, %if.then
  %25 = load i64, i64* %retval, align 8
  ret i64 %25
}

; Function Attrs: noinline nounwind
define internal void @pushexp() #0 {
entry:
  %context = alloca %struct.EXPR_CONTEXT*, align 4
  %0 = load i32, i32* @expr_depth, align 4
  %cmp = icmp sge i32 %0, 1024
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call = call i8* @libintl_gettext(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.2, i32 0, i32 0))
  call void @evalerror(i8* %call)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @expr_depth, align 4
  %2 = load i32, i32* @expr_stack_size, align 4
  %cmp1 = icmp sge i32 %1, %2
  br i1 %cmp1, label %if.then2, label %if.end4

if.then2:                                         ; preds = %if.end
  %3 = load i32, i32* @expr_stack_size, align 4
  %add = add nsw i32 %3, 10
  store i32 %add, i32* @expr_stack_size, align 4
  %4 = load %struct.EXPR_CONTEXT**, %struct.EXPR_CONTEXT*** @expr_stack, align 4
  %5 = bitcast %struct.EXPR_CONTEXT** %4 to i8*
  %6 = load i32, i32* @expr_stack_size, align 4
  %mul = mul i32 %6, 4
  %call3 = call i8* @sh_xrealloc(i8* %5, i32 %mul, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i32 264)
  %7 = bitcast i8* %call3 to %struct.EXPR_CONTEXT**
  store %struct.EXPR_CONTEXT** %7, %struct.EXPR_CONTEXT*** @expr_stack, align 4
  br label %if.end4

if.end4:                                          ; preds = %if.then2, %if.end
  %call5 = call i8* @sh_xmalloc(i32 72, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i32 267)
  %8 = bitcast i8* %call5 to %struct.EXPR_CONTEXT*
  store %struct.EXPR_CONTEXT* %8, %struct.EXPR_CONTEXT** %context, align 4
  %9 = load i8*, i8** @expression, align 4
  %10 = load %struct.EXPR_CONTEXT*, %struct.EXPR_CONTEXT** %context, align 4
  %expression = getelementptr inbounds %struct.EXPR_CONTEXT, %struct.EXPR_CONTEXT* %10, i32 0, i32 2
  store i8* %9, i8** %expression, align 8
  br label %do.body

do.body:                                          ; preds = %if.end4
  %11 = load i32, i32* @curtok, align 4
  %12 = load %struct.EXPR_CONTEXT*, %struct.EXPR_CONTEXT** %context, align 4
  %curtok = getelementptr inbounds %struct.EXPR_CONTEXT, %struct.EXPR_CONTEXT* %12, i32 0, i32 0
  store i32 %11, i32* %curtok, align 8
  %13 = load i32, i32* @lasttok, align 4
  %14 = load %struct.EXPR_CONTEXT*, %struct.EXPR_CONTEXT** %context, align 4
  %lasttok = getelementptr inbounds %struct.EXPR_CONTEXT, %struct.EXPR_CONTEXT* %14, i32 0, i32 1
  store i32 %13, i32* %lasttok, align 4
  %15 = load i8*, i8** @tp, align 4
  %16 = load %struct.EXPR_CONTEXT*, %struct.EXPR_CONTEXT** %context, align 4
  %tp = getelementptr inbounds %struct.EXPR_CONTEXT, %struct.EXPR_CONTEXT* %16, i32 0, i32 3
  store i8* %15, i8** %tp, align 4
  %17 = load i8*, i8** @lasttp, align 4
  %18 = load %struct.EXPR_CONTEXT*, %struct.EXPR_CONTEXT** %context, align 4
  %lasttp = getelementptr inbounds %struct.EXPR_CONTEXT, %struct.EXPR_CONTEXT* %18, i32 0, i32 4
  store i8* %17, i8** %lasttp, align 8
  %19 = load i64, i64* @tokval, align 8
  %20 = load %struct.EXPR_CONTEXT*, %struct.EXPR_CONTEXT** %context, align 4
  %tokval = getelementptr inbounds %struct.EXPR_CONTEXT, %struct.EXPR_CONTEXT* %20, i32 0, i32 5
  store i64 %19, i64* %tokval, align 8
  %21 = load i8*, i8** @tokstr, align 4
  %22 = load %struct.EXPR_CONTEXT*, %struct.EXPR_CONTEXT** %context, align 4
  %tokstr = getelementptr inbounds %struct.EXPR_CONTEXT, %struct.EXPR_CONTEXT* %22, i32 0, i32 6
  store i8* %21, i8** %tokstr, align 8
  %23 = load i32, i32* @noeval, align 4
  %24 = load %struct.EXPR_CONTEXT*, %struct.EXPR_CONTEXT** %context, align 4
  %noeval = getelementptr inbounds %struct.EXPR_CONTEXT, %struct.EXPR_CONTEXT* %24, i32 0, i32 7
  store i32 %23, i32* %noeval, align 4
  %25 = load %struct.EXPR_CONTEXT*, %struct.EXPR_CONTEXT** %context, align 4
  %lval = getelementptr inbounds %struct.EXPR_CONTEXT, %struct.EXPR_CONTEXT* %25, i32 0, i32 8
  %26 = bitcast %struct.lvalue* %lval to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %26, i8* bitcast (%struct.lvalue* @curlval to i8*), i32 32, i32 8, i1 false)
  br label %do.end

do.end:                                           ; preds = %do.body
  %27 = load %struct.EXPR_CONTEXT*, %struct.EXPR_CONTEXT** %context, align 4
  %28 = load %struct.EXPR_CONTEXT**, %struct.EXPR_CONTEXT*** @expr_stack, align 4
  %29 = load i32, i32* @expr_depth, align 4
  %inc = add nsw i32 %29, 1
  store i32 %inc, i32* @expr_depth, align 4
  %arrayidx = getelementptr inbounds %struct.EXPR_CONTEXT*, %struct.EXPR_CONTEXT** %28, i32 %29
  store %struct.EXPR_CONTEXT* %27, %struct.EXPR_CONTEXT** %arrayidx, align 4
  ret void
}

declare i8* @strcpy(i8*, i8*) #3

declare i8* @sh_xmalloc(i32, i8*, i32) #3

declare i32 @strlen(i8*) #3

; Function Attrs: noinline nounwind
define internal void @init_lvalue(%struct.lvalue* %lv) #0 {
entry:
  %lv.addr = alloca %struct.lvalue*, align 4
  store %struct.lvalue* %lv, %struct.lvalue** %lv.addr, align 4
  %0 = load %struct.lvalue*, %struct.lvalue** %lv.addr, align 4
  %tokstr = getelementptr inbounds %struct.lvalue, %struct.lvalue* %0, i32 0, i32 0
  store i8* null, i8** %tokstr, align 8
  %1 = load %struct.lvalue*, %struct.lvalue** %lv.addr, align 4
  %tokvar = getelementptr inbounds %struct.lvalue, %struct.lvalue* %1, i32 0, i32 2
  store %struct.variable* null, %struct.variable** %tokvar, align 8
  %2 = load %struct.lvalue*, %struct.lvalue** %lv.addr, align 4
  %ind = getelementptr inbounds %struct.lvalue, %struct.lvalue* %2, i32 0, i32 3
  store i64 -1, i64* %ind, align 8
  %3 = load %struct.lvalue*, %struct.lvalue** %lv.addr, align 4
  %tokval = getelementptr inbounds %struct.lvalue, %struct.lvalue* %3, i32 0, i32 1
  store i64 -1, i64* %tokval, align 8
  ret void
}

; Function Attrs: noinline nounwind
define internal void @readtok() #0 {
entry:
  %cp = alloca i8*, align 4
  %xp = alloca i8*, align 4
  %c = alloca i8, align 1
  %c1 = alloca i8, align 1
  %e = alloca i32, align 4
  %lval = alloca %struct.lvalue, align 8
  %savecp = alloca i8*, align 4
  %ec = alloca %struct.EXPR_CONTEXT, align 8
  %peektok = alloca i32, align 4
  %0 = load i8*, i8** @tp, align 4
  store i8* %0, i8** %cp, align 4
  store i32 0, i32* %e, align 4
  store i8 0, i8* %c, align 1
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %1 = load i8*, i8** %cp, align 4
  %tobool = icmp ne i8* %1, null
  br i1 %tobool, label %land.lhs.true, label %land.end

land.lhs.true:                                    ; preds = %while.cond
  %2 = load i8*, i8** %cp, align 4
  %3 = load i8, i8* %2, align 1
  store i8 %3, i8* %c, align 1
  %conv = zext i8 %3 to i32
  %tobool1 = icmp ne i32 %conv, 0
  br i1 %tobool1, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %land.lhs.true
  %4 = load i8, i8* %c, align 1
  %conv2 = zext i8 %4 to i32
  %cmp = icmp eq i32 %conv2, 32
  br i1 %cmp, label %lor.end, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.rhs
  %5 = load i8, i8* %c, align 1
  %conv4 = zext i8 %5 to i32
  %cmp5 = icmp eq i32 %conv4, 9
  br i1 %cmp5, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %lor.lhs.false
  %6 = load i8, i8* %c, align 1
  %conv7 = zext i8 %6 to i32
  %cmp8 = icmp eq i32 %conv7, 10
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %lor.lhs.false, %land.rhs
  %7 = phi i1 [ true, %lor.lhs.false ], [ true, %land.rhs ], [ %cmp8, %lor.rhs ]
  br label %land.end

land.end:                                         ; preds = %lor.end, %land.lhs.true, %while.cond
  %8 = phi i1 [ false, %land.lhs.true ], [ false, %while.cond ], [ %7, %lor.end ]
  br i1 %8, label %while.body, label %while.end

while.body:                                       ; preds = %land.end
  %9 = load i8*, i8** %cp, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %9, i32 1
  store i8* %incdec.ptr, i8** %cp, align 4
  br label %while.cond

while.end:                                        ; preds = %land.end
  %10 = load i8, i8* %c, align 1
  %tobool10 = icmp ne i8 %10, 0
  br i1 %tobool10, label %if.then, label %if.end

if.then:                                          ; preds = %while.end
  %11 = load i8*, i8** %cp, align 4
  %incdec.ptr11 = getelementptr inbounds i8, i8* %11, i32 1
  store i8* %incdec.ptr11, i8** %cp, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %while.end
  %12 = load i8, i8* %c, align 1
  %conv12 = zext i8 %12 to i32
  %cmp13 = icmp eq i32 %conv12, 0
  br i1 %cmp13, label %if.then15, label %if.end16

if.then15:                                        ; preds = %if.end
  %13 = load i32, i32* @curtok, align 4
  store i32 %13, i32* @lasttok, align 4
  store i32 0, i32* @curtok, align 4
  %14 = load i8*, i8** %cp, align 4
  store i8* %14, i8** @tp, align 4
  br label %return

if.end16:                                         ; preds = %if.end
  %15 = load i8*, i8** %cp, align 4
  %add.ptr = getelementptr inbounds i8, i8* %15, i32 -1
  store i8* %add.ptr, i8** @tp, align 4
  store i8* %add.ptr, i8** @lasttp, align 4
  %16 = load i8, i8* %c, align 1
  %conv17 = zext i8 %16 to i32
  %call = call i32 @isalpha(i32 %conv17) #7
  %tobool18 = icmp ne i32 %call, 0
  br i1 %tobool18, label %if.then23, label %lor.lhs.false19

lor.lhs.false19:                                  ; preds = %if.end16
  %17 = load i8, i8* %c, align 1
  %conv20 = zext i8 %17 to i32
  %cmp21 = icmp eq i32 %conv20, 95
  br i1 %cmp21, label %if.then23, label %if.else96

if.then23:                                        ; preds = %lor.lhs.false19, %if.end16
  br label %while.cond24

while.cond24:                                     ; preds = %while.body33, %if.then23
  %18 = load i8, i8* %c, align 1
  %conv25 = zext i8 %18 to i32
  %call26 = call i32 @isalnum(i32 %conv25) #7
  %tobool27 = icmp ne i32 %call26, 0
  br i1 %tobool27, label %lor.end32, label %lor.rhs28

lor.rhs28:                                        ; preds = %while.cond24
  %19 = load i8, i8* %c, align 1
  %conv29 = zext i8 %19 to i32
  %cmp30 = icmp eq i32 %conv29, 95
  br label %lor.end32

lor.end32:                                        ; preds = %lor.rhs28, %while.cond24
  %20 = phi i1 [ true, %while.cond24 ], [ %cmp30, %lor.rhs28 ]
  br i1 %20, label %while.body33, label %while.end35

while.body33:                                     ; preds = %lor.end32
  %21 = load i8*, i8** %cp, align 4
  %incdec.ptr34 = getelementptr inbounds i8, i8* %21, i32 1
  store i8* %incdec.ptr34, i8** %cp, align 4
  %22 = load i8, i8* %21, align 1
  store i8 %22, i8* %c, align 1
  br label %while.cond24

while.end35:                                      ; preds = %lor.end32
  %23 = load i8*, i8** %cp, align 4
  %incdec.ptr36 = getelementptr inbounds i8, i8* %23, i32 -1
  store i8* %incdec.ptr36, i8** %cp, align 4
  %24 = load i8, i8* %incdec.ptr36, align 1
  store i8 %24, i8* %c, align 1
  %25 = load i8, i8* %c, align 1
  %conv37 = zext i8 %25 to i32
  %cmp38 = icmp eq i32 %conv37, 91
  br i1 %cmp38, label %if.then40, label %if.end48

if.then40:                                        ; preds = %while.end35
  %26 = load i8*, i8** %cp, align 4
  %call41 = call i32 @skipsubscript(i8* %26, i32 0, i32 0)
  store i32 %call41, i32* %e, align 4
  %27 = load i8*, i8** %cp, align 4
  %28 = load i32, i32* %e, align 4
  %arrayidx = getelementptr inbounds i8, i8* %27, i32 %28
  %29 = load i8, i8* %arrayidx, align 1
  %conv42 = sext i8 %29 to i32
  %cmp43 = icmp eq i32 %conv42, 93
  br i1 %cmp43, label %if.then45, label %if.else

if.then45:                                        ; preds = %if.then40
  %30 = load i32, i32* %e, align 4
  %add = add nsw i32 %30, 1
  %31 = load i8*, i8** %cp, align 4
  %add.ptr46 = getelementptr inbounds i8, i8* %31, i32 %add
  store i8* %add.ptr46, i8** %cp, align 4
  %32 = load i8*, i8** %cp, align 4
  %33 = load i8, i8* %32, align 1
  store i8 %33, i8* %c, align 1
  store i32 93, i32* %e, align 4
  br label %if.end47

if.else:                                          ; preds = %if.then40
  %34 = load i8*, i8** @bash_badsub_errmsg, align 4
  call void @evalerror(i8* %34)
  br label %if.end47

if.end47:                                         ; preds = %if.else, %if.then45
  br label %if.end48

if.end48:                                         ; preds = %if.end47, %while.end35
  %35 = load i8*, i8** %cp, align 4
  store i8 0, i8* %35, align 1
  %36 = load i8*, i8** getelementptr inbounds (%struct.lvalue, %struct.lvalue* @curlval, i32 0, i32 0), align 8
  %tobool49 = icmp ne i8* %36, null
  br i1 %tobool49, label %land.lhs.true50, label %if.end54

land.lhs.true50:                                  ; preds = %if.end48
  %37 = load i8*, i8** getelementptr inbounds (%struct.lvalue, %struct.lvalue* @curlval, i32 0, i32 0), align 8
  %38 = load i8*, i8** @tokstr, align 4
  %cmp51 = icmp eq i8* %37, %38
  br i1 %cmp51, label %if.then53, label %if.end54

if.then53:                                        ; preds = %land.lhs.true50
  call void @init_lvalue(%struct.lvalue* @curlval)
  br label %if.end54

if.end54:                                         ; preds = %if.then53, %land.lhs.true50, %if.end48
  br label %do.body

do.body:                                          ; preds = %if.end54
  %39 = load i8*, i8** @tokstr, align 4
  %tobool55 = icmp ne i8* %39, null
  br i1 %tobool55, label %if.then56, label %if.end57

if.then56:                                        ; preds = %do.body
  %40 = load i8*, i8** @tokstr, align 4
  call void @sh_xfree(i8* %40, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i32 1290)
  br label %if.end57

if.end57:                                         ; preds = %if.then56, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end57
  %41 = load i8*, i8** @tp, align 4
  %call58 = call i32 @strlen(i8* %41)
  %add59 = add i32 1, %call58
  %call60 = call i8* @sh_xmalloc(i32 %add59, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i32 1291)
  %42 = load i8*, i8** @tp, align 4
  %call61 = call i8* @strcpy(i8* %call60, i8* %42)
  store i8* %call61, i8** @tokstr, align 4
  %43 = load i8, i8* %c, align 1
  %44 = load i8*, i8** %cp, align 4
  store i8 %43, i8* %44, align 1
  br label %do.body62

do.body62:                                        ; preds = %do.end
  %45 = load i32, i32* @curtok, align 4
  %curtok = getelementptr inbounds %struct.EXPR_CONTEXT, %struct.EXPR_CONTEXT* %ec, i32 0, i32 0
  store i32 %45, i32* %curtok, align 8
  %46 = load i32, i32* @lasttok, align 4
  %lasttok = getelementptr inbounds %struct.EXPR_CONTEXT, %struct.EXPR_CONTEXT* %ec, i32 0, i32 1
  store i32 %46, i32* %lasttok, align 4
  %47 = load i8*, i8** @tp, align 4
  %tp = getelementptr inbounds %struct.EXPR_CONTEXT, %struct.EXPR_CONTEXT* %ec, i32 0, i32 3
  store i8* %47, i8** %tp, align 4
  %48 = load i8*, i8** @lasttp, align 4
  %lasttp = getelementptr inbounds %struct.EXPR_CONTEXT, %struct.EXPR_CONTEXT* %ec, i32 0, i32 4
  store i8* %48, i8** %lasttp, align 8
  %49 = load i64, i64* @tokval, align 8
  %tokval = getelementptr inbounds %struct.EXPR_CONTEXT, %struct.EXPR_CONTEXT* %ec, i32 0, i32 5
  store i64 %49, i64* %tokval, align 8
  %50 = load i8*, i8** @tokstr, align 4
  %tokstr = getelementptr inbounds %struct.EXPR_CONTEXT, %struct.EXPR_CONTEXT* %ec, i32 0, i32 6
  store i8* %50, i8** %tokstr, align 8
  %51 = load i32, i32* @noeval, align 4
  %noeval = getelementptr inbounds %struct.EXPR_CONTEXT, %struct.EXPR_CONTEXT* %ec, i32 0, i32 7
  store i32 %51, i32* %noeval, align 4
  %lval63 = getelementptr inbounds %struct.EXPR_CONTEXT, %struct.EXPR_CONTEXT* %ec, i32 0, i32 8
  %52 = bitcast %struct.lvalue* %lval63 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %52, i8* bitcast (%struct.lvalue* @curlval to i8*), i32 32, i32 8, i1 false)
  br label %do.end64

do.end64:                                         ; preds = %do.body62
  store i8* null, i8** @tokstr, align 4
  %53 = load i8*, i8** %cp, align 4
  store i8* %53, i8** %savecp, align 4
  store i8* %53, i8** @tp, align 4
  store i32 1, i32* @noeval, align 4
  store i32 5, i32* @curtok, align 4
  call void @readtok()
  %54 = load i32, i32* @curtok, align 4
  store i32 %54, i32* %peektok, align 4
  %55 = load i32, i32* %peektok, align 4
  %cmp65 = icmp eq i32 %55, 5
  br i1 %cmp65, label %if.then67, label %if.end73

if.then67:                                        ; preds = %do.end64
  br label %do.body68

do.body68:                                        ; preds = %if.then67
  %56 = load i8*, i8** @tokstr, align 4
  %tobool69 = icmp ne i8* %56, null
  br i1 %tobool69, label %if.then70, label %if.end71

if.then70:                                        ; preds = %do.body68
  %57 = load i8*, i8** @tokstr, align 4
  call void @sh_xfree(i8* %57, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i32 1303)
  br label %if.end71

if.end71:                                         ; preds = %if.then70, %do.body68
  br label %do.end72

do.end72:                                         ; preds = %if.end71
  br label %if.end73

if.end73:                                         ; preds = %do.end72, %do.end64
  br label %do.body74

do.body74:                                        ; preds = %if.end73
  %curtok75 = getelementptr inbounds %struct.EXPR_CONTEXT, %struct.EXPR_CONTEXT* %ec, i32 0, i32 0
  %58 = load i32, i32* %curtok75, align 8
  store i32 %58, i32* @curtok, align 4
  %lasttok76 = getelementptr inbounds %struct.EXPR_CONTEXT, %struct.EXPR_CONTEXT* %ec, i32 0, i32 1
  %59 = load i32, i32* %lasttok76, align 4
  store i32 %59, i32* @lasttok, align 4
  %tp77 = getelementptr inbounds %struct.EXPR_CONTEXT, %struct.EXPR_CONTEXT* %ec, i32 0, i32 3
  %60 = load i8*, i8** %tp77, align 4
  store i8* %60, i8** @tp, align 4
  %lasttp78 = getelementptr inbounds %struct.EXPR_CONTEXT, %struct.EXPR_CONTEXT* %ec, i32 0, i32 4
  %61 = load i8*, i8** %lasttp78, align 8
  store i8* %61, i8** @lasttp, align 4
  %tokval79 = getelementptr inbounds %struct.EXPR_CONTEXT, %struct.EXPR_CONTEXT* %ec, i32 0, i32 5
  %62 = load i64, i64* %tokval79, align 8
  store i64 %62, i64* @tokval, align 8
  %tokstr80 = getelementptr inbounds %struct.EXPR_CONTEXT, %struct.EXPR_CONTEXT* %ec, i32 0, i32 6
  %63 = load i8*, i8** %tokstr80, align 8
  store i8* %63, i8** @tokstr, align 4
  %noeval81 = getelementptr inbounds %struct.EXPR_CONTEXT, %struct.EXPR_CONTEXT* %ec, i32 0, i32 7
  %64 = load i32, i32* %noeval81, align 4
  store i32 %64, i32* @noeval, align 4
  %lval82 = getelementptr inbounds %struct.EXPR_CONTEXT, %struct.EXPR_CONTEXT* %ec, i32 0, i32 8
  %65 = bitcast %struct.lvalue* %lval82 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* bitcast (%struct.lvalue* @curlval to i8*), i8* %65, i32 32, i32 8, i1 false)
  br label %do.end83

do.end83:                                         ; preds = %do.body74
  %66 = load i8*, i8** %savecp, align 4
  store i8* %66, i8** %cp, align 4
  %67 = load i32, i32* @lasttok, align 4
  %cmp84 = icmp eq i32 %67, 14
  br i1 %cmp84, label %if.then92, label %lor.lhs.false86

lor.lhs.false86:                                  ; preds = %do.end83
  %68 = load i32, i32* @lasttok, align 4
  %cmp87 = icmp eq i32 %68, 15
  br i1 %cmp87, label %if.then92, label %lor.lhs.false89

lor.lhs.false89:                                  ; preds = %lor.lhs.false86
  %69 = load i32, i32* %peektok, align 4
  %cmp90 = icmp ne i32 %69, 61
  br i1 %cmp90, label %if.then92, label %if.else94

if.then92:                                        ; preds = %lor.lhs.false89, %lor.lhs.false86, %do.end83
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* bitcast (%struct.lvalue* @lastlval to i8*), i8* bitcast (%struct.lvalue* @curlval to i8*), i32 32, i32 8, i1 false)
  %70 = load i8*, i8** @tokstr, align 4
  %71 = load i32, i32* %e, align 4
  %call93 = call i64 @expr_streval(i8* %70, i32 %71, %struct.lvalue* @curlval)
  store i64 %call93, i64* @tokval, align 8
  br label %if.end95

if.else94:                                        ; preds = %lor.lhs.false89
  store i64 0, i64* @tokval, align 8
  br label %if.end95

if.end95:                                         ; preds = %if.else94, %if.then92
  %72 = load i32, i32* @curtok, align 4
  store i32 %72, i32* @lasttok, align 4
  store i32 5, i32* @curtok, align 4
  br label %if.end346

if.else96:                                        ; preds = %lor.lhs.false19
  %73 = load i8, i8* %c, align 1
  %conv97 = zext i8 %73 to i32
  %cmp98 = icmp sge i32 %conv97, 48
  br i1 %cmp98, label %land.lhs.true100, label %if.else127

land.lhs.true100:                                 ; preds = %if.else96
  %74 = load i8, i8* %c, align 1
  %conv101 = zext i8 %74 to i32
  %cmp102 = icmp sle i32 %conv101, 57
  br i1 %cmp102, label %if.then104, label %if.else127

if.then104:                                       ; preds = %land.lhs.true100
  br label %while.cond105

while.cond105:                                    ; preds = %while.body122, %if.then104
  %75 = load i8, i8* %c, align 1
  %conv106 = zext i8 %75 to i32
  %call107 = call i32 @isalnum(i32 %conv106) #7
  %tobool108 = icmp ne i32 %call107, 0
  br i1 %tobool108, label %lor.end121, label %lor.lhs.false109

lor.lhs.false109:                                 ; preds = %while.cond105
  %76 = load i8, i8* %c, align 1
  %conv110 = zext i8 %76 to i32
  %cmp111 = icmp eq i32 %conv110, 35
  br i1 %cmp111, label %lor.end121, label %lor.lhs.false113

lor.lhs.false113:                                 ; preds = %lor.lhs.false109
  %77 = load i8, i8* %c, align 1
  %conv114 = zext i8 %77 to i32
  %cmp115 = icmp eq i32 %conv114, 64
  br i1 %cmp115, label %lor.end121, label %lor.rhs117

lor.rhs117:                                       ; preds = %lor.lhs.false113
  %78 = load i8, i8* %c, align 1
  %conv118 = zext i8 %78 to i32
  %cmp119 = icmp eq i32 %conv118, 95
  br label %lor.end121

lor.end121:                                       ; preds = %lor.rhs117, %lor.lhs.false113, %lor.lhs.false109, %while.cond105
  %79 = phi i1 [ true, %lor.lhs.false113 ], [ true, %lor.lhs.false109 ], [ true, %while.cond105 ], [ %cmp119, %lor.rhs117 ]
  br i1 %79, label %while.body122, label %while.end124

while.body122:                                    ; preds = %lor.end121
  %80 = load i8*, i8** %cp, align 4
  %incdec.ptr123 = getelementptr inbounds i8, i8* %80, i32 1
  store i8* %incdec.ptr123, i8** %cp, align 4
  %81 = load i8, i8* %80, align 1
  store i8 %81, i8* %c, align 1
  br label %while.cond105

while.end124:                                     ; preds = %lor.end121
  %82 = load i8*, i8** %cp, align 4
  %incdec.ptr125 = getelementptr inbounds i8, i8* %82, i32 -1
  store i8* %incdec.ptr125, i8** %cp, align 4
  %83 = load i8, i8* %incdec.ptr125, align 1
  store i8 %83, i8* %c, align 1
  %84 = load i8*, i8** %cp, align 4
  store i8 0, i8* %84, align 1
  %85 = load i8*, i8** @tp, align 4
  %call126 = call i64 @strlong(i8* %85)
  store i64 %call126, i64* @tokval, align 8
  %86 = load i8, i8* %c, align 1
  %87 = load i8*, i8** %cp, align 4
  store i8 %86, i8* %87, align 1
  %88 = load i32, i32* @curtok, align 4
  store i32 %88, i32* @lasttok, align 4
  store i32 6, i32* @curtok, align 4
  br label %if.end345

if.else127:                                       ; preds = %land.lhs.true100, %if.else96
  %89 = load i8*, i8** %cp, align 4
  %incdec.ptr128 = getelementptr inbounds i8, i8* %89, i32 1
  store i8* %incdec.ptr128, i8** %cp, align 4
  %90 = load i8, i8* %89, align 1
  store i8 %90, i8* %c1, align 1
  %91 = load i8, i8* %c, align 1
  %conv129 = zext i8 %91 to i32
  %cmp130 = icmp eq i32 %conv129, 61
  br i1 %cmp130, label %land.lhs.true132, label %if.else137

land.lhs.true132:                                 ; preds = %if.else127
  %92 = load i8, i8* %c1, align 1
  %conv133 = zext i8 %92 to i32
  %cmp134 = icmp eq i32 %conv133, 61
  br i1 %cmp134, label %if.then136, label %if.else137

if.then136:                                       ; preds = %land.lhs.true132
  store i8 1, i8* %c, align 1
  br label %if.end343

if.else137:                                       ; preds = %land.lhs.true132, %if.else127
  %93 = load i8, i8* %c, align 1
  %conv138 = zext i8 %93 to i32
  %cmp139 = icmp eq i32 %conv138, 33
  br i1 %cmp139, label %land.lhs.true141, label %if.else146

land.lhs.true141:                                 ; preds = %if.else137
  %94 = load i8, i8* %c1, align 1
  %conv142 = zext i8 %94 to i32
  %cmp143 = icmp eq i32 %conv142, 61
  br i1 %cmp143, label %if.then145, label %if.else146

if.then145:                                       ; preds = %land.lhs.true141
  store i8 2, i8* %c, align 1
  br label %if.end342

if.else146:                                       ; preds = %land.lhs.true141, %if.else137
  %95 = load i8, i8* %c, align 1
  %conv147 = zext i8 %95 to i32
  %cmp148 = icmp eq i32 %conv147, 62
  br i1 %cmp148, label %land.lhs.true150, label %if.else155

land.lhs.true150:                                 ; preds = %if.else146
  %96 = load i8, i8* %c1, align 1
  %conv151 = zext i8 %96 to i32
  %cmp152 = icmp eq i32 %conv151, 61
  br i1 %cmp152, label %if.then154, label %if.else155

if.then154:                                       ; preds = %land.lhs.true150
  store i8 4, i8* %c, align 1
  br label %if.end341

if.else155:                                       ; preds = %land.lhs.true150, %if.else146
  %97 = load i8, i8* %c, align 1
  %conv156 = zext i8 %97 to i32
  %cmp157 = icmp eq i32 %conv156, 60
  br i1 %cmp157, label %land.lhs.true159, label %if.else164

land.lhs.true159:                                 ; preds = %if.else155
  %98 = load i8, i8* %c1, align 1
  %conv160 = zext i8 %98 to i32
  %cmp161 = icmp eq i32 %conv160, 61
  br i1 %cmp161, label %if.then163, label %if.else164

if.then163:                                       ; preds = %land.lhs.true159
  store i8 3, i8* %c, align 1
  br label %if.end340

if.else164:                                       ; preds = %land.lhs.true159, %if.else155
  %99 = load i8, i8* %c, align 1
  %conv165 = zext i8 %99 to i32
  %cmp166 = icmp eq i32 %conv165, 60
  br i1 %cmp166, label %land.lhs.true168, label %if.else180

land.lhs.true168:                                 ; preds = %if.else164
  %100 = load i8, i8* %c1, align 1
  %conv169 = zext i8 %100 to i32
  %cmp170 = icmp eq i32 %conv169, 60
  br i1 %cmp170, label %if.then172, label %if.else180

if.then172:                                       ; preds = %land.lhs.true168
  %101 = load i8*, i8** %cp, align 4
  %102 = load i8, i8* %101, align 1
  %conv173 = sext i8 %102 to i32
  %cmp174 = icmp eq i32 %conv173, 61
  br i1 %cmp174, label %if.then176, label %if.else178

if.then176:                                       ; preds = %if.then172
  store i32 9, i32* @assigntok, align 4
  store i8 11, i8* %c, align 1
  %103 = load i8*, i8** %cp, align 4
  %incdec.ptr177 = getelementptr inbounds i8, i8* %103, i32 1
  store i8* %incdec.ptr177, i8** %cp, align 4
  br label %if.end179

if.else178:                                       ; preds = %if.then172
  store i8 9, i8* %c, align 1
  br label %if.end179

if.end179:                                        ; preds = %if.else178, %if.then176
  br label %if.end339

if.else180:                                       ; preds = %land.lhs.true168, %if.else164
  %104 = load i8, i8* %c, align 1
  %conv181 = zext i8 %104 to i32
  %cmp182 = icmp eq i32 %conv181, 62
  br i1 %cmp182, label %land.lhs.true184, label %if.else196

land.lhs.true184:                                 ; preds = %if.else180
  %105 = load i8, i8* %c1, align 1
  %conv185 = zext i8 %105 to i32
  %cmp186 = icmp eq i32 %conv185, 62
  br i1 %cmp186, label %if.then188, label %if.else196

if.then188:                                       ; preds = %land.lhs.true184
  %106 = load i8*, i8** %cp, align 4
  %107 = load i8, i8* %106, align 1
  %conv189 = sext i8 %107 to i32
  %cmp190 = icmp eq i32 %conv189, 61
  br i1 %cmp190, label %if.then192, label %if.else194

if.then192:                                       ; preds = %if.then188
  store i32 10, i32* @assigntok, align 4
  store i8 11, i8* %c, align 1
  %108 = load i8*, i8** %cp, align 4
  %incdec.ptr193 = getelementptr inbounds i8, i8* %108, i32 1
  store i8* %incdec.ptr193, i8** %cp, align 4
  br label %if.end195

if.else194:                                       ; preds = %if.then188
  store i8 10, i8* %c, align 1
  br label %if.end195

if.end195:                                        ; preds = %if.else194, %if.then192
  br label %if.end338

if.else196:                                       ; preds = %land.lhs.true184, %if.else180
  %109 = load i8, i8* %c, align 1
  %conv197 = zext i8 %109 to i32
  %cmp198 = icmp eq i32 %conv197, 38
  br i1 %cmp198, label %land.lhs.true200, label %if.else205

land.lhs.true200:                                 ; preds = %if.else196
  %110 = load i8, i8* %c1, align 1
  %conv201 = zext i8 %110 to i32
  %cmp202 = icmp eq i32 %conv201, 38
  br i1 %cmp202, label %if.then204, label %if.else205

if.then204:                                       ; preds = %land.lhs.true200
  store i8 7, i8* %c, align 1
  br label %if.end337

if.else205:                                       ; preds = %land.lhs.true200, %if.else196
  %111 = load i8, i8* %c, align 1
  %conv206 = zext i8 %111 to i32
  %cmp207 = icmp eq i32 %conv206, 124
  br i1 %cmp207, label %land.lhs.true209, label %if.else214

land.lhs.true209:                                 ; preds = %if.else205
  %112 = load i8, i8* %c1, align 1
  %conv210 = zext i8 %112 to i32
  %cmp211 = icmp eq i32 %conv210, 124
  br i1 %cmp211, label %if.then213, label %if.else214

if.then213:                                       ; preds = %land.lhs.true209
  store i8 8, i8* %c, align 1
  br label %if.end336

if.else214:                                       ; preds = %land.lhs.true209, %if.else205
  %113 = load i8, i8* %c, align 1
  %conv215 = zext i8 %113 to i32
  %cmp216 = icmp eq i32 %conv215, 42
  br i1 %cmp216, label %land.lhs.true218, label %if.else223

land.lhs.true218:                                 ; preds = %if.else214
  %114 = load i8, i8* %c1, align 1
  %conv219 = zext i8 %114 to i32
  %cmp220 = icmp eq i32 %conv219, 42
  br i1 %cmp220, label %if.then222, label %if.else223

if.then222:                                       ; preds = %land.lhs.true218
  store i8 13, i8* %c, align 1
  br label %if.end335

if.else223:                                       ; preds = %land.lhs.true218, %if.else214
  %115 = load i8, i8* %c, align 1
  %conv224 = zext i8 %115 to i32
  %cmp225 = icmp eq i32 %conv224, 45
  br i1 %cmp225, label %land.lhs.true231, label %lor.lhs.false227

lor.lhs.false227:                                 ; preds = %if.else223
  %116 = load i8, i8* %c, align 1
  %conv228 = zext i8 %116 to i32
  %cmp229 = icmp eq i32 %conv228, 43
  br i1 %cmp229, label %land.lhs.true231, label %if.else244

land.lhs.true231:                                 ; preds = %lor.lhs.false227, %if.else223
  %117 = load i8, i8* %c1, align 1
  %conv232 = zext i8 %117 to i32
  %118 = load i8, i8* %c, align 1
  %conv233 = zext i8 %118 to i32
  %cmp234 = icmp eq i32 %conv232, %conv233
  br i1 %cmp234, label %land.lhs.true236, label %if.else244

land.lhs.true236:                                 ; preds = %land.lhs.true231
  %119 = load i32, i32* @curtok, align 4
  %cmp237 = icmp eq i32 %119, 5
  br i1 %cmp237, label %if.then239, label %if.else244

if.then239:                                       ; preds = %land.lhs.true236
  %120 = load i8, i8* %c, align 1
  %conv240 = zext i8 %120 to i32
  %cmp241 = icmp eq i32 %conv240, 45
  %cond = select i1 %cmp241, i32 17, i32 16
  %conv243 = trunc i32 %cond to i8
  store i8 %conv243, i8* %c, align 1
  br label %if.end334

if.else244:                                       ; preds = %land.lhs.true236, %land.lhs.true231, %lor.lhs.false227
  %121 = load i8, i8* %c, align 1
  %conv245 = zext i8 %121 to i32
  %cmp246 = icmp eq i32 %conv245, 45
  br i1 %cmp246, label %land.lhs.true252, label %lor.lhs.false248

lor.lhs.false248:                                 ; preds = %if.else244
  %122 = load i8, i8* %c, align 1
  %conv249 = zext i8 %122 to i32
  %cmp250 = icmp eq i32 %conv249, 43
  br i1 %cmp250, label %land.lhs.true252, label %if.else296

land.lhs.true252:                                 ; preds = %lor.lhs.false248, %if.else244
  %123 = load i8, i8* %c1, align 1
  %conv253 = zext i8 %123 to i32
  %124 = load i8, i8* %c, align 1
  %conv254 = zext i8 %124 to i32
  %cmp255 = icmp eq i32 %conv253, %conv254
  br i1 %cmp255, label %if.then257, label %if.else296

if.then257:                                       ; preds = %land.lhs.true252
  %125 = load i8*, i8** %cp, align 4
  store i8* %125, i8** %xp, align 4
  br label %while.cond258

while.cond258:                                    ; preds = %while.body277, %if.then257
  %126 = load i8*, i8** %xp, align 4
  %tobool259 = icmp ne i8* %126, null
  br i1 %tobool259, label %land.lhs.true260, label %land.end276

land.lhs.true260:                                 ; preds = %while.cond258
  %127 = load i8*, i8** %xp, align 4
  %128 = load i8, i8* %127, align 1
  %conv261 = sext i8 %128 to i32
  %tobool262 = icmp ne i32 %conv261, 0
  br i1 %tobool262, label %land.rhs263, label %land.end276

land.rhs263:                                      ; preds = %land.lhs.true260
  %129 = load i8*, i8** %xp, align 4
  %130 = load i8, i8* %129, align 1
  %conv264 = sext i8 %130 to i32
  %cmp265 = icmp eq i32 %conv264, 32
  br i1 %cmp265, label %lor.end275, label %lor.lhs.false267

lor.lhs.false267:                                 ; preds = %land.rhs263
  %131 = load i8*, i8** %xp, align 4
  %132 = load i8, i8* %131, align 1
  %conv268 = sext i8 %132 to i32
  %cmp269 = icmp eq i32 %conv268, 9
  br i1 %cmp269, label %lor.end275, label %lor.rhs271

lor.rhs271:                                       ; preds = %lor.lhs.false267
  %133 = load i8*, i8** %xp, align 4
  %134 = load i8, i8* %133, align 1
  %conv272 = sext i8 %134 to i32
  %cmp273 = icmp eq i32 %conv272, 10
  br label %lor.end275

lor.end275:                                       ; preds = %lor.rhs271, %lor.lhs.false267, %land.rhs263
  %135 = phi i1 [ true, %lor.lhs.false267 ], [ true, %land.rhs263 ], [ %cmp273, %lor.rhs271 ]
  br label %land.end276

land.end276:                                      ; preds = %lor.end275, %land.lhs.true260, %while.cond258
  %136 = phi i1 [ false, %land.lhs.true260 ], [ false, %while.cond258 ], [ %135, %lor.end275 ]
  br i1 %136, label %while.body277, label %while.end279

while.body277:                                    ; preds = %land.end276
  %137 = load i8*, i8** %xp, align 4
  %incdec.ptr278 = getelementptr inbounds i8, i8* %137, i32 1
  store i8* %incdec.ptr278, i8** %xp, align 4
  br label %while.cond258

while.end279:                                     ; preds = %land.end276
  %138 = load i8*, i8** %xp, align 4
  %139 = load i8, i8* %138, align 1
  %conv280 = zext i8 %139 to i32
  %call281 = call i32 @isalpha(i32 %conv280) #7
  %tobool282 = icmp ne i32 %call281, 0
  br i1 %tobool282, label %if.then287, label %lor.lhs.false283

lor.lhs.false283:                                 ; preds = %while.end279
  %140 = load i8*, i8** %xp, align 4
  %141 = load i8, i8* %140, align 1
  %conv284 = zext i8 %141 to i32
  %cmp285 = icmp eq i32 %conv284, 95
  br i1 %cmp285, label %if.then287, label %if.else293

if.then287:                                       ; preds = %lor.lhs.false283, %while.end279
  %142 = load i8, i8* %c, align 1
  %conv288 = zext i8 %142 to i32
  %cmp289 = icmp eq i32 %conv288, 45
  %cond291 = select i1 %cmp289, i32 15, i32 14
  %conv292 = trunc i32 %cond291 to i8
  store i8 %conv292, i8* %c, align 1
  br label %if.end295

if.else293:                                       ; preds = %lor.lhs.false283
  %143 = load i8*, i8** %cp, align 4
  %incdec.ptr294 = getelementptr inbounds i8, i8* %143, i32 -1
  store i8* %incdec.ptr294, i8** %cp, align 4
  br label %if.end295

if.end295:                                        ; preds = %if.else293, %if.then287
  br label %if.end333

if.else296:                                       ; preds = %land.lhs.true252, %lor.lhs.false248
  %144 = load i8, i8* %c1, align 1
  %conv297 = zext i8 %144 to i32
  %cmp298 = icmp eq i32 %conv297, 61
  br i1 %cmp298, label %land.lhs.true300, label %if.else309

land.lhs.true300:                                 ; preds = %if.else296
  %145 = load i8, i8* %c, align 1
  %conv301 = zext i8 %145 to i32
  %tobool302 = icmp ne i32 %conv301, 0
  br i1 %tobool302, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true300
  %146 = load i8, i8* %c, align 1
  %conv303 = zext i8 %146 to i32
  %call304 = call i8* @mbschr(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i32 0, i32 0), i32 %conv303)
  %cmp305 = icmp ne i8* %call304, null
  br i1 %cmp305, label %if.then307, label %if.else309

cond.false:                                       ; preds = %land.lhs.true300
  br i1 false, label %if.then307, label %if.else309

if.then307:                                       ; preds = %cond.false, %cond.true
  %147 = load i8, i8* %c, align 1
  %conv308 = zext i8 %147 to i32
  store i32 %conv308, i32* @assigntok, align 4
  store i8 11, i8* %c, align 1
  br label %if.end332

if.else309:                                       ; preds = %cond.false, %cond.true, %if.else296
  %148 = load i8, i8* %c, align 1
  %conv310 = zext i8 %148 to i32
  %call311 = call i32 @_is_arithop(i32 %conv310)
  %cmp312 = icmp eq i32 %call311, 0
  br i1 %cmp312, label %if.then314, label %if.else329

if.then314:                                       ; preds = %if.else309
  %149 = load i8*, i8** %cp, align 4
  %incdec.ptr315 = getelementptr inbounds i8, i8* %149, i32 -1
  store i8* %incdec.ptr315, i8** %cp, align 4
  %150 = load i32, i32* @curtok, align 4
  %cmp316 = icmp eq i32 %150, 0
  br i1 %cmp316, label %if.then324, label %lor.lhs.false318

lor.lhs.false318:                                 ; preds = %if.then314
  %151 = load i32, i32* @curtok, align 4
  %call319 = call i32 @_is_arithop(i32 %151)
  %tobool320 = icmp ne i32 %call319, 0
  br i1 %tobool320, label %if.then324, label %lor.lhs.false321

lor.lhs.false321:                                 ; preds = %lor.lhs.false318
  %152 = load i32, i32* @curtok, align 4
  %call322 = call i32 @_is_multiop(i32 %152)
  %tobool323 = icmp ne i32 %call322, 0
  br i1 %tobool323, label %if.then324, label %if.else326

if.then324:                                       ; preds = %lor.lhs.false321, %lor.lhs.false318, %if.then314
  %call325 = call i8* @libintl_gettext(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.4, i32 0, i32 0))
  call void @evalerror(i8* %call325)
  br label %if.end328

if.else326:                                       ; preds = %lor.lhs.false321
  %call327 = call i8* @libintl_gettext(i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.5, i32 0, i32 0))
  call void @evalerror(i8* %call327)
  br label %if.end328

if.end328:                                        ; preds = %if.else326, %if.then324
  br label %if.end331

if.else329:                                       ; preds = %if.else309
  %153 = load i8*, i8** %cp, align 4
  %incdec.ptr330 = getelementptr inbounds i8, i8* %153, i32 -1
  store i8* %incdec.ptr330, i8** %cp, align 4
  br label %if.end331

if.end331:                                        ; preds = %if.else329, %if.end328
  br label %if.end332

if.end332:                                        ; preds = %if.end331, %if.then307
  br label %if.end333

if.end333:                                        ; preds = %if.end332, %if.end295
  br label %if.end334

if.end334:                                        ; preds = %if.end333, %if.then239
  br label %if.end335

if.end335:                                        ; preds = %if.end334, %if.then222
  br label %if.end336

if.end336:                                        ; preds = %if.end335, %if.then213
  br label %if.end337

if.end337:                                        ; preds = %if.end336, %if.then204
  br label %if.end338

if.end338:                                        ; preds = %if.end337, %if.end195
  br label %if.end339

if.end339:                                        ; preds = %if.end338, %if.end179
  br label %if.end340

if.end340:                                        ; preds = %if.end339, %if.then163
  br label %if.end341

if.end341:                                        ; preds = %if.end340, %if.then154
  br label %if.end342

if.end342:                                        ; preds = %if.end341, %if.then145
  br label %if.end343

if.end343:                                        ; preds = %if.end342, %if.then136
  %154 = load i32, i32* @curtok, align 4
  store i32 %154, i32* @lasttok, align 4
  %155 = load i8, i8* %c, align 1
  %conv344 = zext i8 %155 to i32
  store i32 %conv344, i32* @curtok, align 4
  br label %if.end345

if.end345:                                        ; preds = %if.end343, %while.end124
  br label %if.end346

if.end346:                                        ; preds = %if.end345, %if.end95
  %156 = load i8*, i8** %cp, align 4
  store i8* %156, i8** @tp, align 4
  br label %return

return:                                           ; preds = %if.end346, %if.then15
  ret void
}

; Function Attrs: noinline nounwind
define internal i64 @expcomma() #0 {
entry:
  %value = alloca i64, align 8
  %call = call i64 @expassign()
  store i64 %call, i64* %value, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %0 = load i32, i32* @curtok, align 4
  %cmp = icmp eq i32 %0, 44
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  call void @readtok()
  %call1 = call i64 @expassign()
  store i64 %call1, i64* %value, align 8
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %1 = load i64, i64* %value, align 8
  ret i64 %1
}

; Function Attrs: noinline nounwind
define internal void @evalerror(i8* %msg) #0 {
entry:
  %msg.addr = alloca i8*, align 4
  %name = alloca i8*, align 4
  %t = alloca i8*, align 4
  store i8* %msg, i8** %msg.addr, align 4
  %0 = load i8*, i8** @this_command_name, align 4
  store i8* %0, i8** %name, align 4
  %1 = load i8*, i8** @expression, align 4
  store i8* %1, i8** %t, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i8*, i8** %t, align 4
  %3 = load i8, i8* %2, align 1
  %conv = sext i8 %3 to i32
  %cmp = icmp eq i32 %conv, 32
  br i1 %cmp, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %for.cond
  %4 = load i8*, i8** %t, align 4
  %5 = load i8, i8* %4, align 1
  %conv2 = sext i8 %5 to i32
  %cmp3 = icmp eq i32 %conv2, 9
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %for.cond
  %6 = phi i1 [ true, %for.cond ], [ %cmp3, %lor.rhs ]
  br i1 %6, label %for.body, label %for.end

for.body:                                         ; preds = %lor.end
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %7 = load i8*, i8** %t, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %7, i32 1
  store i8* %incdec.ptr, i8** %t, align 4
  br label %for.cond

for.end:                                          ; preds = %lor.end
  %call = call i8* @libintl_gettext(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.18, i32 0, i32 0))
  %8 = load i8*, i8** %name, align 4
  %tobool = icmp ne i8* %8, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.end
  %9 = load i8*, i8** %name, align 4
  br label %cond.end

cond.false:                                       ; preds = %for.end
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %9, %cond.true ], [ getelementptr inbounds ([1 x i8], [1 x i8]* @.str.19, i32 0, i32 0), %cond.false ]
  %10 = load i8*, i8** %name, align 4
  %tobool5 = icmp ne i8* %10, null
  %cond6 = select i1 %tobool5, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.20, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.19, i32 0, i32 0)
  %11 = load i8*, i8** %t, align 4
  %12 = load i8*, i8** %msg.addr, align 4
  %13 = load i8*, i8** @lasttp, align 4
  %tobool7 = icmp ne i8* %13, null
  br i1 %tobool7, label %land.lhs.true, label %cond.false11

land.lhs.true:                                    ; preds = %cond.end
  %14 = load i8*, i8** @lasttp, align 4
  %15 = load i8, i8* %14, align 1
  %conv8 = sext i8 %15 to i32
  %tobool9 = icmp ne i32 %conv8, 0
  br i1 %tobool9, label %cond.true10, label %cond.false11

cond.true10:                                      ; preds = %land.lhs.true
  %16 = load i8*, i8** @lasttp, align 4
  br label %cond.end12

cond.false11:                                     ; preds = %land.lhs.true, %cond.end
  br label %cond.end12

cond.end12:                                       ; preds = %cond.false11, %cond.true10
  %cond13 = phi i8* [ %16, %cond.true10 ], [ getelementptr inbounds ([1 x i8], [1 x i8]* @.str.19, i32 0, i32 0), %cond.false11 ]
  call void (i8*, ...) @internal_error(i8* %call, i8* %cond, i8* %cond6, i8* %11, i8* %12, i8* %cond13)
  call void @longjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* @evalbuf, i32 0, i32 0), i32 1) #8
  unreachable

return:                                           ; No predecessors!
  ret void
}

declare i8* @libintl_gettext(i8*) #3

; Function Attrs: noinline nounwind
define internal void @popexp() #0 {
entry:
  %context = alloca %struct.EXPR_CONTEXT*, align 4
  %0 = load i32, i32* @expr_depth, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call = call i8* @libintl_gettext(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.21, i32 0, i32 0))
  call void @evalerror(i8* %call)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %1 = load %struct.EXPR_CONTEXT**, %struct.EXPR_CONTEXT*** @expr_stack, align 4
  %2 = load i32, i32* @expr_depth, align 4
  %dec = add nsw i32 %2, -1
  store i32 %dec, i32* @expr_depth, align 4
  %arrayidx = getelementptr inbounds %struct.EXPR_CONTEXT*, %struct.EXPR_CONTEXT** %1, i32 %dec
  %3 = load %struct.EXPR_CONTEXT*, %struct.EXPR_CONTEXT** %arrayidx, align 4
  store %struct.EXPR_CONTEXT* %3, %struct.EXPR_CONTEXT** %context, align 4
  %4 = load %struct.EXPR_CONTEXT*, %struct.EXPR_CONTEXT** %context, align 4
  %expression = getelementptr inbounds %struct.EXPR_CONTEXT, %struct.EXPR_CONTEXT* %4, i32 0, i32 2
  %5 = load i8*, i8** %expression, align 8
  store i8* %5, i8** @expression, align 4
  br label %do.body

do.body:                                          ; preds = %if.end
  %6 = load %struct.EXPR_CONTEXT*, %struct.EXPR_CONTEXT** %context, align 4
  %curtok = getelementptr inbounds %struct.EXPR_CONTEXT, %struct.EXPR_CONTEXT* %6, i32 0, i32 0
  %7 = load i32, i32* %curtok, align 8
  store i32 %7, i32* @curtok, align 4
  %8 = load %struct.EXPR_CONTEXT*, %struct.EXPR_CONTEXT** %context, align 4
  %lasttok = getelementptr inbounds %struct.EXPR_CONTEXT, %struct.EXPR_CONTEXT* %8, i32 0, i32 1
  %9 = load i32, i32* %lasttok, align 4
  store i32 %9, i32* @lasttok, align 4
  %10 = load %struct.EXPR_CONTEXT*, %struct.EXPR_CONTEXT** %context, align 4
  %tp = getelementptr inbounds %struct.EXPR_CONTEXT, %struct.EXPR_CONTEXT* %10, i32 0, i32 3
  %11 = load i8*, i8** %tp, align 4
  store i8* %11, i8** @tp, align 4
  %12 = load %struct.EXPR_CONTEXT*, %struct.EXPR_CONTEXT** %context, align 4
  %lasttp = getelementptr inbounds %struct.EXPR_CONTEXT, %struct.EXPR_CONTEXT* %12, i32 0, i32 4
  %13 = load i8*, i8** %lasttp, align 8
  store i8* %13, i8** @lasttp, align 4
  %14 = load %struct.EXPR_CONTEXT*, %struct.EXPR_CONTEXT** %context, align 4
  %tokval = getelementptr inbounds %struct.EXPR_CONTEXT, %struct.EXPR_CONTEXT* %14, i32 0, i32 5
  %15 = load i64, i64* %tokval, align 8
  store i64 %15, i64* @tokval, align 8
  %16 = load %struct.EXPR_CONTEXT*, %struct.EXPR_CONTEXT** %context, align 4
  %tokstr = getelementptr inbounds %struct.EXPR_CONTEXT, %struct.EXPR_CONTEXT* %16, i32 0, i32 6
  %17 = load i8*, i8** %tokstr, align 8
  store i8* %17, i8** @tokstr, align 4
  %18 = load %struct.EXPR_CONTEXT*, %struct.EXPR_CONTEXT** %context, align 4
  %noeval = getelementptr inbounds %struct.EXPR_CONTEXT, %struct.EXPR_CONTEXT* %18, i32 0, i32 7
  %19 = load i32, i32* %noeval, align 4
  store i32 %19, i32* @noeval, align 4
  %20 = load %struct.EXPR_CONTEXT*, %struct.EXPR_CONTEXT** %context, align 4
  %lval = getelementptr inbounds %struct.EXPR_CONTEXT, %struct.EXPR_CONTEXT* %20, i32 0, i32 8
  %21 = bitcast %struct.lvalue* %lval to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* bitcast (%struct.lvalue* @curlval to i8*), i8* %21, i32 32, i32 8, i1 false)
  br label %do.end

do.end:                                           ; preds = %do.body
  %22 = load %struct.EXPR_CONTEXT*, %struct.EXPR_CONTEXT** %context, align 4
  %23 = bitcast %struct.EXPR_CONTEXT* %22 to i8*
  call void @sh_xfree(i8* %23, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i32 290)
  ret void
}

declare i8* @sh_xrealloc(i8*, i32, i8*, i32) #3

; Function Attrs: nounwind readonly
declare i32 @isalpha(i32) #4

; Function Attrs: nounwind readonly
declare i32 @isalnum(i32) #4

declare i32 @skipsubscript(i8*, i32, i32) #3

; Function Attrs: noinline nounwind
define internal i64 @expr_streval(i8* %tok, i32 %e, %struct.lvalue* %lvalue) #0 {
entry:
  %retval = alloca i64, align 8
  %tok.addr = alloca i8*, align 4
  %e.addr = alloca i32, align 4
  %lvalue.addr = alloca %struct.lvalue*, align 4
  %v = alloca %struct.variable*, align 4
  %value = alloca i8*, align 4
  %tval = alloca i64, align 8
  %ind = alloca i64, align 8
  store i8* %tok, i8** %tok.addr, align 4
  store i32 %e, i32* %e.addr, align 4
  store %struct.lvalue* %lvalue, %struct.lvalue** %lvalue.addr, align 4
  %0 = load i32, i32* @noeval, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i64 0, i64* %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i32, i32* %e.addr, align 4
  %cmp = icmp eq i32 %1, 93
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end
  %2 = load i8*, i8** %tok.addr, align 4
  %call = call %struct.variable* @array_variable_part(i8* %2, i8** null, i32* null)
  br label %cond.end

cond.false:                                       ; preds = %if.end
  %3 = load i8*, i8** %tok.addr, align 4
  %call1 = call %struct.variable* @find_variable(i8* %3)
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi %struct.variable* [ %call, %cond.true ], [ %call1, %cond.false ]
  store %struct.variable* %cond, %struct.variable** %v, align 4
  %4 = load %struct.variable*, %struct.variable** %v, align 4
  %cmp2 = icmp eq %struct.variable* %4, null
  br i1 %cmp2, label %land.lhs.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %cond.end
  %5 = load %struct.variable*, %struct.variable** %v, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %5, i32 0, i32 5
  %6 = load i32, i32* %attributes, align 4
  %and = and i32 %6, 4096
  %tobool3 = icmp ne i32 %and, 0
  br i1 %tobool3, label %land.lhs.true, label %if.end25

land.lhs.true:                                    ; preds = %lor.lhs.false, %cond.end
  %7 = load i32, i32* @unbound_vars_is_error, align 4
  %tobool4 = icmp ne i32 %7, 0
  br i1 %tobool4, label %if.then5, label %if.end25

if.then5:                                         ; preds = %land.lhs.true
  %8 = load i32, i32* %e.addr, align 4
  %cmp6 = icmp eq i32 %8, 93
  br i1 %cmp6, label %cond.true7, label %cond.false9

cond.true7:                                       ; preds = %if.then5
  %9 = load i8*, i8** %tok.addr, align 4
  %call8 = call i8* @array_variable_name(i8* %9, i8** null, i32* null)
  br label %cond.end10

cond.false9:                                      ; preds = %if.then5
  %10 = load i8*, i8** %tok.addr, align 4
  br label %cond.end10

cond.end10:                                       ; preds = %cond.false9, %cond.true7
  %cond11 = phi i8* [ %call8, %cond.true7 ], [ %10, %cond.false9 ]
  store i8* %cond11, i8** %value, align 4
  store i32 1, i32* @last_command_exit_value, align 4
  %11 = load i8*, i8** %value, align 4
  call void @err_unboundvar(i8* %11)
  %12 = load i32, i32* %e.addr, align 4
  %cmp12 = icmp eq i32 %12, 93
  br i1 %cmp12, label %if.then13, label %if.end17

if.then13:                                        ; preds = %cond.end10
  br label %do.body

do.body:                                          ; preds = %if.then13
  %13 = load i8*, i8** %value, align 4
  %tobool14 = icmp ne i8* %13, null
  br i1 %tobool14, label %if.then15, label %if.end16

if.then15:                                        ; preds = %do.body
  %14 = load i8*, i8** %value, align 4
  call void @sh_xfree(i8* %14, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i32 1126)
  br label %if.end16

if.end16:                                         ; preds = %if.then15, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end16
  br label %if.end17

if.end17:                                         ; preds = %do.end, %cond.end10
  %15 = load i32, i32* @no_longjmp_on_fatal_error, align 4
  %tobool18 = icmp ne i32 %15, 0
  br i1 %tobool18, label %land.lhs.true19, label %if.end22

land.lhs.true19:                                  ; preds = %if.end17
  %16 = load i32, i32* @interactive_shell, align 4
  %tobool20 = icmp ne i32 %16, 0
  br i1 %tobool20, label %if.then21, label %if.end22

if.then21:                                        ; preds = %land.lhs.true19
  call void @longjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* @evalbuf, i32 0, i32 0), i32 1) #8
  unreachable

if.end22:                                         ; preds = %land.lhs.true19, %if.end17
  %17 = load i32, i32* @interactive_shell, align 4
  %tobool23 = icmp ne i32 %17, 0
  br i1 %tobool23, label %if.then24, label %if.else

if.then24:                                        ; preds = %if.end22
  call void @expr_unwind()
  call void @top_level_cleanup()
  call void @jump_to_top_level(i32 2) #8
  unreachable

if.else:                                          ; preds = %if.end22
  call void @jump_to_top_level(i32 1) #8
  unreachable

if.end25:                                         ; preds = %land.lhs.true, %lor.lhs.false
  store i64 -1, i64* %ind, align 8
  %18 = load i32, i32* %e.addr, align 4
  %cmp26 = icmp eq i32 %18, 93
  br i1 %cmp26, label %cond.true27, label %cond.false29

cond.true27:                                      ; preds = %if.end25
  %19 = load i8*, i8** %tok.addr, align 4
  %call28 = call i8* @get_array_value(i8* %19, i32 0, i32* null, i64* %ind)
  br label %cond.end31

cond.false29:                                     ; preds = %if.end25
  %20 = load %struct.variable*, %struct.variable** %v, align 4
  %call30 = call i8* @get_variable_value(%struct.variable* %20)
  br label %cond.end31

cond.end31:                                       ; preds = %cond.false29, %cond.true27
  %cond32 = phi i8* [ %call28, %cond.true27 ], [ %call30, %cond.false29 ]
  store i8* %cond32, i8** %value, align 4
  %21 = load i8*, i8** %value, align 4
  %tobool33 = icmp ne i8* %21, null
  br i1 %tobool33, label %land.lhs.true34, label %cond.false38

land.lhs.true34:                                  ; preds = %cond.end31
  %22 = load i8*, i8** %value, align 4
  %23 = load i8, i8* %22, align 1
  %conv = sext i8 %23 to i32
  %tobool35 = icmp ne i32 %conv, 0
  br i1 %tobool35, label %cond.true36, label %cond.false38

cond.true36:                                      ; preds = %land.lhs.true34
  %24 = load i8*, i8** %value, align 4
  %call37 = call i64 @subexpr(i8* %24)
  br label %cond.end39

cond.false38:                                     ; preds = %land.lhs.true34, %cond.end31
  br label %cond.end39

cond.end39:                                       ; preds = %cond.false38, %cond.true36
  %cond40 = phi i64 [ %call37, %cond.true36 ], [ 0, %cond.false38 ]
  store i64 %cond40, i64* %tval, align 8
  %25 = load %struct.lvalue*, %struct.lvalue** %lvalue.addr, align 4
  %tobool41 = icmp ne %struct.lvalue* %25, null
  br i1 %tobool41, label %if.then42, label %if.end44

if.then42:                                        ; preds = %cond.end39
  %26 = load i8*, i8** %tok.addr, align 4
  %27 = load %struct.lvalue*, %struct.lvalue** %lvalue.addr, align 4
  %tokstr = getelementptr inbounds %struct.lvalue, %struct.lvalue* %27, i32 0, i32 0
  store i8* %26, i8** %tokstr, align 8
  %28 = load i64, i64* %tval, align 8
  %29 = load %struct.lvalue*, %struct.lvalue** %lvalue.addr, align 4
  %tokval = getelementptr inbounds %struct.lvalue, %struct.lvalue* %29, i32 0, i32 1
  store i64 %28, i64* %tokval, align 8
  %30 = load %struct.variable*, %struct.variable** %v, align 4
  %31 = load %struct.lvalue*, %struct.lvalue** %lvalue.addr, align 4
  %tokvar = getelementptr inbounds %struct.lvalue, %struct.lvalue* %31, i32 0, i32 2
  store %struct.variable* %30, %struct.variable** %tokvar, align 8
  %32 = load i64, i64* %ind, align 8
  %33 = load %struct.lvalue*, %struct.lvalue** %lvalue.addr, align 4
  %ind43 = getelementptr inbounds %struct.lvalue, %struct.lvalue* %33, i32 0, i32 3
  store i64 %32, i64* %ind43, align 8
  br label %if.end44

if.end44:                                         ; preds = %if.then42, %cond.end39
  %34 = load i64, i64* %tval, align 8
  store i64 %34, i64* %retval, align 8
  br label %return

return:                                           ; preds = %if.end44, %if.then
  %35 = load i64, i64* %retval, align 8
  ret i64 %35
}

; Function Attrs: noinline nounwind
define internal i64 @strlong(i8* %num) #0 {
entry:
  %retval = alloca i64, align 8
  %num.addr = alloca i8*, align 4
  %s = alloca i8*, align 4
  %c = alloca i8, align 1
  %base = alloca i32, align 4
  %foundbase = alloca i32, align 4
  %val = alloca i64, align 8
  store i8* %num, i8** %num.addr, align 4
  %0 = load i8*, i8** %num.addr, align 4
  store i8* %0, i8** %s, align 4
  store i32 10, i32* %base, align 4
  store i32 0, i32* %foundbase, align 4
  %1 = load i8*, i8** %s, align 4
  %2 = load i8, i8* %1, align 1
  %conv = sext i8 %2 to i32
  %cmp = icmp eq i32 %conv, 48
  br i1 %cmp, label %if.then, label %if.end15

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %s, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %3, i32 1
  store i8* %incdec.ptr, i8** %s, align 4
  %4 = load i8*, i8** %s, align 4
  %5 = load i8, i8* %4, align 1
  %conv2 = sext i8 %5 to i32
  %cmp3 = icmp eq i32 %conv2, 0
  br i1 %cmp3, label %if.then5, label %if.end

if.then5:                                         ; preds = %if.then
  store i64 0, i64* %retval, align 8
  br label %return

if.end:                                           ; preds = %if.then
  %6 = load i8*, i8** %s, align 4
  %7 = load i8, i8* %6, align 1
  %conv6 = sext i8 %7 to i32
  %cmp7 = icmp eq i32 %conv6, 120
  br i1 %cmp7, label %if.then12, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end
  %8 = load i8*, i8** %s, align 4
  %9 = load i8, i8* %8, align 1
  %conv9 = sext i8 %9 to i32
  %cmp10 = icmp eq i32 %conv9, 88
  br i1 %cmp10, label %if.then12, label %if.else

if.then12:                                        ; preds = %lor.lhs.false, %if.end
  store i32 16, i32* %base, align 4
  %10 = load i8*, i8** %s, align 4
  %incdec.ptr13 = getelementptr inbounds i8, i8* %10, i32 1
  store i8* %incdec.ptr13, i8** %s, align 4
  br label %if.end14

if.else:                                          ; preds = %lor.lhs.false
  store i32 8, i32* %base, align 4
  br label %if.end14

if.end14:                                         ; preds = %if.else, %if.then12
  %11 = load i32, i32* %foundbase, align 4
  %inc = add nsw i32 %11, 1
  store i32 %inc, i32* %foundbase, align 4
  br label %if.end15

if.end15:                                         ; preds = %if.end14, %entry
  store i64 0, i64* %val, align 8
  %12 = load i8*, i8** %s, align 4
  %incdec.ptr16 = getelementptr inbounds i8, i8* %12, i32 1
  store i8* %incdec.ptr16, i8** %s, align 4
  %13 = load i8, i8* %12, align 1
  store i8 %13, i8* %c, align 1
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end15
  %14 = load i8, i8* %c, align 1
  %tobool = icmp ne i8 %14, 0
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %15 = load i8, i8* %c, align 1
  %conv17 = zext i8 %15 to i32
  %cmp18 = icmp eq i32 %conv17, 35
  br i1 %cmp18, label %if.then20, label %if.else34

if.then20:                                        ; preds = %for.body
  %16 = load i32, i32* %foundbase, align 4
  %tobool21 = icmp ne i32 %16, 0
  br i1 %tobool21, label %if.then22, label %if.end23

if.then22:                                        ; preds = %if.then20
  %call = call i8* @libintl_gettext(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.6, i32 0, i32 0))
  call void @evalerror(i8* %call)
  br label %if.end23

if.end23:                                         ; preds = %if.then22, %if.then20
  %17 = load i64, i64* %val, align 8
  %cmp24 = icmp slt i64 %17, 2
  br i1 %cmp24, label %if.then29, label %lor.lhs.false26

lor.lhs.false26:                                  ; preds = %if.end23
  %18 = load i64, i64* %val, align 8
  %cmp27 = icmp sgt i64 %18, 64
  br i1 %cmp27, label %if.then29, label %if.end31

if.then29:                                        ; preds = %lor.lhs.false26, %if.end23
  %call30 = call i8* @libintl_gettext(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.7, i32 0, i32 0))
  call void @evalerror(i8* %call30)
  br label %if.end31

if.end31:                                         ; preds = %if.then29, %lor.lhs.false26
  %19 = load i64, i64* %val, align 8
  %conv32 = trunc i64 %19 to i32
  store i32 %conv32, i32* %base, align 4
  store i64 0, i64* %val, align 8
  %20 = load i32, i32* %foundbase, align 4
  %inc33 = add nsw i32 %20, 1
  store i32 %inc33, i32* %foundbase, align 4
  br label %if.end108

if.else34:                                        ; preds = %for.body
  %21 = load i8, i8* %c, align 1
  %conv35 = zext i8 %21 to i32
  %call36 = call i32 @isalnum(i32 %conv35) #7
  %tobool37 = icmp ne i32 %call36, 0
  br i1 %tobool37, label %if.then46, label %lor.lhs.false38

lor.lhs.false38:                                  ; preds = %if.else34
  %22 = load i8, i8* %c, align 1
  %conv39 = zext i8 %22 to i32
  %cmp40 = icmp eq i32 %conv39, 95
  br i1 %cmp40, label %if.then46, label %lor.lhs.false42

lor.lhs.false42:                                  ; preds = %lor.lhs.false38
  %23 = load i8, i8* %c, align 1
  %conv43 = zext i8 %23 to i32
  %cmp44 = icmp eq i32 %conv43, 64
  br i1 %cmp44, label %if.then46, label %if.else106

if.then46:                                        ; preds = %lor.lhs.false42, %lor.lhs.false38, %if.else34
  %24 = load i8, i8* %c, align 1
  %conv47 = zext i8 %24 to i32
  %cmp48 = icmp sge i32 %conv47, 48
  br i1 %cmp48, label %land.lhs.true, label %if.else56

land.lhs.true:                                    ; preds = %if.then46
  %25 = load i8, i8* %c, align 1
  %conv50 = zext i8 %25 to i32
  %cmp51 = icmp sle i32 %conv50, 57
  br i1 %cmp51, label %if.then53, label %if.else56

if.then53:                                        ; preds = %land.lhs.true
  %26 = load i8, i8* %c, align 1
  %conv54 = zext i8 %26 to i32
  %sub = sub nsw i32 %conv54, 48
  %conv55 = trunc i32 %sub to i8
  store i8 %conv55, i8* %c, align 1
  br label %if.end97

if.else56:                                        ; preds = %land.lhs.true, %if.then46
  %27 = load i8, i8* %c, align 1
  %conv57 = zext i8 %27 to i32
  %cmp58 = icmp sge i32 %conv57, 97
  br i1 %cmp58, label %land.lhs.true60, label %if.else68

land.lhs.true60:                                  ; preds = %if.else56
  %28 = load i8, i8* %c, align 1
  %conv61 = zext i8 %28 to i32
  %cmp62 = icmp sle i32 %conv61, 122
  br i1 %cmp62, label %if.then64, label %if.else68

if.then64:                                        ; preds = %land.lhs.true60
  %29 = load i8, i8* %c, align 1
  %conv65 = zext i8 %29 to i32
  %sub66 = sub nsw i32 %conv65, 87
  %conv67 = trunc i32 %sub66 to i8
  store i8 %conv67, i8* %c, align 1
  br label %if.end96

if.else68:                                        ; preds = %land.lhs.true60, %if.else56
  %30 = load i8, i8* %c, align 1
  %conv69 = zext i8 %30 to i32
  %cmp70 = icmp sge i32 %conv69, 65
  br i1 %cmp70, label %land.lhs.true72, label %if.else83

land.lhs.true72:                                  ; preds = %if.else68
  %31 = load i8, i8* %c, align 1
  %conv73 = zext i8 %31 to i32
  %cmp74 = icmp sle i32 %conv73, 90
  br i1 %cmp74, label %if.then76, label %if.else83

if.then76:                                        ; preds = %land.lhs.true72
  %32 = load i32, i32* %base, align 4
  %cmp77 = icmp sle i32 %32, 36
  %cond = select i1 %cmp77, i32 10, i32 36
  %sub79 = sub nsw i32 65, %cond
  %33 = load i8, i8* %c, align 1
  %conv80 = zext i8 %33 to i32
  %sub81 = sub nsw i32 %conv80, %sub79
  %conv82 = trunc i32 %sub81 to i8
  store i8 %conv82, i8* %c, align 1
  br label %if.end95

if.else83:                                        ; preds = %land.lhs.true72, %if.else68
  %34 = load i8, i8* %c, align 1
  %conv84 = zext i8 %34 to i32
  %cmp85 = icmp eq i32 %conv84, 64
  br i1 %cmp85, label %if.then87, label %if.else88

if.then87:                                        ; preds = %if.else83
  store i8 62, i8* %c, align 1
  br label %if.end94

if.else88:                                        ; preds = %if.else83
  %35 = load i8, i8* %c, align 1
  %conv89 = zext i8 %35 to i32
  %cmp90 = icmp eq i32 %conv89, 95
  br i1 %cmp90, label %if.then92, label %if.end93

if.then92:                                        ; preds = %if.else88
  store i8 63, i8* %c, align 1
  br label %if.end93

if.end93:                                         ; preds = %if.then92, %if.else88
  br label %if.end94

if.end94:                                         ; preds = %if.end93, %if.then87
  br label %if.end95

if.end95:                                         ; preds = %if.end94, %if.then76
  br label %if.end96

if.end96:                                         ; preds = %if.end95, %if.then64
  br label %if.end97

if.end97:                                         ; preds = %if.end96, %if.then53
  %36 = load i8, i8* %c, align 1
  %conv98 = zext i8 %36 to i32
  %37 = load i32, i32* %base, align 4
  %cmp99 = icmp sge i32 %conv98, %37
  br i1 %cmp99, label %if.then101, label %if.end103

if.then101:                                       ; preds = %if.end97
  %call102 = call i8* @libintl_gettext(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.8, i32 0, i32 0))
  call void @evalerror(i8* %call102)
  br label %if.end103

if.end103:                                        ; preds = %if.then101, %if.end97
  %38 = load i64, i64* %val, align 8
  %39 = load i32, i32* %base, align 4
  %conv104 = sext i32 %39 to i64
  %mul = mul nsw i64 %38, %conv104
  %40 = load i8, i8* %c, align 1
  %conv105 = zext i8 %40 to i64
  %add = add nsw i64 %mul, %conv105
  store i64 %add, i64* %val, align 8
  br label %if.end107

if.else106:                                       ; preds = %lor.lhs.false42
  br label %for.end

if.end107:                                        ; preds = %if.end103
  br label %if.end108

if.end108:                                        ; preds = %if.end107, %if.end31
  br label %for.inc

for.inc:                                          ; preds = %if.end108
  %41 = load i8*, i8** %s, align 4
  %incdec.ptr109 = getelementptr inbounds i8, i8* %41, i32 1
  store i8* %incdec.ptr109, i8** %s, align 4
  %42 = load i8, i8* %41, align 1
  store i8 %42, i8* %c, align 1
  br label %for.cond

for.end:                                          ; preds = %if.else106, %for.cond
  %43 = load i64, i64* %val, align 8
  store i64 %43, i64* %retval, align 8
  br label %return

return:                                           ; preds = %for.end, %if.then5
  %44 = load i64, i64* %retval, align 8
  ret i64 %44
}

declare i8* @mbschr(i8*, i32) #3

; Function Attrs: noinline nounwind
define internal i32 @_is_arithop(i32 %c) #0 {
entry:
  %retval = alloca i32, align 4
  %c.addr = alloca i32, align 4
  store i32 %c, i32* %c.addr, align 4
  %0 = load i32, i32* %c.addr, align 4
  switch i32 %0, label %sw.default [
    i32 61, label %sw.bb
    i32 62, label %sw.bb
    i32 60, label %sw.bb
    i32 43, label %sw.bb
    i32 45, label %sw.bb
    i32 42, label %sw.bb
    i32 47, label %sw.bb
    i32 37, label %sw.bb
    i32 33, label %sw.bb
    i32 40, label %sw.bb
    i32 41, label %sw.bb
    i32 38, label %sw.bb
    i32 124, label %sw.bb
    i32 94, label %sw.bb
    i32 126, label %sw.bb
    i32 63, label %sw.bb1
    i32 58, label %sw.bb1
    i32 44, label %sw.bb1
  ]

sw.bb:                                            ; preds = %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry
  store i32 1, i32* %retval, align 4
  br label %return

sw.bb1:                                           ; preds = %entry, %entry, %entry
  store i32 1, i32* %retval, align 4
  br label %return

sw.default:                                       ; preds = %entry
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %sw.default, %sw.bb1, %sw.bb
  %1 = load i32, i32* %retval, align 4
  ret i32 %1
}

; Function Attrs: noinline nounwind
define internal i32 @_is_multiop(i32 %c) #0 {
entry:
  %retval = alloca i32, align 4
  %c.addr = alloca i32, align 4
  store i32 %c, i32* %c.addr, align 4
  %0 = load i32, i32* %c.addr, align 4
  switch i32 %0, label %sw.default [
    i32 1, label %sw.bb
    i32 2, label %sw.bb
    i32 3, label %sw.bb
    i32 4, label %sw.bb
    i32 7, label %sw.bb
    i32 8, label %sw.bb
    i32 9, label %sw.bb
    i32 10, label %sw.bb
    i32 11, label %sw.bb
    i32 12, label %sw.bb
    i32 13, label %sw.bb
    i32 14, label %sw.bb
    i32 15, label %sw.bb
    i32 16, label %sw.bb
    i32 17, label %sw.bb
  ]

sw.bb:                                            ; preds = %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry
  store i32 1, i32* %retval, align 4
  br label %return

sw.default:                                       ; preds = %entry
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %sw.default, %sw.bb
  %1 = load i32, i32* %retval, align 4
  ret i32 %1
}

declare %struct.variable* @array_variable_part(i8*, i8**, i32*) #3

declare %struct.variable* @find_variable(i8*) #3

declare i8* @array_variable_name(i8*, i8**, i32*) #3

declare void @err_unboundvar(i8*) #3

; Function Attrs: noreturn
declare void @longjmp(%struct.__jmp_buf_tag*, i32) #5

declare void @top_level_cleanup() #3

; Function Attrs: noreturn
declare void @jump_to_top_level(i32) #5

declare i8* @get_array_value(i8*, i32, i32*, i64*) #3

declare i8* @get_variable_value(%struct.variable*) #3

; Function Attrs: noinline nounwind
define internal i64 @expassign() #0 {
entry:
  %value = alloca i64, align 8
  %lhs = alloca i8*, align 4
  %rhs = alloca i8*, align 4
  %lind = alloca i64, align 8
  %idiv = alloca %struct.imaxdiv_t, align 8
  %special = alloca i32, align 4
  %op = alloca i32, align 4
  %lvalue = alloca i64, align 8
  %tmp = alloca %struct.imaxdiv_t, align 8
  %call = call i64 @expcond()
  store i64 %call, i64* %value, align 8
  %0 = load i32, i32* @curtok, align 4
  %cmp = icmp eq i32 %0, 61
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i32, i32* @curtok, align 4
  %cmp1 = icmp eq i32 %1, 11
  br i1 %cmp1, label %if.then, label %if.end72

if.then:                                          ; preds = %lor.lhs.false, %entry
  %2 = load i32, i32* @curtok, align 4
  %cmp2 = icmp eq i32 %2, 11
  %conv = zext i1 %cmp2 to i32
  store i32 %conv, i32* %special, align 4
  %3 = load i32, i32* @lasttok, align 4
  %cmp3 = icmp ne i32 %3, 5
  br i1 %cmp3, label %if.then5, label %if.end

if.then5:                                         ; preds = %if.then
  %call6 = call i8* @libintl_gettext(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.9, i32 0, i32 0))
  call void @evalerror(i8* %call6)
  br label %if.end

if.end:                                           ; preds = %if.then5, %if.then
  %4 = load i32, i32* %special, align 4
  %tobool = icmp ne i32 %4, 0
  br i1 %tobool, label %if.then7, label %if.end8

if.then7:                                         ; preds = %if.end
  %5 = load i32, i32* @assigntok, align 4
  store i32 %5, i32* %op, align 4
  %6 = load i64, i64* %value, align 8
  store i64 %6, i64* %lvalue, align 8
  br label %if.end8

if.end8:                                          ; preds = %if.then7, %if.end
  %7 = load i8*, i8** @tokstr, align 4
  %call9 = call i32 @strlen(i8* %7)
  %add = add i32 1, %call9
  %call10 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i32 484)
  %8 = load i8*, i8** @tokstr, align 4
  %call11 = call i8* @strcpy(i8* %call10, i8* %8)
  store i8* %call11, i8** %lhs, align 4
  %9 = load i64, i64* getelementptr inbounds (%struct.lvalue, %struct.lvalue* @curlval, i32 0, i32 3), align 8
  store i64 %9, i64* %lind, align 8
  call void @readtok()
  %call12 = call i64 @expassign()
  store i64 %call12, i64* %value, align 8
  %10 = load i32, i32* %special, align 4
  %tobool13 = icmp ne i32 %10, 0
  br i1 %tobool13, label %if.then14, label %if.end52

if.then14:                                        ; preds = %if.end8
  %11 = load i32, i32* %op, align 4
  %cmp15 = icmp eq i32 %11, 47
  br i1 %cmp15, label %land.lhs.true, label %lor.lhs.false17

lor.lhs.false17:                                  ; preds = %if.then14
  %12 = load i32, i32* %op, align 4
  %cmp18 = icmp eq i32 %12, 37
  br i1 %cmp18, label %land.lhs.true, label %if.end28

land.lhs.true:                                    ; preds = %lor.lhs.false17, %if.then14
  %13 = load i64, i64* %value, align 8
  %cmp20 = icmp eq i64 %13, 0
  br i1 %cmp20, label %if.then22, label %if.end28

if.then22:                                        ; preds = %land.lhs.true
  %14 = load i32, i32* @noeval, align 4
  %cmp23 = icmp eq i32 %14, 0
  br i1 %cmp23, label %if.then25, label %if.else

if.then25:                                        ; preds = %if.then22
  %call26 = call i8* @libintl_gettext(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.10, i32 0, i32 0))
  call void @evalerror(i8* %call26)
  br label %if.end27

if.else:                                          ; preds = %if.then22
  store i64 1, i64* %value, align 8
  br label %if.end27

if.end27:                                         ; preds = %if.else, %if.then25
  br label %if.end28

if.end28:                                         ; preds = %if.end27, %land.lhs.true, %lor.lhs.false17
  %15 = load i32, i32* %op, align 4
  switch i32 %15, label %sw.default [
    i32 42, label %sw.bb
    i32 47, label %sw.bb29
    i32 37, label %sw.bb29
    i32 43, label %sw.bb43
    i32 45, label %sw.bb45
    i32 9, label %sw.bb46
    i32 10, label %sw.bb47
    i32 38, label %sw.bb48
    i32 124, label %sw.bb49
    i32 94, label %sw.bb50
  ]

sw.bb:                                            ; preds = %if.end28
  %16 = load i64, i64* %value, align 8
  %17 = load i64, i64* %lvalue, align 8
  %mul = mul nsw i64 %17, %16
  store i64 %mul, i64* %lvalue, align 8
  br label %sw.epilog

sw.bb29:                                          ; preds = %if.end28, %if.end28
  %18 = load i64, i64* %lvalue, align 8
  %cmp30 = icmp eq i64 %18, -9223372036854775808
  br i1 %cmp30, label %land.lhs.true32, label %if.else38

land.lhs.true32:                                  ; preds = %sw.bb29
  %19 = load i64, i64* %value, align 8
  %cmp33 = icmp eq i64 %19, -1
  br i1 %cmp33, label %if.then35, label %if.else38

if.then35:                                        ; preds = %land.lhs.true32
  %20 = load i32, i32* %op, align 4
  %cmp36 = icmp eq i32 %20, 47
  %cond = select i1 %cmp36, i64 -9223372036854775808, i64 0
  store i64 %cond, i64* %lvalue, align 8
  br label %if.end42

if.else38:                                        ; preds = %land.lhs.true32, %sw.bb29
  %21 = load i64, i64* %lvalue, align 8
  %22 = load i64, i64* %value, align 8
  call void @imaxdiv(%struct.imaxdiv_t* sret %tmp, i64 %21, i64 %22)
  %23 = bitcast %struct.imaxdiv_t* %idiv to i8*
  %24 = bitcast %struct.imaxdiv_t* %tmp to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %23, i8* %24, i32 16, i32 8, i1 false)
  %25 = load i32, i32* %op, align 4
  %cmp39 = icmp eq i32 %25, 47
  br i1 %cmp39, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.else38
  %quot = getelementptr inbounds %struct.imaxdiv_t, %struct.imaxdiv_t* %idiv, i32 0, i32 0
  %26 = load i64, i64* %quot, align 8
  br label %cond.end

cond.false:                                       ; preds = %if.else38
  %rem = getelementptr inbounds %struct.imaxdiv_t, %struct.imaxdiv_t* %idiv, i32 0, i32 1
  %27 = load i64, i64* %rem, align 8
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond41 = phi i64 [ %26, %cond.true ], [ %27, %cond.false ]
  store i64 %cond41, i64* %lvalue, align 8
  br label %if.end42

if.end42:                                         ; preds = %cond.end, %if.then35
  br label %sw.epilog

sw.bb43:                                          ; preds = %if.end28
  %28 = load i64, i64* %value, align 8
  %29 = load i64, i64* %lvalue, align 8
  %add44 = add nsw i64 %29, %28
  store i64 %add44, i64* %lvalue, align 8
  br label %sw.epilog

sw.bb45:                                          ; preds = %if.end28
  %30 = load i64, i64* %value, align 8
  %31 = load i64, i64* %lvalue, align 8
  %sub = sub nsw i64 %31, %30
  store i64 %sub, i64* %lvalue, align 8
  br label %sw.epilog

sw.bb46:                                          ; preds = %if.end28
  %32 = load i64, i64* %value, align 8
  %33 = load i64, i64* %lvalue, align 8
  %shl = shl i64 %33, %32
  store i64 %shl, i64* %lvalue, align 8
  br label %sw.epilog

sw.bb47:                                          ; preds = %if.end28
  %34 = load i64, i64* %value, align 8
  %35 = load i64, i64* %lvalue, align 8
  %shr = ashr i64 %35, %34
  store i64 %shr, i64* %lvalue, align 8
  br label %sw.epilog

sw.bb48:                                          ; preds = %if.end28
  %36 = load i64, i64* %value, align 8
  %37 = load i64, i64* %lvalue, align 8
  %and = and i64 %37, %36
  store i64 %and, i64* %lvalue, align 8
  br label %sw.epilog

sw.bb49:                                          ; preds = %if.end28
  %38 = load i64, i64* %value, align 8
  %39 = load i64, i64* %lvalue, align 8
  %or = or i64 %39, %38
  store i64 %or, i64* %lvalue, align 8
  br label %sw.epilog

sw.bb50:                                          ; preds = %if.end28
  %40 = load i64, i64* %value, align 8
  %41 = load i64, i64* %lvalue, align 8
  %xor = xor i64 %41, %40
  store i64 %xor, i64* %lvalue, align 8
  br label %sw.epilog

sw.default:                                       ; preds = %if.end28
  %42 = load i8*, i8** %lhs, align 4
  call void @sh_xfree(i8* %42, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i32 541)
  %call51 = call i8* @libintl_gettext(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.11, i32 0, i32 0))
  call void @evalerror(i8* %call51)
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.default, %sw.bb50, %sw.bb49, %sw.bb48, %sw.bb47, %sw.bb46, %sw.bb45, %sw.bb43, %if.end42, %sw.bb
  %43 = load i64, i64* %lvalue, align 8
  store i64 %43, i64* %value, align 8
  br label %if.end52

if.end52:                                         ; preds = %sw.epilog, %if.end8
  %44 = load i64, i64* %value, align 8
  %call53 = call i8* @itos(i64 %44)
  store i8* %call53, i8** %rhs, align 4
  %45 = load i32, i32* @noeval, align 4
  %cmp54 = icmp eq i32 %45, 0
  br i1 %cmp54, label %if.then56, label %if.end62

if.then56:                                        ; preds = %if.end52
  %46 = load i64, i64* %lind, align 8
  %cmp57 = icmp ne i64 %46, -1
  br i1 %cmp57, label %if.then59, label %if.else60

if.then59:                                        ; preds = %if.then56
  %47 = load i8*, i8** %lhs, align 4
  %48 = load i64, i64* %lind, align 8
  %49 = load i8*, i8** %rhs, align 4
  call void @expr_bind_array_element(i8* %47, i64 %48, i8* %49)
  br label %if.end61

if.else60:                                        ; preds = %if.then56
  %50 = load i8*, i8** %lhs, align 4
  %51 = load i8*, i8** %rhs, align 4
  call void @expr_bind_variable(i8* %50, i8* %51)
  br label %if.end61

if.end61:                                         ; preds = %if.else60, %if.then59
  br label %if.end62

if.end62:                                         ; preds = %if.end61, %if.end52
  %52 = load i8*, i8** getelementptr inbounds (%struct.lvalue, %struct.lvalue* @curlval, i32 0, i32 0), align 8
  %tobool63 = icmp ne i8* %52, null
  br i1 %tobool63, label %land.lhs.true64, label %if.end68

land.lhs.true64:                                  ; preds = %if.end62
  %53 = load i8*, i8** getelementptr inbounds (%struct.lvalue, %struct.lvalue* @curlval, i32 0, i32 0), align 8
  %54 = load i8*, i8** @tokstr, align 4
  %cmp65 = icmp eq i8* %53, %54
  br i1 %cmp65, label %if.then67, label %if.end68

if.then67:                                        ; preds = %land.lhs.true64
  call void @init_lvalue(%struct.lvalue* @curlval)
  br label %if.end68

if.end68:                                         ; preds = %if.then67, %land.lhs.true64, %if.end62
  %55 = load i8*, i8** %rhs, align 4
  call void @sh_xfree(i8* %55, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i32 561)
  %56 = load i8*, i8** %lhs, align 4
  call void @sh_xfree(i8* %56, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i32 562)
  br label %do.body

do.body:                                          ; preds = %if.end68
  %57 = load i8*, i8** @tokstr, align 4
  %tobool69 = icmp ne i8* %57, null
  br i1 %tobool69, label %if.then70, label %if.end71

if.then70:                                        ; preds = %do.body
  %58 = load i8*, i8** @tokstr, align 4
  call void @sh_xfree(i8* %58, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i32 563)
  br label %if.end71

if.end71:                                         ; preds = %if.then70, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end71
  store i8* null, i8** @tokstr, align 4
  br label %if.end72

if.end72:                                         ; preds = %do.end, %lor.lhs.false
  %59 = load i64, i64* %value, align 8
  ret i64 %59
}

; Function Attrs: noinline nounwind
define internal i64 @expcond() #0 {
entry:
  %cval = alloca i64, align 8
  %val1 = alloca i64, align 8
  %val2 = alloca i64, align 8
  %rval = alloca i64, align 8
  %set_noeval = alloca i32, align 4
  store i32 0, i32* %set_noeval, align 4
  %call = call i64 @explor()
  store i64 %call, i64* %cval, align 8
  store i64 %call, i64* %rval, align 8
  %0 = load i32, i32* @curtok, align 4
  %cmp = icmp eq i32 %0, 63
  br i1 %cmp, label %if.then, label %if.end29

if.then:                                          ; preds = %entry
  %1 = load i64, i64* %cval, align 8
  %cmp1 = icmp eq i64 %1, 0
  br i1 %cmp1, label %if.then2, label %if.end

if.then2:                                         ; preds = %if.then
  store i32 1, i32* %set_noeval, align 4
  %2 = load i32, i32* @noeval, align 4
  %inc = add nsw i32 %2, 1
  store i32 %inc, i32* @noeval, align 4
  br label %if.end

if.end:                                           ; preds = %if.then2, %if.then
  call void @readtok()
  %3 = load i32, i32* @curtok, align 4
  %cmp3 = icmp eq i32 %3, 0
  br i1 %cmp3, label %if.then5, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end
  %4 = load i32, i32* @curtok, align 4
  %cmp4 = icmp eq i32 %4, 58
  br i1 %cmp4, label %if.then5, label %if.end7

if.then5:                                         ; preds = %lor.lhs.false, %if.end
  %call6 = call i8* @libintl_gettext(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.12, i32 0, i32 0))
  call void @evalerror(i8* %call6)
  br label %if.end7

if.end7:                                          ; preds = %if.then5, %lor.lhs.false
  %call8 = call i64 @expcomma()
  store i64 %call8, i64* %val1, align 8
  %5 = load i32, i32* %set_noeval, align 4
  %tobool = icmp ne i32 %5, 0
  br i1 %tobool, label %if.then9, label %if.end10

if.then9:                                         ; preds = %if.end7
  %6 = load i32, i32* @noeval, align 4
  %dec = add nsw i32 %6, -1
  store i32 %dec, i32* @noeval, align 4
  br label %if.end10

if.end10:                                         ; preds = %if.then9, %if.end7
  %7 = load i32, i32* @curtok, align 4
  %cmp11 = icmp ne i32 %7, 58
  br i1 %cmp11, label %if.then12, label %if.end14

if.then12:                                        ; preds = %if.end10
  %call13 = call i8* @libintl_gettext(i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.13, i32 0, i32 0))
  call void @evalerror(i8* %call13)
  br label %if.end14

if.end14:                                         ; preds = %if.then12, %if.end10
  store i32 0, i32* %set_noeval, align 4
  %8 = load i64, i64* %cval, align 8
  %tobool15 = icmp ne i64 %8, 0
  br i1 %tobool15, label %if.then16, label %if.end18

if.then16:                                        ; preds = %if.end14
  store i32 1, i32* %set_noeval, align 4
  %9 = load i32, i32* @noeval, align 4
  %inc17 = add nsw i32 %9, 1
  store i32 %inc17, i32* @noeval, align 4
  br label %if.end18

if.end18:                                         ; preds = %if.then16, %if.end14
  call void @readtok()
  %10 = load i32, i32* @curtok, align 4
  %cmp19 = icmp eq i32 %10, 0
  br i1 %cmp19, label %if.then20, label %if.end22

if.then20:                                        ; preds = %if.end18
  %call21 = call i8* @libintl_gettext(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.12, i32 0, i32 0))
  call void @evalerror(i8* %call21)
  br label %if.end22

if.end22:                                         ; preds = %if.then20, %if.end18
  %call23 = call i64 @expcond()
  store i64 %call23, i64* %val2, align 8
  %11 = load i32, i32* %set_noeval, align 4
  %tobool24 = icmp ne i32 %11, 0
  br i1 %tobool24, label %if.then25, label %if.end27

if.then25:                                        ; preds = %if.end22
  %12 = load i32, i32* @noeval, align 4
  %dec26 = add nsw i32 %12, -1
  store i32 %dec26, i32* @noeval, align 4
  br label %if.end27

if.end27:                                         ; preds = %if.then25, %if.end22
  %13 = load i64, i64* %cval, align 8
  %tobool28 = icmp ne i64 %13, 0
  br i1 %tobool28, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end27
  %14 = load i64, i64* %val1, align 8
  br label %cond.end

cond.false:                                       ; preds = %if.end27
  %15 = load i64, i64* %val2, align 8
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %14, %cond.true ], [ %15, %cond.false ]
  store i64 %cond, i64* %rval, align 8
  store i32 12, i32* @lasttok, align 4
  br label %if.end29

if.end29:                                         ; preds = %cond.end, %entry
  %16 = load i64, i64* %rval, align 8
  ret i64 %16
}

declare void @imaxdiv(%struct.imaxdiv_t* sret, i64, i64) #3

declare i8* @itos(i64) #3

; Function Attrs: noinline nounwind
define internal void @expr_bind_array_element(i8* %tok, i64 %ind, i8* %rhs) #0 {
entry:
  %tok.addr = alloca i8*, align 4
  %ind.addr = alloca i64, align 8
  %rhs.addr = alloca i8*, align 4
  %lhs = alloca i8*, align 4
  %vname = alloca i8*, align 4
  %llen = alloca i32, align 4
  %ibuf = alloca [22 x i8], align 1
  %istr = alloca i8*, align 4
  store i8* %tok, i8** %tok.addr, align 4
  store i64 %ind, i64* %ind.addr, align 8
  store i8* %rhs, i8** %rhs.addr, align 4
  %0 = load i64, i64* %ind.addr, align 8
  %arraydecay = getelementptr inbounds [22 x i8], [22 x i8]* %ibuf, i32 0, i32 0
  %call = call i8* @fmtumax(i64 %0, i32 10, i8* %arraydecay, i32 22, i32 0)
  store i8* %call, i8** %istr, align 4
  %1 = load i8*, i8** %tok.addr, align 4
  %call1 = call i8* @array_variable_name(i8* %1, i8** null, i32* null)
  store i8* %call1, i8** %vname, align 4
  %2 = load i8*, i8** %vname, align 4
  %call2 = call i32 @strlen(i8* %2)
  %add = add i32 %call2, 22
  %add3 = add i32 %add, 3
  store i32 %add3, i32* %llen, align 4
  %3 = load i32, i32* %llen, align 4
  %call4 = call i8* @sh_xmalloc(i32 %3, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i32 340)
  store i8* %call4, i8** %lhs, align 4
  %4 = load i8*, i8** %lhs, align 4
  %5 = load i8*, i8** %vname, align 4
  %6 = load i8*, i8** %istr, align 4
  %call5 = call i32 (i8*, i8*, ...) @sprintf(i8* %4, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.17, i32 0, i32 0), i8* %5, i8* %6)
  %7 = load i8*, i8** %lhs, align 4
  %8 = load i8*, i8** %rhs.addr, align 4
  call void @expr_bind_variable(i8* %7, i8* %8)
  %9 = load i8*, i8** %vname, align 4
  call void @sh_xfree(i8* %9, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i32 346)
  %10 = load i8*, i8** %lhs, align 4
  call void @sh_xfree(i8* %10, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i32 347)
  ret void
}

; Function Attrs: noinline nounwind
define internal void @expr_bind_variable(i8* %lhs, i8* %rhs) #0 {
entry:
  %lhs.addr = alloca i8*, align 4
  %rhs.addr = alloca i8*, align 4
  %v = alloca %struct.variable*, align 4
  store i8* %lhs, i8** %lhs.addr, align 4
  store i8* %rhs, i8** %rhs.addr, align 4
  %0 = load i8*, i8** %lhs.addr, align 4
  %1 = load i8*, i8** %rhs.addr, align 4
  %call = call %struct.variable* @bind_int_variable(i8* %0, i8* %1)
  store %struct.variable* %call, %struct.variable** %v, align 4
  %2 = load %struct.variable*, %struct.variable** %v, align 4
  %tobool = icmp ne %struct.variable* %2, null
  br i1 %tobool, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %3 = load %struct.variable*, %struct.variable** %v, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %3, i32 0, i32 5
  %4 = load i32, i32* %attributes, align 4
  %and = and i32 %4, 2
  %tobool1 = icmp ne i32 %and, 0
  br i1 %tobool1, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true
  %5 = load %struct.variable*, %struct.variable** %v, align 4
  %attributes2 = getelementptr inbounds %struct.variable, %struct.variable* %5, i32 0, i32 5
  %6 = load i32, i32* %attributes2, align 4
  %and3 = and i32 %6, 16384
  %tobool4 = icmp ne i32 %and3, 0
  br i1 %tobool4, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %land.lhs.true
  call void @longjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* @evalbuf, i32 0, i32 0), i32 1) #8
  unreachable

if.end:                                           ; preds = %lor.lhs.false, %entry
  %7 = load i8*, i8** %lhs.addr, align 4
  call void @stupidly_hack_special_variables(i8* %7)
  ret void
}

; Function Attrs: noinline nounwind
define internal i64 @explor() #0 {
entry:
  %val1 = alloca i64, align 8
  %val2 = alloca i64, align 8
  %set_noeval = alloca i32, align 4
  %call = call i64 @expland()
  store i64 %call, i64* %val1, align 8
  br label %while.cond

while.cond:                                       ; preds = %lor.end, %entry
  %0 = load i32, i32* @curtok, align 4
  %cmp = icmp eq i32 %0, 8
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  store i32 0, i32* %set_noeval, align 4
  %1 = load i64, i64* %val1, align 8
  %cmp1 = icmp ne i64 %1, 0
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %while.body
  %2 = load i32, i32* @noeval, align 4
  %inc = add nsw i32 %2, 1
  store i32 %inc, i32* @noeval, align 4
  store i32 1, i32* %set_noeval, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %while.body
  call void @readtok()
  %call2 = call i64 @expland()
  store i64 %call2, i64* %val2, align 8
  %3 = load i32, i32* %set_noeval, align 4
  %tobool = icmp ne i32 %3, 0
  br i1 %tobool, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  %4 = load i32, i32* @noeval, align 4
  %dec = add nsw i32 %4, -1
  store i32 %dec, i32* @noeval, align 4
  br label %if.end4

if.end4:                                          ; preds = %if.then3, %if.end
  %5 = load i64, i64* %val1, align 8
  %tobool5 = icmp ne i64 %5, 0
  br i1 %tobool5, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %if.end4
  %6 = load i64, i64* %val2, align 8
  %tobool6 = icmp ne i64 %6, 0
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %if.end4
  %7 = phi i1 [ true, %if.end4 ], [ %tobool6, %lor.rhs ]
  %lor.ext = zext i1 %7 to i32
  %conv = sext i32 %lor.ext to i64
  store i64 %conv, i64* %val1, align 8
  store i32 8, i32* @lasttok, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %8 = load i64, i64* %val1, align 8
  ret i64 %8
}

; Function Attrs: noinline nounwind
define internal i64 @expland() #0 {
entry:
  %val1 = alloca i64, align 8
  %val2 = alloca i64, align 8
  %set_noeval = alloca i32, align 4
  %call = call i64 @expbor()
  store i64 %call, i64* %val1, align 8
  br label %while.cond

while.cond:                                       ; preds = %land.end, %entry
  %0 = load i32, i32* @curtok, align 4
  %cmp = icmp eq i32 %0, 7
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  store i32 0, i32* %set_noeval, align 4
  %1 = load i64, i64* %val1, align 8
  %cmp1 = icmp eq i64 %1, 0
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %while.body
  store i32 1, i32* %set_noeval, align 4
  %2 = load i32, i32* @noeval, align 4
  %inc = add nsw i32 %2, 1
  store i32 %inc, i32* @noeval, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %while.body
  call void @readtok()
  %call2 = call i64 @expbor()
  store i64 %call2, i64* %val2, align 8
  %3 = load i32, i32* %set_noeval, align 4
  %tobool = icmp ne i32 %3, 0
  br i1 %tobool, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  %4 = load i32, i32* @noeval, align 4
  %dec = add nsw i32 %4, -1
  store i32 %dec, i32* @noeval, align 4
  br label %if.end4

if.end4:                                          ; preds = %if.then3, %if.end
  %5 = load i64, i64* %val1, align 8
  %tobool5 = icmp ne i64 %5, 0
  br i1 %tobool5, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %if.end4
  %6 = load i64, i64* %val2, align 8
  %tobool6 = icmp ne i64 %6, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %if.end4
  %7 = phi i1 [ false, %if.end4 ], [ %tobool6, %land.rhs ]
  %land.ext = zext i1 %7 to i32
  %conv = sext i32 %land.ext to i64
  store i64 %conv, i64* %val1, align 8
  store i32 7, i32* @lasttok, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %8 = load i64, i64* %val1, align 8
  ret i64 %8
}

; Function Attrs: noinline nounwind
define internal i64 @expbor() #0 {
entry:
  %val1 = alloca i64, align 8
  %val2 = alloca i64, align 8
  %call = call i64 @expbxor()
  store i64 %call, i64* %val1, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %0 = load i32, i32* @curtok, align 4
  %cmp = icmp eq i32 %0, 124
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  call void @readtok()
  %call1 = call i64 @expbxor()
  store i64 %call1, i64* %val2, align 8
  %1 = load i64, i64* %val1, align 8
  %2 = load i64, i64* %val2, align 8
  %or = or i64 %1, %2
  store i64 %or, i64* %val1, align 8
  store i32 6, i32* @lasttok, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %3 = load i64, i64* %val1, align 8
  ret i64 %3
}

; Function Attrs: noinline nounwind
define internal i64 @expbxor() #0 {
entry:
  %val1 = alloca i64, align 8
  %val2 = alloca i64, align 8
  %call = call i64 @expband()
  store i64 %call, i64* %val1, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %0 = load i32, i32* @curtok, align 4
  %cmp = icmp eq i32 %0, 94
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  call void @readtok()
  %call1 = call i64 @expband()
  store i64 %call1, i64* %val2, align 8
  %1 = load i64, i64* %val1, align 8
  %2 = load i64, i64* %val2, align 8
  %xor = xor i64 %1, %2
  store i64 %xor, i64* %val1, align 8
  store i32 6, i32* @lasttok, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %3 = load i64, i64* %val1, align 8
  ret i64 %3
}

; Function Attrs: noinline nounwind
define internal i64 @expband() #0 {
entry:
  %val1 = alloca i64, align 8
  %val2 = alloca i64, align 8
  %call = call i64 @exp5()
  store i64 %call, i64* %val1, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %0 = load i32, i32* @curtok, align 4
  %cmp = icmp eq i32 %0, 38
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  call void @readtok()
  %call1 = call i64 @exp5()
  store i64 %call1, i64* %val2, align 8
  %1 = load i64, i64* %val1, align 8
  %2 = load i64, i64* %val2, align 8
  %and = and i64 %1, %2
  store i64 %and, i64* %val1, align 8
  store i32 6, i32* @lasttok, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %3 = load i64, i64* %val1, align 8
  ret i64 %3
}

; Function Attrs: noinline nounwind
define internal i64 @exp5() #0 {
entry:
  %val1 = alloca i64, align 8
  %val2 = alloca i64, align 8
  %op = alloca i32, align 4
  %call = call i64 @exp4()
  store i64 %call, i64* %val1, align 8
  br label %while.cond

while.cond:                                       ; preds = %if.end12, %entry
  %0 = load i32, i32* @curtok, align 4
  %cmp = icmp eq i32 %0, 1
  br i1 %cmp, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %while.cond
  %1 = load i32, i32* @curtok, align 4
  %cmp1 = icmp eq i32 %1, 2
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %while.cond
  %2 = phi i1 [ true, %while.cond ], [ %cmp1, %lor.rhs ]
  br i1 %2, label %while.body, label %while.end

while.body:                                       ; preds = %lor.end
  %3 = load i32, i32* @curtok, align 4
  store i32 %3, i32* %op, align 4
  call void @readtok()
  %call2 = call i64 @exp4()
  store i64 %call2, i64* %val2, align 8
  %4 = load i32, i32* %op, align 4
  %cmp3 = icmp eq i32 %4, 1
  br i1 %cmp3, label %if.then, label %if.else

if.then:                                          ; preds = %while.body
  %5 = load i64, i64* %val1, align 8
  %6 = load i64, i64* %val2, align 8
  %cmp4 = icmp eq i64 %5, %6
  %conv = zext i1 %cmp4 to i32
  %conv5 = sext i32 %conv to i64
  store i64 %conv5, i64* %val1, align 8
  br label %if.end12

if.else:                                          ; preds = %while.body
  %7 = load i32, i32* %op, align 4
  %cmp6 = icmp eq i32 %7, 2
  br i1 %cmp6, label %if.then8, label %if.end

if.then8:                                         ; preds = %if.else
  %8 = load i64, i64* %val1, align 8
  %9 = load i64, i64* %val2, align 8
  %cmp9 = icmp ne i64 %8, %9
  %conv10 = zext i1 %cmp9 to i32
  %conv11 = sext i32 %conv10 to i64
  store i64 %conv11, i64* %val1, align 8
  br label %if.end

if.end:                                           ; preds = %if.then8, %if.else
  br label %if.end12

if.end12:                                         ; preds = %if.end, %if.then
  store i32 6, i32* @lasttok, align 4
  br label %while.cond

while.end:                                        ; preds = %lor.end
  %10 = load i64, i64* %val1, align 8
  ret i64 %10
}

; Function Attrs: noinline nounwind
define internal i64 @exp4() #0 {
entry:
  %val1 = alloca i64, align 8
  %val2 = alloca i64, align 8
  %op = alloca i32, align 4
  %call = call i64 @expshift()
  store i64 %call, i64* %val1, align 8
  br label %while.cond

while.cond:                                       ; preds = %if.end27, %entry
  %0 = load i32, i32* @curtok, align 4
  %cmp = icmp eq i32 %0, 3
  br i1 %cmp, label %lor.end, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %while.cond
  %1 = load i32, i32* @curtok, align 4
  %cmp1 = icmp eq i32 %1, 4
  br i1 %cmp1, label %lor.end, label %lor.lhs.false2

lor.lhs.false2:                                   ; preds = %lor.lhs.false
  %2 = load i32, i32* @curtok, align 4
  %cmp3 = icmp eq i32 %2, 60
  br i1 %cmp3, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %lor.lhs.false2
  %3 = load i32, i32* @curtok, align 4
  %cmp4 = icmp eq i32 %3, 62
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %lor.lhs.false2, %lor.lhs.false, %while.cond
  %4 = phi i1 [ true, %lor.lhs.false2 ], [ true, %lor.lhs.false ], [ true, %while.cond ], [ %cmp4, %lor.rhs ]
  br i1 %4, label %while.body, label %while.end

while.body:                                       ; preds = %lor.end
  %5 = load i32, i32* @curtok, align 4
  store i32 %5, i32* %op, align 4
  call void @readtok()
  %call5 = call i64 @expshift()
  store i64 %call5, i64* %val2, align 8
  %6 = load i32, i32* %op, align 4
  %cmp6 = icmp eq i32 %6, 3
  br i1 %cmp6, label %if.then, label %if.else

if.then:                                          ; preds = %while.body
  %7 = load i64, i64* %val1, align 8
  %8 = load i64, i64* %val2, align 8
  %cmp7 = icmp sle i64 %7, %8
  %conv = zext i1 %cmp7 to i32
  %conv8 = sext i32 %conv to i64
  store i64 %conv8, i64* %val1, align 8
  br label %if.end27

if.else:                                          ; preds = %while.body
  %9 = load i32, i32* %op, align 4
  %cmp9 = icmp eq i32 %9, 4
  br i1 %cmp9, label %if.then11, label %if.else15

if.then11:                                        ; preds = %if.else
  %10 = load i64, i64* %val1, align 8
  %11 = load i64, i64* %val2, align 8
  %cmp12 = icmp sge i64 %10, %11
  %conv13 = zext i1 %cmp12 to i32
  %conv14 = sext i32 %conv13 to i64
  store i64 %conv14, i64* %val1, align 8
  br label %if.end26

if.else15:                                        ; preds = %if.else
  %12 = load i32, i32* %op, align 4
  %cmp16 = icmp eq i32 %12, 60
  br i1 %cmp16, label %if.then18, label %if.else22

if.then18:                                        ; preds = %if.else15
  %13 = load i64, i64* %val1, align 8
  %14 = load i64, i64* %val2, align 8
  %cmp19 = icmp slt i64 %13, %14
  %conv20 = zext i1 %cmp19 to i32
  %conv21 = sext i32 %conv20 to i64
  store i64 %conv21, i64* %val1, align 8
  br label %if.end

if.else22:                                        ; preds = %if.else15
  %15 = load i64, i64* %val1, align 8
  %16 = load i64, i64* %val2, align 8
  %cmp23 = icmp sgt i64 %15, %16
  %conv24 = zext i1 %cmp23 to i32
  %conv25 = sext i32 %conv24 to i64
  store i64 %conv25, i64* %val1, align 8
  br label %if.end

if.end:                                           ; preds = %if.else22, %if.then18
  br label %if.end26

if.end26:                                         ; preds = %if.end, %if.then11
  br label %if.end27

if.end27:                                         ; preds = %if.end26, %if.then
  store i32 6, i32* @lasttok, align 4
  br label %while.cond

while.end:                                        ; preds = %lor.end
  %17 = load i64, i64* %val1, align 8
  ret i64 %17
}

; Function Attrs: noinline nounwind
define internal i64 @expshift() #0 {
entry:
  %val1 = alloca i64, align 8
  %val2 = alloca i64, align 8
  %op = alloca i32, align 4
  %call = call i64 @exp3()
  store i64 %call, i64* %val1, align 8
  br label %while.cond

while.cond:                                       ; preds = %if.end, %entry
  %0 = load i32, i32* @curtok, align 4
  %cmp = icmp eq i32 %0, 9
  br i1 %cmp, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %while.cond
  %1 = load i32, i32* @curtok, align 4
  %cmp1 = icmp eq i32 %1, 10
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %while.cond
  %2 = phi i1 [ true, %while.cond ], [ %cmp1, %lor.rhs ]
  br i1 %2, label %while.body, label %while.end

while.body:                                       ; preds = %lor.end
  %3 = load i32, i32* @curtok, align 4
  store i32 %3, i32* %op, align 4
  call void @readtok()
  %call2 = call i64 @exp3()
  store i64 %call2, i64* %val2, align 8
  %4 = load i32, i32* %op, align 4
  %cmp3 = icmp eq i32 %4, 9
  br i1 %cmp3, label %if.then, label %if.else

if.then:                                          ; preds = %while.body
  %5 = load i64, i64* %val1, align 8
  %6 = load i64, i64* %val2, align 8
  %shl = shl i64 %5, %6
  store i64 %shl, i64* %val1, align 8
  br label %if.end

if.else:                                          ; preds = %while.body
  %7 = load i64, i64* %val1, align 8
  %8 = load i64, i64* %val2, align 8
  %shr = ashr i64 %7, %8
  store i64 %shr, i64* %val1, align 8
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  store i32 6, i32* @lasttok, align 4
  br label %while.cond

while.end:                                        ; preds = %lor.end
  %9 = load i64, i64* %val1, align 8
  ret i64 %9
}

; Function Attrs: noinline nounwind
define internal i64 @exp3() #0 {
entry:
  %val1 = alloca i64, align 8
  %val2 = alloca i64, align 8
  %op = alloca i32, align 4
  %call = call i64 @exp2()
  store i64 %call, i64* %val1, align 8
  br label %while.cond

while.cond:                                       ; preds = %if.end6, %entry
  %0 = load i32, i32* @curtok, align 4
  %cmp = icmp eq i32 %0, 43
  br i1 %cmp, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %while.cond
  %1 = load i32, i32* @curtok, align 4
  %cmp1 = icmp eq i32 %1, 45
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %while.cond
  %2 = phi i1 [ true, %while.cond ], [ %cmp1, %lor.rhs ]
  br i1 %2, label %while.body, label %while.end

while.body:                                       ; preds = %lor.end
  %3 = load i32, i32* @curtok, align 4
  store i32 %3, i32* %op, align 4
  call void @readtok()
  %call2 = call i64 @exp2()
  store i64 %call2, i64* %val2, align 8
  %4 = load i32, i32* %op, align 4
  %cmp3 = icmp eq i32 %4, 43
  br i1 %cmp3, label %if.then, label %if.else

if.then:                                          ; preds = %while.body
  %5 = load i64, i64* %val2, align 8
  %6 = load i64, i64* %val1, align 8
  %add = add nsw i64 %6, %5
  store i64 %add, i64* %val1, align 8
  br label %if.end6

if.else:                                          ; preds = %while.body
  %7 = load i32, i32* %op, align 4
  %cmp4 = icmp eq i32 %7, 45
  br i1 %cmp4, label %if.then5, label %if.end

if.then5:                                         ; preds = %if.else
  %8 = load i64, i64* %val2, align 8
  %9 = load i64, i64* %val1, align 8
  %sub = sub nsw i64 %9, %8
  store i64 %sub, i64* %val1, align 8
  br label %if.end

if.end:                                           ; preds = %if.then5, %if.else
  br label %if.end6

if.end6:                                          ; preds = %if.end, %if.then
  store i32 6, i32* @lasttok, align 4
  br label %while.cond

while.end:                                        ; preds = %lor.end
  %10 = load i64, i64* %val1, align 8
  ret i64 %10
}

; Function Attrs: noinline nounwind
define internal i64 @exp2() #0 {
entry:
  %val1 = alloca i64, align 8
  %val2 = alloca i64, align 8
  %idiv = alloca %struct.imaxdiv_t, align 8
  %op = alloca i32, align 4
  %stp = alloca i8*, align 4
  %sltp = alloca i8*, align 4
  %tmp = alloca %struct.imaxdiv_t, align 8
  %call = call i64 @exppower()
  store i64 %call, i64* %val1, align 8
  br label %while.cond

while.cond:                                       ; preds = %if.end59, %if.then32, %entry
  %0 = load i32, i32* @curtok, align 4
  %cmp = icmp eq i32 %0, 42
  br i1 %cmp, label %lor.end, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %while.cond
  %1 = load i32, i32* @curtok, align 4
  %cmp1 = icmp eq i32 %1, 47
  br i1 %cmp1, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %lor.lhs.false
  %2 = load i32, i32* @curtok, align 4
  %cmp2 = icmp eq i32 %2, 37
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %lor.lhs.false, %while.cond
  %3 = phi i1 [ true, %lor.lhs.false ], [ true, %while.cond ], [ %cmp2, %lor.rhs ]
  br i1 %3, label %while.body, label %while.end60

while.body:                                       ; preds = %lor.end
  %4 = load i32, i32* @curtok, align 4
  store i32 %4, i32* %op, align 4
  %5 = load i8*, i8** @tp, align 4
  store i8* %5, i8** %stp, align 4
  call void @readtok()
  %call3 = call i64 @exppower()
  store i64 %call3, i64* %val2, align 8
  %6 = load i32, i32* %op, align 4
  %cmp4 = icmp eq i32 %6, 47
  br i1 %cmp4, label %land.lhs.true, label %lor.lhs.false5

lor.lhs.false5:                                   ; preds = %while.body
  %7 = load i32, i32* %op, align 4
  %cmp6 = icmp eq i32 %7, 37
  br i1 %cmp6, label %land.lhs.true, label %if.else23

land.lhs.true:                                    ; preds = %lor.lhs.false5, %while.body
  %8 = load i64, i64* %val2, align 8
  %cmp7 = icmp eq i64 %8, 0
  br i1 %cmp7, label %if.then, label %if.else23

if.then:                                          ; preds = %land.lhs.true
  %9 = load i32, i32* @noeval, align 4
  %cmp8 = icmp eq i32 %9, 0
  br i1 %cmp8, label %if.then9, label %if.else

if.then9:                                         ; preds = %if.then
  %10 = load i8*, i8** @lasttp, align 4
  store i8* %10, i8** %sltp, align 4
  %11 = load i8*, i8** %stp, align 4
  store i8* %11, i8** @lasttp, align 4
  br label %while.cond10

while.cond10:                                     ; preds = %while.body21, %if.then9
  %12 = load i8*, i8** @lasttp, align 4
  %tobool = icmp ne i8* %12, null
  br i1 %tobool, label %land.lhs.true11, label %land.end

land.lhs.true11:                                  ; preds = %while.cond10
  %13 = load i8*, i8** @lasttp, align 4
  %14 = load i8, i8* %13, align 1
  %conv = sext i8 %14 to i32
  %tobool12 = icmp ne i32 %conv, 0
  br i1 %tobool12, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %land.lhs.true11
  %15 = load i8*, i8** @lasttp, align 4
  %16 = load i8, i8* %15, align 1
  %conv13 = sext i8 %16 to i32
  %cmp14 = icmp eq i32 %conv13, 32
  br i1 %cmp14, label %lor.end20, label %lor.rhs16

lor.rhs16:                                        ; preds = %land.rhs
  %17 = load i8*, i8** @lasttp, align 4
  %18 = load i8, i8* %17, align 1
  %conv17 = sext i8 %18 to i32
  %cmp18 = icmp eq i32 %conv17, 9
  br label %lor.end20

lor.end20:                                        ; preds = %lor.rhs16, %land.rhs
  %19 = phi i1 [ true, %land.rhs ], [ %cmp18, %lor.rhs16 ]
  br label %land.end

land.end:                                         ; preds = %lor.end20, %land.lhs.true11, %while.cond10
  %20 = phi i1 [ false, %land.lhs.true11 ], [ false, %while.cond10 ], [ %19, %lor.end20 ]
  br i1 %20, label %while.body21, label %while.end

while.body21:                                     ; preds = %land.end
  %21 = load i8*, i8** @lasttp, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %21, i32 1
  store i8* %incdec.ptr, i8** @lasttp, align 4
  br label %while.cond10

while.end:                                        ; preds = %land.end
  %call22 = call i8* @libintl_gettext(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.10, i32 0, i32 0))
  call void @evalerror(i8* %call22)
  %22 = load i8*, i8** %sltp, align 4
  store i8* %22, i8** @lasttp, align 4
  br label %if.end

if.else:                                          ; preds = %if.then
  store i64 1, i64* %val2, align 8
  br label %if.end

if.end:                                           ; preds = %if.else, %while.end
  br label %if.end45

if.else23:                                        ; preds = %land.lhs.true, %lor.lhs.false5
  %23 = load i32, i32* %op, align 4
  %cmp24 = icmp eq i32 %23, 37
  br i1 %cmp24, label %land.lhs.true26, label %if.else33

land.lhs.true26:                                  ; preds = %if.else23
  %24 = load i64, i64* %val1, align 8
  %cmp27 = icmp eq i64 %24, -9223372036854775808
  br i1 %cmp27, label %land.lhs.true29, label %if.else33

land.lhs.true29:                                  ; preds = %land.lhs.true26
  %25 = load i64, i64* %val2, align 8
  %cmp30 = icmp eq i64 %25, -1
  br i1 %cmp30, label %if.then32, label %if.else33

if.then32:                                        ; preds = %land.lhs.true29
  store i64 0, i64* %val1, align 8
  br label %while.cond

if.else33:                                        ; preds = %land.lhs.true29, %land.lhs.true26, %if.else23
  %26 = load i32, i32* %op, align 4
  %cmp34 = icmp eq i32 %26, 47
  br i1 %cmp34, label %land.lhs.true36, label %if.end43

land.lhs.true36:                                  ; preds = %if.else33
  %27 = load i64, i64* %val1, align 8
  %cmp37 = icmp eq i64 %27, -9223372036854775808
  br i1 %cmp37, label %land.lhs.true39, label %if.end43

land.lhs.true39:                                  ; preds = %land.lhs.true36
  %28 = load i64, i64* %val2, align 8
  %cmp40 = icmp eq i64 %28, -1
  br i1 %cmp40, label %if.then42, label %if.end43

if.then42:                                        ; preds = %land.lhs.true39
  store i64 1, i64* %val2, align 8
  br label %if.end43

if.end43:                                         ; preds = %if.then42, %land.lhs.true39, %land.lhs.true36, %if.else33
  br label %if.end44

if.end44:                                         ; preds = %if.end43
  br label %if.end45

if.end45:                                         ; preds = %if.end44, %if.end
  %29 = load i32, i32* %op, align 4
  %cmp46 = icmp eq i32 %29, 42
  br i1 %cmp46, label %if.then48, label %if.else49

if.then48:                                        ; preds = %if.end45
  %30 = load i64, i64* %val2, align 8
  %31 = load i64, i64* %val1, align 8
  %mul = mul nsw i64 %31, %30
  store i64 %mul, i64* %val1, align 8
  br label %if.end59

if.else49:                                        ; preds = %if.end45
  %32 = load i32, i32* %op, align 4
  %cmp50 = icmp eq i32 %32, 47
  br i1 %cmp50, label %if.then55, label %lor.lhs.false52

lor.lhs.false52:                                  ; preds = %if.else49
  %33 = load i32, i32* %op, align 4
  %cmp53 = icmp eq i32 %33, 37
  br i1 %cmp53, label %if.then55, label %if.end58

if.then55:                                        ; preds = %lor.lhs.false52, %if.else49
  %34 = load i64, i64* %val1, align 8
  %35 = load i64, i64* %val2, align 8
  call void @imaxdiv(%struct.imaxdiv_t* sret %tmp, i64 %34, i64 %35)
  %36 = bitcast %struct.imaxdiv_t* %idiv to i8*
  %37 = bitcast %struct.imaxdiv_t* %tmp to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %36, i8* %37, i32 16, i32 8, i1 false)
  %38 = load i32, i32* %op, align 4
  %cmp56 = icmp eq i32 %38, 47
  br i1 %cmp56, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then55
  %quot = getelementptr inbounds %struct.imaxdiv_t, %struct.imaxdiv_t* %idiv, i32 0, i32 0
  %39 = load i64, i64* %quot, align 8
  br label %cond.end

cond.false:                                       ; preds = %if.then55
  %rem = getelementptr inbounds %struct.imaxdiv_t, %struct.imaxdiv_t* %idiv, i32 0, i32 1
  %40 = load i64, i64* %rem, align 8
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %39, %cond.true ], [ %40, %cond.false ]
  store i64 %cond, i64* %val1, align 8
  br label %if.end58

if.end58:                                         ; preds = %cond.end, %lor.lhs.false52
  br label %if.end59

if.end59:                                         ; preds = %if.end58, %if.then48
  store i32 6, i32* @lasttok, align 4
  br label %while.cond

while.end60:                                      ; preds = %lor.end
  %41 = load i64, i64* %val1, align 8
  ret i64 %41
}

; Function Attrs: noinline nounwind
define internal i64 @exppower() #0 {
entry:
  %retval = alloca i64, align 8
  %val1 = alloca i64, align 8
  %val2 = alloca i64, align 8
  %c = alloca i64, align 8
  %call = call i64 @exp1()
  store i64 %call, i64* %val1, align 8
  br label %while.cond

while.cond:                                       ; preds = %if.end6, %entry
  %0 = load i32, i32* @curtok, align 4
  %cmp = icmp eq i32 %0, 13
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  call void @readtok()
  %call1 = call i64 @exppower()
  store i64 %call1, i64* %val2, align 8
  store i32 6, i32* @lasttok, align 4
  %1 = load i64, i64* %val2, align 8
  %cmp2 = icmp eq i64 %1, 0
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %while.body
  store i64 1, i64* %retval, align 8
  br label %return

if.end:                                           ; preds = %while.body
  %2 = load i64, i64* %val2, align 8
  %cmp3 = icmp slt i64 %2, 0
  br i1 %cmp3, label %if.then4, label %if.end6

if.then4:                                         ; preds = %if.end
  %call5 = call i8* @libintl_gettext(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.14, i32 0, i32 0))
  call void @evalerror(i8* %call5)
  br label %if.end6

if.end6:                                          ; preds = %if.then4, %if.end
  %3 = load i64, i64* %val1, align 8
  %4 = load i64, i64* %val2, align 8
  %call7 = call i64 @ipow(i64 %3, i64 %4)
  store i64 %call7, i64* %val1, align 8
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %5 = load i64, i64* %val1, align 8
  store i64 %5, i64* %retval, align 8
  br label %return

return:                                           ; preds = %while.end, %if.then
  %6 = load i64, i64* %retval, align 8
  ret i64 %6
}

; Function Attrs: noinline nounwind
define internal i64 @exp1() #0 {
entry:
  %val = alloca i64, align 8
  %0 = load i32, i32* @curtok, align 4
  %cmp = icmp eq i32 %0, 33
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  call void @readtok()
  %call = call i64 @exp1()
  %tobool = icmp ne i64 %call, 0
  %lnot = xor i1 %tobool, true
  %lnot.ext = zext i1 %lnot to i32
  %conv = sext i32 %lnot.ext to i64
  store i64 %conv, i64* %val, align 8
  store i32 6, i32* @lasttok, align 4
  br label %if.end19

if.else:                                          ; preds = %entry
  %1 = load i32, i32* @curtok, align 4
  %cmp1 = icmp eq i32 %1, 126
  br i1 %cmp1, label %if.then3, label %if.else5

if.then3:                                         ; preds = %if.else
  call void @readtok()
  %call4 = call i64 @exp1()
  %neg = xor i64 %call4, -1
  store i64 %neg, i64* %val, align 8
  store i32 6, i32* @lasttok, align 4
  br label %if.end18

if.else5:                                         ; preds = %if.else
  %2 = load i32, i32* @curtok, align 4
  %cmp6 = icmp eq i32 %2, 45
  br i1 %cmp6, label %if.then8, label %if.else10

if.then8:                                         ; preds = %if.else5
  call void @readtok()
  %call9 = call i64 @exp1()
  %sub = sub nsw i64 0, %call9
  store i64 %sub, i64* %val, align 8
  store i32 6, i32* @lasttok, align 4
  br label %if.end17

if.else10:                                        ; preds = %if.else5
  %3 = load i32, i32* @curtok, align 4
  %cmp11 = icmp eq i32 %3, 43
  br i1 %cmp11, label %if.then13, label %if.else15

if.then13:                                        ; preds = %if.else10
  call void @readtok()
  %call14 = call i64 @exp1()
  store i64 %call14, i64* %val, align 8
  store i32 6, i32* @lasttok, align 4
  br label %if.end

if.else15:                                        ; preds = %if.else10
  %call16 = call i64 @exp0()
  store i64 %call16, i64* %val, align 8
  br label %if.end

if.end:                                           ; preds = %if.else15, %if.then13
  br label %if.end17

if.end17:                                         ; preds = %if.end, %if.then8
  br label %if.end18

if.end18:                                         ; preds = %if.end17, %if.then3
  br label %if.end19

if.end19:                                         ; preds = %if.end18, %if.then
  %4 = load i64, i64* %val, align 8
  ret i64 %4
}

; Function Attrs: noinline nounwind
define internal i64 @ipow(i64 %base, i64 %exp) #0 {
entry:
  %base.addr = alloca i64, align 8
  %exp.addr = alloca i64, align 8
  %result = alloca i64, align 8
  store i64 %base, i64* %base.addr, align 8
  store i64 %exp, i64* %exp.addr, align 8
  store i64 1, i64* %result, align 8
  br label %while.cond

while.cond:                                       ; preds = %if.end, %entry
  %0 = load i64, i64* %exp.addr, align 8
  %tobool = icmp ne i64 %0, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %1 = load i64, i64* %exp.addr, align 8
  %and = and i64 %1, 1
  %tobool1 = icmp ne i64 %and, 0
  br i1 %tobool1, label %if.then, label %if.end

if.then:                                          ; preds = %while.body
  %2 = load i64, i64* %base.addr, align 8
  %3 = load i64, i64* %result, align 8
  %mul = mul nsw i64 %3, %2
  store i64 %mul, i64* %result, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %while.body
  %4 = load i64, i64* %exp.addr, align 8
  %shr = ashr i64 %4, 1
  store i64 %shr, i64* %exp.addr, align 8
  %5 = load i64, i64* %base.addr, align 8
  %6 = load i64, i64* %base.addr, align 8
  %mul2 = mul nsw i64 %6, %5
  store i64 %mul2, i64* %base.addr, align 8
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %7 = load i64, i64* %result, align 8
  ret i64 %7
}

; Function Attrs: noinline nounwind
define internal i64 @exp0() #0 {
entry:
  %val = alloca i64, align 8
  %v2 = alloca i64, align 8
  %vincdec = alloca i8*, align 4
  %stok = alloca i32, align 4
  %ec = alloca %struct.EXPR_CONTEXT, align 8
  store i64 0, i64* %val, align 8
  %0 = load i32, i32* @curtok, align 4
  %cmp = icmp eq i32 %0, 14
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i32, i32* @curtok, align 4
  %cmp1 = icmp eq i32 %1, 15
  br i1 %cmp1, label %if.then, label %if.else14

if.then:                                          ; preds = %lor.lhs.false, %entry
  %2 = load i32, i32* @curtok, align 4
  store i32 %2, i32* @lasttok, align 4
  store i32 %2, i32* %stok, align 4
  call void @readtok()
  %3 = load i32, i32* @curtok, align 4
  %cmp2 = icmp ne i32 %3, 5
  br i1 %cmp2, label %if.then3, label %if.end

if.then3:                                         ; preds = %if.then
  %call = call i8* @libintl_gettext(i8* getelementptr inbounds ([57 x i8], [57 x i8]* @.str.15, i32 0, i32 0))
  call void @evalerror(i8* %call)
  br label %if.end

if.end:                                           ; preds = %if.then3, %if.then
  %4 = load i64, i64* @tokval, align 8
  %5 = load i32, i32* %stok, align 4
  %cmp4 = icmp eq i32 %5, 14
  %cond = select i1 %cmp4, i32 1, i32 -1
  %conv = sext i32 %cond to i64
  %add = add nsw i64 %4, %conv
  store i64 %add, i64* %v2, align 8
  %6 = load i64, i64* %v2, align 8
  %call5 = call i8* @itos(i64 %6)
  store i8* %call5, i8** %vincdec, align 4
  %7 = load i32, i32* @noeval, align 4
  %cmp6 = icmp eq i32 %7, 0
  br i1 %cmp6, label %if.then8, label %if.end13

if.then8:                                         ; preds = %if.end
  %8 = load i64, i64* getelementptr inbounds (%struct.lvalue, %struct.lvalue* @curlval, i32 0, i32 3), align 8
  %cmp9 = icmp ne i64 %8, -1
  br i1 %cmp9, label %if.then11, label %if.else

if.then11:                                        ; preds = %if.then8
  %9 = load i8*, i8** getelementptr inbounds (%struct.lvalue, %struct.lvalue* @curlval, i32 0, i32 0), align 8
  %10 = load i64, i64* getelementptr inbounds (%struct.lvalue, %struct.lvalue* @curlval, i32 0, i32 3), align 8
  %11 = load i8*, i8** %vincdec, align 4
  call void @expr_bind_array_element(i8* %9, i64 %10, i8* %11)
  br label %if.end12

if.else:                                          ; preds = %if.then8
  %12 = load i8*, i8** @tokstr, align 4
  %13 = load i8*, i8** %vincdec, align 4
  call void @expr_bind_variable(i8* %12, i8* %13)
  br label %if.end12

if.end12:                                         ; preds = %if.else, %if.then11
  br label %if.end13

if.end13:                                         ; preds = %if.end12, %if.end
  %14 = load i8*, i8** %vincdec, align 4
  call void @sh_xfree(i8* %14, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i32 992)
  %15 = load i64, i64* %v2, align 8
  store i64 %15, i64* %val, align 8
  store i32 6, i32* @curtok, align 4
  call void @readtok()
  br label %if.end83

if.else14:                                        ; preds = %lor.lhs.false
  %16 = load i32, i32* @curtok, align 4
  %cmp15 = icmp eq i32 %16, 40
  br i1 %cmp15, label %if.then17, label %if.else24

if.then17:                                        ; preds = %if.else14
  call void @readtok()
  %call18 = call i64 @expcomma()
  store i64 %call18, i64* %val, align 8
  %17 = load i32, i32* @curtok, align 4
  %cmp19 = icmp ne i32 %17, 41
  br i1 %cmp19, label %if.then21, label %if.end23

if.then21:                                        ; preds = %if.then17
  %call22 = call i8* @libintl_gettext(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.16, i32 0, i32 0))
  call void @evalerror(i8* %call22)
  br label %if.end23

if.end23:                                         ; preds = %if.then21, %if.then17
  call void @readtok()
  br label %if.end82

if.else24:                                        ; preds = %if.else14
  %18 = load i32, i32* @curtok, align 4
  %cmp25 = icmp eq i32 %18, 6
  br i1 %cmp25, label %if.then30, label %lor.lhs.false27

lor.lhs.false27:                                  ; preds = %if.else24
  %19 = load i32, i32* @curtok, align 4
  %cmp28 = icmp eq i32 %19, 5
  br i1 %cmp28, label %if.then30, label %if.else79

if.then30:                                        ; preds = %lor.lhs.false27, %if.else24
  %20 = load i64, i64* @tokval, align 8
  store i64 %20, i64* %val, align 8
  %21 = load i32, i32* @curtok, align 4
  %cmp31 = icmp eq i32 %21, 5
  br i1 %cmp31, label %if.then33, label %if.end78

if.then33:                                        ; preds = %if.then30
  br label %do.body

do.body:                                          ; preds = %if.then33
  %22 = load i32, i32* @curtok, align 4
  %curtok = getelementptr inbounds %struct.EXPR_CONTEXT, %struct.EXPR_CONTEXT* %ec, i32 0, i32 0
  store i32 %22, i32* %curtok, align 8
  %23 = load i32, i32* @lasttok, align 4
  %lasttok = getelementptr inbounds %struct.EXPR_CONTEXT, %struct.EXPR_CONTEXT* %ec, i32 0, i32 1
  store i32 %23, i32* %lasttok, align 4
  %24 = load i8*, i8** @tp, align 4
  %tp = getelementptr inbounds %struct.EXPR_CONTEXT, %struct.EXPR_CONTEXT* %ec, i32 0, i32 3
  store i8* %24, i8** %tp, align 4
  %25 = load i8*, i8** @lasttp, align 4
  %lasttp = getelementptr inbounds %struct.EXPR_CONTEXT, %struct.EXPR_CONTEXT* %ec, i32 0, i32 4
  store i8* %25, i8** %lasttp, align 8
  %26 = load i64, i64* @tokval, align 8
  %tokval = getelementptr inbounds %struct.EXPR_CONTEXT, %struct.EXPR_CONTEXT* %ec, i32 0, i32 5
  store i64 %26, i64* %tokval, align 8
  %27 = load i8*, i8** @tokstr, align 4
  %tokstr = getelementptr inbounds %struct.EXPR_CONTEXT, %struct.EXPR_CONTEXT* %ec, i32 0, i32 6
  store i8* %27, i8** %tokstr, align 8
  %28 = load i32, i32* @noeval, align 4
  %noeval = getelementptr inbounds %struct.EXPR_CONTEXT, %struct.EXPR_CONTEXT* %ec, i32 0, i32 7
  store i32 %28, i32* %noeval, align 4
  %lval = getelementptr inbounds %struct.EXPR_CONTEXT, %struct.EXPR_CONTEXT* %ec, i32 0, i32 8
  %29 = bitcast %struct.lvalue* %lval to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %29, i8* bitcast (%struct.lvalue* @curlval to i8*), i32 32, i32 8, i1 false)
  br label %do.end

do.end:                                           ; preds = %do.body
  store i8* null, i8** @tokstr, align 4
  store i32 1, i32* @noeval, align 4
  call void @readtok()
  %30 = load i32, i32* @curtok, align 4
  store i32 %30, i32* %stok, align 4
  %31 = load i32, i32* %stok, align 4
  %cmp34 = icmp eq i32 %31, 16
  br i1 %cmp34, label %if.then39, label %lor.lhs.false36

lor.lhs.false36:                                  ; preds = %do.end
  %32 = load i32, i32* %stok, align 4
  %cmp37 = icmp eq i32 %32, 17
  br i1 %cmp37, label %if.then39, label %if.else58

if.then39:                                        ; preds = %lor.lhs.false36, %do.end
  %tokstr40 = getelementptr inbounds %struct.EXPR_CONTEXT, %struct.EXPR_CONTEXT* %ec, i32 0, i32 6
  %33 = load i8*, i8** %tokstr40, align 8
  store i8* %33, i8** @tokstr, align 4
  %noeval41 = getelementptr inbounds %struct.EXPR_CONTEXT, %struct.EXPR_CONTEXT* %ec, i32 0, i32 7
  %34 = load i32, i32* %noeval41, align 4
  store i32 %34, i32* @noeval, align 4
  %lval42 = getelementptr inbounds %struct.EXPR_CONTEXT, %struct.EXPR_CONTEXT* %ec, i32 0, i32 8
  %35 = bitcast %struct.lvalue* %lval42 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* bitcast (%struct.lvalue* @curlval to i8*), i8* %35, i32 32, i32 8, i1 false)
  store i32 5, i32* @lasttok, align 4
  %36 = load i64, i64* %val, align 8
  %37 = load i32, i32* %stok, align 4
  %cmp43 = icmp eq i32 %37, 16
  %cond45 = select i1 %cmp43, i32 1, i32 -1
  %conv46 = sext i32 %cond45 to i64
  %add47 = add nsw i64 %36, %conv46
  store i64 %add47, i64* %v2, align 8
  %38 = load i64, i64* %v2, align 8
  %call48 = call i8* @itos(i64 %38)
  store i8* %call48, i8** %vincdec, align 4
  %39 = load i32, i32* @noeval, align 4
  %cmp49 = icmp eq i32 %39, 0
  br i1 %cmp49, label %if.then51, label %if.end57

if.then51:                                        ; preds = %if.then39
  %40 = load i64, i64* getelementptr inbounds (%struct.lvalue, %struct.lvalue* @curlval, i32 0, i32 3), align 8
  %cmp52 = icmp ne i64 %40, -1
  br i1 %cmp52, label %if.then54, label %if.else55

if.then54:                                        ; preds = %if.then51
  %41 = load i8*, i8** getelementptr inbounds (%struct.lvalue, %struct.lvalue* @curlval, i32 0, i32 0), align 8
  %42 = load i64, i64* getelementptr inbounds (%struct.lvalue, %struct.lvalue* @curlval, i32 0, i32 3), align 8
  %43 = load i8*, i8** %vincdec, align 4
  call void @expr_bind_array_element(i8* %41, i64 %42, i8* %43)
  br label %if.end56

if.else55:                                        ; preds = %if.then51
  %44 = load i8*, i8** @tokstr, align 4
  %45 = load i8*, i8** %vincdec, align 4
  call void @expr_bind_variable(i8* %44, i8* %45)
  br label %if.end56

if.end56:                                         ; preds = %if.else55, %if.then54
  br label %if.end57

if.end57:                                         ; preds = %if.end56, %if.then39
  %46 = load i8*, i8** %vincdec, align 4
  call void @sh_xfree(i8* %46, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i32 1041)
  store i32 6, i32* @curtok, align 4
  br label %if.end77

if.else58:                                        ; preds = %lor.lhs.false36
  %47 = load i32, i32* %stok, align 4
  %cmp59 = icmp eq i32 %47, 5
  br i1 %cmp59, label %if.then61, label %if.end66

if.then61:                                        ; preds = %if.else58
  br label %do.body62

do.body62:                                        ; preds = %if.then61
  %48 = load i8*, i8** @tokstr, align 4
  %tobool = icmp ne i8* %48, null
  br i1 %tobool, label %if.then63, label %if.end64

if.then63:                                        ; preds = %do.body62
  %49 = load i8*, i8** @tokstr, align 4
  call void @sh_xfree(i8* %49, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i32 1048)
  br label %if.end64

if.end64:                                         ; preds = %if.then63, %do.body62
  br label %do.end65

do.end65:                                         ; preds = %if.end64
  br label %if.end66

if.end66:                                         ; preds = %do.end65, %if.else58
  br label %do.body67

do.body67:                                        ; preds = %if.end66
  %curtok68 = getelementptr inbounds %struct.EXPR_CONTEXT, %struct.EXPR_CONTEXT* %ec, i32 0, i32 0
  %50 = load i32, i32* %curtok68, align 8
  store i32 %50, i32* @curtok, align 4
  %lasttok69 = getelementptr inbounds %struct.EXPR_CONTEXT, %struct.EXPR_CONTEXT* %ec, i32 0, i32 1
  %51 = load i32, i32* %lasttok69, align 4
  store i32 %51, i32* @lasttok, align 4
  %tp70 = getelementptr inbounds %struct.EXPR_CONTEXT, %struct.EXPR_CONTEXT* %ec, i32 0, i32 3
  %52 = load i8*, i8** %tp70, align 4
  store i8* %52, i8** @tp, align 4
  %lasttp71 = getelementptr inbounds %struct.EXPR_CONTEXT, %struct.EXPR_CONTEXT* %ec, i32 0, i32 4
  %53 = load i8*, i8** %lasttp71, align 8
  store i8* %53, i8** @lasttp, align 4
  %tokval72 = getelementptr inbounds %struct.EXPR_CONTEXT, %struct.EXPR_CONTEXT* %ec, i32 0, i32 5
  %54 = load i64, i64* %tokval72, align 8
  store i64 %54, i64* @tokval, align 8
  %tokstr73 = getelementptr inbounds %struct.EXPR_CONTEXT, %struct.EXPR_CONTEXT* %ec, i32 0, i32 6
  %55 = load i8*, i8** %tokstr73, align 8
  store i8* %55, i8** @tokstr, align 4
  %noeval74 = getelementptr inbounds %struct.EXPR_CONTEXT, %struct.EXPR_CONTEXT* %ec, i32 0, i32 7
  %56 = load i32, i32* %noeval74, align 4
  store i32 %56, i32* @noeval, align 4
  %lval75 = getelementptr inbounds %struct.EXPR_CONTEXT, %struct.EXPR_CONTEXT* %ec, i32 0, i32 8
  %57 = bitcast %struct.lvalue* %lval75 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* bitcast (%struct.lvalue* @curlval to i8*), i8* %57, i32 32, i32 8, i1 false)
  br label %do.end76

do.end76:                                         ; preds = %do.body67
  br label %if.end77

if.end77:                                         ; preds = %do.end76, %if.end57
  br label %if.end78

if.end78:                                         ; preds = %if.end77, %if.then30
  call void @readtok()
  br label %if.end81

if.else79:                                        ; preds = %lor.lhs.false27
  %call80 = call i8* @libintl_gettext(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.4, i32 0, i32 0))
  call void @evalerror(i8* %call80)
  br label %if.end81

if.end81:                                         ; preds = %if.else79, %if.end78
  br label %if.end82

if.end82:                                         ; preds = %if.end81, %if.end23
  br label %if.end83

if.end83:                                         ; preds = %if.end82, %if.end13
  %58 = load i64, i64* %val, align 8
  ret i64 %58
}

declare i8* @fmtumax(i64, i32, i8*, i32, i32) #3

declare i32 @sprintf(i8*, i8*, ...) #3

declare %struct.variable* @bind_int_variable(i8*, i8*) #3

declare void @stupidly_hack_special_variables(i8*) #3

declare void @internal_error(i8*, ...) #3

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { returns_twice "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { returns_twice }
attributes #7 = { nounwind readonly }
attributes #8 = { noreturn }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
