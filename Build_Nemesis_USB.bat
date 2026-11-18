@echo off
setlocal EnableExtensions EnableDelayedExpansion
chcp 65001 >nul
pushd "%~dp0"
title Hyundai / Kia / Genesis Gen5W Cross-Region Map Updater Creator v5.3 (Universal Standalone Script)
color 0B

:: ============================================================================
:: Arabic dialog texts are Base64 (UTF-8) so this file stays pure ASCII.
:: The helper PowerShell script and the car-side update.sh are embedded at the
:: END of this file as readable lines prefixed "::PS:" and "::SH:" - edit them
:: there, no Base64 needed.
:: ============================================================================
set "ERR_TEMP_TITLE=2K7Yt9ijINmB2Yog2KfZhNiq2LTYutmK2YQgLyBFeGVjdXRpb24gRXJyb3I="
set "ERR_TEMP_MSG=2K7Yt9ijOiDYqtmFINiq2LTYutmK2YQg2KfZhNmF2YTZgSDZhdmGINiv2KfYrtmEINin2YTYo9ix2LTZitmBINin2YTZhdi22LrZiNi3IChaSVApINmF2KjYp9i02LHYqSEKCtmK2LHYrNmJINmB2YMg2LbYuti3INis2YXZiti5INin2YTZhdmE2YHYp9iqINmI2KfZhNmF2KzZhNiv2KfYqiDYpdmE2Ykg2YXYrNmE2K8g2LnYp9iv2Yog2KPZiNmE2KfZi9iMINir2YUg2KrYtNi62YrZhCDZhdmE2YEgQnVpbGRfTmVtZXNpc19VU0IuYmF0INmF2YYg2K/Yp9iu2YQg2KfZhNmF2KzZhNivINin2YTZhdiz2KrYrtix2KwuCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpFcnJvcjogVGhlIHNjcmlwdCB3YXMgbGF1bmNoZWQgZGlyZWN0bHkgZnJvbSBpbnNpZGUgYSBjb21wcmVzc2VkIFpJUCBhcmNoaXZlIQoKUGxlYXNlIGV4dHJhY3QgYWxsIGZpbGVzIGFuZCBmb2xkZXJzIHRvIGEgcmVndWxhciBmb2xkZXIgZmlyc3QsIHRoZW4gcnVuIEJ1aWxkX05lbWVzaXNfVVNCLmJhdCBmcm9tIHRoZSBleHRyYWN0ZWQgZm9sZGVyLg=="
set "PROMPT_SELECT_TITLE=2KfYrtiq2YrYp9ixINmF2KzZhNivINin2YTYrtix2KfYpti3IC8gU2VsZWN0IE1hcCBGb2xkZXI="
set "PROMPT_SELECT_MSG=2KrZhtio2YrZhzog2YTZhSDZitiq2YUg2KfZhNi52KvZiNixINi52YTZiSDZhdmE2YHYp9iqINin2YTYrtix2YrYt9ipINmB2Yog2KfZhNmF2KzZhNivINin2YTYrdin2YTZiiEKCtmK2LHYrNmJINiq2K3Yr9mK2K8g2YjYp9iu2KrZitin2LEg2YXYrNmE2K8g2KrYrdiv2YrYqyDYp9mE2K7Ysdin2KbYtyDZgdmKINin2YTZhtin2YHYsNipINin2YTYqtin2YTZitip2Iwg2KPZiCDYs9it2Kgg2KfZhNmF2KzZhNivINmI2KXZgdmE2KfYqtmHINmB2Yog2YbYp9mB2LDYqSDYp9mE2KPZiNin2YXYsS4KCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCk5vdGljZTogTWFwIHVwZGF0ZSBmaWxlcyB3ZXJlIG5vdCBmb3VuZCBpbiB0aGUgY3VycmVudCBmb2xkZXIhCgpQbGVhc2Ugc2VsZWN0IHRoZSBtYXAgdXBkYXRlIGZvbGRlciBpbiB0aGUgbmV4dCBkaWFsb2cgd2luZG93LCBvciBkcmFnIGFuZCBkcm9wIGl0IGludG8gdGhlIGNvbW1hbmQgcHJvbXB0Lg=="
set "ERR_FILES_TITLE=2YXZhNmB2KfYqiDYp9mE2K7YsdmK2LfYqSDYutmK2LEg2YXZiNis2YjYr9ipIC8gTWFwIEZpbGVzIE5vdCBGb3VuZA=="
set "ERR_FILES_MSG=2K7Yt9ijOiDZhNmFINmK2KrZhSDYp9mE2LnYq9mI2LEg2LnZhNmJINmF2YTZgdin2Kog2KfZhNiu2LHZiti32Kkg2YHZiiDYp9mE2YXYrNmE2K8g2KfZhNmF2K3Yr9ivIQoK2KfZhNiz2KjYqDoK2YrYrNioINij2YYg2YrYrdiq2YjZiiDYp9mE2YXYrNmE2K8g2KfZhNmF2K7Yqtin2LEg2LnZhNmJINmF2YTZgdin2Kog2KfZhNiq2K3Yr9mK2Ksg2KfZhNiq2KfZhNmK2Kk6CuKAoiBzd19iYWNrdXAudGFyCuKAoiBuYXZpX2JhY2t1cC50YXIxCgrZitix2KzZiSDYp9mE2KrYo9mD2K8g2YXZhiDYp9iu2KrZitin2LEg2KfZhNmF2KzZhNivINin2YTYtdit2YrYrSDYp9mE2LDZiiDZgtmF2Kog2KjYqtit2YXZitmE2Ycg2KvZhSDYp9mE2YXYrdin2YjZhNipINmF2KzYr9iv2KfZiy4KCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkVycm9yOiBNYXAgdXBkYXRlIGZpbGVzIHdlcmUgbm90IGZvdW5kIGluIHRoZSBzZWxlY3RlZCBmb2xkZXIhCgpSZWFzb246ClRoZSBjaG9zZW4gZm9sZGVyIG11c3QgY29udGFpbiB0aGUgZm9sbG93aW5nIHVwZGF0ZSBmaWxlczoK4oCiIHN3X2JhY2t1cC50YXIK4oCiIG5hdmlfYmFja3VwLnRhcjEKClBsZWFzZSBtYWtlIHN1cmUgeW91IGhhdmUgc2VsZWN0ZWQgdGhlIGNvcnJlY3QgbWFwIGZvbGRlciBhbmQgdHJ5IGFnYWluLg=="
set "ERR_TAR_TITLE=2KPYr9in2Kkg2KfZhNin2LPYqtiu2LHYp9isINi62YrYsSDZhdiq2YjZgdix2KkgLyBFeHRyYWN0aW9uIFRvb2wgTWlzc2luZw=="
set "ERR_TAR_MSG=2K7Yt9ijOiDYo9iv2KfYqSDYp9mE2KfYs9iq2K7Ysdin2KwgKHRhci5leGUpINi62YrYsSDZhdiq2YjZgdix2Kkg2YHZiiDZhti42KfZhSDZiNmK2YbYr9mI2LIg2KfZhNit2KfZhNmKIQoK2YrYqti32YTYqCDZh9iw2Kcg2KfZhNio2LHZhtin2YXYrCDZhti42KfZhSBXaW5kb3dzIDEwICjYp9mE2KXYtdiv2KfYsSAxODAzINij2Ygg2KPYrdiv2KspINij2YggV2luZG93cyAxMS4K2YrYsdis2Ykg2KrYtNi62YrZhCDYp9mE2YXZhNmBINi52YTZiSDZg9mF2KjZitmI2KrYsSDYrdiv2YrYqy4KCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkVycm9yOiBUaGUgZXh0cmFjdGlvbiB0b29sICh0YXIuZXhlKSB3YXMgbm90IGZvdW5kIG9uIHRoaXMgV2luZG93cyBzeXN0ZW0hCgpUaGlzIHRvb2wgcmVxdWlyZXMgV2luZG93cyAxMCAodmVyc2lvbiAxODAzIG9yIG5ld2VyKSBvciBXaW5kb3dzIDExLgpQbGVhc2UgcnVuIHRoaXMgc2NyaXB0IG9uIGFuIHVwLXRvLWRhdGUgV2luZG93cyBQQy4="
set "ERR_PERM_TITLE=2KrYudiw2LEg2KfZhNmD2KrYp9io2Kkg2YHZiiDYp9mE2YXYrNmE2K8gLyBXcml0ZSBQZXJtaXNzaW9uIEVycm9y"
set "ERR_PERM_MSG=2K7Yt9ijOiDZhNinINmK2YXZg9mGINin2YTZg9iq2KfYqNipINij2Ygg2KXZhti02KfYoSDZhdis2YTYr9in2Kog2YHZiiDZh9iw2Kcg2KfZhNmF2LPYp9ixIQoK2KrYo9mD2K8g2YXZhiDYo9mGINin2YTZhdis2YTYryDYutmK2LEg2YXYrdmF2Yog2LbYryDYp9mE2YPYqtin2KjYqdiMINij2Ygg2KfZhtmC2YQg2YXYrNmE2K8g2KfZhNiq2K3Yr9mK2Ksg2KXZhNmJINmF2LPYp9ixINii2K7YsSDZhdir2YQg2LPYt9itINin2YTZhdmD2KrYqCDYo9mIINin2YTZgtix2LUgQzpcLgoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KRXJyb3I6IENhbm5vdCB3cml0ZSBvciBjcmVhdGUgZm9sZGVycyBpbiB0aGlzIGxvY2F0aW9uIQoKTWFrZSBzdXJlIHRoZSBkaXJlY3RvcnkgaXMgbm90IHJlYWQtb25seSwgcnVuIGFzIEFkbWluaXN0cmF0b3IsIG9yIG1vdmUgdGhlIHVwZGF0ZSBmb2xkZXIgdG8gYSBkaWZmZXJlbnQgcGF0aCAoZS5nLiBEZXNrdG9wIG9yIEM6XCku"
set "SUCCESS_TITLE=2KrZhSDYqNmG2KzYp9itISAvIFN1Y2Nlc3Mh"
set "SUCCESS_MSG=2KfZg9iq2YXZhNiqINin2YTYudmF2YTZitipINio2YbYrNin2K0hCgrYqtmFINil2YbYtNin2KEg2K3YstmF2Kkg2KfZhNiu2LHYp9im2Lcg2YHZiiDYp9mE2YXYrNmE2K86CkdlbjVXX01hcF9VU0JfUmVhZHkK2YjYqtmFINmB2KrYrSDYp9mE2YXYrNmE2K8g2KPZhdin2YXZgyDZgdmKINmG2KfZgdiw2Kkg2KzYr9mK2K/YqS4KCtin2YbYs9iuINis2YXZiti5INmF2K3YqtmI2YrYp9iqINmH2LDYpyDYp9mE2YXYrNmE2K8g2YXYqNin2LTYsdipINil2YTZiSDYp9mE2YHZhNin2LQg2YXZitmF2YjYsdmKIChVU0Ip2Iwg2YjYsdmD2KjZhyDZgdmKINi02KfYtNipINin2YTYs9mK2KfYsdipINmE2KjYr9ihINin2YTYqtir2KjZitiqINin2YTYqtmE2YLYp9im2YouCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpQcm9jZXNzIGNvbXBsZXRlZCBzdWNjZXNzZnVsbHkhCgpUaGUgVVNCIG1hcCBwYWNrYWdlIGhhcyBiZWVuIGNyZWF0ZWQgaW46CkdlbjVXX01hcF9VU0JfUmVhZHkKYW5kIHRoZSBmb2xkZXIgaGFzIGJlZW4gb3BlbmVkIGZvciB5b3UuCgpDb3B5IHRoZSBDT05URU5UUyBvZiB0aGlzIGZvbGRlciBkaXJlY3RseSB0byB0aGUgcm9vdCBvZiBhIFVTQiBkcml2ZSwgdGhlbiBwbHVnIGl0IGludG8geW91ciB2ZWhpY2xlIHRvIGJlZ2luIGluc3RhbGxhdGlvbi4="
set "ERR_SPACE_TITLE=2KfZhNmF2LPYp9it2Kkg2LrZitixINmD2KfZgdmK2KkgLyBJbnN1ZmZpY2llbnQgRGlzayBTcGFjZQ=="
set "ERR_SPACE_MSG=2K7Yt9ijOiDYp9mE2YXYs9in2K3YqSDYp9mE2YXYqtio2YLZitipINi52YTZiSDYp9mE2YLYsdi1INi62YrYsSDZg9in2YHZitipINmE2YHZgyDYtti62Lcg2YXZhNmB2KfYqiDYp9mE2K7YsdmK2LfYqSEKCtin2YTZhdiz2KfYrdipINin2YTZhdi32YTZiNio2Kkg2YjYp9mE2YXYqtmI2YHYsdipINmF2YjYttit2Kkg2YHZiiDZhtin2YHYsNipINin2YTYo9mI2KfZhdixLgrZitix2KzZiSDYqtmB2LHZiti6INmF2LPYp9it2Kkg2KXYttin2YHZitipINi52YTZiSDZh9iw2Kcg2KfZhNmC2LHYtdiMINij2Ygg2YbZgtmEINin2YTZhdis2YTYryDYpdmE2Ykg2YLYsdi1INii2K7YsdiMINir2YUg2KXYudin2K/YqSDYqti02LrZitmEINin2YTZhdmE2YEuCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpFcnJvcjogTm90IGVub3VnaCBmcmVlIGRpc2sgc3BhY2UgdG8gZXh0cmFjdCB0aGUgbWFwIGZpbGVzIQoKVGhlIHJlcXVpcmVkIGFuZCBhdmFpbGFibGUgc3BhY2UgYXJlIHNob3duIGluIHRoZSBjb25zb2xlIHdpbmRvdy4KUGxlYXNlIGZyZWUgdXAgc3BhY2Ugb24gdGhpcyBkcml2ZSBvciBtb3ZlIHRoZSBmb2xkZXIgdG8gYW5vdGhlciBkcml2ZSwgdGhlbiBydW4gdGhlIHNjcmlwdCBhZ2Fpbi4="
set "ERR_BUILD_TITLE=2YHYtNmEINio2YbYp9ihINin2YTYrdiy2YXYqSAvIFBhY2thZ2UgQnVpbGQgRmFpbGVk"
set "ERR_BUILD_MSG=2K7Yt9ijOiDZgdi02YQg2KfYs9iq2K7Ysdin2Kwg2YXZhNmB2KfYqiDYp9mE2K7YsdmK2LfYqSDYo9mIINio2YbYp9ihINin2YTYrdiy2YXYqSEKCtiq2KPZg9ivINmF2YYg2KPZhiDZhdmE2YHYp9iqIHN3X2JhY2t1cC50YXIg2YggbmF2aV9iYWNrdXAudGFyMSDYutmK2LEg2KrYp9mE2YHYqSAo2KPYudivINiq2K3ZhdmK2YTZh9inINil2YYg2YTYstmFKdiMINmI2YXZhiDZiNis2YjYryDZhdiz2KfYrdipINmD2KfZgdmK2Kkg2LnZhNmJINin2YTZgtix2LXYjCDYq9mFINij2LnYryDYp9mE2YXYrdin2YjZhNipLgrYqtmB2KfYtdmK2YQg2KfZhNiu2LfYoyDZhdi52LHZiNi22Kkg2YHZiiDZhtin2YHYsNipINin2YTYo9mI2KfZhdixLgoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KRXJyb3I6IE1hcCBmaWxlIGV4dHJhY3Rpb24gb3IgcGFja2FnZSBjcmVhdGlvbiBmYWlsZWQhCgpDaGVjayB0aGF0IHN3X2JhY2t1cC50YXIgYW5kIG5hdmlfYmFja3VwLnRhcjEgYXJlIG5vdCBjb3JydXB0ZWQgKHJlLWRvd25sb2FkIGlmIG5lY2Vzc2FyeSkgYW5kIHRoYXQgZGlzayBzcGFjZSBpcyBzdWZmaWNpZW50LgpEZXRhaWxlZCBlcnJvciBtZXNzYWdlcyBhcmUgZGlzcGxheWVkIGluIHRoZSBjb25zb2xlIHdpbmRvdy4="
set "INSTR_B64=PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09CiAg2K/ZhNmK2YQg2KrYq9io2YrYqiDYp9mE2K7Ysdin2KbYtyDZhNij2YbYuNmF2KkgR2VuNVcg2LnYqNixIE5FTUVTSVMgKNmE2YPYp9mB2Kkg2KfZhNmF2YbYp9i32YIpCj09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQoK2LTYsdi3INij2LPYp9iz2Yo6CtmK2KzYqCDYo9mGINmK2YPZiNmGINmG2LjYp9mFIE5FTUVTSVMg2YXYq9io2KrYp9mLINmF2LPYqNmC2KfZiyDYudmE2Ykg2LTYp9i02Kkg2KfZhNiz2YrYp9ix2KkgKNix2KfYrNi5INmF2LPYqtmI2K/YuSDYp9mE2YXYtNix2YjYuSDYudmE2YkgR2l0SHViKS4KCtiu2LfZiNin2Kog2KfZhNiq2KvYqNmK2Kog2YHZiiDYp9mE2LPZitin2LHYqToKMS4g2YLZhSDYqNiq2YfZitim2Kkg2YHZhNin2LQg2YXZitmF2YjYsdmKIChVU0IpINio2YbYuNin2YUg2YXZhNmB2KfYqiBleEZBVCAo2KfZhNij2YHYttmEKSDYo9mIIEZBVDMyLgogICDYqtmG2KjZitmHOiDZhti42KfZhSBGQVQzMiDZhNinINmK2YLYqNmEINmF2YTZgdin2Kog2YXZgdix2K/YqSDYo9mD2KjYsSDZhdmGIDQg2KzZitis2KfYqNin2YrYqi4KMi4g2KfZhtiz2K4g2KzZhdmK2Lkg2YXYrdiq2YjZitin2Kog2KfZhNmF2KzZhNivIEdlbjVXX01hcF9VU0JfUmVhZHkg2YXYqNin2LTYsdipINil2YTZiSDYrNiw2LEg2KfZhNmB2YTYp9i0INmF2YrZhdmI2LHZijoKICAgLSDZhdmE2YEgTkVNRVNJUy5kYXRhCiAgIC0g2YXZhNmBIHVwZGF0ZS5zaAogICAtINmF2KzZhNivIG5hdmkKMy4g2LTYutmR2YQg2KfZhNiz2YrYp9ix2Kkg2YjYp9i02KjZgyDYp9mE2YHZhNin2LQg2YXZitmF2YjYsdmKINmB2Yog2YXZhtmB2LAgVVNCINin2YTYrtin2LUg2KjYp9mE2LTYp9i02KkgKNmF2YbZgdiwINin2YTZiNiz2KfYpti3KS4KNC4g2LPYqti42YfYsSDZhtin2YHYsNipINin2YTYqtir2KjZitiqINin2YTYrtin2LXYqSDYqNmAICJFeGVjdXRlIEdlbjVXIE1hcCBVcGRhdGVyPyLYjCDYp9iu2KrYsSBZZXMuCjUuINin2YbYqti42LEg2YXZhiAzINil2YTZiSA1INiv2YLYp9im2YLYjCDZiNmE2Kcg2KrYrtmE2Lkg2KfZhNmB2YTYp9i0INmI2YTYpyDYqti32YHYpiDYp9mE2LPZitin2LHYqSDYo9ir2YbYp9ihINmG2LPYriDYp9mE2YXZhNmB2KfYqi4KNi4g2LnZhtivINin2YTYp9mG2KrZh9in2KHYjCDYs9iq2LnYp9ivINiq2LTYutmK2YQg2KfZhNi02KfYtNipINiq2YTZgtin2KbZitin2Ysg2KjYudivIDUg2KvZiNin2YbZjS4KNy4g2KjYudivINil2LnYp9iv2Kkg2KfZhNiq2LTYutmK2YQg2KfZhtiy2Lkg2KfZhNmB2YTYp9i0INmF2YrZhdmI2LHZitiMINmI2LPZitiq2YUg2KrYutmK2YrYsSDYp9iz2YUgTkVNRVNJUy5kYXRhINil2YTZiSBORU1FU0lTLmRhdGEuaW5zdGFsbGVkINit2KrZiSDZhNinINmK2KrZg9ix2LEg2KfZhNiq2KvYqNmK2KouCgrZhdmE2KfYrdi42KfYqjoKLSDZitiq2YUg2YPYqtin2KjYqSDYs9is2YQg2KfZhNi52YXZhNmK2Kkg2K3Zitin2Ysg2YjZhdio2KfYtNix2Kkg2LnZhNmJINin2YTZgdmE2KfYtCDYqNin2LPZhSBtYXBfdXBkYXRlLmxvZyAo2YTYpyDYrdin2KzYqSDZhNin2LPYqtiu2K/Yp9mFIGFkYikuCi0g2YTYpdi52KfYr9ipINin2YTYqtir2KjZitiqINio2KfZhNmC2YjYqTog2KPZhti02KYg2YXZhNmB2KfZiyDZgdin2LHYutin2Ysg2KjYp9iz2YUgRk9SQ0VfSU5TVEFMTCDZgdmKINis2LDYsSDYp9mE2YHZhNin2LTYjCDZiNij2LnYryDYp9iz2YUgTkVNRVNJUy5kYXRhLmluc3RhbGxlZCDYpdmE2YkgTkVNRVNJUy5kYXRhLgo="Execute Gen5W Map Updater?\"2Iwg2KLYrtiq2LEgWWVzLgo1LiDYp9mG2KrYuNixINmF2YYgMyDYpdmE2YkgNSDYrNmC2KfZgtiMINmI2YTYpyDYqtmG2LLYuSDYp9mE2YHZhNin2LQg2YjZhNinINiq2LfZgdimINin2YTYs9mK2KfYsdipINij2KvZhtin2KEg2YbYs9iuINin2YTZhdmE2YHYp9iqLgo2LiDYudmG2K8g2KfZhNin2YbYqtmH2KfYoSDYs9iq2LnYp9ivINiq2LTYutmK2YQg2KfZhNi02KfYtNipINiq2YTZgtin2KbZitin2Ysg2KjYudivIDUg2KvZiNin2YbZjS4KNy4g2KjYudivINil2LnYp9iv2Kkg2KfZhNiq2LTYutmK2YQg2KfZhtiy2Lkg2KfZhNmB2YTYp9i0INmF2YrZhdmI2LHZitiMINmI2LPZitiq2YUg2KrYutmK2YrYsSDYp9iz2YUgTkVNRVNJUy5kYXRhINil2YTZiSBORU1FU0lTLmRhdGEuaW5zdGFsbGVkINit2KrZiSDZhNinINmK2KrZg9ix2LEg2KfZhNiq2KvYqNmK2KouCgrZhdmE2KfYrdi42KfYqjoKLSDZitiq2YUg2YPYqtin2KjYqSDYs9is2YQg2KfZhNi52YXZhNmK2Kkg2YHYp9mE2YrYp9inINmF2KjYp9i02LHYqSDYudmE2Ykg2KfZhNmB2YTYp9i0INio2KfYs9mFIG1hcF91cGRhdGUubG9nICjZhNinINit2KfYrNipINmE2KfYs9iq2K7Yr9in2YUgYWRiKS4KLSDZhNil2LnYp9iv2Kkg2KfZhNiq2KvYqNmK2Kog2KjYp9mE2YLZiNipOiDYo9mG2LTYpiDZhdmE2YHYp9mLINmB2KfYsdi62KfZiyDYqNin2LPZhSBGT1JDRV9JTlNUQUxMINmB2Yog2KzYsNixINin2YTZgdmE2KfYtNiMINmI2KPYudivINin2LPZhSBORU1FU0lTLmRhdGEuaW5zdGFsbGVkINil2YTZiSBORU1FU0lTLmRhdGEuCg=="

