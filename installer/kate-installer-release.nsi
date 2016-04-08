; Script generated by the HM NIS Edit Script Wizard.

; HM NIS Edit Wizard helper defines
!define PRODUCT_NAME "Kate"
!define PRODUCT_VERSION "@BUILD_TIME_STAMP@-dev"
!define PRODUCT_PUBLISHER "KDE"
!define PRODUCT_WEB_SITE "http://kate-editor.org/"
!define PRODUCT_DIR_REGKEY "Software\Microsoft\Windows\CurrentVersion\App Paths\kate.exe"
!define PRODUCT_UNINST_KEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}"
!define PRODUCT_UNINST_ROOT_KEY "HKLM"

; MUI 1.67 compatible ------
!include "MUI.nsh"

; MUI Settings
!define MUI_ABORTWARNING
!define MUI_ICON "${NSISDIR}\Contrib\Graphics\Icons\modern-install.ico"
!define MUI_UNICON "${NSISDIR}\Contrib\Graphics\Icons\modern-uninstall.ico"

; Welcome page
!insertmacro MUI_PAGE_WELCOME
; License page
!insertmacro MUI_PAGE_LICENSE "bin\COPYING.GPL2"
; Components page
!insertmacro MUI_PAGE_COMPONENTS
; Directory page
!insertmacro MUI_PAGE_DIRECTORY
; Instfiles page
!insertmacro MUI_PAGE_INSTFILES
; Finish page
!define MUI_FINISHPAGE_RUN "$INSTDIR\bin\kate.exe"
!insertmacro MUI_PAGE_FINISH

; Uninstaller pages
!insertmacro MUI_UNPAGE_INSTFILES

; Language files
!insertmacro MUI_LANGUAGE "English"

; MUI end ------

Name "${PRODUCT_NAME} ${PRODUCT_VERSION}"
OutFile "Kate-setup-${PRODUCT_VERSION}.exe"
InstallDir "$PROGRAMFILES\Kate"
InstallDirRegKey HKLM "${PRODUCT_DIR_REGKEY}" ""
ShowInstDetails show
ShowUnInstDetails show


RequestExecutionLevel admin

Function .onInit
  ReadRegStr $R0 HKLM \
  "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}" \
  "UninstallString"
  StrCmp $R0 "" done

  MessageBox MB_OKCANCEL|MB_ICONEXCLAMATION \
  "${PRODUCT_NAME} is already installed. $\n$\nClick `OK` to remove the \
  previous version or `Cancel` to cancel this upgrade." \
  IDOK uninst
  Abort

;Run the uninstaller
uninst:
  ClearErrors
  ;ExecWait '$R0 _?=$INSTDIR' ;Do not copy the uninstaller to a temp file
  Exec $R0 ; instead of the ExecWait line

  IfErrors no_remove_uninstaller done
    ;You can either use Delete /REBOOTOK in the uninstaller or add some code
    ;here to remove the uninstaller. Use a registry key to check
    ;whether the user has chosen to uninstall. If you are using an uninstaller
    ;components page, make sure all sections are uninstalled.
  no_remove_uninstaller:

done:
FunctionEnd


