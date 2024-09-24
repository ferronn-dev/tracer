local tick = 0
local tracer = CreateFrame('Frame')
tracer:RegisterAllEvents()
tracer:SetScript('OnUpdate', function()
  tick = tick + 1
end)
tracer:SetScript('OnEvent', function(_, ...)
  local t, n = { { tick, debugstack(2, 1000, 1000), ... } }, 1
  TracerSavedVariable = TracerSavedVariable or { sessions = {} }
  TracerSavedVariable.sessions[GetServerTime()] = { events = t }
  tracer:SetScript('OnEvent', function(_, ...)
    n = n + 1
    t[n] = { tick, debugstack(2, 1000, 1000), ... }
  end)
end)
