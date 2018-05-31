; ModuleID = 'pcomplib.c'
source_filename = "pcomplib.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.hash_table = type { %struct.bucket_contents**, i32, i32 }
%struct.bucket_contents = type { %struct.bucket_contents*, i8*, i8*, i32, i32 }
%struct.compspec = type { i32, i32, i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8* }

@prog_completes = global %struct.hash_table* null, align 4
@.str = private unnamed_addr constant [11 x i8] c"pcomplib.c\00", align 1
@.str.1 = private unnamed_addr constant [35 x i8] c"progcomp_insert: %s: NULL COMPSPEC\00", align 1

; Function Attrs: noinline nounwind
define %struct.compspec* @compspec_create() #0 {
entry:
  %ret = alloca %struct.compspec*, align 4
  %call = call i8* @sh_xmalloc(i32 44, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 53)
  %0 = bitcast i8* %call to %struct.compspec*
  store %struct.compspec* %0, %struct.compspec** %ret, align 4
  %1 = load %struct.compspec*, %struct.compspec** %ret, align 4
  %refcount = getelementptr inbounds %struct.compspec, %struct.compspec* %1, i32 0, i32 0
  store i32 0, i32* %refcount, align 4
  %2 = load %struct.compspec*, %struct.compspec** %ret, align 4
  %actions = getelementptr inbounds %struct.compspec, %struct.compspec* %2, i32 0, i32 1
  store i32 0, i32* %actions, align 4
  %3 = load %struct.compspec*, %struct.compspec** %ret, align 4
  %options = getelementptr inbounds %struct.compspec, %struct.compspec* %3, i32 0, i32 2
  store i32 0, i32* %options, align 4
  %4 = load %struct.compspec*, %struct.compspec** %ret, align 4
  %globpat = getelementptr inbounds %struct.compspec, %struct.compspec* %4, i32 0, i32 3
  store i8* null, i8** %globpat, align 4
  %5 = load %struct.compspec*, %struct.compspec** %ret, align 4
  %words = getelementptr inbounds %struct.compspec, %struct.compspec* %5, i32 0, i32 4
  store i8* null, i8** %words, align 4
  %6 = load %struct.compspec*, %struct.compspec** %ret, align 4
  %prefix = getelementptr inbounds %struct.compspec, %struct.compspec* %6, i32 0, i32 5
  store i8* null, i8** %prefix, align 4
  %7 = load %struct.compspec*, %struct.compspec** %ret, align 4
  %suffix = getelementptr inbounds %struct.compspec, %struct.compspec* %7, i32 0, i32 6
  store i8* null, i8** %suffix, align 4
  %8 = load %struct.compspec*, %struct.compspec** %ret, align 4
  %funcname = getelementptr inbounds %struct.compspec, %struct.compspec* %8, i32 0, i32 7
  store i8* null, i8** %funcname, align 4
  %9 = load %struct.compspec*, %struct.compspec** %ret, align 4
  %command = getelementptr inbounds %struct.compspec, %struct.compspec* %9, i32 0, i32 8
  store i8* null, i8** %command, align 4
  %10 = load %struct.compspec*, %struct.compspec** %ret, align 4
  %lcommand = getelementptr inbounds %struct.compspec, %struct.compspec* %10, i32 0, i32 9
  store i8* null, i8** %lcommand, align 4
  %11 = load %struct.compspec*, %struct.compspec** %ret, align 4
  %filterpat = getelementptr inbounds %struct.compspec, %struct.compspec* %11, i32 0, i32 10
  store i8* null, i8** %filterpat, align 4
  %12 = load %struct.compspec*, %struct.compspec** %ret, align 4
  ret %struct.compspec* %12
}

declare i8* @sh_xmalloc(i32, i8*, i32) #1

; Function Attrs: noinline nounwind
define void @compspec_dispose(%struct.compspec* %cs) #0 {
entry:
  %cs.addr = alloca %struct.compspec*, align 4
  store %struct.compspec* %cs, %struct.compspec** %cs.addr, align 4
  %0 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %refcount = getelementptr inbounds %struct.compspec, %struct.compspec* %0, i32 0, i32 0
  %1 = load i32, i32* %refcount, align 4
  %dec = add nsw i32 %1, -1
  store i32 %dec, i32* %refcount, align 4
  %2 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %refcount1 = getelementptr inbounds %struct.compspec, %struct.compspec* %2, i32 0, i32 0
  %3 = load i32, i32* %refcount1, align 4
  %cmp = icmp eq i32 %3, 0
  br i1 %cmp, label %if.then, label %if.end46

if.then:                                          ; preds = %entry
  br label %do.body

