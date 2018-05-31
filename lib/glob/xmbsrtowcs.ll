; ModuleID = 'xmbsrtowcs.c'
source_filename = "xmbsrtowcs.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.__mbstate_t = type { i32, i32 }

@local_state_use = internal global i32 0, align 4
@local_state = internal global %struct.__mbstate_t zeroinitializer, align 4

; Function Attrs: noinline nounwind
define i32 @xmbsrtowcs(i32* %dest, i8** %src, i32 %len, %struct.__mbstate_t* %pstate) #0 {
entry:
  %retval = alloca i32, align 4
  %dest.addr = alloca i32*, align 4
  %src.addr = alloca i8**, align 4
  %len.addr = alloca i32, align 4
  %pstate.addr = alloca %struct.__mbstate_t*, align 4
  %ps = alloca %struct.__mbstate_t*, align 4
  %mblength = alloca i32, align 4
  %wclength = alloca i32, align 4
  %n = alloca i32, align 4
  %wsbuf = alloca i32*, align 4
  %mbs = alloca i8*, align 4
  %psbuf = alloca %struct.__mbstate_t, align 4
  store i32* %dest, i32** %dest.addr, align 4
  store i8** %src, i8*** %src.addr, align 4
  store i32 %len, i32* %len.addr, align 4
  store %struct.__mbstate_t* %pstate, %struct.__mbstate_t** %pstate.addr, align 4
  %0 = load %struct.__mbstate_t*, %struct.__mbstate_t** %pstate.addr, align 4
  store %struct.__mbstate_t* %0, %struct.__mbstate_t** %ps, align 4
  %1 = load %struct.__mbstate_t*, %struct.__mbstate_t** %pstate.addr, align 4
  %cmp = icmp eq %struct.__mbstate_t* %1, null
  br i1 %cmp, label %if.then, label %if.end2

if.then:                                          ; preds = %entry
  %2 = load i32, i32* @local_state_use, align 4
  %tobool = icmp ne i32 %2, 0
  br i1 %tobool, label %if.end, label %if.then1

if.then1:                                         ; preds = %if.then
  call void @llvm.memset.p0i8.i32(i8* bitcast (%struct.__mbstate_t* @local_state to i8*), i8 0, i32 8, i32 4, i1 false)
  store i32 1, i32* @local_state_use, align 4
  br label %if.end

if.end:                                           ; preds = %if.then1, %if.then
  store %struct.__mbstate_t* @local_state, %struct.__mbstate_t** %ps, align 4
  br label %if.end2

if.end2:                                          ; preds = %if.end, %entry
  %3 = load i8**, i8*** %src.addr, align 4
  %4 = load i8*, i8** %3, align 4
  %call = call i32 @strlen(i8* %4)
  store i32 %call, i32* %n, align 4
  %5 = load i32*, i32** %dest.addr, align 4
  %cmp3 = icmp eq i32* %5, null
  br i1 %cmp3, label %if.then4, label %if.end10

if.then4:                                         ; preds = %if.end2
  %6 = load i32, i32* %n, align 4
  %add = add i32 %6, 1
  %mul = mul i32 %add, 4
  %call5 = call i8* @malloc(i32 %mul)
  %7 = bitcast i8* %call5 to i32*
  store i32* %7, i32** %wsbuf, align 4
  %8 = load i8**, i8*** %src.addr, align 4
  %9 = load i8*, i8** %8, align 4
  store i8* %9, i8** %mbs, align 4
  %10 = load %struct.__mbstate_t*, %struct.__mbstate_t** %ps, align 4
  %11 = bitcast %struct.__mbstate_t* %psbuf to i8*
  %12 = bitcast %struct.__mbstate_t* %10 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %11, i8* %12, i32 8, i32 4, i1 false)
  %13 = load i32*, i32** %wsbuf, align 4
  %14 = load i32, i32* %n, align 4
  %call6 = call i32 @mbsrtowcs(i32* %13, i8** %mbs, i32 %14, %struct.__mbstate_t* %psbuf)
  store i32 %call6, i32* %wclength, align 4
  %15 = load i32*, i32** %wsbuf, align 4
  %tobool7 = icmp ne i32* %15, null
  br i1 %tobool7, label %if.then8, label %if.end9

if.then8:                                         ; preds = %if.then4
  %16 = load i32*, i32** %wsbuf, align 4
  %17 = bitcast i32* %16 to i8*
  call void @free(i8* %17)
  br label %if.end9

if.end9:                                          ; preds = %if.then8, %if.then4
  %18 = load i32, i32* %wclength, align 4
  store i32 %18, i32* %retval, align 4
  br label %return

if.end10:                                         ; preds = %if.end2
  store i32 0, i32* %wclength, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end10
  %19 = load i32, i32* %wclength, align 4
  %20 = load i32, i32* %len.addr, align 4
  %cmp11 = icmp ult i32 %19, %20
  br i1 %cmp11, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %21 = load %struct.__mbstate_t*, %struct.__mbstate_t** %ps, align 4
  %call12 = call i32 @mbsinit(%struct.__mbstate_t* %21)
  %tobool13 = icmp ne i32 %call12, 0
  br i1 %tobool13, label %if.then14, label %if.else26

