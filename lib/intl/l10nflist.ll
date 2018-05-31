; ModuleID = 'l10nflist.c'
source_filename = "l10nflist.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.loaded_l10nfile = type { i8*, i32, i8*, %struct.loaded_l10nfile*, [1 x %struct.loaded_l10nfile*] }

@.str = private unnamed_addr constant [4 x i8] c"iso\00", align 1

; Function Attrs: noinline nounwind
define %struct.loaded_l10nfile* @_nl_make_l10nflist(%struct.loaded_l10nfile** %l10nfile_list, i8* %dirlist, i32 %dirlist_len, i32 %mask, i8* %language, i8* %territory, i8* %codeset, i8* %normalized_codeset, i8* %modifier, i8* %special, i8* %sponsor, i8* %revision, i8* %filename, i32 %do_allocate) #0 {
entry:
  %retval = alloca %struct.loaded_l10nfile*, align 4
  %l10nfile_list.addr = alloca %struct.loaded_l10nfile**, align 4
  %dirlist.addr = alloca i8*, align 4
  %dirlist_len.addr = alloca i32, align 4
  %mask.addr = alloca i32, align 4
  %language.addr = alloca i8*, align 4
  %territory.addr = alloca i8*, align 4
  %codeset.addr = alloca i8*, align 4
  %normalized_codeset.addr = alloca i8*, align 4
  %modifier.addr = alloca i8*, align 4
  %special.addr = alloca i8*, align 4
  %sponsor.addr = alloca i8*, align 4
  %revision.addr = alloca i8*, align 4
  %filename.addr = alloca i8*, align 4
  %do_allocate.addr = alloca i32, align 4
  %abs_filename = alloca i8*, align 4
  %lastp = alloca %struct.loaded_l10nfile**, align 4
  %retval1 = alloca %struct.loaded_l10nfile*, align 4
  %cp = alloca i8*, align 4
  %dirlist_count = alloca i32, align 4
  %entries = alloca i32, align 4
  %cnt = alloca i32, align 4
  %compare = alloca i32, align 4
  %dir = alloca i8*, align 4
  store %struct.loaded_l10nfile** %l10nfile_list, %struct.loaded_l10nfile*** %l10nfile_list.addr, align 4
  store i8* %dirlist, i8** %dirlist.addr, align 4
  store i32 %dirlist_len, i32* %dirlist_len.addr, align 4
  store i32 %mask, i32* %mask.addr, align 4
  store i8* %language, i8** %language.addr, align 4
  store i8* %territory, i8** %territory.addr, align 4
  store i8* %codeset, i8** %codeset.addr, align 4
  store i8* %normalized_codeset, i8** %normalized_codeset.addr, align 4
  store i8* %modifier, i8** %modifier.addr, align 4
  store i8* %special, i8** %special.addr, align 4
  store i8* %sponsor, i8** %sponsor.addr, align 4
  store i8* %revision, i8** %revision.addr, align 4
  store i8* %filename, i8** %filename.addr, align 4
  store i32 %do_allocate, i32* %do_allocate.addr, align 4
  %0 = load i8*, i8** %language.addr, align 4
  %arrayidx = getelementptr inbounds i8, i8* %0, i32 0
  %1 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %1 to i32
  %cmp = icmp eq i32 %conv, 47
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, i32* %dirlist_len.addr, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %2 = load i32, i32* %dirlist_len.addr, align 4
  %3 = load i8*, i8** %language.addr, align 4
  %call = call i32 @strlen(i8* %3)
  %add = add i32 %2, %call
  %4 = load i32, i32* %mask.addr, align 4
  %and = and i32 %4, 32
  %cmp3 = icmp ne i32 %and, 0
  br i1 %cmp3, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end
  %5 = load i8*, i8** %territory.addr, align 4
  %call5 = call i32 @strlen(i8* %5)
  %add6 = add i32 %call5, 1
  br label %cond.end

cond.false:                                       ; preds = %if.end
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %add6, %cond.true ], [ 0, %cond.false ]
  %add7 = add i32 %add, %cond
  %6 = load i32, i32* %mask.addr, align 4
  %and8 = and i32 %6, 16
  %cmp9 = icmp ne i32 %and8, 0
  br i1 %cmp9, label %cond.true11, label %cond.false14

cond.true11:                                      ; preds = %cond.end
  %7 = load i8*, i8** %codeset.addr, align 4
  %call12 = call i32 @strlen(i8* %7)
  %add13 = add i32 %call12, 1
  br label %cond.end15

cond.false14:                                     ; preds = %cond.end
  br label %cond.end15

cond.end15:                                       ; preds = %cond.false14, %cond.true11
  %cond16 = phi i32 [ %add13, %cond.true11 ], [ 0, %cond.false14 ]
  %add17 = add i32 %add7, %cond16
  %8 = load i32, i32* %mask.addr, align 4
  %and18 = and i32 %8, 8
  %cmp19 = icmp ne i32 %and18, 0
  br i1 %cmp19, label %cond.true21, label %cond.false24

cond.true21:                                      ; preds = %cond.end15
  %9 = load i8*, i8** %normalized_codeset.addr, align 4
  %call22 = call i32 @strlen(i8* %9)
  %add23 = add i32 %call22, 1
  br label %cond.end25

cond.false24:                                     ; preds = %cond.end15
  br label %cond.end25

cond.end25:                                       ; preds = %cond.false24, %cond.true21
  %cond26 = phi i32 [ %add23, %cond.true21 ], [ 0, %cond.false24 ]
  %add27 = add i32 %add17, %cond26
  %10 = load i32, i32* %mask.addr, align 4
  %and28 = and i32 %10, 128
  %cmp29 = icmp ne i32 %and28, 0
  br i1 %cmp29, label %cond.true34, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %cond.end25
  %11 = load i32, i32* %mask.addr, align 4
  %and31 = and i32 %11, 64
  %cmp32 = icmp ne i32 %and31, 0
  br i1 %cmp32, label %cond.true34, label %cond.false37

cond.true34:                                      ; preds = %lor.lhs.false, %cond.end25
  %12 = load i8*, i8** %modifier.addr, align 4
  %call35 = call i32 @strlen(i8* %12)
  %add36 = add i32 %call35, 1
  br label %cond.end38

cond.false37:                                     ; preds = %lor.lhs.false
  br label %cond.end38

