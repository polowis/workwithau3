#include<ie.au3>

;spamming message on facebook

Global $web =  _IECreate('LINK AND ID GOES HERE')
$spam = _IEGetObjByName($web, 'body')
$nut = _IEGetObjByName($web, 'send')
$info = InputBox(0, 'what do you want to say', '')
$amount = InputBox(0, 'amount', '')
$delay = InputBox(0, 'Delay time', '')
for $i = 1 to $amount step 1
_IEFormElementSetValue($spam, $i&$info)
_IEAction($nut, 'click')
Sleep($delay)
Next
