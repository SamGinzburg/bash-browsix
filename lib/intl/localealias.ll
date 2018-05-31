; ModuleID = 'localealias.c'
source_filename = "localealias.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.alias_map = type { i8*, i8* }
%struct._IO_FILE = type opaque

@_nl_expand_alias.locale_alias_path = internal global i8* null, align 4
@.str = private unnamed_addr constant [24 x i8] c"/usr/local/share/locale\00", align 1
@nmap = internal global i32 0, align 4
@map = internal global %struct.alias_map* null, align 4
@read_alias_file.aliasfile = internal constant [14 x i8] c"/locale.alias\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@maxmap = internal global i32 0, align 4
@string_space_act = internal global i32 0, align 4
@string_space_max = internal global i32 0, align 4
@string_space = internal global i8* null, align 4

; Function Attrs: noinline nounwind
define i8* @_nl_expand_alias(i8* %name) #0 {
entry:
  %name.addr = alloca i8*, align 4
  %retval1 = alloca %struct.alias_map*, align 4
  %result = alloca i8*, align 4
  %added = alloca i32, align 4
  %item = alloca %struct.alias_map, align 4
  %start = alloca i8*, align 4
  store i8* %name, i8** %name.addr, align 4
  store i8* null, i8** %result, align 4
  %0 = load i8*, i8** @_nl_expand_alias.locale_alias_path, align 4
  %cmp = icmp eq i8* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str, i32 0, i32 0), i8** @_nl_expand_alias.locale_alias_path, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  br label %do.body

do.body:                                          ; preds = %do.cond, %if.end
  %1 = load i8*, i8** %name.addr, align 4
  %alias = getelementptr inbounds %struct.alias_map, %struct.alias_map* %item, i32 0, i32 0
  store i8* %1, i8** %alias, align 4
  %2 = load i32, i32* @nmap, align 4
  %cmp2 = icmp ugt i32 %2, 0
  br i1 %cmp2, label %if.then3, label %if.else

if.then3:                                         ; preds = %do.body
  %3 = bitcast %struct.alias_map* %item to i8*
  %4 = load %struct.alias_map*, %struct.alias_map** @map, align 4
  %5 = bitcast %struct.alias_map* %4 to i8*
  %6 = load i32, i32* @nmap, align 4
  %call = call i8* @bsearch(i8* %3, i8* %5, i32 %6, i32 8, i32 (i8*, i8*)* bitcast (i32 (%struct.alias_map*, %struct.alias_map*)* @alias_compare to i32 (i8*, i8*)*))
  %7 = bitcast i8* %call to %struct.alias_map*
  store %struct.alias_map* %7, %struct.alias_map** %retval1, align 4
  br label %if.end4

if.else:                                          ; preds = %do.body
  store %struct.alias_map* null, %struct.alias_map** %retval1, align 4
  br label %if.end4

if.end4:                                          ; preds = %if.else, %if.then3
  %8 = load %struct.alias_map*, %struct.alias_map** %retval1, align 4
  %cmp5 = icmp ne %struct.alias_map* %8, null
  br i1 %cmp5, label %if.then6, label %if.end7

if.then6:                                         ; preds = %if.end4
  %9 = load %struct.alias_map*, %struct.alias_map** %retval1, align 4
  %value = getelementptr inbounds %struct.alias_map, %struct.alias_map* %9, i32 0, i32 1
  %10 = load i8*, i8** %value, align 4
  store i8* %10, i8** %result, align 4
  br label %do.end

if.end7:                                          ; preds = %if.end4
  store i32 0, i32* %added, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end35, %if.end7
  %11 = load i32, i32* %added, align 4
  %cmp8 = icmp eq i32 %11, 0
  br i1 %cmp8, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond
  %12 = load i8*, i8** @_nl_expand_alias.locale_alias_path, align 4
  %arrayidx = getelementptr inbounds i8, i8* %12, i32 0
  %13 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %13 to i32
  %cmp9 = icmp ne i32 %conv, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %14 = phi i1 [ false, %while.cond ], [ %cmp9, %land.rhs ]
  br i1 %14, label %while.body, label %while.end36

while.body:                                       ; preds = %land.end
  br label %while.cond11

