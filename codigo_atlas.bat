@echo off

REM Ruta de la carpeta actual
set "current_dir=%cd%"

echo Codigo desarrollado por Fernanda R / Eriana-129
echo Objetivo: agregar los campos requeridos para las capas de los Atlas de Riesgos de la CDMX segun su geometria
echo.
echo Requisitos: instalar Python, instalar QGis, agrega la carpeta de bin de QGis al PATH de la computadora. Listo
echo.
echo Debes ejecutar este codigo solo una vez, revisa el resultado en un SIG
echo.

REM Solicitar confirmación antes de ejecutar
set /p confirm="Deseas agregar todos los campos a todos los archivos .shp en esta carpeta y subcarpetas? (SI/NO): "
if /i not "%confirm%"=="Si" (
    echo Abortar mision :(
    pause
    exit /b
)

REM Itera sobre todos los archivos .shp en la carpeta y subcarpetas actuales y verifica el tipo de geometria
for /r "%current_dir%" %%f in (*.shp) do (
    REM Obtiene el tipo de geometria del shapefile
    for /f "tokens=2 delims=: " %%g in ('ogrinfo -so "%%f" "%%~nf" ^| findstr /r /c:"Geometry: Point" /c:"Geometry: Line" /c:"Geometry: Polygon"') do (
        if "%%g"=="Point" (
            REM Agrega los campos al archivo .dbf correspondiente para puntos
            ogrinfo "%%f" -sql "ALTER TABLE \"%%~nf\" ADD COLUMN FENOMENO text (50)"
            ogrinfo "%%f" -sql "ALTER TABLE \"%%~nf\" ADD COLUMN TAXONOMIA text (50)"
            ogrinfo "%%f" -sql "ALTER TABLE \"%%~nf\" ADD COLUMN R_P_V_E text (20)"
            ogrinfo "%%f" -sql "ALTER TABLE \"%%~nf\" ADD COLUMN INTENSIDAD text (8)"
            ogrinfo "%%f" -sql "ALTER TABLE \"%%~nf\" ADD COLUMN DESCRIPCIO text (254)"
            ogrinfo "%%f" -sql "ALTER TABLE \"%%~nf\" ADD COLUMN DETALLES text (254)"
            ogrinfo "%%f" -sql "ALTER TABLE \"%%~nf\" ADD COLUMN NOMBRE text (254)"
            ogrinfo "%%f" -sql "ALTER TABLE \"%%~nf\" ADD COLUMN FUENTE text (254)"
            ogrinfo "%%f" -sql "ALTER TABLE \"%%~nf\" ADD COLUMN MAGNI_UNI text (110)"
            ogrinfo "%%f" -sql "ALTER TABLE \"%%~nf\" ADD COLUMN MAGNI_NUM real (17,3)"
            ogrinfo "%%f" -sql "ALTER TABLE \"%%~nf\" ADD COLUMN CALLE_Y_NU text (254)"
            ogrinfo "%%f" -sql "ALTER TABLE \"%%~nf\" ADD COLUMN COLONIA text (254)"
            ogrinfo "%%f" -sql "ALTER TABLE \"%%~nf\" ADD COLUMN CVE_MUN text (5)"
            ogrinfo "%%f" -sql "ALTER TABLE \"%%~nf\" ADD COLUMN ALCALDIA text (110)"
            ogrinfo "%%f" -sql "ALTER TABLE \"%%~nf\" ADD COLUMN ENTIDAD text (110)"
            ogrinfo "%%f" -sql "ALTER TABLE \"%%~nf\" ADD COLUMN LATITUD real (10,6)"
            ogrinfo "%%f" -sql "ALTER TABLE \"%%~nf\" ADD COLUMN LONGITUD real (10,6)"
            ogrinfo "%%f" -sql "ALTER TABLE \"%%~nf\" ADD COLUMN ALTITUD real (12,3)"
        ) else (
            if "%%g"=="Line" (
                REM Agrega los campos al archivo .dbf correspondiente para lineas
                ogrinfo "%%f" -sql "ALTER TABLE \"%%~nf\" ADD COLUMN FENOMENO text (50)"
                ogrinfo "%%f" -sql "ALTER TABLE \"%%~nf\" ADD COLUMN TAXONOMIA text (50)"
                ogrinfo "%%f" -sql "ALTER TABLE \"%%~nf\" ADD COLUMN R_P_V_E text (20)"
                ogrinfo "%%f" -sql "ALTER TABLE \"%%~nf\" ADD COLUMN INTENSIDAD text (8)"
                ogrinfo "%%f" -sql "ALTER TABLE \"%%~nf\" ADD COLUMN DESCRIPCIO text (254)"
                ogrinfo "%%f" -sql "ALTER TABLE \"%%~nf\" ADD COLUMN DETALLES text (254)"
                ogrinfo "%%f" -sql "ALTER TABLE \"%%~nf\" ADD COLUMN NOMBRE text (254)"
                ogrinfo "%%f" -sql "ALTER TABLE \"%%~nf\" ADD COLUMN FUENTE text (254)"
                ogrinfo "%%f" -sql "ALTER TABLE \"%%~nf\" ADD COLUMN MAGNI_UNI text (110)"
                ogrinfo "%%f" -sql "ALTER TABLE \"%%~nf\" ADD COLUMN MAGNI_NUM real (17,3)"
                ogrinfo "%%f" -sql "ALTER TABLE \"%%~nf\" ADD COLUMN CVE_MUN text (5)"
                ogrinfo "%%f" -sql "ALTER TABLE \"%%~nf\" ADD COLUMN ALCALDIA text (110)"
                ogrinfo "%%f" -sql "ALTER TABLE \"%%~nf\" ADD COLUMN ENTIDAD text (110)"
                ogrinfo "%%f" -sql "ALTER TABLE \"%%~nf\" ADD COLUMN LONGITUD real (19,2)"
            ) else (
                if "%%g"=="Polygon" (
                    REM Agrega los campos al archivo .dbf correspondiente para poligonos
                    ogrinfo "%%f" -sql "ALTER TABLE \"%%~nf\" ADD COLUMN FENOMENO text (50)"
                    ogrinfo "%%f" -sql "ALTER TABLE \"%%~nf\" ADD COLUMN TAXONOMIA text (50)"
                    ogrinfo "%%f" -sql "ALTER TABLE \"%%~nf\" ADD COLUMN R_P_V_E text (20)"
                    ogrinfo "%%f" -sql "ALTER TABLE \"%%~nf\" ADD COLUMN INTENSIDAD text (8)"
                    ogrinfo "%%f" -sql "ALTER TABLE \"%%~nf\" ADD COLUMN DESCRIPCIO text (254)"
                    ogrinfo "%%f" -sql "ALTER TABLE \"%%~nf\" ADD COLUMN DETALLES text (254)"
                    ogrinfo "%%f" -sql "ALTER TABLE \"%%~nf\" ADD COLUMN NOMBRE text (254)"
                    ogrinfo "%%f" -sql "ALTER TABLE \"%%~nf\" ADD COLUMN FUENTE text (254)"
                    ogrinfo "%%f" -sql "ALTER TABLE \"%%~nf\" ADD COLUMN MAGNI_UNI text (110)"
                    ogrinfo "%%f" -sql "ALTER TABLE \"%%~nf\" ADD COLUMN MAGNI_NUM real (17,3)"
                    ogrinfo "%%f" -sql "ALTER TABLE \"%%~nf\" ADD COLUMN CVE_MUN text (5)"
                    ogrinfo "%%f" -sql "ALTER TABLE \"%%~nf\" ADD COLUMN ALCALDIA text (110)"
                    ogrinfo "%%f" -sql "ALTER TABLE \"%%~nf\" ADD COLUMN ENTIDAD text (110)"
                    ogrinfo "%%f" -sql "ALTER TABLE \"%%~nf\" ADD COLUMN AREA_M2 real (19,2)"
                    ogrinfo "%%f" -sql "ALTER TABLE \"%%~nf\" ADD COLUMN PERIME_M real (19,2)"
                )
            )
        )
    )
)

echo.
echo Campos agregados a todos los archivos shapefile en la carpeta y sus subcarpetas segun su tipo de geometria
echo.
echo Debes ejecutar este codigo solo una vez, revisa el resultado en un SIG
echo.
echo Desarrollado por Fernanda R / Eriana-129
pause
