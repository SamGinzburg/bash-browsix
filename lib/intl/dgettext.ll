; ModuleID = 'dgettext.c'
source_filename = "dgettext.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

; Function Attrs: noinline nounwind
define i8* @libintl_dgettext(i8* %domainname, i8* %msgid) #0 {
entry:
  %domainname.addr = alloca i8*, align 4
  %msgid.addr = alloca i8*, align 4
  store i8* %domainname, i8** %domainname.addr, align 4
  store i8* %msgid, i8** %msgid.addr, align 4
  %0 = load i8*, i8** %domainname.addr, align 4
  %1 = load i8*, i8** %msgid.addr, align 4
  %call = call i8* @libintl_dcgettext(i8* %0, i8* %1, i32 5)
  ret i8* %call
}

declare i8* @libintl_dcgettext(i8*, i8*, i32) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