while.cond11:                                     ; preds = %while.body16, %while.body
  %15 = load i8*, i8** @_nl_expand_alias.locale_alias_path, align 4
  %arrayidx12 = getelementptr inbounds i8, i8* %15, i32 0
  %16 = load i8, i8* %arrayidx12, align 1
  %conv13 = sext i8 %16 to i32
  %cmp14 = icmp eq i32 %conv13, 58
  br i1 %cmp14, label %while.body16, label %while.end

while.body16:                                     ; preds = %while.cond11
  %17 = load i8*, i8** @_nl_expand_alias.locale_alias_path, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %17, i32 1
  store i8* %incdec.ptr, i8** @_nl_expand_alias.locale_alias_path, align 4
  br label %while.cond11

while.end:                                        ; preds = %while.cond11
  %18 = load i8*, i8** @_nl_expand_alias.locale_alias_path, align 4
  store i8* %18, i8** %start, align 4
  br label %while.cond17

while.cond17:                                     ; preds = %while.body28, %while.end
  %19 = load i8*, i8** @_nl_expand_alias.locale_alias_path, align 4
  %arrayidx18 = getelementptr inbounds i8, i8* %19, i32 0
  %20 = load i8, i8* %arrayidx18, align 1
  %conv19 = sext i8 %20 to i32
  %cmp20 = icmp ne i32 %conv19, 0
  br i1 %cmp20, label %land.rhs22, label %land.end27

land.rhs22:                                       ; preds = %while.cond17
  %21 = load i8*, i8** @_nl_expand_alias.locale_alias_path, align 4
  %arrayidx23 = getelementptr inbounds i8, i8* %21, i32 0
  %22 = load i8, i8* %arrayidx23, align 1
  %conv24 = sext i8 %22 to i32
  %cmp25 = icmp ne i32 %conv24, 58
  br label %land.end27

land.end27:                                       ; preds = %land.rhs22, %while.cond17
  %23 = phi i1 [ false, %while.cond17 ], [ %cmp25, %land.rhs22 ]
  br i1 %23, label %while.body28, label %while.end30

while.body28:                                     ; preds = %land.end27
  %24 = load i8*, i8** @_nl_expand_alias.locale_alias_path, align 4
  %incdec.ptr29 = getelementptr inbounds i8, i8* %24, i32 1
  store i8* %incdec.ptr29, i8** @_nl_expand_alias.locale_alias_path, align 4
  br label %while.cond17

while.end30:                                      ; preds = %land.end27
  %25 = load i8*, i8** %start, align 4
  %26 = load i8*, i8** @_nl_expand_alias.locale_alias_path, align 4
  %cmp31 = icmp ult i8* %25, %26
  br i1 %cmp31, label %if.then33, label %if.end35

if.then33:                                        ; preds = %while.end30
  %27 = load i8*, i8** %start, align 4
  %28 = load i8*, i8** @_nl_expand_alias.locale_alias_path, align 4
  %29 = load i8*, i8** %start, align 4
  %sub.ptr.lhs.cast = ptrtoint i8* %28 to i32
  %sub.ptr.rhs.cast = ptrtoint i8* %29 to i32
  %sub.ptr.sub = sub i32 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %call34 = call i32 @read_alias_file(i8* %27, i32 %sub.ptr.sub)
  store i32 %call34, i32* %added, align 4
  br label %if.end35

if.end35:                                         ; preds = %if.then33, %while.end30
  br label %while.cond

while.end36:                                      ; preds = %land.end
  br label %do.cond

do.cond:                                          ; preds = %while.end36
  %30 = load i32, i32* %added, align 4
  %cmp37 = icmp ne i32 %30, 0
  br i1 %cmp37, label %do.body, label %do.end

do.end:                                           ; preds = %do.cond, %if.then6
  %31 = load i8*, i8** %result, align 4
  ret i8* %31
}

declare i8* @bsearch(i8*, i8*, i32, i32, i32 (i8*, i8*)*) #1

