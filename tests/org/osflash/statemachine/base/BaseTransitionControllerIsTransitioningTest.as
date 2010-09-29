package org.osflash.statemachine.base {
import org.flexunit.Assert;
import org.osflash.statemachine.core.IState;

public class BaseTransitionControllerIsTransitioningTest extends BaseTransitionController {

	private var _onTransitionCalled:Boolean;
	private var _dispatchGeneralStateChangedCalled:Boolean;
	
	[Before]
	public function before():void{
	}

	[After]
	public function after():void{
	}

	[Test]
	 public function test():void{
        // test initial assumptions are correct
        Assert.assertFalse( "Should not be transitioning yet", isTransitioning );
        // start transition
        transition( null );
        // test methods were called
        Assert.assertTrue( "onTransition method should have been called", _onTransitionCalled);
		Assert.assertTrue( "dispatchGeneralStateChanged method should have been called", _dispatchGeneralStateChangedCalled);
        // test value is reset
        Assert.assertFalse( "isTransitioning flag should now be reset to false", isTransitioning );
    }

    override protected function onTransition(target:IState, payload:Object):void {
        // mark as being called
        _onTransitionCalled = true;
        // test isTransitioning now true
        Assert.assertTrue( "isTransitioning flag should now be true", isTransitioning );
    }

	override protected function dispatchGeneralStateChanged():void{
		_dispatchGeneralStateChangedCalled = true;
		 Assert.assertFalse( "isTransitioning flag should now be false", isTransitioning );
	}
}
}