set "NEM_SELF=%~f0"
set "NEM_PS=%TEMP%\nemesis_helper_%RANDOM%.ps1"
set "PSH=powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%NEM_PS%""

echo ==============================================================================
echo   Hyundai / Kia / Genesis Gen5W Cross-Region Map Updater Creator
echo   Universal Standalone Installer (v5.3 - Any Region Support)
echo ==============================================================================
echo.

:: Extract the embedded PowerShell helper
powershell.exe -NoProfile -Command "Get-Content -LiteralPath $env:NEM_SELF | Where-Object { $_ -like '::PS:*' } | ForEach-Object { $_.Substring(5) } | Set-Content -LiteralPath $env:NEM_PS -Encoding UTF8"
if not exist "%NEM_PS%" (
    echo [ERROR] PowerShell is required but could not be started.
    goto :EXIT_ERR
)

:: 1. Running from inside a ZIP?
echo "%~dp0"| findstr /i /l /c:"\AppData\Local\Temp" >nul && goto :ERR_TEMP
echo "%~dp0"| findstr /i /l /c:"\Temp1_" >nul && goto :ERR_TEMP

:: 2. tar.exe available?
where tar.exe >nul 2>&1
if errorlevel 1 goto :ERR_NO_TAR

:: 3. Map folder: current folder first
set "MAP_DIR=%~dp0"
if "!MAP_DIR:~-1!"=="\" set "MAP_DIR=!MAP_DIR:~0,-1!"
if not exist "!MAP_DIR!\sw_backup.tar" goto :PROMPT_MAP_FOLDER
if not exist "!MAP_DIR!\navi_backup.tar1" goto :PROMPT_MAP_FOLDER
echo [*] Found map update files in the current folder:
echo     !MAP_DIR!
echo.
goto :CHECK_PERM_AND_SPACE

