; ModuleID = 'plural.c'
source_filename = "plural.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%union.YYSTYPE = type { i32 }
%union.yyalloc = type { %union.YYSTYPE }
%struct.parse_args = type { i8*, %struct.expression* }
%struct.expression = type { i32, i32, %union.anon }
%union.anon = type { [3 x %struct.expression*] }

@yypact = internal constant [27 x i8] c"\F7\F7\F6\F6\F7\08$\F6\0D\F6\F7\F7\F7\F7\F7\F7\F7\F6\1A)-\12\FE\0E\F6\F7$", align 1
@yytranslate = internal constant [263 x i8] c"\00\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\0A\02\02\02\02\05\02\0E\0F\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\0C\02\02\02\02\03\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\0D\02\02\02\02\02\02\02\02\02\02\02\02\02\04\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\01\02\06\07\08\09\0B", align 1
@yycheck = internal constant [55 x i8] c"\01\0A\0B\04\0D\0E\08\09\00\0A\0B\0C\0D\0E\0F\10\03\04\05\06\07\08\09\09\19\07\08\09\0F\03\04\05\06\07\08\09\FF\FF\0C\03\04\05\06\07\08\09\05\06\07\08\09\06\07\08\09", align 1
@yytable = internal constant [55 x i8] c"\07\01\02\08\03\04\0F\10\09\12\13\14\15\16\17\18\0A\0B\0C\0D\0E\0F\10\10\1A\0E\0F\10\11\0A\0B\0C\0D\0E\0F\10\00\00\19\0A\0B\0C\0D\0E\0F\10\0C\0D\0E\0F\10\0D\0E\0F\10", align 1
@yydefact = internal constant [27 x i8] c"\00\00\0C\0B\00\00\02\0A\00\01\00\00\00\00\00\00\00\0D\00\04\05\06\07\08\09\00\03", align 1
@yyr2 = internal constant [14 x i8] c"\00\02\01\05\03\03\03\03\03\03\02\01\01\03", align 1
@yyr1 = internal constant [14 x i8] c"\00\10\11\12\12\12\12\12\12\12\12\12\12\12", align 1
@yypgoto = internal constant [3 x i8] c"\F6\F6\FF", align 1
@yydefgoto = internal constant [3 x i8] c"\FF\05\06", align 1
@.str = private unnamed_addr constant [13 x i8] c"syntax error\00", align 1
@.str.1 = private unnamed_addr constant [15 x i8] c"Error: popping\00", align 1
@yystos = internal constant [27 x i8] c"\00\0A\0B\0D\0E\11\12\12\12\00\03\04\05\06\07\08\09\0F\12\12\12\12\12\12\12\0C\12", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Error: discarding\00", align 1
@.str.3 = private unnamed_addr constant [28 x i8] c"Error: discarding lookahead\00", align 1
@.str.4 = private unnamed_addr constant [22 x i8] c"parser stack overflow\00", align 1
@.str.5 = private unnamed_addr constant [9 x i8] c"Deleting\00", align 1

; Function Attrs: noinline nounwind
define i32 @libintl_gettextparse(i8* %arg) #0 {
entry:
  %arg.addr = alloca i8*, align 4
  %__gettextchar = alloca i32, align 4
  %__gettextlval = alloca %union.YYSTYPE, align 4
  %__gettextnerrs = alloca i32, align 4
  %yystate = alloca i32, align 4
  %yyn = alloca i32, align 4
  %yyresult = alloca i32, align 4
  %yyerrstatus = alloca i32, align 4
  %yytoken = alloca i32, align 4
  %yyssa = alloca [200 x i16], align 2
  %yyss = alloca i16*, align 4
  %yyssp = alloca i16*, align 4
  %yyvsa = alloca [200 x %union.YYSTYPE], align 4
  %yyvs = alloca %union.YYSTYPE*, align 4
  %yyvsp = alloca %union.YYSTYPE*, align 4
  %yystacksize = alloca i32, align 4
  %yyval = alloca %union.YYSTYPE, align 4
  %yylen = alloca i32, align 4
  %yysize = alloca i32, align 4
  %yyss1 = alloca i16*, align 4
  %yyptr = alloca %union.yyalloc*, align 4
  %yynewbytes = alloca i32, align 4
  %yynewbytes22 = alloca i32, align 4
  store i8* %arg, i8** %arg.addr, align 4
  store i32 0, i32* %yytoken, align 4
  %arraydecay = getelementptr inbounds [200 x i16], [200 x i16]* %yyssa, i32 0, i32 0
  store i16* %arraydecay, i16** %yyss, align 4
  %arraydecay1 = getelementptr inbounds [200 x %union.YYSTYPE], [200 x %union.YYSTYPE]* %yyvsa, i32 0, i32 0
  store %union.YYSTYPE* %arraydecay1, %union.YYSTYPE** %yyvs, align 4
  store i32 200, i32* %yystacksize, align 4
  store i32 0, i32* %yystate, align 4
  store i32 0, i32* %yyerrstatus, align 4
  store i32 0, i32* %__gettextnerrs, align 4
  store i32 -2, i32* %__gettextchar, align 4
  %0 = load i16*, i16** %yyss, align 4
  store i16* %0, i16** %yyssp, align 4
  %1 = load %union.YYSTYPE*, %union.YYSTYPE** %yyvs, align 4
  store %union.YYSTYPE* %1, %union.YYSTYPE** %yyvsp, align 4
  %2 = load %union.YYSTYPE*, %union.YYSTYPE** %yyvsp, align 4
  %arrayidx = getelementptr inbounds %union.YYSTYPE, %union.YYSTYPE* %2, i32 0
  %3 = bitcast %union.YYSTYPE* %arrayidx to i8*
  %4 = bitcast %union.YYSTYPE* %__gettextlval to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %3, i8* %4, i32 4, i32 4, i1 false)
  br label %yysetstate

yynewstate:                                       ; preds = %if.end296, %if.end228, %if.end102
  %5 = load i16*, i16** %yyssp, align 4
  %incdec.ptr = getelementptr inbounds i16, i16* %5, i32 1
  store i16* %incdec.ptr, i16** %yyssp, align 4
  br label %yysetstate

yysetstate:                                       ; preds = %yynewstate, %entry
  %6 = load i32, i32* %yystate, align 4
  %conv = trunc i32 %6 to i16
  %7 = load i16*, i16** %yyssp, align 4
  store i16 %conv, i16* %7, align 2
  %8 = load i16*, i16** %yyss, align 4
  %9 = load i32, i32* %yystacksize, align 4
  %add.ptr = getelementptr inbounds i16, i16* %8, i32 %9
  %add.ptr2 = getelementptr inbounds i16, i16* %add.ptr, i32 -1
  %10 = load i16*, i16** %yyssp, align 4
  %cmp = icmp ule i16* %add.ptr2, %10
  br i1 %cmp, label %if.then, label %if.end46

if.then:                                          ; preds = %yysetstate
  %11 = load i16*, i16** %yyssp, align 4
  %12 = load i16*, i16** %yyss, align 4
  %sub.ptr.lhs.cast = ptrtoint i16* %11 to i32
  %sub.ptr.rhs.cast = ptrtoint i16* %12 to i32
  %sub.ptr.sub = sub i32 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = sdiv exact i32 %sub.ptr.sub, 2
  %add = add nsw i32 %sub.ptr.div, 1
  store i32 %add, i32* %yysize, align 4
  %13 = load i32, i32* %yystacksize, align 4
  %cmp4 = icmp ule i32 10000, %13
  br i1 %cmp4, label %if.then6, label %if.end

if.then6:                                         ; preds = %if.then
  br label %yyoverflowlab

if.end:                                           ; preds = %if.then
  %14 = load i32, i32* %yystacksize, align 4
  %mul = mul i32 %14, 2
  store i32 %mul, i32* %yystacksize, align 4
  %15 = load i32, i32* %yystacksize, align 4
  %cmp7 = icmp ult i32 10000, %15
  br i1 %cmp7, label %if.then9, label %if.end10

if.then9:                                         ; preds = %if.end
  store i32 10000, i32* %yystacksize, align 4
  br label %if.end10

if.end10:                                         ; preds = %if.then9, %if.end
  %16 = load i16*, i16** %yyss, align 4
  store i16* %16, i16** %yyss1, align 4
  %17 = load i32, i32* %yystacksize, align 4
  %mul11 = mul i32 %17, 6
  %add12 = add i32 %mul11, 3
  %call = call i8* @malloc(i32 %add12)
  %18 = bitcast i8* %call to %union.yyalloc*
  store %union.yyalloc* %18, %union.yyalloc** %yyptr, align 4
  %19 = load %union.yyalloc*, %union.yyalloc** %yyptr, align 4
  %tobool = icmp ne %union.yyalloc* %19, null
  br i1 %tobool, label %if.end14, label %if.then13

if.then13:                                        ; preds = %if.end10
  br label %yyoverflowlab

if.end14:                                         ; preds = %if.end10
  br label %do.body

do.body:                                          ; preds = %if.end14
  %20 = load %union.yyalloc*, %union.yyalloc** %yyptr, align 4
  %yyss15 = bitcast %union.yyalloc* %20 to i16*
  %21 = bitcast i16* %yyss15 to i8*
  %22 = load i16*, i16** %yyss, align 4
  %23 = bitcast i16* %22 to i8*
  %24 = load i32, i32* %yysize, align 4
  %mul16 = mul i32 %24, 2
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %21, i8* %23, i32 %mul16, i32 2, i1 false)
  %25 = load %union.yyalloc*, %union.yyalloc** %yyptr, align 4
  %yyss17 = bitcast %union.yyalloc* %25 to i16*
  store i16* %yyss17, i16** %yyss, align 4
  %26 = load i32, i32* %yystacksize, align 4
  %mul18 = mul i32 %26, 2
  %add19 = add i32 %mul18, 3
  store i32 %add19, i32* %yynewbytes, align 4
  %27 = load i32, i32* %yynewbytes, align 4
  %div = udiv i32 %27, 4
  %28 = load %union.yyalloc*, %union.yyalloc** %yyptr, align 4
  %add.ptr20 = getelementptr inbounds %union.yyalloc, %union.yyalloc* %28, i32 %div
  store %union.yyalloc* %add.ptr20, %union.yyalloc** %yyptr, align 4
  br label %do.end

do.end:                                           ; preds = %do.body
  br label %do.body21

