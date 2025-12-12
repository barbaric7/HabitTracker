function Initialize()
    MeasureYear = SKIN:GetMeasure('MeasureYear')
    MeasureMonth = SKIN:GetMeasure('MeasureMonth')
    UpdateGrid()
end

function UpdateGrid()
    local year = tonumber(MeasureYear:GetString())
    local month = tonumber(MeasureMonth:GetString())
    local daysInMonth = GetDaysInMonth(month, year)

    for i = 1, 31 do
        if i > daysInMonth then
            SKIN:Bang('!HideMeter', 'MeterDay'..i)
            SKIN:Bang('!HideMeter', 'MeterDate'..i)
        else
            SKIN:Bang('!ShowMeter', 'MeterDay'..i)
            SKIN:Bang('!ShowMeter', 'MeterDate'..i)
            
            local state = tonumber(SKIN:GetVariable('Day'..i))
            if state == 1 then
                SKIN:Bang('!SetOption', 'MeterDay'..i, 'MeterStyle', 'StyleDone')
                SKIN:Bang('!SetOption', 'MeterDate'..i, 'FontColor', '0,0,0,255')
            else
                SKIN:Bang('!SetOption', 'MeterDay'..i, 'MeterStyle', 'StyleTodo')
                SKIN:Bang('!SetOption', 'MeterDate'..i, 'FontColor', '0,0,0,0')
            end
        end
    end
    
    SKIN:Bang('!UpdateMeter', '*')
    SKIN:Bang('!Redraw')
end

function Toggle(dayIndex)
    local currentState = tonumber(SKIN:GetVariable('Day'..dayIndex))
    local newState = 0
    if currentState == 0 then newState = 1 else newState = 0 end

    SKIN:Bang('!SetVariable', 'Day'..dayIndex, newState)
    SKIN:Bang('!WriteKeyValue', 'Variables', 'Day'..dayIndex, newState, SKIN:GetVariable('CURRENTPATH')..'Variables.inc')

    if newState == 1 then
        SKIN:Bang('!SetOption', 'MeterDay'..dayIndex, 'MeterStyle', 'StyleDone')
        SKIN:Bang('!SetOption', 'MeterDate'..dayIndex, 'FontColor', '0,0,0,255')
    else
        SKIN:Bang('!SetOption', 'MeterDay'..dayIndex, 'MeterStyle', 'StyleTodo')
        SKIN:Bang('!SetOption', 'MeterDate'..dayIndex, 'FontColor', '0,0,0,0')
    end
    
    SKIN:Bang('!UpdateMeter', 'MeterDay'..dayIndex)
    SKIN:Bang('!UpdateMeter', 'MeterDate'..dayIndex)
    SKIN:Bang('!Redraw')
end

function GetDaysInMonth(month, year)
    local days = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31}
    if month == 2 then
        if year % 4 == 0 and (year % 100 ~= 0 or year % 400 == 0) then
            return 29
        end
    end
    return days[month]
end