if.then14:                                        ; preds = %for.body
  %22 = load i8**, i8*** %src.addr, align 4
  %23 = load i8*, i8** %22, align 4
  %24 = load i8, i8* %23, align 1
  %conv = sext i8 %24 to i32
  %cmp15 = icmp eq i32 %conv, 0
  br i1 %cmp15, label %if.then17, label %if.else

if.then17:                                        ; preds = %if.then14
  %25 = load i32*, i32** %dest.addr, align 4
  store i32 0, i32* %25, align 4
  %26 = load i8**, i8*** %src.addr, align 4
  store i8* null, i8** %26, align 4
  %27 = load i32, i32* %wclength, align 4
  store i32 %27, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %if.then14
  %28 = load i8**, i8*** %src.addr, align 4
  %29 = load i8*, i8** %28, align 4
  %30 = load i8, i8* %29, align 1
  %conv18 = sext i8 %30 to i32
  %cmp19 = icmp eq i32 %conv18, 92
  br i1 %cmp19, label %if.then21, label %if.else22

if.then21:                                        ; preds = %if.else
  %31 = load i32*, i32** %dest.addr, align 4
  store i32 92, i32* %31, align 4
  store i32 1, i32* %mblength, align 4
  br label %if.end24

if.else22:                                        ; preds = %if.else
  %32 = load i32*, i32** %dest.addr, align 4
  %33 = load i8**, i8*** %src.addr, align 4
  %34 = load i8*, i8** %33, align 4
  %35 = load i32, i32* %n, align 4
  %36 = load %struct.__mbstate_t*, %struct.__mbstate_t** %ps, align 4
  %call23 = call i32 @mbrtowc(i32* %32, i8* %34, i32 %35, %struct.__mbstate_t* %36)
  store i32 %call23, i32* %mblength, align 4
  br label %if.end24

if.end24:                                         ; preds = %if.else22, %if.then21
  br label %if.end25

if.end25:                                         ; preds = %if.end24
  br label %if.end28

if.else26:                                        ; preds = %for.body
  %37 = load i32*, i32** %dest.addr, align 4
  %38 = load i8**, i8*** %src.addr, align 4
  %39 = load i8*, i8** %38, align 4
  %40 = load i32, i32* %n, align 4
  %41 = load %struct.__mbstate_t*, %struct.__mbstate_t** %ps, align 4
  %call27 = call i32 @mbrtowc(i32* %37, i8* %39, i32 %40, %struct.__mbstate_t* %41)
  store i32 %call27, i32* %mblength, align 4
  br label %if.end28

if.end28:                                         ; preds = %if.else26, %if.end25
  %42 = load i32, i32* %mblength, align 4
  %cmp29 = icmp eq i32 %42, -1
  br i1 %cmp29, label %if.then33, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end28
  %43 = load i32, i32* %mblength, align 4
  %cmp31 = icmp eq i32 %43, -2
  br i1 %cmp31, label %if.then33, label %if.end34

if.then33:                                        ; preds = %lor.lhs.false, %if.end28
  store i32 -1, i32* %retval, align 4
  br label %return

if.end34:                                         ; preds = %lor.lhs.false
  %44 = load i32, i32* %mblength, align 4
  %45 = load i8**, i8*** %src.addr, align 4
  %46 = load i8*, i8** %45, align 4
  %add.ptr = getelementptr inbounds i8, i8* %46, i32 %44
  store i8* %add.ptr, i8** %45, align 4
  %47 = load i32, i32* %mblength, align 4
  %48 = load i32, i32* %n, align 4
  %sub = sub i32 %48, %47
  store i32 %sub, i32* %n, align 4
  %49 = load i32*, i32** %dest.addr, align 4
  %50 = load i32, i32* %49, align 4
  %cmp35 = icmp eq i32 %50, 0
  br i1 %cmp35, label %if.then37, label %if.end38

if.then37:                                        ; preds = %if.end34
  %51 = load i8**, i8*** %src.addr, align 4
  store i8* null, i8** %51, align 4
  br label %for.end

if.end38:                                         ; preds = %if.end34
  br label %for.inc

for.inc:                                          ; preds = %if.end38
  %52 = load i32, i32* %wclength, align 4
  %inc = add i32 %52, 1
  store i32 %inc, i32* %wclength, align 4
  %53 = load i32*, i32** %dest.addr, align 4
  %incdec.ptr = getelementptr inbounds i32, i32* %53, i32 1
  store i32* %incdec.ptr, i32** %dest.addr, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then37, %for.cond
  %54 = load i32, i32* %wclength, align 4
  store i32 %54, i32* %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then33, %if.then17, %if.end9
  %55 = load i32, i32* %retval, align 4
  ret i32 %55
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #1

declare i32 @strlen(i8*) #2

declare i8* @malloc(i32) #2

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* nocapture writeonly, i8* nocapture readonly, i32, i32, i1) #1

declare i32 @mbsrtowcs(i32*, i8**, i32, %struct.__mbstate_t*) #2