do.body21:                                        ; preds = %do.end
  %29 = load %union.yyalloc*, %union.yyalloc** %yyptr, align 4
  %yyvs23 = bitcast %union.yyalloc* %29 to %union.YYSTYPE*
  %30 = bitcast %union.YYSTYPE* %yyvs23 to i8*
  %31 = load %union.YYSTYPE*, %union.YYSTYPE** %yyvs, align 4
  %32 = bitcast %union.YYSTYPE* %31 to i8*
  %33 = load i32, i32* %yysize, align 4
  %mul24 = mul i32 %33, 4
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %30, i8* %32, i32 %mul24, i32 4, i1 false)
  %34 = load %union.yyalloc*, %union.yyalloc** %yyptr, align 4
  %yyvs25 = bitcast %union.yyalloc* %34 to %union.YYSTYPE*
  store %union.YYSTYPE* %yyvs25, %union.YYSTYPE** %yyvs, align 4
  %35 = load i32, i32* %yystacksize, align 4
  %mul26 = mul i32 %35, 4
  %add27 = add i32 %mul26, 3
  store i32 %add27, i32* %yynewbytes22, align 4
  %36 = load i32, i32* %yynewbytes22, align 4
  %div28 = udiv i32 %36, 4
  %37 = load %union.yyalloc*, %union.yyalloc** %yyptr, align 4
  %add.ptr29 = getelementptr inbounds %union.yyalloc, %union.yyalloc* %37, i32 %div28
  store %union.yyalloc* %add.ptr29, %union.yyalloc** %yyptr, align 4
  br label %do.end30

do.end30:                                         ; preds = %do.body21
  %38 = load i16*, i16** %yyss1, align 4
  %arraydecay31 = getelementptr inbounds [200 x i16], [200 x i16]* %yyssa, i32 0, i32 0
  %cmp32 = icmp ne i16* %38, %arraydecay31
  br i1 %cmp32, label %if.then34, label %if.end35

if.then34:                                        ; preds = %do.end30
  %39 = load i16*, i16** %yyss1, align 4
  %40 = bitcast i16* %39 to i8*
  call void @free(i8* %40)
  br label %if.end35

if.end35:                                         ; preds = %if.then34, %do.end30
  %41 = load i16*, i16** %yyss, align 4
  %42 = load i32, i32* %yysize, align 4
  %add.ptr36 = getelementptr inbounds i16, i16* %41, i32 %42
  %add.ptr37 = getelementptr inbounds i16, i16* %add.ptr36, i32 -1
  store i16* %add.ptr37, i16** %yyssp, align 4
  %43 = load %union.YYSTYPE*, %union.YYSTYPE** %yyvs, align 4
  %44 = load i32, i32* %yysize, align 4
  %add.ptr38 = getelementptr inbounds %union.YYSTYPE, %union.YYSTYPE* %43, i32 %44
  %add.ptr39 = getelementptr inbounds %union.YYSTYPE, %union.YYSTYPE* %add.ptr38, i32 -1
  store %union.YYSTYPE* %add.ptr39, %union.YYSTYPE** %yyvsp, align 4
  %45 = load i16*, i16** %yyss, align 4
  %46 = load i32, i32* %yystacksize, align 4
  %add.ptr40 = getelementptr inbounds i16, i16* %45, i32 %46
  %add.ptr41 = getelementptr inbounds i16, i16* %add.ptr40, i32 -1
  %47 = load i16*, i16** %yyssp, align 4
  %cmp42 = icmp ule i16* %add.ptr41, %47
  br i1 %cmp42, label %if.then44, label %if.end45

if.then44:                                        ; preds = %if.end35
  br label %yyabortlab

if.end45:                                         ; preds = %if.end35
  br label %if.end46

if.end46:                                         ; preds = %if.end45, %yysetstate
  br label %yybackup

yybackup:                                         ; preds = %if.end46
  %48 = load i32, i32* %yystate, align 4
  %arrayidx47 = getelementptr inbounds [27 x i8], [27 x i8]* @yypact, i32 0, i32 %48
  %49 = load i8, i8* %arrayidx47, align 1
  %conv48 = sext i8 %49 to i32
  store i32 %conv48, i32* %yyn, align 4
  %50 = load i32, i32* %yyn, align 4
  %cmp49 = icmp eq i32 %50, -10
  br i1 %cmp49, label %if.then51, label %if.end52

if.then51:                                        ; preds = %yybackup
  br label %yydefault

if.end52:                                         ; preds = %yybackup
  %51 = load i32, i32* %__gettextchar, align 4
  %cmp53 = icmp eq i32 %51, -2
  br i1 %cmp53, label %if.then55, label %if.end57

if.then55:                                        ; preds = %if.end52
  %52 = load i8*, i8** %arg.addr, align 4
  %53 = bitcast i8* %52 to %struct.parse_args*
  %cp = getelementptr inbounds %struct.parse_args, %struct.parse_args* %53, i32 0, i32 0
  %call56 = call i32 @__gettextlex(%union.YYSTYPE* %__gettextlval, i8** %cp)
  store i32 %call56, i32* %__gettextchar, align 4
  br label %if.end57

if.end57:                                         ; preds = %if.then55, %if.end52
  %54 = load i32, i32* %__gettextchar, align 4
  %cmp58 = icmp sle i32 %54, 0
  br i1 %cmp58, label %if.then60, label %if.else

if.then60:                                        ; preds = %if.end57
  store i32 0, i32* %yytoken, align 4
  store i32 0, i32* %__gettextchar, align 4
  br label %if.end65

if.else:                                          ; preds = %if.end57
  %55 = load i32, i32* %__gettextchar, align 4
  %cmp61 = icmp ule i32 %55, 262
  br i1 %cmp61, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.else
  %56 = load i32, i32* %__gettextchar, align 4
  %arrayidx63 = getelementptr inbounds [263 x i8], [263 x i8]* @yytranslate, i32 0, i32 %56
  %57 = load i8, i8* %arrayidx63, align 1
  %conv64 = zext i8 %57 to i32
  br label %cond.end

cond.false:                                       ; preds = %if.else
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv64, %cond.true ], [ 2, %cond.false ]
  store i32 %cond, i32* %yytoken, align 4
  br label %if.end65

if.end65:                                         ; preds = %cond.end, %if.then60
  %58 = load i32, i32* %yytoken, align 4
  %59 = load i32, i32* %yyn, align 4
  %add66 = add nsw i32 %59, %58
  store i32 %add66, i32* %yyn, align 4
  %60 = load i32, i32* %yyn, align 4
  %cmp67 = icmp slt i32 %60, 0
  br i1 %cmp67, label %if.then76, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end65
  %61 = load i32, i32* %yyn, align 4
  %cmp69 = icmp slt i32 54, %61
  br i1 %cmp69, label %if.then76, label %lor.lhs.false71

lor.lhs.false71:                                  ; preds = %lor.lhs.false
  %62 = load i32, i32* %yyn, align 4
  %arrayidx72 = getelementptr inbounds [55 x i8], [55 x i8]* @yycheck, i32 0, i32 %62
  %63 = load i8, i8* %arrayidx72, align 1
  %conv73 = sext i8 %63 to i32
  %64 = load i32, i32* %yytoken, align 4
  %cmp74 = icmp ne i32 %conv73, %64
  br i1 %cmp74, label %if.then76, label %if.end77

if.then76:                                        ; preds = %lor.lhs.false71, %lor.lhs.false, %if.end65
  br label %yydefault

if.end77:                                         ; preds = %lor.lhs.false71
  %65 = load i32, i32* %yyn, align 4
  %arrayidx78 = getelementptr inbounds [55 x i8], [55 x i8]* @yytable, i32 0, i32 %65
  %66 = load i8, i8* %arrayidx78, align 1
  %conv79 = zext i8 %66 to i32
  store i32 %conv79, i32* %yyn, align 4
  %67 = load i32, i32* %yyn, align 4
  %cmp80 = icmp sle i32 %67, 0
  br i1 %cmp80, label %if.then82, label %if.end90

if.then82:                                        ; preds = %if.end77
  %68 = load i32, i32* %yyn, align 4
  %cmp83 = icmp eq i32 %68, 0
  br i1 %cmp83, label %if.then88, label %lor.lhs.false85

lor.lhs.false85:                                  ; preds = %if.then82
  %69 = load i32, i32* %yyn, align 4
  %cmp86 = icmp eq i32 %69, -1
  br i1 %cmp86, label %if.then88, label %if.end89

if.then88:                                        ; preds = %lor.lhs.false85, %if.then82
  br label %yyerrlab

if.end89:                                         ; preds = %lor.lhs.false85
  %70 = load i32, i32* %yyn, align 4
  %sub = sub nsw i32 0, %70
  store i32 %sub, i32* %yyn, align 4
  br label %yyreduce

if.end90:                                         ; preds = %if.end77
  %71 = load i32, i32* %yyn, align 4
  %cmp91 = icmp eq i32 %71, 9
  br i1 %cmp91, label %if.then93, label %if.end94

if.then93:                                        ; preds = %if.end90
  br label %yyacceptlab

if.end94:                                         ; preds = %if.end90
  %72 = load i32, i32* %__gettextchar, align 4
  %cmp95 = icmp ne i32 %72, 0
  br i1 %cmp95, label %if.then97, label %if.end98

if.then97:                                        ; preds = %if.end94
  store i32 -2, i32* %__gettextchar, align 4
  br label %if.end98

if.end98:                                         ; preds = %if.then97, %if.end94
  %73 = load %union.YYSTYPE*, %union.YYSTYPE** %yyvsp, align 4
  %incdec.ptr99 = getelementptr inbounds %union.YYSTYPE, %union.YYSTYPE* %73, i32 1
  store %union.YYSTYPE* %incdec.ptr99, %union.YYSTYPE** %yyvsp, align 4
  %74 = bitcast %union.YYSTYPE* %incdec.ptr99 to i8*
  %75 = bitcast %union.YYSTYPE* %__gettextlval to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %74, i8* %75, i32 4, i32 4, i1 false)
  %76 = load i32, i32* %yyerrstatus, align 4
  %tobool100 = icmp ne i32 %76, 0
  br i1 %tobool100, label %if.then101, label %if.end102

if.then101:                                       ; preds = %if.end98
  %77 = load i32, i32* %yyerrstatus, align 4
  %dec = add nsw i32 %77, -1
  store i32 %dec, i32* %yyerrstatus, align 4
  br label %if.end102