do.body:                                          ; preds = %if.then
  %4 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %globpat = getelementptr inbounds %struct.compspec, %struct.compspec* %4, i32 0, i32 3
  %5 = load i8*, i8** %globpat, align 4
  %tobool = icmp ne i8* %5, null
  br i1 %tobool, label %if.then2, label %if.end

if.then2:                                         ; preds = %do.body
  %6 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %globpat3 = getelementptr inbounds %struct.compspec, %struct.compspec* %6, i32 0, i32 3
  %7 = load i8*, i8** %globpat3, align 4
  call void @sh_xfree(i8* %7, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 78)
  br label %if.end

if.end:                                           ; preds = %if.then2, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  br label %do.body4

do.body4:                                         ; preds = %do.end
  %8 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %words = getelementptr inbounds %struct.compspec, %struct.compspec* %8, i32 0, i32 4
  %9 = load i8*, i8** %words, align 4
  %tobool5 = icmp ne i8* %9, null
  br i1 %tobool5, label %if.then6, label %if.end8

if.then6:                                         ; preds = %do.body4
  %10 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %words7 = getelementptr inbounds %struct.compspec, %struct.compspec* %10, i32 0, i32 4
  %11 = load i8*, i8** %words7, align 4
  call void @sh_xfree(i8* %11, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 79)
  br label %if.end8

if.end8:                                          ; preds = %if.then6, %do.body4
  br label %do.end9

do.end9:                                          ; preds = %if.end8
  br label %do.body10

do.body10:                                        ; preds = %do.end9
  %12 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %prefix = getelementptr inbounds %struct.compspec, %struct.compspec* %12, i32 0, i32 5
  %13 = load i8*, i8** %prefix, align 4
  %tobool11 = icmp ne i8* %13, null
  br i1 %tobool11, label %if.then12, label %if.end14

if.then12:                                        ; preds = %do.body10
  %14 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %prefix13 = getelementptr inbounds %struct.compspec, %struct.compspec* %14, i32 0, i32 5
  %15 = load i8*, i8** %prefix13, align 4
  call void @sh_xfree(i8* %15, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 80)
  br label %if.end14

if.end14:                                         ; preds = %if.then12, %do.body10
  br label %do.end15

do.end15:                                         ; preds = %if.end14
  br label %do.body16

do.body16:                                        ; preds = %do.end15
  %16 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %suffix = getelementptr inbounds %struct.compspec, %struct.compspec* %16, i32 0, i32 6
  %17 = load i8*, i8** %suffix, align 4
  %tobool17 = icmp ne i8* %17, null
  br i1 %tobool17, label %if.then18, label %if.end20

if.then18:                                        ; preds = %do.body16
  %18 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %suffix19 = getelementptr inbounds %struct.compspec, %struct.compspec* %18, i32 0, i32 6
  %19 = load i8*, i8** %suffix19, align 4
  call void @sh_xfree(i8* %19, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 81)
  br label %if.end20

if.end20:                                         ; preds = %if.then18, %do.body16
  br label %do.end21

do.end21:                                         ; preds = %if.end20
  br label %do.body22

do.body22:                                        ; preds = %do.end21
  %20 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %funcname = getelementptr inbounds %struct.compspec, %struct.compspec* %20, i32 0, i32 7
  %21 = load i8*, i8** %funcname, align 4
  %tobool23 = icmp ne i8* %21, null
  br i1 %tobool23, label %if.then24, label %if.end26

if.then24:                                        ; preds = %do.body22
  %22 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %funcname25 = getelementptr inbounds %struct.compspec, %struct.compspec* %22, i32 0, i32 7
  %23 = load i8*, i8** %funcname25, align 4
  call void @sh_xfree(i8* %23, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 82)
  br label %if.end26

if.end26:                                         ; preds = %if.then24, %do.body22
  br label %do.end27

do.end27:                                         ; preds = %if.end26
  br label %do.body28

do.body28:                                        ; preds = %do.end27
  %24 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %command = getelementptr inbounds %struct.compspec, %struct.compspec* %24, i32 0, i32 8
  %25 = load i8*, i8** %command, align 4
  %tobool29 = icmp ne i8* %25, null
  br i1 %tobool29, label %if.then30, label %if.end32

if.then30:                                        ; preds = %do.body28
  %26 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %command31 = getelementptr inbounds %struct.compspec, %struct.compspec* %26, i32 0, i32 8
  %27 = load i8*, i8** %command31, align 4
  call void @sh_xfree(i8* %27, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 83)
  br label %if.end32

if.end32:                                         ; preds = %if.then30, %do.body28
  br label %do.end33

do.end33:                                         ; preds = %if.end32
  br label %do.body34