Section "Kate" SEC01
  SectionIn RO
  SetOutPath "$INSTDIR\bin\bearer"
  SetOverwrite try
  File "bin\bearer\qgenericbearer.dll"
  File "bin\bearer\qnativewifibearer.dll"
  SetOutPath "$INSTDIR\bin"
  File "bin\breeze.rcc"
  File "bin\d3dcompiler_47.dll"
  SetOutPath "$INSTDIR\bin\iconengines"
  File "bin\iconengines\qsvgicon.dll"
  SetOutPath "$INSTDIR\bin\imageformats"
  File "bin\imageformats\qdds.dll"
  File "bin\imageformats\qgif.dll"
  File "bin\imageformats\qicns.dll"
  File "bin\imageformats\qico.dll"
  File "bin\imageformats\qjpeg.dll"
  File "bin\imageformats\qsvg.dll"
  File "bin\imageformats\qtga.dll"
  File "bin\imageformats\qtiff.dll"
  File "bin\imageformats\qwbmp.dll"
  File "bin\imageformats\qwebp.dll"
  SetOutPath "$INSTDIR\bin"
  File "bin\kate.exe"
  CreateDirectory "$SMPROGRAMS\Kate"
  CreateShortCut "$SMPROGRAMS\Kate\Kate.lnk" "$INSTDIR\bin\kate.exe"
  CreateShortCut "$DESKTOP\Kate.lnk" "$INSTDIR\bin\kate.exe"
  File "bin\KF5Archive.dll"
  File "bin\KF5Attica.dll"
  File "bin\KF5Auth.dll"
  File "bin\KF5Bookmarks.dll"
  File "bin\KF5Codecs.dll"
  File "bin\KF5Completion.dll"
  File "bin\KF5ConfigCore.dll"
  File "bin\KF5ConfigGui.dll"
  File "bin\KF5ConfigWidgets.dll"
  File "bin\KF5CoreAddons.dll"
  File "bin\KF5Crash.dll"
  File "bin\KF5DBusAddons.dll"
  File "bin\KF5GuiAddons.dll"
  File "bin\KF5I18n.dll"
  File "bin\KF5IconThemes.dll"
  File "bin\KF5ItemModels.dll"
  File "bin\KF5ItemViews.dll"
  File "bin\KF5JobWidgets.dll"
  File "bin\KF5KIOCore.dll"
  File "bin\KF5KIOFileWidgets.dll"
  File "bin\KF5KIONTLM.dll"
  File "bin\KF5KIOWidgets.dll"
  File "bin\KF5NewStuff.dll"
  File "bin\KF5Parts.dll"
  File "bin\KF5Service.dll"
  File "bin\KF5Solid.dll"
  File "bin\KF5SonnetCore.dll"
  File "bin\KF5SonnetUi.dll"
  File "bin\KF5TextEditor.dll"
  File "bin\KF5TextWidgets.dll"
  File "bin\KF5ThreadWeaver.dll"
  File "bin\KF5WidgetsAddons.dll"
  File "bin\KF5WindowSystem.dll"
  File "bin\KF5XmlGui.dll"
  File "bin\libEGL.dll"
  File "bin\libGLESV2.dll"
  File "bin\libhunspell-1.3.dll"
  File "bin\opengl32sw.dll"
  File "bin\vcredist_x86.exe"
  SetOutPath "$INSTDIR\bin\platforms"
  File "bin\platforms\qwindows.dll"
  SetOutPath "$INSTDIR\bin\printsupport"
  File "bin\printsupport\windowsprintersupport.dll"
  SetOutPath "$INSTDIR\bin"
  File "bin\qt.conf"
  File "bin\Qt5Core.dll"
  File "bin\Qt5DBus.dll"
  File "bin\Qt5Gui.dll"
  File "bin\Qt5Network.dll"
  File "bin\Qt5PrintSupport.dll"
  File "bin\Qt5Script.dll"
  File "bin\Qt5Svg.dll"
  File "bin\Qt5Widgets.dll"
  File "bin\Qt5Xml.dll"
  SetOutPath "$INSTDIR\bin\translations"
  File "bin\translations\qt_ca.qm"
  File "bin\translations\qt_cs.qm"
  File "bin\translations\qt_de.qm"
  File "bin\translations\qt_fi.qm"
  File "bin\translations\qt_fr.qm"
  File "bin\translations\qt_hu.qm"
  File "bin\translations\qt_it.qm"
  File "bin\translations\qt_ja.qm"
  File "bin\translations\qt_ko.qm"
  File "bin\translations\qt_lv.qm"
  File "bin\translations\qt_ru.qm"
  File "bin\translations\qt_sk.qm"
  File "bin\translations\qt_uk.qm"
  SetOutPath "$INSTDIR\bin"
  File "bin\zip.dll"
  File "bin\zlib.dll"
  SetOutPath "$INSTDIR\lib\plugins\ktexteditor"
  File "lib\plugins\ktexteditor\katebacktracebrowserplugin.dll"
  File "lib\plugins\ktexteditor\katebuildplugin.dll"
  File "lib\plugins\ktexteditor\katecloseexceptplugin.dll"
  File "lib\plugins\ktexteditor\katectagsplugin.dll"
  File "lib\plugins\ktexteditor\katefiletreeplugin.dll"
  File "lib\plugins\ktexteditor\katekonsoleplugin.dll"
  File "lib\plugins\ktexteditor\kateopenheaderplugin.dll"
  File "lib\plugins\ktexteditor\kateprojectplugin.dll"
  File "lib\plugins\ktexteditor\katereplicodeplugin.dll"
  File "lib\plugins\ktexteditor\katesearchplugin.dll"
  File "lib\plugins\ktexteditor\katesnippetsplugin.dll"
  File "lib\plugins\ktexteditor\katesymbolviewerplugin.dll"
  File "lib\plugins\ktexteditor\katexmltoolsplugin.dll"
  File "lib\plugins\ktexteditor\kterustcompletionplugin.dll"
  File "lib\plugins\ktexteditor\ktexteditor_lumen.dll"
  File "lib\plugins\ktexteditor\tabswitcherplugin.dll"
  File "lib\plugins\ktexteditor\textfilterplugin.dll"
  SetOutPath "$INSTDIR\lib\plugins"
  File "lib\plugins\spellcheckplugin.dll"
  SetOutPath "$INSTDIR\share\kf5\sonnet"
  File "share\kf5\sonnet\trigrams.map"
  SetOutPath "$INSTDIR"
  File "bin\COPYING.GPL2"
  ExecWait '"$INSTDIR\bin\vcredist_x86.exe" /passive'
  Delete "$INSTDIR\bin\vcredist_x86.exe"
