function Initialize()
    UpdateGrid()
end

function UpdateGrid()
    for i = 1, 31 do
        SKIN:Bang('!ShowMeter', 'MeterDay' .. i)
        SKIN:Bang('!ShowMeter', 'MeterDate' .. i)

        local state = tonumber(SKIN:GetVariable('Day' .. i, '0'))

        if state == 1 then
            SKIN:Bang('!SetOption', 'MeterDay' .. i, 'MeterStyle', 'StyleDone')
            SKIN:Bang('!SetOption', 'MeterDate' .. i, 'FontColor', '0,0,0,255')
        else
            SKIN:Bang('!SetOption', 'MeterDay' .. i, 'MeterStyle', 'StyleTodo')
            SKIN:Bang('!SetOption', 'MeterDate' .. i, 'FontColor', '0,0,0,0')
        end
    end

    SKIN:Bang('!UpdateMeter', '*')
    SKIN:Bang('!Redraw')
end

function Toggle(dayIndex)
    local currentState = tonumber(SKIN:GetVariable('Day' .. dayIndex, '0'))
    local newState = (currentState == 0) and 1 or 0

    SKIN:Bang('!SetVariable', 'Day' .. dayIndex, newState)

    local path = SKIN:GetVariable('CURRENTPATH') .. 'Variables.inc'
    SKIN:Bang('!WriteKeyValue', 'Variables', 'Day' .. dayIndex, newState, path)

    UpdateGrid()
end