do.body34:                                        ; preds = %do.end33
  %28 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %lcommand = getelementptr inbounds %struct.compspec, %struct.compspec* %28, i32 0, i32 9
  %29 = load i8*, i8** %lcommand, align 4
  %tobool35 = icmp ne i8* %29, null
  br i1 %tobool35, label %if.then36, label %if.end38

if.then36:                                        ; preds = %do.body34
  %30 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %lcommand37 = getelementptr inbounds %struct.compspec, %struct.compspec* %30, i32 0, i32 9
  %31 = load i8*, i8** %lcommand37, align 4
  call void @sh_xfree(i8* %31, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 84)
  br label %if.end38

if.end38:                                         ; preds = %if.then36, %do.body34
  br label %do.end39

do.end39:                                         ; preds = %if.end38
  br label %do.body40

do.body40:                                        ; preds = %do.end39
  %32 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %filterpat = getelementptr inbounds %struct.compspec, %struct.compspec* %32, i32 0, i32 10
  %33 = load i8*, i8** %filterpat, align 4
  %tobool41 = icmp ne i8* %33, null
  br i1 %tobool41, label %if.then42, label %if.end44

if.then42:                                        ; preds = %do.body40
  %34 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %filterpat43 = getelementptr inbounds %struct.compspec, %struct.compspec* %34, i32 0, i32 10
  %35 = load i8*, i8** %filterpat43, align 4
  call void @sh_xfree(i8* %35, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 85)
  br label %if.end44

if.end44:                                         ; preds = %if.then42, %do.body40
  br label %do.end45

do.end45:                                         ; preds = %if.end44
  %36 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %37 = bitcast %struct.compspec* %36 to i8*
  call void @sh_xfree(i8* %37, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 87)
  br label %if.end46

if.end46:                                         ; preds = %do.end45, %entry
  ret void
}

declare void @sh_xfree(i8*, i8*, i32) #1

; Function Attrs: noinline nounwind
define %struct.compspec* @compspec_copy(%struct.compspec* %cs) #0 {
entry:
  %cs.addr = alloca %struct.compspec*, align 4
  %new = alloca %struct.compspec*, align 4
  store %struct.compspec* %cs, %struct.compspec** %cs.addr, align 4
  %call = call i8* @sh_xmalloc(i32 44, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 97)
  %0 = bitcast i8* %call to %struct.compspec*
  store %struct.compspec* %0, %struct.compspec** %new, align 4
  %1 = load %struct.compspec*, %struct.compspec** %new, align 4
  %refcount = getelementptr inbounds %struct.compspec, %struct.compspec* %1, i32 0, i32 0
  store i32 1, i32* %refcount, align 4
  %2 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %actions = getelementptr inbounds %struct.compspec, %struct.compspec* %2, i32 0, i32 1
  %3 = load i32, i32* %actions, align 4
  %4 = load %struct.compspec*, %struct.compspec** %new, align 4
  %actions1 = getelementptr inbounds %struct.compspec, %struct.compspec* %4, i32 0, i32 1
  store i32 %3, i32* %actions1, align 4
  %5 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %options = getelementptr inbounds %struct.compspec, %struct.compspec* %5, i32 0, i32 2
  %6 = load i32, i32* %options, align 4
  %7 = load %struct.compspec*, %struct.compspec** %new, align 4
  %options2 = getelementptr inbounds %struct.compspec, %struct.compspec* %7, i32 0, i32 2
  store i32 %6, i32* %options2, align 4
  %8 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %globpat = getelementptr inbounds %struct.compspec, %struct.compspec* %8, i32 0, i32 3
  %9 = load i8*, i8** %globpat, align 4
  %tobool = icmp ne i8* %9, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %10 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %globpat3 = getelementptr inbounds %struct.compspec, %struct.compspec* %10, i32 0, i32 3
  %11 = load i8*, i8** %globpat3, align 4
  %call4 = call i32 @strlen(i8* %11)
  %add = add i32 1, %call4
  %call5 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 103)
  %12 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %globpat6 = getelementptr inbounds %struct.compspec, %struct.compspec* %12, i32 0, i32 3
  %13 = load i8*, i8** %globpat6, align 4
  %call7 = call i8* @strcpy(i8* %call5, i8* %13)
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %call7, %cond.true ], [ null, %cond.false ]
  %14 = load %struct.compspec*, %struct.compspec** %new, align 4
  %globpat8 = getelementptr inbounds %struct.compspec, %struct.compspec* %14, i32 0, i32 3
  store i8* %cond, i8** %globpat8, align 4
  %15 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %words = getelementptr inbounds %struct.compspec, %struct.compspec* %15, i32 0, i32 4
  %16 = load i8*, i8** %words, align 4
  %tobool9 = icmp ne i8* %16, null
  br i1 %tobool9, label %cond.true10, label %cond.false17