if.end102:                                        ; preds = %if.then101, %if.end98
  %78 = load i32, i32* %yyn, align 4
  store i32 %78, i32* %yystate, align 4
  br label %yynewstate

yydefault:                                        ; preds = %if.then76, %if.then51
  %79 = load i32, i32* %yystate, align 4
  %arrayidx103 = getelementptr inbounds [27 x i8], [27 x i8]* @yydefact, i32 0, i32 %79
  %80 = load i8, i8* %arrayidx103, align 1
  %conv104 = zext i8 %80 to i32
  store i32 %conv104, i32* %yyn, align 4
  %81 = load i32, i32* %yyn, align 4
  %cmp105 = icmp eq i32 %81, 0
  br i1 %cmp105, label %if.then107, label %if.end108

if.then107:                                       ; preds = %yydefault
  br label %yyerrlab

if.end108:                                        ; preds = %yydefault
  br label %yyreduce

yyreduce:                                         ; preds = %if.end108, %if.end89
  %82 = load i32, i32* %yyn, align 4
  %arrayidx109 = getelementptr inbounds [14 x i8], [14 x i8]* @yyr2, i32 0, i32 %82
  %83 = load i8, i8* %arrayidx109, align 1
  %conv110 = zext i8 %83 to i32
  store i32 %conv110, i32* %yylen, align 4
  %84 = load %union.YYSTYPE*, %union.YYSTYPE** %yyvsp, align 4
  %85 = load i32, i32* %yylen, align 4
  %sub111 = sub nsw i32 1, %85
  %arrayidx112 = getelementptr inbounds %union.YYSTYPE, %union.YYSTYPE* %84, i32 %sub111
  %86 = bitcast %union.YYSTYPE* %yyval to i8*
  %87 = bitcast %union.YYSTYPE* %arrayidx112 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %86, i8* %87, i32 4, i32 4, i1 false)
  %88 = load i32, i32* %yyn, align 4
  switch i32 %88, label %sw.epilog [
    i32 2, label %sw.bb
    i32 3, label %sw.bb120
    i32 4, label %sw.bb129
    i32 5, label %sw.bb136
    i32 6, label %sw.bb143
    i32 7, label %sw.bb151
    i32 8, label %sw.bb160
    i32 9, label %sw.bb169
    i32 10, label %sw.bb178
    i32 11, label %sw.bb183
    i32 12, label %sw.bb186
    i32 13, label %sw.bb196
  ]

sw.bb:                                            ; preds = %yyreduce
  %89 = load %union.YYSTYPE*, %union.YYSTYPE** %yyvsp, align 4
  %arrayidx113 = getelementptr inbounds %union.YYSTYPE, %union.YYSTYPE* %89, i32 0
  %exp = bitcast %union.YYSTYPE* %arrayidx113 to %struct.expression**
  %90 = load %struct.expression*, %struct.expression** %exp, align 4
  %cmp114 = icmp eq %struct.expression* %90, null
  br i1 %cmp114, label %if.then116, label %if.end117

if.then116:                                       ; preds = %sw.bb
  br label %yyabortlab

if.end117:                                        ; preds = %sw.bb
  %91 = load %union.YYSTYPE*, %union.YYSTYPE** %yyvsp, align 4
  %arrayidx118 = getelementptr inbounds %union.YYSTYPE, %union.YYSTYPE* %91, i32 0
  %exp119 = bitcast %union.YYSTYPE* %arrayidx118 to %struct.expression**
  %92 = load %struct.expression*, %struct.expression** %exp119, align 4
  %93 = load i8*, i8** %arg.addr, align 4
  %94 = bitcast i8* %93 to %struct.parse_args*
  %res = getelementptr inbounds %struct.parse_args, %struct.parse_args* %94, i32 0, i32 1
  store %struct.expression* %92, %struct.expression** %res, align 4
  br label %sw.epilog

sw.bb120:                                         ; preds = %yyreduce
  %95 = load %union.YYSTYPE*, %union.YYSTYPE** %yyvsp, align 4
  %arrayidx121 = getelementptr inbounds %union.YYSTYPE, %union.YYSTYPE* %95, i32 -4
  %exp122 = bitcast %union.YYSTYPE* %arrayidx121 to %struct.expression**
  %96 = load %struct.expression*, %struct.expression** %exp122, align 4
  %97 = load %union.YYSTYPE*, %union.YYSTYPE** %yyvsp, align 4
  %arrayidx123 = getelementptr inbounds %union.YYSTYPE, %union.YYSTYPE* %97, i32 -2
  %exp124 = bitcast %union.YYSTYPE* %arrayidx123 to %struct.expression**
  %98 = load %struct.expression*, %struct.expression** %exp124, align 4
  %99 = load %union.YYSTYPE*, %union.YYSTYPE** %yyvsp, align 4
  %arrayidx125 = getelementptr inbounds %union.YYSTYPE, %union.YYSTYPE* %99, i32 0
  %exp126 = bitcast %union.YYSTYPE* %arrayidx125 to %struct.expression**
  %100 = load %struct.expression*, %struct.expression** %exp126, align 4
  %call127 = call %struct.expression* @new_exp_3(i32 16, %struct.expression* %96, %struct.expression* %98, %struct.expression* %100)
  %exp128 = bitcast %union.YYSTYPE* %yyval to %struct.expression**
  store %struct.expression* %call127, %struct.expression** %exp128, align 4
  br label %sw.epilog

sw.bb129:                                         ; preds = %yyreduce
  %101 = load %union.YYSTYPE*, %union.YYSTYPE** %yyvsp, align 4
  %arrayidx130 = getelementptr inbounds %union.YYSTYPE, %union.YYSTYPE* %101, i32 -2
  %exp131 = bitcast %union.YYSTYPE* %arrayidx130 to %struct.expression**
  %102 = load %struct.expression*, %struct.expression** %exp131, align 4
  %103 = load %union.YYSTYPE*, %union.YYSTYPE** %yyvsp, align 4
  %arrayidx132 = getelementptr inbounds %union.YYSTYPE, %union.YYSTYPE* %103, i32 0
  %exp133 = bitcast %union.YYSTYPE* %arrayidx132 to %struct.expression**
  %104 = load %struct.expression*, %struct.expression** %exp133, align 4
  %call134 = call %struct.expression* @new_exp_2(i32 15, %struct.expression* %102, %struct.expression* %104)
  %exp135 = bitcast %union.YYSTYPE* %yyval to %struct.expression**
  store %struct.expression* %call134, %struct.expression** %exp135, align 4
  br label %sw.epilog

sw.bb136:                                         ; preds = %yyreduce
  %105 = load %union.YYSTYPE*, %union.YYSTYPE** %yyvsp, align 4
  %arrayidx137 = getelementptr inbounds %union.YYSTYPE, %union.YYSTYPE* %105, i32 -2
  %exp138 = bitcast %union.YYSTYPE* %arrayidx137 to %struct.expression**
  %106 = load %struct.expression*, %struct.expression** %exp138, align 4
  %107 = load %union.YYSTYPE*, %union.YYSTYPE** %yyvsp, align 4
  %arrayidx139 = getelementptr inbounds %union.YYSTYPE, %union.YYSTYPE* %107, i32 0
  %exp140 = bitcast %union.YYSTYPE* %arrayidx139 to %struct.expression**
  %108 = load %struct.expression*, %struct.expression** %exp140, align 4
  %call141 = call %struct.expression* @new_exp_2(i32 14, %struct.expression* %106, %struct.expression* %108)
  %exp142 = bitcast %union.YYSTYPE* %yyval to %struct.expression**
  store %struct.expression* %call141, %struct.expression** %exp142, align 4
  br label %sw.epilog

sw.bb143:                                         ; preds = %yyreduce
  %109 = load %union.YYSTYPE*, %union.YYSTYPE** %yyvsp, align 4
  %arrayidx144 = getelementptr inbounds %union.YYSTYPE, %union.YYSTYPE* %109, i32 -1
  %op = bitcast %union.YYSTYPE* %arrayidx144 to i32*
  %110 = load i32, i32* %op, align 4
  %111 = load %union.YYSTYPE*, %union.YYSTYPE** %yyvsp, align 4
  %arrayidx145 = getelementptr inbounds %union.YYSTYPE, %union.YYSTYPE* %111, i32 -2
  %exp146 = bitcast %union.YYSTYPE* %arrayidx145 to %struct.expression**
  %112 = load %struct.expression*, %struct.expression** %exp146, align 4
  %113 = load %union.YYSTYPE*, %union.YYSTYPE** %yyvsp, align 4
  %arrayidx147 = getelementptr inbounds %union.YYSTYPE, %union.YYSTYPE* %113, i32 0
  %exp148 = bitcast %union.YYSTYPE* %arrayidx147 to %struct.expression**
  %114 = load %struct.expression*, %struct.expression** %exp148, align 4
  %call149 = call %struct.expression* @new_exp_2(i32 %110, %struct.expression* %112, %struct.expression* %114)
  %exp150 = bitcast %union.YYSTYPE* %yyval to %struct.expression**
  store %struct.expression* %call149, %struct.expression** %exp150, align 4
  br label %sw.epilog

sw.bb151:                                         ; preds = %yyreduce
  %115 = load %union.YYSTYPE*, %union.YYSTYPE** %yyvsp, align 4
  %arrayidx152 = getelementptr inbounds %union.YYSTYPE, %union.YYSTYPE* %115, i32 -1
  %op153 = bitcast %union.YYSTYPE* %arrayidx152 to i32*
  %116 = load i32, i32* %op153, align 4
  %117 = load %union.YYSTYPE*, %union.YYSTYPE** %yyvsp, align 4
  %arrayidx154 = getelementptr inbounds %union.YYSTYPE, %union.YYSTYPE* %117, i32 -2
  %exp155 = bitcast %union.YYSTYPE* %arrayidx154 to %struct.expression**
  %118 = load %struct.expression*, %struct.expression** %exp155, align 4
  %119 = load %union.YYSTYPE*, %union.YYSTYPE** %yyvsp, align 4
  %arrayidx156 = getelementptr inbounds %union.YYSTYPE, %union.YYSTYPE* %119, i32 0
  %exp157 = bitcast %union.YYSTYPE* %arrayidx156 to %struct.expression**
  %120 = load %struct.expression*, %struct.expression** %exp157, align 4
  %call158 = call %struct.expression* @new_exp_2(i32 %116, %struct.expression* %118, %struct.expression* %120)
  %exp159 = bitcast %union.YYSTYPE* %yyval to %struct.expression**
  store %struct.expression* %call158, %struct.expression** %exp159, align 4
  br label %sw.epilog