; Function Attrs: noinline nounwind
define internal i32 @alias_compare(%struct.alias_map* %map1, %struct.alias_map* %map2) #0 {
entry:
  %map1.addr = alloca %struct.alias_map*, align 4
  %map2.addr = alloca %struct.alias_map*, align 4
  store %struct.alias_map* %map1, %struct.alias_map** %map1.addr, align 4
  store %struct.alias_map* %map2, %struct.alias_map** %map2.addr, align 4
  %0 = load %struct.alias_map*, %struct.alias_map** %map1.addr, align 4
  %alias = getelementptr inbounds %struct.alias_map, %struct.alias_map* %0, i32 0, i32 0
  %1 = load i8*, i8** %alias, align 4
  %2 = load %struct.alias_map*, %struct.alias_map** %map2.addr, align 4
  %alias1 = getelementptr inbounds %struct.alias_map, %struct.alias_map* %2, i32 0, i32 0
  %3 = load i8*, i8** %alias1, align 4
  %call = call i32 @strcasecmp(i8* %1, i8* %3)
  ret i32 %call
}

; Function Attrs: noinline nounwind
define internal i32 @read_alias_file(i8* %fname, i32 %fname_len) #0 {
entry:
  %retval = alloca i32, align 4
  %fname.addr = alloca i8*, align 4
  %fname_len.addr = alloca i32, align 4
  %fp = alloca %struct._IO_FILE*, align 4
  %full_fname = alloca i8*, align 4
  %added = alloca i32, align 4
  %buf = alloca [400 x i8], align 1
  %alias = alloca i8*, align 4
  %value = alloca i8*, align 4
  %cp = alloca i8*, align 4
  %alias_len = alloca i32, align 4
  %value_len = alloca i32, align 4
  %new_size = alloca i32, align 4
  %new_pool = alloca i8*, align 4
  %i = alloca i32, align 4
  store i8* %fname, i8** %fname.addr, align 4
  store i32 %fname_len, i32* %fname_len.addr, align 4
  %0 = load i32, i32* %fname_len.addr, align 4
  %add = add i32 %0, 14
  %1 = alloca i8, i32 %add, align 8
  store i8* %1, i8** %full_fname, align 4
  %2 = load i8*, i8** %full_fname, align 4
  %3 = load i8*, i8** %fname.addr, align 4
  %4 = load i32, i32* %fname_len.addr, align 4
  %call = call i8* @mempcpy(i8* %2, i8* %3, i32 %4)
  %call1 = call i8* @mempcpy(i8* %call, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @read_alias_file.aliasfile, i32 0, i32 0), i32 14)
  %5 = load i8*, i8** %full_fname, align 4
  %call2 = call i8* @libintl_relocate(i8* %5)
  %call3 = call %struct._IO_FILE* @fopen(i8* %call2, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i32 0, i32 0))
  store %struct._IO_FILE* %call3, %struct._IO_FILE** %fp, align 4
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 4
  %cmp = icmp eq %struct._IO_FILE* %6, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  store i32 0, i32* %added, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.end155, %if.end
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 4
  %call4 = call i32 @feof(%struct._IO_FILE* %7)
  %tobool = icmp ne i32 %call4, 0
  %lnot = xor i1 %tobool, true
  br i1 %lnot, label %while.body, label %while.end156

while.body:                                       ; preds = %while.cond
  %arraydecay = getelementptr inbounds [400 x i8], [400 x i8]* %buf, i32 0, i32 0
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 4
  %call5 = call i8* @fgets(i8* %arraydecay, i32 400, %struct._IO_FILE* %8)
  %cmp6 = icmp eq i8* %call5, null
  br i1 %cmp6, label %if.then7, label %if.end8

if.then7:                                         ; preds = %while.body
  br label %while.end156

if.end8:                                          ; preds = %while.body
  %arraydecay9 = getelementptr inbounds [400 x i8], [400 x i8]* %buf, i32 0, i32 0
  store i8* %arraydecay9, i8** %cp, align 4
  br label %while.cond10

while.cond10:                                     ; preds = %while.body13, %if.end8
  %9 = load i8*, i8** %cp, align 4
  %arrayidx = getelementptr inbounds i8, i8* %9, i32 0
  %10 = load i8, i8* %arrayidx, align 1
  %conv = zext i8 %10 to i32
  %call11 = call i32 @isspace(i32 %conv) #4
  %tobool12 = icmp ne i32 %call11, 0
  br i1 %tobool12, label %while.body13, label %while.end

