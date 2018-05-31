; ModuleID = 'finddomain.c'
source_filename = "finddomain.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.loaded_l10nfile = type { i8*, i32, i8*, %struct.loaded_l10nfile*, [1 x %struct.loaded_l10nfile*] }
%struct.binding = type { %struct.binding*, i8*, i32, i8*, [0 x i8] }

@_nl_loaded_domains = internal global %struct.loaded_l10nfile* null, align 4

; Function Attrs: noinline nounwind
define %struct.loaded_l10nfile* @_nl_find_domain(i8* %dirname, i8* %locale, i8* %domainname, %struct.binding* %domainbinding) #0 {
entry:
  %retval = alloca %struct.loaded_l10nfile*, align 4
  %dirname.addr = alloca i8*, align 4
  %locale.addr = alloca i8*, align 4
  %domainname.addr = alloca i8*, align 4
  %domainbinding.addr = alloca %struct.binding*, align 4
  %retval1 = alloca %struct.loaded_l10nfile*, align 4
  %language = alloca i8*, align 4
  %modifier = alloca i8*, align 4
  %territory = alloca i8*, align 4
  %codeset = alloca i8*, align 4
  %normalized_codeset = alloca i8*, align 4
  %special = alloca i8*, align 4
  %sponsor = alloca i8*, align 4
  %revision = alloca i8*, align 4
  %alias_value = alloca i8*, align 4
  %mask = alloca i32, align 4
  %cnt = alloca i32, align 4
  %cnt47 = alloca i32, align 4
  store i8* %dirname, i8** %dirname.addr, align 4
  store i8* %locale, i8** %locale.addr, align 4
  store i8* %domainname, i8** %domainname.addr, align 4
  store %struct.binding* %domainbinding, %struct.binding** %domainbinding.addr, align 4
  %0 = load i8*, i8** %dirname.addr, align 4
  %1 = load i8*, i8** %dirname.addr, align 4
  %call = call i32 @strlen(i8* %1)
  %add = add i32 %call, 1
  %2 = load i8*, i8** %locale.addr, align 4
  %3 = load i8*, i8** %domainname.addr, align 4
  %call2 = call %struct.loaded_l10nfile* @_nl_make_l10nflist(%struct.loaded_l10nfile** @_nl_loaded_domains, i8* %0, i32 %add, i32 0, i8* %2, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* %3, i32 0)
  store %struct.loaded_l10nfile* %call2, %struct.loaded_l10nfile** %retval1, align 4
  %4 = load %struct.loaded_l10nfile*, %struct.loaded_l10nfile** %retval1, align 4
  %cmp = icmp ne %struct.loaded_l10nfile* %4, null
  br i1 %cmp, label %if.then, label %if.end24

if.then:                                          ; preds = %entry
  %5 = load %struct.loaded_l10nfile*, %struct.loaded_l10nfile** %retval1, align 4
  %decided = getelementptr inbounds %struct.loaded_l10nfile, %struct.loaded_l10nfile* %5, i32 0, i32 1
  %6 = load i32, i32* %decided, align 4
  %cmp3 = icmp eq i32 %6, 0
  br i1 %cmp3, label %if.then4, label %if.end

if.then4:                                         ; preds = %if.then
  %7 = load %struct.loaded_l10nfile*, %struct.loaded_l10nfile** %retval1, align 4
  %8 = load %struct.binding*, %struct.binding** %domainbinding.addr, align 4
  call void @_nl_load_domain(%struct.loaded_l10nfile* %7, %struct.binding* %8)
  br label %if.end

if.end:                                           ; preds = %if.then4, %if.then
  %9 = load %struct.loaded_l10nfile*, %struct.loaded_l10nfile** %retval1, align 4
  %data = getelementptr inbounds %struct.loaded_l10nfile, %struct.loaded_l10nfile* %9, i32 0, i32 2
  %10 = load i8*, i8** %data, align 4
  %cmp5 = icmp ne i8* %10, null
  br i1 %cmp5, label %if.then6, label %if.end7

if.then6:                                         ; preds = %if.end
  %11 = load %struct.loaded_l10nfile*, %struct.loaded_l10nfile** %retval1, align 4
  store %struct.loaded_l10nfile* %11, %struct.loaded_l10nfile** %retval, align 4
  br label %return

