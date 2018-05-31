; ModuleID = 'loadmsgcat.c'
source_filename = "loadmsgcat.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.loaded_l10nfile = type { i8*, i32, i8*, %struct.loaded_l10nfile*, [1 x %struct.loaded_l10nfile*] }
%struct.loaded_domain = type { i8*, i32, i32, i32, i8*, i32, %struct.string_desc*, %struct.string_desc*, i32, %struct.sysdep_string_desc*, %struct.sysdep_string_desc*, i32, i32*, i32, i32, i8*, i8**, %struct.expression*, i32 }
%struct.string_desc = type { i32, i32 }
%struct.sysdep_string_desc = type { i32, i8* }
%struct.expression = type { i32, i32, %union.anon }
%union.anon = type { [3 x %struct.expression*] }
%struct.binding = type { %struct.binding*, i8*, i32, i8*, [0 x i8] }
%struct.stat = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }
%struct.timespec = type { i32, i32 }
%struct.mo_file_header = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }
%struct.sysdep_segment = type { i32, i32 }
%struct.sysdep_string = type { i32, [1 x %struct.segment_pair] }
%struct.segment_pair = type { i32, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.1 = private unnamed_addr constant [9 x i8] c"charset=\00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c" \09\0A\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"OUTPUT_CHARSET\00", align 1
@_nl_msg_cat_cntr = common global i32 0, align 4
@.str.4 = private unnamed_addr constant [2 x i8] c"d\00", align 1
@.str.5 = private unnamed_addr constant [2 x i8] c"i\00", align 1
@.str.6 = private unnamed_addr constant [2 x i8] c"o\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"u\00", align 1
@.str.8 = private unnamed_addr constant [2 x i8] c"x\00", align 1
@.str.9 = private unnamed_addr constant [2 x i8] c"X\00", align 1
@.str.10 = private unnamed_addr constant [4 x i8] c"lld\00", align 1
@.str.11 = private unnamed_addr constant [4 x i8] c"lli\00", align 1
@.str.12 = private unnamed_addr constant [4 x i8] c"llo\00", align 1
@.str.13 = private unnamed_addr constant [4 x i8] c"llu\00", align 1
@.str.14 = private unnamed_addr constant [4 x i8] c"llx\00", align 1
@.str.15 = private unnamed_addr constant [4 x i8] c"llX\00", align 1

; Function Attrs: noinline nounwind
define i8* @_nl_init_domain_conv(%struct.loaded_l10nfile* %domain_file, %struct.loaded_domain* %domain, %struct.binding* %domainbinding) #0 {
entry:
  %domain_file.addr = alloca %struct.loaded_l10nfile*, align 4
  %domain.addr = alloca %struct.loaded_domain*, align 4
  %domainbinding.addr = alloca %struct.binding*, align 4
  %nullentry = alloca i8*, align 4
  %nullentrylen = alloca i32, align 4
  %charsetstr = alloca i8*, align 4
  %len = alloca i32, align 4
  %charset = alloca i8*, align 4
  %outcharset = alloca i8*, align 4
  store %struct.loaded_l10nfile* %domain_file, %struct.loaded_l10nfile** %domain_file.addr, align 4
  store %struct.loaded_domain* %domain, %struct.loaded_domain** %domain.addr, align 4
  store %struct.binding* %domainbinding, %struct.binding** %domainbinding.addr, align 4
  %0 = load %struct.binding*, %struct.binding** %domainbinding.addr, align 4
  %cmp = icmp ne %struct.binding* %0, null
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %1 = load %struct.binding*, %struct.binding** %domainbinding.addr, align 4
  %codeset_cntr = getelementptr inbounds %struct.binding, %struct.binding* %1, i32 0, i32 2
  %2 = load i32, i32* %codeset_cntr, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %2, %cond.true ], [ 0, %cond.false ]
  %3 = load %struct.loaded_domain*, %struct.loaded_domain** %domain.addr, align 4
  %codeset_cntr1 = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %3, i32 0, i32 14
  store i32 %cond, i32* %codeset_cntr1, align 4
  %4 = load %struct.loaded_domain*, %struct.loaded_domain** %domain.addr, align 4
  %conv = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %4, i32 0, i32 15
  store i8* inttoptr (i32 -1 to i8*), i8** %conv, align 4
  %5 = load %struct.loaded_domain*, %struct.loaded_domain** %domain.addr, align 4
  %conv_tab = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %5, i32 0, i32 16
  store i8** null, i8*** %conv_tab, align 4
  %6 = load %struct.loaded_l10nfile*, %struct.loaded_l10nfile** %domain_file.addr, align 4
  %7 = load %struct.binding*, %struct.binding** %domainbinding.addr, align 4
  %call = call i8* @_nl_find_msg(%struct.loaded_l10nfile* %6, %struct.binding* %7, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i32 0, i32 0), i32* %nullentrylen)
  store i8* %call, i8** %nullentry, align 4
  %8 = load i8*, i8** %nullentry, align 4
  %cmp2 = icmp ne i8* %8, null
  br i1 %cmp2, label %if.then, label %if.end28

if.then:                                          ; preds = %cond.end
  %9 = load i8*, i8** %nullentry, align 4
  %call4 = call i8* @strstr(i8* %9, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0))
  store i8* %call4, i8** %charsetstr, align 4
  %10 = load i8*, i8** %charsetstr, align 4
  %cmp5 = icmp ne i8* %10, null
  br i1 %cmp5, label %if.then7, label %if.end27

if.then7:                                         ; preds = %if.then
  %11 = load i8*, i8** %charsetstr, align 4
  %add.ptr = getelementptr inbounds i8, i8* %11, i32 8
  store i8* %add.ptr, i8** %charsetstr, align 4
  %12 = load i8*, i8** %charsetstr, align 4
  %call8 = call i32 @strcspn(i8* %12, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i32 0, i32 0))
  store i32 %call8, i32* %len, align 4
  %13 = load i32, i32* %len, align 4
  %add = add i32 %13, 1
  %14 = alloca i8, i32 %add, align 8
  store i8* %14, i8** %charset, align 4
  %15 = load i8*, i8** %charset, align 4
  %16 = load i8*, i8** %charsetstr, align 4
  %17 = load i32, i32* %len, align 4
  %call9 = call i8* @mempcpy(i8* %15, i8* %16, i32 %17)
  store i8 0, i8* %call9, align 1
  %18 = load %struct.binding*, %struct.binding** %domainbinding.addr, align 4
  %cmp10 = icmp ne %struct.binding* %18, null
  br i1 %cmp10, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %if.then7
  %19 = load %struct.binding*, %struct.binding** %domainbinding.addr, align 4
  %codeset = getelementptr inbounds %struct.binding, %struct.binding* %19, i32 0, i32 3
  %20 = load i8*, i8** %codeset, align 4
  %cmp12 = icmp ne i8* %20, null
  br i1 %cmp12, label %if.then14, label %if.else

if.then14:                                        ; preds = %land.lhs.true
  %21 = load %struct.binding*, %struct.binding** %domainbinding.addr, align 4
  %codeset15 = getelementptr inbounds %struct.binding, %struct.binding* %21, i32 0, i32 3
  %22 = load i8*, i8** %codeset15, align 4
  store i8* %22, i8** %outcharset, align 4
  br label %if.end24

if.else:                                          ; preds = %land.lhs.true, %if.then7
  %call16 = call i8* @getenv(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i32 0, i32 0))
  store i8* %call16, i8** %outcharset, align 4
  %23 = load i8*, i8** %outcharset, align 4
  %cmp17 = icmp eq i8* %23, null
  br i1 %cmp17, label %if.then22, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.else
  %24 = load i8*, i8** %outcharset, align 4
  %arrayidx = getelementptr inbounds i8, i8* %24, i32 0
  %25 = load i8, i8* %arrayidx, align 1
  %conv19 = sext i8 %25 to i32
  %cmp20 = icmp eq i32 %conv19, 0
  br i1 %cmp20, label %if.then22, label %if.end

if.then22:                                        ; preds = %lor.lhs.false, %if.else
  %call23 = call i8* @locale_charset()
  store i8* %call23, i8** %outcharset, align 4
  br label %if.end

if.end:                                           ; preds = %if.then22, %lor.lhs.false
  br label %if.end24

if.end24:                                         ; preds = %if.end, %if.then14
  %26 = load i8*, i8** %outcharset, align 4
  %27 = load i8*, i8** %charset, align 4
  %call25 = call i8* @iconv_open(i8* %26, i8* %27)
  %28 = load %struct.loaded_domain*, %struct.loaded_domain** %domain.addr, align 4
  %conv26 = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %28, i32 0, i32 15
  store i8* %call25, i8** %conv26, align 4
  br label %if.end27

if.end27:                                         ; preds = %if.end24, %if.then
  br label %if.end28

if.end28:                                         ; preds = %if.end27, %cond.end
  %29 = load i8*, i8** %nullentry, align 4
  ret i8* %29
}

declare i8* @_nl_find_msg(%struct.loaded_l10nfile*, %struct.binding*, i8*, i32*) #1

declare i8* @strstr(i8*, i8*) #1

declare i32 @strcspn(i8*, i8*) #1

declare i8* @mempcpy(i8*, i8*, i32) #1

declare i8* @getenv(i8*) #1

declare i8* @locale_charset() #1

declare i8* @iconv_open(i8*, i8*) #1

; Function Attrs: noinline nounwind
define void @_nl_free_domain_conv(%struct.loaded_domain* %domain) #0 {
entry:
  %domain.addr = alloca %struct.loaded_domain*, align 4
  store %struct.loaded_domain* %domain, %struct.loaded_domain** %domain.addr, align 4
  %0 = load %struct.loaded_domain*, %struct.loaded_domain** %domain.addr, align 4
  %conv_tab = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %0, i32 0, i32 16
  %1 = load i8**, i8*** %conv_tab, align 4
  %cmp = icmp ne i8** %1, null
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %2 = load %struct.loaded_domain*, %struct.loaded_domain** %domain.addr, align 4
  %conv_tab1 = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %2, i32 0, i32 16
  %3 = load i8**, i8*** %conv_tab1, align 4
  %cmp2 = icmp ne i8** %3, inttoptr (i32 -1 to i8**)
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %4 = load %struct.loaded_domain*, %struct.loaded_domain** %domain.addr, align 4
  %conv_tab3 = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %4, i32 0, i32 16
  %5 = load i8**, i8*** %conv_tab3, align 4
  %6 = bitcast i8** %5 to i8*
  call void @free(i8* %6)
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %7 = load %struct.loaded_domain*, %struct.loaded_domain** %domain.addr, align 4
  %conv = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %7, i32 0, i32 15
  %8 = load i8*, i8** %conv, align 4
  %cmp4 = icmp ne i8* %8, inttoptr (i32 -1 to i8*)
  br i1 %cmp4, label %if.then6, label %if.end8

if.then6:                                         ; preds = %if.end
  %9 = load %struct.loaded_domain*, %struct.loaded_domain** %domain.addr, align 4
  %conv7 = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %9, i32 0, i32 15
  %10 = load i8*, i8** %conv7, align 4
  %call = call i32 @iconv_close(i8* %10)
  br label %if.end8

if.end8:                                          ; preds = %if.then6, %if.end
  ret void
}

declare void @free(i8*) #1

declare i32 @iconv_close(i8*) #1

; Function Attrs: noinline nounwind
define void @_nl_load_domain(%struct.loaded_l10nfile* %domain_file, %struct.binding* %domainbinding) #0 {
entry:
  %domain_file.addr = alloca %struct.loaded_l10nfile*, align 4
  %domainbinding.addr = alloca %struct.binding*, align 4
  %fd = alloca i32, align 4
  %size = alloca i32, align 4
  %st = alloca %struct.stat, align 8
  %data = alloca %struct.mo_file_header*, align 4
  %use_mmap = alloca i32, align 4
  %domain = alloca %struct.loaded_domain*, align 4
  %revision = alloca i32, align 4
  %nullentry = alloca i8*, align 4
  %to_read = alloca i32, align 4
  %read_ptr = alloca i8*, align 4
  %nb = alloca i32, align 4
  %n_sysdep_strings111 = alloca i32, align 4
  %n_sysdep_segments = alloca i32, align 4
  %sysdep_segments = alloca %struct.sysdep_segment*, align 4
  %sysdep_segment_values = alloca i8**, align 4
  %orig_sysdep_tab129 = alloca i32*, align 4
  %trans_sysdep_tab130 = alloca i32*, align 4
  %memneed = alloca i32, align 4
  %mem = alloca i8*, align 4
  %inmem_orig_sysdep_tab = alloca %struct.sysdep_string_desc*, align 4
  %inmem_trans_sysdep_tab = alloca %struct.sysdep_string_desc*, align 4
  %inmem_hash_tab = alloca i32*, align 4
  %i = alloca i32, align 4
  %name = alloca i8*, align 4
  %namelen = alloca i32, align 4
  %sysdep_string = alloca %struct.sysdep_string*, align 4
  %need = alloca i32, align 4
  %p = alloca %struct.segment_pair*, align 4
  %sysdepref250 = alloca i32, align 4
  %sysdep_string305 = alloca %struct.sysdep_string*, align 4
  %static_segments = alloca i8*, align 4
  %p342 = alloca %struct.segment_pair*, align 4
  %segsize374 = alloca i32, align 4
  %sysdepref384 = alloca i32, align 4
  %n = alloca i32, align 4
  %msgid = alloca i8*, align 4
  %hash_val = alloca i32, align 4
  %idx = alloca i32, align 4
  %incr = alloca i32, align 4
  store %struct.loaded_l10nfile* %domain_file, %struct.loaded_l10nfile** %domain_file.addr, align 4
  store %struct.binding* %domainbinding, %struct.binding** %domainbinding.addr, align 4
  store %struct.mo_file_header* inttoptr (i32 -1 to %struct.mo_file_header*), %struct.mo_file_header** %data, align 4
  store i32 0, i32* %use_mmap, align 4
  %0 = load %struct.loaded_l10nfile*, %struct.loaded_l10nfile** %domain_file.addr, align 4
  %decided = getelementptr inbounds %struct.loaded_l10nfile, %struct.loaded_l10nfile* %0, i32 0, i32 1
  store i32 1, i32* %decided, align 4
  %1 = load %struct.loaded_l10nfile*, %struct.loaded_l10nfile** %domain_file.addr, align 4
  %data1 = getelementptr inbounds %struct.loaded_l10nfile, %struct.loaded_l10nfile* %1, i32 0, i32 2
  store i8* null, i8** %data1, align 4
  %2 = load %struct.loaded_l10nfile*, %struct.loaded_l10nfile** %domain_file.addr, align 4
  %filename = getelementptr inbounds %struct.loaded_l10nfile, %struct.loaded_l10nfile* %2, i32 0, i32 0
  %3 = load i8*, i8** %filename, align 4
  %cmp = icmp eq i8* %3, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %return

if.end:                                           ; preds = %entry
  %4 = load %struct.loaded_l10nfile*, %struct.loaded_l10nfile** %domain_file.addr, align 4
  %filename2 = getelementptr inbounds %struct.loaded_l10nfile, %struct.loaded_l10nfile* %4, i32 0, i32 0
  %5 = load i8*, i8** %filename2, align 4
  %call = call i32 (i8*, i32, ...) @open(i8* %5, i32 0)
  store i32 %call, i32* %fd, align 4
  %6 = load i32, i32* %fd, align 4
  %cmp3 = icmp eq i32 %6, -1
  br i1 %cmp3, label %if.then4, label %if.end5

if.then4:                                         ; preds = %if.end
  br label %return

if.end5:                                          ; preds = %if.end
  %7 = load i32, i32* %fd, align 4
  %call6 = call i32 @fstat(i32 %7, %struct.stat* %st)
  %cmp7 = icmp ne i32 %call6, 0
  br i1 %cmp7, label %if.then12, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end5
  %st_size = getelementptr inbounds %struct.stat, %struct.stat* %st, i32 0, i32 12
  %8 = load i32, i32* %st_size, align 8
  store i32 %8, i32* %size, align 4
  %st_size8 = getelementptr inbounds %struct.stat, %struct.stat* %st, i32 0, i32 12
  %9 = load i32, i32* %st_size8, align 8
  %cmp9 = icmp ne i32 %8, %9
  br i1 %cmp9, label %if.then12, label %lor.lhs.false10

lor.lhs.false10:                                  ; preds = %lor.lhs.false
  %10 = load i32, i32* %size, align 4
  %cmp11 = icmp ult i32 %10, 48
  br i1 %cmp11, label %if.then12, label %if.end14

if.then12:                                        ; preds = %lor.lhs.false10, %lor.lhs.false, %if.end5
  %11 = load i32, i32* %fd, align 4
  %call13 = call i32 @close(i32 %11)
  br label %return

if.end14:                                         ; preds = %lor.lhs.false10
  %12 = load %struct.mo_file_header*, %struct.mo_file_header** %data, align 4
  %cmp15 = icmp eq %struct.mo_file_header* %12, inttoptr (i32 -1 to %struct.mo_file_header*)
  br i1 %cmp15, label %if.then16, label %if.end37

if.then16:                                        ; preds = %if.end14
  %13 = load i32, i32* %size, align 4
  %call17 = call i8* @malloc(i32 %13)
  %14 = bitcast i8* %call17 to %struct.mo_file_header*
  store %struct.mo_file_header* %14, %struct.mo_file_header** %data, align 4
  %15 = load %struct.mo_file_header*, %struct.mo_file_header** %data, align 4
  %cmp18 = icmp eq %struct.mo_file_header* %15, null
  br i1 %cmp18, label %if.then19, label %if.end24

if.then19:                                        ; preds = %if.then16
  %16 = load i32, i32* %use_mmap, align 4
  %cmp20 = icmp eq i32 %16, 0
  br i1 %cmp20, label %if.then21, label %if.end23

if.then21:                                        ; preds = %if.then19
  %17 = load i32, i32* %fd, align 4
  %call22 = call i32 @close(i32 %17)
  br label %if.end23

if.end23:                                         ; preds = %if.then21, %if.then19
  br label %return

if.end24:                                         ; preds = %if.then16
  %18 = load i32, i32* %size, align 4
  store i32 %18, i32* %to_read, align 4
  %19 = load %struct.mo_file_header*, %struct.mo_file_header** %data, align 4
  %20 = bitcast %struct.mo_file_header* %19 to i8*
  store i8* %20, i8** %read_ptr, align 4
  br label %do.body

do.body:                                          ; preds = %do.cond, %if.end24
  %21 = load i32, i32* %fd, align 4
  %22 = load i8*, i8** %read_ptr, align 4
  %23 = load i32, i32* %to_read, align 4
  %call25 = call i32 @read(i32 %21, i8* %22, i32 %23)
  store i32 %call25, i32* %nb, align 4
  %24 = load i32, i32* %nb, align 4
  %cmp26 = icmp sle i32 %24, 0
  br i1 %cmp26, label %if.then27, label %if.end34

if.then27:                                        ; preds = %do.body
  %25 = load i32, i32* %nb, align 4
  %cmp28 = icmp eq i32 %25, -1
  br i1 %cmp28, label %land.lhs.true, label %if.end32

land.lhs.true:                                    ; preds = %if.then27
  %call29 = call i32* @__errno_location()
  %26 = load i32, i32* %call29, align 4
  %cmp30 = icmp eq i32 %26, 4
  br i1 %cmp30, label %if.then31, label %if.end32

if.then31:                                        ; preds = %land.lhs.true
  br label %do.cond

if.end32:                                         ; preds = %land.lhs.true, %if.then27
  %27 = load i32, i32* %fd, align 4
  %call33 = call i32 @close(i32 %27)
  br label %return

if.end34:                                         ; preds = %do.body
  %28 = load i32, i32* %nb, align 4
  %29 = load i8*, i8** %read_ptr, align 4
  %add.ptr = getelementptr inbounds i8, i8* %29, i32 %28
  store i8* %add.ptr, i8** %read_ptr, align 4
  %30 = load i32, i32* %nb, align 4
  %31 = load i32, i32* %to_read, align 4
  %sub = sub i32 %31, %30
  store i32 %sub, i32* %to_read, align 4
  br label %do.cond