while.body13:                                     ; preds = %while.cond10
  %11 = load i8*, i8** %cp, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %11, i32 1
  store i8* %incdec.ptr, i8** %cp, align 4
  br label %while.cond10

while.end:                                        ; preds = %while.cond10
  %12 = load i8*, i8** %cp, align 4
  %arrayidx14 = getelementptr inbounds i8, i8* %12, i32 0
  %13 = load i8, i8* %arrayidx14, align 1
  %conv15 = sext i8 %13 to i32
  %cmp16 = icmp ne i32 %conv15, 0
  br i1 %cmp16, label %land.lhs.true, label %if.end142

land.lhs.true:                                    ; preds = %while.end
  %14 = load i8*, i8** %cp, align 4
  %arrayidx18 = getelementptr inbounds i8, i8* %14, i32 0
  %15 = load i8, i8* %arrayidx18, align 1
  %conv19 = sext i8 %15 to i32
  %cmp20 = icmp ne i32 %conv19, 35
  br i1 %cmp20, label %if.then22, label %if.end142

if.then22:                                        ; preds = %land.lhs.true
  %16 = load i8*, i8** %cp, align 4
  %incdec.ptr23 = getelementptr inbounds i8, i8* %16, i32 1
  store i8* %incdec.ptr23, i8** %cp, align 4
  store i8* %16, i8** %alias, align 4
  br label %while.cond24

while.cond24:                                     ; preds = %while.body34, %if.then22
  %17 = load i8*, i8** %cp, align 4
  %arrayidx25 = getelementptr inbounds i8, i8* %17, i32 0
  %18 = load i8, i8* %arrayidx25, align 1
  %conv26 = sext i8 %18 to i32
  %cmp27 = icmp ne i32 %conv26, 0
  br i1 %cmp27, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond24
  %19 = load i8*, i8** %cp, align 4
  %arrayidx29 = getelementptr inbounds i8, i8* %19, i32 0
  %20 = load i8, i8* %arrayidx29, align 1
  %conv30 = zext i8 %20 to i32
  %call31 = call i32 @isspace(i32 %conv30) #4
  %tobool32 = icmp ne i32 %call31, 0
  %lnot33 = xor i1 %tobool32, true
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond24
  %21 = phi i1 [ false, %while.cond24 ], [ %lnot33, %land.rhs ]
  br i1 %21, label %while.body34, label %while.end36

while.body34:                                     ; preds = %land.end
  %22 = load i8*, i8** %cp, align 4
  %incdec.ptr35 = getelementptr inbounds i8, i8* %22, i32 1
  store i8* %incdec.ptr35, i8** %cp, align 4
  br label %while.cond24

while.end36:                                      ; preds = %land.end
  %23 = load i8*, i8** %cp, align 4
  %arrayidx37 = getelementptr inbounds i8, i8* %23, i32 0
  %24 = load i8, i8* %arrayidx37, align 1
  %conv38 = sext i8 %24 to i32
  %cmp39 = icmp ne i32 %conv38, 0
  br i1 %cmp39, label %if.then41, label %if.end43

if.then41:                                        ; preds = %while.end36
  %25 = load i8*, i8** %cp, align 4
  %incdec.ptr42 = getelementptr inbounds i8, i8* %25, i32 1
  store i8* %incdec.ptr42, i8** %cp, align 4
  store i8 0, i8* %25, align 1
  br label %if.end43

if.end43:                                         ; preds = %if.then41, %while.end36
  br label %while.cond44

while.cond44:                                     ; preds = %while.body49, %if.end43
  %26 = load i8*, i8** %cp, align 4
  %arrayidx45 = getelementptr inbounds i8, i8* %26, i32 0
  %27 = load i8, i8* %arrayidx45, align 1
  %conv46 = zext i8 %27 to i32
  %call47 = call i32 @isspace(i32 %conv46) #4
  %tobool48 = icmp ne i32 %call47, 0
  br i1 %tobool48, label %while.body49, label %while.end51

while.body49:                                     ; preds = %while.cond44
  %28 = load i8*, i8** %cp, align 4
  %incdec.ptr50 = getelementptr inbounds i8, i8* %28, i32 1
  store i8* %incdec.ptr50, i8** %cp, align 4
  br label %while.cond44