if.end7:                                          ; preds = %if.end
  store i32 0, i32* %cnt, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end7
  %12 = load %struct.loaded_l10nfile*, %struct.loaded_l10nfile** %retval1, align 4
  %successor = getelementptr inbounds %struct.loaded_l10nfile, %struct.loaded_l10nfile* %12, i32 0, i32 4
  %13 = load i32, i32* %cnt, align 4
  %arrayidx = getelementptr inbounds [1 x %struct.loaded_l10nfile*], [1 x %struct.loaded_l10nfile*]* %successor, i32 0, i32 %13
  %14 = load %struct.loaded_l10nfile*, %struct.loaded_l10nfile** %arrayidx, align 4
  %cmp8 = icmp ne %struct.loaded_l10nfile* %14, null
  br i1 %cmp8, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %15 = load %struct.loaded_l10nfile*, %struct.loaded_l10nfile** %retval1, align 4
  %successor9 = getelementptr inbounds %struct.loaded_l10nfile, %struct.loaded_l10nfile* %15, i32 0, i32 4
  %16 = load i32, i32* %cnt, align 4
  %arrayidx10 = getelementptr inbounds [1 x %struct.loaded_l10nfile*], [1 x %struct.loaded_l10nfile*]* %successor9, i32 0, i32 %16
  %17 = load %struct.loaded_l10nfile*, %struct.loaded_l10nfile** %arrayidx10, align 4
  %decided11 = getelementptr inbounds %struct.loaded_l10nfile, %struct.loaded_l10nfile* %17, i32 0, i32 1
  %18 = load i32, i32* %decided11, align 4
  %cmp12 = icmp eq i32 %18, 0
  br i1 %cmp12, label %if.then13, label %if.end16

if.then13:                                        ; preds = %for.body
  %19 = load %struct.loaded_l10nfile*, %struct.loaded_l10nfile** %retval1, align 4
  %successor14 = getelementptr inbounds %struct.loaded_l10nfile, %struct.loaded_l10nfile* %19, i32 0, i32 4
  %20 = load i32, i32* %cnt, align 4
  %arrayidx15 = getelementptr inbounds [1 x %struct.loaded_l10nfile*], [1 x %struct.loaded_l10nfile*]* %successor14, i32 0, i32 %20
  %21 = load %struct.loaded_l10nfile*, %struct.loaded_l10nfile** %arrayidx15, align 4
  %22 = load %struct.binding*, %struct.binding** %domainbinding.addr, align 4
  call void @_nl_load_domain(%struct.loaded_l10nfile* %21, %struct.binding* %22)
  br label %if.end16

if.end16:                                         ; preds = %if.then13, %for.body
  %23 = load %struct.loaded_l10nfile*, %struct.loaded_l10nfile** %retval1, align 4
  %successor17 = getelementptr inbounds %struct.loaded_l10nfile, %struct.loaded_l10nfile* %23, i32 0, i32 4
  %24 = load i32, i32* %cnt, align 4
  %arrayidx18 = getelementptr inbounds [1 x %struct.loaded_l10nfile*], [1 x %struct.loaded_l10nfile*]* %successor17, i32 0, i32 %24
  %25 = load %struct.loaded_l10nfile*, %struct.loaded_l10nfile** %arrayidx18, align 4
  %data19 = getelementptr inbounds %struct.loaded_l10nfile, %struct.loaded_l10nfile* %25, i32 0, i32 2
  %26 = load i8*, i8** %data19, align 4
  %cmp20 = icmp ne i8* %26, null
  br i1 %cmp20, label %if.then21, label %if.end22

if.then21:                                        ; preds = %if.end16
  br label %for.end

if.end22:                                         ; preds = %if.end16
  br label %for.inc

for.inc:                                          ; preds = %if.end22
  %27 = load i32, i32* %cnt, align 4
  %inc = add nsw i32 %27, 1
  store i32 %inc, i32* %cnt, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then21, %for.cond
  %28 = load i32, i32* %cnt, align 4
  %cmp23 = icmp sge i32 %28, 0
  br i1 %cmp23, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.end
  %29 = load %struct.loaded_l10nfile*, %struct.loaded_l10nfile** %retval1, align 4
  br label %cond.end

cond.false:                                       ; preds = %for.end
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi %struct.loaded_l10nfile* [ %29, %cond.true ], [ null, %cond.false ]
  store %struct.loaded_l10nfile* %cond, %struct.loaded_l10nfile** %retval, align 4
  br label %return

if.end24:                                         ; preds = %entry
  %30 = load i8*, i8** %locale.addr, align 4
  %call25 = call i8* @_nl_expand_alias(i8* %30)
  store i8* %call25, i8** %alias_value, align 4
  %31 = load i8*, i8** %alias_value, align 4
  %cmp26 = icmp ne i8* %31, null
  br i1 %cmp26, label %if.then27, label %if.end32

if.then27:                                        ; preds = %if.end24
  %32 = load i8*, i8** %alias_value, align 4
  %call28 = call i8* @strdup(i8* %32)
  store i8* %call28, i8** %locale.addr, align 4
  %33 = load i8*, i8** %locale.addr, align 4
  %cmp29 = icmp eq i8* %33, null
  br i1 %cmp29, label %if.then30, label %if.end31

if.then30:                                        ; preds = %if.then27
  store %struct.loaded_l10nfile* null, %struct.loaded_l10nfile** %retval, align 4
  br label %return

