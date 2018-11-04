# Read parent file
$text = Get-Content '.\filename.txt'
 
# Initialize
$threshold = 100000
$line = 0
$i = 0
$file = 0
 
# Loop all text lines
while ($line -lt $text.Length) {
    # Display
    $i
 
    # Generate child files
    if ($i -gt $threshold) {
        $start = $line - $threshold
        $file++
        $text[0] | Out-File "out$file.txt" -Force
        $text[$start..($line-1)] | Out-File "batch$file.txt" -Append
        $i = 0
    }
 
    # Increment counters
    $i++;
    $line++
}