while.end51:                                      ; preds = %while.cond44
  %29 = load i8*, i8** %cp, align 4
  %arrayidx52 = getelementptr inbounds i8, i8* %29, i32 0
  %30 = load i8, i8* %arrayidx52, align 1
  %conv53 = sext i8 %30 to i32
  %cmp54 = icmp ne i32 %conv53, 0
  br i1 %cmp54, label %if.then56, label %if.end141

if.then56:                                        ; preds = %while.end51
  %31 = load i8*, i8** %cp, align 4
  %incdec.ptr57 = getelementptr inbounds i8, i8* %31, i32 1
  store i8* %incdec.ptr57, i8** %cp, align 4
  store i8* %31, i8** %value, align 4
  br label %while.cond58

while.cond58:                                     ; preds = %while.body70, %if.then56
  %32 = load i8*, i8** %cp, align 4
  %arrayidx59 = getelementptr inbounds i8, i8* %32, i32 0
  %33 = load i8, i8* %arrayidx59, align 1
  %conv60 = sext i8 %33 to i32
  %cmp61 = icmp ne i32 %conv60, 0
  br i1 %cmp61, label %land.rhs63, label %land.end69

land.rhs63:                                       ; preds = %while.cond58
  %34 = load i8*, i8** %cp, align 4
  %arrayidx64 = getelementptr inbounds i8, i8* %34, i32 0
  %35 = load i8, i8* %arrayidx64, align 1
  %conv65 = zext i8 %35 to i32
  %call66 = call i32 @isspace(i32 %conv65) #4
  %tobool67 = icmp ne i32 %call66, 0
  %lnot68 = xor i1 %tobool67, true
  br label %land.end69

land.end69:                                       ; preds = %land.rhs63, %while.cond58
  %36 = phi i1 [ false, %while.cond58 ], [ %lnot68, %land.rhs63 ]
  br i1 %36, label %while.body70, label %while.end72

while.body70:                                     ; preds = %land.end69
  %37 = load i8*, i8** %cp, align 4
  %incdec.ptr71 = getelementptr inbounds i8, i8* %37, i32 1
  store i8* %incdec.ptr71, i8** %cp, align 4
  br label %while.cond58

while.end72:                                      ; preds = %land.end69
  %38 = load i8*, i8** %cp, align 4
  %arrayidx73 = getelementptr inbounds i8, i8* %38, i32 0
  %39 = load i8, i8* %arrayidx73, align 1
  %conv74 = sext i8 %39 to i32
  %cmp75 = icmp eq i32 %conv74, 10
  br i1 %cmp75, label %if.then77, label %if.else

if.then77:                                        ; preds = %while.end72
  %40 = load i8*, i8** %cp, align 4
  %incdec.ptr78 = getelementptr inbounds i8, i8* %40, i32 1
  store i8* %incdec.ptr78, i8** %cp, align 4
  store i8 0, i8* %40, align 1
  %41 = load i8*, i8** %cp, align 4
  store i8 10, i8* %41, align 1
  br label %if.end86

if.else:                                          ; preds = %while.end72
  %42 = load i8*, i8** %cp, align 4
  %arrayidx79 = getelementptr inbounds i8, i8* %42, i32 0
  %43 = load i8, i8* %arrayidx79, align 1
  %conv80 = sext i8 %43 to i32
  %cmp81 = icmp ne i32 %conv80, 0
  br i1 %cmp81, label %if.then83, label %if.end85

if.then83:                                        ; preds = %if.else
  %44 = load i8*, i8** %cp, align 4
  %incdec.ptr84 = getelementptr inbounds i8, i8* %44, i32 1
  store i8* %incdec.ptr84, i8** %cp, align 4
  store i8 0, i8* %44, align 1
  br label %if.end85

if.end85:                                         ; preds = %if.then83, %if.else
  br label %if.end86

if.end86:                                         ; preds = %if.end85, %if.then77
  %45 = load i32, i32* @nmap, align 4
  %46 = load i32, i32* @maxmap, align 4
  %cmp87 = icmp uge i32 %45, %46
  br i1 %cmp87, label %if.then89, label %if.end95

if.then89:                                        ; preds = %if.end86
  %call90 = call i32 @extend_alias_table()
  %tobool91 = icmp ne i32 %call90, 0
  br i1 %tobool91, label %if.then92, label %if.end94