if.end31:                                         ; preds = %if.then27
  br label %if.end32

if.end32:                                         ; preds = %if.end31, %if.end24
  %34 = load i8*, i8** %locale.addr, align 4
  %call33 = call i32 @_nl_explode_name(i8* %34, i8** %language, i8** %modifier, i8** %territory, i8** %codeset, i8** %normalized_codeset, i8** %special, i8** %sponsor, i8** %revision)
  store i32 %call33, i32* %mask, align 4
  %35 = load i8*, i8** %dirname.addr, align 4
  %36 = load i8*, i8** %dirname.addr, align 4
  %call34 = call i32 @strlen(i8* %36)
  %add35 = add i32 %call34, 1
  %37 = load i32, i32* %mask, align 4
  %38 = load i8*, i8** %language, align 4
  %39 = load i8*, i8** %territory, align 4
  %40 = load i8*, i8** %codeset, align 4
  %41 = load i8*, i8** %normalized_codeset, align 4
  %42 = load i8*, i8** %modifier, align 4
  %43 = load i8*, i8** %special, align 4
  %44 = load i8*, i8** %sponsor, align 4
  %45 = load i8*, i8** %revision, align 4
  %46 = load i8*, i8** %domainname.addr, align 4
  %call36 = call %struct.loaded_l10nfile* @_nl_make_l10nflist(%struct.loaded_l10nfile** @_nl_loaded_domains, i8* %35, i32 %add35, i32 %37, i8* %38, i8* %39, i8* %40, i8* %41, i8* %42, i8* %43, i8* %44, i8* %45, i8* %46, i32 1)
  store %struct.loaded_l10nfile* %call36, %struct.loaded_l10nfile** %retval1, align 4
  %47 = load %struct.loaded_l10nfile*, %struct.loaded_l10nfile** %retval1, align 4
  %cmp37 = icmp eq %struct.loaded_l10nfile* %47, null
  br i1 %cmp37, label %if.then38, label %if.end39

if.then38:                                        ; preds = %if.end32
  store %struct.loaded_l10nfile* null, %struct.loaded_l10nfile** %retval, align 4
  br label %return

if.end39:                                         ; preds = %if.end32
  %48 = load %struct.loaded_l10nfile*, %struct.loaded_l10nfile** %retval1, align 4
  %decided40 = getelementptr inbounds %struct.loaded_l10nfile, %struct.loaded_l10nfile* %48, i32 0, i32 1
  %49 = load i32, i32* %decided40, align 4
  %cmp41 = icmp eq i32 %49, 0
  br i1 %cmp41, label %if.then42, label %if.end43

if.then42:                                        ; preds = %if.end39
  %50 = load %struct.loaded_l10nfile*, %struct.loaded_l10nfile** %retval1, align 4
  %51 = load %struct.binding*, %struct.binding** %domainbinding.addr, align 4
  call void @_nl_load_domain(%struct.loaded_l10nfile* %50, %struct.binding* %51)
  br label %if.end43

if.end43:                                         ; preds = %if.then42, %if.end39
  %52 = load %struct.loaded_l10nfile*, %struct.loaded_l10nfile** %retval1, align 4
  %data44 = getelementptr inbounds %struct.loaded_l10nfile, %struct.loaded_l10nfile* %52, i32 0, i32 2
  %53 = load i8*, i8** %data44, align 4
  %cmp45 = icmp eq i8* %53, null
  br i1 %cmp45, label %if.then46, label %if.end70

if.then46:                                        ; preds = %if.end43
  store i32 0, i32* %cnt47, align 4
  br label %for.cond48

for.cond48:                                       ; preds = %for.inc67, %if.then46
  %54 = load %struct.loaded_l10nfile*, %struct.loaded_l10nfile** %retval1, align 4
  %successor49 = getelementptr inbounds %struct.loaded_l10nfile, %struct.loaded_l10nfile* %54, i32 0, i32 4
  %55 = load i32, i32* %cnt47, align 4
  %arrayidx50 = getelementptr inbounds [1 x %struct.loaded_l10nfile*], [1 x %struct.loaded_l10nfile*]* %successor49, i32 0, i32 %55
  %56 = load %struct.loaded_l10nfile*, %struct.loaded_l10nfile** %arrayidx50, align 4
  %cmp51 = icmp ne %struct.loaded_l10nfile* %56, null
  br i1 %cmp51, label %for.body52, label %for.end69