SectionEnd

Section "Download English(US) Dictionary" SEC02
  SetOutPath "$INSTDIR\share\hunspell"
  inetc::get "https://cgit.freedesktop.org/libreoffice/dictionaries/plain/en/en_US.aff" "en_US.aff" "https://cgit.freedesktop.org/libreoffice/dictionaries/plain/en/en_US.dic" "en_US.dic" /end
  Pop $0
  MessageBox MB_OK "Downloading US dictionary status: $0"
SectionEnd

Section /o "Download German(DE) Dictionary" SEC03
  SetOutPath "$INSTDIR\share\hunspell"
  inetc::get "https://cgit.freedesktop.org/libreoffice/dictionaries/plain/de/de_DE_frami.aff" "de_DE.aff" "https://cgit.freedesktop.org/libreoffice/dictionaries/plain/de/de_DE_frami.dic" "de_DE.dic" /end
  Pop $0
  MessageBox MB_OK "Download German(DE) dictionary status: $0"
SectionEnd

Section /o "Download Spanish(eu_ES) Dictionary" SEC04
  SetOutPath "$INSTDIR\share\hunspell"
  inetc::get "https://cgit.freedesktop.org/libreoffice/dictionaries/plain/es/es_ANY.aff" "eu_ES.aff" "https://cgit.freedesktop.org/libreoffice/dictionaries/plain/es/es_ANY.dic" "eu_ES.dic" /end
  Pop $0
  MessageBox MB_OK "Download Spanish dictionary status: $0"
SectionEnd

Section /o "Download Swedish(SE) Dictionary" SEC05
  SetOutPath "$INSTDIR\share\hunspell"
  inetc::get "https://cgit.freedesktop.org/libreoffice/dictionaries/plain/sv_SE/sv_SE.aff" "sv_SE.aff" "https://cgit.freedesktop.org/libreoffice/dictionaries/plain/sv_SE/sv_SE.dic" "sv_SE.dic" /end
  Pop $0
  MessageBox MB_OK "Download Swedish dictionary status: $0"