declare void @free(i8*) #2

declare i32 @mbsinit(%struct.__mbstate_t*) #2

declare i32 @mbrtowc(i32*, i8*, i32, %struct.__mbstate_t*) #2

; Function Attrs: noinline nounwind
define i32 @xdupmbstowcs(i32** %destp, i8*** %indicesp, i8* %src) #0 {
entry:
  %retval = alloca i32, align 4
  %destp.addr = alloca i32**, align 4
  %indicesp.addr = alloca i8***, align 4
  %src.addr = alloca i8*, align 4
  %p = alloca i8*, align 4
  %wc = alloca i32, align 4
  %wsbuf = alloca i32*, align 4
  %indices = alloca i8**, align 4
  %wsbuf_size = alloca i32, align 4
  %wcnum = alloca i32, align 4
  %state = alloca %struct.__mbstate_t, align 4
  %mblength = alloca i32, align 4
  %wstmp = alloca i32*, align 4
  %idxtmp = alloca i8**, align 4
  store i32** %destp, i32*** %destp.addr, align 4
  store i8*** %indicesp, i8**** %indicesp.addr, align 4
  store i8* %src, i8** %src.addr, align 4
  %0 = load i8*, i8** %src.addr, align 4
  %cmp = icmp eq i8* %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i32**, i32*** %destp.addr, align 4
  %cmp1 = icmp eq i32** %1, null
  br i1 %cmp1, label %if.then, label %if.end6

if.then:                                          ; preds = %lor.lhs.false, %entry
  %2 = load i32**, i32*** %destp.addr, align 4
  %tobool = icmp ne i32** %2, null
  br i1 %tobool, label %if.then2, label %if.end

if.then2:                                         ; preds = %if.then
  %3 = load i32**, i32*** %destp.addr, align 4
  store i32* null, i32** %3, align 4
  br label %if.end

if.end:                                           ; preds = %if.then2, %if.then
  %4 = load i8***, i8**** %indicesp.addr, align 4
  %tobool3 = icmp ne i8*** %4, null
  br i1 %tobool3, label %if.then4, label %if.end5

if.then4:                                         ; preds = %if.end
  %5 = load i8***, i8**** %indicesp.addr, align 4
  store i8** null, i8*** %5, align 4
  br label %if.end5

if.end5:                                          ; preds = %if.then4, %if.end
  store i32 -1, i32* %retval, align 4
  br label %return

if.end6:                                          ; preds = %lor.lhs.false
  %6 = load i8***, i8**** %indicesp.addr, align 4
  %cmp7 = icmp eq i8*** %6, null
  br i1 %cmp7, label %if.then8, label %if.end9

if.then8:                                         ; preds = %if.end6
  %7 = load i32**, i32*** %destp.addr, align 4
  %8 = load i8*, i8** %src.addr, align 4
  %call = call i32 @xdupmbstowcs2(i32** %7, i8* %8)
  store i32 %call, i32* %retval, align 4
  br label %return

if.end9:                                          ; preds = %if.end6
  %9 = bitcast %struct.__mbstate_t* %state to i8*
  call void @llvm.memset.p0i8.i32(i8* %9, i8 0, i32 8, i32 4, i1 false)
  store i32 32, i32* %wsbuf_size, align 4
  %10 = load i32, i32* %wsbuf_size, align 4
  %mul = mul i32 %10, 4
  %call10 = call i8* @malloc(i32 %mul)
  %11 = bitcast i8* %call10 to i32*
  store i32* %11, i32** %wsbuf, align 4
  %12 = load i32*, i32** %wsbuf, align 4
  %cmp11 = icmp eq i32* %12, null
  br i1 %cmp11, label %if.then12, label %if.end16

if.then12:                                        ; preds = %if.end9
  %13 = load i32**, i32*** %destp.addr, align 4
  store i32* null, i32** %13, align 4
  %14 = load i8***, i8**** %indicesp.addr, align 4
  %tobool13 = icmp ne i8*** %14, null
  br i1 %tobool13, label %if.then14, label %if.end15

if.then14:                                        ; preds = %if.then12
  %15 = load i8***, i8**** %indicesp.addr, align 4
  store i8** null, i8*** %15, align 4
  br label %if.end15

if.end15:                                         ; preds = %if.then14, %if.then12
  store i32 -1, i32* %retval, align 4
  br label %return

if.end16:                                         ; preds = %if.end9
  store i8** null, i8*** %indices, align 4
  %16 = load i8***, i8**** %indicesp.addr, align 4
  %tobool17 = icmp ne i8*** %16, null
  br i1 %tobool17, label %if.then18, label %if.end24

if.then18:                                        ; preds = %if.end16
  %17 = load i32, i32* %wsbuf_size, align 4
  %mul19 = mul i32 %17, 4
  %call20 = call i8* @malloc(i32 %mul19)
  %18 = bitcast i8* %call20 to i8**
  store i8** %18, i8*** %indices, align 4
  %19 = load i8**, i8*** %indices, align 4
  %cmp21 = icmp eq i8** %19, null
  br i1 %cmp21, label %if.then22, label %if.end23