:PROMPT_MAP_FOLDER
color 0E
echo.
echo ==============================================================================
echo [WARN] Map update files were NOT found in the current folder.
echo ==============================================================================
echo Please select the folder containing sw_backup.tar and navi_backup.tar1
call :POPUP "%PROMPT_SELECT_TITLE%" "%PROMPT_SELECT_MSG%" Information

:PICK_AGAIN
set "SELECTED_DIR="
for /f "usebackq delims=" %%I in (`%PSH% -Action pick -A1 "Select Map Update Folder"`) do set "SELECTED_DIR=%%I"
if defined SELECTED_DIR (
    set "MAP_DIR=!SELECTED_DIR!"
    goto :VALIDATE_MAP_DIR
)

echo Drag and drop the map update folder here, or type its path:
set "USER_INPUT="
set /p "USER_INPUT=>> Folder Path: "
if not defined USER_INPUT goto :ERR_NO_FILES
set "USER_INPUT=%USER_INPUT:"=%"
set "MAP_DIR=!USER_INPUT!"

:VALIDATE_MAP_DIR
if "!MAP_DIR:~-1!"=="\" set "MAP_DIR=!MAP_DIR:~0,-1!"
if not exist "!MAP_DIR!\sw_backup.tar" goto :ERR_INVALID_FILES
if not exist "!MAP_DIR!\navi_backup.tar1" goto :ERR_INVALID_FILES
color 0B
echo.
echo [*] Map update folder:
echo     !MAP_DIR!
echo.