if.then92:                                        ; preds = %if.then89
  %47 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 4
  %call93 = call i32 @fclose(%struct._IO_FILE* %47)
  %48 = load i32, i32* %added, align 4
  store i32 %48, i32* %retval, align 4
  br label %return

if.end94:                                         ; preds = %if.then89
  br label %if.end95

if.end95:                                         ; preds = %if.end94, %if.end86
  %49 = load i8*, i8** %alias, align 4
  %call96 = call i32 @strlen(i8* %49)
  %add97 = add i32 %call96, 1
  store i32 %add97, i32* %alias_len, align 4
  %50 = load i8*, i8** %value, align 4
  %call98 = call i32 @strlen(i8* %50)
  %add99 = add i32 %call98, 1
  store i32 %add99, i32* %value_len, align 4
  %51 = load i32, i32* @string_space_act, align 4
  %52 = load i32, i32* %alias_len, align 4
  %add100 = add i32 %51, %52
  %53 = load i32, i32* %value_len, align 4
  %add101 = add i32 %add100, %53
  %54 = load i32, i32* @string_space_max, align 4
  %cmp102 = icmp ugt i32 %add101, %54
  br i1 %cmp102, label %if.then104, label %if.end130

if.then104:                                       ; preds = %if.end95
  %55 = load i32, i32* @string_space_max, align 4
  %56 = load i32, i32* %alias_len, align 4
  %57 = load i32, i32* %value_len, align 4
  %add105 = add i32 %56, %57
  %cmp106 = icmp ugt i32 %add105, 1024
  br i1 %cmp106, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then104
  %58 = load i32, i32* %alias_len, align 4
  %59 = load i32, i32* %value_len, align 4
  %add108 = add i32 %58, %59
  br label %cond.end

cond.false:                                       ; preds = %if.then104
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %add108, %cond.true ], [ 1024, %cond.false ]
  %add109 = add i32 %55, %cond
  store i32 %add109, i32* %new_size, align 4
  %60 = load i8*, i8** @string_space, align 4
  %61 = load i32, i32* %new_size, align 4
  %call110 = call i8* @realloc(i8* %60, i32 %61)
  store i8* %call110, i8** %new_pool, align 4
  %62 = load i8*, i8** %new_pool, align 4
  %cmp111 = icmp eq i8* %62, null
  br i1 %cmp111, label %if.then113, label %if.end115

if.then113:                                       ; preds = %cond.end
  %63 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 4
  %call114 = call i32 @fclose(%struct._IO_FILE* %63)
  %64 = load i32, i32* %added, align 4
  store i32 %64, i32* %retval, align 4
  br label %return

if.end115:                                        ; preds = %cond.end
  %65 = load i8*, i8** @string_space, align 4
  %66 = load i8*, i8** %new_pool, align 4
  %cmp116 = icmp ne i8* %65, %66
  br i1 %cmp116, label %if.then118, label %if.end129

if.then118:                                       ; preds = %if.end115
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then118
  %67 = load i32, i32* %i, align 4
  %68 = load i32, i32* @nmap, align 4
  %cmp119 = icmp ult i32 %67, %68
  br i1 %cmp119, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %69 = load i8*, i8** %new_pool, align 4
  %70 = load i8*, i8** @string_space, align 4
  %sub.ptr.lhs.cast = ptrtoint i8* %69 to i32
  %sub.ptr.rhs.cast = ptrtoint i8* %70 to i32
  %sub.ptr.sub = sub i32 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %71 = load %struct.alias_map*, %struct.alias_map** @map, align 4
  %72 = load i32, i32* %i, align 4
  %arrayidx121 = getelementptr inbounds %struct.alias_map, %struct.alias_map* %71, i32 %72
  %alias122 = getelementptr inbounds %struct.alias_map, %struct.alias_map* %arrayidx121, i32 0, i32 0
  %73 = load i8*, i8** %alias122, align 4
  %add.ptr = getelementptr inbounds i8, i8* %73, i32 %sub.ptr.sub
  store i8* %add.ptr, i8** %alias122, align 4
  %74 = load i8*, i8** %new_pool, align 4
  %75 = load i8*, i8** @string_space, align 4
  %sub.ptr.lhs.cast123 = ptrtoint i8* %74 to i32
  %sub.ptr.rhs.cast124 = ptrtoint i8* %75 to i32
  %sub.ptr.sub125 = sub i32 %sub.ptr.lhs.cast123, %sub.ptr.rhs.cast124
  %76 = load %struct.alias_map*, %struct.alias_map** @map, align 4
  %77 = load i32, i32* %i, align 4
  %arrayidx126 = getelementptr inbounds %struct.alias_map, %struct.alias_map* %76, i32 %77
  %value127 = getelementptr inbounds %struct.alias_map, %struct.alias_map* %arrayidx126, i32 0, i32 1
  %78 = load i8*, i8** %value127, align 4
  %add.ptr128 = getelementptr inbounds i8, i8* %78, i32 %sub.ptr.sub125
  store i8* %add.ptr128, i8** %value127, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %79 = load i32, i32* %i, align 4
  %inc = add i32 %79, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  br label %if.end129

