# Search then replace text in multiple files.
# Programming language: Powershell.

function replaceInFile($fileList, $searchReplaces)
{
  $encoding = [Text.Encoding]::GetEncoding("Shift_JIS");
  foreach ($file in $fileList)
  {
    $c = [IO.File]::ReadAllText($file.FullName, $encoding);
    foreach ($searchReplace in $searchReplaces)
    {
        $c = $c -replace $searchReplace[0], $searchReplace[1]
    }
    [IO.File]::WriteAllText($file.FullName, $c, $encoding);
  }
}

$fileList = Get-ChildItem testData *.txt -Recurse
replaceInFile $fileList @(("search 1","replace 1"), ("search 2", "replace 2"))