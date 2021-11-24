
if exists("b:current_syntax")
  finish
endif

syn keyword ipxeBootCommand autoboot
syn keyword ipxeNetCommand ifstat ifopen ifclose ifconf dhcp iflinkwait route ntstat ipstat vreate vdestroy
syn keyword ipxeImageCommand imgstat chain imgexec boot imgfetch module initrd kernel imgselect imgload
syn keyword ipxeImageCommand imgfree imgargs imgtrust imgverify imgextract
syn keyword ipxeSanCommand sanhook sanboot snaunhook fcstat fcels
syn keyword ipxeConfigCommand config show set clear read inc login
syn keyword ipxeFlowCommand isset iseq goto exit
syn keyword ipxeMenuCommand menu item choose
syn keyword ipxeCertCommand certstat certstore certfree
syn keyword ipxeConsoleCommand console colour cpair
syn keyword ipxeFormCommand params param
syn keyword ipxeMiscCommand echo prompt shell help sleep reboot poweroff cpuid sync nslookup ping ntp pciscan
syn keyword ipxeObscureCommand lotest pxebs time gdbstub profstat

" syn keyword ipxeOperator || &&
syn match ipxeOperator "||"
syn match ipxeOperator "&&"

syn match ipxeLabel ":[a-zA-Z0-9_:]\+"
syn match ipxeVariable "${[a-zA-Z0-9_:]\+}"
syn match ipxeComment "#.*$"

hi def link ipxeBootCommand      Define
hi def link ipxeNetCommand       Define
hi def link ipxeImageCommand     Define
hi def link ipxeSanCommand       Define
hi def link ipxeConfigCommand    Define
hi def link ipxeFlowCommand      Define
hi def link ipxeMenuCommand      Define
hi def link ipxeCertCommand      Define
hi def link ipxeConsoleCommand   Define
hi def link ipxeFormCommand      Define
hi def link ipxeMiscCommand      Define
hi def link ipxeObscureCommand   Define
hi def link ipxeComment          Comment
hi def link ipxeLabel            Function
hi def link ipxeVariable         Identifier
hi def link ipxeOperator         String

let b:current_syntax = "ipxe"
