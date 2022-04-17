local request
local identifierheader

if syn then
    request = syn.request
    identifierheader = "Syn-User-Identifier"
elseif identifyexecutor():lower():find("scriptware") then
    request = http.request
    identifierheader = "Sw-User-Identifier"
end

local headers = game:GetService("HttpService"):JSONDecode(request({Url = "https://httpbin.org/get", Method = "GET"}).Body).headers

local identifier = headers[identifierheader]

setclipboard(identifier)