do.cond:                                          ; preds = %if.end34, %if.then31
  %32 = load i32, i32* %to_read, align 4
  %cmp35 = icmp ugt i32 %32, 0
  br i1 %cmp35, label %do.body, label %do.end

do.end:                                           ; preds = %do.cond
  %33 = load i32, i32* %fd, align 4
  %call36 = call i32 @close(i32 %33)
  br label %if.end37

if.end37:                                         ; preds = %do.end, %if.end14
  %34 = load %struct.mo_file_header*, %struct.mo_file_header** %data, align 4
  %magic = getelementptr inbounds %struct.mo_file_header, %struct.mo_file_header* %34, i32 0, i32 0
  %35 = load i32, i32* %magic, align 4
  %cmp38 = icmp ne i32 %35, -1794895138
  br i1 %cmp38, label %land.lhs.true39, label %if.end43

land.lhs.true39:                                  ; preds = %if.end37
  %36 = load %struct.mo_file_header*, %struct.mo_file_header** %data, align 4
  %magic40 = getelementptr inbounds %struct.mo_file_header, %struct.mo_file_header* %36, i32 0, i32 0
  %37 = load i32, i32* %magic40, align 4
  %cmp41 = icmp ne i32 %37, -569244523
  br i1 %cmp41, label %if.then42, label %if.end43

if.then42:                                        ; preds = %land.lhs.true39
  %38 = load %struct.mo_file_header*, %struct.mo_file_header** %data, align 4
  %39 = bitcast %struct.mo_file_header* %38 to i8*
  call void @free(i8* %39)
  br label %return

if.end43:                                         ; preds = %land.lhs.true39, %if.end37
  %call44 = call i8* @malloc(i32 76)
  %40 = bitcast i8* %call44 to %struct.loaded_domain*
  store %struct.loaded_domain* %40, %struct.loaded_domain** %domain, align 4
  %41 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %cmp45 = icmp eq %struct.loaded_domain* %41, null
  br i1 %cmp45, label %if.then46, label %if.end47

if.then46:                                        ; preds = %if.end43
  %42 = load %struct.mo_file_header*, %struct.mo_file_header** %data, align 4
  %43 = bitcast %struct.mo_file_header* %42 to i8*
  call void @free(i8* %43)
  br label %return

if.end47:                                         ; preds = %if.end43
  %44 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %45 = bitcast %struct.loaded_domain* %44 to i8*
  %46 = load %struct.loaded_l10nfile*, %struct.loaded_l10nfile** %domain_file.addr, align 4
  %data48 = getelementptr inbounds %struct.loaded_l10nfile, %struct.loaded_l10nfile* %46, i32 0, i32 2
  store i8* %45, i8** %data48, align 4
  %47 = load %struct.mo_file_header*, %struct.mo_file_header** %data, align 4
  %48 = bitcast %struct.mo_file_header* %47 to i8*
  %49 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %data49 = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %49, i32 0, i32 0
  store i8* %48, i8** %data49, align 4
  %50 = load i32, i32* %use_mmap, align 4
  %51 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %use_mmap50 = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %51, i32 0, i32 1
  store i32 %50, i32* %use_mmap50, align 4
  %52 = load i32, i32* %size, align 4
  %53 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %mmap_size = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %53, i32 0, i32 2
  store i32 %52, i32* %mmap_size, align 4
  %54 = load %struct.mo_file_header*, %struct.mo_file_header** %data, align 4
  %magic51 = getelementptr inbounds %struct.mo_file_header, %struct.mo_file_header* %54, i32 0, i32 0
  %55 = load i32, i32* %magic51, align 4
  %cmp52 = icmp ne i32 %55, -1794895138
  %conv = zext i1 %cmp52 to i32
  %56 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %must_swap = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %56, i32 0, i32 3
  store i32 %conv, i32* %must_swap, align 4
  %57 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %malloced = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %57, i32 0, i32 4
  store i8* null, i8** %malloced, align 4
  %58 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %must_swap53 = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %58, i32 0, i32 3
  %59 = load i32, i32* %must_swap53, align 4
  %tobool = icmp ne i32 %59, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end47
  %60 = load %struct.mo_file_header*, %struct.mo_file_header** %data, align 4
  %revision54 = getelementptr inbounds %struct.mo_file_header, %struct.mo_file_header* %60, i32 0, i32 1
  %61 = load i32, i32* %revision54, align 4
  %call55 = call i32 @SWAP(i32 %61)
  br label %cond.end

cond.false:                                       ; preds = %if.end47
  %62 = load %struct.mo_file_header*, %struct.mo_file_header** %data, align 4
  %revision56 = getelementptr inbounds %struct.mo_file_header, %struct.mo_file_header* %62, i32 0, i32 1
  %63 = load i32, i32* %revision56, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call55, %cond.true ], [ %63, %cond.false ]
  store i32 %cond, i32* %revision, align 4
  %64 = load i32, i32* %revision, align 4
  %shr = ashr i32 %64, 16
  switch i32 %shr, label %sw.default486 [
    i32 0, label %sw.bb
  ]

sw.bb:                                            ; preds = %cond.end
  %65 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %must_swap57 = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %65, i32 0, i32 3
  %66 = load i32, i32* %must_swap57, align 4
  %tobool58 = icmp ne i32 %66, 0
  br i1 %tobool58, label %cond.true59, label %cond.false61

cond.true59:                                      ; preds = %sw.bb
  %67 = load %struct.mo_file_header*, %struct.mo_file_header** %data, align 4
  %nstrings = getelementptr inbounds %struct.mo_file_header, %struct.mo_file_header* %67, i32 0, i32 2
  %68 = load i32, i32* %nstrings, align 4
  %call60 = call i32 @SWAP(i32 %68)
  br label %cond.end63

cond.false61:                                     ; preds = %sw.bb
  %69 = load %struct.mo_file_header*, %struct.mo_file_header** %data, align 4
  %nstrings62 = getelementptr inbounds %struct.mo_file_header, %struct.mo_file_header* %69, i32 0, i32 2
  %70 = load i32, i32* %nstrings62, align 4
  br label %cond.end63

cond.end63:                                       ; preds = %cond.false61, %cond.true59
  %cond64 = phi i32 [ %call60, %cond.true59 ], [ %70, %cond.false61 ]
  %71 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %nstrings65 = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %71, i32 0, i32 5
  store i32 %cond64, i32* %nstrings65, align 4
  %72 = load %struct.mo_file_header*, %struct.mo_file_header** %data, align 4
  %73 = bitcast %struct.mo_file_header* %72 to i8*
  %74 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %must_swap66 = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %74, i32 0, i32 3
  %75 = load i32, i32* %must_swap66, align 4
  %tobool67 = icmp ne i32 %75, 0
  br i1 %tobool67, label %cond.true68, label %cond.false70

cond.true68:                                      ; preds = %cond.end63
  %76 = load %struct.mo_file_header*, %struct.mo_file_header** %data, align 4
  %orig_tab_offset = getelementptr inbounds %struct.mo_file_header, %struct.mo_file_header* %76, i32 0, i32 3
  %77 = load i32, i32* %orig_tab_offset, align 4
  %call69 = call i32 @SWAP(i32 %77)
  br label %cond.end72

cond.false70:                                     ; preds = %cond.end63
  %78 = load %struct.mo_file_header*, %struct.mo_file_header** %data, align 4
  %orig_tab_offset71 = getelementptr inbounds %struct.mo_file_header, %struct.mo_file_header* %78, i32 0, i32 3
  %79 = load i32, i32* %orig_tab_offset71, align 4
  br label %cond.end72

cond.end72:                                       ; preds = %cond.false70, %cond.true68
  %cond73 = phi i32 [ %call69, %cond.true68 ], [ %79, %cond.false70 ]
  %add.ptr74 = getelementptr inbounds i8, i8* %73, i32 %cond73
  %80 = bitcast i8* %add.ptr74 to %struct.string_desc*
  %81 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %orig_tab = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %81, i32 0, i32 6
  store %struct.string_desc* %80, %struct.string_desc** %orig_tab, align 4
  %82 = load %struct.mo_file_header*, %struct.mo_file_header** %data, align 4
  %83 = bitcast %struct.mo_file_header* %82 to i8*
  %84 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %must_swap75 = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %84, i32 0, i32 3
  %85 = load i32, i32* %must_swap75, align 4
  %tobool76 = icmp ne i32 %85, 0
  br i1 %tobool76, label %cond.true77, label %cond.false79

cond.true77:                                      ; preds = %cond.end72
  %86 = load %struct.mo_file_header*, %struct.mo_file_header** %data, align 4
  %trans_tab_offset = getelementptr inbounds %struct.mo_file_header, %struct.mo_file_header* %86, i32 0, i32 4
  %87 = load i32, i32* %trans_tab_offset, align 4
  %call78 = call i32 @SWAP(i32 %87)
  br label %cond.end81

cond.false79:                                     ; preds = %cond.end72
  %88 = load %struct.mo_file_header*, %struct.mo_file_header** %data, align 4
  %trans_tab_offset80 = getelementptr inbounds %struct.mo_file_header, %struct.mo_file_header* %88, i32 0, i32 4
  %89 = load i32, i32* %trans_tab_offset80, align 4
  br label %cond.end81

cond.end81:                                       ; preds = %cond.false79, %cond.true77
  %cond82 = phi i32 [ %call78, %cond.true77 ], [ %89, %cond.false79 ]
  %add.ptr83 = getelementptr inbounds i8, i8* %83, i32 %cond82
  %90 = bitcast i8* %add.ptr83 to %struct.string_desc*
  %91 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %trans_tab = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %91, i32 0, i32 7
  store %struct.string_desc* %90, %struct.string_desc** %trans_tab, align 4
  %92 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %must_swap84 = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %92, i32 0, i32 3
  %93 = load i32, i32* %must_swap84, align 4
  %tobool85 = icmp ne i32 %93, 0
  br i1 %tobool85, label %cond.true86, label %cond.false88

cond.true86:                                      ; preds = %cond.end81
  %94 = load %struct.mo_file_header*, %struct.mo_file_header** %data, align 4
  %hash_tab_size = getelementptr inbounds %struct.mo_file_header, %struct.mo_file_header* %94, i32 0, i32 5
  %95 = load i32, i32* %hash_tab_size, align 4
  %call87 = call i32 @SWAP(i32 %95)
  br label %cond.end90

cond.false88:                                     ; preds = %cond.end81
  %96 = load %struct.mo_file_header*, %struct.mo_file_header** %data, align 4
  %hash_tab_size89 = getelementptr inbounds %struct.mo_file_header, %struct.mo_file_header* %96, i32 0, i32 5
  %97 = load i32, i32* %hash_tab_size89, align 4
  br label %cond.end90

cond.end90:                                       ; preds = %cond.false88, %cond.true86
  %cond91 = phi i32 [ %call87, %cond.true86 ], [ %97, %cond.false88 ]
  %98 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %hash_size = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %98, i32 0, i32 11
  store i32 %cond91, i32* %hash_size, align 4
  %99 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %hash_size92 = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %99, i32 0, i32 11
  %100 = load i32, i32* %hash_size92, align 4
  %cmp93 = icmp ugt i32 %100, 2
  br i1 %cmp93, label %cond.true95, label %cond.false105

cond.true95:                                      ; preds = %cond.end90
  %101 = load %struct.mo_file_header*, %struct.mo_file_header** %data, align 4
  %102 = bitcast %struct.mo_file_header* %101 to i8*
  %103 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %must_swap96 = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %103, i32 0, i32 3
  %104 = load i32, i32* %must_swap96, align 4
  %tobool97 = icmp ne i32 %104, 0
  br i1 %tobool97, label %cond.true98, label %cond.false100

cond.true98:                                      ; preds = %cond.true95
  %105 = load %struct.mo_file_header*, %struct.mo_file_header** %data, align 4
  %hash_tab_offset = getelementptr inbounds %struct.mo_file_header, %struct.mo_file_header* %105, i32 0, i32 6
  %106 = load i32, i32* %hash_tab_offset, align 4
  %call99 = call i32 @SWAP(i32 %106)
  br label %cond.end102

cond.false100:                                    ; preds = %cond.true95
  %107 = load %struct.mo_file_header*, %struct.mo_file_header** %data, align 4
  %hash_tab_offset101 = getelementptr inbounds %struct.mo_file_header, %struct.mo_file_header* %107, i32 0, i32 6
  %108 = load i32, i32* %hash_tab_offset101, align 4
  br label %cond.end102

cond.end102:                                      ; preds = %cond.false100, %cond.true98
  %cond103 = phi i32 [ %call99, %cond.true98 ], [ %108, %cond.false100 ]
  %add.ptr104 = getelementptr inbounds i8, i8* %102, i32 %cond103
  %109 = bitcast i8* %add.ptr104 to i32*
  br label %cond.end106

cond.false105:                                    ; preds = %cond.end90
  br label %cond.end106

cond.end106:                                      ; preds = %cond.false105, %cond.end102
  %cond107 = phi i32* [ %109, %cond.end102 ], [ null, %cond.false105 ]
  %110 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %hash_tab = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %110, i32 0, i32 12
  store i32* %cond107, i32** %hash_tab, align 4
  %111 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %must_swap108 = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %111, i32 0, i32 3
  %112 = load i32, i32* %must_swap108, align 4
  %113 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %must_swap_hash_tab = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %113, i32 0, i32 13
  store i32 %112, i32* %must_swap_hash_tab, align 4
  %114 = load i32, i32* %revision, align 4
  %and = and i32 %114, 65535
  switch i32 %and, label %sw.default [
    i32 0, label %sw.bb109
    i32 1, label %sw.bb110
  ]

sw.bb109:                                         ; preds = %cond.end106
  %115 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %n_sysdep_strings = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %115, i32 0, i32 8
  store i32 0, i32* %n_sysdep_strings, align 4
  %116 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %orig_sysdep_tab = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %116, i32 0, i32 9
  store %struct.sysdep_string_desc* null, %struct.sysdep_string_desc** %orig_sysdep_tab, align 4
  %117 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %trans_sysdep_tab = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %117, i32 0, i32 10
  store %struct.sysdep_string_desc* null, %struct.sysdep_string_desc** %trans_sysdep_tab, align 4
  br label %sw.epilog

sw.bb110:                                         ; preds = %cond.end106
  br label %sw.default

sw.default:                                       ; preds = %cond.end106, %sw.bb110
  %118 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %hash_tab112 = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %118, i32 0, i32 12
  %119 = load i32*, i32** %hash_tab112, align 4
  %cmp113 = icmp eq i32* %119, null
  br i1 %cmp113, label %if.then115, label %if.end116

if.then115:                                       ; preds = %sw.default
  br label %invalid

if.end116:                                        ; preds = %sw.default
  %120 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %must_swap117 = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %120, i32 0, i32 3
  %121 = load i32, i32* %must_swap117, align 4
  %tobool118 = icmp ne i32 %121, 0
  br i1 %tobool118, label %cond.true119, label %cond.false122

cond.true119:                                     ; preds = %if.end116
  %122 = load %struct.mo_file_header*, %struct.mo_file_header** %data, align 4
  %n_sysdep_strings120 = getelementptr inbounds %struct.mo_file_header, %struct.mo_file_header* %122, i32 0, i32 9
  %123 = load i32, i32* %n_sysdep_strings120, align 4
  %call121 = call i32 @SWAP(i32 %123)
  br label %cond.end124

cond.false122:                                    ; preds = %if.end116
  %124 = load %struct.mo_file_header*, %struct.mo_file_header** %data, align 4
  %n_sysdep_strings123 = getelementptr inbounds %struct.mo_file_header, %struct.mo_file_header* %124, i32 0, i32 9
  %125 = load i32, i32* %n_sysdep_strings123, align 4
  br label %cond.end124

cond.end124:                                      ; preds = %cond.false122, %cond.true119
  %cond125 = phi i32 [ %call121, %cond.true119 ], [ %125, %cond.false122 ]
  store i32 %cond125, i32* %n_sysdep_strings111, align 4
  %126 = load i32, i32* %n_sysdep_strings111, align 4
  %cmp126 = icmp ugt i32 %126, 0
  br i1 %cmp126, label %if.then128, label %if.else481

if.then128:                                       ; preds = %cond.end124
  %127 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %must_swap131 = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %127, i32 0, i32 3
  %128 = load i32, i32* %must_swap131, align 4
  %tobool132 = icmp ne i32 %128, 0
  br i1 %tobool132, label %cond.true133, label %cond.false136

cond.true133:                                     ; preds = %if.then128
  %129 = load %struct.mo_file_header*, %struct.mo_file_header** %data, align 4
  %n_sysdep_segments134 = getelementptr inbounds %struct.mo_file_header, %struct.mo_file_header* %129, i32 0, i32 7
  %130 = load i32, i32* %n_sysdep_segments134, align 4
  %call135 = call i32 @SWAP(i32 %130)
  br label %cond.end138

cond.false136:                                    ; preds = %if.then128
  %131 = load %struct.mo_file_header*, %struct.mo_file_header** %data, align 4
  %n_sysdep_segments137 = getelementptr inbounds %struct.mo_file_header, %struct.mo_file_header* %131, i32 0, i32 7
  %132 = load i32, i32* %n_sysdep_segments137, align 4
  br label %cond.end138

cond.end138:                                      ; preds = %cond.false136, %cond.true133
  %cond139 = phi i32 [ %call135, %cond.true133 ], [ %132, %cond.false136 ]
  store i32 %cond139, i32* %n_sysdep_segments, align 4
  %133 = load %struct.mo_file_header*, %struct.mo_file_header** %data, align 4
  %134 = bitcast %struct.mo_file_header* %133 to i8*
  %135 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %must_swap140 = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %135, i32 0, i32 3
  %136 = load i32, i32* %must_swap140, align 4
  %tobool141 = icmp ne i32 %136, 0
  br i1 %tobool141, label %cond.true142, label %cond.false144

cond.true142:                                     ; preds = %cond.end138
  %137 = load %struct.mo_file_header*, %struct.mo_file_header** %data, align 4
  %sysdep_segments_offset = getelementptr inbounds %struct.mo_file_header, %struct.mo_file_header* %137, i32 0, i32 8
  %138 = load i32, i32* %sysdep_segments_offset, align 4
  %call143 = call i32 @SWAP(i32 %138)
  br label %cond.end146

cond.false144:                                    ; preds = %cond.end138
  %139 = load %struct.mo_file_header*, %struct.mo_file_header** %data, align 4
  %sysdep_segments_offset145 = getelementptr inbounds %struct.mo_file_header, %struct.mo_file_header* %139, i32 0, i32 8
  %140 = load i32, i32* %sysdep_segments_offset145, align 4
  br label %cond.end146

cond.end146:                                      ; preds = %cond.false144, %cond.true142
  %cond147 = phi i32 [ %call143, %cond.true142 ], [ %140, %cond.false144 ]
  %add.ptr148 = getelementptr inbounds i8, i8* %134, i32 %cond147
  %141 = bitcast i8* %add.ptr148 to %struct.sysdep_segment*
  store %struct.sysdep_segment* %141, %struct.sysdep_segment** %sysdep_segments, align 4
  %142 = load i32, i32* %n_sysdep_segments, align 4
  %mul = mul i32 %142, 4
  %143 = alloca i8, i32 %mul, align 8
  %144 = bitcast i8* %143 to i8**
  store i8** %144, i8*** %sysdep_segment_values, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %cond.end146
  %145 = load i32, i32* %i, align 4
  %146 = load i32, i32* %n_sysdep_segments, align 4
  %cmp149 = icmp ult i32 %145, %146
  br i1 %cmp149, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %147 = load %struct.mo_file_header*, %struct.mo_file_header** %data, align 4
  %148 = bitcast %struct.mo_file_header* %147 to i8*
  %149 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %must_swap151 = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %149, i32 0, i32 3
  %150 = load i32, i32* %must_swap151, align 4
  %tobool152 = icmp ne i32 %150, 0
  br i1 %tobool152, label %cond.true153, label %cond.false155