if.then22:                                        ; preds = %if.then18
  %20 = load i32*, i32** %wsbuf, align 4
  %21 = bitcast i32* %20 to i8*
  call void @free(i8* %21)
  %22 = load i32**, i32*** %destp.addr, align 4
  store i32* null, i32** %22, align 4
  %23 = load i8***, i8**** %indicesp.addr, align 4
  store i8** null, i8*** %23, align 4
  store i32 -1, i32* %retval, align 4
  br label %return

if.end23:                                         ; preds = %if.then18
  br label %if.end24

if.end24:                                         ; preds = %if.end23, %if.end16
  %24 = load i8*, i8** %src.addr, align 4
  store i8* %24, i8** %p, align 4
  store i32 0, i32* %wcnum, align 4
  br label %do.body

do.body:                                          ; preds = %do.cond, %if.end24
  %call25 = call i32 @mbsinit(%struct.__mbstate_t* %state)
  %tobool26 = icmp ne i32 %call25, 0
  br i1 %tobool26, label %if.then27, label %if.else39

if.then27:                                        ; preds = %do.body
  %25 = load i8*, i8** %p, align 4
  %26 = load i8, i8* %25, align 1
  %conv = sext i8 %26 to i32
  %cmp28 = icmp eq i32 %conv, 0
  br i1 %cmp28, label %if.then30, label %if.else

if.then30:                                        ; preds = %if.then27
  store i32 0, i32* %wc, align 4
  store i32 1, i32* %mblength, align 4
  br label %if.end38

if.else:                                          ; preds = %if.then27
  %27 = load i8*, i8** %p, align 4
  %28 = load i8, i8* %27, align 1
  %conv31 = sext i8 %28 to i32
  %cmp32 = icmp eq i32 %conv31, 92
  br i1 %cmp32, label %if.then34, label %if.else35

if.then34:                                        ; preds = %if.else
  store i32 92, i32* %wc, align 4
  store i32 1, i32* %mblength, align 4
  br label %if.end37

if.else35:                                        ; preds = %if.else
  %29 = load i8*, i8** %p, align 4
  %call36 = call i32 @mbrtowc(i32* %wc, i8* %29, i32 16, %struct.__mbstate_t* %state)
  store i32 %call36, i32* %mblength, align 4
  br label %if.end37

if.end37:                                         ; preds = %if.else35, %if.then34
  br label %if.end38

if.end38:                                         ; preds = %if.end37, %if.then30
  br label %if.end41

if.else39:                                        ; preds = %do.body
  %30 = load i8*, i8** %p, align 4
  %call40 = call i32 @mbrtowc(i32* %wc, i8* %30, i32 16, %struct.__mbstate_t* %state)
  store i32 %call40, i32* %mblength, align 4
  br label %if.end41

if.end41:                                         ; preds = %if.else39, %if.end38
  %31 = load i32, i32* %mblength, align 4
  %cmp42 = icmp eq i32 %31, -1
  br i1 %cmp42, label %if.then47, label %lor.lhs.false44

lor.lhs.false44:                                  ; preds = %if.end41
  %32 = load i32, i32* %mblength, align 4
  %cmp45 = icmp eq i32 %32, -2
  br i1 %cmp45, label %if.then47, label %if.end55

if.then47:                                        ; preds = %lor.lhs.false44, %if.end41
  %33 = load i32*, i32** %wsbuf, align 4
  %34 = bitcast i32* %33 to i8*
  call void @free(i8* %34)
  br label %do.body48

do.body48:                                        ; preds = %if.then47
  %35 = load i8**, i8*** %indices, align 4
  %tobool49 = icmp ne i8** %35, null
  br i1 %tobool49, label %if.then50, label %if.end51

if.then50:                                        ; preds = %do.body48
  %36 = load i8**, i8*** %indices, align 4
  %37 = bitcast i8** %36 to i8*
  call void @free(i8* %37)
  br label %if.end51

if.end51:                                         ; preds = %if.then50, %do.body48
  br label %do.end

do.end:                                           ; preds = %if.end51
  %38 = load i32**, i32*** %destp.addr, align 4
  store i32* null, i32** %38, align 4
  %39 = load i8***, i8**** %indicesp.addr, align 4
  %tobool52 = icmp ne i8*** %39, null
  br i1 %tobool52, label %if.then53, label %if.end54

if.then53:                                        ; preds = %do.end
  %40 = load i8***, i8**** %indicesp.addr, align 4
  store i8** null, i8*** %40, align 4
  br label %if.end54

if.end54:                                         ; preds = %if.then53, %do.end
  store i32 -1, i32* %retval, align 4
  br label %return

if.end55:                                         ; preds = %lor.lhs.false44
  %41 = load i32, i32* %wcnum, align 4
  %inc = add i32 %41, 1
  store i32 %inc, i32* %wcnum, align 4
  %42 = load i32, i32* %wsbuf_size, align 4
  %43 = load i32, i32* %wcnum, align 4
  %cmp56 = icmp ult i32 %42, %43
  br i1 %cmp56, label %if.then58, label %if.end85

