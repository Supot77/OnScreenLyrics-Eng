local lyricsTable = {}
local currentActiveIndex = 0

function Initialize()
    -- ทำงานเมื่อเริ่มโหลดสกิน
end

function Update()
    local positionStr = SKIN:GetMeasure('mPosition'):GetStringValue()
    local currentSecs = timeToSeconds(positionStr)
    
    if #lyricsTable > 0 then
        local newIndex = 0
        
        for i = 1, #lyricsTable do
            if currentSecs >= lyricsTable[i].time then
                newIndex = i
            else
                break
            end
        end
        
        if newIndex ~= currentActiveIndex then
            currentActiveIndex = newIndex
            updateMeters(currentActiveIndex)
        end
    end
end

-- ดึงข้อมูลเนื้อเพลงโดยตรงจาก Measure mParseLyrics
function LoadLyrics()
    local rawLyrics = SKIN:GetMeasure('mParseLyrics'):GetStringValue()
    
    lyricsTable = {}
    currentActiveIndex = 0
    
    if rawLyrics == nil or rawLyrics == "" or rawLyrics == "NO LYRICS AVAILABLE" then
        updateMeters(0)
        return
    end

    -- แยกเวลาและเนื้อเพลงทีละบรรทัด
    for min, sec, text in string.gmatch(rawLyrics, "%[(%d+):(%d+%.?%d*)%]([^|]*)") do
        local timeInSeconds = tonumber(min) * 60 + tonumber(sec)
        local cleanText = text:match("^%s*(.-)%s*$") or ""
        table.insert(lyricsTable, {time = timeInSeconds, text = cleanText})
    end
    
    updateMeters(0)
end

function timeToSeconds(timeStr)
    local m, s = string.match(timeStr, "(%d+):(%d+)")
    if m and s then
        return tonumber(m) * 60 + tonumber(s)
    end
    return 0
end

function updateMeters(index)
    local prevLine = ""
    local currLine = "..."
    local nextLine = ""
    
    if index > 0 and #lyricsTable > 0 then
        if index - 1 > 0 then prevLine = lyricsTable[index - 1].text end
        currLine = lyricsTable[index].text
        if index + 1 <= #lyricsTable then nextLine = lyricsTable[index + 1].text end
    elseif #lyricsTable == 0 then
        currLine = "No Synced Lyrics Found"
    end
    
    SKIN:Bang('!SetOption', 'MeterPrev', 'Text', prevLine)
    SKIN:Bang('!SetOption', 'MeterCurr', 'Text', currLine)
    SKIN:Bang('!SetOption', 'MeterNext', 'Text', nextLine)
end