cond.end38:                                       ; preds = %cond.false37, %cond.true34
  %cond39 = phi i32 [ %add36, %cond.true34 ], [ 0, %cond.false37 ]
  %add40 = add i32 %add27, %cond39
  %13 = load i32, i32* %mask.addr, align 4
  %and41 = and i32 %13, 4
  %cmp42 = icmp ne i32 %and41, 0
  br i1 %cmp42, label %cond.true44, label %cond.false47

cond.true44:                                      ; preds = %cond.end38
  %14 = load i8*, i8** %special.addr, align 4
  %call45 = call i32 @strlen(i8* %14)
  %add46 = add i32 %call45, 1
  br label %cond.end48

cond.false47:                                     ; preds = %cond.end38
  br label %cond.end48

cond.end48:                                       ; preds = %cond.false47, %cond.true44
  %cond49 = phi i32 [ %add46, %cond.true44 ], [ 0, %cond.false47 ]
  %add50 = add i32 %add40, %cond49
  %15 = load i32, i32* %mask.addr, align 4
  %and51 = and i32 %15, 2
  %cmp52 = icmp ne i32 %and51, 0
  br i1 %cmp52, label %cond.true58, label %lor.lhs.false54

lor.lhs.false54:                                  ; preds = %cond.end48
  %16 = load i32, i32* %mask.addr, align 4
  %and55 = and i32 %16, 1
  %cmp56 = icmp ne i32 %and55, 0
  br i1 %cmp56, label %cond.true58, label %cond.false78

cond.true58:                                      ; preds = %lor.lhs.false54, %cond.end48
  %17 = load i32, i32* %mask.addr, align 4
  %and59 = and i32 %17, 2
  %cmp60 = icmp ne i32 %and59, 0
  br i1 %cmp60, label %cond.true62, label %cond.false64

cond.true62:                                      ; preds = %cond.true58
  %18 = load i8*, i8** %sponsor.addr, align 4
  %call63 = call i32 @strlen(i8* %18)
  br label %cond.end65

cond.false64:                                     ; preds = %cond.true58
  br label %cond.end65

cond.end65:                                       ; preds = %cond.false64, %cond.true62
  %cond66 = phi i32 [ %call63, %cond.true62 ], [ 0, %cond.false64 ]
  %add67 = add i32 1, %cond66
  %19 = load i32, i32* %mask.addr, align 4
  %and68 = and i32 %19, 1
  %cmp69 = icmp ne i32 %and68, 0
  br i1 %cmp69, label %cond.true71, label %cond.false74

cond.true71:                                      ; preds = %cond.end65
  %20 = load i8*, i8** %revision.addr, align 4
  %call72 = call i32 @strlen(i8* %20)
  %add73 = add i32 %call72, 1
  br label %cond.end75

cond.false74:                                     ; preds = %cond.end65
  br label %cond.end75

cond.end75:                                       ; preds = %cond.false74, %cond.true71
  %cond76 = phi i32 [ %add73, %cond.true71 ], [ 0, %cond.false74 ]
  %add77 = add i32 %add67, %cond76
  br label %cond.end79

cond.false78:                                     ; preds = %lor.lhs.false54
  br label %cond.end79

cond.end79:                                       ; preds = %cond.false78, %cond.end75
  %cond80 = phi i32 [ %add77, %cond.end75 ], [ 0, %cond.false78 ]
  %add81 = add i32 %add50, %cond80
  %add82 = add i32 %add81, 1
  %21 = load i8*, i8** %filename.addr, align 4
  %call83 = call i32 @strlen(i8* %21)
  %add84 = add i32 %add82, %call83
  %add85 = add i32 %add84, 1
  %call86 = call i8* @malloc(i32 %add85)
  store i8* %call86, i8** %abs_filename, align 4
  %22 = load i8*, i8** %abs_filename, align 4
  %cmp87 = icmp eq i8* %22, null
  br i1 %cmp87, label %if.then89, label %if.end90

if.then89:                                        ; preds = %cond.end79
  store %struct.loaded_l10nfile* null, %struct.loaded_l10nfile** %retval, align 4
  br label %return

if.end90:                                         ; preds = %cond.end79
  %23 = load i8*, i8** %abs_filename, align 4
  store i8* %23, i8** %cp, align 4
  %24 = load i32, i32* %dirlist_len.addr, align 4
  %cmp91 = icmp ugt i32 %24, 0
  br i1 %cmp91, label %if.then93, label %if.end95

if.then93:                                        ; preds = %if.end90
  %25 = load i8*, i8** %cp, align 4
  %26 = load i8*, i8** %dirlist.addr, align 4
  %27 = load i32, i32* %dirlist_len.addr, align 4
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %25, i8* %26, i32 %27, i32 1, i1 false)
  %28 = load i8*, i8** %cp, align 4
  %29 = load i32, i32* %dirlist_len.addr, align 4
  call void @argz_stringify__(i8* %28, i32 %29, i32 58)
  %30 = load i32, i32* %dirlist_len.addr, align 4
  %31 = load i8*, i8** %cp, align 4
  %add.ptr = getelementptr inbounds i8, i8* %31, i32 %30
  store i8* %add.ptr, i8** %cp, align 4
  %32 = load i8*, i8** %cp, align 4
  %arrayidx94 = getelementptr inbounds i8, i8* %32, i32 -1
  store i8 47, i8* %arrayidx94, align 1
  br label %if.end95

if.end95:                                         ; preds = %if.then93, %if.end90
  %33 = load i8*, i8** %cp, align 4
  %34 = load i8*, i8** %language.addr, align 4
  %call96 = call i8* @stpcpy(i8* %33, i8* %34)
  store i8* %call96, i8** %cp, align 4
  %35 = load i32, i32* %mask.addr, align 4
  %and97 = and i32 %35, 32
  %cmp98 = icmp ne i32 %and97, 0
  br i1 %cmp98, label %if.then100, label %if.end102

if.then100:                                       ; preds = %if.end95
  %36 = load i8*, i8** %cp, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %36, i32 1
  store i8* %incdec.ptr, i8** %cp, align 4
  store i8 95, i8* %36, align 1
  %37 = load i8*, i8** %cp, align 4
  %38 = load i8*, i8** %territory.addr, align 4
  %call101 = call i8* @stpcpy(i8* %37, i8* %38)
  store i8* %call101, i8** %cp, align 4
  br label %if.end102

if.end102:                                        ; preds = %if.then100, %if.end95
  %39 = load i32, i32* %mask.addr, align 4
  %and103 = and i32 %39, 16
  %cmp104 = icmp ne i32 %and103, 0
  br i1 %cmp104, label %if.then106, label %if.end109