for.body52:                                       ; preds = %for.cond48
  %57 = load %struct.loaded_l10nfile*, %struct.loaded_l10nfile** %retval1, align 4
  %successor53 = getelementptr inbounds %struct.loaded_l10nfile, %struct.loaded_l10nfile* %57, i32 0, i32 4
  %58 = load i32, i32* %cnt47, align 4
  %arrayidx54 = getelementptr inbounds [1 x %struct.loaded_l10nfile*], [1 x %struct.loaded_l10nfile*]* %successor53, i32 0, i32 %58
  %59 = load %struct.loaded_l10nfile*, %struct.loaded_l10nfile** %arrayidx54, align 4
  %decided55 = getelementptr inbounds %struct.loaded_l10nfile, %struct.loaded_l10nfile* %59, i32 0, i32 1
  %60 = load i32, i32* %decided55, align 4
  %cmp56 = icmp eq i32 %60, 0
  br i1 %cmp56, label %if.then57, label %if.end60

if.then57:                                        ; preds = %for.body52
  %61 = load %struct.loaded_l10nfile*, %struct.loaded_l10nfile** %retval1, align 4
  %successor58 = getelementptr inbounds %struct.loaded_l10nfile, %struct.loaded_l10nfile* %61, i32 0, i32 4
  %62 = load i32, i32* %cnt47, align 4
  %arrayidx59 = getelementptr inbounds [1 x %struct.loaded_l10nfile*], [1 x %struct.loaded_l10nfile*]* %successor58, i32 0, i32 %62
  %63 = load %struct.loaded_l10nfile*, %struct.loaded_l10nfile** %arrayidx59, align 4
  %64 = load %struct.binding*, %struct.binding** %domainbinding.addr, align 4
  call void @_nl_load_domain(%struct.loaded_l10nfile* %63, %struct.binding* %64)
  br label %if.end60

if.end60:                                         ; preds = %if.then57, %for.body52
  %65 = load %struct.loaded_l10nfile*, %struct.loaded_l10nfile** %retval1, align 4
  %successor61 = getelementptr inbounds %struct.loaded_l10nfile, %struct.loaded_l10nfile* %65, i32 0, i32 4
  %66 = load i32, i32* %cnt47, align 4
  %arrayidx62 = getelementptr inbounds [1 x %struct.loaded_l10nfile*], [1 x %struct.loaded_l10nfile*]* %successor61, i32 0, i32 %66
  %67 = load %struct.loaded_l10nfile*, %struct.loaded_l10nfile** %arrayidx62, align 4
  %data63 = getelementptr inbounds %struct.loaded_l10nfile, %struct.loaded_l10nfile* %67, i32 0, i32 2
  %68 = load i8*, i8** %data63, align 4
  %cmp64 = icmp ne i8* %68, null
  br i1 %cmp64, label %if.then65, label %if.end66

if.then65:                                        ; preds = %if.end60
  br label %for.end69

if.end66:                                         ; preds = %if.end60
  br label %for.inc67

for.inc67:                                        ; preds = %if.end66
  %69 = load i32, i32* %cnt47, align 4
  %inc68 = add nsw i32 %69, 1
  store i32 %inc68, i32* %cnt47, align 4
  br label %for.cond48

for.end69:                                        ; preds = %if.then65, %for.cond48
  br label %if.end70

if.end70:                                         ; preds = %for.end69, %if.end43
  %70 = load i8*, i8** %alias_value, align 4
  %cmp71 = icmp ne i8* %70, null
  br i1 %cmp71, label %if.then72, label %if.end73

if.then72:                                        ; preds = %if.end70
  %71 = load i8*, i8** %locale.addr, align 4
  call void @free(i8* %71)
  br label %if.end73

if.end73:                                         ; preds = %if.then72, %if.end70
  %72 = load i32, i32* %mask, align 4
  %and = and i32 %72, 8
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then74, label %if.end75

if.then74:                                        ; preds = %if.end73
  %73 = load i8*, i8** %normalized_codeset, align 4
  call void @free(i8* %73)
  br label %if.end75

if.end75:                                         ; preds = %if.then74, %if.end73
  %74 = load %struct.loaded_l10nfile*, %struct.loaded_l10nfile** %retval1, align 4
  store %struct.loaded_l10nfile* %74, %struct.loaded_l10nfile** %retval, align 4
  br label %return

return:                                           ; preds = %if.end75, %if.then38, %if.then30, %cond.end, %if.then6
  %75 = load %struct.loaded_l10nfile*, %struct.loaded_l10nfile** %retval, align 4
  ret %struct.loaded_l10nfile* %75
}

declare %struct.loaded_l10nfile* @_nl_make_l10nflist(%struct.loaded_l10nfile**, i8*, i32, i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i32) #1

declare i32 @strlen(i8*) #1

declare void @_nl_load_domain(%struct.loaded_l10nfile*, %struct.binding*) #1

declare i8* @_nl_expand_alias(i8*) #1

declare i8* @strdup(i8*) #1

declare i32 @_nl_explode_name(i8*, i8**, i8**, i8**, i8**, i8**, i8**, i8**, i8**) #1

declare void @free(i8*) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