if.then58:                                        ; preds = %if.end55
  %44 = load i32, i32* %wsbuf_size, align 4
  %add = add i32 %44, 32
  store i32 %add, i32* %wsbuf_size, align 4
  %45 = load i32*, i32** %wsbuf, align 4
  %46 = bitcast i32* %45 to i8*
  %47 = load i32, i32* %wsbuf_size, align 4
  %mul59 = mul i32 %47, 4
  %call60 = call i8* @realloc(i8* %46, i32 %mul59)
  %48 = bitcast i8* %call60 to i32*
  store i32* %48, i32** %wstmp, align 4
  %49 = load i32*, i32** %wstmp, align 4
  %cmp61 = icmp eq i32* %49, null
  br i1 %cmp61, label %if.then63, label %if.end72

if.then63:                                        ; preds = %if.then58
  %50 = load i32*, i32** %wsbuf, align 4
  %51 = bitcast i32* %50 to i8*
  call void @free(i8* %51)
  br label %do.body64

do.body64:                                        ; preds = %if.then63
  %52 = load i8**, i8*** %indices, align 4
  %tobool65 = icmp ne i8** %52, null
  br i1 %tobool65, label %if.then66, label %if.end67

if.then66:                                        ; preds = %do.body64
  %53 = load i8**, i8*** %indices, align 4
  %54 = bitcast i8** %53 to i8*
  call void @free(i8* %54)
  br label %if.end67

if.end67:                                         ; preds = %if.then66, %do.body64
  br label %do.end68

do.end68:                                         ; preds = %if.end67
  %55 = load i32**, i32*** %destp.addr, align 4
  store i32* null, i32** %55, align 4
  %56 = load i8***, i8**** %indicesp.addr, align 4
  %tobool69 = icmp ne i8*** %56, null
  br i1 %tobool69, label %if.then70, label %if.end71

if.then70:                                        ; preds = %do.end68
  %57 = load i8***, i8**** %indicesp.addr, align 4
  store i8** null, i8*** %57, align 4
  br label %if.end71

if.end71:                                         ; preds = %if.then70, %do.end68
  store i32 -1, i32* %retval, align 4
  br label %return

if.end72:                                         ; preds = %if.then58
  %58 = load i32*, i32** %wstmp, align 4
  store i32* %58, i32** %wsbuf, align 4
  %59 = load i8***, i8**** %indicesp.addr, align 4
  %tobool73 = icmp ne i8*** %59, null
  br i1 %tobool73, label %if.then74, label %if.end84

if.then74:                                        ; preds = %if.end72
  %60 = load i8**, i8*** %indices, align 4
  %61 = bitcast i8** %60 to i8*
  %62 = load i32, i32* %wsbuf_size, align 4
  %mul75 = mul i32 %62, 4
  %call76 = call i8* @realloc(i8* %61, i32 %mul75)
  %63 = bitcast i8* %call76 to i8**
  store i8** %63, i8*** %idxtmp, align 4
  %64 = load i8**, i8*** %idxtmp, align 4
  %cmp77 = icmp eq i8** %64, null
  br i1 %cmp77, label %if.then79, label %if.end83

if.then79:                                        ; preds = %if.then74
  %65 = load i32*, i32** %wsbuf, align 4
  %66 = bitcast i32* %65 to i8*
  call void @free(i8* %66)
  %67 = load i8**, i8*** %indices, align 4
  %68 = bitcast i8** %67 to i8*
  call void @free(i8* %68)
  %69 = load i32**, i32*** %destp.addr, align 4
  store i32* null, i32** %69, align 4
  %70 = load i8***, i8**** %indicesp.addr, align 4
  %tobool80 = icmp ne i8*** %70, null
  br i1 %tobool80, label %if.then81, label %if.end82

if.then81:                                        ; preds = %if.then79
  %71 = load i8***, i8**** %indicesp.addr, align 4
  store i8** null, i8*** %71, align 4
  br label %if.end82

if.end82:                                         ; preds = %if.then81, %if.then79
  store i32 -1, i32* %retval, align 4
  br label %return

if.end83:                                         ; preds = %if.then74
  %72 = load i8**, i8*** %idxtmp, align 4
  store i8** %72, i8*** %indices, align 4
  br label %if.end84

if.end84:                                         ; preds = %if.end83, %if.end72
  br label %if.end85

if.end85:                                         ; preds = %if.end84, %if.end55
  %73 = load i32, i32* %wc, align 4
  %74 = load i32*, i32** %wsbuf, align 4
  %75 = load i32, i32* %wcnum, align 4
  %sub = sub i32 %75, 1
  %arrayidx = getelementptr inbounds i32, i32* %74, i32 %sub
  store i32 %73, i32* %arrayidx, align 4
  %76 = load i8**, i8*** %indices, align 4
  %tobool86 = icmp ne i8** %76, null
  br i1 %tobool86, label %if.then87, label %if.end90

if.then87:                                        ; preds = %if.end85
  %77 = load i8*, i8** %p, align 4
  %78 = load i8**, i8*** %indices, align 4
  %79 = load i32, i32* %wcnum, align 4
  %sub88 = sub i32 %79, 1
  %arrayidx89 = getelementptr inbounds i8*, i8** %78, i32 %sub88
  store i8* %77, i8** %arrayidx89, align 4
  br label %if.end90

