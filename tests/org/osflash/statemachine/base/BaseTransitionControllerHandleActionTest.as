package org.osflash.statemachine.base {
import org.flexunit.Assert;

public class BaseTransitionControllerHandleActionTest extends BaseTransitionController {
	private var _handleActionCalled:Boolean;
	private var _payload:Object;
	private var _action:String;

	
    [Before]
    public function before():void {
        _action = "testAction";
        _payload = {};
    }

	[After]
	public function after():void{
		 _action = null;
        _payload = null;
	}

	[Test]
	public function test():void{
		// call handle action before setting the actionCallBack to test that it fails
        Assert.assertFalse( "This should fail, as the actionCallBack has not been set", handleAction( _action, _payload ) );
        // test onActionTest  has not been called
        Assert.assertFalse( "onActionTest should not yet have been called", _handleActionCalled );
		 // set callback
        actionCallback = onActionTest;
        // this time the call should succeed
        Assert.assertTrue("This should succeed, as the actionCallBack has been set", handleAction( _action, _payload ));
        // test it has been called
        Assert.assertTrue( "onActionTest should have been called", _handleActionCalled );
		//
		destroy();

		// Calling handleAction should fail again
		 Assert.assertFalse( "This should fail, as the actionCallBack has been removed", handleAction( _action, _payload ) );
        // test onActionTest  has not been called
        Assert.assertFalse( "onActionTest should not have been called", _handleActionCalled );
	}

	public override function destroy():void{
		_handleActionCalled = false;
		super.destroy();
	}

	 private function onActionTest( action:String, payload:Object ):void {
        // mark as being called
        _handleActionCalled = true;
		 // test arguments
        Assert.assertStrictlyEquals("The action property should have been passed correctly", _action, action);
        Assert.assertStrictlyEquals("The payload property should have been passed correctly", _payload, payload);

    }
}
}