cond.true153:                                     ; preds = %for.body
  %151 = load %struct.sysdep_segment*, %struct.sysdep_segment** %sysdep_segments, align 4
  %152 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds %struct.sysdep_segment, %struct.sysdep_segment* %151, i32 %152
  %offset = getelementptr inbounds %struct.sysdep_segment, %struct.sysdep_segment* %arrayidx, i32 0, i32 1
  %153 = load i32, i32* %offset, align 4
  %call154 = call i32 @SWAP(i32 %153)
  br label %cond.end158

cond.false155:                                    ; preds = %for.body
  %154 = load %struct.sysdep_segment*, %struct.sysdep_segment** %sysdep_segments, align 4
  %155 = load i32, i32* %i, align 4
  %arrayidx156 = getelementptr inbounds %struct.sysdep_segment, %struct.sysdep_segment* %154, i32 %155
  %offset157 = getelementptr inbounds %struct.sysdep_segment, %struct.sysdep_segment* %arrayidx156, i32 0, i32 1
  %156 = load i32, i32* %offset157, align 4
  br label %cond.end158

cond.end158:                                      ; preds = %cond.false155, %cond.true153
  %cond159 = phi i32 [ %call154, %cond.true153 ], [ %156, %cond.false155 ]
  %add.ptr160 = getelementptr inbounds i8, i8* %148, i32 %cond159
  store i8* %add.ptr160, i8** %name, align 4
  %157 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %must_swap161 = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %157, i32 0, i32 3
  %158 = load i32, i32* %must_swap161, align 4
  %tobool162 = icmp ne i32 %158, 0
  br i1 %tobool162, label %cond.true163, label %cond.false166

cond.true163:                                     ; preds = %cond.end158
  %159 = load %struct.sysdep_segment*, %struct.sysdep_segment** %sysdep_segments, align 4
  %160 = load i32, i32* %i, align 4
  %arrayidx164 = getelementptr inbounds %struct.sysdep_segment, %struct.sysdep_segment* %159, i32 %160
  %length = getelementptr inbounds %struct.sysdep_segment, %struct.sysdep_segment* %arrayidx164, i32 0, i32 0
  %161 = load i32, i32* %length, align 4
  %call165 = call i32 @SWAP(i32 %161)
  br label %cond.end169

cond.false166:                                    ; preds = %cond.end158
  %162 = load %struct.sysdep_segment*, %struct.sysdep_segment** %sysdep_segments, align 4
  %163 = load i32, i32* %i, align 4
  %arrayidx167 = getelementptr inbounds %struct.sysdep_segment, %struct.sysdep_segment* %162, i32 %163
  %length168 = getelementptr inbounds %struct.sysdep_segment, %struct.sysdep_segment* %arrayidx167, i32 0, i32 0
  %164 = load i32, i32* %length168, align 4
  br label %cond.end169

cond.end169:                                      ; preds = %cond.false166, %cond.true163
  %cond170 = phi i32 [ %call165, %cond.true163 ], [ %164, %cond.false166 ]
  store i32 %cond170, i32* %namelen, align 4
  %165 = load i32, i32* %namelen, align 4
  %cmp171 = icmp ugt i32 %165, 0
  br i1 %cmp171, label %land.lhs.true173, label %if.then179

land.lhs.true173:                                 ; preds = %cond.end169
  %166 = load i8*, i8** %name, align 4
  %167 = load i32, i32* %namelen, align 4
  %sub174 = sub i32 %167, 1
  %arrayidx175 = getelementptr inbounds i8, i8* %166, i32 %sub174
  %168 = load i8, i8* %arrayidx175, align 1
  %conv176 = sext i8 %168 to i32
  %cmp177 = icmp eq i32 %conv176, 0
  br i1 %cmp177, label %if.end180, label %if.then179

if.then179:                                       ; preds = %land.lhs.true173, %cond.end169
  br label %invalid

if.end180:                                        ; preds = %land.lhs.true173
  %169 = load i8*, i8** %name, align 4
  %call181 = call i8* @get_sysdep_segment_value(i8* %169)
  %170 = load i8**, i8*** %sysdep_segment_values, align 4
  %171 = load i32, i32* %i, align 4
  %arrayidx182 = getelementptr inbounds i8*, i8** %170, i32 %171
  store i8* %call181, i8** %arrayidx182, align 4
  br label %for.inc

for.inc:                                          ; preds = %if.end180
  %172 = load i32, i32* %i, align 4
  %inc = add i32 %172, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %173 = load %struct.mo_file_header*, %struct.mo_file_header** %data, align 4
  %174 = bitcast %struct.mo_file_header* %173 to i8*
  %175 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %must_swap183 = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %175, i32 0, i32 3
  %176 = load i32, i32* %must_swap183, align 4
  %tobool184 = icmp ne i32 %176, 0
  br i1 %tobool184, label %cond.true185, label %cond.false187

cond.true185:                                     ; preds = %for.end
  %177 = load %struct.mo_file_header*, %struct.mo_file_header** %data, align 4
  %orig_sysdep_tab_offset = getelementptr inbounds %struct.mo_file_header, %struct.mo_file_header* %177, i32 0, i32 10
  %178 = load i32, i32* %orig_sysdep_tab_offset, align 4
  %call186 = call i32 @SWAP(i32 %178)
  br label %cond.end189

cond.false187:                                    ; preds = %for.end
  %179 = load %struct.mo_file_header*, %struct.mo_file_header** %data, align 4
  %orig_sysdep_tab_offset188 = getelementptr inbounds %struct.mo_file_header, %struct.mo_file_header* %179, i32 0, i32 10
  %180 = load i32, i32* %orig_sysdep_tab_offset188, align 4
  br label %cond.end189

cond.end189:                                      ; preds = %cond.false187, %cond.true185
  %cond190 = phi i32 [ %call186, %cond.true185 ], [ %180, %cond.false187 ]
  %add.ptr191 = getelementptr inbounds i8, i8* %174, i32 %cond190
  %181 = bitcast i8* %add.ptr191 to i32*
  store i32* %181, i32** %orig_sysdep_tab129, align 4
  %182 = load %struct.mo_file_header*, %struct.mo_file_header** %data, align 4
  %183 = bitcast %struct.mo_file_header* %182 to i8*
  %184 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %must_swap192 = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %184, i32 0, i32 3
  %185 = load i32, i32* %must_swap192, align 4
  %tobool193 = icmp ne i32 %185, 0
  br i1 %tobool193, label %cond.true194, label %cond.false196

cond.true194:                                     ; preds = %cond.end189
  %186 = load %struct.mo_file_header*, %struct.mo_file_header** %data, align 4
  %trans_sysdep_tab_offset = getelementptr inbounds %struct.mo_file_header, %struct.mo_file_header* %186, i32 0, i32 11
  %187 = load i32, i32* %trans_sysdep_tab_offset, align 4
  %call195 = call i32 @SWAP(i32 %187)
  br label %cond.end198

cond.false196:                                    ; preds = %cond.end189
  %188 = load %struct.mo_file_header*, %struct.mo_file_header** %data, align 4
  %trans_sysdep_tab_offset197 = getelementptr inbounds %struct.mo_file_header, %struct.mo_file_header* %188, i32 0, i32 11
  %189 = load i32, i32* %trans_sysdep_tab_offset197, align 4
  br label %cond.end198

cond.end198:                                      ; preds = %cond.false196, %cond.true194
  %cond199 = phi i32 [ %call195, %cond.true194 ], [ %189, %cond.false196 ]
  %add.ptr200 = getelementptr inbounds i8, i8* %183, i32 %cond199
  %190 = bitcast i8* %add.ptr200 to i32*
  store i32* %190, i32** %trans_sysdep_tab130, align 4
  %191 = load i32, i32* %n_sysdep_strings111, align 4
  %mul201 = mul i32 2, %191
  %mul202 = mul i32 %mul201, 8
  %192 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %hash_size203 = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %192, i32 0, i32 11
  %193 = load i32, i32* %hash_size203, align 4
  %mul204 = mul i32 %193, 4
  %add = add i32 %mul202, %mul204
  store i32 %add, i32* %memneed, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond205

for.cond205:                                      ; preds = %for.inc284, %cond.end198
  %194 = load i32, i32* %i, align 4
  %195 = load i32, i32* %n_sysdep_strings111, align 4
  %mul206 = mul i32 2, %195
  %cmp207 = icmp ult i32 %194, %mul206
  br i1 %cmp207, label %for.body209, label %for.end286

for.body209:                                      ; preds = %for.cond205
  %196 = load %struct.mo_file_header*, %struct.mo_file_header** %data, align 4
  %197 = bitcast %struct.mo_file_header* %196 to i8*
  %198 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %must_swap210 = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %198, i32 0, i32 3
  %199 = load i32, i32* %must_swap210, align 4
  %tobool211 = icmp ne i32 %199, 0
  br i1 %tobool211, label %cond.true212, label %cond.false223

cond.true212:                                     ; preds = %for.body209
  %200 = load i32, i32* %i, align 4
  %201 = load i32, i32* %n_sysdep_strings111, align 4
  %cmp213 = icmp ult i32 %200, %201
  br i1 %cmp213, label %cond.true215, label %cond.false217

cond.true215:                                     ; preds = %cond.true212
  %202 = load i32*, i32** %orig_sysdep_tab129, align 4
  %203 = load i32, i32* %i, align 4
  %arrayidx216 = getelementptr inbounds i32, i32* %202, i32 %203
  %204 = load i32, i32* %arrayidx216, align 4
  br label %cond.end220

cond.false217:                                    ; preds = %cond.true212
  %205 = load i32*, i32** %trans_sysdep_tab130, align 4
  %206 = load i32, i32* %i, align 4
  %207 = load i32, i32* %n_sysdep_strings111, align 4
  %sub218 = sub i32 %206, %207
  %arrayidx219 = getelementptr inbounds i32, i32* %205, i32 %sub218
  %208 = load i32, i32* %arrayidx219, align 4
  br label %cond.end220

cond.end220:                                      ; preds = %cond.false217, %cond.true215
  %cond221 = phi i32 [ %204, %cond.true215 ], [ %208, %cond.false217 ]
  %call222 = call i32 @SWAP(i32 %cond221)
  br label %cond.end233

cond.false223:                                    ; preds = %for.body209
  %209 = load i32, i32* %i, align 4
  %210 = load i32, i32* %n_sysdep_strings111, align 4
  %cmp224 = icmp ult i32 %209, %210
  br i1 %cmp224, label %cond.true226, label %cond.false228

cond.true226:                                     ; preds = %cond.false223
  %211 = load i32*, i32** %orig_sysdep_tab129, align 4
  %212 = load i32, i32* %i, align 4
  %arrayidx227 = getelementptr inbounds i32, i32* %211, i32 %212
  %213 = load i32, i32* %arrayidx227, align 4
  br label %cond.end231

cond.false228:                                    ; preds = %cond.false223
  %214 = load i32*, i32** %trans_sysdep_tab130, align 4
  %215 = load i32, i32* %i, align 4
  %216 = load i32, i32* %n_sysdep_strings111, align 4
  %sub229 = sub i32 %215, %216
  %arrayidx230 = getelementptr inbounds i32, i32* %214, i32 %sub229
  %217 = load i32, i32* %arrayidx230, align 4
  br label %cond.end231

cond.end231:                                      ; preds = %cond.false228, %cond.true226
  %cond232 = phi i32 [ %213, %cond.true226 ], [ %217, %cond.false228 ]
  br label %cond.end233

cond.end233:                                      ; preds = %cond.end231, %cond.end220
  %cond234 = phi i32 [ %call222, %cond.end220 ], [ %cond232, %cond.end231 ]
  %add.ptr235 = getelementptr inbounds i8, i8* %197, i32 %cond234
  %218 = bitcast i8* %add.ptr235 to %struct.sysdep_string*
  store %struct.sysdep_string* %218, %struct.sysdep_string** %sysdep_string, align 4
  store i32 0, i32* %need, align 4
  %219 = load %struct.sysdep_string*, %struct.sysdep_string** %sysdep_string, align 4
  %segments = getelementptr inbounds %struct.sysdep_string, %struct.sysdep_string* %219, i32 0, i32 1
  %arraydecay = getelementptr inbounds [1 x %struct.segment_pair], [1 x %struct.segment_pair]* %segments, i32 0, i32 0
  store %struct.segment_pair* %arraydecay, %struct.segment_pair** %p, align 4
  %220 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %must_swap236 = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %220, i32 0, i32 3
  %221 = load i32, i32* %must_swap236, align 4
  %tobool237 = icmp ne i32 %221, 0
  br i1 %tobool237, label %cond.true238, label %cond.false240

cond.true238:                                     ; preds = %cond.end233
  %222 = load %struct.segment_pair*, %struct.segment_pair** %p, align 4
  %sysdepref = getelementptr inbounds %struct.segment_pair, %struct.segment_pair* %222, i32 0, i32 1
  %223 = load i32, i32* %sysdepref, align 4
  %call239 = call i32 @SWAP(i32 %223)
  br label %cond.end242

cond.false240:                                    ; preds = %cond.end233
  %224 = load %struct.segment_pair*, %struct.segment_pair** %p, align 4
  %sysdepref241 = getelementptr inbounds %struct.segment_pair, %struct.segment_pair* %224, i32 0, i32 1
  %225 = load i32, i32* %sysdepref241, align 4
  br label %cond.end242

cond.end242:                                      ; preds = %cond.false240, %cond.true238
  %cond243 = phi i32 [ %call239, %cond.true238 ], [ %225, %cond.false240 ]
  %cmp244 = icmp ne i32 %cond243, -1
  br i1 %cmp244, label %if.then246, label %if.end282

if.then246:                                       ; preds = %cond.end242
  %226 = load %struct.sysdep_string*, %struct.sysdep_string** %sysdep_string, align 4
  %segments247 = getelementptr inbounds %struct.sysdep_string, %struct.sysdep_string* %226, i32 0, i32 1
  %arraydecay248 = getelementptr inbounds [1 x %struct.segment_pair], [1 x %struct.segment_pair]* %segments247, i32 0, i32 0
  store %struct.segment_pair* %arraydecay248, %struct.segment_pair** %p, align 4
  br label %for.cond249

for.cond249:                                      ; preds = %for.inc280, %if.then246
  %227 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %must_swap251 = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %227, i32 0, i32 3
  %228 = load i32, i32* %must_swap251, align 4
  %tobool252 = icmp ne i32 %228, 0
  br i1 %tobool252, label %cond.true253, label %cond.false255

cond.true253:                                     ; preds = %for.cond249
  %229 = load %struct.segment_pair*, %struct.segment_pair** %p, align 4
  %segsize = getelementptr inbounds %struct.segment_pair, %struct.segment_pair* %229, i32 0, i32 0
  %230 = load i32, i32* %segsize, align 4
  %call254 = call i32 @SWAP(i32 %230)
  br label %cond.end257

cond.false255:                                    ; preds = %for.cond249
  %231 = load %struct.segment_pair*, %struct.segment_pair** %p, align 4
  %segsize256 = getelementptr inbounds %struct.segment_pair, %struct.segment_pair* %231, i32 0, i32 0
  %232 = load i32, i32* %segsize256, align 4
  br label %cond.end257

cond.end257:                                      ; preds = %cond.false255, %cond.true253
  %cond258 = phi i32 [ %call254, %cond.true253 ], [ %232, %cond.false255 ]
  %233 = load i32, i32* %need, align 4
  %add259 = add i32 %233, %cond258
  store i32 %add259, i32* %need, align 4
  %234 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %must_swap260 = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %234, i32 0, i32 3
  %235 = load i32, i32* %must_swap260, align 4
  %tobool261 = icmp ne i32 %235, 0
  br i1 %tobool261, label %cond.true262, label %cond.false265

cond.true262:                                     ; preds = %cond.end257
  %236 = load %struct.segment_pair*, %struct.segment_pair** %p, align 4
  %sysdepref263 = getelementptr inbounds %struct.segment_pair, %struct.segment_pair* %236, i32 0, i32 1
  %237 = load i32, i32* %sysdepref263, align 4
  %call264 = call i32 @SWAP(i32 %237)
  br label %cond.end267

cond.false265:                                    ; preds = %cond.end257
  %238 = load %struct.segment_pair*, %struct.segment_pair** %p, align 4
  %sysdepref266 = getelementptr inbounds %struct.segment_pair, %struct.segment_pair* %238, i32 0, i32 1
  %239 = load i32, i32* %sysdepref266, align 4
  br label %cond.end267

cond.end267:                                      ; preds = %cond.false265, %cond.true262
  %cond268 = phi i32 [ %call264, %cond.true262 ], [ %239, %cond.false265 ]
  store i32 %cond268, i32* %sysdepref250, align 4
  %240 = load i32, i32* %sysdepref250, align 4
  %cmp269 = icmp eq i32 %240, -1
  br i1 %cmp269, label %if.then271, label %if.end272

if.then271:                                       ; preds = %cond.end267
  br label %for.end281

if.end272:                                        ; preds = %cond.end267
  %241 = load i32, i32* %sysdepref250, align 4
  %242 = load i32, i32* %n_sysdep_segments, align 4
  %cmp273 = icmp uge i32 %241, %242
  br i1 %cmp273, label %if.then275, label %if.end276

if.then275:                                       ; preds = %if.end272
  br label %invalid

if.end276:                                        ; preds = %if.end272
  %243 = load i8**, i8*** %sysdep_segment_values, align 4
  %244 = load i32, i32* %sysdepref250, align 4
  %arrayidx277 = getelementptr inbounds i8*, i8** %243, i32 %244
  %245 = load i8*, i8** %arrayidx277, align 4
  %call278 = call i32 @strlen(i8* %245)
  %246 = load i32, i32* %need, align 4
  %add279 = add i32 %246, %call278
  store i32 %add279, i32* %need, align 4
  br label %for.inc280

for.inc280:                                       ; preds = %if.end276
  %247 = load %struct.segment_pair*, %struct.segment_pair** %p, align 4
  %incdec.ptr = getelementptr inbounds %struct.segment_pair, %struct.segment_pair* %247, i32 1
  store %struct.segment_pair* %incdec.ptr, %struct.segment_pair** %p, align 4
  br label %for.cond249

for.end281:                                       ; preds = %if.then271
  br label %if.end282

if.end282:                                        ; preds = %for.end281, %cond.end242
  %248 = load i32, i32* %need, align 4
  %249 = load i32, i32* %memneed, align 4
  %add283 = add i32 %249, %248
  store i32 %add283, i32* %memneed, align 4
  br label %for.inc284

for.inc284:                                       ; preds = %if.end282
  %250 = load i32, i32* %i, align 4
  %inc285 = add i32 %250, 1
  store i32 %inc285, i32* %i, align 4
  br label %for.cond205

for.end286:                                       ; preds = %for.cond205
  %251 = load i32, i32* %memneed, align 4
  %call287 = call i8* @malloc(i32 %251)
  store i8* %call287, i8** %mem, align 4
  %252 = load i8*, i8** %mem, align 4
  %cmp288 = icmp eq i8* %252, null
  br i1 %cmp288, label %if.then290, label %if.end291

if.then290:                                       ; preds = %for.end286
  br label %invalid

if.end291:                                        ; preds = %for.end286
  %253 = load i8*, i8** %mem, align 4
  %254 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %malloced292 = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %254, i32 0, i32 4
  store i8* %253, i8** %malloced292, align 4
  %255 = load i8*, i8** %mem, align 4
  %256 = bitcast i8* %255 to %struct.sysdep_string_desc*
  store %struct.sysdep_string_desc* %256, %struct.sysdep_string_desc** %inmem_orig_sysdep_tab, align 4
  %257 = load i32, i32* %n_sysdep_strings111, align 4
  %mul293 = mul i32 %257, 8
  %258 = load i8*, i8** %mem, align 4
  %add.ptr294 = getelementptr inbounds i8, i8* %258, i32 %mul293
  store i8* %add.ptr294, i8** %mem, align 4
  %259 = load i8*, i8** %mem, align 4
  %260 = bitcast i8* %259 to %struct.sysdep_string_desc*
  store %struct.sysdep_string_desc* %260, %struct.sysdep_string_desc** %inmem_trans_sysdep_tab, align 4
  %261 = load i32, i32* %n_sysdep_strings111, align 4
  %mul295 = mul i32 %261, 8
  %262 = load i8*, i8** %mem, align 4
  %add.ptr296 = getelementptr inbounds i8, i8* %262, i32 %mul295
  store i8* %add.ptr296, i8** %mem, align 4
  %263 = load i8*, i8** %mem, align 4
  %264 = bitcast i8* %263 to i32*
  store i32* %264, i32** %inmem_hash_tab, align 4
  %265 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %hash_size297 = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %265, i32 0, i32 11
  %266 = load i32, i32* %hash_size297, align 4
  %mul298 = mul i32 %266, 4
  %267 = load i8*, i8** %mem, align 4
  %add.ptr299 = getelementptr inbounds i8, i8* %267, i32 %mul298
  store i8* %add.ptr299, i8** %mem, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond300

