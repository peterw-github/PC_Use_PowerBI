
# Location of streaming dataset in PowerBI web app:
$endpoint = "https://api.powerbi.com/beta/d02378ec-1688-46d5-8540-1c28b5f470f6/datasets/9d0cc97c-5cd7-4d31-95bd-f4e006e549b5/rows?key=GkDiWTovlXKBhVTSL6aPmzOyfRa7h0hbwFvraxRv86TVLzoajod6MUMVGdv3%2BK00pekPW9uF%2FAKTuCTMx4%2FfwQ%3D%3D"

while ($true) {


    # Collect current date and time (local to PC), down to the second
    $DateTime = (Get-Date).ToString("yyyy-MM-ddTHH:mm:ss")

    # Collect CPU Utilisation:
    $CPU_Usage = (Get-WmiObject  -Class win32_processor -ErrorAction Stop | Measure-Object -Property LoadPercentage -Average | Select-Object Average).Average

    # Collect Memory Utilisation:
    $ComputerMemory = Get-WmiObject  -Class win32_operatingsystem -ErrorAction Stop
    $UsedMemory = $ComputerMemory.TotalVisibleMemorySize - $ComputerMemory.FreePhysicalMemory
    $Memory = (($UsedMemory / $ComputerMemory.TotalVisibleMemorySize) * 100)
    $Mem_Usage = [math]::Round($Memory, 2)



    # Build payload from collected information:
    $payload = @{
    "DateTime" = $DateTime
    "CPU_Usage" = $CPU_Usage
    "Mem_Usage" = $Mem_Usage
    }

    # Transmit payload to streaming dataset, via address (endpoint), provided in API info of powerbi:
    Invoke-RestMethod -Method Post -Uri "$endpoint" -Body (ConvertTo-Json @($payload))


    # Wait 2 seconds (Warning, lower value means increased performance usage from script itself):
    Start-Sleep 2

}