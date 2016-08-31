ls "%CONDA_PREFIX%"\include\ibex
SET DISTUTILS_USE_SDK=1
SET MSSdk=1
"%WIN_SDK_ROOT%\%WINDOWS_SDK_VERSION%\Setup\WindowsSdkVer.exe" -q -version:15
"%WIN_SDK_ROOT%\%WINDOWS_SDK_VERSION%\Bin\SetEnv.cmd" /x64 /MT /release
set PY_VCRUNTIME_REDIST=C:\Miniconda35-x64\envs\_build\Library\bin\vcruntime140.dll
set "VS_VERSION=14.0"
set "VS_MAJOR=14"
set "VS_YEAR=2015"

mkdir build
cd build
cmake -G "%CMAKE_GENERATOR%" -DCMAKE_INSTALL_PREFIX="%CONDA_PREFIX%" ..
if errorlevel 1 exit 1

set MSBuildLogger="C:\Program Files\AppVeyor\BuildAgent\Appveyor.MSBuildLogger.dll"
cmake --build . --config Release --target install_python

if errorlevel 1 exit 1

:: Add more build steps here, if they are necessary.

:: See
:: http://docs.continuum.io/conda/build.html
:: for a list of environment variables that are set during the build process.