if.end90:                                         ; preds = %if.then87, %if.end85
  %80 = load i32, i32* %mblength, align 4
  %81 = load i8*, i8** %p, align 4
  %add.ptr = getelementptr inbounds i8, i8* %81, i32 %80
  store i8* %add.ptr, i8** %p, align 4
  br label %do.cond

do.cond:                                          ; preds = %if.end90
  %82 = load i32, i32* %wc, align 4
  %cmp91 = icmp eq i32 %82, 0
  %conv92 = zext i1 %cmp91 to i32
  %cmp93 = icmp eq i32 %conv92, 0
  br i1 %cmp93, label %do.body, label %do.end95

do.end95:                                         ; preds = %do.cond
  %83 = load i32*, i32** %wsbuf, align 4
  %84 = load i32**, i32*** %destp.addr, align 4
  store i32* %83, i32** %84, align 4
  %85 = load i8***, i8**** %indicesp.addr, align 4
  %cmp96 = icmp ne i8*** %85, null
  br i1 %cmp96, label %if.then98, label %if.end99

if.then98:                                        ; preds = %do.end95
  %86 = load i8**, i8*** %indices, align 4
  %87 = load i8***, i8**** %indicesp.addr, align 4
  store i8** %86, i8*** %87, align 4
  br label %if.end99

if.end99:                                         ; preds = %if.then98, %do.end95
  %88 = load i32, i32* %wcnum, align 4
  %sub100 = sub i32 %88, 1
  store i32 %sub100, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end99, %if.end82, %if.end71, %if.end54, %if.then22, %if.end15, %if.then8, %if.end5
  %89 = load i32, i32* %retval, align 4
  ret i32 %89
}

; Function Attrs: noinline nounwind
define internal i32 @xdupmbstowcs2(i32** %destp, i8* %src) #0 {
entry:
  %retval = alloca i32, align 4
  %destp.addr = alloca i32**, align 4
  %src.addr = alloca i8*, align 4
  %p = alloca i8*, align 4
  %wsbuf = alloca i32*, align 4
  %wsbuf_size = alloca i32, align 4
  %wcnum = alloca i32, align 4
  %state = alloca %struct.__mbstate_t, align 4
  %n = alloca i32, align 4
  %wcslength = alloca i32, align 4
  %end_or_backslash = alloca i8*, align 4
  %nms = alloca i32, align 4
  %tmp_state = alloca %struct.__mbstate_t, align 4
  %tmp_p = alloca i8*, align 4
  %wstmp = alloca i32*, align 4
  store i32** %destp, i32*** %destp.addr, align 4
  store i8* %src, i8** %src.addr, align 4
  %0 = bitcast %struct.__mbstate_t* %state to i8*
  call void @llvm.memset.p0i8.i32(i8* %0, i8 0, i32 8, i32 4, i1 false)
  store i32 0, i32* %wsbuf_size, align 4
  store i32* null, i32** %wsbuf, align 4
  %1 = load i8*, i8** %src.addr, align 4
  store i8* %1, i8** %p, align 4
  store i32 0, i32* %wcnum, align 4
  br label %do.body

do.body:                                          ; preds = %do.cond, %entry
  %2 = load i8*, i8** %p, align 4
  %call = call i8* @strchrnul(i8* %2, i32 92)
  store i8* %call, i8** %end_or_backslash, align 4
  %3 = load i8*, i8** %end_or_backslash, align 4
  %4 = load i8*, i8** %p, align 4
  %sub.ptr.lhs.cast = ptrtoint i8* %3 to i32
  %sub.ptr.rhs.cast = ptrtoint i8* %4 to i32
  %sub.ptr.sub = sub i32 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  store i32 %sub.ptr.sub, i32* %nms, align 4
  %5 = load i8*, i8** %end_or_backslash, align 4
  %6 = load i8, i8* %5, align 1
  %conv = sext i8 %6 to i32
  %cmp = icmp eq i32 %conv, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %do.body
  %7 = load i32, i32* %nms, align 4
  %inc = add i32 %7, 1
  store i32 %inc, i32* %nms, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %do.body
  %8 = load i8*, i8** %p, align 4
  store i8* %8, i8** %tmp_p, align 4
  %9 = bitcast %struct.__mbstate_t* %tmp_state to i8*
  %10 = bitcast %struct.__mbstate_t* %state to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %9, i8* %10, i32 8, i32 4, i1 false)
  %11 = load i32, i32* %nms, align 4
  %cmp2 = icmp eq i32 %11, 0
  br i1 %cmp2, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %if.end
  %12 = load i8*, i8** %p, align 4
  %13 = load i8, i8* %12, align 1
  %conv4 = sext i8 %13 to i32
  %cmp5 = icmp eq i32 %conv4, 92
  br i1 %cmp5, label %if.then7, label %if.else

if.then7:                                         ; preds = %land.lhs.true
  store i32 1, i32* %wcslength, align 4
  store i32 1, i32* %nms, align 4
  br label %if.end9