:CHECK_PERM_AND_SPACE
:: Write permission check
(echo 1) > "!MAP_DIR!\__test_write.tmp" 2>nul
if not exist "!MAP_DIR!\__test_write.tmp" goto :ERR_NO_PERM
del /f /q "!MAP_DIR!\__test_write.tmp" 2>nul

:: Free space: (sum of the tar files x 1.15) + 512 MB
set "SP_STATE=UNKNOWN"
set "SP_NEED=?"
set "SP_FREE=?"
for /f "usebackq tokens=1,2,3 delims=|" %%A in (`%PSH% -Action space -A1 "!MAP_DIR!"`) do (
    set "SP_STATE=%%A"
    set "SP_NEED=%%B"
    set "SP_FREE=%%C"
)
if "!SP_STATE!"=="LOW" goto :ERR_NO_SPACE
if "!SP_STATE!"=="UNKNOWN" (
    echo [WARN] Could not measure free disk space on this location - continuing without the check.
) else (
    echo [*] Disk check:     PASSED - need about !SP_NEED! GB, free !SP_FREE! GB
)
echo [*] Write check:    PASSED
echo [*] Tool check:     PASSED - tar.exe available
echo.

set "MODEL_NAME=Gen5W_Vehicle"
for %%F in ("!MAP_DIR!\*.ver") do set "MODEL_NAME=%%~nF"
echo [*] Detected vehicle model: !MODEL_NAME!

set "BUILD_ID=build"
for /f "usebackq delims=" %%B in (`%PSH% -Action buildid`) do set "BUILD_ID=%%B"

set "OUTPUT_DIR=!MAP_DIR!\Gen5W_Map_USB_Ready"
set "NAVI_DIR=!OUTPUT_DIR!\navi"

echo [*] Target USB package folder:
echo     !OUTPUT_DIR!
echo [*] Any previous Gen5W_Map_USB_Ready folder will be replaced.
echo.

if exist "!OUTPUT_DIR!" rd /s /q "!OUTPUT_DIR!"
mkdir "!NAVI_DIR!" 2>nul
if not exist "!NAVI_DIR!\" goto :ERR_NO_PERM

echo ------------------------------------------------------------------------------
echo Step 1 of 3: Extracting map files (may take several minutes)...
echo ------------------------------------------------------------------------------
set "EXTRACT_FAIL=0"
call :EXTRACT "!MAP_DIR!\sw_backup.tar"
for %%F in ("!MAP_DIR!\navi_backup.tar*") do if /i not "%%~xF"==".md5" call :EXTRACT "%%~fF"
if "!EXTRACT_FAIL!"=="1" goto :ERR_BUILD

echo.
echo [*] Finalizing map files layout...
if not exist "!NAVI_DIR!\navi_backup\" goto :LAYOUT_DONE
robocopy "!NAVI_DIR!\navi_backup" "!NAVI_DIR!" /E /MOVE /NFL /NDL /NJH /NJS /NP >nul
if errorlevel 8 goto :ERR_BUILD
rd /s /q "!NAVI_DIR!\navi_backup" 2>nul
:LAYOUT_DONE
if not exist "!NAVI_DIR!\DATA\" goto :ERR_BUILD
if not exist "!NAVI_DIR!\BIN\" goto :ERR_BUILD