SectionEnd

Section -AdditionalIcons
  SetOutPath $INSTDIR
  WriteIniStr "$INSTDIR\${PRODUCT_NAME}.url" "InternetShortcut" "URL" "${PRODUCT_WEB_SITE}"
  CreateShortCut "$SMPROGRAMS\Kate\Website.lnk" "$INSTDIR\${PRODUCT_NAME}.url"
  CreateShortCut "$SMPROGRAMS\Kate\Uninstall.lnk" "$INSTDIR\uninst.exe"
SectionEnd

Section -Post
  WriteUninstaller "$INSTDIR\uninst.exe"
  WriteRegStr HKLM "${PRODUCT_DIR_REGKEY}" "" "$INSTDIR\bin\kate.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayName" "$(^Name)"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "UninstallString" "$INSTDIR\uninst.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayIcon" "$INSTDIR\bin\kate.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayVersion" "${PRODUCT_VERSION}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "URLInfoAbout" "${PRODUCT_WEB_SITE}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "Publisher" "${PRODUCT_PUBLISHER}"

  WriteRegStr HKCR "*\shell\EditWithKate" "" "Edit with Kate"
  WriteRegStr HKCR "*\shell\EditWithKate\command" "" '"$INSTDIR\bin\kate.exe" "%V"'

SectionEnd

; Section descriptions
!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC01} "This is the Kate application"
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC02} "Download English(US) dictionary for spell-checking ..."
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC03} "Download German dictionary for spell-checking ..."
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC04} "Download Spanish dictionary for spell-checking ..."
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC05} "Download Swedish dictionary for spell-checking ..."
!insertmacro MUI_FUNCTION_DESCRIPTION_END

Function un.onUninstSuccess
  HideWindow
  MessageBox MB_ICONINFORMATION|MB_OK "$(^Name) was successfully removed from your computer."
FunctionEnd

Function un.onInit
  MessageBox MB_ICONQUESTION|MB_YESNO|MB_DEFBUTTON2 "Are you sure you want to completely remove $(^Name) and all of its components?" IDYES +2
  Abort
FunctionEnd