cond.true10:                                      ; preds = %cond.end
  %17 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %words11 = getelementptr inbounds %struct.compspec, %struct.compspec* %17, i32 0, i32 4
  %18 = load i8*, i8** %words11, align 4
  %call12 = call i32 @strlen(i8* %18)
  %add13 = add i32 1, %call12
  %call14 = call i8* @sh_xmalloc(i32 %add13, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 104)
  %19 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %words15 = getelementptr inbounds %struct.compspec, %struct.compspec* %19, i32 0, i32 4
  %20 = load i8*, i8** %words15, align 4
  %call16 = call i8* @strcpy(i8* %call14, i8* %20)
  br label %cond.end18

cond.false17:                                     ; preds = %cond.end
  br label %cond.end18

cond.end18:                                       ; preds = %cond.false17, %cond.true10
  %cond19 = phi i8* [ %call16, %cond.true10 ], [ null, %cond.false17 ]
  %21 = load %struct.compspec*, %struct.compspec** %new, align 4
  %words20 = getelementptr inbounds %struct.compspec, %struct.compspec* %21, i32 0, i32 4
  store i8* %cond19, i8** %words20, align 4
  %22 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %prefix = getelementptr inbounds %struct.compspec, %struct.compspec* %22, i32 0, i32 5
  %23 = load i8*, i8** %prefix, align 4
  %tobool21 = icmp ne i8* %23, null
  br i1 %tobool21, label %cond.true22, label %cond.false29

cond.true22:                                      ; preds = %cond.end18
  %24 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %prefix23 = getelementptr inbounds %struct.compspec, %struct.compspec* %24, i32 0, i32 5
  %25 = load i8*, i8** %prefix23, align 4
  %call24 = call i32 @strlen(i8* %25)
  %add25 = add i32 1, %call24
  %call26 = call i8* @sh_xmalloc(i32 %add25, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 105)
  %26 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %prefix27 = getelementptr inbounds %struct.compspec, %struct.compspec* %26, i32 0, i32 5
  %27 = load i8*, i8** %prefix27, align 4
  %call28 = call i8* @strcpy(i8* %call26, i8* %27)
  br label %cond.end30

cond.false29:                                     ; preds = %cond.end18
  br label %cond.end30

cond.end30:                                       ; preds = %cond.false29, %cond.true22
  %cond31 = phi i8* [ %call28, %cond.true22 ], [ null, %cond.false29 ]
  %28 = load %struct.compspec*, %struct.compspec** %new, align 4
  %prefix32 = getelementptr inbounds %struct.compspec, %struct.compspec* %28, i32 0, i32 5
  store i8* %cond31, i8** %prefix32, align 4
  %29 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %suffix = getelementptr inbounds %struct.compspec, %struct.compspec* %29, i32 0, i32 6
  %30 = load i8*, i8** %suffix, align 4
  %tobool33 = icmp ne i8* %30, null
  br i1 %tobool33, label %cond.true34, label %cond.false41

cond.true34:                                      ; preds = %cond.end30
  %31 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %suffix35 = getelementptr inbounds %struct.compspec, %struct.compspec* %31, i32 0, i32 6
  %32 = load i8*, i8** %suffix35, align 4
  %call36 = call i32 @strlen(i8* %32)
  %add37 = add i32 1, %call36
  %call38 = call i8* @sh_xmalloc(i32 %add37, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 106)
  %33 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %suffix39 = getelementptr inbounds %struct.compspec, %struct.compspec* %33, i32 0, i32 6
  %34 = load i8*, i8** %suffix39, align 4
  %call40 = call i8* @strcpy(i8* %call38, i8* %34)
  br label %cond.end42

cond.false41:                                     ; preds = %cond.end30
  br label %cond.end42

cond.end42:                                       ; preds = %cond.false41, %cond.true34
  %cond43 = phi i8* [ %call40, %cond.true34 ], [ null, %cond.false41 ]
  %35 = load %struct.compspec*, %struct.compspec** %new, align 4
  %suffix44 = getelementptr inbounds %struct.compspec, %struct.compspec* %35, i32 0, i32 6
  store i8* %cond43, i8** %suffix44, align 4
  %36 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %funcname = getelementptr inbounds %struct.compspec, %struct.compspec* %36, i32 0, i32 7
  %37 = load i8*, i8** %funcname, align 4
  %tobool45 = icmp ne i8* %37, null
  br i1 %tobool45, label %cond.true46, label %cond.false53