copy /y "!MAP_DIR!\*.md5" "!NAVI_DIR!\" >nul 2>&1
copy /y "!MAP_DIR!\*.txt" "!NAVI_DIR!\" >nul 2>&1

:: Integrity build ID marker
%PSH% -Action idfile -A1 "!MODEL_NAME!_!BUILD_ID!" -A2 "!NAVI_DIR!\MAP_BUILD_ID"
if not exist "!NAVI_DIR!\MAP_BUILD_ID" goto :ERR_BUILD

echo ------------------------------------------------------------------------------
echo Step 2 of 3: Creating standalone NEMESIS execution script...
echo ------------------------------------------------------------------------------
:: USB descriptor (Direct Script Execution: type=execute)
(
echo [nemesis]
echo version=1.0
echo type=execute
echo name=Gen5W Map Updater
echo path=update.sh
) > "!OUTPUT_DIR!\NEMESIS.data"

:: Extract standalone update.sh directly to USB root
%PSH% -Action sh -A1 "%NEM_SELF%" -A2 "!OUTPUT_DIR!\update.sh"
if not exist "!OUTPUT_DIR!\update.sh" goto :ERR_BUILD

echo [*] Standalone script update.sh created successfully.

echo ------------------------------------------------------------------------------
echo Step 3 of 3: Creating installation instructions...
echo ------------------------------------------------------------------------------
(
echo ==============================================================================
echo   Gen5W Map Updater NEMESIS Installation Guide
echo   Standalone Execution Mode (v5.0)
echo ==============================================================================
echo.
echo PREREQUISITE: NEMESIS must already be installed on the head unit.
echo.
echo 1. Format a USB flash drive as exFAT ^(recommended^) or FAT32.
echo 2. Copy the CONTENTS of Gen5W_Map_USB_Ready directly to the USB root:
echo      NEMESIS.data
echo      update.sh
echo      navi\
echo 3. Start the car and plug the USB drive into the multimedia USB port.
echo 4. A prompt appears on screen: "Execute Gen5W Map Updater?"
echo    Tap YES.
echo 5. Wait 3 to 5 minutes. Do NOT unplug the drive or switch the car off.
echo 6. The unit displays countdown and reboots by itself when complete.
echo 7. Unplug the drive. NEMESIS.data is renamed to NEMESIS.data.installed
echo    so the script does not prompt again on every boot.
echo.
echo Notes:
echo - All logs are written directly to map_update.log on the USB drive.
echo - To force a re-install: create an empty file named FORCE_INSTALL on the USB
echo   and rename NEMESIS.data.installed back to NEMESIS.data.
) > "!OUTPUT_DIR!\README_INSTRUCTIONS.txt"

%PSH% -Action b64file -A1 "%INSTR_B64%" -A2 "!OUTPUT_DIR!\README_ARABIC.txt"

color 0A
echo.
echo ==============================================================================
echo   SUCCESS - Gen5W Map USB Package Created Successfully
echo ==============================================================================
echo.
echo Package location:
echo   !OUTPUT_DIR!
echo.
echo Package contents:
echo   - NEMESIS.data  (Direct script trigger)
echo   - update.sh     (Standalone root installer script)
echo   - navi\         (Complete map database)
echo   - README_INSTRUCTIONS.txt / README_ARABIC.txt
echo.
explorer.exe "!OUTPUT_DIR!"
call :POPUP "%SUCCESS_TITLE%" "%SUCCESS_MSG%" Information
pause
goto :EXIT_OK

:: ============================================================================
:: Sub-routines
:: ============================================================================
:EXTRACT
echo     - %~nx1
tar -xmf "%~1" -C "!NAVI_DIR!"
if errorlevel 1 (
    rem If tar returned non-zero, check if files were extracted (non-fatal warning vs real failure)
    dir /b /a "!NAVI_DIR!" | findstr . >nul 2>&1
    if errorlevel 1 (
        echo     [ERROR] tar failed on %~nx1
        set "EXTRACT_FAIL=1"
    ) else (
        echo     [WARN] tar finished with non-fatal warning on %~nx1 ^(files extracted successfully^).
    )
)
goto :eof

:POPUP
%PSH% -Action msg -A1 "%~1" -A2 "%~2" -A3 %~3 >nul 2>&1
goto :eof

:: ============================================================================
:: Error handlers
:: ============================================================================
:ERR_TEMP
color 0C
echo.
echo [ERROR] The script was launched from inside a ZIP archive.
echo Extract all files first, then run Build_Nemesis_USB.bat.
call :POPUP "%ERR_TEMP_TITLE%" "%ERR_TEMP_MSG%" Error
goto :EXIT_ERR

:ERR_NO_FILES
color 0C
echo.
echo [ERROR] No folder was selected or the input was empty.
call :POPUP "%ERR_FILES_TITLE%" "%ERR_FILES_MSG%" Error
goto :EXIT_ERR

:ERR_INVALID_FILES
color 0C
echo.
echo [ERROR] sw_backup.tar / navi_backup.tar1 were NOT found in:
echo         !MAP_DIR!
call :POPUP "%ERR_FILES_TITLE%" "%ERR_FILES_MSG%" Error
goto :PICK_AGAIN

:ERR_NO_SPACE
color 0C
echo.
echo [ERROR] Not enough free disk space: need about !SP_NEED! GB, free !SP_FREE! GB.
call :POPUP "%ERR_SPACE_TITLE%" "%ERR_SPACE_MSG%" Error
goto :EXIT_ERR

:ERR_NO_TAR
color 0C
echo.
echo [ERROR] tar.exe was not found. Windows 10 (1803+) or Windows 11 is required.
call :POPUP "%ERR_TAR_TITLE%" "%ERR_TAR_MSG%" Error
goto :EXIT_ERR

:ERR_NO_PERM
color 0C
echo.
echo [ERROR] Cannot write to:
echo         !MAP_DIR!
echo Make sure the folder is not read-only, or run as Administrator.
call :POPUP "%ERR_PERM_TITLE%" "%ERR_PERM_MSG%" Error
goto :EXIT_ERR

:ERR_BUILD
color 0C
echo.
echo [ERROR] Extraction or packaging failed (see messages above).
echo         Check that the tar files are not corrupted and that disk space is sufficient.
call :POPUP "%ERR_BUILD_TITLE%" "%ERR_BUILD_MSG%" Error
goto :EXIT_ERR

:EXIT_ERR
pause
if exist "%NEM_PS%" del /f /q "%NEM_PS%" 2>nul
popd
exit /b 1

:EXIT_OK
if exist "%NEM_PS%" del /f /q "%NEM_PS%" 2>nul
popd
exit /b 0

:: ============================================================================
:: EMBEDDED FILES - never executed by cmd, extracted by the helper.
:: ============================================================================