sw.bb160:                                         ; preds = %yyreduce
  %121 = load %union.YYSTYPE*, %union.YYSTYPE** %yyvsp, align 4
  %arrayidx161 = getelementptr inbounds %union.YYSTYPE, %union.YYSTYPE* %121, i32 -1
  %op162 = bitcast %union.YYSTYPE* %arrayidx161 to i32*
  %122 = load i32, i32* %op162, align 4
  %123 = load %union.YYSTYPE*, %union.YYSTYPE** %yyvsp, align 4
  %arrayidx163 = getelementptr inbounds %union.YYSTYPE, %union.YYSTYPE* %123, i32 -2
  %exp164 = bitcast %union.YYSTYPE* %arrayidx163 to %struct.expression**
  %124 = load %struct.expression*, %struct.expression** %exp164, align 4
  %125 = load %union.YYSTYPE*, %union.YYSTYPE** %yyvsp, align 4
  %arrayidx165 = getelementptr inbounds %union.YYSTYPE, %union.YYSTYPE* %125, i32 0
  %exp166 = bitcast %union.YYSTYPE* %arrayidx165 to %struct.expression**
  %126 = load %struct.expression*, %struct.expression** %exp166, align 4
  %call167 = call %struct.expression* @new_exp_2(i32 %122, %struct.expression* %124, %struct.expression* %126)
  %exp168 = bitcast %union.YYSTYPE* %yyval to %struct.expression**
  store %struct.expression* %call167, %struct.expression** %exp168, align 4
  br label %sw.epilog

sw.bb169:                                         ; preds = %yyreduce
  %127 = load %union.YYSTYPE*, %union.YYSTYPE** %yyvsp, align 4
  %arrayidx170 = getelementptr inbounds %union.YYSTYPE, %union.YYSTYPE* %127, i32 -1
  %op171 = bitcast %union.YYSTYPE* %arrayidx170 to i32*
  %128 = load i32, i32* %op171, align 4
  %129 = load %union.YYSTYPE*, %union.YYSTYPE** %yyvsp, align 4
  %arrayidx172 = getelementptr inbounds %union.YYSTYPE, %union.YYSTYPE* %129, i32 -2
  %exp173 = bitcast %union.YYSTYPE* %arrayidx172 to %struct.expression**
  %130 = load %struct.expression*, %struct.expression** %exp173, align 4
  %131 = load %union.YYSTYPE*, %union.YYSTYPE** %yyvsp, align 4
  %arrayidx174 = getelementptr inbounds %union.YYSTYPE, %union.YYSTYPE* %131, i32 0
  %exp175 = bitcast %union.YYSTYPE* %arrayidx174 to %struct.expression**
  %132 = load %struct.expression*, %struct.expression** %exp175, align 4
  %call176 = call %struct.expression* @new_exp_2(i32 %128, %struct.expression* %130, %struct.expression* %132)
  %exp177 = bitcast %union.YYSTYPE* %yyval to %struct.expression**
  store %struct.expression* %call176, %struct.expression** %exp177, align 4
  br label %sw.epilog

sw.bb178:                                         ; preds = %yyreduce
  %133 = load %union.YYSTYPE*, %union.YYSTYPE** %yyvsp, align 4
  %arrayidx179 = getelementptr inbounds %union.YYSTYPE, %union.YYSTYPE* %133, i32 0
  %exp180 = bitcast %union.YYSTYPE* %arrayidx179 to %struct.expression**
  %134 = load %struct.expression*, %struct.expression** %exp180, align 4
  %call181 = call %struct.expression* @new_exp_1(i32 2, %struct.expression* %134)
  %exp182 = bitcast %union.YYSTYPE* %yyval to %struct.expression**
  store %struct.expression* %call181, %struct.expression** %exp182, align 4
  br label %sw.epilog

sw.bb183:                                         ; preds = %yyreduce
  %call184 = call %struct.expression* @new_exp_0(i32 0)
  %exp185 = bitcast %union.YYSTYPE* %yyval to %struct.expression**
  store %struct.expression* %call184, %struct.expression** %exp185, align 4
  br label %sw.epilog

sw.bb186:                                         ; preds = %yyreduce
  %call187 = call %struct.expression* @new_exp_0(i32 1)
  %exp188 = bitcast %union.YYSTYPE* %yyval to %struct.expression**
  store %struct.expression* %call187, %struct.expression** %exp188, align 4
  %cmp189 = icmp ne %struct.expression* %call187, null
  br i1 %cmp189, label %if.then191, label %if.end195

if.then191:                                       ; preds = %sw.bb186
  %135 = load %union.YYSTYPE*, %union.YYSTYPE** %yyvsp, align 4
  %arrayidx192 = getelementptr inbounds %union.YYSTYPE, %union.YYSTYPE* %135, i32 0
  %num = bitcast %union.YYSTYPE* %arrayidx192 to i32*
  %136 = load i32, i32* %num, align 4
  %exp193 = bitcast %union.YYSTYPE* %yyval to %struct.expression**
  %137 = load %struct.expression*, %struct.expression** %exp193, align 4
  %val = getelementptr inbounds %struct.expression, %struct.expression* %137, i32 0, i32 2
  %num194 = bitcast %union.anon* %val to i32*
  store i32 %136, i32* %num194, align 4
  br label %if.end195

if.end195:                                        ; preds = %if.then191, %sw.bb186
  br label %sw.epilog

sw.bb196:                                         ; preds = %yyreduce
  %138 = load %union.YYSTYPE*, %union.YYSTYPE** %yyvsp, align 4
  %arrayidx197 = getelementptr inbounds %union.YYSTYPE, %union.YYSTYPE* %138, i32 -1
  %exp198 = bitcast %union.YYSTYPE* %arrayidx197 to %struct.expression**
  %139 = load %struct.expression*, %struct.expression** %exp198, align 4
  %exp199 = bitcast %union.YYSTYPE* %yyval to %struct.expression**
  store %struct.expression* %139, %struct.expression** %exp199, align 4
  br label %sw.epilog

sw.epilog:                                        ; preds = %yyreduce, %sw.bb196, %if.end195, %sw.bb183, %sw.bb178, %sw.bb169, %sw.bb160, %sw.bb151, %sw.bb143, %sw.bb136, %sw.bb129, %sw.bb120, %if.end117
  %140 = load i32, i32* %yylen, align 4
  %141 = load %union.YYSTYPE*, %union.YYSTYPE** %yyvsp, align 4
  %idx.neg = sub i32 0, %140
  %add.ptr200 = getelementptr inbounds %union.YYSTYPE, %union.YYSTYPE* %141, i32 %idx.neg
  store %union.YYSTYPE* %add.ptr200, %union.YYSTYPE** %yyvsp, align 4
  %142 = load i32, i32* %yylen, align 4
  %143 = load i16*, i16** %yyssp, align 4
  %idx.neg201 = sub i32 0, %142
  %add.ptr202 = getelementptr inbounds i16, i16* %143, i32 %idx.neg201
  store i16* %add.ptr202, i16** %yyssp, align 4
  %144 = load %union.YYSTYPE*, %union.YYSTYPE** %yyvsp, align 4
  %incdec.ptr203 = getelementptr inbounds %union.YYSTYPE, %union.YYSTYPE* %144, i32 1
  store %union.YYSTYPE* %incdec.ptr203, %union.YYSTYPE** %yyvsp, align 4
  %145 = bitcast %union.YYSTYPE* %incdec.ptr203 to i8*
  %146 = bitcast %union.YYSTYPE* %yyval to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %145, i8* %146, i32 4, i32 4, i1 false)
  %147 = load i32, i32* %yyn, align 4
  %arrayidx204 = getelementptr inbounds [14 x i8], [14 x i8]* @yyr1, i32 0, i32 %147
  %148 = load i8, i8* %arrayidx204, align 1
  %conv205 = zext i8 %148 to i32
  store i32 %conv205, i32* %yyn, align 4
  %149 = load i32, i32* %yyn, align 4
  %sub206 = sub nsw i32 %149, 16
  %arrayidx207 = getelementptr inbounds [3 x i8], [3 x i8]* @yypgoto, i32 0, i32 %sub206
  %150 = load i8, i8* %arrayidx207, align 1
  %conv208 = sext i8 %150 to i32
  %151 = load i16*, i16** %yyssp, align 4
  %152 = load i16, i16* %151, align 2
  %conv209 = sext i16 %152 to i32
  %add210 = add nsw i32 %conv208, %conv209
  store i32 %add210, i32* %yystate, align 4
  %153 = load i32, i32* %yystate, align 4
  %cmp211 = icmp sle i32 0, %153
  br i1 %cmp211, label %land.lhs.true, label %if.else224

land.lhs.true:                                    ; preds = %sw.epilog
  %154 = load i32, i32* %yystate, align 4
  %cmp213 = icmp sle i32 %154, 54
  br i1 %cmp213, label %land.lhs.true215, label %if.else224

land.lhs.true215:                                 ; preds = %land.lhs.true
  %155 = load i32, i32* %yystate, align 4
  %arrayidx216 = getelementptr inbounds [55 x i8], [55 x i8]* @yycheck, i32 0, i32 %155
  %156 = load i8, i8* %arrayidx216, align 1
  %conv217 = sext i8 %156 to i32
  %157 = load i16*, i16** %yyssp, align 4
  %158 = load i16, i16* %157, align 2
  %conv218 = sext i16 %158 to i32
  %cmp219 = icmp eq i32 %conv217, %conv218
  br i1 %cmp219, label %if.then221, label %if.else224

if.then221:                                       ; preds = %land.lhs.true215
  %159 = load i32, i32* %yystate, align 4
  %arrayidx222 = getelementptr inbounds [55 x i8], [55 x i8]* @yytable, i32 0, i32 %159
  %160 = load i8, i8* %arrayidx222, align 1
  %conv223 = zext i8 %160 to i32
  store i32 %conv223, i32* %yystate, align 4
  br label %if.end228

