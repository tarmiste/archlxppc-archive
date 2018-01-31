QMAKE_PROJECT_DEPTH = 0
linux-g++-64: libsuff=64

TARGET		 = qtiplot
TEMPLATE	 = app
CONFIG		+= qt warn_on exceptions opengl
CONFIG		+= thread
CONFIG		+= release
#CONFIG		+= debug

MOC_DIR		 = ../tmp/qtiplot
OBJECTS_DIR	 = ../tmp/qtiplot
DESTDIR		 = ./
DEFINES		+= QT_PLUGIN

#############################################################################
##################### QAssistant ############################################
#!!! Warning: You must modify these paths according to your computer settings
#############################################################################

unix:LIBS         +=  /opt/qt/lib/libqassistantclient.a
unix:INCLUDEPATH += /usr/include/gsl/

#############################################################################
##################### 3rd PARTY HEADER FILES SECTION ########################
#!!! Warning: You must modify these paths according to your computer settings
#############################################################################

unix:INCLUDEPATH += /opt/qt/include/qwt/
unix:INCLUDEPATH += /opt/qt/include/qwtplot3d/

# liborigin
unix:INCLUDEPATH += /usr/include/

#INCLUDEPATH       += ../3rdparty/qwt/src
#INCLUDEPATH       += ../3rdparty/qwtplot3d/include
#INCLUDEPATH		  += ../3rdparty/liborigin
#unix:INCLUDEPATH  += ../3rdparty/gsl/include
#win32:INCLUDEPATH += ../3rdparty/WinGSL
#INCLUDEPATH       += ../3rdparty/zlib123/include

#############################################################################
##################### 3rd PARTY LIBRARIES SECTION ###########################
#!!! Warning: You must modify these paths according to your computer settings
#############################################################################

##################### Linux (Mac OS X) ######################################

unix:LIBS  += /usr/lib/libgsl.a
unix:LIBS  += /usr/lib/libgslcblas.a
unix:LIBS  += /usr/lib/liborigin.so.0.0.1
unix:LIBS  += /opt/qt/lib/libqwt.so
unix:LIBS  += /opt/qt/lib/libqwtplot3d.so

#unix:LIBS         += ../3rdparty/qwtplot3d/lib/libqwtplot3d.a
#unix:LIBS         +=
#unix:LIBS         += ../3rdparty/liborigin/liborigin.a
#unix:LIBS         += ../3rdparty/gsl/lib/libgsl.a
#unix:LIBS         += ../3rdparty/gsl/lib/libgslcblas.a

unix:target.path=/usr/bin
unix:INSTALLS += target