:: ----- PowerShell helper (::PS:) -----
::PS:param([string]$Action, [string]$A1, [string]$A2, [string]$A3)
::PS:$ErrorActionPreference = 'Stop'
::PS:[Console]::OutputEncoding = New-Object Text.UTF8Encoding $false
::PS:Add-Type -AssemblyName System.Windows.Forms
::PS:function B64([string]$s) { [Text.Encoding]::UTF8.GetString([Convert]::FromBase64String($s)) }
::PS:function NewOwner { $f = New-Object Windows.Forms.Form; $f.TopMost = $true; $f.ShowInTaskbar = $false; return $f }
::PS:
::PS:switch ($Action) {
::PS:    'msg' {
::PS:        [void][Windows.Forms.MessageBox]::Show((NewOwner), (B64 $A2), (B64 $A1), 'OK', $A3)
::PS:    }
::PS:    'pick' {
::PS:        $d = New-Object Windows.Forms.FolderBrowserDialog
::PS:        $d.Description = $A1
::PS:        if ($d.ShowDialog((NewOwner)) -eq [Windows.Forms.DialogResult]::OK) { Write-Output $d.SelectedPath }
::PS:    }
::PS:    'space' {
::PS:        try {
::PS:            $s = 0
::PS:            foreach ($f in [IO.Directory]::GetFiles($A1)) {
::PS:                $n = [IO.Path]::GetFileName($f)
::PS:                if ($n -match '^(sw_backup\.tar|navi_backup\.tar\d*)$') { $s += (New-Object IO.FileInfo $f).Length }
::PS:            }
::PS:            $need = [long]($s * 1.15) + 536870912
::PS:            $root = [IO.Path]::GetPathRoot((Resolve-Path -LiteralPath $A1).ProviderPath)
::PS:            $free = (New-Object IO.DriveInfo $root).AvailableFreeSpace
::PS:            $st = 'OK'; if ($free -lt $need) { $st = 'LOW' }
::PS:            '{0}|{1:N1}|{2:N1}' -f $st, ($need / 1GB), ($free / 1GB)
::PS:        } catch { 'UNKNOWN|0|0' }
::PS:    }
::PS:    'buildid' { Get-Date -Format 'yyyyMMdd-HHmmss' }
::PS:    'sh' {
::PS:        # extract the ::SH: lines of the .bat into a Unix (LF) script
::PS:        $lines = Get-Content -LiteralPath $A1 | Where-Object { $_ -like '::SH:*' } | ForEach-Object { $_.Substring(5) }
::PS:        $text = (@($lines) -join "`n") + "`n"
::PS:        [IO.File]::WriteAllText($A2, $text, (New-Object Text.UTF8Encoding $false))
::PS:    }
::PS:    'idfile' { [IO.File]::WriteAllText($A2, $A1, (New-Object Text.UTF8Encoding $false)) }
::PS:    'b64file' {
::PS:        $b = [Convert]::FromBase64String($A1)
::PS:        [IO.File]::WriteAllBytes($A2, ([byte[]](0xEF,0xBB,0xBF) + $b))
::PS:    }
::PS:}

