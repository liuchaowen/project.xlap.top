<%
function cClientcht(strcj,tClient)
  select case tClient
  case 2
    cClientcht=clang(strcj)
  case 4
    cClientcht=replace(strcj,",","��")
  case 5
    cClientcht="2<sup>" & strcj & "</sup> ��"
  case 6
    cClientcht="�� " & strcj & " ���X��"
  case 8
    cClientcht="�@�f���s�� " & strcj & " ��"
  case else
    cClientcht=strcj
  end select
end function


function cLangcht(Langj)
  select case langj
  case "af"
    outstr="�n�D�����y"
  case "sq"
    outstr="�����ڥ��Ȼy"
  case "ar-ae"
    outstr="���ԧB�y - ���ԧB�p�X������"
  case "ar-bh"
    outstr="���ԧB�y - �ڪL"
  case "ar-dz"
    outstr="���ԧB�y - �����ΧQ��"
  case "ar-eg"
    outstr="���ԧB�y - �J��"
  case "ar-iq"
    outstr="���ԧB�y - ��ԧJ"
  case "ar-jo"
    outstr="���ԧB�y - ����"
  case "ar-kw"
    outstr="���ԧB�y - ��¯S"
  case "ar-lb"
    outstr="���ԧB�y - ���ڹ�"
  case "ar-ly"
    outstr="���ԧB�y - �Q���"
  case "ar-ma"
    outstr="���ԧB�y - ������"
  case "ar-om"
    outstr="���ԧB�y - ����"
  case "ar-qa"
    outstr="���ԧB�y - �d��"
  case "ar-sa"
    outstr="���ԧB�y - �F�Q�a���ԧB"
  case "ar-sy"
    outstr="���ԧB�y - ?�Q��"
  case "ar-tn"
    outstr="���ԧB�y - �𥧴�"
  case "ar-ye"
    outstr="���ԧB�y - �]��"
  case "hy"
    outstr="�Ȭ����Ȼy"
  case "az-az"
    outstr="���A�ػy - �ԤB"
  case "az-az"
    outstr="���A�ػy - ���غ��y"
  case "eu"
    outstr="�ڴ��J�y"
  case "be"
    outstr="�իXù���y"
  case "bg"
    outstr="�O�[�Q�Ȼy"
  case "ca"
    outstr="�[��ù���Ȼy"
  case "zh"
    outstr="����"
  case "zh-cn"
    outstr="���� - ���ؤH���@�M��"
  case "zh-hk"
    outstr="���� - ���ؤH���@�M�ꭻ��S�O��F��"
  case "zh-mo"
    outstr="���� - ���ؤH���@�M��D���S�O��F��"
  case "zh-sg"
    outstr="���� - �s�[�Y"
  case "zh-tw"
    outstr="���� - �O�W�a��"
  case "hr"
    outstr="�Jù�a�Ȼy"
  case "cs"
    outstr="���J�y"
  case "da"
    outstr="�����y"
  case "nl"
    outstr="�����y"
  case "nl-nl"
    outstr="�����y"
  case "nl-be"
    outstr="�����y - ��Q��"
  case "en"
    outstr="�^�y"
  case "en-au"
    outstr="�^�y - �D�j�Q��"
  case "en-bz"
    outstr="�^�y - �B�Q��"
  case "en-ca"
    outstr="�^�y - �[���j"
  case "en-cb"
    outstr="�^�y - �[�Ǥ�a��"
  case "en-ie"
    outstr="�^�y - �R����"
  case "en-jm"
    outstr="�^�y - ���R�["
  case "en-nz"
    outstr="�^�y - �s����"
  case "en-ph"
    outstr="�^�y - ��߻�"
  case "en-za"
    outstr="�^�y - �n�D"
  case "en-tt"
    outstr="�^�y - �S�ߥ��F�q"
  case "en-gb"
    outstr="�^�y - �^��"
  case "en-us"
    outstr="�^�y - ����"
  case "et"
    outstr="�R�F���Ȼy"
  case "fa"
    outstr="�i���y"
  case "fi"
    outstr="�����y"
  case "fo"
    outstr="�kù�y"
  case "fr"
    outstr="�k�y"
  case "fr-fr"
    outstr="�k�y - �k��"
  case "fr-be"
    outstr="�k�y - ��Q��"
  case "fr-ca"
    outstr="�k�y - �[���j"
  case "fr-lu"
    outstr="�k�y - �c�˳�"
  case "fr-ch"
    outstr="�k�y - ��h"
  case "gd-ie"
    outstr="�\���y - �R����"
  case "gd"
    outstr="�\���y - Ĭ����"
  case "de"
    outstr="�w�y"
  case "de-de"
    outstr="�w�y - �w��"
  case "de-at"
    outstr="�w�y - ���a�Q"
  case "de-li"
    outstr="�w�y - �C�䴰�h�n"
  case "de-lu"
    outstr="�w�y - �c�˳�"
  case "de-ch"
    outstr="�w�y - ��h"
  case "el"
    outstr="��þ�y"
  case "he"
    outstr="�ƧB�ӻy"
  case "hi"
    outstr="�L�a�y"
  case "hu"
    outstr="�I���Q�y"
  case "is"
    outstr="�B�q�y"
  case "id"
    outstr="�L�ץ���Ȼy"
  case "it"
    outstr="�q�j�Q�y"
  case "it-it"
    outstr="�q�j�Q�y - �q�j�Q"
  case "it-ch"
    outstr="�q�j�Q�y - ��h"
  case "ja"
    outstr="��y"
  case "ko"
    outstr="���A�y"
  case "lv"
    outstr="�Բ���Ȼy"
  case "lt"
    outstr="�߳��{�y"
  case "mk"
    outstr="FYRO ����y�y"
  case "ms-my"
    outstr="���ӻy - ���Ӧ��"
  case "ms-bn"
    outstr="���ӻy - �Z��"
  case "mt"
    outstr="���եL�y"
  case "mr"
    outstr="���Ԧa�y"
  case "no"
    outstr="���»y"
  case "no-no"
    outstr="���»y - �էJ����"
  case "no-no"
    outstr="���»y - ���մ��J"
  case "pl"
    outstr="�i���y"
  case "pt"
    outstr="������y"
  case "pt-pt"
    outstr="������y - �����"
  case "pt-br"
    outstr="������y - �ڦ�"
  case "rm"
    outstr="�Ԧ�-ù���y"
  case "ro"
    outstr="ù�����Ȼy"
  case "ro-mo"
    outstr="ù�����Ȼy - �����h��"
  case "ru"
    outstr="�X�y"
  case "ru-mo"
    outstr="�X�y - �����h��"
  case "sa"
    outstr="��y"
  case "sr"
    outstr="�뺸���Ȼy"
  case "sr-sp"
    outstr="�뺸���Ȼy - ���غ��y"
  case "sr-sp"
    outstr="�뺸���Ȼy - �ԤB"
  case "tn"
    outstr="���˯ǻy"
  case "sl"
    outstr="�����奧�Ȼy"
  case "sk"
    outstr="������J�y"
  case "sb"
    outstr="�����y"
  case "es"
    outstr="��Z���y"
  case "es-es"
    outstr="��Z���y - ��Z��"
  case "es-ar"
    outstr="��Z���y - ���ڧ�"
  case "es-bo"
    outstr="��Z���y - ���Q����"
  case "es-cl"
    outstr="��Z���y - ���Q"
  case "es-co"
    outstr="��Z���y - ���ۤ��"
  case "es-cr"
    outstr="��Z���y - �����j���["
  case "es-do"
    outstr="��Z���y - �h�����[�@�M��"
  case "es-ec"
    outstr="��Z���y - �̥ʦh��"
  case "es-gt"
    outstr="��Z���y - �M�a����"
  case "es-hn"
    outstr="��Z���y - �����Դ�"
  case "es-mx"
    outstr="��Z���y - �����"
  case "es-ni"
    outstr="��Z���y - ���[�ԥ�"
  case "es-pa"
    outstr="��Z���y - �ڮ���"
  case "es-pe"
    outstr="��Z���y - ���|"
  case "es-pr"
    outstr="��Z���y - �i�h���U"
  case "es-py"
    outstr="��Z���y - �کԦc"
  case "es-sv"
    outstr="��Z���y - �ĺ��˦h"
  case "es-uy"
    outstr="��Z���y - �Q�Ԧc"
  case "es-ve"
    outstr="��Z���y - �e�����"
  case "sx"
    outstr="Ĭ�ϻy"
  case "sw"
    outstr="���˧��ػy"
  case "sv"
    outstr="���y"
  case "sv-se"
    outstr="���y"
  case "sv-fi"
    outstr="���y - ����"
  case "ta"
    outstr="���̺��y"
  case "tt"
    outstr="Ŷ�޻y"
  case "th"
    outstr="���y"
  case "tr"
    outstr="�g�ը�y"
  case "ts"
    outstr="���[�y"
  case "uk"
    outstr="�Q�J���y"
  case "ur"
    outstr="�Q�����y - �ڰ򴵩Z"
  case "uz-uz"
    outstr="�Q���O�J�y - ���غ�"
  case "uz-uz"
    outstr="�Q���O�J�y - �ԤB"
  case "vi"
    outstr="�V�n�y"
  case "xh"
    outstr="���Ļy"
  case "yi"
    outstr="�N�ĺ��y"
  case "zu"
    outstr="���|�y"
  case else
    outstr="����"
  end select
  clangcht=outstr & " (" & langj & ")"
end function
%>