if.else:                                          ; preds = %land.lhs.true, %if.end
  %14 = load i32, i32* %nms, align 4
  %call8 = call i32 @mbsnrtowcs(i32* null, i8** %tmp_p, i32 %14, i32 0, %struct.__mbstate_t* %tmp_state)
  store i32 %call8, i32* %wcslength, align 4
  br label %if.end9

if.end9:                                          ; preds = %if.else, %if.then7
  %15 = load i32, i32* %wcslength, align 4
  %cmp10 = icmp eq i32 %15, 0
  br i1 %cmp10, label %if.then12, label %if.end13

if.then12:                                        ; preds = %if.end9
  %16 = load i8*, i8** %p, align 4
  store i8* %16, i8** %tmp_p, align 4
  %17 = bitcast %struct.__mbstate_t* %tmp_state to i8*
  %18 = bitcast %struct.__mbstate_t* %state to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %17, i8* %18, i32 8, i32 4, i1 false)
  store i32 1, i32* %wcslength, align 4
  br label %if.end13

if.end13:                                         ; preds = %if.then12, %if.end9
  %19 = load i32, i32* %wcslength, align 4
  %cmp14 = icmp eq i32 %19, -1
  br i1 %cmp14, label %if.then16, label %if.end17

if.then16:                                        ; preds = %if.end13
  %20 = load i32*, i32** %wsbuf, align 4
  %21 = bitcast i32* %20 to i8*
  call void @free(i8* %21)
  %22 = load i32**, i32*** %destp.addr, align 4
  store i32* null, i32** %22, align 4
  store i32 -1, i32* %retval, align 4
  br label %return

if.end17:                                         ; preds = %if.end13
  %23 = load i32, i32* %wsbuf_size, align 4
  %24 = load i32, i32* %wcnum, align 4
  %25 = load i32, i32* %wcslength, align 4
  %add = add i32 %24, %25
  %add18 = add i32 %add, 1
  %cmp19 = icmp ult i32 %23, %add18
  br i1 %cmp19, label %if.then21, label %if.end32

if.then21:                                        ; preds = %if.end17
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.then21
  %26 = load i32, i32* %wsbuf_size, align 4
  %27 = load i32, i32* %wcnum, align 4
  %28 = load i32, i32* %wcslength, align 4
  %add22 = add i32 %27, %28
  %add23 = add i32 %add22, 1
  %cmp24 = icmp ult i32 %26, %add23
  br i1 %cmp24, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %29 = load i32, i32* %wsbuf_size, align 4
  %add26 = add i32 %29, 32
  store i32 %add26, i32* %wsbuf_size, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %30 = load i32*, i32** %wsbuf, align 4
  %31 = bitcast i32* %30 to i8*
  %32 = load i32, i32* %wsbuf_size, align 4
  %mul = mul i32 %32, 4
  %call27 = call i8* @realloc(i8* %31, i32 %mul)
  %33 = bitcast i8* %call27 to i32*
  store i32* %33, i32** %wstmp, align 4
  %34 = load i32*, i32** %wstmp, align 4
  %cmp28 = icmp eq i32* %34, null
  br i1 %cmp28, label %if.then30, label %if.end31

if.then30:                                        ; preds = %while.end
  %35 = load i32*, i32** %wsbuf, align 4
  %36 = bitcast i32* %35 to i8*
  call void @free(i8* %36)
  %37 = load i32**, i32*** %destp.addr, align 4
  store i32* null, i32** %37, align 4
  store i32 -1, i32* %retval, align 4
  br label %return

if.end31:                                         ; preds = %while.end
  %38 = load i32*, i32** %wstmp, align 4
  store i32* %38, i32** %wsbuf, align 4
  br label %if.end32

if.end32:                                         ; preds = %if.end31, %if.end17
  %39 = load i32*, i32** %wsbuf, align 4
  %40 = load i32, i32* %wcnum, align 4
  %add.ptr = getelementptr inbounds i32, i32* %39, i32 %40
  %41 = load i32, i32* %nms, align 4
  %42 = load i32, i32* %wsbuf_size, align 4
  %43 = load i32, i32* %wcnum, align 4
  %sub = sub i32 %42, %43
  %call33 = call i32 @mbsnrtowcs(i32* %add.ptr, i8** %p, i32 %41, i32 %sub, %struct.__mbstate_t* %state)
  store i32 %call33, i32* %n, align 4
  %44 = load i32, i32* %n, align 4
  %cmp34 = icmp eq i32 %44, 0
  br i1 %cmp34, label %land.lhs.true36, label %if.end40

land.lhs.true36:                                  ; preds = %if.end32
  %45 = load i8*, i8** %p, align 4
  %cmp37 = icmp eq i8* %45, null
  br i1 %cmp37, label %if.then39, label %if.end40

if.then39:                                        ; preds = %land.lhs.true36
  %46 = load i32*, i32** %wsbuf, align 4
  %47 = load i32, i32* %wcnum, align 4
  %arrayidx = getelementptr inbounds i32, i32* %46, i32 %47
  store i32 0, i32* %arrayidx, align 4
  br label %do.end

