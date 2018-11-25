#include<ie.au3>
Global $web =  _IECreate('https://m.facebook.com/messages/read/?tid=1424327650959404&entrypoint=web%3Atrigger%3Ajewel_see_all_messages')
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