for.cond300:                                      ; preds = %for.inc416, %if.end291
  %268 = load i32, i32* %i, align 4
  %269 = load i32, i32* %n_sysdep_strings111, align 4
  %mul301 = mul i32 2, %269
  %cmp302 = icmp ult i32 %268, %mul301
  br i1 %cmp302, label %for.body304, label %for.end418

for.body304:                                      ; preds = %for.cond300
  %270 = load %struct.mo_file_header*, %struct.mo_file_header** %data, align 4
  %271 = bitcast %struct.mo_file_header* %270 to i8*
  %272 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %must_swap306 = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %272, i32 0, i32 3
  %273 = load i32, i32* %must_swap306, align 4
  %tobool307 = icmp ne i32 %273, 0
  br i1 %tobool307, label %cond.true308, label %cond.false319

cond.true308:                                     ; preds = %for.body304
  %274 = load i32, i32* %i, align 4
  %275 = load i32, i32* %n_sysdep_strings111, align 4
  %cmp309 = icmp ult i32 %274, %275
  br i1 %cmp309, label %cond.true311, label %cond.false313

cond.true311:                                     ; preds = %cond.true308
  %276 = load i32*, i32** %orig_sysdep_tab129, align 4
  %277 = load i32, i32* %i, align 4
  %arrayidx312 = getelementptr inbounds i32, i32* %276, i32 %277
  %278 = load i32, i32* %arrayidx312, align 4
  br label %cond.end316

cond.false313:                                    ; preds = %cond.true308
  %279 = load i32*, i32** %trans_sysdep_tab130, align 4
  %280 = load i32, i32* %i, align 4
  %281 = load i32, i32* %n_sysdep_strings111, align 4
  %sub314 = sub i32 %280, %281
  %arrayidx315 = getelementptr inbounds i32, i32* %279, i32 %sub314
  %282 = load i32, i32* %arrayidx315, align 4
  br label %cond.end316

cond.end316:                                      ; preds = %cond.false313, %cond.true311
  %cond317 = phi i32 [ %278, %cond.true311 ], [ %282, %cond.false313 ]
  %call318 = call i32 @SWAP(i32 %cond317)
  br label %cond.end329

cond.false319:                                    ; preds = %for.body304
  %283 = load i32, i32* %i, align 4
  %284 = load i32, i32* %n_sysdep_strings111, align 4
  %cmp320 = icmp ult i32 %283, %284
  br i1 %cmp320, label %cond.true322, label %cond.false324

cond.true322:                                     ; preds = %cond.false319
  %285 = load i32*, i32** %orig_sysdep_tab129, align 4
  %286 = load i32, i32* %i, align 4
  %arrayidx323 = getelementptr inbounds i32, i32* %285, i32 %286
  %287 = load i32, i32* %arrayidx323, align 4
  br label %cond.end327

cond.false324:                                    ; preds = %cond.false319
  %288 = load i32*, i32** %trans_sysdep_tab130, align 4
  %289 = load i32, i32* %i, align 4
  %290 = load i32, i32* %n_sysdep_strings111, align 4
  %sub325 = sub i32 %289, %290
  %arrayidx326 = getelementptr inbounds i32, i32* %288, i32 %sub325
  %291 = load i32, i32* %arrayidx326, align 4
  br label %cond.end327

cond.end327:                                      ; preds = %cond.false324, %cond.true322
  %cond328 = phi i32 [ %287, %cond.true322 ], [ %291, %cond.false324 ]
  br label %cond.end329

cond.end329:                                      ; preds = %cond.end327, %cond.end316
  %cond330 = phi i32 [ %call318, %cond.end316 ], [ %cond328, %cond.end327 ]
  %add.ptr331 = getelementptr inbounds i8, i8* %271, i32 %cond330
  %292 = bitcast i8* %add.ptr331 to %struct.sysdep_string*
  store %struct.sysdep_string* %292, %struct.sysdep_string** %sysdep_string305, align 4
  %293 = load %struct.mo_file_header*, %struct.mo_file_header** %data, align 4
  %294 = bitcast %struct.mo_file_header* %293 to i8*
  %295 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %must_swap332 = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %295, i32 0, i32 3
  %296 = load i32, i32* %must_swap332, align 4
  %tobool333 = icmp ne i32 %296, 0
  br i1 %tobool333, label %cond.true334, label %cond.false337

cond.true334:                                     ; preds = %cond.end329
  %297 = load %struct.sysdep_string*, %struct.sysdep_string** %sysdep_string305, align 4
  %offset335 = getelementptr inbounds %struct.sysdep_string, %struct.sysdep_string* %297, i32 0, i32 0
  %298 = load i32, i32* %offset335, align 4
  %call336 = call i32 @SWAP(i32 %298)
  br label %cond.end339

cond.false337:                                    ; preds = %cond.end329
  %299 = load %struct.sysdep_string*, %struct.sysdep_string** %sysdep_string305, align 4
  %offset338 = getelementptr inbounds %struct.sysdep_string, %struct.sysdep_string* %299, i32 0, i32 0
  %300 = load i32, i32* %offset338, align 4
  br label %cond.end339

cond.end339:                                      ; preds = %cond.false337, %cond.true334
  %cond340 = phi i32 [ %call336, %cond.true334 ], [ %300, %cond.false337 ]
  %add.ptr341 = getelementptr inbounds i8, i8* %294, i32 %cond340
  store i8* %add.ptr341, i8** %static_segments, align 4
  %301 = load %struct.sysdep_string*, %struct.sysdep_string** %sysdep_string305, align 4
  %segments343 = getelementptr inbounds %struct.sysdep_string, %struct.sysdep_string* %301, i32 0, i32 1
  %arraydecay344 = getelementptr inbounds [1 x %struct.segment_pair], [1 x %struct.segment_pair]* %segments343, i32 0, i32 0
  store %struct.segment_pair* %arraydecay344, %struct.segment_pair** %p342, align 4
  %302 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %must_swap345 = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %302, i32 0, i32 3
  %303 = load i32, i32* %must_swap345, align 4
  %tobool346 = icmp ne i32 %303, 0
  br i1 %tobool346, label %cond.true347, label %cond.false350

cond.true347:                                     ; preds = %cond.end339
  %304 = load %struct.segment_pair*, %struct.segment_pair** %p342, align 4
  %sysdepref348 = getelementptr inbounds %struct.segment_pair, %struct.segment_pair* %304, i32 0, i32 1
  %305 = load i32, i32* %sysdepref348, align 4
  %call349 = call i32 @SWAP(i32 %305)
  br label %cond.end352

cond.false350:                                    ; preds = %cond.end339
  %306 = load %struct.segment_pair*, %struct.segment_pair** %p342, align 4
  %sysdepref351 = getelementptr inbounds %struct.segment_pair, %struct.segment_pair* %306, i32 0, i32 1
  %307 = load i32, i32* %sysdepref351, align 4
  br label %cond.end352

cond.end352:                                      ; preds = %cond.false350, %cond.true347
  %cond353 = phi i32 [ %call349, %cond.true347 ], [ %307, %cond.false350 ]
  %cmp354 = icmp eq i32 %cond353, -1
  br i1 %cmp354, label %if.then356, label %if.else

if.then356:                                       ; preds = %cond.end352
  %308 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %must_swap357 = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %308, i32 0, i32 3
  %309 = load i32, i32* %must_swap357, align 4
  %tobool358 = icmp ne i32 %309, 0
  br i1 %tobool358, label %cond.true359, label %cond.false362

cond.true359:                                     ; preds = %if.then356
  %310 = load %struct.segment_pair*, %struct.segment_pair** %p342, align 4
  %segsize360 = getelementptr inbounds %struct.segment_pair, %struct.segment_pair* %310, i32 0, i32 0
  %311 = load i32, i32* %segsize360, align 4
  %call361 = call i32 @SWAP(i32 %311)
  br label %cond.end364

cond.false362:                                    ; preds = %if.then356
  %312 = load %struct.segment_pair*, %struct.segment_pair** %p342, align 4
  %segsize363 = getelementptr inbounds %struct.segment_pair, %struct.segment_pair* %312, i32 0, i32 0
  %313 = load i32, i32* %segsize363, align 4
  br label %cond.end364

cond.end364:                                      ; preds = %cond.false362, %cond.true359
  %cond365 = phi i32 [ %call361, %cond.true359 ], [ %313, %cond.false362 ]
  %314 = load %struct.sysdep_string_desc*, %struct.sysdep_string_desc** %inmem_orig_sysdep_tab, align 4
  %315 = load i32, i32* %i, align 4
  %arrayidx366 = getelementptr inbounds %struct.sysdep_string_desc, %struct.sysdep_string_desc* %314, i32 %315
  %length367 = getelementptr inbounds %struct.sysdep_string_desc, %struct.sysdep_string_desc* %arrayidx366, i32 0, i32 0
  store i32 %cond365, i32* %length367, align 4
  %316 = load i8*, i8** %static_segments, align 4
  %317 = load %struct.sysdep_string_desc*, %struct.sysdep_string_desc** %inmem_orig_sysdep_tab, align 4
  %318 = load i32, i32* %i, align 4
  %arrayidx368 = getelementptr inbounds %struct.sysdep_string_desc, %struct.sysdep_string_desc* %317, i32 %318
  %pointer = getelementptr inbounds %struct.sysdep_string_desc, %struct.sysdep_string_desc* %arrayidx368, i32 0, i32 1
  store i8* %316, i8** %pointer, align 4
  br label %if.end415

if.else:                                          ; preds = %cond.end352
  %319 = load i8*, i8** %mem, align 4
  %320 = load %struct.sysdep_string_desc*, %struct.sysdep_string_desc** %inmem_orig_sysdep_tab, align 4
  %321 = load i32, i32* %i, align 4
  %arrayidx369 = getelementptr inbounds %struct.sysdep_string_desc, %struct.sysdep_string_desc* %320, i32 %321
  %pointer370 = getelementptr inbounds %struct.sysdep_string_desc, %struct.sysdep_string_desc* %arrayidx369, i32 0, i32 1
  store i8* %319, i8** %pointer370, align 4
  %322 = load %struct.sysdep_string*, %struct.sysdep_string** %sysdep_string305, align 4
  %segments371 = getelementptr inbounds %struct.sysdep_string, %struct.sysdep_string* %322, i32 0, i32 1
  %arraydecay372 = getelementptr inbounds [1 x %struct.segment_pair], [1 x %struct.segment_pair]* %segments371, i32 0, i32 0
  store %struct.segment_pair* %arraydecay372, %struct.segment_pair** %p342, align 4
  br label %for.cond373

for.cond373:                                      ; preds = %for.inc408, %if.else
  %323 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %must_swap375 = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %323, i32 0, i32 3
  %324 = load i32, i32* %must_swap375, align 4
  %tobool376 = icmp ne i32 %324, 0
  br i1 %tobool376, label %cond.true377, label %cond.false380

cond.true377:                                     ; preds = %for.cond373
  %325 = load %struct.segment_pair*, %struct.segment_pair** %p342, align 4
  %segsize378 = getelementptr inbounds %struct.segment_pair, %struct.segment_pair* %325, i32 0, i32 0
  %326 = load i32, i32* %segsize378, align 4
  %call379 = call i32 @SWAP(i32 %326)
  br label %cond.end382

cond.false380:                                    ; preds = %for.cond373
  %327 = load %struct.segment_pair*, %struct.segment_pair** %p342, align 4
  %segsize381 = getelementptr inbounds %struct.segment_pair, %struct.segment_pair* %327, i32 0, i32 0
  %328 = load i32, i32* %segsize381, align 4
  br label %cond.end382

cond.end382:                                      ; preds = %cond.false380, %cond.true377
  %cond383 = phi i32 [ %call379, %cond.true377 ], [ %328, %cond.false380 ]
  store i32 %cond383, i32* %segsize374, align 4
  %329 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %must_swap385 = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %329, i32 0, i32 3
  %330 = load i32, i32* %must_swap385, align 4
  %tobool386 = icmp ne i32 %330, 0
  br i1 %tobool386, label %cond.true387, label %cond.false390

cond.true387:                                     ; preds = %cond.end382
  %331 = load %struct.segment_pair*, %struct.segment_pair** %p342, align 4
  %sysdepref388 = getelementptr inbounds %struct.segment_pair, %struct.segment_pair* %331, i32 0, i32 1
  %332 = load i32, i32* %sysdepref388, align 4
  %call389 = call i32 @SWAP(i32 %332)
  br label %cond.end392

cond.false390:                                    ; preds = %cond.end382
  %333 = load %struct.segment_pair*, %struct.segment_pair** %p342, align 4
  %sysdepref391 = getelementptr inbounds %struct.segment_pair, %struct.segment_pair* %333, i32 0, i32 1
  %334 = load i32, i32* %sysdepref391, align 4
  br label %cond.end392

cond.end392:                                      ; preds = %cond.false390, %cond.true387
  %cond393 = phi i32 [ %call389, %cond.true387 ], [ %334, %cond.false390 ]
  store i32 %cond393, i32* %sysdepref384, align 4
  %335 = load i32, i32* %segsize374, align 4
  %cmp394 = icmp ugt i32 %335, 0
  br i1 %cmp394, label %if.then396, label %if.end399

if.then396:                                       ; preds = %cond.end392
  %336 = load i8*, i8** %mem, align 4
  %337 = load i8*, i8** %static_segments, align 4
  %338 = load i32, i32* %segsize374, align 4
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %336, i8* %337, i32 %338, i32 1, i1 false)
  %339 = load i32, i32* %segsize374, align 4
  %340 = load i8*, i8** %mem, align 4
  %add.ptr397 = getelementptr inbounds i8, i8* %340, i32 %339
  store i8* %add.ptr397, i8** %mem, align 4
  %341 = load i32, i32* %segsize374, align 4
  %342 = load i8*, i8** %static_segments, align 4
  %add.ptr398 = getelementptr inbounds i8, i8* %342, i32 %341
  store i8* %add.ptr398, i8** %static_segments, align 4
  br label %if.end399

if.end399:                                        ; preds = %if.then396, %cond.end392
  %343 = load i32, i32* %sysdepref384, align 4
  %cmp400 = icmp eq i32 %343, -1
  br i1 %cmp400, label %if.then402, label %if.end403

if.then402:                                       ; preds = %if.end399
  br label %for.end410

if.end403:                                        ; preds = %if.end399
  %344 = load i8**, i8*** %sysdep_segment_values, align 4
  %345 = load i32, i32* %sysdepref384, align 4
  %arrayidx404 = getelementptr inbounds i8*, i8** %344, i32 %345
  %346 = load i8*, i8** %arrayidx404, align 4
  %call405 = call i32 @strlen(i8* %346)
  store i32 %call405, i32* %n, align 4
  %347 = load i8*, i8** %mem, align 4
  %348 = load i8**, i8*** %sysdep_segment_values, align 4
  %349 = load i32, i32* %sysdepref384, align 4
  %arrayidx406 = getelementptr inbounds i8*, i8** %348, i32 %349
  %350 = load i8*, i8** %arrayidx406, align 4
  %351 = load i32, i32* %n, align 4
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %347, i8* %350, i32 %351, i32 1, i1 false)
  %352 = load i32, i32* %n, align 4
  %353 = load i8*, i8** %mem, align 4
  %add.ptr407 = getelementptr inbounds i8, i8* %353, i32 %352
  store i8* %add.ptr407, i8** %mem, align 4
  br label %for.inc408

for.inc408:                                       ; preds = %if.end403
  %354 = load %struct.segment_pair*, %struct.segment_pair** %p342, align 4
  %incdec.ptr409 = getelementptr inbounds %struct.segment_pair, %struct.segment_pair* %354, i32 1
  store %struct.segment_pair* %incdec.ptr409, %struct.segment_pair** %p342, align 4
  br label %for.cond373

for.end410:                                       ; preds = %if.then402
  %355 = load i8*, i8** %mem, align 4
  %356 = load %struct.sysdep_string_desc*, %struct.sysdep_string_desc** %inmem_orig_sysdep_tab, align 4
  %357 = load i32, i32* %i, align 4
  %arrayidx411 = getelementptr inbounds %struct.sysdep_string_desc, %struct.sysdep_string_desc* %356, i32 %357
  %pointer412 = getelementptr inbounds %struct.sysdep_string_desc, %struct.sysdep_string_desc* %arrayidx411, i32 0, i32 1
  %358 = load i8*, i8** %pointer412, align 4
  %sub.ptr.lhs.cast = ptrtoint i8* %355 to i32
  %sub.ptr.rhs.cast = ptrtoint i8* %358 to i32
  %sub.ptr.sub = sub i32 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %359 = load %struct.sysdep_string_desc*, %struct.sysdep_string_desc** %inmem_orig_sysdep_tab, align 4
  %360 = load i32, i32* %i, align 4
  %arrayidx413 = getelementptr inbounds %struct.sysdep_string_desc, %struct.sysdep_string_desc* %359, i32 %360
  %length414 = getelementptr inbounds %struct.sysdep_string_desc, %struct.sysdep_string_desc* %arrayidx413, i32 0, i32 0
  store i32 %sub.ptr.sub, i32* %length414, align 4
  br label %if.end415

if.end415:                                        ; preds = %for.end410, %cond.end364
  br label %for.inc416

for.inc416:                                       ; preds = %if.end415
  %361 = load i32, i32* %i, align 4
  %inc417 = add i32 %361, 1
  store i32 %inc417, i32* %i, align 4
  br label %for.cond300

for.end418:                                       ; preds = %for.cond300
  store i32 0, i32* %i, align 4
  br label %for.cond419

for.cond419:                                      ; preds = %for.inc436, %for.end418
  %362 = load i32, i32* %i, align 4
  %363 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %hash_size420 = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %363, i32 0, i32 11
  %364 = load i32, i32* %hash_size420, align 4
  %cmp421 = icmp ult i32 %362, %364
  br i1 %cmp421, label %for.body423, label %for.end438

for.body423:                                      ; preds = %for.cond419
  %365 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %must_swap_hash_tab424 = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %365, i32 0, i32 13
  %366 = load i32, i32* %must_swap_hash_tab424, align 4
  %tobool425 = icmp ne i32 %366, 0
  br i1 %tobool425, label %cond.true426, label %cond.false430

cond.true426:                                     ; preds = %for.body423
  %367 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %hash_tab427 = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %367, i32 0, i32 12
  %368 = load i32*, i32** %hash_tab427, align 4
  %369 = load i32, i32* %i, align 4
  %arrayidx428 = getelementptr inbounds i32, i32* %368, i32 %369
  %370 = load i32, i32* %arrayidx428, align 4
  %call429 = call i32 @SWAP(i32 %370)
  br label %cond.end433

cond.false430:                                    ; preds = %for.body423
  %371 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %hash_tab431 = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %371, i32 0, i32 12
  %372 = load i32*, i32** %hash_tab431, align 4
  %373 = load i32, i32* %i, align 4
  %arrayidx432 = getelementptr inbounds i32, i32* %372, i32 %373
  %374 = load i32, i32* %arrayidx432, align 4
  br label %cond.end433

cond.end433:                                      ; preds = %cond.false430, %cond.true426
  %cond434 = phi i32 [ %call429, %cond.true426 ], [ %374, %cond.false430 ]
  %375 = load i32*, i32** %inmem_hash_tab, align 4
  %376 = load i32, i32* %i, align 4
  %arrayidx435 = getelementptr inbounds i32, i32* %375, i32 %376
  store i32 %cond434, i32* %arrayidx435, align 4
  br label %for.inc436