if.then106:                                       ; preds = %if.end102
  %40 = load i8*, i8** %cp, align 4
  %incdec.ptr107 = getelementptr inbounds i8, i8* %40, i32 1
  store i8* %incdec.ptr107, i8** %cp, align 4
  store i8 46, i8* %40, align 1
  %41 = load i8*, i8** %cp, align 4
  %42 = load i8*, i8** %codeset.addr, align 4
  %call108 = call i8* @stpcpy(i8* %41, i8* %42)
  store i8* %call108, i8** %cp, align 4
  br label %if.end109

if.end109:                                        ; preds = %if.then106, %if.end102
  %43 = load i32, i32* %mask.addr, align 4
  %and110 = and i32 %43, 8
  %cmp111 = icmp ne i32 %and110, 0
  br i1 %cmp111, label %if.then113, label %if.end116

if.then113:                                       ; preds = %if.end109
  %44 = load i8*, i8** %cp, align 4
  %incdec.ptr114 = getelementptr inbounds i8, i8* %44, i32 1
  store i8* %incdec.ptr114, i8** %cp, align 4
  store i8 46, i8* %44, align 1
  %45 = load i8*, i8** %cp, align 4
  %46 = load i8*, i8** %normalized_codeset.addr, align 4
  %call115 = call i8* @stpcpy(i8* %45, i8* %46)
  store i8* %call115, i8** %cp, align 4
  br label %if.end116

if.end116:                                        ; preds = %if.then113, %if.end109
  %47 = load i32, i32* %mask.addr, align 4
  %and117 = and i32 %47, 192
  %cmp118 = icmp ne i32 %and117, 0
  br i1 %cmp118, label %if.then120, label %if.end128

if.then120:                                       ; preds = %if.end116
  %48 = load i32, i32* %mask.addr, align 4
  %and121 = and i32 %48, 64
  %cmp122 = icmp ne i32 %and121, 0
  %cond124 = select i1 %cmp122, i32 43, i32 64
  %conv125 = trunc i32 %cond124 to i8
  %49 = load i8*, i8** %cp, align 4
  %incdec.ptr126 = getelementptr inbounds i8, i8* %49, i32 1
  store i8* %incdec.ptr126, i8** %cp, align 4
  store i8 %conv125, i8* %49, align 1
  %50 = load i8*, i8** %cp, align 4
  %51 = load i8*, i8** %modifier.addr, align 4
  %call127 = call i8* @stpcpy(i8* %50, i8* %51)
  store i8* %call127, i8** %cp, align 4
  br label %if.end128

if.end128:                                        ; preds = %if.then120, %if.end116
  %52 = load i32, i32* %mask.addr, align 4
  %and129 = and i32 %52, 4
  %cmp130 = icmp ne i32 %and129, 0
  br i1 %cmp130, label %if.then132, label %if.end135

if.then132:                                       ; preds = %if.end128
  %53 = load i8*, i8** %cp, align 4
  %incdec.ptr133 = getelementptr inbounds i8, i8* %53, i32 1
  store i8* %incdec.ptr133, i8** %cp, align 4
  store i8 43, i8* %53, align 1
  %54 = load i8*, i8** %cp, align 4
  %55 = load i8*, i8** %special.addr, align 4
  %call134 = call i8* @stpcpy(i8* %54, i8* %55)
  store i8* %call134, i8** %cp, align 4
  br label %if.end135

if.end135:                                        ; preds = %if.then132, %if.end128
  %56 = load i32, i32* %mask.addr, align 4
  %and136 = and i32 %56, 3
  %cmp137 = icmp ne i32 %and136, 0
  br i1 %cmp137, label %if.then139, label %if.end154

if.then139:                                       ; preds = %if.end135
  %57 = load i8*, i8** %cp, align 4
  %incdec.ptr140 = getelementptr inbounds i8, i8* %57, i32 1
  store i8* %incdec.ptr140, i8** %cp, align 4
  store i8 44, i8* %57, align 1
  %58 = load i32, i32* %mask.addr, align 4
  %and141 = and i32 %58, 2
  %cmp142 = icmp ne i32 %and141, 0
  br i1 %cmp142, label %if.then144, label %if.end146

if.then144:                                       ; preds = %if.then139
  %59 = load i8*, i8** %cp, align 4
  %60 = load i8*, i8** %sponsor.addr, align 4
  %call145 = call i8* @stpcpy(i8* %59, i8* %60)
  store i8* %call145, i8** %cp, align 4
  br label %if.end146

if.end146:                                        ; preds = %if.then144, %if.then139
  %61 = load i32, i32* %mask.addr, align 4
  %and147 = and i32 %61, 1
  %cmp148 = icmp ne i32 %and147, 0
  br i1 %cmp148, label %if.then150, label %if.end153

if.then150:                                       ; preds = %if.end146
  %62 = load i8*, i8** %cp, align 4
  %incdec.ptr151 = getelementptr inbounds i8, i8* %62, i32 1
  store i8* %incdec.ptr151, i8** %cp, align 4
  store i8 95, i8* %62, align 1
  %63 = load i8*, i8** %cp, align 4
  %64 = load i8*, i8** %revision.addr, align 4
  %call152 = call i8* @stpcpy(i8* %63, i8* %64)
  store i8* %call152, i8** %cp, align 4
  br label %if.end153

if.end153:                                        ; preds = %if.then150, %if.end146
  br label %if.end154

if.end154:                                        ; preds = %if.end153, %if.end135
  %65 = load i8*, i8** %cp, align 4
  %incdec.ptr155 = getelementptr inbounds i8, i8* %65, i32 1
  store i8* %incdec.ptr155, i8** %cp, align 4
  store i8 47, i8* %65, align 1
  %66 = load i8*, i8** %cp, align 4
  %67 = load i8*, i8** %filename.addr, align 4
  %call156 = call i8* @stpcpy(i8* %66, i8* %67)
  %68 = load %struct.loaded_l10nfile**, %struct.loaded_l10nfile*** %l10nfile_list.addr, align 4
  store %struct.loaded_l10nfile** %68, %struct.loaded_l10nfile*** %lastp, align 4
  %69 = load %struct.loaded_l10nfile**, %struct.loaded_l10nfile*** %l10nfile_list.addr, align 4
  %70 = load %struct.loaded_l10nfile*, %struct.loaded_l10nfile** %69, align 4
  store %struct.loaded_l10nfile* %70, %struct.loaded_l10nfile** %retval1, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end154
  %71 = load %struct.loaded_l10nfile*, %struct.loaded_l10nfile** %retval1, align 4
  %cmp157 = icmp ne %struct.loaded_l10nfile* %71, null
  br i1 %cmp157, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %72 = load %struct.loaded_l10nfile*, %struct.loaded_l10nfile** %retval1, align 4
  %filename159 = getelementptr inbounds %struct.loaded_l10nfile, %struct.loaded_l10nfile* %72, i32 0, i32 0
  %73 = load i8*, i8** %filename159, align 4
  %cmp160 = icmp ne i8* %73, null
  br i1 %cmp160, label %if.then162, label %if.end173

