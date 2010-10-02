package org.osflash.statemachine.base {
import org.flexunit.Assert;
import org.osflash.statemachine.supporting.StateDefinitions;

public class BaseXMLDecoderIsInitialTest extends BaseXMLStateDecoder {

	public function BaseXMLDecoderIsInitialTest(){
		super( new StateDefinitions().data )
	}

	[Test]
    public function test():void{
        Assert.assertFalse( "StateDefinitions.STARTING Should return false", isInitial( StateDefinitions.STARTING ) );
        Assert.assertFalse( "StateDefinitions.NAVIGATING Should return false", isInitial( StateDefinitions.NAVIGATING ) );
        Assert.assertFalse( "StateDefinitions.FAILING Should return false", isInitial( StateDefinitions.FAILING ) );
		Assert.assertTrue( "StateDefinitions.CONSTRUCTING Should return true", isInitial( StateDefinitions.CONSTRUCTING ) );
    }
}
}