for.inc436:                                       ; preds = %cond.end433
  %377 = load i32, i32* %i, align 4
  %inc437 = add i32 %377, 1
  store i32 %inc437, i32* %i, align 4
  br label %for.cond419

for.end438:                                       ; preds = %for.cond419
  store i32 0, i32* %i, align 4
  br label %for.cond439

for.cond439:                                      ; preds = %for.inc473, %for.end438
  %378 = load i32, i32* %i, align 4
  %379 = load i32, i32* %n_sysdep_strings111, align 4
  %cmp440 = icmp ult i32 %378, %379
  br i1 %cmp440, label %for.body442, label %for.end475

for.body442:                                      ; preds = %for.cond439
  %380 = load %struct.sysdep_string_desc*, %struct.sysdep_string_desc** %inmem_orig_sysdep_tab, align 4
  %381 = load i32, i32* %i, align 4
  %arrayidx443 = getelementptr inbounds %struct.sysdep_string_desc, %struct.sysdep_string_desc* %380, i32 %381
  %pointer444 = getelementptr inbounds %struct.sysdep_string_desc, %struct.sysdep_string_desc* %arrayidx443, i32 0, i32 1
  %382 = load i8*, i8** %pointer444, align 4
  store i8* %382, i8** %msgid, align 4
  %383 = load i8*, i8** %msgid, align 4
  %call445 = call i32 @hash_string(i8* %383)
  store i32 %call445, i32* %hash_val, align 4
  %384 = load i32, i32* %hash_val, align 4
  %385 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %hash_size446 = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %385, i32 0, i32 11
  %386 = load i32, i32* %hash_size446, align 4
  %rem = urem i32 %384, %386
  store i32 %rem, i32* %idx, align 4
  %387 = load i32, i32* %hash_val, align 4
  %388 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %hash_size447 = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %388, i32 0, i32 11
  %389 = load i32, i32* %hash_size447, align 4
  %sub448 = sub i32 %389, 2
  %rem449 = urem i32 %387, %sub448
  %add450 = add i32 1, %rem449
  store i32 %add450, i32* %incr, align 4
  br label %for.cond451

for.cond451:                                      ; preds = %if.end471, %for.body442
  %390 = load i32*, i32** %inmem_hash_tab, align 4
  %391 = load i32, i32* %idx, align 4
  %arrayidx452 = getelementptr inbounds i32, i32* %390, i32 %391
  %392 = load i32, i32* %arrayidx452, align 4
  %cmp453 = icmp eq i32 %392, 0
  br i1 %cmp453, label %if.then455, label %if.end460

if.then455:                                       ; preds = %for.cond451
  %393 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %nstrings456 = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %393, i32 0, i32 5
  %394 = load i32, i32* %nstrings456, align 4
  %add457 = add i32 1, %394
  %395 = load i32, i32* %i, align 4
  %add458 = add i32 %add457, %395
  %396 = load i32*, i32** %inmem_hash_tab, align 4
  %397 = load i32, i32* %idx, align 4
  %arrayidx459 = getelementptr inbounds i32, i32* %396, i32 %397
  store i32 %add458, i32* %arrayidx459, align 4
  br label %for.end472

if.end460:                                        ; preds = %for.cond451
  %398 = load i32, i32* %idx, align 4
  %399 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %hash_size461 = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %399, i32 0, i32 11
  %400 = load i32, i32* %hash_size461, align 4
  %401 = load i32, i32* %incr, align 4
  %sub462 = sub i32 %400, %401
  %cmp463 = icmp uge i32 %398, %sub462
  br i1 %cmp463, label %if.then465, label %if.else469

if.then465:                                       ; preds = %if.end460
  %402 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %hash_size466 = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %402, i32 0, i32 11
  %403 = load i32, i32* %hash_size466, align 4
  %404 = load i32, i32* %incr, align 4
  %sub467 = sub i32 %403, %404
  %405 = load i32, i32* %idx, align 4
  %sub468 = sub i32 %405, %sub467
  store i32 %sub468, i32* %idx, align 4
  br label %if.end471

if.else469:                                       ; preds = %if.end460
  %406 = load i32, i32* %incr, align 4
  %407 = load i32, i32* %idx, align 4
  %add470 = add i32 %407, %406
  store i32 %add470, i32* %idx, align 4
  br label %if.end471

if.end471:                                        ; preds = %if.else469, %if.then465
  br label %for.cond451

for.end472:                                       ; preds = %if.then455
  br label %for.inc473

for.inc473:                                       ; preds = %for.end472
  %408 = load i32, i32* %i, align 4
  %inc474 = add i32 %408, 1
  store i32 %inc474, i32* %i, align 4
  br label %for.cond439

for.end475:                                       ; preds = %for.cond439
  %409 = load i32, i32* %n_sysdep_strings111, align 4
  %410 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %n_sysdep_strings476 = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %410, i32 0, i32 8
  store i32 %409, i32* %n_sysdep_strings476, align 4
  %411 = load %struct.sysdep_string_desc*, %struct.sysdep_string_desc** %inmem_orig_sysdep_tab, align 4
  %412 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %orig_sysdep_tab477 = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %412, i32 0, i32 9
  store %struct.sysdep_string_desc* %411, %struct.sysdep_string_desc** %orig_sysdep_tab477, align 4
  %413 = load %struct.sysdep_string_desc*, %struct.sysdep_string_desc** %inmem_trans_sysdep_tab, align 4
  %414 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %trans_sysdep_tab478 = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %414, i32 0, i32 10
  store %struct.sysdep_string_desc* %413, %struct.sysdep_string_desc** %trans_sysdep_tab478, align 4
  %415 = load i32*, i32** %inmem_hash_tab, align 4
  %416 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %hash_tab479 = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %416, i32 0, i32 12
  store i32* %415, i32** %hash_tab479, align 4
  %417 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %must_swap_hash_tab480 = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %417, i32 0, i32 13
  store i32 0, i32* %must_swap_hash_tab480, align 4
  br label %if.end485

if.else481:                                       ; preds = %cond.end124
  %418 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %n_sysdep_strings482 = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %418, i32 0, i32 8
  store i32 0, i32* %n_sysdep_strings482, align 4
  %419 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %orig_sysdep_tab483 = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %419, i32 0, i32 9
  store %struct.sysdep_string_desc* null, %struct.sysdep_string_desc** %orig_sysdep_tab483, align 4
  %420 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %trans_sysdep_tab484 = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %420, i32 0, i32 10
  store %struct.sysdep_string_desc* null, %struct.sysdep_string_desc** %trans_sysdep_tab484, align 4
  br label %if.end485

if.end485:                                        ; preds = %if.else481, %for.end475
  br label %sw.epilog

sw.epilog:                                        ; preds = %if.end485, %sw.bb109
  br label %sw.epilog493

sw.default486:                                    ; preds = %cond.end
  br label %invalid

invalid:                                          ; preds = %sw.default486, %if.then290, %if.then275, %if.then179, %if.then115
  %421 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %malloced487 = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %421, i32 0, i32 4
  %422 = load i8*, i8** %malloced487, align 4
  %tobool488 = icmp ne i8* %422, null
  br i1 %tobool488, label %if.then489, label %if.end491

if.then489:                                       ; preds = %invalid
  %423 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %malloced490 = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %423, i32 0, i32 4
  %424 = load i8*, i8** %malloced490, align 4
  call void @free(i8* %424)
  br label %if.end491

if.end491:                                        ; preds = %if.then489, %invalid
  %425 = load %struct.mo_file_header*, %struct.mo_file_header** %data, align 4
  %426 = bitcast %struct.mo_file_header* %425 to i8*
  call void @free(i8* %426)
  %427 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %428 = bitcast %struct.loaded_domain* %427 to i8*
  call void @free(i8* %428)
  %429 = load %struct.loaded_l10nfile*, %struct.loaded_l10nfile** %domain_file.addr, align 4
  %data492 = getelementptr inbounds %struct.loaded_l10nfile, %struct.loaded_l10nfile* %429, i32 0, i32 2
  store i8* null, i8** %data492, align 4
  br label %return

sw.epilog493:                                     ; preds = %sw.epilog
  %430 = load %struct.loaded_l10nfile*, %struct.loaded_l10nfile** %domain_file.addr, align 4
  %431 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %432 = load %struct.binding*, %struct.binding** %domainbinding.addr, align 4
  %call494 = call i8* @_nl_init_domain_conv(%struct.loaded_l10nfile* %430, %struct.loaded_domain* %431, %struct.binding* %432)
  store i8* %call494, i8** %nullentry, align 4
  %433 = load i8*, i8** %nullentry, align 4
  %434 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %plural = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %434, i32 0, i32 17
  %435 = load %struct.loaded_domain*, %struct.loaded_domain** %domain, align 4
  %nplurals = getelementptr inbounds %struct.loaded_domain, %struct.loaded_domain* %435, i32 0, i32 18
  call void @libintl_gettext_extract_plural(i8* %433, %struct.expression** %plural, i32* %nplurals)
  br label %return

return:                                           ; preds = %sw.epilog493, %if.end491, %if.then46, %if.then42, %if.end32, %if.end23, %if.then12, %if.then4, %if.then
  ret void
}

declare i32 @open(i8*, i32, ...) #1

declare i32 @fstat(i32, %struct.stat*) #1

declare i32 @close(i32) #1

declare i8* @malloc(i32) #1

declare i32 @read(i32, i8*, i32) #1

declare i32* @__errno_location() #1

; Function Attrs: noinline nounwind
define internal i32 @SWAP(i32 %i) #0 {
entry:
  %i.addr = alloca i32, align 4
  store i32 %i, i32* %i.addr, align 4
  %0 = load i32, i32* %i.addr, align 4
  %shl = shl i32 %0, 24
  %1 = load i32, i32* %i.addr, align 4
  %and = and i32 %1, 65280
  %shl1 = shl i32 %and, 8
  %or = or i32 %shl, %shl1
  %2 = load i32, i32* %i.addr, align 4
  %shr = lshr i32 %2, 8
  %and2 = and i32 %shr, 65280
  %or3 = or i32 %or, %and2
  %3 = load i32, i32* %i.addr, align 4
  %shr4 = lshr i32 %3, 24
  %or5 = or i32 %or3, %shr4
  ret i32 %or5
}

; Function Attrs: noinline nounwind
define internal i8* @get_sysdep_segment_value(i8* %name) #0 {
entry:
  %retval = alloca i8*, align 4
  %name.addr = alloca i8*, align 4
  store i8* %name, i8** %name.addr, align 4
  %0 = load i8*, i8** %name.addr, align 4
  %arrayidx = getelementptr inbounds i8, i8* %0, i32 0
  %1 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %1 to i32
  %cmp = icmp eq i32 %conv, 80
  br i1 %cmp, label %land.lhs.true, label %if.end810

land.lhs.true:                                    ; preds = %entry
  %2 = load i8*, i8** %name.addr, align 4
  %arrayidx2 = getelementptr inbounds i8, i8* %2, i32 1
  %3 = load i8, i8* %arrayidx2, align 1
  %conv3 = sext i8 %3 to i32
  %cmp4 = icmp eq i32 %conv3, 82
  br i1 %cmp4, label %land.lhs.true6, label %if.end810

land.lhs.true6:                                   ; preds = %land.lhs.true
  %4 = load i8*, i8** %name.addr, align 4
  %arrayidx7 = getelementptr inbounds i8, i8* %4, i32 2
  %5 = load i8, i8* %arrayidx7, align 1
  %conv8 = sext i8 %5 to i32
  %cmp9 = icmp eq i32 %conv8, 73
  br i1 %cmp9, label %if.then, label %if.end810

if.then:                                          ; preds = %land.lhs.true6
  %6 = load i8*, i8** %name.addr, align 4
  %arrayidx11 = getelementptr inbounds i8, i8* %6, i32 3
  %7 = load i8, i8* %arrayidx11, align 1
  %conv12 = sext i8 %7 to i32
  %cmp13 = icmp eq i32 %conv12, 100
  br i1 %cmp13, label %if.then39, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.then
  %8 = load i8*, i8** %name.addr, align 4
  %arrayidx15 = getelementptr inbounds i8, i8* %8, i32 3
  %9 = load i8, i8* %arrayidx15, align 1
  %conv16 = sext i8 %9 to i32
  %cmp17 = icmp eq i32 %conv16, 105
  br i1 %cmp17, label %if.then39, label %lor.lhs.false19

lor.lhs.false19:                                  ; preds = %lor.lhs.false
  %10 = load i8*, i8** %name.addr, align 4
  %arrayidx20 = getelementptr inbounds i8, i8* %10, i32 3
  %11 = load i8, i8* %arrayidx20, align 1
  %conv21 = sext i8 %11 to i32
  %cmp22 = icmp eq i32 %conv21, 111
  br i1 %cmp22, label %if.then39, label %lor.lhs.false24

lor.lhs.false24:                                  ; preds = %lor.lhs.false19
  %12 = load i8*, i8** %name.addr, align 4
  %arrayidx25 = getelementptr inbounds i8, i8* %12, i32 3
  %13 = load i8, i8* %arrayidx25, align 1
  %conv26 = sext i8 %13 to i32
  %cmp27 = icmp eq i32 %conv26, 117
  br i1 %cmp27, label %if.then39, label %lor.lhs.false29

lor.lhs.false29:                                  ; preds = %lor.lhs.false24
  %14 = load i8*, i8** %name.addr, align 4
  %arrayidx30 = getelementptr inbounds i8, i8* %14, i32 3
  %15 = load i8, i8* %arrayidx30, align 1
  %conv31 = sext i8 %15 to i32
  %cmp32 = icmp eq i32 %conv31, 120
  br i1 %cmp32, label %if.then39, label %lor.lhs.false34

lor.lhs.false34:                                  ; preds = %lor.lhs.false29
  %16 = load i8*, i8** %name.addr, align 4
  %arrayidx35 = getelementptr inbounds i8, i8* %16, i32 3
  %17 = load i8, i8* %arrayidx35, align 1
  %conv36 = sext i8 %17 to i32
  %cmp37 = icmp eq i32 %conv36, 88
  br i1 %cmp37, label %if.then39, label %if.end809

if.then39:                                        ; preds = %lor.lhs.false34, %lor.lhs.false29, %lor.lhs.false24, %lor.lhs.false19, %lor.lhs.false, %if.then
  %18 = load i8*, i8** %name.addr, align 4
  %arrayidx40 = getelementptr inbounds i8, i8* %18, i32 4
  %19 = load i8, i8* %arrayidx40, align 1
  %conv41 = sext i8 %19 to i32
  %cmp42 = icmp eq i32 %conv41, 56
  br i1 %cmp42, label %land.lhs.true44, label %if.end85

land.lhs.true44:                                  ; preds = %if.then39
  %20 = load i8*, i8** %name.addr, align 4
  %arrayidx45 = getelementptr inbounds i8, i8* %20, i32 5
  %21 = load i8, i8* %arrayidx45, align 1
  %conv46 = sext i8 %21 to i32
  %cmp47 = icmp eq i32 %conv46, 0
  br i1 %cmp47, label %if.then49, label %if.end85

if.then49:                                        ; preds = %land.lhs.true44
  %22 = load i8*, i8** %name.addr, align 4
  %arrayidx50 = getelementptr inbounds i8, i8* %22, i32 3
  %23 = load i8, i8* %arrayidx50, align 1
  %conv51 = sext i8 %23 to i32
  %cmp52 = icmp eq i32 %conv51, 100
  br i1 %cmp52, label %if.then54, label %if.end

if.then54:                                        ; preds = %if.then49
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.end:                                           ; preds = %if.then49
  %24 = load i8*, i8** %name.addr, align 4
  %arrayidx55 = getelementptr inbounds i8, i8* %24, i32 3
  %25 = load i8, i8* %arrayidx55, align 1
  %conv56 = sext i8 %25 to i32
  %cmp57 = icmp eq i32 %conv56, 105
  br i1 %cmp57, label %if.then59, label %if.end60

if.then59:                                        ; preds = %if.end
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.5, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.end60:                                         ; preds = %if.end
  %26 = load i8*, i8** %name.addr, align 4
  %arrayidx61 = getelementptr inbounds i8, i8* %26, i32 3
  %27 = load i8, i8* %arrayidx61, align 1
  %conv62 = sext i8 %27 to i32
  %cmp63 = icmp eq i32 %conv62, 111
  br i1 %cmp63, label %if.then65, label %if.end66

if.then65:                                        ; preds = %if.end60
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.6, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.end66:                                         ; preds = %if.end60
  %28 = load i8*, i8** %name.addr, align 4
  %arrayidx67 = getelementptr inbounds i8, i8* %28, i32 3
  %29 = load i8, i8* %arrayidx67, align 1
  %conv68 = sext i8 %29 to i32
  %cmp69 = icmp eq i32 %conv68, 117
  br i1 %cmp69, label %if.then71, label %if.end72

if.then71:                                        ; preds = %if.end66
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.end72:                                         ; preds = %if.end66
  %30 = load i8*, i8** %name.addr, align 4
  %arrayidx73 = getelementptr inbounds i8, i8* %30, i32 3
  %31 = load i8, i8* %arrayidx73, align 1
  %conv74 = sext i8 %31 to i32
  %cmp75 = icmp eq i32 %conv74, 120
  br i1 %cmp75, label %if.then77, label %if.end78

if.then77:                                        ; preds = %if.end72
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.8, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.end78:                                         ; preds = %if.end72
  %32 = load i8*, i8** %name.addr, align 4
  %arrayidx79 = getelementptr inbounds i8, i8* %32, i32 3
  %33 = load i8, i8* %arrayidx79, align 1
  %conv80 = sext i8 %33 to i32
  %cmp81 = icmp eq i32 %conv80, 88
  br i1 %cmp81, label %if.then83, label %if.end84

if.then83:                                        ; preds = %if.end78
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.end84:                                         ; preds = %if.end78
  call void @abort() #4
  unreachable

if.end85:                                         ; preds = %land.lhs.true44, %if.then39
  %34 = load i8*, i8** %name.addr, align 4
  %arrayidx86 = getelementptr inbounds i8, i8* %34, i32 4
  %35 = load i8, i8* %arrayidx86, align 1
  %conv87 = sext i8 %35 to i32
  %cmp88 = icmp eq i32 %conv87, 49
  br i1 %cmp88, label %land.lhs.true90, label %if.end137

land.lhs.true90:                                  ; preds = %if.end85
  %36 = load i8*, i8** %name.addr, align 4
  %arrayidx91 = getelementptr inbounds i8, i8* %36, i32 5
  %37 = load i8, i8* %arrayidx91, align 1
  %conv92 = sext i8 %37 to i32
  %cmp93 = icmp eq i32 %conv92, 54
  br i1 %cmp93, label %land.lhs.true95, label %if.end137

land.lhs.true95:                                  ; preds = %land.lhs.true90
  %38 = load i8*, i8** %name.addr, align 4
  %arrayidx96 = getelementptr inbounds i8, i8* %38, i32 6
  %39 = load i8, i8* %arrayidx96, align 1
  %conv97 = sext i8 %39 to i32
  %cmp98 = icmp eq i32 %conv97, 0
  br i1 %cmp98, label %if.then100, label %if.end137

if.then100:                                       ; preds = %land.lhs.true95
  %40 = load i8*, i8** %name.addr, align 4
  %arrayidx101 = getelementptr inbounds i8, i8* %40, i32 3
  %41 = load i8, i8* %arrayidx101, align 1
  %conv102 = sext i8 %41 to i32
  %cmp103 = icmp eq i32 %conv102, 100
  br i1 %cmp103, label %if.then105, label %if.end106

if.then105:                                       ; preds = %if.then100
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.end106:                                        ; preds = %if.then100
  %42 = load i8*, i8** %name.addr, align 4
  %arrayidx107 = getelementptr inbounds i8, i8* %42, i32 3
  %43 = load i8, i8* %arrayidx107, align 1
  %conv108 = sext i8 %43 to i32
  %cmp109 = icmp eq i32 %conv108, 105
  br i1 %cmp109, label %if.then111, label %if.end112

