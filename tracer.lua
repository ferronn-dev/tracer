local tracer = CreateFrame('Frame')
tracer:RegisterAllEvents()
tracer:SetScript('OnEvent', function(self, ev, ...)
  local t = { { ev, ... } }
  local n = 1
  self:SetScript('OnEvent', function(_, ...)
    n = n + 1
    t[n] = { ... }
  end)
  TracerSavedVariable = TracerSavedVariable or { sessions = {} }
  TracerSavedVariable.sessions[GetServerTime()] = { events = t }
end)
