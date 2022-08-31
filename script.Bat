::prerequisites: git, nuget, msbuild (visual studio commandline build tools)
::if installing nuget from scoop, make sure that your nuget.config has the official nuget repository as a source

::add two colons (::) before the line of the command on whatever step you wish to skip that step alltogether
::open/execute with vsdev/msbuild powershell
::run me by adding .\ before the filename

::this makes sure to grab the latest modifications done to fedoraware
git pull

::this satisfies all the dependencies required to compile fedoraware
nuget restore Fedoraware

::this is the actual command that compiles fedoraware into a DLL
::if you are having framerate/performance issues with your new binary/DLL, change "AVX2" (no quotation marks) with the enhanced instruction set your CPU supports, check it using CPU-Z otherwise, get a new PC or get a new SSD/Ram.
msbuild /m /p:PlatformToolset="v143" /p:Configuration=Release /p:PlatformTarget=x86 /p:Platform=x86 /p:Instruction_Set=AVX2 Fedoraware

::this deletes your old copy that you probably have gotten from fedoraware's github actions, and subsequently any older builds you may have compiled either manually or with this script.
::delete old copy, specify your old DLL's location here, KEEP the quotation marks.
rm "C:\Specify\Old\DLL\Here\Fware(Release).dll"

::this copies the new compiled DLL into the folder you specified.
::customize the 2nd part with your own directory you want
cp "Fedoraware/Release/Fware(Release).dll" "C:\Specify\Where\To\Put\New\DLL\Here\"