if.else224:                                       ; preds = %land.lhs.true215, %land.lhs.true, %sw.epilog
  %161 = load i32, i32* %yyn, align 4
  %sub225 = sub nsw i32 %161, 16
  %arrayidx226 = getelementptr inbounds [3 x i8], [3 x i8]* @yydefgoto, i32 0, i32 %sub225
  %162 = load i8, i8* %arrayidx226, align 1
  %conv227 = sext i8 %162 to i32
  store i32 %conv227, i32* %yystate, align 4
  br label %if.end228

if.end228:                                        ; preds = %if.else224, %if.then221
  br label %yynewstate

yyerrlab:                                         ; preds = %if.then107, %if.then88
  %163 = load i32, i32* %yyerrstatus, align 4
  %tobool229 = icmp ne i32 %163, 0
  br i1 %tobool229, label %if.end231, label %if.then230

if.then230:                                       ; preds = %yyerrlab
  %164 = load i32, i32* %__gettextnerrs, align 4
  %inc = add nsw i32 %164, 1
  store i32 %inc, i32* %__gettextnerrs, align 4
  call void @__gettexterror(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str, i32 0, i32 0))
  br label %if.end231

if.end231:                                        ; preds = %if.then230, %yyerrlab
  %165 = load i32, i32* %yyerrstatus, align 4
  %cmp232 = icmp eq i32 %165, 3
  br i1 %cmp232, label %if.then234, label %if.end252

if.then234:                                       ; preds = %if.end231
  %166 = load i32, i32* %__gettextchar, align 4
  %cmp235 = icmp sle i32 %166, 0
  br i1 %cmp235, label %if.then237, label %if.else250

if.then237:                                       ; preds = %if.then234
  %167 = load i32, i32* %__gettextchar, align 4
  %cmp238 = icmp eq i32 %167, 0
  br i1 %cmp238, label %if.then240, label %if.end249

if.then240:                                       ; preds = %if.then237
  br label %for.cond

for.cond:                                         ; preds = %if.end246, %if.then240
  %168 = load %union.YYSTYPE*, %union.YYSTYPE** %yyvsp, align 4
  %incdec.ptr241 = getelementptr inbounds %union.YYSTYPE, %union.YYSTYPE* %168, i32 -1
  store %union.YYSTYPE* %incdec.ptr241, %union.YYSTYPE** %yyvsp, align 4
  %169 = load i16*, i16** %yyssp, align 4
  %incdec.ptr242 = getelementptr inbounds i16, i16* %169, i32 -1
  store i16* %incdec.ptr242, i16** %yyssp, align 4
  %170 = load i16*, i16** %yyssp, align 4
  %171 = load i16*, i16** %yyss, align 4
  %cmp243 = icmp eq i16* %170, %171
  br i1 %cmp243, label %if.then245, label %if.end246

if.then245:                                       ; preds = %for.cond
  br label %yyabortlab

if.end246:                                        ; preds = %for.cond
  %172 = load i16*, i16** %yyssp, align 4
  %173 = load i16, i16* %172, align 2
  %idxprom = sext i16 %173 to i32
  %arrayidx247 = getelementptr inbounds [27 x i8], [27 x i8]* @yystos, i32 0, i32 %idxprom
  %174 = load i8, i8* %arrayidx247, align 1
  %conv248 = zext i8 %174 to i32
  %175 = load %union.YYSTYPE*, %union.YYSTYPE** %yyvsp, align 4
  call void @yydestruct(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1, i32 0, i32 0), i32 %conv248, %union.YYSTYPE* %175)
  br label %for.cond

if.end249:                                        ; preds = %if.then237
  br label %if.end251

if.else250:                                       ; preds = %if.then234
  %176 = load i32, i32* %yytoken, align 4
  call void @yydestruct(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i32 0, i32 0), i32 %176, %union.YYSTYPE* %__gettextlval)
  store i32 -2, i32* %__gettextchar, align 4
  br label %if.end251

if.end251:                                        ; preds = %if.else250, %if.end249
  br label %if.end252

if.end252:                                        ; preds = %if.end251, %if.end231
  br label %yyerrlab1

yyerrorlab:                                       ; No predecessors!
  %177 = load i32, i32* %yylen, align 4
  %178 = load %union.YYSTYPE*, %union.YYSTYPE** %yyvsp, align 4
  %idx.neg253 = sub i32 0, %177
  %add.ptr254 = getelementptr inbounds %union.YYSTYPE, %union.YYSTYPE* %178, i32 %idx.neg253
  store %union.YYSTYPE* %add.ptr254, %union.YYSTYPE** %yyvsp, align 4
  %179 = load i32, i32* %yylen, align 4
  %180 = load i16*, i16** %yyssp, align 4
  %idx.neg255 = sub i32 0, %179
  %add.ptr256 = getelementptr inbounds i16, i16* %180, i32 %idx.neg255
  store i16* %add.ptr256, i16** %yyssp, align 4
  %181 = load i16*, i16** %yyssp, align 4
  %182 = load i16, i16* %181, align 2
  %conv257 = sext i16 %182 to i32
  store i32 %conv257, i32* %yystate, align 4
  br label %yyerrlab1

yyerrlab1:                                        ; preds = %yyerrorlab, %if.end252
  store i32 3, i32* %yyerrstatus, align 4
  br label %for.cond258

for.cond258:                                      ; preds = %if.end287, %yyerrlab1
  %183 = load i32, i32* %yystate, align 4
  %arrayidx259 = getelementptr inbounds [27 x i8], [27 x i8]* @yypact, i32 0, i32 %183
  %184 = load i8, i8* %arrayidx259, align 1
  %conv260 = sext i8 %184 to i32
  store i32 %conv260, i32* %yyn, align 4
  %185 = load i32, i32* %yyn, align 4
  %cmp261 = icmp ne i32 %185, -10
  br i1 %cmp261, label %if.then263, label %if.end283

if.then263:                                       ; preds = %for.cond258
  %186 = load i32, i32* %yyn, align 4
  %add264 = add nsw i32 %186, 1
  store i32 %add264, i32* %yyn, align 4
  %187 = load i32, i32* %yyn, align 4
  %cmp265 = icmp sle i32 0, %187
  br i1 %cmp265, label %land.lhs.true267, label %if.end282

land.lhs.true267:                                 ; preds = %if.then263
  %188 = load i32, i32* %yyn, align 4
  %cmp268 = icmp sle i32 %188, 54
  br i1 %cmp268, label %land.lhs.true270, label %if.end282

land.lhs.true270:                                 ; preds = %land.lhs.true267
  %189 = load i32, i32* %yyn, align 4
  %arrayidx271 = getelementptr inbounds [55 x i8], [55 x i8]* @yycheck, i32 0, i32 %189
  %190 = load i8, i8* %arrayidx271, align 1
  %conv272 = sext i8 %190 to i32
  %cmp273 = icmp eq i32 %conv272, 1
  br i1 %cmp273, label %if.then275, label %if.end282

if.then275:                                       ; preds = %land.lhs.true270
  %191 = load i32, i32* %yyn, align 4
  %arrayidx276 = getelementptr inbounds [55 x i8], [55 x i8]* @yytable, i32 0, i32 %191
  %192 = load i8, i8* %arrayidx276, align 1
  %conv277 = zext i8 %192 to i32
  store i32 %conv277, i32* %yyn, align 4
  %193 = load i32, i32* %yyn, align 4
  %cmp278 = icmp slt i32 0, %193
  br i1 %cmp278, label %if.then280, label %if.end281

if.then280:                                       ; preds = %if.then275
  br label %for.end

if.end281:                                        ; preds = %if.then275
  br label %if.end282

if.end282:                                        ; preds = %if.end281, %land.lhs.true270, %land.lhs.true267, %if.then263
  br label %if.end283

if.end283:                                        ; preds = %if.end282, %for.cond258
  %194 = load i16*, i16** %yyssp, align 4
  %195 = load i16*, i16** %yyss, align 4
  %cmp284 = icmp eq i16* %194, %195
  br i1 %cmp284, label %if.then286, label %if.end287

if.then286:                                       ; preds = %if.end283
  br label %yyabortlab

if.end287:                                        ; preds = %if.end283
  %196 = load i32, i32* %yystate, align 4
  %arrayidx288 = getelementptr inbounds [27 x i8], [27 x i8]* @yystos, i32 0, i32 %196
  %197 = load i8, i8* %arrayidx288, align 1
  %conv289 = zext i8 %197 to i32
  %198 = load %union.YYSTYPE*, %union.YYSTYPE** %yyvsp, align 4
  call void @yydestruct(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1, i32 0, i32 0), i32 %conv289, %union.YYSTYPE* %198)
  %199 = load %union.YYSTYPE*, %union.YYSTYPE** %yyvsp, align 4
  %incdec.ptr290 = getelementptr inbounds %union.YYSTYPE, %union.YYSTYPE* %199, i32 -1
  store %union.YYSTYPE* %incdec.ptr290, %union.YYSTYPE** %yyvsp, align 4
  %200 = load i16*, i16** %yyssp, align 4
  %incdec.ptr291 = getelementptr inbounds i16, i16* %200, i32 -1
  store i16* %incdec.ptr291, i16** %yyssp, align 4
  %201 = load i16*, i16** %yyssp, align 4
  %202 = load i16, i16* %201, align 2
  %conv292 = sext i16 %202 to i32
  store i32 %conv292, i32* %yystate, align 4
  br label %for.cond258

for.end:                                          ; preds = %if.then280
  %203 = load i32, i32* %yyn, align 4
  %cmp293 = icmp eq i32 %203, 9
  br i1 %cmp293, label %if.then295, label %if.end296

if.then295:                                       ; preds = %for.end
  br label %yyacceptlab

if.end296:                                        ; preds = %for.end
  %204 = load %union.YYSTYPE*, %union.YYSTYPE** %yyvsp, align 4
  %incdec.ptr297 = getelementptr inbounds %union.YYSTYPE, %union.YYSTYPE* %204, i32 1
  store %union.YYSTYPE* %incdec.ptr297, %union.YYSTYPE** %yyvsp, align 4
  %205 = bitcast %union.YYSTYPE* %incdec.ptr297 to i8*
  %206 = bitcast %union.YYSTYPE* %__gettextlval to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %205, i8* %206, i32 4, i32 4, i1 false)
  %207 = load i32, i32* %yyn, align 4
  store i32 %207, i32* %yystate, align 4
  br label %yynewstate

yyacceptlab:                                      ; preds = %if.then295, %if.then93
  store i32 0, i32* %yyresult, align 4
  br label %yyreturn