:: ----- Car-side standalone update.sh, Unix LF endings applied on extraction (::SH:) -----
::SH:#!/system/bin/sh
::SH:# ==============================================================================
::SH:#   Gen5W Cross-Region Map Standalone Updater v5.3
::SH:#   Direct USB Script Execution (type=execute) - No Package Installation Needed
::SH:# ==============================================================================
::SH:export PATH=/data/nemesis/bin:/sbin:/vendor/bin:/system/sbin:/system/bin:/system/xbin
::SH:export LD_LIBRARY_PATH=/vendor/lib:/system/lib
::SH:
::SH:# 1. Resolve USB root directory & initialize real-time USB logging
::SH:SCRIPT_DIR="${0%/*}"
::SH:if [ -d "$SCRIPT_DIR/navi" ]; then
::SH:    USB_ROOT="$SCRIPT_DIR"
::SH:elif [ -d "/storage/usb0/navi" ]; then
::SH:    USB_ROOT="/storage/usb0"
::SH:elif [ -d "/storage/usb1/navi" ]; then
::SH:    USB_ROOT="/storage/usb1"
::SH:elif [ -d "/storage/usb2/navi" ]; then
::SH:    USB_ROOT="/storage/usb2"
::SH:else
::SH:    for c in /mnt/media_rw/usb* /storage/usb* /storage/*; do
::SH:        if [ -d "$c/navi" ]; then
::SH:            USB_ROOT="$c"
::SH:            break
::SH:        fi
::SH:    done
::SH:fi
::SH:
::SH:MAP_SRC="$USB_ROOT/navi"
::SH:LOGFILE="$USB_ROOT/map_update.log"
::SH:SLOT_CFG="/oem_data/map_index.cfg"
::SH:slot_dir() { if [ "$1" = "1" ]; then echo /storage/navi2; else echo /storage/navi; fi; }
::SH:set_slot() {   # $1 = 0 | 1
::SH:    echo -n "$1" > "$SLOT_CFG" 2>/dev/null
::SH:    chmod 666 "$SLOT_CFG" 2>/dev/null
::SH:    sync
::SH:}
::SH:
::SH:# A/B maps: install into the INACTIVE slot so the working map stays as a fallback,
::SH:# and only switch /oem_data/map_index.cfg after the copy has been verified.
::SH:HAVE_NAVI2=0
::SH:while read dev mp rest; do
::SH:    [ "$mp" = "/storage/navi2" ] && HAVE_NAVI2=1
::SH:done < /proc/mounts
::SH:CURRENT_SLOT=$(cat "$SLOT_CFG" 2>/dev/null)
::SH:[ "$CURRENT_SLOT" = "1" ] || CURRENT_SLOT=0
::SH:ACTIVE_NAVI=$(slot_dir "$CURRENT_SLOT")
::SH:TARGET_SLOT=0
::SH:if [ "$CURRENT_SLOT" = "0" ] && [ "$HAVE_NAVI2" -eq 1 ]; then TARGET_SLOT=1; fi
::SH:NAVI=$(slot_dir "$TARGET_SLOT")
::SH:RW_DONE=0
::SH:
::SH:# Real-time sync logging directly to USB drive
::SH:log() {
::SH:    local MSG="$(date '+%Y-%m-%d %H:%M:%S') $*"
::SH:    echo "$MSG"
::SH:    echo "$MSG" >> "$LOGFILE" 2>/dev/null
::SH:    sync 2>/dev/null
::SH:}
::SH:
::SH:toast() {
::SH:    am broadcast -a com.hkmc.intent.action.TOAST -e com.hkmc.intent.extra.TOAST_MESSAGE "$1" --ez com.hkmc.intent.extra.TOAST_POPUPSHOWING true >/dev/null 2>&1 || true
::SH:}
::SH:
::SH:echo "==============================================================================" > "$LOGFILE"
::SH:echo "  Hyundai / Kia / Genesis Gen5W Cross-Region Map Installation Log" >> "$LOGFILE"
::SH:echo "==============================================================================" >> "$LOGFILE"
::SH:log "=== [START] Map update initiated at $(date) ==="
::SH:log "[INFO] USB Root: $USB_ROOT"
::SH:log "[INFO] Map Source: $MAP_SRC"
::SH:log "[INFO] Target Partition: $NAVI (slot $TARGET_SLOT, active slot is $CURRENT_SLOT = $ACTIVE_NAVI)"
::SH:
::SH:# --- Dynamic Block Device Detection from /proc/mounts ---
::SH:NAVI_DEV=""
::SH:while read dev mp rest; do
::SH:    [ "$mp" = "$NAVI" ] && NAVI_DEV="$dev"
::SH:done < /proc/mounts
::SH:
::SH:log "[INFO] Detected block device for $NAVI: ${NAVI_DEV:-unknown}"
::SH:
::SH:remount_navi() {   # $1 = rw | ro
::SH:    if [ -n "$NAVI_DEV" ]; then
::SH:        mount -o "$1,remount" "$NAVI_DEV" "$NAVI" 2>/dev/null
::SH:        mount -o "remount,$1" "$NAVI_DEV" "$NAVI" 2>/dev/null
::SH:    fi
::SH:    mount -o "remount,$1" "$NAVI" 2>/dev/null
::SH:    mount -o "$1,remount" "$NAVI" 2>/dev/null
::SH:}
::SH:
::SH:finish() {   # $1 = exit code
::SH:    if [ "$RW_DONE" -eq 1 ]; then
::SH:        log "[INFO] Restoring $NAVI to read-only..."
::SH:        remount_navi ro
::SH:    fi
::SH:    sync
::SH:    exit "$1"
::SH:}
::SH:
::SH:# 2. Validate Map Source on USB
::SH:if [ ! -d "$MAP_SRC/DATA" ] || [ ! -d "$MAP_SRC/BIN" ]; then
::SH:    log "[ERROR] Map files (DATA or BIN) not found on USB drive: $MAP_SRC"
::SH:    log "[ERROR] Please make sure the 'navi' folder was copied completely to the USB drive."
::SH:    toast "Error: Map files not found on USB drive!"
::SH:    finish 1
::SH:fi
::SH:
::SH:NEW_ID=""
::SH:if [ -f "$MAP_SRC/MAP_BUILD_ID" ]; then
::SH:    NEW_ID=$(cat "$MAP_SRC/MAP_BUILD_ID")
::SH:else
::SH:    NEW_ID="build-$(date +%Y%m%d)"
::SH:fi
::SH:log "[INFO] USB Map Package Build ID: $NEW_ID"
::SH:
::SH:# 2b. Region guard: the installed navigation app only reads maps of its own region
::SH:# (e.g. the US "STD5W.NAM" app needs NAM; a MES map gives "DBLoadFail / map cannot be displayed").
::SH:map_region() {   # $1 = dir; prints the region prefix of "<REGION>.xx.xx...md5" (ignores BIN.md5)
::SH:    for f in "$1"/*.md5; do
::SH:        [ -f "$f" ] || continue
::SH:        b="${f##*/}"
::SH:        [ "$b" = "BIN.md5" ] && continue
::SH:        echo "${b%%.*}"
::SH:        return
::SH:    done
::SH:}
::SH:PKG_REGION=$(map_region "$MAP_SRC")
::SH:# The app derives its nation from ro.product.locale.region (US/CA -> NAM, ME -> MES); fall back to the installed maps.
::SH:SYS_REGION=$(getprop ro.product.locale.region 2>/dev/null)
::SH:case "$SYS_REGION" in
::SH:    US|CA) UNIT_REGION="NAM" ;;
::SH:    ME) UNIT_REGION="MES" ;;
::SH:    *) UNIT_REGION="" ;;
::SH:esac
::SH:[ -n "$UNIT_REGION" ] || UNIT_REGION=$(map_region "$ACTIVE_NAVI")
::SH:[ -n "$UNIT_REGION" ] || UNIT_REGION=$(map_region "$(slot_dir 1)")
::SH:[ -n "$UNIT_REGION" ] || UNIT_REGION=$(map_region "$(slot_dir 0)")
::SH:REGION_NAME="${PKG_REGION:-Map}"
::SH:log "[INFO] System region: ${SYS_REGION:-unknown} | Package map region: ${PKG_REGION:-unknown} | Region this unit can read: ${UNIT_REGION:-unknown}"
::SH:if [ -n "$PKG_REGION" ] && [ -n "$UNIT_REGION" ] && [ "$PKG_REGION" != "$UNIT_REGION" ]; then
::SH:    if [ -f "$USB_ROOT/FORCE_REGION" ]; then
::SH:        log "[WARN] Region mismatch ($PKG_REGION vs $UNIT_REGION) ignored because FORCE_REGION exists on the USB."
::SH:    else
::SH:        log "[ERROR] Region mismatch: this unit reads $UNIT_REGION maps (system region ${SYS_REGION:-unknown}) but the package is $PKG_REGION."
::SH:        log "[ERROR] Installing it would leave the navigation app with 'map cannot be displayed'. Nothing was changed."
::SH:        log "[ERROR] Set the unit region first: ro.product.locale.region must be ME for MES maps in BOTH /system/build.prop and /system/onebin/<ro.mobis.onebindir>/mobis.prop (see README),"
::SH:        log "[ERROR] or create an empty FORCE_REGION file on the USB to override."
::SH:        toast "Error: map region $PKG_REGION does not match this unit ($UNIT_REGION). Nothing changed."
::SH:        finish 5
::SH:    fi
::SH:fi
::SH:
::SH:# 3. Check existing installation integrity on head unit (active slot first, then target slot)
::SH:COMPLETE_MARKER="$NAVI/MAP_INSTALL_COMPLETE"
::SH:IS_ALREADY_INSTALLED=0
::SH:INSTALLED_SLOT=""
::SH:for S in "$CURRENT_SLOT" "$TARGET_SLOT"; do
::SH:    SD=$(slot_dir "$S")
::SH:    if [ -f "$SD/MAP_INSTALL_COMPLETE" ] && [ -d "$SD/DATA/COMMON" ] && [ -d "$SD/DATA/NATION" ] && [ -d "$SD/BIN" ]; then
::SH:        INSTALLED_ID=$(cat "$SD/MAP_INSTALL_COMPLETE" 2>/dev/null)
::SH:        log "[INFO] Found completed installation marker in $SD. Installed ID: $INSTALLED_ID"
::SH:        for f in "$SD"/*.md5; do
::SH:            if [ -f "$f" ] && [ "$INSTALLED_ID" = "$NEW_ID" ]; then
::SH:                IS_ALREADY_INSTALLED=1
::SH:                INSTALLED_SLOT="$S"
::SH:            fi
::SH:            break
::SH:        done
::SH:        [ "$IS_ALREADY_INSTALLED" -eq 1 ] && break
::SH:    fi
::SH:done
::SH:
::SH:if [ "$IS_ALREADY_INSTALLED" -eq 0 ]; then
::SH:    if [ -f "$COMPLETE_MARKER" ]; then
::SH:        log "[INFO] Target slot has a different map build; it will be replaced."
::SH:    elif [ -d "$NAVI/DATA" ] || [ -d "$NAVI/BIN" ]; then
::SH:        # Marker is missing! Check if partial files exist from an interrupted install
::SH:        log "[WARN] Incomplete or interrupted previous installation detected (MAP_INSTALL_COMPLETE missing)!"
::SH:        log "[WARN] The car was likely turned off during a previous update attempt."
::SH:        log "[INFO] A clean reinstall will be performed automatically..."
::SH:    else
::SH:        log "[INFO] No previous map found in the target slot (first-time installation)."
::SH:    fi
::SH:fi
::SH:
::SH:if [ -f "$USB_ROOT/FORCE_INSTALL" ] || [ -f "$USB_ROOT/FORCE" ]; then
::SH:    log "[INFO] User requested forced reinstall (FORCE_INSTALL file detected)."
::SH:    IS_ALREADY_INSTALLED=0
::SH:fi
::SH:
::SH:if [ "$IS_ALREADY_INSTALLED" -eq 1 ]; then
::SH:    log "[INFO] This exact map package ($REGION_NAME) is ALREADY completely installed and verified (slot $INSTALLED_SLOT)."
::SH:    log "[INFO] Skipping file copy (preserving flash memory)."
::SH:    toast "$REGION_NAME Map is already up to date!"
::SH:
::SH:    # Make sure the unit is actually booting from the slot that holds this map
::SH:    if [ -d "/oem_data" ] && [ "$CURRENT_SLOT" != "$INSTALLED_SLOT" ]; then
::SH:        log "[INFO] Switching active map slot from '$CURRENT_SLOT' to '$INSTALLED_SLOT' in $SLOT_CFG..."
::SH:        set_slot "$INSTALLED_SLOT"
::SH:    fi
::SH:    
::SH:    if [ -f "$USB_ROOT/NEMESIS.data" ]; then
::SH:        mv "$USB_ROOT/NEMESIS.data" "$USB_ROOT/NEMESIS.data.installed" 2>/dev/null
::SH:    fi
::SH:    log "=== [DONE] Verified existing installation successfully ==="
::SH:    finish 0
::SH:fi
::SH:
::SH:# 4. Stop navigation processes
::SH:log "[INFO] Stopping navigation processes..."
::SH:toast "Starting $REGION_NAME Map Update (please wait 3-5 min)..."
::SH:am force-stop com.mnsoft.navi 2>/dev/null
::SH:am force-stop com.hkmc.navitest 2>/dev/null
::SH:am force-stop com.mnsoft.navipopupservice 2>/dev/null
::SH:killall -9 HKMC_Navi 2>/dev/null
::SH:killall -9 com.mnsoft.navi 2>/dev/null
::SH:sleep 1
::SH:
::SH:# 5. Remount /storage/navi RW
::SH:log "[INFO] Remounting $NAVI as read-write..."
::SH:remount_navi rw
::SH:RW_DONE=1
::SH:
::SH:if ! touch "$NAVI/.rwtest" 2>/dev/null; then
::SH:    log "[ERROR] Failed to remount $NAVI as read-write. Partition is locked by kernel."
::SH:    toast "Error: Cannot write to navigation storage!"
::SH:    finish 4
::SH:fi
::SH:rm -f "$NAVI/.rwtest"
::SH:log "[INFO] Storage write check: PASSED (writable)."
::SH:
::SH:# 6. Clean old/incomplete files
::SH:log "[INFO] Cleaning old files from $NAVI..."
::SH:rm -rf "$NAVI"/* >> "$LOGFILE" 2>&1
::SH:rm -rf "$NAVI"/.[!.]* 2>/dev/null
::SH:rm -rf "$NAVI"/..?* 2>/dev/null
::SH:log "[INFO] Storage cleaned. Free space: $(df "$NAVI" | tail -n 1)"
::SH:
::SH:# 7. Copy map files from USB to head unit
::SH:log "[INFO] Copying map files from USB to $NAVI..."
::SH:log "[INFO] Please wait 3 to 5 minutes. DO NOT TURN OFF THE CAR..."
::SH:
::SH:COPY_START=$(date +%s 2>/dev/null || echo 0)
::SH:for item in "$MAP_SRC"/*; do
::SH:    [ -e "$item" ] || continue
::SH:    ITEM_NAME="${item##*/}"
::SH:    log "[INFO] Copying: $ITEM_NAME..."
::SH:    cp -rf "$item" "$NAVI"/ >> "$LOGFILE" 2>&1
::SH:done
::SH:COPY_END=$(date +%s 2>/dev/null || echo 0)
::SH:log "[INFO] Copy completed in $((COPY_END - COPY_START)) seconds."
::SH:
::SH:# 8. Verification
::SH:log "[INFO] Verifying installed map files..."
::SH:VERIFY_OK=1
::SH:
::SH:if [ ! -d "$NAVI/DATA" ] || [ ! -d "$NAVI/BIN" ]; then
::SH:    log "[ERROR] Verification failed: DATA or BIN missing!"
::SH:    VERIFY_OK=0
::SH:fi
::SH:
::SH:HAS_MD5=0
::SH:for f in "$NAVI"/*.md5; do
::SH:    [ -f "$f" ] && HAS_MD5=1 && break
::SH:done
::SH:
::SH:if [ "$HAS_MD5" -eq 0 ]; then
::SH:    log "[WARN] Checksum (*.md5) file missing from copy!"
::SH:fi
::SH:
::SH:if [ "$VERIFY_OK" -eq 0 ]; then
::SH:    log "[ERROR] Map copy was INCOMPLETE! Do not unplug the USB; check map_update.log."
::SH:    toast "Error: Map copy was incomplete!"
::SH:    finish 3
::SH:fi
::SH:
::SH:# 9. Set permissions, create symlink, and write completion marker
::SH:log "[INFO] Setting permissions (777)..."
::SH:chmod -R 777 "$NAVI" 2>/dev/null
::SH:rm -f "$NAVI/navi" 2>/dev/null
::SH:ln -s "$NAVI" "$NAVI/navi" 2>/dev/null
::SH:
::SH:log "[INFO] Writing completion marker: $COMPLETE_MARKER..."
::SH:echo "$NEW_ID" > "$COMPLETE_MARKER"
::SH:echo "$NEW_ID" > "$NAVI/ME_INSTALLED_ID"
::SH:sync; sync
::SH:
::SH:# 10. Restore read-only
::SH:log "[INFO] Restoring $NAVI to read-only..."
::SH:remount_navi ro
::SH:RW_DONE=0
::SH:
::SH:# 10b. Switch the active navigation slot only now that the new map is fully copied and verified
::SH:if [ -d "/oem_data" ]; then
::SH:    log "[INFO] Active navigation slot check: $SLOT_CFG = '$CURRENT_SLOT'"
::SH:    if [ "$CURRENT_SLOT" != "$TARGET_SLOT" ]; then
::SH:        log "[INFO] Switching active map slot from '$CURRENT_SLOT' to '$TARGET_SLOT' ($NAVI)..."
::SH:        set_slot "$TARGET_SLOT"
::SH:        log "[INFO] Active map slot is now $TARGET_SLOT. Previous map in slot $CURRENT_SLOT ($ACTIVE_NAVI) was left untouched as a fallback."
::SH:        log "[INFO] To roll back: write $CURRENT_SLOT into $SLOT_CFG and reboot."
::SH:    else
::SH:        log "[INFO] Active map slot is already $TARGET_SLOT ($NAVI)."
::SH:    fi
::SH:fi
::SH:
::SH:# 11. Clear navigation app cache and data
::SH:log "[INFO] Clearing navigation app data (pm clear)..."
::SH:pm clear com.mnsoft.navi 2>/dev/null
::SH:pm clear com.mnsoft.navipopupservice 2>/dev/null
::SH:
::SH:# 12. Disarm USB descriptor
::SH:if [ -f "$USB_ROOT/NEMESIS.data" ]; then
::SH:    mv "$USB_ROOT/NEMESIS.data" "$USB_ROOT/NEMESIS.data.installed" 2>/dev/null
::SH:    echo "[nemesis]" > "$USB_ROOT/NEMESIS.data.installed" 2>/dev/null
::SH:    echo "version=1.0" >> "$USB_ROOT/NEMESIS.data.installed" 2>/dev/null
::SH:    echo "type=installed" >> "$USB_ROOT/NEMESIS.data.installed" 2>/dev/null
::SH:    echo "status=completed" >> "$USB_ROOT/NEMESIS.data.installed" 2>/dev/null
::SH:    log "[INFO] Renamed NEMESIS.data -> NEMESIS.data.installed"
::SH:fi
::SH:
::SH:log "=============================================================================="
::SH:log "=== [SUCCESS] $REGION_NAME Map installation completed successfully! ==="
::SH:log "=============================================================================="
::SH:sync; sync
::SH:
::SH:# 13. UI Notification & 5-Second Countdown
::SH:am start -n com.nemesis.manager/.DialogActivity --es nemesis_mode result_ok --es nemesis_message "Gen5W Map update complete! System will reboot in 5 seconds..." 2>/dev/null
::SH:
::SH:for i in 5 4 3 2 1; do
::SH:    log "[INFO] System rebooting in $i seconds..."
::SH:    sleep 1
::SH:done
::SH:
::SH:log "[INFO] Rebooting system now..."
::SH:sync
::SH:/system/bin/reboot
::SH:exit 0
