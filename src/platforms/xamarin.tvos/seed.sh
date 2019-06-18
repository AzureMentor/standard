#!/bin/bash

ScriptDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SeedAssemblies="mscorlib.dll;System.dll;System.Core.dll;System.ComponentModel.Composition.dll;System.Data.dll;System.IO.Compression.dll;System.IO.Compression.FileSystem.dll;System.Net.Http.dll;System.Numerics.dll;System.Numerics.Vectors.dll;System.Runtime.Serialization.dll;System.Transactions.dll;System.Xml.dll;System.Xml.Linq.dll;System.Web.Services.dll"

FacadeSeedAssemblies="System.Globalization.Extensions.dll;System.Diagnostics.StackTrace.dll;System.Runtime.Serialization.Xml.dll;System.Runtime.Serialization.Primitives.dll;System.Security.Cryptography.Algorithms.dll;System.Security.SecureString.dll;System.Xml.XPath.XDocument.dll"

# You may need to update the path below to Microsoft.DotNet.GenAPI.dll to be relative to your package cache, and to use the current version of the package
$ScriptDir/../../Tools/dotnetcli/dotnet $ScriptDir/../../packages/microsoft.dotnet.genapi/1.0.0-beta.18523.13/tools/netcoreapp2.1/Microsoft.DotNet.GenAPI.dll -assembly $SeedAssemblies -libPath /Library/Frameworks/Xamarin.iOS.framework/Versions/Current/lib/mono/Xamarin.TVOS/ -out $ScriptDir -excludeAttributesList $ScriptDir/../attributeExcludeList.txt -headerFile $ScriptDir/../../netstandard/ref/license-header.txt
$ScriptDir/../../Tools/dotnetcli/dotnet $ScriptDir/../../packages/microsoft.dotnet.genapi/1.0.0-beta.18523.13/tools/netcoreapp2.1/Microsoft.DotNet.GenAPI.dll -assembly "OpenTK-1.0.dll;Xamarin.TVOS.dll" -libPath /Library/Frameworks/Xamarin.iOS.framework/Versions/Current/lib/mono/Xamarin.TVOS/ -out $ScriptDir -excludeAttributesList $ScriptDir/../attributeExcludeList.txt -headerFile $ScriptDir/../../netstandard/ref/license-header.txt -excludeApiList $ScriptDir/apiExcludeList.txt

$ScriptDir/../../Tools/dotnetcli/dotnet $ScriptDir/../../packages/microsoft.dotnet.genapi/1.0.0-beta.18523.13/tools/netcoreapp2.1/Microsoft.DotNet.GenAPI.dll -assembly $FacadeSeedAssemblies -libPath /Library/Frameworks/Xamarin.iOS.framework/Versions/Current/lib/mono/Xamarin.TVOS/Facades -out $ScriptDir/Facades -excludeAttributesList $ScriptDir/../attributeExcludeList.txt -headerFile $ScriptDir/../../netstandard/ref/license-header.txt