yyabortlab:                                       ; preds = %if.then286, %if.then245, %if.then116, %if.then44
  %208 = load i32, i32* %yytoken, align 4
  call void @yydestruct(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.3, i32 0, i32 0), i32 %208, %union.YYSTYPE* %__gettextlval)
  store i32 -2, i32* %__gettextchar, align 4
  store i32 1, i32* %yyresult, align 4
  br label %yyreturn

yyoverflowlab:                                    ; preds = %if.then13, %if.then6
  call void @__gettexterror(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.4, i32 0, i32 0))
  store i32 2, i32* %yyresult, align 4
  br label %yyreturn

yyreturn:                                         ; preds = %yyoverflowlab, %yyabortlab, %yyacceptlab
  %209 = load i16*, i16** %yyss, align 4
  %arraydecay298 = getelementptr inbounds [200 x i16], [200 x i16]* %yyssa, i32 0, i32 0
  %cmp299 = icmp ne i16* %209, %arraydecay298
  br i1 %cmp299, label %if.then301, label %if.end302

if.then301:                                       ; preds = %yyreturn
  %210 = load i16*, i16** %yyss, align 4
  %211 = bitcast i16* %210 to i8*
  call void @free(i8* %211)
  br label %if.end302

if.end302:                                        ; preds = %if.then301, %yyreturn
  %212 = load i32, i32* %yyresult, align 4
  ret i32 %212
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* nocapture writeonly, i8* nocapture readonly, i32, i32, i1) #1

declare i8* @malloc(i32) #2

declare void @free(i8*) #2

; Function Attrs: noinline nounwind
define internal i32 @__gettextlex(%union.YYSTYPE* %lval, i8** %pexp) #0 {
entry:
  %retval = alloca i32, align 4
  %lval.addr = alloca %union.YYSTYPE*, align 4
  %pexp.addr = alloca i8**, align 4
  %exp = alloca i8*, align 4
  %result = alloca i32, align 4
  %n = alloca i32, align 4
  store %union.YYSTYPE* %lval, %union.YYSTYPE** %lval.addr, align 4
  store i8** %pexp, i8*** %pexp.addr, align 4
  %0 = load i8**, i8*** %pexp.addr, align 4
  %1 = load i8*, i8** %0, align 4
  store i8* %1, i8** %exp, align 4
  br label %while.body

while.body:                                       ; preds = %entry, %if.end11
  %2 = load i8*, i8** %exp, align 4
  %arrayidx = getelementptr inbounds i8, i8* %2, i32 0
  %3 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %3 to i32
  %cmp = icmp eq i32 %conv, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %while.body
  %4 = load i8*, i8** %exp, align 4
  %5 = load i8**, i8*** %pexp.addr, align 4
  store i8* %4, i8** %5, align 4
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %while.body
  %6 = load i8*, i8** %exp, align 4
  %arrayidx2 = getelementptr inbounds i8, i8* %6, i32 0
  %7 = load i8, i8* %arrayidx2, align 1
  %conv3 = sext i8 %7 to i32
  %cmp4 = icmp ne i32 %conv3, 32
  br i1 %cmp4, label %land.lhs.true, label %if.end11

land.lhs.true:                                    ; preds = %if.end
  %8 = load i8*, i8** %exp, align 4
  %arrayidx6 = getelementptr inbounds i8, i8* %8, i32 0
  %9 = load i8, i8* %arrayidx6, align 1
  %conv7 = sext i8 %9 to i32
  %cmp8 = icmp ne i32 %conv7, 9
  br i1 %cmp8, label %if.then10, label %if.end11

if.then10:                                        ; preds = %land.lhs.true
  br label %while.end

if.end11:                                         ; preds = %land.lhs.true, %if.end
  %10 = load i8*, i8** %exp, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %10, i32 1
  store i8* %incdec.ptr, i8** %exp, align 4
  br label %while.body

while.end:                                        ; preds = %if.then10
  %11 = load i8*, i8** %exp, align 4
  %incdec.ptr12 = getelementptr inbounds i8, i8* %11, i32 1
  store i8* %incdec.ptr12, i8** %exp, align 4
  %12 = load i8, i8* %11, align 1
  %conv13 = sext i8 %12 to i32
  store i32 %conv13, i32* %result, align 4
  %13 = load i32, i32* %result, align 4
  switch i32 %13, label %sw.default [
    i32 48, label %sw.bb
    i32 49, label %sw.bb
    i32 50, label %sw.bb
    i32 51, label %sw.bb
    i32 52, label %sw.bb
    i32 53, label %sw.bb
    i32 54, label %sw.bb
    i32 55, label %sw.bb
    i32 56, label %sw.bb
    i32 57, label %sw.bb
    i32 61, label %sw.bb28
    i32 33, label %sw.bb36
    i32 38, label %sw.bb45
    i32 124, label %sw.bb45
    i32 60, label %sw.bb54
    i32 62, label %sw.bb65
    i32 42, label %sw.bb76
    i32 47, label %sw.bb78
    i32 37, label %sw.bb80
    i32 43, label %sw.bb82
    i32 45, label %sw.bb84
    i32 110, label %sw.bb86
    i32 63, label %sw.bb86
    i32 58, label %sw.bb86
    i32 40, label %sw.bb86
    i32 41, label %sw.bb86
    i32 59, label %sw.bb87
    i32 10, label %sw.bb87
    i32 0, label %sw.bb87
  ]

sw.bb:                                            ; preds = %while.end, %while.end, %while.end, %while.end, %while.end, %while.end, %while.end, %while.end, %while.end, %while.end
  %14 = load i32, i32* %result, align 4
  %sub = sub nsw i32 %14, 48
  store i32 %sub, i32* %n, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body22, %sw.bb
  %15 = load i8*, i8** %exp, align 4
  %arrayidx14 = getelementptr inbounds i8, i8* %15, i32 0
  %16 = load i8, i8* %arrayidx14, align 1
  %conv15 = sext i8 %16 to i32
  %cmp16 = icmp sge i32 %conv15, 48
  br i1 %cmp16, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond
  %17 = load i8*, i8** %exp, align 4
  %arrayidx18 = getelementptr inbounds i8, i8* %17, i32 0
  %18 = load i8, i8* %arrayidx18, align 1
  %conv19 = sext i8 %18 to i32
  %cmp20 = icmp sle i32 %conv19, 57
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %19 = phi i1 [ false, %while.cond ], [ %cmp20, %land.rhs ]
  br i1 %19, label %while.body22, label %while.end27

while.body22:                                     ; preds = %land.end
  %20 = load i32, i32* %n, align 4
  %mul = mul i32 %20, 10
  store i32 %mul, i32* %n, align 4
  %21 = load i8*, i8** %exp, align 4
  %arrayidx23 = getelementptr inbounds i8, i8* %21, i32 0
  %22 = load i8, i8* %arrayidx23, align 1
  %conv24 = sext i8 %22 to i32
  %sub25 = sub nsw i32 %conv24, 48
  %23 = load i32, i32* %n, align 4
  %add = add i32 %23, %sub25
  store i32 %add, i32* %n, align 4
  %24 = load i8*, i8** %exp, align 4
  %incdec.ptr26 = getelementptr inbounds i8, i8* %24, i32 1
  store i8* %incdec.ptr26, i8** %exp, align 4
  br label %while.cond

while.end27:                                      ; preds = %land.end
  %25 = load i32, i32* %n, align 4
  %26 = load %union.YYSTYPE*, %union.YYSTYPE** %lval.addr, align 4
  %num = bitcast %union.YYSTYPE* %26 to i32*
  store i32 %25, i32* %num, align 4
  store i32 262, i32* %result, align 4
  br label %sw.epilog

sw.bb28:                                          ; preds = %while.end
  %27 = load i8*, i8** %exp, align 4
  %arrayidx29 = getelementptr inbounds i8, i8* %27, i32 0
  %28 = load i8, i8* %arrayidx29, align 1
  %conv30 = sext i8 %28 to i32
  %cmp31 = icmp eq i32 %conv30, 61
  br i1 %cmp31, label %if.then33, label %if.else

if.then33:                                        ; preds = %sw.bb28
  %29 = load i8*, i8** %exp, align 4
  %incdec.ptr34 = getelementptr inbounds i8, i8* %29, i32 1
  store i8* %incdec.ptr34, i8** %exp, align 4
  %30 = load %union.YYSTYPE*, %union.YYSTYPE** %lval.addr, align 4
  %op = bitcast %union.YYSTYPE* %30 to i32*
  store i32 12, i32* %op, align 4
  store i32 258, i32* %result, align 4
  br label %if.end35

if.else:                                          ; preds = %sw.bb28
  store i32 256, i32* %result, align 4
  br label %if.end35

if.end35:                                         ; preds = %if.else, %if.then33
  br label %sw.epilog

sw.bb36:                                          ; preds = %while.end
  %31 = load i8*, i8** %exp, align 4
  %arrayidx37 = getelementptr inbounds i8, i8* %31, i32 0
  %32 = load i8, i8* %arrayidx37, align 1
  %conv38 = sext i8 %32 to i32
  %cmp39 = icmp eq i32 %conv38, 61
  br i1 %cmp39, label %if.then41, label %if.end44

if.then41:                                        ; preds = %sw.bb36
  %33 = load i8*, i8** %exp, align 4
  %incdec.ptr42 = getelementptr inbounds i8, i8* %33, i32 1
  store i8* %incdec.ptr42, i8** %exp, align 4
  %34 = load %union.YYSTYPE*, %union.YYSTYPE** %lval.addr, align 4
  %op43 = bitcast %union.YYSTYPE* %34 to i32*
  store i32 13, i32* %op43, align 4
  store i32 258, i32* %result, align 4
  br label %if.end44

if.end44:                                         ; preds = %if.then41, %sw.bb36
  br label %sw.epilog

sw.bb45:                                          ; preds = %while.end, %while.end
  %35 = load i8*, i8** %exp, align 4
  %arrayidx46 = getelementptr inbounds i8, i8* %35, i32 0
  %36 = load i8, i8* %arrayidx46, align 1
  %conv47 = sext i8 %36 to i32
  %37 = load i32, i32* %result, align 4
  %cmp48 = icmp eq i32 %conv47, %37
  br i1 %cmp48, label %if.then50, label %if.else52