if.end129:                                        ; preds = %for.end, %if.end115
  %80 = load i8*, i8** %new_pool, align 4
  store i8* %80, i8** @string_space, align 4
  %81 = load i32, i32* %new_size, align 4
  store i32 %81, i32* @string_space_max, align 4
  br label %if.end130

if.end130:                                        ; preds = %if.end129, %if.end95
  %82 = load i8*, i8** @string_space, align 4
  %83 = load i32, i32* @string_space_act, align 4
  %arrayidx131 = getelementptr inbounds i8, i8* %82, i32 %83
  %84 = load i8*, i8** %alias, align 4
  %85 = load i32, i32* %alias_len, align 4
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %arrayidx131, i8* %84, i32 %85, i32 1, i1 false)
  %86 = load %struct.alias_map*, %struct.alias_map** @map, align 4
  %87 = load i32, i32* @nmap, align 4
  %arrayidx132 = getelementptr inbounds %struct.alias_map, %struct.alias_map* %86, i32 %87
  %alias133 = getelementptr inbounds %struct.alias_map, %struct.alias_map* %arrayidx132, i32 0, i32 0
  store i8* %arrayidx131, i8** %alias133, align 4
  %88 = load i32, i32* %alias_len, align 4
  %89 = load i32, i32* @string_space_act, align 4
  %add134 = add i32 %89, %88
  store i32 %add134, i32* @string_space_act, align 4
  %90 = load i8*, i8** @string_space, align 4
  %91 = load i32, i32* @string_space_act, align 4
  %arrayidx135 = getelementptr inbounds i8, i8* %90, i32 %91
  %92 = load i8*, i8** %value, align 4
  %93 = load i32, i32* %value_len, align 4
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %arrayidx135, i8* %92, i32 %93, i32 1, i1 false)
  %94 = load %struct.alias_map*, %struct.alias_map** @map, align 4
  %95 = load i32, i32* @nmap, align 4
  %arrayidx136 = getelementptr inbounds %struct.alias_map, %struct.alias_map* %94, i32 %95
  %value137 = getelementptr inbounds %struct.alias_map, %struct.alias_map* %arrayidx136, i32 0, i32 1
  store i8* %arrayidx135, i8** %value137, align 4
  %96 = load i32, i32* %value_len, align 4
  %97 = load i32, i32* @string_space_act, align 4
  %add138 = add i32 %97, %96
  store i32 %add138, i32* @string_space_act, align 4
  %98 = load i32, i32* @nmap, align 4
  %inc139 = add i32 %98, 1
  store i32 %inc139, i32* @nmap, align 4
  %99 = load i32, i32* %added, align 4
  %inc140 = add i32 %99, 1
  store i32 %inc140, i32* %added, align 4
  br label %if.end141

if.end141:                                        ; preds = %if.end130, %while.end51
  br label %if.end142

if.end142:                                        ; preds = %if.end141, %land.lhs.true, %while.end
  br label %while.cond143

while.cond143:                                    ; preds = %if.end154, %if.end142
  %arraydecay144 = getelementptr inbounds [400 x i8], [400 x i8]* %buf, i32 0, i32 0
  %call145 = call i8* @strchr(i8* %arraydecay144, i32 10)
  %cmp146 = icmp eq i8* %call145, null
  br i1 %cmp146, label %while.body148, label %while.end155

