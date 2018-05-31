; ModuleID = 'intl-compat.c'
source_filename = "intl-compat.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

; Function Attrs: noinline nounwind
define i8* @gettext(i8* %msgid) #0 {
entry:
  %msgid.addr = alloca i8*, align 4
  store i8* %msgid, i8** %msgid.addr, align 4
  %0 = load i8*, i8** %msgid.addr, align 4
  %call = call i8* @libintl_gettext(i8* %0)
  ret i8* %call
}

declare i8* @libintl_gettext(i8*) #1

; Function Attrs: noinline nounwind
define i8* @dgettext(i8* %domainname, i8* %msgid) #0 {
entry:
  %domainname.addr = alloca i8*, align 4
  %msgid.addr = alloca i8*, align 4
  store i8* %domainname, i8** %domainname.addr, align 4
  store i8* %msgid, i8** %msgid.addr, align 4
  %0 = load i8*, i8** %domainname.addr, align 4
  %1 = load i8*, i8** %msgid.addr, align 4
  %call = call i8* @libintl_dgettext(i8* %0, i8* %1)
  ret i8* %call
}

declare i8* @libintl_dgettext(i8*, i8*) #1

; Function Attrs: noinline nounwind
define i8* @dcgettext(i8* %domainname, i8* %msgid, i32 %category) #0 {
entry:
  %domainname.addr = alloca i8*, align 4
  %msgid.addr = alloca i8*, align 4
  %category.addr = alloca i32, align 4
  store i8* %domainname, i8** %domainname.addr, align 4
  store i8* %msgid, i8** %msgid.addr, align 4
  store i32 %category, i32* %category.addr, align 4
  %0 = load i8*, i8** %domainname.addr, align 4
  %1 = load i8*, i8** %msgid.addr, align 4
  %2 = load i32, i32* %category.addr, align 4
  %call = call i8* @libintl_dcgettext(i8* %0, i8* %1, i32 %2)
  ret i8* %call
}

declare i8* @libintl_dcgettext(i8*, i8*, i32) #1

; Function Attrs: noinline nounwind
define i8* @ngettext(i8* %msgid1, i8* %msgid2, i32 %n) #0 {
entry:
  %msgid1.addr = alloca i8*, align 4
  %msgid2.addr = alloca i8*, align 4
  %n.addr = alloca i32, align 4
  store i8* %msgid1, i8** %msgid1.addr, align 4
  store i8* %msgid2, i8** %msgid2.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  %0 = load i8*, i8** %msgid1.addr, align 4
  %1 = load i8*, i8** %msgid2.addr, align 4
  %2 = load i32, i32* %n.addr, align 4
  %call = call i8* @libintl_ngettext(i8* %0, i8* %1, i32 %2)
  ret i8* %call
}

declare i8* @libintl_ngettext(i8*, i8*, i32) #1

; Function Attrs: noinline nounwind
define i8* @dngettext(i8* %domainname, i8* %msgid1, i8* %msgid2, i32 %n) #0 {
entry:
  %domainname.addr = alloca i8*, align 4
  %msgid1.addr = alloca i8*, align 4
  %msgid2.addr = alloca i8*, align 4
  %n.addr = alloca i32, align 4
  store i8* %domainname, i8** %domainname.addr, align 4
  store i8* %msgid1, i8** %msgid1.addr, align 4
  store i8* %msgid2, i8** %msgid2.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  %0 = load i8*, i8** %domainname.addr, align 4
  %1 = load i8*, i8** %msgid1.addr, align 4
  %2 = load i8*, i8** %msgid2.addr, align 4
  %3 = load i32, i32* %n.addr, align 4
  %call = call i8* @libintl_dngettext(i8* %0, i8* %1, i8* %2, i32 %3)
  ret i8* %call
}

declare i8* @libintl_dngettext(i8*, i8*, i8*, i32) #1

; Function Attrs: noinline nounwind
define i8* @dcngettext(i8* %domainname, i8* %msgid1, i8* %msgid2, i32 %n, i32 %category) #0 {
entry:
  %domainname.addr = alloca i8*, align 4
  %msgid1.addr = alloca i8*, align 4
  %msgid2.addr = alloca i8*, align 4
  %n.addr = alloca i32, align 4
  %category.addr = alloca i32, align 4
  store i8* %domainname, i8** %domainname.addr, align 4
  store i8* %msgid1, i8** %msgid1.addr, align 4
  store i8* %msgid2, i8** %msgid2.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i32 %category, i32* %category.addr, align 4
  %0 = load i8*, i8** %domainname.addr, align 4
  %1 = load i8*, i8** %msgid1.addr, align 4
  %2 = load i8*, i8** %msgid2.addr, align 4
  %3 = load i32, i32* %n.addr, align 4
  %4 = load i32, i32* %category.addr, align 4
  %call = call i8* @libintl_dcngettext(i8* %0, i8* %1, i8* %2, i32 %3, i32 %4)
  ret i8* %call
}

declare i8* @libintl_dcngettext(i8*, i8*, i8*, i32, i32) #1

; Function Attrs: noinline nounwind
define i8* @textdomain(i8* %domainname) #0 {
entry:
  %domainname.addr = alloca i8*, align 4
  store i8* %domainname, i8** %domainname.addr, align 4
  %0 = load i8*, i8** %domainname.addr, align 4
  %call = call i8* @libintl_textdomain(i8* %0)
  ret i8* %call
}

declare i8* @libintl_textdomain(i8*) #1

; Function Attrs: noinline nounwind
define i8* @bindtextdomain(i8* %domainname, i8* %dirname) #0 {
entry:
  %domainname.addr = alloca i8*, align 4
  %dirname.addr = alloca i8*, align 4
  store i8* %domainname, i8** %domainname.addr, align 4
  store i8* %dirname, i8** %dirname.addr, align 4
  %0 = load i8*, i8** %domainname.addr, align 4
  %1 = load i8*, i8** %dirname.addr, align 4
  %call = call i8* @libintl_bindtextdomain(i8* %0, i8* %1)
  ret i8* %call
}

declare i8* @libintl_bindtextdomain(i8*, i8*) #1

; Function Attrs: noinline nounwind
define i8* @bind_textdomain_codeset(i8* %domainname, i8* %codeset) #0 {
entry:
  %domainname.addr = alloca i8*, align 4
  %codeset.addr = alloca i8*, align 4
  store i8* %domainname, i8** %domainname.addr, align 4
  store i8* %codeset, i8** %codeset.addr, align 4
  %0 = load i8*, i8** %domainname.addr, align 4
  %1 = load i8*, i8** %codeset.addr, align 4
  %call = call i8* @libintl_bind_textdomain_codeset(i8* %0, i8* %1)
  ret i8* %call
}

declare i8* @libintl_bind_textdomain_codeset(i8*, i8*) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