if.then162:                                       ; preds = %for.body
  %74 = load %struct.loaded_l10nfile*, %struct.loaded_l10nfile** %retval1, align 4
  %filename163 = getelementptr inbounds %struct.loaded_l10nfile, %struct.loaded_l10nfile* %74, i32 0, i32 0
  %75 = load i8*, i8** %filename163, align 4
  %76 = load i8*, i8** %abs_filename, align 4
  %call164 = call i32 @strcmp(i8* %75, i8* %76)
  store i32 %call164, i32* %compare, align 4
  %77 = load i32, i32* %compare, align 4
  %cmp165 = icmp eq i32 %77, 0
  br i1 %cmp165, label %if.then167, label %if.end168

if.then167:                                       ; preds = %if.then162
  br label %for.end

if.end168:                                        ; preds = %if.then162
  %78 = load i32, i32* %compare, align 4
  %cmp169 = icmp slt i32 %78, 0
  br i1 %cmp169, label %if.then171, label %if.end172

if.then171:                                       ; preds = %if.end168
  store %struct.loaded_l10nfile* null, %struct.loaded_l10nfile** %retval1, align 4
  br label %for.end

if.end172:                                        ; preds = %if.end168
  %79 = load %struct.loaded_l10nfile*, %struct.loaded_l10nfile** %retval1, align 4
  %next = getelementptr inbounds %struct.loaded_l10nfile, %struct.loaded_l10nfile* %79, i32 0, i32 3
  store %struct.loaded_l10nfile** %next, %struct.loaded_l10nfile*** %lastp, align 4
  br label %if.end173

if.end173:                                        ; preds = %if.end172, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end173
  %80 = load %struct.loaded_l10nfile*, %struct.loaded_l10nfile** %retval1, align 4
  %next174 = getelementptr inbounds %struct.loaded_l10nfile, %struct.loaded_l10nfile* %80, i32 0, i32 3
  %81 = load %struct.loaded_l10nfile*, %struct.loaded_l10nfile** %next174, align 4
  store %struct.loaded_l10nfile* %81, %struct.loaded_l10nfile** %retval1, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then171, %if.then167, %for.cond
  %82 = load %struct.loaded_l10nfile*, %struct.loaded_l10nfile** %retval1, align 4
  %cmp175 = icmp ne %struct.loaded_l10nfile* %82, null
  br i1 %cmp175, label %if.then180, label %lor.lhs.false177

lor.lhs.false177:                                 ; preds = %for.end
  %83 = load i32, i32* %do_allocate.addr, align 4
  %cmp178 = icmp eq i32 %83, 0
  br i1 %cmp178, label %if.then180, label %if.end181

if.then180:                                       ; preds = %lor.lhs.false177, %for.end
  %84 = load i8*, i8** %abs_filename, align 4
  call void @free(i8* %84)
  %85 = load %struct.loaded_l10nfile*, %struct.loaded_l10nfile** %retval1, align 4
  store %struct.loaded_l10nfile* %85, %struct.loaded_l10nfile** %retval, align 4
  br label %return

if.end181:                                        ; preds = %lor.lhs.false177
  %86 = load i32, i32* %dirlist_len.addr, align 4
  %cmp182 = icmp ugt i32 %86, 0
  br i1 %cmp182, label %cond.true184, label %cond.false186

cond.true184:                                     ; preds = %if.end181
  %87 = load i8*, i8** %dirlist.addr, align 4
  %88 = load i32, i32* %dirlist_len.addr, align 4
  %call185 = call i32 @argz_count__(i8* %87, i32 %88)
  br label %cond.end187

cond.false186:                                    ; preds = %if.end181
  br label %cond.end187

cond.end187:                                      ; preds = %cond.false186, %cond.true184
  %cond188 = phi i32 [ %call185, %cond.true184 ], [ 1, %cond.false186 ]
  store i32 %cond188, i32* %dirlist_count, align 4
  %89 = load i32, i32* %dirlist_count, align 4
  %90 = load i32, i32* %mask.addr, align 4
  %call189 = call i32 @pop(i32 %90)
  %shl = shl i32 %89, %call189
  %91 = load i32, i32* %dirlist_count, align 4
  %cmp190 = icmp ugt i32 %91, 1
  %cond192 = select i1 %cmp190, i32 1, i32 0
  %add193 = add i32 %shl, %cond192
  %mul = mul i32 %add193, 4
  %add194 = add i32 20, %mul
  %call195 = call i8* @malloc(i32 %add194)
  %92 = bitcast i8* %call195 to %struct.loaded_l10nfile*
  store %struct.loaded_l10nfile* %92, %struct.loaded_l10nfile** %retval1, align 4
  %93 = load %struct.loaded_l10nfile*, %struct.loaded_l10nfile** %retval1, align 4
  %cmp196 = icmp eq %struct.loaded_l10nfile* %93, null
  br i1 %cmp196, label %if.then198, label %if.end199

if.then198:                                       ; preds = %cond.end187
  %94 = load i8*, i8** %abs_filename, align 4
  call void @free(i8* %94)
  store %struct.loaded_l10nfile* null, %struct.loaded_l10nfile** %retval, align 4
  br label %return

if.end199:                                        ; preds = %cond.end187
  %95 = load i8*, i8** %abs_filename, align 4
  %96 = load %struct.loaded_l10nfile*, %struct.loaded_l10nfile** %retval1, align 4
  %filename200 = getelementptr inbounds %struct.loaded_l10nfile, %struct.loaded_l10nfile* %96, i32 0, i32 0
  store i8* %95, i8** %filename200, align 4
  %97 = load i32, i32* %dirlist_count, align 4
  %cmp201 = icmp ugt i32 %97, 1
  br i1 %cmp201, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %if.end199
  %98 = load i32, i32* %mask.addr, align 4
  %and203 = and i32 %98, 16
  %cmp204 = icmp ne i32 %and203, 0
  br i1 %cmp204, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %lor.rhs
  %99 = load i32, i32* %mask.addr, align 4
  %and206 = and i32 %99, 8
  %cmp207 = icmp ne i32 %and206, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %lor.rhs
  %100 = phi i1 [ false, %lor.rhs ], [ %cmp207, %land.rhs ]
  br label %lor.end