Section Uninstall
  Delete "$INSTDIR\${PRODUCT_NAME}.url"
  Delete "$INSTDIR\uninst.exe"
  Delete "$INSTDIR\COPYING.GPL2"
  Delete "$INSTDIR\share\kf5\sonnet\trigrams.map"
  Delete "$INSTDIR\lib\plugins\spellcheckplugin.dll"
  Delete "$INSTDIR\lib\plugins\ktexteditor\textfilterplugin.dll"
  Delete "$INSTDIR\lib\plugins\ktexteditor\tabswitcherplugin.dll"
  Delete "$INSTDIR\lib\plugins\ktexteditor\ktexteditor_lumen.dll"
  Delete "$INSTDIR\lib\plugins\ktexteditor\kterustcompletionplugin.dll"
  Delete "$INSTDIR\lib\plugins\ktexteditor\katexmltoolsplugin.dll"
  Delete "$INSTDIR\lib\plugins\ktexteditor\katesymbolviewerplugin.dll"
  Delete "$INSTDIR\lib\plugins\ktexteditor\katesnippetsplugin.dll"
  Delete "$INSTDIR\lib\plugins\ktexteditor\katesearchplugin.dll"
  Delete "$INSTDIR\lib\plugins\ktexteditor\katereplicodeplugin.dll"
  Delete "$INSTDIR\lib\plugins\ktexteditor\kateprojectplugin.dll"
  Delete "$INSTDIR\lib\plugins\ktexteditor\kateopenheaderplugin.dll"
  Delete "$INSTDIR\lib\plugins\ktexteditor\katekonsoleplugin.dll"
  Delete "$INSTDIR\lib\plugins\ktexteditor\katefiletreeplugin.dll"
  Delete "$INSTDIR\lib\plugins\ktexteditor\katectagsplugin.dll"
  Delete "$INSTDIR\lib\plugins\ktexteditor\katecloseexceptplugin.dll"
  Delete "$INSTDIR\lib\plugins\ktexteditor\katebuildplugin.dll"
  Delete "$INSTDIR\lib\plugins\ktexteditor\katebacktracebrowserplugin.dll"
  Delete "$INSTDIR\bin\zlib.dll"
  Delete "$INSTDIR\bin\zip.dll"
  Delete "$INSTDIR\bin\translations\qt_uk.qm"
  Delete "$INSTDIR\bin\translations\qt_sk.qm"
  Delete "$INSTDIR\bin\translations\qt_ru.qm"
  Delete "$INSTDIR\bin\translations\qt_lv.qm"
  Delete "$INSTDIR\bin\translations\qt_ko.qm"
  Delete "$INSTDIR\bin\translations\qt_ja.qm"
  Delete "$INSTDIR\bin\translations\qt_it.qm"
  Delete "$INSTDIR\bin\translations\qt_hu.qm"
  Delete "$INSTDIR\bin\translations\qt_fr.qm"
  Delete "$INSTDIR\bin\translations\qt_fi.qm"
  Delete "$INSTDIR\bin\translations\qt_de.qm"
  Delete "$INSTDIR\bin\translations\qt_cs.qm"
  Delete "$INSTDIR\bin\translations\qt_ca.qm"
  Delete "$INSTDIR\bin\Qt5Xml.dll"
  Delete "$INSTDIR\bin\Qt5Widgets.dll"
  Delete "$INSTDIR\bin\Qt5Svg.dll"
  Delete "$INSTDIR\bin\Qt5Script.dll"
  Delete "$INSTDIR\bin\Qt5PrintSupport.dll"
  Delete "$INSTDIR\bin\Qt5Network.dll"
  Delete "$INSTDIR\bin\Qt5Gui.dll"
  Delete "$INSTDIR\bin\Qt5DBus.dll"
  Delete "$INSTDIR\bin\Qt5Core.dll"
  Delete "$INSTDIR\bin\qt.conf"
  Delete "$INSTDIR\bin\printsupport\windowsprintersupport.dll"
  Delete "$INSTDIR\bin\platforms\qwindows.dll"
  Delete "$INSTDIR\bin\opengl32sw.dll"
  Delete "$INSTDIR\bin\libhunspell-1.3.dll"
  Delete "$INSTDIR\bin\libGLESV2.dll"
  Delete "$INSTDIR\bin\libEGL.dll"
  Delete "$INSTDIR\bin\KF5XmlGui.dll"
  Delete "$INSTDIR\bin\KF5WindowSystem.dll"
  Delete "$INSTDIR\bin\KF5WidgetsAddons.dll"
  Delete "$INSTDIR\bin\KF5ThreadWeaver.dll"
  Delete "$INSTDIR\bin\KF5TextWidgets.dll"
  Delete "$INSTDIR\bin\KF5TextEditor.dll"
  Delete "$INSTDIR\bin\KF5SonnetUi.dll"
  Delete "$INSTDIR\bin\KF5SonnetCore.dll"
  Delete "$INSTDIR\bin\KF5Solid.dll"
  Delete "$INSTDIR\bin\KF5Service.dll"
  Delete "$INSTDIR\bin\KF5Parts.dll"
  Delete "$INSTDIR\bin\KF5NewStuff.dll"
  Delete "$INSTDIR\bin\KF5KIOWidgets.dll"
  Delete "$INSTDIR\bin\KF5KIONTLM.dll"
  Delete "$INSTDIR\bin\KF5KIOFileWidgets.dll"
  Delete "$INSTDIR\bin\KF5KIOCore.dll"
  Delete "$INSTDIR\bin\KF5JobWidgets.dll"
  Delete "$INSTDIR\bin\KF5ItemViews.dll"
  Delete "$INSTDIR\bin\KF5ItemModels.dll"
  Delete "$INSTDIR\bin\KF5IconThemes.dll"
  Delete "$INSTDIR\bin\KF5I18n.dll"
  Delete "$INSTDIR\bin\KF5GuiAddons.dll"
  Delete "$INSTDIR\bin\KF5DBusAddons.dll"
  Delete "$INSTDIR\bin\KF5Crash.dll"
  Delete "$INSTDIR\bin\KF5CoreAddons.dll"
  Delete "$INSTDIR\bin\KF5ConfigWidgets.dll"
  Delete "$INSTDIR\bin\KF5ConfigGui.dll"
  Delete "$INSTDIR\bin\KF5ConfigCore.dll"
  Delete "$INSTDIR\bin\KF5Completion.dll"
  Delete "$INSTDIR\bin\KF5Codecs.dll"
  Delete "$INSTDIR\bin\KF5Bookmarks.dll"
  Delete "$INSTDIR\bin\KF5Auth.dll"
  Delete "$INSTDIR\bin\KF5Attica.dll"
  Delete "$INSTDIR\bin\KF5Archive.dll"
  Delete "$INSTDIR\bin\kate.exe"
  Delete "$INSTDIR\bin\imageformats\qwebp.dll"
  Delete "$INSTDIR\bin\imageformats\qwbmp.dll"
  Delete "$INSTDIR\bin\imageformats\qtiff.dll"
  Delete "$INSTDIR\bin\imageformats\qtga.dll"
  Delete "$INSTDIR\bin\imageformats\qsvg.dll"
  Delete "$INSTDIR\bin\imageformats\qjpeg.dll"
  Delete "$INSTDIR\bin\imageformats\qico.dll"
  Delete "$INSTDIR\bin\imageformats\qicns.dll"
  Delete "$INSTDIR\bin\imageformats\qgif.dll"
  Delete "$INSTDIR\bin\imageformats\qdds.dll"
  Delete "$INSTDIR\bin\iconengines\qsvgicon.dll"
  Delete "$INSTDIR\bin\d3dcompiler_47.dll"
  Delete "$INSTDIR\bin\breeze.rcc"
  Delete "$INSTDIR\bin\bearer\qnativewifibearer.dll"
  Delete "$INSTDIR\bin\bearer\qgenericbearer.dll"


  Delete "$SMPROGRAMS\Kate\Uninstall.lnk"
  Delete "$SMPROGRAMS\Kate\Website.lnk"
  Delete "$DESKTOP\Kate.lnk"
  Delete "$SMPROGRAMS\Kate\Kate.lnk"

  RMDir "$SMPROGRAMS\Kate"
  RMDir "$INSTDIR\share\kf5\sonnet"
  RMDir "$INSTDIR\share\kf5"
  RMDir "$INSTDIR\share"
  RMDir "$INSTDIR\lib\plugins\ktexteditor"
  RMDir "$INSTDIR\lib\plugins"
  RMDir "$INSTDIR\bin\translations"
  RMDir "$INSTDIR\bin\printsupport"
  RMDir "$INSTDIR\bin\platforms"
  RMDir "$INSTDIR\bin\imageformats"
  RMDir "$INSTDIR\bin\iconengines"
  RMDir "$INSTDIR\bin\bearer"
  RMDir "$INSTDIR\bin"
  RMDir "$INSTDIR\lib"
  RMDir "$INSTDIR"

  DeleteRegKey ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}"
  DeleteRegKey HKLM "${PRODUCT_DIR_REGKEY}"
  DeleteRegKey HKCR "*\shell\EditWithKate"

  SetAutoClose true
SectionEnd