while.body148:                                    ; preds = %while.cond143
  %arraydecay149 = getelementptr inbounds [400 x i8], [400 x i8]* %buf, i32 0, i32 0
  %100 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 4
  %call150 = call i8* @fgets(i8* %arraydecay149, i32 400, %struct._IO_FILE* %100)
  %cmp151 = icmp eq i8* %call150, null
  br i1 %cmp151, label %if.then153, label %if.end154

if.then153:                                       ; preds = %while.body148
  br label %while.end155

if.end154:                                        ; preds = %while.body148
  br label %while.cond143

while.end155:                                     ; preds = %if.then153, %while.cond143
  br label %while.cond

while.end156:                                     ; preds = %if.then7, %while.cond
  %101 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 4
  %call157 = call i32 @fclose(%struct._IO_FILE* %101)
  %102 = load i32, i32* %added, align 4
  %cmp158 = icmp ugt i32 %102, 0
  br i1 %cmp158, label %if.then160, label %if.end161

if.then160:                                       ; preds = %while.end156
  %103 = load %struct.alias_map*, %struct.alias_map** @map, align 4
  %104 = bitcast %struct.alias_map* %103 to i8*
  %105 = load i32, i32* @nmap, align 4
  call void @qsort(i8* %104, i32 %105, i32 8, i32 (i8*, i8*)* bitcast (i32 (%struct.alias_map*, %struct.alias_map*)* @alias_compare to i32 (i8*, i8*)*))
  br label %if.end161

if.end161:                                        ; preds = %if.then160, %while.end156
  %106 = load i32, i32* %added, align 4
  store i32 %106, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end161, %if.then113, %if.then92, %if.then
  %107 = load i32, i32* %retval, align 4
  ret i32 %107
}

declare i8* @mempcpy(i8*, i8*, i32) #1

declare %struct._IO_FILE* @fopen(i8*, i8*) #1

declare i8* @libintl_relocate(i8*) #1

declare i32 @feof(%struct._IO_FILE*) #1

declare i8* @fgets(i8*, i32, %struct._IO_FILE*) #1

; Function Attrs: nounwind readonly
declare i32 @isspace(i32) #2

; Function Attrs: noinline nounwind
define internal i32 @extend_alias_table() #0 {
entry:
  %retval = alloca i32, align 4
  %new_size = alloca i32, align 4
  %new_map = alloca %struct.alias_map*, align 4
  %0 = load i32, i32* @maxmap, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  br label %cond.end

cond.false:                                       ; preds = %entry
  %1 = load i32, i32* @maxmap, align 4
  %mul = mul i32 2, %1
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 100, %cond.true ], [ %mul, %cond.false ]
  store i32 %cond, i32* %new_size, align 4
  %2 = load %struct.alias_map*, %struct.alias_map** @map, align 4
  %3 = bitcast %struct.alias_map* %2 to i8*
  %4 = load i32, i32* %new_size, align 4
  %mul1 = mul i32 %4, 8
  %call = call i8* @realloc(i8* %3, i32 %mul1)
  %5 = bitcast i8* %call to %struct.alias_map*
  store %struct.alias_map* %5, %struct.alias_map** %new_map, align 4
  %6 = load %struct.alias_map*, %struct.alias_map** %new_map, align 4
  %cmp2 = icmp eq %struct.alias_map* %6, null
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %cond.end
  store i32 -1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %cond.end
  %7 = load %struct.alias_map*, %struct.alias_map** %new_map, align 4
  store %struct.alias_map* %7, %struct.alias_map** @map, align 4
  %8 = load i32, i32* %new_size, align 4
  store i32 %8, i32* @maxmap, align 4
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %9 = load i32, i32* %retval, align 4
  ret i32 %9
}

declare i32 @fclose(%struct._IO_FILE*) #1

declare i32 @strlen(i8*) #1

declare i8* @realloc(i8*, i32) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* nocapture writeonly, i8* nocapture readonly, i32, i32, i1) #3

declare i8* @strchr(i8*, i32) #1

declare void @qsort(i8*, i32, i32, i32 (i8*, i8*)*) #1

declare i32 @strcasecmp(i8*, i8*) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
