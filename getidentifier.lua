local request
local identifierheader
local sha256

if syn then
    request = syn.request
    identifierheader = "Syn-User-Identifier"
elseif identifyexecutor():lower():find("scriptware") then
    request = http.request
    identifierheader = "SW-User-Identifier"
end

local headers = game:GetService("HttpService"):JSONDecode(request({Url = "https://httpbin.org/get", Method = "GET"}).Body).headers

local identifier = headers[identifierheader]; identifier = sha256(identifier)

setclipboard(identifier)
