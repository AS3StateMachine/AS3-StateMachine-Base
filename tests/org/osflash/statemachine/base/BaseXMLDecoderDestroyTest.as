package org.osflash.statemachine.base {
import org.flexunit.Assert;
import org.osflash.statemachine.supporting.StateDefinitions;

public class BaseXMLDecoderDestroyTest extends BaseXMLStateDecoder {

	private var _testData:XML;

	public function BaseXMLDecoderDestroyTest(){
		_testData = new StateDefinitions().data;		
		super( _testData );
	}

	[Test]
    public function test():void{
		Assert.assertStrictlyEquals( "the data should be that set in the constructor", _testData, getData());
		destroy();
		Assert.assertNull( "the data should now be null", getData() );
    }

	[After]
	public function after():void{
		_testData = null;
	}
}
}