lor.end:                                          ; preds = %land.end, %if.end199
  %101 = phi i1 [ true, %if.end199 ], [ %100, %land.end ]
  %lor.ext = zext i1 %101 to i32
  %102 = load %struct.loaded_l10nfile*, %struct.loaded_l10nfile** %retval1, align 4
  %decided = getelementptr inbounds %struct.loaded_l10nfile, %struct.loaded_l10nfile* %102, i32 0, i32 1
  store i32 %lor.ext, i32* %decided, align 4
  %103 = load %struct.loaded_l10nfile*, %struct.loaded_l10nfile** %retval1, align 4
  %data = getelementptr inbounds %struct.loaded_l10nfile, %struct.loaded_l10nfile* %103, i32 0, i32 2
  store i8* null, i8** %data, align 4
  %104 = load %struct.loaded_l10nfile**, %struct.loaded_l10nfile*** %lastp, align 4
  %105 = load %struct.loaded_l10nfile*, %struct.loaded_l10nfile** %104, align 4
  %106 = load %struct.loaded_l10nfile*, %struct.loaded_l10nfile** %retval1, align 4
  %next209 = getelementptr inbounds %struct.loaded_l10nfile, %struct.loaded_l10nfile* %106, i32 0, i32 3
  store %struct.loaded_l10nfile* %105, %struct.loaded_l10nfile** %next209, align 4
  %107 = load %struct.loaded_l10nfile*, %struct.loaded_l10nfile** %retval1, align 4
  %108 = load %struct.loaded_l10nfile**, %struct.loaded_l10nfile*** %lastp, align 4
  store %struct.loaded_l10nfile* %107, %struct.loaded_l10nfile** %108, align 4
  store i32 0, i32* %entries, align 4
  %109 = load i32, i32* %dirlist_count, align 4
  %cmp210 = icmp ugt i32 %109, 1
  br i1 %cmp210, label %cond.true212, label %cond.false213

cond.true212:                                     ; preds = %lor.end
  %110 = load i32, i32* %mask.addr, align 4
  br label %cond.end214

cond.false213:                                    ; preds = %lor.end
  %111 = load i32, i32* %mask.addr, align 4
  %sub = sub nsw i32 %111, 1
  br label %cond.end214

cond.end214:                                      ; preds = %cond.false213, %cond.true212
  %cond215 = phi i32 [ %110, %cond.true212 ], [ %sub, %cond.false213 ]
  store i32 %cond215, i32* %cnt, align 4
  br label %for.cond216

for.cond216:                                      ; preds = %for.inc255, %cond.end214
  %112 = load i32, i32* %cnt, align 4
  %cmp217 = icmp sge i32 %112, 0
  br i1 %cmp217, label %for.body219, label %for.end256

for.body219:                                      ; preds = %for.cond216
  %113 = load i32, i32* %cnt, align 4
  %114 = load i32, i32* %mask.addr, align 4
  %neg = xor i32 %114, -1
  %and220 = and i32 %113, %neg
  %cmp221 = icmp eq i32 %and220, 0
  br i1 %cmp221, label %land.lhs.true, label %if.end254

land.lhs.true:                                    ; preds = %for.body219
  %115 = load i32, i32* %cnt, align 4
  %and223 = and i32 %115, 71
  %cmp224 = icmp eq i32 %and223, 0
  br i1 %cmp224, label %land.lhs.true230, label %lor.lhs.false226

lor.lhs.false226:                                 ; preds = %land.lhs.true
  %116 = load i32, i32* %cnt, align 4
  %and227 = and i32 %116, 152
  %cmp228 = icmp eq i32 %and227, 0
  br i1 %cmp228, label %land.lhs.true230, label %if.end254

land.lhs.true230:                                 ; preds = %lor.lhs.false226, %land.lhs.true
  %117 = load i32, i32* %cnt, align 4
  %and231 = and i32 %117, 16
  %cmp232 = icmp eq i32 %and231, 0
  br i1 %cmp232, label %if.then238, label %lor.lhs.false234

lor.lhs.false234:                                 ; preds = %land.lhs.true230
  %118 = load i32, i32* %cnt, align 4
  %and235 = and i32 %118, 8
  %cmp236 = icmp eq i32 %and235, 0
  br i1 %cmp236, label %if.then238, label %if.end254

if.then238:                                       ; preds = %lor.lhs.false234, %land.lhs.true230
  %119 = load i32, i32* %dirlist_count, align 4
  %cmp239 = icmp ugt i32 %119, 1
  br i1 %cmp239, label %if.then241, label %if.else

if.then241:                                       ; preds = %if.then238
  store i8* null, i8** %dir, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.then241
  %120 = load i8*, i8** %dirlist.addr, align 4
  %121 = load i32, i32* %dirlist_len.addr, align 4
  %122 = load i8*, i8** %dir, align 4
  %call242 = call i8* @argz_next__(i8* %120, i32 %121, i8* %122)
  store i8* %call242, i8** %dir, align 4
  %cmp243 = icmp ne i8* %call242, null
  br i1 %cmp243, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %123 = load %struct.loaded_l10nfile**, %struct.loaded_l10nfile*** %l10nfile_list.addr, align 4
  %124 = load i8*, i8** %dir, align 4
  %125 = load i8*, i8** %dir, align 4
  %call245 = call i32 @strlen(i8* %125)
  %add246 = add i32 %call245, 1
  %126 = load i32, i32* %cnt, align 4
  %127 = load i8*, i8** %language.addr, align 4
  %128 = load i8*, i8** %territory.addr, align 4
  %129 = load i8*, i8** %codeset.addr, align 4
  %130 = load i8*, i8** %normalized_codeset.addr, align 4
  %131 = load i8*, i8** %modifier.addr, align 4
  %132 = load i8*, i8** %special.addr, align 4
  %133 = load i8*, i8** %sponsor.addr, align 4
  %134 = load i8*, i8** %revision.addr, align 4
  %135 = load i8*, i8** %filename.addr, align 4
  %call247 = call %struct.loaded_l10nfile* @_nl_make_l10nflist(%struct.loaded_l10nfile** %123, i8* %124, i32 %add246, i32 %126, i8* %127, i8* %128, i8* %129, i8* %130, i8* %131, i8* %132, i8* %133, i8* %134, i8* %135, i32 1)
  %136 = load %struct.loaded_l10nfile*, %struct.loaded_l10nfile** %retval1, align 4
  %successor = getelementptr inbounds %struct.loaded_l10nfile, %struct.loaded_l10nfile* %136, i32 0, i32 4
  %137 = load i32, i32* %entries, align 4
  %inc = add i32 %137, 1
  store i32 %inc, i32* %entries, align 4
  %arrayidx248 = getelementptr inbounds [1 x %struct.loaded_l10nfile*], [1 x %struct.loaded_l10nfile*]* %successor, i32 0, i32 %137
  store %struct.loaded_l10nfile* %call247, %struct.loaded_l10nfile** %arrayidx248, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  br label %if.end253

