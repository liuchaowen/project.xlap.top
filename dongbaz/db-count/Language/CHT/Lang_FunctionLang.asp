<%
function cClientcht(strcj,tClient)
  select case tClient
  case 2
    cClientcht=clang(strcj)
  case 4
    cClientcht=replace(strcj,",","×")
  case 5
    cClientcht="2<sup>" & strcj & "</sup> 色"
  case 6
    cClientcht="第 " & strcj & " 次訪問"
  case 8
    cClientcht="一口氣瀏覽 " & strcj & " 頁"
  case else
    cClientcht=strcj
  end select
end function


function cLangcht(Langj)
  select case langj
  case "af"
    outstr="南非荷蘭語"
  case "sq"
    outstr="阿爾巴尼亞語"
  case "ar-ae"
    outstr="阿拉伯語 - 阿拉伯聯合酋長國"
  case "ar-bh"
    outstr="阿拉伯語 - 巴林"
  case "ar-dz"
    outstr="阿拉伯語 - 阿爾及利亞"
  case "ar-eg"
    outstr="阿拉伯語 - 埃及"
  case "ar-iq"
    outstr="阿拉伯語 - 伊拉克"
  case "ar-jo"
    outstr="阿拉伯語 - 約旦"
  case "ar-kw"
    outstr="阿拉伯語 - 科威特"
  case "ar-lb"
    outstr="阿拉伯語 - 黎巴嫩"
  case "ar-ly"
    outstr="阿拉伯語 - 利比亞"
  case "ar-ma"
    outstr="阿拉伯語 - 摩洛哥"
  case "ar-om"
    outstr="阿拉伯語 - 阿曼"
  case "ar-qa"
    outstr="阿拉伯語 - 卡塔爾"
  case "ar-sa"
    outstr="阿拉伯語 - 沙烏地阿拉伯"
  case "ar-sy"
    outstr="阿拉伯語 - ?利亞"
  case "ar-tn"
    outstr="阿拉伯語 - 突尼斯"
  case "ar-ye"
    outstr="阿拉伯語 - 也門"
  case "hy"
    outstr="亞美尼亞語"
  case "az-az"
    outstr="阿澤?婸y - 拉丁"
  case "az-az"
    outstr="阿澤?婸y - 西?媞蜓y"
  case "eu"
    outstr="巴斯克語"
  case "be"
    outstr="白俄羅斯語"
  case "bg"
    outstr="保加利亞語"
  case "ca"
    outstr="加泰羅尼亞語"
  case "zh"
    outstr="中文"
  case "zh-cn"
    outstr="中文 - 中華人民共和國"
  case "zh-hk"
    outstr="中文 - 中華人民共和國香港特別行政區"
  case "zh-mo"
    outstr="中文 - 中華人民共和國澳門特別行政區"
  case "zh-sg"
    outstr="中文 - 新加坡"
  case "zh-tw"
    outstr="中文 - 臺灣地區"
  case "hr"
    outstr="克羅地亞語"
  case "cs"
    outstr="捷克語"
  case "da"
    outstr="丹麥語"
  case "nl"
    outstr="荷蘭語"
  case "nl-nl"
    outstr="荷蘭語"
  case "nl-be"
    outstr="荷蘭語 - 比利時"
  case "en"
    outstr="英語"
  case "en-au"
    outstr="英語 - 澳大利亞"
  case "en-bz"
    outstr="英語 - 伯利茲"
  case "en-ca"
    outstr="英語 - 加拿大"
  case "en-cb"
    outstr="英語 - 加勒比地區"
  case "en-ie"
    outstr="英語 - 愛爾蘭"
  case "en-jm"
    outstr="英語 - 牙買加"
  case "en-nz"
    outstr="英語 - 新西蘭"
  case "en-ph"
    outstr="英語 - 菲律賓"
  case "en-za"
    outstr="英語 - 南非"
  case "en-tt"
    outstr="英語 - 特立尼達島"
  case "en-gb"
    outstr="英語 - 英國"
  case "en-us"
    outstr="英語 - 美國"
  case "et"
    outstr="愛沙尼亞語"
  case "fa"
    outstr="波斯語"
  case "fi"
    outstr="芬蘭語"
  case "fo"
    outstr="法羅語"
  case "fr"
    outstr="法語"
  case "fr-fr"
    outstr="法語 - 法國"
  case "fr-be"
    outstr="法語 - 比利時"
  case "fr-ca"
    outstr="法語 - 加拿大"
  case "fr-lu"
    outstr="法語 - 盧森堡"
  case "fr-ch"
    outstr="法語 - 瑞士"
  case "gd-ie"
    outstr="蓋爾語 - 愛爾蘭"
  case "gd"
    outstr="蓋爾語 - 蘇格蘭"
  case "de"
    outstr="德語"
  case "de-de"
    outstr="德語 - 德國"
  case "de-at"
    outstr="德語 - 奧地利"
  case "de-li"
    outstr="德語 - 列支敦士登"
  case "de-lu"
    outstr="德語 - 盧森堡"
  case "de-ch"
    outstr="德語 - 瑞士"
  case "el"
    outstr="希臘語"
  case "he"
    outstr="希伯來語"
  case "hi"
    outstr="印地語"
  case "hu"
    outstr="匈牙利語"
  case "is"
    outstr="冰島語"
  case "id"
    outstr="印度尼西亞語"
  case "it"
    outstr="義大利語"
  case "it-it"
    outstr="義大利語 - 義大利"
  case "it-ch"
    outstr="義大利語 - 瑞士"
  case "ja"
    outstr="日語"
  case "ko"
    outstr="朝鮮語"
  case "lv"
    outstr="拉脫維亞語"
  case "lt"
    outstr="立陶宛語"
  case "mk"
    outstr="FYRO 馬其頓語"
  case "ms-my"
    outstr="馬來語 - 馬來西亞"
  case "ms-bn"
    outstr="馬來語 - 汶萊"
  case "mt"
    outstr="馬耳他語"
  case "mr"
    outstr="馬拉地語"
  case "no"
    outstr="挪威語"
  case "no-no"
    outstr="挪威語 - 博克馬爾"
  case "no-no"
    outstr="挪威語 - 尼諾斯克"
  case "pl"
    outstr="波蘭語"
  case "pt"
    outstr="葡萄牙語"
  case "pt-pt"
    outstr="葡萄牙語 - 葡萄牙"
  case "pt-br"
    outstr="葡萄牙語 - 巴西"
  case "rm"
    outstr="拉托-羅馬語"
  case "ro"
    outstr="羅馬尼亞語"
  case "ro-mo"
    outstr="羅馬尼亞語 - 摩爾多瓦"
  case "ru"
    outstr="俄語"
  case "ru-mo"
    outstr="俄語 - 摩爾多瓦"
  case "sa"
    outstr="梵語"
  case "sr"
    outstr="塞爾維亞語"
  case "sr-sp"
    outstr="塞爾維亞語 - 西?媞蜓y"
  case "sr-sp"
    outstr="塞爾維亞語 - 拉丁"
  case "tn"
    outstr="茨瓦納語"
  case "sl"
    outstr="斯洛文尼亞語"
  case "sk"
    outstr="斯洛伐克語"
  case "sb"
    outstr="索布語"
  case "es"
    outstr="西班牙語"
  case "es-es"
    outstr="西班牙語 - 西班牙"
  case "es-ar"
    outstr="西班牙語 - 阿根廷"
  case "es-bo"
    outstr="西班牙語 - 玻利維亞"
  case "es-cl"
    outstr="西班牙語 - 智利"
  case "es-co"
    outstr="西班牙語 - 哥倫比亞"
  case "es-cr"
    outstr="西班牙語 - 哥斯大黎加"
  case "es-do"
    outstr="西班牙語 - 多明尼加共和國"
  case "es-ec"
    outstr="西班牙語 - 厄瓜多爾"
  case "es-gt"
    outstr="西班牙語 - 危地馬拉"
  case "es-hn"
    outstr="西班牙語 - 宏都拉斯"
  case "es-mx"
    outstr="西班牙語 - 墨西哥"
  case "es-ni"
    outstr="西班牙語 - 尼加拉瓜"
  case "es-pa"
    outstr="西班牙語 - 巴拿馬"
  case "es-pe"
    outstr="西班牙語 - 秘魯"
  case "es-pr"
    outstr="西班牙語 - 波多黎各"
  case "es-py"
    outstr="西班牙語 - 巴拉圭"
  case "es-sv"
    outstr="西班牙語 - 薩爾瓦多"
  case "es-uy"
    outstr="西班牙語 - 烏拉圭"
  case "es-ve"
    outstr="西班牙語 - 委內瑞拉"
  case "sx"
    outstr="蘇圖語"
  case "sw"
    outstr="斯瓦希?婸y"
  case "sv"
    outstr="瑞典語"
  case "sv-se"
    outstr="瑞典語"
  case "sv-fi"
    outstr="瑞典語 - 芬蘭"
  case "ta"
    outstr="泰米爾語"
  case "tt"
    outstr="韃靼語"
  case "th"
    outstr="泰語"
  case "tr"
    outstr="土耳其語"
  case "ts"
    outstr="湯加語"
  case "uk"
    outstr="烏克蘭語"
  case "ur"
    outstr="烏爾都語 - 巴基斯坦"
  case "uz-uz"
    outstr="烏茲別克語 - 西?媞?"
  case "uz-uz"
    outstr="烏茲別克語 - 拉丁"
  case "vi"
    outstr="越南語"
  case "xh"
    outstr="科薩語"
  case "yi"
    outstr="意第緒語"
  case "zu"
    outstr="祖魯語"
  case else
    outstr="未知"
  end select
  clangcht=outstr & " (" & langj & ")"
end function
%>