cond.true46:                                      ; preds = %cond.end42
  %38 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %funcname47 = getelementptr inbounds %struct.compspec, %struct.compspec* %38, i32 0, i32 7
  %39 = load i8*, i8** %funcname47, align 4
  %call48 = call i32 @strlen(i8* %39)
  %add49 = add i32 1, %call48
  %call50 = call i8* @sh_xmalloc(i32 %add49, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 107)
  %40 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %funcname51 = getelementptr inbounds %struct.compspec, %struct.compspec* %40, i32 0, i32 7
  %41 = load i8*, i8** %funcname51, align 4
  %call52 = call i8* @strcpy(i8* %call50, i8* %41)
  br label %cond.end54

cond.false53:                                     ; preds = %cond.end42
  br label %cond.end54

cond.end54:                                       ; preds = %cond.false53, %cond.true46
  %cond55 = phi i8* [ %call52, %cond.true46 ], [ null, %cond.false53 ]
  %42 = load %struct.compspec*, %struct.compspec** %new, align 4
  %funcname56 = getelementptr inbounds %struct.compspec, %struct.compspec* %42, i32 0, i32 7
  store i8* %cond55, i8** %funcname56, align 4
  %43 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %command = getelementptr inbounds %struct.compspec, %struct.compspec* %43, i32 0, i32 8
  %44 = load i8*, i8** %command, align 4
  %tobool57 = icmp ne i8* %44, null
  br i1 %tobool57, label %cond.true58, label %cond.false65

cond.true58:                                      ; preds = %cond.end54
  %45 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %command59 = getelementptr inbounds %struct.compspec, %struct.compspec* %45, i32 0, i32 8
  %46 = load i8*, i8** %command59, align 4
  %call60 = call i32 @strlen(i8* %46)
  %add61 = add i32 1, %call60
  %call62 = call i8* @sh_xmalloc(i32 %add61, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 108)
  %47 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %command63 = getelementptr inbounds %struct.compspec, %struct.compspec* %47, i32 0, i32 8
  %48 = load i8*, i8** %command63, align 4
  %call64 = call i8* @strcpy(i8* %call62, i8* %48)
  br label %cond.end66

cond.false65:                                     ; preds = %cond.end54
  br label %cond.end66

cond.end66:                                       ; preds = %cond.false65, %cond.true58
  %cond67 = phi i8* [ %call64, %cond.true58 ], [ null, %cond.false65 ]
  %49 = load %struct.compspec*, %struct.compspec** %new, align 4
  %command68 = getelementptr inbounds %struct.compspec, %struct.compspec* %49, i32 0, i32 8
  store i8* %cond67, i8** %command68, align 4
  %50 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %lcommand = getelementptr inbounds %struct.compspec, %struct.compspec* %50, i32 0, i32 9
  %51 = load i8*, i8** %lcommand, align 4
  %tobool69 = icmp ne i8* %51, null
  br i1 %tobool69, label %cond.true70, label %cond.false77

cond.true70:                                      ; preds = %cond.end66
  %52 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %lcommand71 = getelementptr inbounds %struct.compspec, %struct.compspec* %52, i32 0, i32 9
  %53 = load i8*, i8** %lcommand71, align 4
  %call72 = call i32 @strlen(i8* %53)
  %add73 = add i32 1, %call72
  %call74 = call i8* @sh_xmalloc(i32 %add73, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 109)
  %54 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %lcommand75 = getelementptr inbounds %struct.compspec, %struct.compspec* %54, i32 0, i32 9
  %55 = load i8*, i8** %lcommand75, align 4
  %call76 = call i8* @strcpy(i8* %call74, i8* %55)
  br label %cond.end78

cond.false77:                                     ; preds = %cond.end66
  br label %cond.end78

cond.end78:                                       ; preds = %cond.false77, %cond.true70
  %cond79 = phi i8* [ %call76, %cond.true70 ], [ null, %cond.false77 ]
  %56 = load %struct.compspec*, %struct.compspec** %new, align 4
  %lcommand80 = getelementptr inbounds %struct.compspec, %struct.compspec* %56, i32 0, i32 9
  store i8* %cond79, i8** %lcommand80, align 4
  %57 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %filterpat = getelementptr inbounds %struct.compspec, %struct.compspec* %57, i32 0, i32 10
  %58 = load i8*, i8** %filterpat, align 4
  %tobool81 = icmp ne i8* %58, null
  br i1 %tobool81, label %cond.true82, label %cond.false89