if.else:                                          ; preds = %if.then238
  %138 = load %struct.loaded_l10nfile**, %struct.loaded_l10nfile*** %l10nfile_list.addr, align 4
  %139 = load i8*, i8** %dirlist.addr, align 4
  %140 = load i32, i32* %dirlist_len.addr, align 4
  %141 = load i32, i32* %cnt, align 4
  %142 = load i8*, i8** %language.addr, align 4
  %143 = load i8*, i8** %territory.addr, align 4
  %144 = load i8*, i8** %codeset.addr, align 4
  %145 = load i8*, i8** %normalized_codeset.addr, align 4
  %146 = load i8*, i8** %modifier.addr, align 4
  %147 = load i8*, i8** %special.addr, align 4
  %148 = load i8*, i8** %sponsor.addr, align 4
  %149 = load i8*, i8** %revision.addr, align 4
  %150 = load i8*, i8** %filename.addr, align 4
  %call249 = call %struct.loaded_l10nfile* @_nl_make_l10nflist(%struct.loaded_l10nfile** %138, i8* %139, i32 %140, i32 %141, i8* %142, i8* %143, i8* %144, i8* %145, i8* %146, i8* %147, i8* %148, i8* %149, i8* %150, i32 1)
  %151 = load %struct.loaded_l10nfile*, %struct.loaded_l10nfile** %retval1, align 4
  %successor250 = getelementptr inbounds %struct.loaded_l10nfile, %struct.loaded_l10nfile* %151, i32 0, i32 4
  %152 = load i32, i32* %entries, align 4
  %inc251 = add i32 %152, 1
  store i32 %inc251, i32* %entries, align 4
  %arrayidx252 = getelementptr inbounds [1 x %struct.loaded_l10nfile*], [1 x %struct.loaded_l10nfile*]* %successor250, i32 0, i32 %152
  store %struct.loaded_l10nfile* %call249, %struct.loaded_l10nfile** %arrayidx252, align 4
  br label %if.end253

if.end253:                                        ; preds = %if.else, %while.end
  br label %if.end254

if.end254:                                        ; preds = %if.end253, %lor.lhs.false234, %lor.lhs.false226, %for.body219
  br label %for.inc255

for.inc255:                                       ; preds = %if.end254
  %153 = load i32, i32* %cnt, align 4
  %dec = add nsw i32 %153, -1
  store i32 %dec, i32* %cnt, align 4
  br label %for.cond216

for.end256:                                       ; preds = %for.cond216
  %154 = load %struct.loaded_l10nfile*, %struct.loaded_l10nfile** %retval1, align 4
  %successor257 = getelementptr inbounds %struct.loaded_l10nfile, %struct.loaded_l10nfile* %154, i32 0, i32 4
  %155 = load i32, i32* %entries, align 4
  %arrayidx258 = getelementptr inbounds [1 x %struct.loaded_l10nfile*], [1 x %struct.loaded_l10nfile*]* %successor257, i32 0, i32 %155
  store %struct.loaded_l10nfile* null, %struct.loaded_l10nfile** %arrayidx258, align 4
  %156 = load %struct.loaded_l10nfile*, %struct.loaded_l10nfile** %retval1, align 4
  store %struct.loaded_l10nfile* %156, %struct.loaded_l10nfile** %retval, align 4
  br label %return

return:                                           ; preds = %for.end256, %if.then198, %if.then180, %if.then89
  %157 = load %struct.loaded_l10nfile*, %struct.loaded_l10nfile** %retval, align 4
  ret %struct.loaded_l10nfile* %157
}

declare i8* @malloc(i32) #1

declare i32 @strlen(i8*) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* nocapture writeonly, i8* nocapture readonly, i32, i32, i1) #2

; Function Attrs: noinline nounwind
define internal void @argz_stringify__(i8* %argz, i32 %len, i32 %sep) #0 {
entry:
  %argz.addr = alloca i8*, align 4
  %len.addr = alloca i32, align 4
  %sep.addr = alloca i32, align 4
  %part_len = alloca i32, align 4
  store i8* %argz, i8** %argz.addr, align 4
  store i32 %len, i32* %len.addr, align 4
  store i32 %sep, i32* %sep.addr, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end, %entry
  %0 = load i32, i32* %len.addr, align 4
  %cmp = icmp ugt i32 %0, 0
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %1 = load i8*, i8** %argz.addr, align 4
  %call = call i32 @strlen(i8* %1)
  store i32 %call, i32* %part_len, align 4
  %2 = load i32, i32* %part_len, align 4
  %3 = load i8*, i8** %argz.addr, align 4
  %add.ptr = getelementptr inbounds i8, i8* %3, i32 %2
  store i8* %add.ptr, i8** %argz.addr, align 4
  %4 = load i32, i32* %part_len, align 4
  %add = add i32 %4, 1
  %5 = load i32, i32* %len.addr, align 4
  %sub = sub i32 %5, %add
  store i32 %sub, i32* %len.addr, align 4
  %6 = load i32, i32* %len.addr, align 4
  %cmp1 = icmp ugt i32 %6, 0
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %while.body
  %7 = load i32, i32* %sep.addr, align 4
  %conv = trunc i32 %7 to i8
  %8 = load i8*, i8** %argz.addr, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %8, i32 1
  store i8* %incdec.ptr, i8** %argz.addr, align 4
  store i8 %conv, i8* %8, align 1
  br label %if.end

if.end:                                           ; preds = %if.then, %while.body
  br label %while.cond

while.end:                                        ; preds = %while.cond
  ret void
}

declare i8* @stpcpy(i8*, i8*) #1