if.then111:                                       ; preds = %if.end106
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.5, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.end112:                                        ; preds = %if.end106
  %44 = load i8*, i8** %name.addr, align 4
  %arrayidx113 = getelementptr inbounds i8, i8* %44, i32 3
  %45 = load i8, i8* %arrayidx113, align 1
  %conv114 = sext i8 %45 to i32
  %cmp115 = icmp eq i32 %conv114, 111
  br i1 %cmp115, label %if.then117, label %if.end118

if.then117:                                       ; preds = %if.end112
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.6, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.end118:                                        ; preds = %if.end112
  %46 = load i8*, i8** %name.addr, align 4
  %arrayidx119 = getelementptr inbounds i8, i8* %46, i32 3
  %47 = load i8, i8* %arrayidx119, align 1
  %conv120 = sext i8 %47 to i32
  %cmp121 = icmp eq i32 %conv120, 117
  br i1 %cmp121, label %if.then123, label %if.end124

if.then123:                                       ; preds = %if.end118
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.end124:                                        ; preds = %if.end118
  %48 = load i8*, i8** %name.addr, align 4
  %arrayidx125 = getelementptr inbounds i8, i8* %48, i32 3
  %49 = load i8, i8* %arrayidx125, align 1
  %conv126 = sext i8 %49 to i32
  %cmp127 = icmp eq i32 %conv126, 120
  br i1 %cmp127, label %if.then129, label %if.end130

if.then129:                                       ; preds = %if.end124
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.8, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.end130:                                        ; preds = %if.end124
  %50 = load i8*, i8** %name.addr, align 4
  %arrayidx131 = getelementptr inbounds i8, i8* %50, i32 3
  %51 = load i8, i8* %arrayidx131, align 1
  %conv132 = sext i8 %51 to i32
  %cmp133 = icmp eq i32 %conv132, 88
  br i1 %cmp133, label %if.then135, label %if.end136

if.then135:                                       ; preds = %if.end130
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.end136:                                        ; preds = %if.end130
  call void @abort() #4
  unreachable

if.end137:                                        ; preds = %land.lhs.true95, %land.lhs.true90, %if.end85
  %52 = load i8*, i8** %name.addr, align 4
  %arrayidx138 = getelementptr inbounds i8, i8* %52, i32 4
  %53 = load i8, i8* %arrayidx138, align 1
  %conv139 = sext i8 %53 to i32
  %cmp140 = icmp eq i32 %conv139, 51
  br i1 %cmp140, label %land.lhs.true142, label %if.end189

land.lhs.true142:                                 ; preds = %if.end137
  %54 = load i8*, i8** %name.addr, align 4
  %arrayidx143 = getelementptr inbounds i8, i8* %54, i32 5
  %55 = load i8, i8* %arrayidx143, align 1
  %conv144 = sext i8 %55 to i32
  %cmp145 = icmp eq i32 %conv144, 50
  br i1 %cmp145, label %land.lhs.true147, label %if.end189

land.lhs.true147:                                 ; preds = %land.lhs.true142
  %56 = load i8*, i8** %name.addr, align 4
  %arrayidx148 = getelementptr inbounds i8, i8* %56, i32 6
  %57 = load i8, i8* %arrayidx148, align 1
  %conv149 = sext i8 %57 to i32
  %cmp150 = icmp eq i32 %conv149, 0
  br i1 %cmp150, label %if.then152, label %if.end189

if.then152:                                       ; preds = %land.lhs.true147
  %58 = load i8*, i8** %name.addr, align 4
  %arrayidx153 = getelementptr inbounds i8, i8* %58, i32 3
  %59 = load i8, i8* %arrayidx153, align 1
  %conv154 = sext i8 %59 to i32
  %cmp155 = icmp eq i32 %conv154, 100
  br i1 %cmp155, label %if.then157, label %if.end158

if.then157:                                       ; preds = %if.then152
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.end158:                                        ; preds = %if.then152
  %60 = load i8*, i8** %name.addr, align 4
  %arrayidx159 = getelementptr inbounds i8, i8* %60, i32 3
  %61 = load i8, i8* %arrayidx159, align 1
  %conv160 = sext i8 %61 to i32
  %cmp161 = icmp eq i32 %conv160, 105
  br i1 %cmp161, label %if.then163, label %if.end164

if.then163:                                       ; preds = %if.end158
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.5, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.end164:                                        ; preds = %if.end158
  %62 = load i8*, i8** %name.addr, align 4
  %arrayidx165 = getelementptr inbounds i8, i8* %62, i32 3
  %63 = load i8, i8* %arrayidx165, align 1
  %conv166 = sext i8 %63 to i32
  %cmp167 = icmp eq i32 %conv166, 111
  br i1 %cmp167, label %if.then169, label %if.end170

if.then169:                                       ; preds = %if.end164
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.6, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.end170:                                        ; preds = %if.end164
  %64 = load i8*, i8** %name.addr, align 4
  %arrayidx171 = getelementptr inbounds i8, i8* %64, i32 3
  %65 = load i8, i8* %arrayidx171, align 1
  %conv172 = sext i8 %65 to i32
  %cmp173 = icmp eq i32 %conv172, 117
  br i1 %cmp173, label %if.then175, label %if.end176

if.then175:                                       ; preds = %if.end170
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.end176:                                        ; preds = %if.end170
  %66 = load i8*, i8** %name.addr, align 4
  %arrayidx177 = getelementptr inbounds i8, i8* %66, i32 3
  %67 = load i8, i8* %arrayidx177, align 1
  %conv178 = sext i8 %67 to i32
  %cmp179 = icmp eq i32 %conv178, 120
  br i1 %cmp179, label %if.then181, label %if.end182

if.then181:                                       ; preds = %if.end176
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.8, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.end182:                                        ; preds = %if.end176
  %68 = load i8*, i8** %name.addr, align 4
  %arrayidx183 = getelementptr inbounds i8, i8* %68, i32 3
  %69 = load i8, i8* %arrayidx183, align 1
  %conv184 = sext i8 %69 to i32
  %cmp185 = icmp eq i32 %conv184, 88
  br i1 %cmp185, label %if.then187, label %if.end188

if.then187:                                       ; preds = %if.end182
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.end188:                                        ; preds = %if.end182
  call void @abort() #4
  unreachable

if.end189:                                        ; preds = %land.lhs.true147, %land.lhs.true142, %if.end137
  %70 = load i8*, i8** %name.addr, align 4
  %arrayidx190 = getelementptr inbounds i8, i8* %70, i32 4
  %71 = load i8, i8* %arrayidx190, align 1
  %conv191 = sext i8 %71 to i32
  %cmp192 = icmp eq i32 %conv191, 54
  br i1 %cmp192, label %land.lhs.true194, label %if.end241

land.lhs.true194:                                 ; preds = %if.end189
  %72 = load i8*, i8** %name.addr, align 4
  %arrayidx195 = getelementptr inbounds i8, i8* %72, i32 5
  %73 = load i8, i8* %arrayidx195, align 1
  %conv196 = sext i8 %73 to i32
  %cmp197 = icmp eq i32 %conv196, 52
  br i1 %cmp197, label %land.lhs.true199, label %if.end241

land.lhs.true199:                                 ; preds = %land.lhs.true194
  %74 = load i8*, i8** %name.addr, align 4
  %arrayidx200 = getelementptr inbounds i8, i8* %74, i32 6
  %75 = load i8, i8* %arrayidx200, align 1
  %conv201 = sext i8 %75 to i32
  %cmp202 = icmp eq i32 %conv201, 0
  br i1 %cmp202, label %if.then204, label %if.end241

if.then204:                                       ; preds = %land.lhs.true199
  %76 = load i8*, i8** %name.addr, align 4
  %arrayidx205 = getelementptr inbounds i8, i8* %76, i32 3
  %77 = load i8, i8* %arrayidx205, align 1
  %conv206 = sext i8 %77 to i32
  %cmp207 = icmp eq i32 %conv206, 100
  br i1 %cmp207, label %if.then209, label %if.end210

if.then209:                                       ; preds = %if.then204
  store i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.10, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.end210:                                        ; preds = %if.then204
  %78 = load i8*, i8** %name.addr, align 4
  %arrayidx211 = getelementptr inbounds i8, i8* %78, i32 3
  %79 = load i8, i8* %arrayidx211, align 1
  %conv212 = sext i8 %79 to i32
  %cmp213 = icmp eq i32 %conv212, 105
  br i1 %cmp213, label %if.then215, label %if.end216

if.then215:                                       ; preds = %if.end210
  store i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.11, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.end216:                                        ; preds = %if.end210
  %80 = load i8*, i8** %name.addr, align 4
  %arrayidx217 = getelementptr inbounds i8, i8* %80, i32 3
  %81 = load i8, i8* %arrayidx217, align 1
  %conv218 = sext i8 %81 to i32
  %cmp219 = icmp eq i32 %conv218, 111
  br i1 %cmp219, label %if.then221, label %if.end222

if.then221:                                       ; preds = %if.end216
  store i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.12, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.end222:                                        ; preds = %if.end216
  %82 = load i8*, i8** %name.addr, align 4
  %arrayidx223 = getelementptr inbounds i8, i8* %82, i32 3
  %83 = load i8, i8* %arrayidx223, align 1
  %conv224 = sext i8 %83 to i32
  %cmp225 = icmp eq i32 %conv224, 117
  br i1 %cmp225, label %if.then227, label %if.end228

if.then227:                                       ; preds = %if.end222
  store i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.13, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.end228:                                        ; preds = %if.end222
  %84 = load i8*, i8** %name.addr, align 4
  %arrayidx229 = getelementptr inbounds i8, i8* %84, i32 3
  %85 = load i8, i8* %arrayidx229, align 1
  %conv230 = sext i8 %85 to i32
  %cmp231 = icmp eq i32 %conv230, 120
  br i1 %cmp231, label %if.then233, label %if.end234

if.then233:                                       ; preds = %if.end228
  store i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.14, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.end234:                                        ; preds = %if.end228
  %86 = load i8*, i8** %name.addr, align 4
  %arrayidx235 = getelementptr inbounds i8, i8* %86, i32 3
  %87 = load i8, i8* %arrayidx235, align 1
  %conv236 = sext i8 %87 to i32
  %cmp237 = icmp eq i32 %conv236, 88
  br i1 %cmp237, label %if.then239, label %if.end240

if.then239:                                       ; preds = %if.end234
  store i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.15, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.end240:                                        ; preds = %if.end234
  call void @abort() #4
  unreachable

if.end241:                                        ; preds = %land.lhs.true199, %land.lhs.true194, %if.end189
  %88 = load i8*, i8** %name.addr, align 4
  %arrayidx242 = getelementptr inbounds i8, i8* %88, i32 4
  %89 = load i8, i8* %arrayidx242, align 1
  %conv243 = sext i8 %89 to i32
  %cmp244 = icmp eq i32 %conv243, 76
  br i1 %cmp244, label %land.lhs.true246, label %if.end470

land.lhs.true246:                                 ; preds = %if.end241
  %90 = load i8*, i8** %name.addr, align 4
  %arrayidx247 = getelementptr inbounds i8, i8* %90, i32 5
  %91 = load i8, i8* %arrayidx247, align 1
  %conv248 = sext i8 %91 to i32
  %cmp249 = icmp eq i32 %conv248, 69
  br i1 %cmp249, label %land.lhs.true251, label %if.end470

land.lhs.true251:                                 ; preds = %land.lhs.true246
  %92 = load i8*, i8** %name.addr, align 4
  %arrayidx252 = getelementptr inbounds i8, i8* %92, i32 6
  %93 = load i8, i8* %arrayidx252, align 1
  %conv253 = sext i8 %93 to i32
  %cmp254 = icmp eq i32 %conv253, 65
  br i1 %cmp254, label %land.lhs.true256, label %if.end470

land.lhs.true256:                                 ; preds = %land.lhs.true251
  %94 = load i8*, i8** %name.addr, align 4
  %arrayidx257 = getelementptr inbounds i8, i8* %94, i32 7
  %95 = load i8, i8* %arrayidx257, align 1
  %conv258 = sext i8 %95 to i32
  %cmp259 = icmp eq i32 %conv258, 83
  br i1 %cmp259, label %land.lhs.true261, label %if.end470

land.lhs.true261:                                 ; preds = %land.lhs.true256
  %96 = load i8*, i8** %name.addr, align 4
  %arrayidx262 = getelementptr inbounds i8, i8* %96, i32 8
  %97 = load i8, i8* %arrayidx262, align 1
  %conv263 = sext i8 %97 to i32
  %cmp264 = icmp eq i32 %conv263, 84
  br i1 %cmp264, label %if.then266, label %if.end470

if.then266:                                       ; preds = %land.lhs.true261
  %98 = load i8*, i8** %name.addr, align 4
  %arrayidx267 = getelementptr inbounds i8, i8* %98, i32 9
  %99 = load i8, i8* %arrayidx267, align 1
  %conv268 = sext i8 %99 to i32
  %cmp269 = icmp eq i32 %conv268, 56
  br i1 %cmp269, label %land.lhs.true271, label %if.end313

land.lhs.true271:                                 ; preds = %if.then266
  %100 = load i8*, i8** %name.addr, align 4
  %arrayidx272 = getelementptr inbounds i8, i8* %100, i32 10
  %101 = load i8, i8* %arrayidx272, align 1
  %conv273 = sext i8 %101 to i32
  %cmp274 = icmp eq i32 %conv273, 0
  br i1 %cmp274, label %if.then276, label %if.end313

if.then276:                                       ; preds = %land.lhs.true271
  %102 = load i8*, i8** %name.addr, align 4
  %arrayidx277 = getelementptr inbounds i8, i8* %102, i32 3
  %103 = load i8, i8* %arrayidx277, align 1
  %conv278 = sext i8 %103 to i32
  %cmp279 = icmp eq i32 %conv278, 100
  br i1 %cmp279, label %if.then281, label %if.end282

if.then281:                                       ; preds = %if.then276
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.end282:                                        ; preds = %if.then276
  %104 = load i8*, i8** %name.addr, align 4
  %arrayidx283 = getelementptr inbounds i8, i8* %104, i32 3
  %105 = load i8, i8* %arrayidx283, align 1
  %conv284 = sext i8 %105 to i32
  %cmp285 = icmp eq i32 %conv284, 105
  br i1 %cmp285, label %if.then287, label %if.end288

if.then287:                                       ; preds = %if.end282
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.5, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.end288:                                        ; preds = %if.end282
  %106 = load i8*, i8** %name.addr, align 4
  %arrayidx289 = getelementptr inbounds i8, i8* %106, i32 3
  %107 = load i8, i8* %arrayidx289, align 1
  %conv290 = sext i8 %107 to i32
  %cmp291 = icmp eq i32 %conv290, 111
  br i1 %cmp291, label %if.then293, label %if.end294

if.then293:                                       ; preds = %if.end288
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.6, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.end294:                                        ; preds = %if.end288
  %108 = load i8*, i8** %name.addr, align 4
  %arrayidx295 = getelementptr inbounds i8, i8* %108, i32 3
  %109 = load i8, i8* %arrayidx295, align 1
  %conv296 = sext i8 %109 to i32
  %cmp297 = icmp eq i32 %conv296, 117
  br i1 %cmp297, label %if.then299, label %if.end300

if.then299:                                       ; preds = %if.end294
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.end300:                                        ; preds = %if.end294
  %110 = load i8*, i8** %name.addr, align 4
  %arrayidx301 = getelementptr inbounds i8, i8* %110, i32 3
  %111 = load i8, i8* %arrayidx301, align 1
  %conv302 = sext i8 %111 to i32
  %cmp303 = icmp eq i32 %conv302, 120
  br i1 %cmp303, label %if.then305, label %if.end306

if.then305:                                       ; preds = %if.end300
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.8, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.end306:                                        ; preds = %if.end300
  %112 = load i8*, i8** %name.addr, align 4
  %arrayidx307 = getelementptr inbounds i8, i8* %112, i32 3
  %113 = load i8, i8* %arrayidx307, align 1
  %conv308 = sext i8 %113 to i32
  %cmp309 = icmp eq i32 %conv308, 88
  br i1 %cmp309, label %if.then311, label %if.end312

if.then311:                                       ; preds = %if.end306
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.end312:                                        ; preds = %if.end306
  call void @abort() #4
  unreachable

if.end313:                                        ; preds = %land.lhs.true271, %if.then266
  %114 = load i8*, i8** %name.addr, align 4
  %arrayidx314 = getelementptr inbounds i8, i8* %114, i32 9
  %115 = load i8, i8* %arrayidx314, align 1
  %conv315 = sext i8 %115 to i32
  %cmp316 = icmp eq i32 %conv315, 49
  br i1 %cmp316, label %land.lhs.true318, label %if.end365

land.lhs.true318:                                 ; preds = %if.end313
  %116 = load i8*, i8** %name.addr, align 4
  %arrayidx319 = getelementptr inbounds i8, i8* %116, i32 10
  %117 = load i8, i8* %arrayidx319, align 1
  %conv320 = sext i8 %117 to i32
  %cmp321 = icmp eq i32 %conv320, 54
  br i1 %cmp321, label %land.lhs.true323, label %if.end365

land.lhs.true323:                                 ; preds = %land.lhs.true318
  %118 = load i8*, i8** %name.addr, align 4
  %arrayidx324 = getelementptr inbounds i8, i8* %118, i32 11
  %119 = load i8, i8* %arrayidx324, align 1
  %conv325 = sext i8 %119 to i32
  %cmp326 = icmp eq i32 %conv325, 0
  br i1 %cmp326, label %if.then328, label %if.end365

if.then328:                                       ; preds = %land.lhs.true323
  %120 = load i8*, i8** %name.addr, align 4
  %arrayidx329 = getelementptr inbounds i8, i8* %120, i32 3
  %121 = load i8, i8* %arrayidx329, align 1
  %conv330 = sext i8 %121 to i32
  %cmp331 = icmp eq i32 %conv330, 100
  br i1 %cmp331, label %if.then333, label %if.end334

if.then333:                                       ; preds = %if.then328
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.end334:                                        ; preds = %if.then328
  %122 = load i8*, i8** %name.addr, align 4
  %arrayidx335 = getelementptr inbounds i8, i8* %122, i32 3
  %123 = load i8, i8* %arrayidx335, align 1
  %conv336 = sext i8 %123 to i32
  %cmp337 = icmp eq i32 %conv336, 105
  br i1 %cmp337, label %if.then339, label %if.end340

if.then339:                                       ; preds = %if.end334
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.5, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.end340:                                        ; preds = %if.end334
  %124 = load i8*, i8** %name.addr, align 4
  %arrayidx341 = getelementptr inbounds i8, i8* %124, i32 3
  %125 = load i8, i8* %arrayidx341, align 1
  %conv342 = sext i8 %125 to i32
  %cmp343 = icmp eq i32 %conv342, 111
  br i1 %cmp343, label %if.then345, label %if.end346

if.then345:                                       ; preds = %if.end340
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.6, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.end346:                                        ; preds = %if.end340
  %126 = load i8*, i8** %name.addr, align 4
  %arrayidx347 = getelementptr inbounds i8, i8* %126, i32 3
  %127 = load i8, i8* %arrayidx347, align 1
  %conv348 = sext i8 %127 to i32
  %cmp349 = icmp eq i32 %conv348, 117
  br i1 %cmp349, label %if.then351, label %if.end352

if.then351:                                       ; preds = %if.end346
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.end352:                                        ; preds = %if.end346
  %128 = load i8*, i8** %name.addr, align 4
  %arrayidx353 = getelementptr inbounds i8, i8* %128, i32 3
  %129 = load i8, i8* %arrayidx353, align 1
  %conv354 = sext i8 %129 to i32
  %cmp355 = icmp eq i32 %conv354, 120
  br i1 %cmp355, label %if.then357, label %if.end358

if.then357:                                       ; preds = %if.end352
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.8, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.end358:                                        ; preds = %if.end352
  %130 = load i8*, i8** %name.addr, align 4
  %arrayidx359 = getelementptr inbounds i8, i8* %130, i32 3
  %131 = load i8, i8* %arrayidx359, align 1
  %conv360 = sext i8 %131 to i32
  %cmp361 = icmp eq i32 %conv360, 88
  br i1 %cmp361, label %if.then363, label %if.end364