cond.true82:                                      ; preds = %cond.end78
  %59 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %filterpat83 = getelementptr inbounds %struct.compspec, %struct.compspec* %59, i32 0, i32 10
  %60 = load i8*, i8** %filterpat83, align 4
  %call84 = call i32 @strlen(i8* %60)
  %add85 = add i32 1, %call84
  %call86 = call i8* @sh_xmalloc(i32 %add85, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 110)
  %61 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %filterpat87 = getelementptr inbounds %struct.compspec, %struct.compspec* %61, i32 0, i32 10
  %62 = load i8*, i8** %filterpat87, align 4
  %call88 = call i8* @strcpy(i8* %call86, i8* %62)
  br label %cond.end90

cond.false89:                                     ; preds = %cond.end78
  br label %cond.end90

cond.end90:                                       ; preds = %cond.false89, %cond.true82
  %cond91 = phi i8* [ %call88, %cond.true82 ], [ null, %cond.false89 ]
  %63 = load %struct.compspec*, %struct.compspec** %new, align 4
  %filterpat92 = getelementptr inbounds %struct.compspec, %struct.compspec* %63, i32 0, i32 10
  store i8* %cond91, i8** %filterpat92, align 4
  %64 = load %struct.compspec*, %struct.compspec** %new, align 4
  ret %struct.compspec* %64
}

declare i8* @strcpy(i8*, i8*) #1

declare i32 @strlen(i8*) #1

; Function Attrs: noinline nounwind
define void @progcomp_create() #0 {
entry:
  %0 = load %struct.hash_table*, %struct.hash_table** @prog_completes, align 4
  %cmp = icmp eq %struct.hash_table* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call = call %struct.hash_table* @hash_create(i32 256)
  store %struct.hash_table* %call, %struct.hash_table** @prog_completes, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

declare %struct.hash_table* @hash_create(i32) #1

; Function Attrs: noinline nounwind
define i32 @progcomp_size() #0 {
entry:
  %0 = load %struct.hash_table*, %struct.hash_table** @prog_completes, align 4
  %tobool = icmp ne %struct.hash_table* %0, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %1 = load %struct.hash_table*, %struct.hash_table** @prog_completes, align 4
  %nentries = getelementptr inbounds %struct.hash_table, %struct.hash_table* %1, i32 0, i32 2
  %2 = load i32, i32* %nentries, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %2, %cond.true ], [ 0, %cond.false ]
  ret i32 %cond
}

; Function Attrs: noinline nounwind
define void @progcomp_flush() #0 {
entry:
  %0 = load %struct.hash_table*, %struct.hash_table** @prog_completes, align 4
  %tobool = icmp ne %struct.hash_table* %0, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load %struct.hash_table*, %struct.hash_table** @prog_completes, align 4
  call void @hash_flush(%struct.hash_table* %1, void (i8*)* @free_progcomp)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

declare void @hash_flush(%struct.hash_table*, void (i8*)*) #1

; Function Attrs: noinline nounwind
define internal void @free_progcomp(i8* %data) #0 {
entry:
  %data.addr = alloca i8*, align 4
  %cs = alloca %struct.compspec*, align 4
  store i8* %data, i8** %data.addr, align 4
  %0 = load i8*, i8** %data.addr, align 4
  %1 = bitcast i8* %0 to %struct.compspec*
  store %struct.compspec* %1, %struct.compspec** %cs, align 4
  %2 = load %struct.compspec*, %struct.compspec** %cs, align 4
  call void @compspec_dispose(%struct.compspec* %2)
  ret void
}

; Function Attrs: noinline nounwind
define void @progcomp_dispose() #0 {
entry:
  %0 = load %struct.hash_table*, %struct.hash_table** @prog_completes, align 4
  %tobool = icmp ne %struct.hash_table* %0, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load %struct.hash_table*, %struct.hash_table** @prog_completes, align 4
  call void @hash_dispose(%struct.hash_table* %1)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  store %struct.hash_table* null, %struct.hash_table** @prog_completes, align 4
  ret void
}

declare void @hash_dispose(%struct.hash_table*) #1

; Function Attrs: noinline nounwind
define i32 @progcomp_remove(i8* %cmd) #0 {
entry:
  %retval = alloca i32, align 4
  %cmd.addr = alloca i8*, align 4
  %item = alloca %struct.bucket_contents*, align 4
  store i8* %cmd, i8** %cmd.addr, align 4
  %0 = load %struct.hash_table*, %struct.hash_table** @prog_completes, align 4
  %cmp = icmp eq %struct.hash_table* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %cmd.addr, align 4
  %2 = load %struct.hash_table*, %struct.hash_table** @prog_completes, align 4
  %call = call %struct.bucket_contents* @hash_remove(i8* %1, %struct.hash_table* %2, i32 0)
  store %struct.bucket_contents* %call, %struct.bucket_contents** %item, align 4
  %3 = load %struct.bucket_contents*, %struct.bucket_contents** %item, align 4
  %tobool = icmp ne %struct.bucket_contents* %3, null
  br i1 %tobool, label %if.then1, label %if.end6

