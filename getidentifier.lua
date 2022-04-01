local request
local identifierheader
local sha256

if syn then
    request = syn.request
    identifierheader = "Syn-User-Identifier"

    sha256 = function(...)
        return syn.crypt.custom.hash("sha256", ...)
    end
elseif identifyexecutor():lower():find("scriptware") then
    request = http.request
    identifierheader = "SW-User-Identifier"

    sha256 = function(...)
        return crypt.hash(...)
    end
end

local headers = game:GetService("HttpService"):JSONDecode(request({Url = "https://httpbin.org/get", Method = "GET"}).Body).headers

local identifier = headers[identifierheader]; identifier = sha256(identifier)

setclipboard(identifier)