if.then363:                                       ; preds = %if.end358
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.end364:                                        ; preds = %if.end358
  call void @abort() #4
  unreachable

if.end365:                                        ; preds = %land.lhs.true323, %land.lhs.true318, %if.end313
  %132 = load i8*, i8** %name.addr, align 4
  %arrayidx366 = getelementptr inbounds i8, i8* %132, i32 9
  %133 = load i8, i8* %arrayidx366, align 1
  %conv367 = sext i8 %133 to i32
  %cmp368 = icmp eq i32 %conv367, 51
  br i1 %cmp368, label %land.lhs.true370, label %if.end417

land.lhs.true370:                                 ; preds = %if.end365
  %134 = load i8*, i8** %name.addr, align 4
  %arrayidx371 = getelementptr inbounds i8, i8* %134, i32 10
  %135 = load i8, i8* %arrayidx371, align 1
  %conv372 = sext i8 %135 to i32
  %cmp373 = icmp eq i32 %conv372, 50
  br i1 %cmp373, label %land.lhs.true375, label %if.end417

land.lhs.true375:                                 ; preds = %land.lhs.true370
  %136 = load i8*, i8** %name.addr, align 4
  %arrayidx376 = getelementptr inbounds i8, i8* %136, i32 11
  %137 = load i8, i8* %arrayidx376, align 1
  %conv377 = sext i8 %137 to i32
  %cmp378 = icmp eq i32 %conv377, 0
  br i1 %cmp378, label %if.then380, label %if.end417

if.then380:                                       ; preds = %land.lhs.true375
  %138 = load i8*, i8** %name.addr, align 4
  %arrayidx381 = getelementptr inbounds i8, i8* %138, i32 3
  %139 = load i8, i8* %arrayidx381, align 1
  %conv382 = sext i8 %139 to i32
  %cmp383 = icmp eq i32 %conv382, 100
  br i1 %cmp383, label %if.then385, label %if.end386

if.then385:                                       ; preds = %if.then380
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.end386:                                        ; preds = %if.then380
  %140 = load i8*, i8** %name.addr, align 4
  %arrayidx387 = getelementptr inbounds i8, i8* %140, i32 3
  %141 = load i8, i8* %arrayidx387, align 1
  %conv388 = sext i8 %141 to i32
  %cmp389 = icmp eq i32 %conv388, 105
  br i1 %cmp389, label %if.then391, label %if.end392

if.then391:                                       ; preds = %if.end386
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.5, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.end392:                                        ; preds = %if.end386
  %142 = load i8*, i8** %name.addr, align 4
  %arrayidx393 = getelementptr inbounds i8, i8* %142, i32 3
  %143 = load i8, i8* %arrayidx393, align 1
  %conv394 = sext i8 %143 to i32
  %cmp395 = icmp eq i32 %conv394, 111
  br i1 %cmp395, label %if.then397, label %if.end398

if.then397:                                       ; preds = %if.end392
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.6, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.end398:                                        ; preds = %if.end392
  %144 = load i8*, i8** %name.addr, align 4
  %arrayidx399 = getelementptr inbounds i8, i8* %144, i32 3
  %145 = load i8, i8* %arrayidx399, align 1
  %conv400 = sext i8 %145 to i32
  %cmp401 = icmp eq i32 %conv400, 117
  br i1 %cmp401, label %if.then403, label %if.end404

if.then403:                                       ; preds = %if.end398
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.end404:                                        ; preds = %if.end398
  %146 = load i8*, i8** %name.addr, align 4
  %arrayidx405 = getelementptr inbounds i8, i8* %146, i32 3
  %147 = load i8, i8* %arrayidx405, align 1
  %conv406 = sext i8 %147 to i32
  %cmp407 = icmp eq i32 %conv406, 120
  br i1 %cmp407, label %if.then409, label %if.end410

if.then409:                                       ; preds = %if.end404
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.8, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.end410:                                        ; preds = %if.end404
  %148 = load i8*, i8** %name.addr, align 4
  %arrayidx411 = getelementptr inbounds i8, i8* %148, i32 3
  %149 = load i8, i8* %arrayidx411, align 1
  %conv412 = sext i8 %149 to i32
  %cmp413 = icmp eq i32 %conv412, 88
  br i1 %cmp413, label %if.then415, label %if.end416

if.then415:                                       ; preds = %if.end410
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.end416:                                        ; preds = %if.end410
  call void @abort() #4
  unreachable

if.end417:                                        ; preds = %land.lhs.true375, %land.lhs.true370, %if.end365
  %150 = load i8*, i8** %name.addr, align 4
  %arrayidx418 = getelementptr inbounds i8, i8* %150, i32 9
  %151 = load i8, i8* %arrayidx418, align 1
  %conv419 = sext i8 %151 to i32
  %cmp420 = icmp eq i32 %conv419, 54
  br i1 %cmp420, label %land.lhs.true422, label %if.end469

land.lhs.true422:                                 ; preds = %if.end417
  %152 = load i8*, i8** %name.addr, align 4
  %arrayidx423 = getelementptr inbounds i8, i8* %152, i32 10
  %153 = load i8, i8* %arrayidx423, align 1
  %conv424 = sext i8 %153 to i32
  %cmp425 = icmp eq i32 %conv424, 52
  br i1 %cmp425, label %land.lhs.true427, label %if.end469

land.lhs.true427:                                 ; preds = %land.lhs.true422
  %154 = load i8*, i8** %name.addr, align 4
  %arrayidx428 = getelementptr inbounds i8, i8* %154, i32 11
  %155 = load i8, i8* %arrayidx428, align 1
  %conv429 = sext i8 %155 to i32
  %cmp430 = icmp eq i32 %conv429, 0
  br i1 %cmp430, label %if.then432, label %if.end469

if.then432:                                       ; preds = %land.lhs.true427
  %156 = load i8*, i8** %name.addr, align 4
  %arrayidx433 = getelementptr inbounds i8, i8* %156, i32 3
  %157 = load i8, i8* %arrayidx433, align 1
  %conv434 = sext i8 %157 to i32
  %cmp435 = icmp eq i32 %conv434, 100
  br i1 %cmp435, label %if.then437, label %if.end438

if.then437:                                       ; preds = %if.then432
  store i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.10, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.end438:                                        ; preds = %if.then432
  %158 = load i8*, i8** %name.addr, align 4
  %arrayidx439 = getelementptr inbounds i8, i8* %158, i32 3
  %159 = load i8, i8* %arrayidx439, align 1
  %conv440 = sext i8 %159 to i32
  %cmp441 = icmp eq i32 %conv440, 105
  br i1 %cmp441, label %if.then443, label %if.end444

if.then443:                                       ; preds = %if.end438
  store i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.11, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.end444:                                        ; preds = %if.end438
  %160 = load i8*, i8** %name.addr, align 4
  %arrayidx445 = getelementptr inbounds i8, i8* %160, i32 3
  %161 = load i8, i8* %arrayidx445, align 1
  %conv446 = sext i8 %161 to i32
  %cmp447 = icmp eq i32 %conv446, 111
  br i1 %cmp447, label %if.then449, label %if.end450

if.then449:                                       ; preds = %if.end444
  store i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.12, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.end450:                                        ; preds = %if.end444
  %162 = load i8*, i8** %name.addr, align 4
  %arrayidx451 = getelementptr inbounds i8, i8* %162, i32 3
  %163 = load i8, i8* %arrayidx451, align 1
  %conv452 = sext i8 %163 to i32
  %cmp453 = icmp eq i32 %conv452, 117
  br i1 %cmp453, label %if.then455, label %if.end456

if.then455:                                       ; preds = %if.end450
  store i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.13, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.end456:                                        ; preds = %if.end450
  %164 = load i8*, i8** %name.addr, align 4
  %arrayidx457 = getelementptr inbounds i8, i8* %164, i32 3
  %165 = load i8, i8* %arrayidx457, align 1
  %conv458 = sext i8 %165 to i32
  %cmp459 = icmp eq i32 %conv458, 120
  br i1 %cmp459, label %if.then461, label %if.end462

if.then461:                                       ; preds = %if.end456
  store i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.14, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.end462:                                        ; preds = %if.end456
  %166 = load i8*, i8** %name.addr, align 4
  %arrayidx463 = getelementptr inbounds i8, i8* %166, i32 3
  %167 = load i8, i8* %arrayidx463, align 1
  %conv464 = sext i8 %167 to i32
  %cmp465 = icmp eq i32 %conv464, 88
  br i1 %cmp465, label %if.then467, label %if.end468

if.then467:                                       ; preds = %if.end462
  store i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.15, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.end468:                                        ; preds = %if.end462
  call void @abort() #4
  unreachable

if.end469:                                        ; preds = %land.lhs.true427, %land.lhs.true422, %if.end417
  br label %if.end470

if.end470:                                        ; preds = %if.end469, %land.lhs.true261, %land.lhs.true256, %land.lhs.true251, %land.lhs.true246, %if.end241
  %168 = load i8*, i8** %name.addr, align 4
  %arrayidx471 = getelementptr inbounds i8, i8* %168, i32 4
  %169 = load i8, i8* %arrayidx471, align 1
  %conv472 = sext i8 %169 to i32
  %cmp473 = icmp eq i32 %conv472, 70
  br i1 %cmp473, label %land.lhs.true475, label %if.end694

land.lhs.true475:                                 ; preds = %if.end470
  %170 = load i8*, i8** %name.addr, align 4
  %arrayidx476 = getelementptr inbounds i8, i8* %170, i32 5
  %171 = load i8, i8* %arrayidx476, align 1
  %conv477 = sext i8 %171 to i32
  %cmp478 = icmp eq i32 %conv477, 65
  br i1 %cmp478, label %land.lhs.true480, label %if.end694

land.lhs.true480:                                 ; preds = %land.lhs.true475
  %172 = load i8*, i8** %name.addr, align 4
  %arrayidx481 = getelementptr inbounds i8, i8* %172, i32 6
  %173 = load i8, i8* %arrayidx481, align 1
  %conv482 = sext i8 %173 to i32
  %cmp483 = icmp eq i32 %conv482, 83
  br i1 %cmp483, label %land.lhs.true485, label %if.end694

land.lhs.true485:                                 ; preds = %land.lhs.true480
  %174 = load i8*, i8** %name.addr, align 4
  %arrayidx486 = getelementptr inbounds i8, i8* %174, i32 7
  %175 = load i8, i8* %arrayidx486, align 1
  %conv487 = sext i8 %175 to i32
  %cmp488 = icmp eq i32 %conv487, 84
  br i1 %cmp488, label %if.then490, label %if.end694

if.then490:                                       ; preds = %land.lhs.true485
  %176 = load i8*, i8** %name.addr, align 4
  %arrayidx491 = getelementptr inbounds i8, i8* %176, i32 8
  %177 = load i8, i8* %arrayidx491, align 1
  %conv492 = sext i8 %177 to i32
  %cmp493 = icmp eq i32 %conv492, 56
  br i1 %cmp493, label %land.lhs.true495, label %if.end537

land.lhs.true495:                                 ; preds = %if.then490
  %178 = load i8*, i8** %name.addr, align 4
  %arrayidx496 = getelementptr inbounds i8, i8* %178, i32 9
  %179 = load i8, i8* %arrayidx496, align 1
  %conv497 = sext i8 %179 to i32
  %cmp498 = icmp eq i32 %conv497, 0
  br i1 %cmp498, label %if.then500, label %if.end537

if.then500:                                       ; preds = %land.lhs.true495
  %180 = load i8*, i8** %name.addr, align 4
  %arrayidx501 = getelementptr inbounds i8, i8* %180, i32 3
  %181 = load i8, i8* %arrayidx501, align 1
  %conv502 = sext i8 %181 to i32
  %cmp503 = icmp eq i32 %conv502, 100
  br i1 %cmp503, label %if.then505, label %if.end506

if.then505:                                       ; preds = %if.then500
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.end506:                                        ; preds = %if.then500
  %182 = load i8*, i8** %name.addr, align 4
  %arrayidx507 = getelementptr inbounds i8, i8* %182, i32 3
  %183 = load i8, i8* %arrayidx507, align 1
  %conv508 = sext i8 %183 to i32
  %cmp509 = icmp eq i32 %conv508, 105
  br i1 %cmp509, label %if.then511, label %if.end512

if.then511:                                       ; preds = %if.end506
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.5, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.end512:                                        ; preds = %if.end506
  %184 = load i8*, i8** %name.addr, align 4
  %arrayidx513 = getelementptr inbounds i8, i8* %184, i32 3
  %185 = load i8, i8* %arrayidx513, align 1
  %conv514 = sext i8 %185 to i32
  %cmp515 = icmp eq i32 %conv514, 111
  br i1 %cmp515, label %if.then517, label %if.end518

if.then517:                                       ; preds = %if.end512
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.6, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.end518:                                        ; preds = %if.end512
  %186 = load i8*, i8** %name.addr, align 4
  %arrayidx519 = getelementptr inbounds i8, i8* %186, i32 3
  %187 = load i8, i8* %arrayidx519, align 1
  %conv520 = sext i8 %187 to i32
  %cmp521 = icmp eq i32 %conv520, 117
  br i1 %cmp521, label %if.then523, label %if.end524

if.then523:                                       ; preds = %if.end518
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.end524:                                        ; preds = %if.end518
  %188 = load i8*, i8** %name.addr, align 4
  %arrayidx525 = getelementptr inbounds i8, i8* %188, i32 3
  %189 = load i8, i8* %arrayidx525, align 1
  %conv526 = sext i8 %189 to i32
  %cmp527 = icmp eq i32 %conv526, 120
  br i1 %cmp527, label %if.then529, label %if.end530

if.then529:                                       ; preds = %if.end524
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.8, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.end530:                                        ; preds = %if.end524
  %190 = load i8*, i8** %name.addr, align 4
  %arrayidx531 = getelementptr inbounds i8, i8* %190, i32 3
  %191 = load i8, i8* %arrayidx531, align 1
  %conv532 = sext i8 %191 to i32
  %cmp533 = icmp eq i32 %conv532, 88
  br i1 %cmp533, label %if.then535, label %if.end536

if.then535:                                       ; preds = %if.end530
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.end536:                                        ; preds = %if.end530
  call void @abort() #4
  unreachable

if.end537:                                        ; preds = %land.lhs.true495, %if.then490
  %192 = load i8*, i8** %name.addr, align 4
  %arrayidx538 = getelementptr inbounds i8, i8* %192, i32 8
  %193 = load i8, i8* %arrayidx538, align 1
  %conv539 = sext i8 %193 to i32
  %cmp540 = icmp eq i32 %conv539, 49
  br i1 %cmp540, label %land.lhs.true542, label %if.end589

land.lhs.true542:                                 ; preds = %if.end537
  %194 = load i8*, i8** %name.addr, align 4
  %arrayidx543 = getelementptr inbounds i8, i8* %194, i32 9
  %195 = load i8, i8* %arrayidx543, align 1
  %conv544 = sext i8 %195 to i32
  %cmp545 = icmp eq i32 %conv544, 54
  br i1 %cmp545, label %land.lhs.true547, label %if.end589

land.lhs.true547:                                 ; preds = %land.lhs.true542
  %196 = load i8*, i8** %name.addr, align 4
  %arrayidx548 = getelementptr inbounds i8, i8* %196, i32 10
  %197 = load i8, i8* %arrayidx548, align 1
  %conv549 = sext i8 %197 to i32
  %cmp550 = icmp eq i32 %conv549, 0
  br i1 %cmp550, label %if.then552, label %if.end589

if.then552:                                       ; preds = %land.lhs.true547
  %198 = load i8*, i8** %name.addr, align 4
  %arrayidx553 = getelementptr inbounds i8, i8* %198, i32 3
  %199 = load i8, i8* %arrayidx553, align 1
  %conv554 = sext i8 %199 to i32
  %cmp555 = icmp eq i32 %conv554, 100
  br i1 %cmp555, label %if.then557, label %if.end558

if.then557:                                       ; preds = %if.then552
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.end558:                                        ; preds = %if.then552
  %200 = load i8*, i8** %name.addr, align 4
  %arrayidx559 = getelementptr inbounds i8, i8* %200, i32 3
  %201 = load i8, i8* %arrayidx559, align 1
  %conv560 = sext i8 %201 to i32
  %cmp561 = icmp eq i32 %conv560, 105
  br i1 %cmp561, label %if.then563, label %if.end564

if.then563:                                       ; preds = %if.end558
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.5, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.end564:                                        ; preds = %if.end558
  %202 = load i8*, i8** %name.addr, align 4
  %arrayidx565 = getelementptr inbounds i8, i8* %202, i32 3
  %203 = load i8, i8* %arrayidx565, align 1
  %conv566 = sext i8 %203 to i32
  %cmp567 = icmp eq i32 %conv566, 111
  br i1 %cmp567, label %if.then569, label %if.end570

if.then569:                                       ; preds = %if.end564
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.6, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.end570:                                        ; preds = %if.end564
  %204 = load i8*, i8** %name.addr, align 4
  %arrayidx571 = getelementptr inbounds i8, i8* %204, i32 3
  %205 = load i8, i8* %arrayidx571, align 1
  %conv572 = sext i8 %205 to i32
  %cmp573 = icmp eq i32 %conv572, 117
  br i1 %cmp573, label %if.then575, label %if.end576

if.then575:                                       ; preds = %if.end570
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.end576:                                        ; preds = %if.end570
  %206 = load i8*, i8** %name.addr, align 4
  %arrayidx577 = getelementptr inbounds i8, i8* %206, i32 3
  %207 = load i8, i8* %arrayidx577, align 1
  %conv578 = sext i8 %207 to i32
  %cmp579 = icmp eq i32 %conv578, 120
  br i1 %cmp579, label %if.then581, label %if.end582

if.then581:                                       ; preds = %if.end576
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.8, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.end582:                                        ; preds = %if.end576
  %208 = load i8*, i8** %name.addr, align 4
  %arrayidx583 = getelementptr inbounds i8, i8* %208, i32 3
  %209 = load i8, i8* %arrayidx583, align 1
  %conv584 = sext i8 %209 to i32
  %cmp585 = icmp eq i32 %conv584, 88
  br i1 %cmp585, label %if.then587, label %if.end588

if.then587:                                       ; preds = %if.end582
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.end588:                                        ; preds = %if.end582
  call void @abort() #4
  unreachable

if.end589:                                        ; preds = %land.lhs.true547, %land.lhs.true542, %if.end537
  %210 = load i8*, i8** %name.addr, align 4
  %arrayidx590 = getelementptr inbounds i8, i8* %210, i32 8
  %211 = load i8, i8* %arrayidx590, align 1
  %conv591 = sext i8 %211 to i32
  %cmp592 = icmp eq i32 %conv591, 51
  br i1 %cmp592, label %land.lhs.true594, label %if.end641

land.lhs.true594:                                 ; preds = %if.end589
  %212 = load i8*, i8** %name.addr, align 4
  %arrayidx595 = getelementptr inbounds i8, i8* %212, i32 9
  %213 = load i8, i8* %arrayidx595, align 1
  %conv596 = sext i8 %213 to i32
  %cmp597 = icmp eq i32 %conv596, 50
  br i1 %cmp597, label %land.lhs.true599, label %if.end641

land.lhs.true599:                                 ; preds = %land.lhs.true594
  %214 = load i8*, i8** %name.addr, align 4
  %arrayidx600 = getelementptr inbounds i8, i8* %214, i32 10
  %215 = load i8, i8* %arrayidx600, align 1
  %conv601 = sext i8 %215 to i32
  %cmp602 = icmp eq i32 %conv601, 0
  br i1 %cmp602, label %if.then604, label %if.end641

if.then604:                                       ; preds = %land.lhs.true599
  %216 = load i8*, i8** %name.addr, align 4
  %arrayidx605 = getelementptr inbounds i8, i8* %216, i32 3
  %217 = load i8, i8* %arrayidx605, align 1
  %conv606 = sext i8 %217 to i32
  %cmp607 = icmp eq i32 %conv606, 100
  br i1 %cmp607, label %if.then609, label %if.end610