if.then1:                                         ; preds = %if.end
  %4 = load %struct.bucket_contents*, %struct.bucket_contents** %item, align 4
  %data = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %4, i32 0, i32 2
  %5 = load i8*, i8** %data, align 4
  %tobool2 = icmp ne i8* %5, null
  br i1 %tobool2, label %if.then3, label %if.end5

if.then3:                                         ; preds = %if.then1
  %6 = load %struct.bucket_contents*, %struct.bucket_contents** %item, align 4
  %data4 = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %6, i32 0, i32 2
  %7 = load i8*, i8** %data4, align 4
  call void @free_progcomp(i8* %7)
  br label %if.end5

if.end5:                                          ; preds = %if.then3, %if.then1
  %8 = load %struct.bucket_contents*, %struct.bucket_contents** %item, align 4
  %key = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %8, i32 0, i32 1
  %9 = load i8*, i8** %key, align 4
  call void @sh_xfree(i8* %9, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 167)
  %10 = load %struct.bucket_contents*, %struct.bucket_contents** %item, align 4
  %11 = bitcast %struct.bucket_contents* %10 to i8*
  call void @sh_xfree(i8* %11, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 168)
  store i32 1, i32* %retval, align 4
  br label %return

if.end6:                                          ; preds = %if.end
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end6, %if.end5, %if.then
  %12 = load i32, i32* %retval, align 4
  ret i32 %12
}

declare %struct.bucket_contents* @hash_remove(i8*, %struct.hash_table*, i32) #1

; Function Attrs: noinline nounwind
define i32 @progcomp_insert(i8* %cmd, %struct.compspec* %cs) #0 {
entry:
  %cmd.addr = alloca i8*, align 4
  %cs.addr = alloca %struct.compspec*, align 4
  %item = alloca %struct.bucket_contents*, align 4
  store i8* %cmd, i8** %cmd.addr, align 4
  store %struct.compspec* %cs, %struct.compspec** %cs.addr, align 4
  %0 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %cmp = icmp eq %struct.compspec* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call = call i8* @libintl_gettext(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.1, i32 0, i32 0))
  %1 = load i8*, i8** %cmd.addr, align 4
  call void (i8*, ...) @programming_error(i8* %call, i8* %1)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %2 = load %struct.hash_table*, %struct.hash_table** @prog_completes, align 4
  %cmp1 = icmp eq %struct.hash_table* %2, null
  br i1 %cmp1, label %if.then2, label %if.end3

if.then2:                                         ; preds = %if.end
  call void @progcomp_create()
  br label %if.end3

if.end3:                                          ; preds = %if.then2, %if.end
  %3 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %refcount = getelementptr inbounds %struct.compspec, %struct.compspec* %3, i32 0, i32 0
  %4 = load i32, i32* %refcount, align 4
  %inc = add nsw i32 %4, 1
  store i32 %inc, i32* %refcount, align 4
  %5 = load i8*, i8** %cmd.addr, align 4
  %6 = load %struct.hash_table*, %struct.hash_table** @prog_completes, align 4
  %call4 = call %struct.bucket_contents* @hash_insert(i8* %5, %struct.hash_table* %6, i32 0)
  store %struct.bucket_contents* %call4, %struct.bucket_contents** %item, align 4
  %7 = load %struct.bucket_contents*, %struct.bucket_contents** %item, align 4
  %data = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %7, i32 0, i32 2
  %8 = load i8*, i8** %data, align 4
  %tobool = icmp ne i8* %8, null
  br i1 %tobool, label %if.then5, label %if.else

if.then5:                                         ; preds = %if.end3
  %9 = load %struct.bucket_contents*, %struct.bucket_contents** %item, align 4
  %data6 = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %9, i32 0, i32 2
  %10 = load i8*, i8** %data6, align 4
  call void @free_progcomp(i8* %10)
  br label %if.end10

if.else:                                          ; preds = %if.end3
  %11 = load i8*, i8** %cmd.addr, align 4
  %call7 = call i32 @strlen(i8* %11)
  %add = add i32 1, %call7
  %call8 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 192)
  %12 = load i8*, i8** %cmd.addr, align 4
  %call9 = call i8* @strcpy(i8* %call8, i8* %12)
  %13 = load %struct.bucket_contents*, %struct.bucket_contents** %item, align 4
  %key = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %13, i32 0, i32 1
  store i8* %call9, i8** %key, align 4
  br label %if.end10