unix:documentation.path = /usr/share/doc/qtiplot
unix:documentation.files = doc/*
unix:INSTALLS += documentation

##################### Windows ###############################################
win32:DEFINES     += QT_DLL QT_THREAD_SUPPORT GSL_DLL
win32:LIBS        += ../3rdparty/qwtplot3d/lib/qwtplot3d.lib
win32:LIBS        += ../3rdparty/qwt/lib/qwt.lib
win32:LIBS        += ../3rdparty/WinGSL/Lib/WinGsl.lib
win32:LIBS		  += ../3rdparty/liborigin/liborigin.lib
win32:LIBS		  += ../3rdparty/zlib123/lib/zdll.lib

#############################################################################
###################### PROJECT FILES SECTION ################################
#############################################################################

###################### ICONS ################################################

win32:RC_FILE     = icons/qtiplot.rc
mac:RC_FILE       = icons/qtiplot.icns

###################### TRANSLATIONS #########################################

TRANSLATIONS      = translations/qtiplot_de.ts \
			        translations/qtiplot_es.ts \
			        translations/qtiplot_fr.ts \
			        translations/qtiplot_ru.ts \
			        translations/qtiplot_sv.ts

#system(lupdate -verbose qtiplot.pro)
#system(lrelease -verbose qtiplot.pro)

###################### HEADERS ##############################################

HEADERS  += src/application.h \
     src/graph.h \
     src/graph3D.h \
     src/worksheet.h \
     src/curvesDialog.h \
     src/valuesDialog.h \
     src/plotDialog.h \
     src/plot3DDialog.h \
     src/plotWizard.h \
     src/exportDialog.h \
     src/importDialog.h \
     src/axesDialog.h \
     src/pieDialog.h \
     src/polynomFitDialog.h \
     src/expDecayDialog.h \
     src/functionDialog.h \
     src/fitDialog.h \
     src/surfaceDialog.h \
     src/tableDialog.h \
     src/textDialog.h \
     src/lineDlg.h \
     src/scalePicker.h \
     src/canvaspicker.h \
     src/ErrorBar.h \
     src/pie.h \
     src/errDlg.h \
     src/LegendMarker.h \
     src/LineMarker.h\
     src/ImageMarker.h\
     src/imageDialog.h \
     src/fit.h \
     src/nrutil.h\
     src/pixmaps.h\
     src/multilayer.h\
     src/layerDialog.h \
     src/intDialog.h \
     src/sortDialog.h\
         src/bars.h \
         src/cones.h \
         src/configDialog.h \
         src/BarCurve.h \
         src/BoxCurve.h \
         src/Histogram.h \
         src/VectorCurve.h \
     src/scales.h \
         src/imageExportDialog.h \
         src/matrix.h \
         src/matrixDialog.h \
         src/matrixSizeDialog.h \
         src/matrixValuesDialog.h \
     src/analysisDialog.h \
         src/parser.h \
         src/colorBox.h \
         src/symbolBox.h \
         src/patternBox.h \
         src/importOPJ.h\
         src/symbolDialog.h \
         src/plot.h \
         src/colorButton.h \
         src/associationsDialog.h \
         src/renameWindowDialog.h \
         src/widget.h \
         src/interpolationDialog.h\
         src/fileDialogs.h\
         src/epsExportDialog.h\
         src/smoothCurveDialog.h\
         src/filterDialog.h\
         src/fftDialog.h\
         src/note.h\
         src/folder.h\
         src/findDialog.h\
         src/Scripting.h\
         src/scriptedit.h\
         src/FunctionCurve.h\
         src/Fitter.h\
         src/customEvents.h\
         src/ScriptingLangDialog.h\
         src/ScriptWindow.h\
         src/TableStatistics.h\
         src/Spectrogram.h\
         src/ColorMapEditor.h

###################### SOURCES  ##############################################

SOURCES  += src/application.cpp \
     src/graph.cpp \
     src/analysis.cpp \
     src/graph3D.cpp \
     src/worksheet.cpp \
     src/valuesDialog.cpp \
     src/curvesDialog.cpp \
     src/plotDialog.cpp \
     src/plot3DDialog.cpp \
     src/plotWizard.cpp \
     src/exportDialog.cpp \
     src/importDialog.cpp \
     src/axesDialog.cpp \
     src/pieDialog.cpp \
     src/polynomFitDialog.cpp \
     src/tableDialog.cpp \
     src/textDialog.cpp \
     src/scalePicker.cpp \
     src/canvaspicker.cpp \
     src/expDecayDialog.cpp \
     src/functionDialog.cpp \
     src/fitDialog.cpp \
     src/surfaceDialog.cpp \
     src/lineDlg.cpp \
     src/ErrorBar.cpp \
     src/pie.cpp \
     src/errDlg.cpp \
     src/LegendMarker.cpp \
     src/LineMarker.cpp \
     src/ImageMarker.cpp\
     src/imageDialog.cpp \
     src/multilayer.cpp\
     src/layerDialog.cpp \
     src/intDialog.cpp \
     src/sortDialog.cpp\
         src/bars.cpp \
         src/cones.cpp \
     src/analysisDialog.cpp \
         src/configDialog.cpp \
         src/BarCurve.cpp \
         src/BoxCurve.cpp \
         src/Histogram.cpp \
         src/VectorCurve.cpp \
         src/imageExportDialog.cpp \
         src/matrix.cpp \
         src/matrixDialog.cpp \
         src/matrixSizeDialog.cpp \
         src/matrixValuesDialog.cpp \
         src/parser.cpp\
         src/colorBox.cpp \
         src/symbolBox.cpp \
         src/patternBox.cpp \
         src/importOPJ.cpp\
         src/main.cpp \
         src/symbolDialog.cpp \
         src/plot.cpp \
         src/colorButton.cpp \
         src/associationsDialog.cpp \
         src/renameWindowDialog.cpp \
         src/widget.cpp\
         src/interpolationDialog.cpp\
         src/epsExportDialog.cpp\
         src/nrutil.cpp\
     src/fit.cpp\
         src/smoothCurveDialog.cpp\
         src/filterDialog.cpp\
         src/fftDialog.cpp\
         src/note.cpp\
         src/folder.cpp\
         src/findDialog.cpp\
         src/scriptedit.cpp\
         src/fileDialogs.cpp\
     src/scales.cpp\
         src/FunctionCurve.cpp\
         src/Fitter.cpp\
         src/Scripting.cpp\
         src/ScriptingLangDialog.cpp\
         src/ScriptWindow.cpp\
         src/TableStatistics.cpp\
         src/Spectrogram.cpp\
         src/ColorMapEditor.cpp

###############################################################
##################### Compression (zlib123) ###################
###############################################################

SOURCES   +=../3rdparty/zlib123/minigzip.c

###############################################################
##################### SCRIPTING LANGUAGES SECTION #############
###############################################################

 SCRIPTING_LANGS = muParser
 DEFINES	+= SCRIPTING_CONSOLE
 DEFINES	+= SCRIPTING_DIALOG

# Python support is unstable; use at your own risk
unix:SCRIPTING_LANGS += Python

##################### Default: muParser v1.26 #################
contains(SCRIPTING_LANGS, muParser) {
  DEFINES +=	SCRIPTING_MUPARSER
  HEADERS +=	src/muParserScripting.h \
		../3rdparty/muParser/muParser.h \
		../3rdparty/muParser/muParserBase.h \
		../3rdparty/muParser/muParserInt.h \
		../3rdparty/muParser/muParserError.h \
		../3rdparty/muParser/muParserStack.h \
		../3rdparty/muParser/muParserToken.h \
		../3rdparty/muParser/muParserBytecode.h \
		../3rdparty/muParser/muParserCallback.h \
		../3rdparty/muParser/muParserTokenReader.h \
		../3rdparty/muParser/muParserFixes.h \
		../3rdparty/muParser/muParserDef.h
  SOURCES +=	src/muParserScripting.cpp \
		../3rdparty/muParser/muParser.cpp \
		../3rdparty/muParser/muParserBase.cpp \
		../3rdparty/muParser/muParserInt.cpp \
		../3rdparty/muParser/muParserBytecode.cpp \
		../3rdparty/muParser/muParserCallback.cpp \
		../3rdparty/muParser/muParserTokenReader.cpp \
		../3rdparty/muParser/muParserError.cpp
}

##################### PYTHON + SIP + PyQT #####################
contains(SCRIPTING_LANGS, Python) {
  DEFINES +=	SCRIPTING_PYTHON
  HEADERS +=	src/PythonScripting.h
  SOURCES +=	src/PythonScripting.cpp

 unix {
      INCLUDEPATH += $$system(python -c 'from distutils import sysconfig; print sysconfig.get_python_inc()')
  	LIBS +=	$$system(python -c 'from distutils import sysconfig; print "-lpython"+sysconfig.get_config_var("VERSION")')
  	LIBS +=	-lm
      system(mkdir -p $${MOC_DIR})
      unix:system(sip -I /usr/share/sip -t Qt_3_3_0 -t WS_X11 -c $${MOC_DIR} src/qti.sip)
 	}

 macx {
      INCLUDEPATH += /Library/Frameworks/Python.framework/Versions/2.5/include/python2.5/
  	LIBS +=	-framework Python -lm
      system(mkdir -p $${MOC_DIR})
      system(sip -I/Library/Frameworks/Python.framework/Versions/2.5/share/sip -t Qt_3_3_0 -t WS_X11 -c $${MOC_DIR} src/qti.sip)
 	}

  win32 {
    #!!! Warning: on Windows only with QtiPlot 0.9 version and Qt4
    INCLUDEPATH += C:/Python24/include
    #LIBS += C:/Python24/libs/libpython24.a
    LIBS += C:\Windows\System32\python24.dll
    system(md $${MOC_DIR})
    system(C:\Python24\sip.exe -I C:\Python24\sip\PyQt4 -t Qt_4_2_1 -t WS_WIN -c $${MOC_DIR} src/qti.sip)
    }

##################### SIP generated files #####################
  HEADERS +=\
	 ../tmp/qtiplot/sipqtiApplicationWindow.h\
	 ../tmp/qtiplot/sipqtiGraph.h\
	 ../tmp/qtiplot/sipqtiLineMarker.h\
	 ../tmp/qtiplot/sipqtiMultiLayer.h\
	 ../tmp/qtiplot/sipqtiTable.h\
	 ../tmp/qtiplot/sipqtimyWidget.h\
	 ../tmp/qtiplot/sipqtiScriptEdit.h\
	 ../tmp/qtiplot/sipqtiNote.h\
	 ../tmp/qtiplot/sipqtiFit.h\
	 ../tmp/qtiplot/sipqtiExponentialFit.h\
	 ../tmp/qtiplot/sipqtiTwoExpFit.h\
	 ../tmp/qtiplot/sipqtiThreeExpFit.h\
	 ../tmp/qtiplot/sipqtiSigmoidalFit.h\
	 ../tmp/qtiplot/sipqtiGaussAmpFit.h\
	 ../tmp/qtiplot/sipqtiLorentzFit.h\
	 ../tmp/qtiplot/sipqtiNonLinearFit.h\
	 ../tmp/qtiplot/sipqtiPluginFit.h\
	 ../tmp/qtiplot/sipqtiMultiPeakFit.h\
	 ../tmp/qtiplot/sipqtiPolynomialFit.h\
	 ../tmp/qtiplot/sipqtiLinearFit.h\
	 ../tmp/qtiplot/sipqtiMatrix.h\
	 ../tmp/qtiplot/sipqtiGaussFit.h\
	 ../tmp/qtiplot/sipqtiPythonScript.h\
	 ../tmp/qtiplot/sipqtiFolder.h\
	 ../tmp/qtiplot/sipqtiQPtrList.h
  SOURCES +=\
	 ../tmp/qtiplot/sipqticmodule.cpp\
	 ../tmp/qtiplot/sipqtiApplicationWindow.cpp\
	 ../tmp/qtiplot/sipqtiGraph.cpp\
	 ../tmp/qtiplot/sipqtiLineMarker.cpp\
	 ../tmp/qtiplot/sipqtiMultiLayer.cpp\
	 ../tmp/qtiplot/sipqtiTable.cpp\
	 ../tmp/qtiplot/sipqtimyWidget.cpp\
	 ../tmp/qtiplot/sipqtiScriptEdit.cpp\
	 ../tmp/qtiplot/sipqtiNote.cpp\
	 ../tmp/qtiplot/sipqtiFit.cpp\
	 ../tmp/qtiplot/sipqtiExponentialFit.cpp\
	 ../tmp/qtiplot/sipqtiTwoExpFit.cpp\
	 ../tmp/qtiplot/sipqtiThreeExpFit.cpp\
	 ../tmp/qtiplot/sipqtiSigmoidalFit.cpp\
	 ../tmp/qtiplot/sipqtiGaussAmpFit.cpp\
	 ../tmp/qtiplot/sipqtiLorentzFit.cpp\
	 ../tmp/qtiplot/sipqtiNonLinearFit.cpp\
	 ../tmp/qtiplot/sipqtiPluginFit.cpp\
	 ../tmp/qtiplot/sipqtiMultiPeakFit.cpp\
	 ../tmp/qtiplot/sipqtiPolynomialFit.cpp\
	 ../tmp/qtiplot/sipqtiLinearFit.cpp\
	 ../tmp/qtiplot/sipqtiMatrix.cpp\
	 ../tmp/qtiplot/sipqtiGaussFit.cpp\
	 ../tmp/qtiplot/sipqtiPythonScript.cpp\
	 ../tmp/qtiplot/sipqtiFolder.cpp\
	 ../tmp/qtiplot/sipqtiQPtrList.cpp
}
###############################################################