if.then609:                                       ; preds = %if.then604
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.end610:                                        ; preds = %if.then604
  %218 = load i8*, i8** %name.addr, align 4
  %arrayidx611 = getelementptr inbounds i8, i8* %218, i32 3
  %219 = load i8, i8* %arrayidx611, align 1
  %conv612 = sext i8 %219 to i32
  %cmp613 = icmp eq i32 %conv612, 105
  br i1 %cmp613, label %if.then615, label %if.end616

if.then615:                                       ; preds = %if.end610
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.5, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.end616:                                        ; preds = %if.end610
  %220 = load i8*, i8** %name.addr, align 4
  %arrayidx617 = getelementptr inbounds i8, i8* %220, i32 3
  %221 = load i8, i8* %arrayidx617, align 1
  %conv618 = sext i8 %221 to i32
  %cmp619 = icmp eq i32 %conv618, 111
  br i1 %cmp619, label %if.then621, label %if.end622

if.then621:                                       ; preds = %if.end616
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.6, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.end622:                                        ; preds = %if.end616
  %222 = load i8*, i8** %name.addr, align 4
  %arrayidx623 = getelementptr inbounds i8, i8* %222, i32 3
  %223 = load i8, i8* %arrayidx623, align 1
  %conv624 = sext i8 %223 to i32
  %cmp625 = icmp eq i32 %conv624, 117
  br i1 %cmp625, label %if.then627, label %if.end628

if.then627:                                       ; preds = %if.end622
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.end628:                                        ; preds = %if.end622
  %224 = load i8*, i8** %name.addr, align 4
  %arrayidx629 = getelementptr inbounds i8, i8* %224, i32 3
  %225 = load i8, i8* %arrayidx629, align 1
  %conv630 = sext i8 %225 to i32
  %cmp631 = icmp eq i32 %conv630, 120
  br i1 %cmp631, label %if.then633, label %if.end634

if.then633:                                       ; preds = %if.end628
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.8, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.end634:                                        ; preds = %if.end628
  %226 = load i8*, i8** %name.addr, align 4
  %arrayidx635 = getelementptr inbounds i8, i8* %226, i32 3
  %227 = load i8, i8* %arrayidx635, align 1
  %conv636 = sext i8 %227 to i32
  %cmp637 = icmp eq i32 %conv636, 88
  br i1 %cmp637, label %if.then639, label %if.end640

if.then639:                                       ; preds = %if.end634
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.end640:                                        ; preds = %if.end634
  call void @abort() #4
  unreachable

if.end641:                                        ; preds = %land.lhs.true599, %land.lhs.true594, %if.end589
  %228 = load i8*, i8** %name.addr, align 4
  %arrayidx642 = getelementptr inbounds i8, i8* %228, i32 8
  %229 = load i8, i8* %arrayidx642, align 1
  %conv643 = sext i8 %229 to i32
  %cmp644 = icmp eq i32 %conv643, 54
  br i1 %cmp644, label %land.lhs.true646, label %if.end693

land.lhs.true646:                                 ; preds = %if.end641
  %230 = load i8*, i8** %name.addr, align 4
  %arrayidx647 = getelementptr inbounds i8, i8* %230, i32 9
  %231 = load i8, i8* %arrayidx647, align 1
  %conv648 = sext i8 %231 to i32
  %cmp649 = icmp eq i32 %conv648, 52
  br i1 %cmp649, label %land.lhs.true651, label %if.end693

land.lhs.true651:                                 ; preds = %land.lhs.true646
  %232 = load i8*, i8** %name.addr, align 4
  %arrayidx652 = getelementptr inbounds i8, i8* %232, i32 10
  %233 = load i8, i8* %arrayidx652, align 1
  %conv653 = sext i8 %233 to i32
  %cmp654 = icmp eq i32 %conv653, 0
  br i1 %cmp654, label %if.then656, label %if.end693

if.then656:                                       ; preds = %land.lhs.true651
  %234 = load i8*, i8** %name.addr, align 4
  %arrayidx657 = getelementptr inbounds i8, i8* %234, i32 3
  %235 = load i8, i8* %arrayidx657, align 1
  %conv658 = sext i8 %235 to i32
  %cmp659 = icmp eq i32 %conv658, 100
  br i1 %cmp659, label %if.then661, label %if.end662

if.then661:                                       ; preds = %if.then656
  store i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.10, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.end662:                                        ; preds = %if.then656
  %236 = load i8*, i8** %name.addr, align 4
  %arrayidx663 = getelementptr inbounds i8, i8* %236, i32 3
  %237 = load i8, i8* %arrayidx663, align 1
  %conv664 = sext i8 %237 to i32
  %cmp665 = icmp eq i32 %conv664, 105
  br i1 %cmp665, label %if.then667, label %if.end668

if.then667:                                       ; preds = %if.end662
  store i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.11, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.end668:                                        ; preds = %if.end662
  %238 = load i8*, i8** %name.addr, align 4
  %arrayidx669 = getelementptr inbounds i8, i8* %238, i32 3
  %239 = load i8, i8* %arrayidx669, align 1
  %conv670 = sext i8 %239 to i32
  %cmp671 = icmp eq i32 %conv670, 111
  br i1 %cmp671, label %if.then673, label %if.end674

if.then673:                                       ; preds = %if.end668
  store i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.12, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.end674:                                        ; preds = %if.end668
  %240 = load i8*, i8** %name.addr, align 4
  %arrayidx675 = getelementptr inbounds i8, i8* %240, i32 3
  %241 = load i8, i8* %arrayidx675, align 1
  %conv676 = sext i8 %241 to i32
  %cmp677 = icmp eq i32 %conv676, 117
  br i1 %cmp677, label %if.then679, label %if.end680

if.then679:                                       ; preds = %if.end674
  store i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.13, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.end680:                                        ; preds = %if.end674
  %242 = load i8*, i8** %name.addr, align 4
  %arrayidx681 = getelementptr inbounds i8, i8* %242, i32 3
  %243 = load i8, i8* %arrayidx681, align 1
  %conv682 = sext i8 %243 to i32
  %cmp683 = icmp eq i32 %conv682, 120
  br i1 %cmp683, label %if.then685, label %if.end686

if.then685:                                       ; preds = %if.end680
  store i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.14, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.end686:                                        ; preds = %if.end680
  %244 = load i8*, i8** %name.addr, align 4
  %arrayidx687 = getelementptr inbounds i8, i8* %244, i32 3
  %245 = load i8, i8* %arrayidx687, align 1
  %conv688 = sext i8 %245 to i32
  %cmp689 = icmp eq i32 %conv688, 88
  br i1 %cmp689, label %if.then691, label %if.end692

if.then691:                                       ; preds = %if.end686
  store i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.15, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.end692:                                        ; preds = %if.end686
  call void @abort() #4
  unreachable

if.end693:                                        ; preds = %land.lhs.true651, %land.lhs.true646, %if.end641
  br label %if.end694

if.end694:                                        ; preds = %if.end693, %land.lhs.true485, %land.lhs.true480, %land.lhs.true475, %if.end470
  %246 = load i8*, i8** %name.addr, align 4
  %arrayidx695 = getelementptr inbounds i8, i8* %246, i32 4
  %247 = load i8, i8* %arrayidx695, align 1
  %conv696 = sext i8 %247 to i32
  %cmp697 = icmp eq i32 %conv696, 77
  br i1 %cmp697, label %land.lhs.true699, label %if.end751

land.lhs.true699:                                 ; preds = %if.end694
  %248 = load i8*, i8** %name.addr, align 4
  %arrayidx700 = getelementptr inbounds i8, i8* %248, i32 5
  %249 = load i8, i8* %arrayidx700, align 1
  %conv701 = sext i8 %249 to i32
  %cmp702 = icmp eq i32 %conv701, 65
  br i1 %cmp702, label %land.lhs.true704, label %if.end751

land.lhs.true704:                                 ; preds = %land.lhs.true699
  %250 = load i8*, i8** %name.addr, align 4
  %arrayidx705 = getelementptr inbounds i8, i8* %250, i32 6
  %251 = load i8, i8* %arrayidx705, align 1
  %conv706 = sext i8 %251 to i32
  %cmp707 = icmp eq i32 %conv706, 88
  br i1 %cmp707, label %land.lhs.true709, label %if.end751

land.lhs.true709:                                 ; preds = %land.lhs.true704
  %252 = load i8*, i8** %name.addr, align 4
  %arrayidx710 = getelementptr inbounds i8, i8* %252, i32 7
  %253 = load i8, i8* %arrayidx710, align 1
  %conv711 = sext i8 %253 to i32
  %cmp712 = icmp eq i32 %conv711, 0
  br i1 %cmp712, label %if.then714, label %if.end751

if.then714:                                       ; preds = %land.lhs.true709
  %254 = load i8*, i8** %name.addr, align 4
  %arrayidx715 = getelementptr inbounds i8, i8* %254, i32 3
  %255 = load i8, i8* %arrayidx715, align 1
  %conv716 = sext i8 %255 to i32
  %cmp717 = icmp eq i32 %conv716, 100
  br i1 %cmp717, label %if.then719, label %if.end720

if.then719:                                       ; preds = %if.then714
  store i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.10, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.end720:                                        ; preds = %if.then714
  %256 = load i8*, i8** %name.addr, align 4
  %arrayidx721 = getelementptr inbounds i8, i8* %256, i32 3
  %257 = load i8, i8* %arrayidx721, align 1
  %conv722 = sext i8 %257 to i32
  %cmp723 = icmp eq i32 %conv722, 105
  br i1 %cmp723, label %if.then725, label %if.end726

if.then725:                                       ; preds = %if.end720
  store i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.11, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.end726:                                        ; preds = %if.end720
  %258 = load i8*, i8** %name.addr, align 4
  %arrayidx727 = getelementptr inbounds i8, i8* %258, i32 3
  %259 = load i8, i8* %arrayidx727, align 1
  %conv728 = sext i8 %259 to i32
  %cmp729 = icmp eq i32 %conv728, 111
  br i1 %cmp729, label %if.then731, label %if.end732

if.then731:                                       ; preds = %if.end726
  store i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.12, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.end732:                                        ; preds = %if.end726
  %260 = load i8*, i8** %name.addr, align 4
  %arrayidx733 = getelementptr inbounds i8, i8* %260, i32 3
  %261 = load i8, i8* %arrayidx733, align 1
  %conv734 = sext i8 %261 to i32
  %cmp735 = icmp eq i32 %conv734, 117
  br i1 %cmp735, label %if.then737, label %if.end738

if.then737:                                       ; preds = %if.end732
  store i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.13, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.end738:                                        ; preds = %if.end732
  %262 = load i8*, i8** %name.addr, align 4
  %arrayidx739 = getelementptr inbounds i8, i8* %262, i32 3
  %263 = load i8, i8* %arrayidx739, align 1
  %conv740 = sext i8 %263 to i32
  %cmp741 = icmp eq i32 %conv740, 120
  br i1 %cmp741, label %if.then743, label %if.end744

if.then743:                                       ; preds = %if.end738
  store i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.14, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.end744:                                        ; preds = %if.end738
  %264 = load i8*, i8** %name.addr, align 4
  %arrayidx745 = getelementptr inbounds i8, i8* %264, i32 3
  %265 = load i8, i8* %arrayidx745, align 1
  %conv746 = sext i8 %265 to i32
  %cmp747 = icmp eq i32 %conv746, 88
  br i1 %cmp747, label %if.then749, label %if.end750

if.then749:                                       ; preds = %if.end744
  store i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.15, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.end750:                                        ; preds = %if.end744
  call void @abort() #4
  unreachable

if.end751:                                        ; preds = %land.lhs.true709, %land.lhs.true704, %land.lhs.true699, %if.end694
  %266 = load i8*, i8** %name.addr, align 4
  %arrayidx752 = getelementptr inbounds i8, i8* %266, i32 4
  %267 = load i8, i8* %arrayidx752, align 1
  %conv753 = sext i8 %267 to i32
  %cmp754 = icmp eq i32 %conv753, 80
  br i1 %cmp754, label %land.lhs.true756, label %if.end808

land.lhs.true756:                                 ; preds = %if.end751
  %268 = load i8*, i8** %name.addr, align 4
  %arrayidx757 = getelementptr inbounds i8, i8* %268, i32 5
  %269 = load i8, i8* %arrayidx757, align 1
  %conv758 = sext i8 %269 to i32
  %cmp759 = icmp eq i32 %conv758, 84
  br i1 %cmp759, label %land.lhs.true761, label %if.end808

land.lhs.true761:                                 ; preds = %land.lhs.true756
  %270 = load i8*, i8** %name.addr, align 4
  %arrayidx762 = getelementptr inbounds i8, i8* %270, i32 6
  %271 = load i8, i8* %arrayidx762, align 1
  %conv763 = sext i8 %271 to i32
  %cmp764 = icmp eq i32 %conv763, 82
  br i1 %cmp764, label %land.lhs.true766, label %if.end808

land.lhs.true766:                                 ; preds = %land.lhs.true761
  %272 = load i8*, i8** %name.addr, align 4
  %arrayidx767 = getelementptr inbounds i8, i8* %272, i32 7
  %273 = load i8, i8* %arrayidx767, align 1
  %conv768 = sext i8 %273 to i32
  %cmp769 = icmp eq i32 %conv768, 0
  br i1 %cmp769, label %if.then771, label %if.end808

if.then771:                                       ; preds = %land.lhs.true766
  %274 = load i8*, i8** %name.addr, align 4
  %arrayidx772 = getelementptr inbounds i8, i8* %274, i32 3
  %275 = load i8, i8* %arrayidx772, align 1
  %conv773 = sext i8 %275 to i32
  %cmp774 = icmp eq i32 %conv773, 100
  br i1 %cmp774, label %if.then776, label %if.end777

if.then776:                                       ; preds = %if.then771
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.end777:                                        ; preds = %if.then771
  %276 = load i8*, i8** %name.addr, align 4
  %arrayidx778 = getelementptr inbounds i8, i8* %276, i32 3
  %277 = load i8, i8* %arrayidx778, align 1
  %conv779 = sext i8 %277 to i32
  %cmp780 = icmp eq i32 %conv779, 105
  br i1 %cmp780, label %if.then782, label %if.end783

if.then782:                                       ; preds = %if.end777
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.5, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.end783:                                        ; preds = %if.end777
  %278 = load i8*, i8** %name.addr, align 4
  %arrayidx784 = getelementptr inbounds i8, i8* %278, i32 3
  %279 = load i8, i8* %arrayidx784, align 1
  %conv785 = sext i8 %279 to i32
  %cmp786 = icmp eq i32 %conv785, 111
  br i1 %cmp786, label %if.then788, label %if.end789

if.then788:                                       ; preds = %if.end783
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.6, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.end789:                                        ; preds = %if.end783
  %280 = load i8*, i8** %name.addr, align 4
  %arrayidx790 = getelementptr inbounds i8, i8* %280, i32 3
  %281 = load i8, i8* %arrayidx790, align 1
  %conv791 = sext i8 %281 to i32
  %cmp792 = icmp eq i32 %conv791, 117
  br i1 %cmp792, label %if.then794, label %if.end795

if.then794:                                       ; preds = %if.end789
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.end795:                                        ; preds = %if.end789
  %282 = load i8*, i8** %name.addr, align 4
  %arrayidx796 = getelementptr inbounds i8, i8* %282, i32 3
  %283 = load i8, i8* %arrayidx796, align 1
  %conv797 = sext i8 %283 to i32
  %cmp798 = icmp eq i32 %conv797, 120
  br i1 %cmp798, label %if.then800, label %if.end801

if.then800:                                       ; preds = %if.end795
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.8, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.end801:                                        ; preds = %if.end795
  %284 = load i8*, i8** %name.addr, align 4
  %arrayidx802 = getelementptr inbounds i8, i8* %284, i32 3
  %285 = load i8, i8* %arrayidx802, align 1
  %conv803 = sext i8 %285 to i32
  %cmp804 = icmp eq i32 %conv803, 88
  br i1 %cmp804, label %if.then806, label %if.end807

if.then806:                                       ; preds = %if.end801
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.end807:                                        ; preds = %if.end801
  call void @abort() #4
  unreachable

if.end808:                                        ; preds = %land.lhs.true766, %land.lhs.true761, %land.lhs.true756, %if.end751
  br label %if.end809

if.end809:                                        ; preds = %if.end808, %lor.lhs.false34
  br label %if.end810

if.end810:                                        ; preds = %if.end809, %land.lhs.true6, %land.lhs.true, %entry
  store i8* null, i8** %retval, align 4
  br label %return

return:                                           ; preds = %if.end810, %if.then806, %if.then800, %if.then794, %if.then788, %if.then782, %if.then776, %if.then749, %if.then743, %if.then737, %if.then731, %if.then725, %if.then719, %if.then691, %if.then685, %if.then679, %if.then673, %if.then667, %if.then661, %if.then639, %if.then633, %if.then627, %if.then621, %if.then615, %if.then609, %if.then587, %if.then581, %if.then575, %if.then569, %if.then563, %if.then557, %if.then535, %if.then529, %if.then523, %if.then517, %if.then511, %if.then505, %if.then467, %if.then461, %if.then455, %if.then449, %if.then443, %if.then437, %if.then415, %if.then409, %if.then403, %if.then397, %if.then391, %if.then385, %if.then363, %if.then357, %if.then351, %if.then345, %if.then339, %if.then333, %if.then311, %if.then305, %if.then299, %if.then293, %if.then287, %if.then281, %if.then239, %if.then233, %if.then227, %if.then221, %if.then215, %if.then209, %if.then187, %if.then181, %if.then175, %if.then169, %if.then163, %if.then157, %if.then135, %if.then129, %if.then123, %if.then117, %if.then111, %if.then105, %if.then83, %if.then77, %if.then71, %if.then65, %if.then59, %if.then54
  %286 = load i8*, i8** %retval, align 4
  ret i8* %286
}

declare i32 @strlen(i8*) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* nocapture writeonly, i8* nocapture readonly, i32, i32, i1) #2

; Function Attrs: noinline nounwind
define internal i32 @hash_string(i8* %str_param) #0 {
entry:
  %str_param.addr = alloca i8*, align 4
  %hval = alloca i32, align 4
  %g = alloca i32, align 4
  %str = alloca i8*, align 4
  store i8* %str_param, i8** %str_param.addr, align 4
  %0 = load i8*, i8** %str_param.addr, align 4
  store i8* %0, i8** %str, align 4
  store i32 0, i32* %hval, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end, %entry
  %1 = load i8*, i8** %str, align 4
  %2 = load i8, i8* %1, align 1
  %conv = sext i8 %2 to i32
  %cmp = icmp ne i32 %conv, 0
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %3 = load i32, i32* %hval, align 4
  %shl = shl i32 %3, 4
  store i32 %shl, i32* %hval, align 4
  %4 = load i8*, i8** %str, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %4, i32 1
  store i8* %incdec.ptr, i8** %str, align 4
  %5 = load i8, i8* %4, align 1
  %conv2 = sext i8 %5 to i32
  %6 = load i32, i32* %hval, align 4
  %add = add i32 %6, %conv2
  store i32 %add, i32* %hval, align 4
  %7 = load i32, i32* %hval, align 4
  %and = and i32 %7, -268435456
  store i32 %and, i32* %g, align 4
  %8 = load i32, i32* %g, align 4
  %cmp3 = icmp ne i32 %8, 0
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %while.body
  %9 = load i32, i32* %g, align 4
  %shr = lshr i32 %9, 24
  %10 = load i32, i32* %hval, align 4
  %xor = xor i32 %10, %shr
  store i32 %xor, i32* %hval, align 4
  %11 = load i32, i32* %g, align 4
  %12 = load i32, i32* %hval, align 4
  %xor5 = xor i32 %12, %11
  store i32 %xor5, i32* %hval, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %while.body
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %13 = load i32, i32* %hval, align 4
  ret i32 %13
}

declare void @libintl_gettext_extract_plural(i8*, %struct.expression**, i32*) #1

; Function Attrs: noreturn
declare void @abort() #3

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }
attributes #3 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