if.end10:                                         ; preds = %if.else, %if.then5
  %14 = load %struct.compspec*, %struct.compspec** %cs.addr, align 4
  %15 = bitcast %struct.compspec* %14 to i8*
  %16 = load %struct.bucket_contents*, %struct.bucket_contents** %item, align 4
  %data11 = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %16, i32 0, i32 2
  store i8* %15, i8** %data11, align 4
  ret i32 1
}

declare void @programming_error(i8*, ...) #1

declare i8* @libintl_gettext(i8*) #1

declare %struct.bucket_contents* @hash_insert(i8*, %struct.hash_table*, i32) #1

; Function Attrs: noinline nounwind
define %struct.compspec* @progcomp_search(i8* %cmd) #0 {
entry:
  %retval = alloca %struct.compspec*, align 4
  %cmd.addr = alloca i8*, align 4
  %item = alloca %struct.bucket_contents*, align 4
  %cs = alloca %struct.compspec*, align 4
  store i8* %cmd, i8** %cmd.addr, align 4
  %0 = load %struct.hash_table*, %struct.hash_table** @prog_completes, align 4
  %cmp = icmp eq %struct.hash_table* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store %struct.compspec* null, %struct.compspec** %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %cmd.addr, align 4
  %2 = load %struct.hash_table*, %struct.hash_table** @prog_completes, align 4
  %call = call %struct.bucket_contents* @hash_search(i8* %1, %struct.hash_table* %2, i32 0)
  store %struct.bucket_contents* %call, %struct.bucket_contents** %item, align 4
  %3 = load %struct.bucket_contents*, %struct.bucket_contents** %item, align 4
  %cmp1 = icmp eq %struct.bucket_contents* %3, null
  br i1 %cmp1, label %if.then2, label %if.end3

if.then2:                                         ; preds = %if.end
  store %struct.compspec* null, %struct.compspec** %retval, align 4
  br label %return

if.end3:                                          ; preds = %if.end
  %4 = load %struct.bucket_contents*, %struct.bucket_contents** %item, align 4
  %data = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %4, i32 0, i32 2
  %5 = load i8*, i8** %data, align 4
  %6 = bitcast i8* %5 to %struct.compspec*
  store %struct.compspec* %6, %struct.compspec** %cs, align 4
  %7 = load %struct.compspec*, %struct.compspec** %cs, align 4
  store %struct.compspec* %7, %struct.compspec** %retval, align 4
  br label %return

return:                                           ; preds = %if.end3, %if.then2, %if.then
  %8 = load %struct.compspec*, %struct.compspec** %retval, align 4
  ret %struct.compspec* %8
}

declare %struct.bucket_contents* @hash_search(i8*, %struct.hash_table*, i32) #1

; Function Attrs: noinline nounwind
define void @progcomp_walk(i32 (%struct.bucket_contents*)* %pfunc) #0 {
entry:
  %pfunc.addr = alloca i32 (%struct.bucket_contents*)*, align 4
  store i32 (%struct.bucket_contents*)* %pfunc, i32 (%struct.bucket_contents*)** %pfunc.addr, align 4
  %0 = load %struct.hash_table*, %struct.hash_table** @prog_completes, align 4
  %cmp = icmp eq %struct.hash_table* %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i32 (%struct.bucket_contents*)*, i32 (%struct.bucket_contents*)** %pfunc.addr, align 4
  %cmp1 = icmp eq i32 (%struct.bucket_contents*)* %1, null
  br i1 %cmp1, label %if.then, label %lor.lhs.false2

lor.lhs.false2:                                   ; preds = %lor.lhs.false
  %2 = load %struct.hash_table*, %struct.hash_table** @prog_completes, align 4
  %tobool = icmp ne %struct.hash_table* %2, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false2
  %3 = load %struct.hash_table*, %struct.hash_table** @prog_completes, align 4
  %nentries = getelementptr inbounds %struct.hash_table, %struct.hash_table* %3, i32 0, i32 2
  %4 = load i32, i32* %nentries, align 4
  br label %cond.end

cond.false:                                       ; preds = %lor.lhs.false2
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %4, %cond.true ], [ 0, %cond.false ]
  %cmp3 = icmp eq i32 %cond, 0
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %cond.end, %lor.lhs.false, %entry
  br label %return

if.end:                                           ; preds = %cond.end
  %5 = load %struct.hash_table*, %struct.hash_table** @prog_completes, align 4
  %6 = load i32 (%struct.bucket_contents*)*, i32 (%struct.bucket_contents*)** %pfunc.addr, align 4
  call void @hash_walk(%struct.hash_table* %5, i32 (%struct.bucket_contents*)* %6)
  br label %return

return:                                           ; preds = %if.end, %if.then
  ret void
}

declare void @hash_walk(%struct.hash_table*, i32 (%struct.bucket_contents*)*) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