if.end40:                                         ; preds = %land.lhs.true36, %if.end32
  %48 = load i32, i32* %wcslength, align 4
  %cmp41 = icmp eq i32 %48, 1
  br i1 %cmp41, label %land.lhs.true43, label %if.else58

land.lhs.true43:                                  ; preds = %if.end40
  %49 = load i32, i32* %n, align 4
  %cmp44 = icmp eq i32 %49, 0
  br i1 %cmp44, label %if.then48, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true43
  %50 = load i32, i32* %n, align 4
  %cmp46 = icmp eq i32 %50, -1
  br i1 %cmp46, label %if.then48, label %if.else58

if.then48:                                        ; preds = %lor.lhs.false, %land.lhs.true43
  %51 = bitcast %struct.__mbstate_t* %state to i8*
  %52 = bitcast %struct.__mbstate_t* %tmp_state to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %51, i8* %52, i32 8, i32 4, i1 false)
  %53 = load i8*, i8** %tmp_p, align 4
  store i8* %53, i8** %p, align 4
  %54 = load i8*, i8** %p, align 4
  %55 = load i8, i8* %54, align 1
  %conv49 = sext i8 %55 to i32
  %56 = load i32*, i32** %wsbuf, align 4
  %57 = load i32, i32* %wcnum, align 4
  %arrayidx50 = getelementptr inbounds i32, i32* %56, i32 %57
  store i32 %conv49, i32* %arrayidx50, align 4
  %58 = load i8*, i8** %p, align 4
  %59 = load i8, i8* %58, align 1
  %conv51 = sext i8 %59 to i32
  %cmp52 = icmp eq i32 %conv51, 0
  br i1 %cmp52, label %if.then54, label %if.else55

if.then54:                                        ; preds = %if.then48
  br label %do.end

if.else55:                                        ; preds = %if.then48
  %60 = load i32, i32* %wcnum, align 4
  %inc56 = add i32 %60, 1
  store i32 %inc56, i32* %wcnum, align 4
  %61 = load i8*, i8** %p, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %61, i32 1
  store i8* %incdec.ptr, i8** %p, align 4
  br label %if.end57

if.end57:                                         ; preds = %if.else55
  br label %if.end60

if.else58:                                        ; preds = %lor.lhs.false, %if.end40
  %62 = load i32, i32* %wcslength, align 4
  %63 = load i32, i32* %wcnum, align 4
  %add59 = add i32 %63, %62
  store i32 %add59, i32* %wcnum, align 4
  br label %if.end60

if.end60:                                         ; preds = %if.else58, %if.end57
  %call61 = call i32 @mbsinit(%struct.__mbstate_t* %state)
  %tobool = icmp ne i32 %call61, 0
  br i1 %tobool, label %land.lhs.true62, label %if.end73

land.lhs.true62:                                  ; preds = %if.end60
  %64 = load i8*, i8** %p, align 4
  %cmp63 = icmp ne i8* %64, null
  br i1 %cmp63, label %land.lhs.true65, label %if.end73

land.lhs.true65:                                  ; preds = %land.lhs.true62
  %65 = load i8*, i8** %p, align 4
  %66 = load i8, i8* %65, align 1
  %conv66 = sext i8 %66 to i32
  %cmp67 = icmp eq i32 %conv66, 92
  br i1 %cmp67, label %if.then69, label %if.end73

if.then69:                                        ; preds = %land.lhs.true65
  %67 = load i32*, i32** %wsbuf, align 4
  %68 = load i32, i32* %wcnum, align 4
  %inc70 = add i32 %68, 1
  store i32 %inc70, i32* %wcnum, align 4
  %arrayidx71 = getelementptr inbounds i32, i32* %67, i32 %68
  store i32 92, i32* %arrayidx71, align 4
  %69 = load i8*, i8** %p, align 4
  %incdec.ptr72 = getelementptr inbounds i8, i8* %69, i32 1
  store i8* %incdec.ptr72, i8** %p, align 4
  br label %if.end73

if.end73:                                         ; preds = %if.then69, %land.lhs.true65, %land.lhs.true62, %if.end60
  br label %do.cond

do.cond:                                          ; preds = %if.end73
  %70 = load i8*, i8** %p, align 4
  %cmp74 = icmp ne i8* %70, null
  br i1 %cmp74, label %do.body, label %do.end

do.end:                                           ; preds = %do.cond, %if.then54, %if.then39
  %71 = load i32*, i32** %wsbuf, align 4
  %72 = load i32**, i32*** %destp.addr, align 4
  store i32* %71, i32** %72, align 4
  %73 = load i32, i32* %wcnum, align 4
  store i32 %73, i32* %retval, align 4
  br label %return

return:                                           ; preds = %do.end, %if.then30, %if.then16
  %74 = load i32, i32* %retval, align 4
  ret i32 %74
}

declare i8* @realloc(i8*, i32) #2

declare i8* @strchrnul(i8*, i32) #2

declare i32 @mbsnrtowcs(i32*, i8**, i32, i32, %struct.__mbstate_t*) #2

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