declare i32 @strcmp(i8*, i8*) #1

declare void @free(i8*) #1

; Function Attrs: noinline nounwind
define internal i32 @argz_count__(i8* %argz, i32 %len) #0 {
entry:
  %argz.addr = alloca i8*, align 4
  %len.addr = alloca i32, align 4
  %count = alloca i32, align 4
  %part_len = alloca i32, align 4
  store i8* %argz, i8** %argz.addr, align 4
  store i32 %len, i32* %len.addr, align 4
  store i32 0, i32* %count, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %0 = load i32, i32* %len.addr, align 4
  %cmp = icmp ugt i32 %0, 0
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %1 = load i8*, i8** %argz.addr, align 4
  %call = call i32 @strlen(i8* %1)
  store i32 %call, i32* %part_len, align 4
  %2 = load i32, i32* %part_len, align 4
  %add = add i32 %2, 1
  %3 = load i8*, i8** %argz.addr, align 4
  %add.ptr = getelementptr inbounds i8, i8* %3, i32 %add
  store i8* %add.ptr, i8** %argz.addr, align 4
  %4 = load i32, i32* %part_len, align 4
  %add1 = add i32 %4, 1
  %5 = load i32, i32* %len.addr, align 4
  %sub = sub i32 %5, %add1
  store i32 %sub, i32* %len.addr, align 4
  %6 = load i32, i32* %count, align 4
  %inc = add i32 %6, 1
  store i32 %inc, i32* %count, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %7 = load i32, i32* %count, align 4
  ret i32 %7
}

; Function Attrs: noinline nounwind
define internal i32 @pop(i32 %x) #0 {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32, i32* %x.addr, align 4
  %and = and i32 %0, -21846
  %shr = ashr i32 %and, 1
  %1 = load i32, i32* %x.addr, align 4
  %and1 = and i32 %1, 21845
  %add = add nsw i32 %shr, %and1
  store i32 %add, i32* %x.addr, align 4
  %2 = load i32, i32* %x.addr, align 4
  %and2 = and i32 %2, -13108
  %shr3 = ashr i32 %and2, 2
  %3 = load i32, i32* %x.addr, align 4
  %and4 = and i32 %3, 13107
  %add5 = add nsw i32 %shr3, %and4
  store i32 %add5, i32* %x.addr, align 4
  %4 = load i32, i32* %x.addr, align 4
  %shr6 = ashr i32 %4, 4
  %5 = load i32, i32* %x.addr, align 4
  %add7 = add nsw i32 %shr6, %5
  %and8 = and i32 %add7, 3855
  store i32 %and8, i32* %x.addr, align 4
  %6 = load i32, i32* %x.addr, align 4
  %shr9 = ashr i32 %6, 8
  %7 = load i32, i32* %x.addr, align 4
  %add10 = add nsw i32 %shr9, %7
  %and11 = and i32 %add10, 255
  store i32 %and11, i32* %x.addr, align 4
  %8 = load i32, i32* %x.addr, align 4
  ret i32 %8
}

; Function Attrs: noinline nounwind
define internal i8* @argz_next__(i8* %argz, i32 %argz_len, i8* %entry1) #0 {
entry:
  %retval = alloca i8*, align 4
  %argz.addr = alloca i8*, align 4
  %argz_len.addr = alloca i32, align 4
  %entry.addr = alloca i8*, align 4
  store i8* %argz, i8** %argz.addr, align 4
  store i32 %argz_len, i32* %argz_len.addr, align 4
  store i8* %entry1, i8** %entry.addr, align 4
  %0 = load i8*, i8** %entry.addr, align 4
  %tobool = icmp ne i8* %0, null
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %entry.addr, align 4
  %2 = load i8*, i8** %argz.addr, align 4
  %3 = load i32, i32* %argz_len.addr, align 4
  %add.ptr = getelementptr inbounds i8, i8* %2, i32 %3
  %cmp = icmp ult i8* %1, %add.ptr
  br i1 %cmp, label %if.then2, label %if.end

if.then2:                                         ; preds = %if.then
  %4 = load i8*, i8** %entry.addr, align 4
  %call = call i8* @strchr(i8* %4, i32 0)
  %add.ptr3 = getelementptr inbounds i8, i8* %call, i32 1
  store i8* %add.ptr3, i8** %entry.addr, align 4
  br label %if.end

if.end:                                           ; preds = %if.then2, %if.then
  %5 = load i8*, i8** %entry.addr, align 4
  %6 = load i8*, i8** %argz.addr, align 4
  %7 = load i32, i32* %argz_len.addr, align 4
  %add.ptr4 = getelementptr inbounds i8, i8* %6, i32 %7
  %cmp5 = icmp uge i8* %5, %add.ptr4
  br i1 %cmp5, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end
  br label %cond.end

cond.false:                                       ; preds = %if.end
  %8 = load i8*, i8** %entry.addr, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ null, %cond.true ], [ %8, %cond.false ]
  store i8* %cond, i8** %retval, align 4
  br label %return

if.else:                                          ; preds = %entry
  %9 = load i32, i32* %argz_len.addr, align 4
  %cmp6 = icmp ugt i32 %9, 0
  br i1 %cmp6, label %if.then7, label %if.else8

if.then7:                                         ; preds = %if.else
  %10 = load i8*, i8** %argz.addr, align 4
  store i8* %10, i8** %retval, align 4
  br label %return

if.else8:                                         ; preds = %if.else
  store i8* null, i8** %retval, align 4
  br label %return

return:                                           ; preds = %if.else8, %if.then7, %cond.end
  %11 = load i8*, i8** %retval, align 4
  ret i8* %11
}

; Function Attrs: noinline nounwind
define i8* @_nl_normalize_codeset(i8* %codeset, i32 %name_len) #0 {
entry:
  %codeset.addr = alloca i8*, align 4
  %name_len.addr = alloca i32, align 4
  %len = alloca i32, align 4
  %only_digit = alloca i32, align 4
  %retval1 = alloca i8*, align 4
  %wp = alloca i8*, align 4
  %cnt = alloca i32, align 4
  store i8* %codeset, i8** %codeset.addr, align 4
  store i32 %name_len, i32* %name_len.addr, align 4
  store i32 0, i32* %len, align 4
  store i32 1, i32* %only_digit, align 4
  store i32 0, i32* %cnt, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %cnt, align 4
  %1 = load i32, i32* %name_len.addr, align 4
  %cmp = icmp ult i32 %0, %1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i8*, i8** %codeset.addr, align 4
  %3 = load i32, i32* %cnt, align 4
  %arrayidx = getelementptr inbounds i8, i8* %2, i32 %3
  %4 = load i8, i8* %arrayidx, align 1
  %conv = zext i8 %4 to i32
  %call = call i32 @isalnum(i32 %conv) #4
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %if.then, label %if.end7

