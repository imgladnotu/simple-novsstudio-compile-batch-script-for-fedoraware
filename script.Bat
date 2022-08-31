::prerequisites: git, nuget, msbuild (visual studio commandline build tools)
::if installing nuget from scoop, make sure that your nuget.config has the official nuget repository as a source

::open/execute with vsdev/msbuild powershell

::run me by adding .\ before the filename

git pull

nuget restore Fedoraware

::if you are having framerate/performance issues with your new binary/DLL, change "AVX2" (no quotation marks) with the enhanced instruction set your CPU supports, check it using CPU-Z otherwise, get a new PC or get a new SSD/Ram.
msbuild /m /p:PlatformToolset="v143" /p:Configuration=Release /p:PlatformTarget=x86 /p:Platform=x86 /p:Instruction_Set=AVX2 Fedoraware

::delete old copy, specify your old DLL's location here, KEEP the quotation marks.
rm "C:\Users\Charlie-Delta-Echo\Desktop\ldr\Fware(Release).dll"

::customize the 2nd part with your own directory you want
cp "Fedoraware/Release/Fware(Release).dll" "C:\Users\Charlie-Delta-Echo\Desktop\ldr\"
