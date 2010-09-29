package org.osflash.statemachine.base {
import org.flexunit.Assert;
import org.osflash.statemachine.core.IState;

public class BaseTransitionControllerTransitionTest extends BaseTransitionController {

	private var _payload:Object;
    private var _baseState:IState;
    private var _onTransitionCalled:Boolean;
	private var _dispatchGeneralStateChangedCalled:Boolean;

	 [Before]
    public function before():void {
        _payload = {};
        _baseState = new BaseState( "testState");
    }
    [After]
    public function after():void {
        _payload = null;
        _baseState = null;
    }

    [Test (order="6")]
    public function test():void{
        // do the transition
        transition( _baseState, _payload );
        // test methods have been called
        Assert.assertTrue("onTransitionMethod shouls have been called", _onTransitionCalled );
	    Assert.assertTrue("dispatchGeneralStateChanged shouls have been called", _dispatchGeneralStateChangedCalled );
         // test properties have been reset
        Assert.assertNull( "The cachedPayload property should be null (3)", cachedPayload );
	    Assert.assertNull( "The cancellationReason property should be null (3)", cancellationReason );
        Assert.assertFalse( "The isCanceled property should be false (3)", isCanceled );
    }

    override protected function onTransition(target:IState, payload:Object):void {
        // marked as called
        _onTransitionCalled = true;
        // test arguments
        Assert.assertStrictlyEquals( "The target parameter should be the one passed in the transition method", _baseState, target );
        Assert.assertStrictlyEquals( "The payload parameter should be the one passed in the transition method", _payload, payload );
	    // test super properties
	    Assert.assertNull( "The cachedPayload property should be null (1)", cachedPayload );
	    Assert.assertNull( "The cancellationReason property should be null (1)", cancellationReason );
        Assert.assertFalse( "The isCanceled property should be false (1)", isCanceled );
    }

	override protected function dispatchGeneralStateChanged():void{
		// marked as called
		_dispatchGeneralStateChangedCalled = true;
		 // test super properties
		Assert.assertNull( "The cachedPayload property should be null (2)", cachedPayload );
	    Assert.assertNull( "The cancellationReason property should be null (2)", cancellationReason );
        Assert.assertFalse( "The isCanceled property should be false (2)", isCanceled );
	}
}
}