if.then:                                          ; preds = %for.body
  %5 = load i32, i32* %len, align 4
  %inc = add nsw i32 %5, 1
  store i32 %inc, i32* %len, align 4
  %6 = load i8*, i8** %codeset.addr, align 4
  %7 = load i32, i32* %cnt, align 4
  %arrayidx2 = getelementptr inbounds i8, i8* %6, i32 %7
  %8 = load i8, i8* %arrayidx2, align 1
  %conv3 = zext i8 %8 to i32
  %call4 = call i32 @isalpha(i32 %conv3) #4
  %tobool5 = icmp ne i32 %call4, 0
  br i1 %tobool5, label %if.then6, label %if.end

if.then6:                                         ; preds = %if.then
  store i32 0, i32* %only_digit, align 4
  br label %if.end

if.end:                                           ; preds = %if.then6, %if.then
  br label %if.end7

if.end7:                                          ; preds = %if.end, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end7
  %9 = load i32, i32* %cnt, align 4
  %inc8 = add i32 %9, 1
  store i32 %inc8, i32* %cnt, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %10 = load i32, i32* %only_digit, align 4
  %tobool9 = icmp ne i32 %10, 0
  %cond = select i1 %tobool9, i32 3, i32 0
  %11 = load i32, i32* %len, align 4
  %add = add nsw i32 %cond, %11
  %add10 = add nsw i32 %add, 1
  %call11 = call i8* @malloc(i32 %add10)
  store i8* %call11, i8** %retval1, align 4
  %12 = load i8*, i8** %retval1, align 4
  %cmp12 = icmp ne i8* %12, null
  br i1 %cmp12, label %if.then14, label %if.end45

if.then14:                                        ; preds = %for.end
  %13 = load i32, i32* %only_digit, align 4
  %tobool15 = icmp ne i32 %13, 0
  br i1 %tobool15, label %if.then16, label %if.else

if.then16:                                        ; preds = %if.then14
  %14 = load i8*, i8** %retval1, align 4
  %call17 = call i8* @stpcpy(i8* %14, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0))
  store i8* %call17, i8** %wp, align 4
  br label %if.end18

if.else:                                          ; preds = %if.then14
  %15 = load i8*, i8** %retval1, align 4
  store i8* %15, i8** %wp, align 4
  br label %if.end18

if.end18:                                         ; preds = %if.else, %if.then16
  store i32 0, i32* %cnt, align 4
  br label %for.cond19

for.cond19:                                       ; preds = %for.inc42, %if.end18
  %16 = load i32, i32* %cnt, align 4
  %17 = load i32, i32* %name_len.addr, align 4
  %cmp20 = icmp ult i32 %16, %17
  br i1 %cmp20, label %for.body22, label %for.end44

for.body22:                                       ; preds = %for.cond19
  %18 = load i8*, i8** %codeset.addr, align 4
  %19 = load i32, i32* %cnt, align 4
  %arrayidx23 = getelementptr inbounds i8, i8* %18, i32 %19
  %20 = load i8, i8* %arrayidx23, align 1
  %conv24 = zext i8 %20 to i32
  %call25 = call i32 @isalpha(i32 %conv24) #4
  %tobool26 = icmp ne i32 %call25, 0
  br i1 %tobool26, label %if.then27, label %if.else32

if.then27:                                        ; preds = %for.body22
  %21 = load i8*, i8** %codeset.addr, align 4
  %22 = load i32, i32* %cnt, align 4
  %arrayidx28 = getelementptr inbounds i8, i8* %21, i32 %22
  %23 = load i8, i8* %arrayidx28, align 1
  %conv29 = zext i8 %23 to i32
  %call30 = call i32 @tolower(i32 %conv29) #4
  %conv31 = trunc i32 %call30 to i8
  %24 = load i8*, i8** %wp, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %24, i32 1
  store i8* %incdec.ptr, i8** %wp, align 4
  store i8 %conv31, i8* %24, align 1
  br label %if.end41

if.else32:                                        ; preds = %for.body22
  %25 = load i8*, i8** %codeset.addr, align 4
  %26 = load i32, i32* %cnt, align 4
  %arrayidx33 = getelementptr inbounds i8, i8* %25, i32 %26
  %27 = load i8, i8* %arrayidx33, align 1
  %conv34 = zext i8 %27 to i32
  %call35 = call i32 @isdigit(i32 %conv34) #4
  %tobool36 = icmp ne i32 %call35, 0
  br i1 %tobool36, label %if.then37, label %if.end40

if.then37:                                        ; preds = %if.else32
  %28 = load i8*, i8** %codeset.addr, align 4
  %29 = load i32, i32* %cnt, align 4
  %arrayidx38 = getelementptr inbounds i8, i8* %28, i32 %29
  %30 = load i8, i8* %arrayidx38, align 1
  %31 = load i8*, i8** %wp, align 4
  %incdec.ptr39 = getelementptr inbounds i8, i8* %31, i32 1
  store i8* %incdec.ptr39, i8** %wp, align 4
  store i8 %30, i8* %31, align 1
  br label %if.end40

if.end40:                                         ; preds = %if.then37, %if.else32
  br label %if.end41

if.end41:                                         ; preds = %if.end40, %if.then27
  br label %for.inc42

for.inc42:                                        ; preds = %if.end41
  %32 = load i32, i32* %cnt, align 4
  %inc43 = add i32 %32, 1
  store i32 %inc43, i32* %cnt, align 4
  br label %for.cond19

for.end44:                                        ; preds = %for.cond19
  %33 = load i8*, i8** %wp, align 4
  store i8 0, i8* %33, align 1
  br label %if.end45

if.end45:                                         ; preds = %for.end44, %for.end
  %34 = load i8*, i8** %retval1, align 4
  ret i8* %34
}

; Function Attrs: nounwind readonly
declare i32 @isalnum(i32) #3

; Function Attrs: nounwind readonly
declare i32 @isalpha(i32) #3

; Function Attrs: nounwind readonly
declare i32 @tolower(i32) #3

; Function Attrs: nounwind readonly
declare i32 @isdigit(i32) #3

declare i8* @strchr(i8*, i32) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }
attributes #3 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