if.then50:                                        ; preds = %sw.bb45
  %38 = load i8*, i8** %exp, align 4
  %incdec.ptr51 = getelementptr inbounds i8, i8* %38, i32 1
  store i8* %incdec.ptr51, i8** %exp, align 4
  br label %if.end53

if.else52:                                        ; preds = %sw.bb45
  store i32 256, i32* %result, align 4
  br label %if.end53

if.end53:                                         ; preds = %if.else52, %if.then50
  br label %sw.epilog

sw.bb54:                                          ; preds = %while.end
  %39 = load i8*, i8** %exp, align 4
  %arrayidx55 = getelementptr inbounds i8, i8* %39, i32 0
  %40 = load i8, i8* %arrayidx55, align 1
  %conv56 = sext i8 %40 to i32
  %cmp57 = icmp eq i32 %conv56, 61
  br i1 %cmp57, label %if.then59, label %if.else62

if.then59:                                        ; preds = %sw.bb54
  %41 = load i8*, i8** %exp, align 4
  %incdec.ptr60 = getelementptr inbounds i8, i8* %41, i32 1
  store i8* %incdec.ptr60, i8** %exp, align 4
  %42 = load %union.YYSTYPE*, %union.YYSTYPE** %lval.addr, align 4
  %op61 = bitcast %union.YYSTYPE* %42 to i32*
  store i32 10, i32* %op61, align 4
  br label %if.end64

if.else62:                                        ; preds = %sw.bb54
  %43 = load %union.YYSTYPE*, %union.YYSTYPE** %lval.addr, align 4
  %op63 = bitcast %union.YYSTYPE* %43 to i32*
  store i32 8, i32* %op63, align 4
  br label %if.end64

if.end64:                                         ; preds = %if.else62, %if.then59
  store i32 259, i32* %result, align 4
  br label %sw.epilog

sw.bb65:                                          ; preds = %while.end
  %44 = load i8*, i8** %exp, align 4
  %arrayidx66 = getelementptr inbounds i8, i8* %44, i32 0
  %45 = load i8, i8* %arrayidx66, align 1
  %conv67 = sext i8 %45 to i32
  %cmp68 = icmp eq i32 %conv67, 61
  br i1 %cmp68, label %if.then70, label %if.else73

if.then70:                                        ; preds = %sw.bb65
  %46 = load i8*, i8** %exp, align 4
  %incdec.ptr71 = getelementptr inbounds i8, i8* %46, i32 1
  store i8* %incdec.ptr71, i8** %exp, align 4
  %47 = load %union.YYSTYPE*, %union.YYSTYPE** %lval.addr, align 4
  %op72 = bitcast %union.YYSTYPE* %47 to i32*
  store i32 11, i32* %op72, align 4
  br label %if.end75

if.else73:                                        ; preds = %sw.bb65
  %48 = load %union.YYSTYPE*, %union.YYSTYPE** %lval.addr, align 4
  %op74 = bitcast %union.YYSTYPE* %48 to i32*
  store i32 9, i32* %op74, align 4
  br label %if.end75

if.end75:                                         ; preds = %if.else73, %if.then70
  store i32 259, i32* %result, align 4
  br label %sw.epilog

sw.bb76:                                          ; preds = %while.end
  %49 = load %union.YYSTYPE*, %union.YYSTYPE** %lval.addr, align 4
  %op77 = bitcast %union.YYSTYPE* %49 to i32*
  store i32 3, i32* %op77, align 4
  store i32 261, i32* %result, align 4
  br label %sw.epilog

sw.bb78:                                          ; preds = %while.end
  %50 = load %union.YYSTYPE*, %union.YYSTYPE** %lval.addr, align 4
  %op79 = bitcast %union.YYSTYPE* %50 to i32*
  store i32 4, i32* %op79, align 4
  store i32 261, i32* %result, align 4
  br label %sw.epilog

sw.bb80:                                          ; preds = %while.end
  %51 = load %union.YYSTYPE*, %union.YYSTYPE** %lval.addr, align 4
  %op81 = bitcast %union.YYSTYPE* %51 to i32*
  store i32 5, i32* %op81, align 4
  store i32 261, i32* %result, align 4
  br label %sw.epilog

sw.bb82:                                          ; preds = %while.end
  %52 = load %union.YYSTYPE*, %union.YYSTYPE** %lval.addr, align 4
  %op83 = bitcast %union.YYSTYPE* %52 to i32*
  store i32 6, i32* %op83, align 4
  store i32 260, i32* %result, align 4
  br label %sw.epilog

sw.bb84:                                          ; preds = %while.end
  %53 = load %union.YYSTYPE*, %union.YYSTYPE** %lval.addr, align 4
  %op85 = bitcast %union.YYSTYPE* %53 to i32*
  store i32 7, i32* %op85, align 4
  store i32 260, i32* %result, align 4
  br label %sw.epilog

sw.bb86:                                          ; preds = %while.end, %while.end, %while.end, %while.end, %while.end
  br label %sw.epilog

sw.bb87:                                          ; preds = %while.end, %while.end, %while.end
  %54 = load i8*, i8** %exp, align 4
  %incdec.ptr88 = getelementptr inbounds i8, i8* %54, i32 -1
  store i8* %incdec.ptr88, i8** %exp, align 4
  store i32 0, i32* %result, align 4
  br label %sw.epilog

sw.default:                                       ; preds = %while.end
  store i32 256, i32* %result, align 4
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.default, %sw.bb87, %sw.bb86, %sw.bb84, %sw.bb82, %sw.bb80, %sw.bb78, %sw.bb76, %if.end75, %if.end64, %if.end53, %if.end44, %if.end35, %while.end27
  %55 = load i8*, i8** %exp, align 4
  %56 = load i8**, i8*** %pexp.addr, align 4
  store i8* %55, i8** %56, align 4
  %57 = load i32, i32* %result, align 4
  store i32 %57, i32* %retval, align 4
  br label %return

return:                                           ; preds = %sw.epilog, %if.then
  %58 = load i32, i32* %retval, align 4
  ret i32 %58
}

; Function Attrs: noinline nounwind
define internal %struct.expression* @new_exp_3(i32 %op, %struct.expression* %bexp, %struct.expression* %tbranch, %struct.expression* %fbranch) #0 {
entry:
  %op.addr = alloca i32, align 4
  %bexp.addr = alloca %struct.expression*, align 4
  %tbranch.addr = alloca %struct.expression*, align 4
  %fbranch.addr = alloca %struct.expression*, align 4
  %args = alloca [3 x %struct.expression*], align 4
  store i32 %op, i32* %op.addr, align 4
  store %struct.expression* %bexp, %struct.expression** %bexp.addr, align 4
  store %struct.expression* %tbranch, %struct.expression** %tbranch.addr, align 4
  store %struct.expression* %fbranch, %struct.expression** %fbranch.addr, align 4
  %0 = load %struct.expression*, %struct.expression** %bexp.addr, align 4
  %arrayidx = getelementptr inbounds [3 x %struct.expression*], [3 x %struct.expression*]* %args, i32 0, i32 0
  store %struct.expression* %0, %struct.expression** %arrayidx, align 4
  %1 = load %struct.expression*, %struct.expression** %tbranch.addr, align 4
  %arrayidx1 = getelementptr inbounds [3 x %struct.expression*], [3 x %struct.expression*]* %args, i32 0, i32 1
  store %struct.expression* %1, %struct.expression** %arrayidx1, align 4
  %2 = load %struct.expression*, %struct.expression** %fbranch.addr, align 4
  %arrayidx2 = getelementptr inbounds [3 x %struct.expression*], [3 x %struct.expression*]* %args, i32 0, i32 2
  store %struct.expression* %2, %struct.expression** %arrayidx2, align 4
  %3 = load i32, i32* %op.addr, align 4
  %arraydecay = getelementptr inbounds [3 x %struct.expression*], [3 x %struct.expression*]* %args, i32 0, i32 0
  %call = call %struct.expression* @new_exp(i32 3, i32 %3, %struct.expression** %arraydecay)
  ret %struct.expression* %call
}

; Function Attrs: noinline nounwind
define internal %struct.expression* @new_exp_2(i32 %op, %struct.expression* %left, %struct.expression* %right) #0 {
entry:
  %op.addr = alloca i32, align 4
  %left.addr = alloca %struct.expression*, align 4
  %right.addr = alloca %struct.expression*, align 4
  %args = alloca [2 x %struct.expression*], align 4
  store i32 %op, i32* %op.addr, align 4
  store %struct.expression* %left, %struct.expression** %left.addr, align 4
  store %struct.expression* %right, %struct.expression** %right.addr, align 4
  %0 = load %struct.expression*, %struct.expression** %left.addr, align 4
  %arrayidx = getelementptr inbounds [2 x %struct.expression*], [2 x %struct.expression*]* %args, i32 0, i32 0
  store %struct.expression* %0, %struct.expression** %arrayidx, align 4
  %1 = load %struct.expression*, %struct.expression** %right.addr, align 4
  %arrayidx1 = getelementptr inbounds [2 x %struct.expression*], [2 x %struct.expression*]* %args, i32 0, i32 1
  store %struct.expression* %1, %struct.expression** %arrayidx1, align 4
  %2 = load i32, i32* %op.addr, align 4
  %arraydecay = getelementptr inbounds [2 x %struct.expression*], [2 x %struct.expression*]* %args, i32 0, i32 0
  %call = call %struct.expression* @new_exp(i32 2, i32 %2, %struct.expression** %arraydecay)
  ret %struct.expression* %call
}

; Function Attrs: noinline nounwind
define internal %struct.expression* @new_exp_1(i32 %op, %struct.expression* %right) #0 {
entry:
  %op.addr = alloca i32, align 4
  %right.addr = alloca %struct.expression*, align 4
  %args = alloca [1 x %struct.expression*], align 4
  store i32 %op, i32* %op.addr, align 4
  store %struct.expression* %right, %struct.expression** %right.addr, align 4
  %0 = load %struct.expression*, %struct.expression** %right.addr, align 4
  %arrayidx = getelementptr inbounds [1 x %struct.expression*], [1 x %struct.expression*]* %args, i32 0, i32 0
  store %struct.expression* %0, %struct.expression** %arrayidx, align 4
  %1 = load i32, i32* %op.addr, align 4
  %arraydecay = getelementptr inbounds [1 x %struct.expression*], [1 x %struct.expression*]* %args, i32 0, i32 0
  %call = call %struct.expression* @new_exp(i32 1, i32 %1, %struct.expression** %arraydecay)
  ret %struct.expression* %call
}

; Function Attrs: noinline nounwind
define internal %struct.expression* @new_exp_0(i32 %op) #0 {
entry:
  %op.addr = alloca i32, align 4
  store i32 %op, i32* %op.addr, align 4
  %0 = load i32, i32* %op.addr, align 4
  %call = call %struct.expression* @new_exp(i32 0, i32 %0, %struct.expression** null)
  ret %struct.expression* %call
}

; Function Attrs: noinline nounwind
define internal void @__gettexterror(i8* %str) #0 {
entry:
  %str.addr = alloca i8*, align 4
  store i8* %str, i8** %str.addr, align 4
  ret void
}

; Function Attrs: noinline nounwind
define internal void @yydestruct(i8* %yymsg, i32 %yytype, %union.YYSTYPE* %yyvaluep) #0 {
entry:
  %yymsg.addr = alloca i8*, align 4
  %yytype.addr = alloca i32, align 4
  %yyvaluep.addr = alloca %union.YYSTYPE*, align 4
  store i8* %yymsg, i8** %yymsg.addr, align 4
  store i32 %yytype, i32* %yytype.addr, align 4
  store %union.YYSTYPE* %yyvaluep, %union.YYSTYPE** %yyvaluep.addr, align 4
  %0 = load %union.YYSTYPE*, %union.YYSTYPE** %yyvaluep.addr, align 4
  %1 = load i8*, i8** %yymsg.addr, align 4
  %tobool = icmp ne i8* %1, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  store i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.5, i32 0, i32 0), i8** %yymsg.addr, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %2 = load i32, i32* %yytype.addr, align 4
  switch i32 %2, label %sw.default [
  ]

sw.default:                                       ; preds = %if.end
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.default
  ret void
}

; Function Attrs: noinline nounwind
define void @libintl_gettext_free_exp(%struct.expression* %exp) #0 {
entry:
  %exp.addr = alloca %struct.expression*, align 4
  store %struct.expression* %exp, %struct.expression** %exp.addr, align 4
  %0 = load %struct.expression*, %struct.expression** %exp.addr, align 4
  %cmp = icmp eq %struct.expression* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %return

if.end:                                           ; preds = %entry
  %1 = load %struct.expression*, %struct.expression** %exp.addr, align 4
  %nargs = getelementptr inbounds %struct.expression, %struct.expression* %1, i32 0, i32 0
  %2 = load i32, i32* %nargs, align 4
  switch i32 %2, label %sw.default [
    i32 3, label %sw.bb
    i32 2, label %sw.bb1
    i32 1, label %sw.bb5
  ]

sw.bb:                                            ; preds = %if.end
  %3 = load %struct.expression*, %struct.expression** %exp.addr, align 4
  %val = getelementptr inbounds %struct.expression, %struct.expression* %3, i32 0, i32 2
  %args = bitcast %union.anon* %val to [3 x %struct.expression*]*
  %arrayidx = getelementptr inbounds [3 x %struct.expression*], [3 x %struct.expression*]* %args, i32 0, i32 2
  %4 = load %struct.expression*, %struct.expression** %arrayidx, align 4
  call void @libintl_gettext_free_exp(%struct.expression* %4)
  br label %sw.bb1

sw.bb1:                                           ; preds = %if.end, %sw.bb
  %5 = load %struct.expression*, %struct.expression** %exp.addr, align 4
  %val2 = getelementptr inbounds %struct.expression, %struct.expression* %5, i32 0, i32 2
  %args3 = bitcast %union.anon* %val2 to [3 x %struct.expression*]*
  %arrayidx4 = getelementptr inbounds [3 x %struct.expression*], [3 x %struct.expression*]* %args3, i32 0, i32 1
  %6 = load %struct.expression*, %struct.expression** %arrayidx4, align 4
  call void @libintl_gettext_free_exp(%struct.expression* %6)
  br label %sw.bb5

sw.bb5:                                           ; preds = %if.end, %sw.bb1
  %7 = load %struct.expression*, %struct.expression** %exp.addr, align 4
  %val6 = getelementptr inbounds %struct.expression, %struct.expression* %7, i32 0, i32 2
  %args7 = bitcast %union.anon* %val6 to [3 x %struct.expression*]*
  %arrayidx8 = getelementptr inbounds [3 x %struct.expression*], [3 x %struct.expression*]* %args7, i32 0, i32 0
  %8 = load %struct.expression*, %struct.expression** %arrayidx8, align 4
  call void @libintl_gettext_free_exp(%struct.expression* %8)
  br label %sw.default

sw.default:                                       ; preds = %if.end, %sw.bb5
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.default
  %9 = load %struct.expression*, %struct.expression** %exp.addr, align 4
  %10 = bitcast %struct.expression* %9 to i8*
  call void @free(i8* %10)
  br label %return

return:                                           ; preds = %sw.epilog, %if.then
  ret void
}

; Function Attrs: noinline nounwind
define internal %struct.expression* @new_exp(i32 %nargs, i32 %op, %struct.expression** %args) #0 {
entry:
  %retval = alloca %struct.expression*, align 4
  %nargs.addr = alloca i32, align 4
  %op.addr = alloca i32, align 4
  %args.addr = alloca %struct.expression**, align 4
  %i = alloca i32, align 4
  %newp = alloca %struct.expression*, align 4
  store i32 %nargs, i32* %nargs.addr, align 4
  store i32 %op, i32* %op.addr, align 4
  store %struct.expression** %args, %struct.expression*** %args.addr, align 4
  %0 = load i32, i32* %nargs.addr, align 4
  %sub = sub nsw i32 %0, 1
  store i32 %sub, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32, i32* %i, align 4
  %cmp = icmp sge i32 %1, 0
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load %struct.expression**, %struct.expression*** %args.addr, align 4
  %3 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds %struct.expression*, %struct.expression** %2, i32 %3
  %4 = load %struct.expression*, %struct.expression** %arrayidx, align 4
  %cmp1 = icmp eq %struct.expression* %4, null
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  br label %fail

if.end:                                           ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %5 = load i32, i32* %i, align 4
  %dec = add nsw i32 %5, -1
  store i32 %dec, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %call = call i8* @malloc(i32 20)
  %6 = bitcast i8* %call to %struct.expression*
  store %struct.expression* %6, %struct.expression** %newp, align 4
  %7 = load %struct.expression*, %struct.expression** %newp, align 4
  %cmp2 = icmp ne %struct.expression* %7, null
  br i1 %cmp2, label %if.then3, label %if.end15

if.then3:                                         ; preds = %for.end
  %8 = load i32, i32* %nargs.addr, align 4
  %9 = load %struct.expression*, %struct.expression** %newp, align 4
  %nargs4 = getelementptr inbounds %struct.expression, %struct.expression* %9, i32 0, i32 0
  store i32 %8, i32* %nargs4, align 4
  %10 = load i32, i32* %op.addr, align 4
  %11 = load %struct.expression*, %struct.expression** %newp, align 4
  %operation = getelementptr inbounds %struct.expression, %struct.expression* %11, i32 0, i32 1
  store i32 %10, i32* %operation, align 4
  %12 = load i32, i32* %nargs.addr, align 4
  %sub5 = sub nsw i32 %12, 1
  store i32 %sub5, i32* %i, align 4
  br label %for.cond6

for.cond6:                                        ; preds = %for.inc12, %if.then3
  %13 = load i32, i32* %i, align 4
  %cmp7 = icmp sge i32 %13, 0
  br i1 %cmp7, label %for.body8, label %for.end14

for.body8:                                        ; preds = %for.cond6
  %14 = load %struct.expression**, %struct.expression*** %args.addr, align 4
  %15 = load i32, i32* %i, align 4
  %arrayidx9 = getelementptr inbounds %struct.expression*, %struct.expression** %14, i32 %15
  %16 = load %struct.expression*, %struct.expression** %arrayidx9, align 4
  %17 = load %struct.expression*, %struct.expression** %newp, align 4
  %val = getelementptr inbounds %struct.expression, %struct.expression* %17, i32 0, i32 2
  %args10 = bitcast %union.anon* %val to [3 x %struct.expression*]*
  %18 = load i32, i32* %i, align 4
  %arrayidx11 = getelementptr inbounds [3 x %struct.expression*], [3 x %struct.expression*]* %args10, i32 0, i32 %18
  store %struct.expression* %16, %struct.expression** %arrayidx11, align 4
  br label %for.inc12

for.inc12:                                        ; preds = %for.body8
  %19 = load i32, i32* %i, align 4
  %dec13 = add nsw i32 %19, -1
  store i32 %dec13, i32* %i, align 4
  br label %for.cond6

for.end14:                                        ; preds = %for.cond6
  %20 = load %struct.expression*, %struct.expression** %newp, align 4
  store %struct.expression* %20, %struct.expression** %retval, align 4
  br label %return

if.end15:                                         ; preds = %for.end
  br label %fail

fail:                                             ; preds = %if.end15, %if.then
  %21 = load i32, i32* %nargs.addr, align 4
  %sub16 = sub nsw i32 %21, 1
  store i32 %sub16, i32* %i, align 4
  br label %for.cond17

for.cond17:                                       ; preds = %for.inc21, %fail
  %22 = load i32, i32* %i, align 4
  %cmp18 = icmp sge i32 %22, 0
  br i1 %cmp18, label %for.body19, label %for.end23

for.body19:                                       ; preds = %for.cond17
  %23 = load %struct.expression**, %struct.expression*** %args.addr, align 4
  %24 = load i32, i32* %i, align 4
  %arrayidx20 = getelementptr inbounds %struct.expression*, %struct.expression** %23, i32 %24
  %25 = load %struct.expression*, %struct.expression** %arrayidx20, align 4
  call void @libintl_gettext_free_exp(%struct.expression* %25)
  br label %for.inc21

for.inc21:                                        ; preds = %for.body19
  %26 = load i32, i32* %i, align 4
  %dec22 = add nsw i32 %26, -1
  store i32 %dec22, i32* %i, align 4
  br label %for.cond17

for.end23:                                        ; preds = %for.cond17
  store %struct.expression* null, %struct.expression** %retval, align 4
  br label %return

return:                                           ; preds = %for.end23, %for.end14
  %27 = load %struct.expression*, %struct.expression** %retval, align 4
  ret %struct.expression* %27
}

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
