package org.osflash.statemachine.base {
import org.flexunit.Assert;
import org.osflash.statemachine.core.IState;

public class BaseTransitionControllerCancelTransitionTest extends BaseTransitionController {

	 private var _payload:Object;
    private var _baseState:IState;
    private var _onTransitionCalled:Boolean;
    private var _cancellationReason:String;
    private var _cancellationPayload:Object;
	private var _dispatchGeneralStateChangedCalled:Boolean;

    [Before]
    public function before():void {
        _payload = {};
        _cancellationPayload= {};
	    _cancellationReason = "testing";
        _baseState = new BaseState( "testState");
    }
    [After]
    public function after():void {
        _payload = null;
        _cancellationPayload = null;
	    _cancellationReason = null;
        _baseState = null;
    }

    [Test (order="6")]
    public function test():void{
        // do the transition
        transition( _baseState, _payload );
        // onTransition should have been called
        Assert.assertTrue("onTransition method should have been called", _onTransitionCalled );
	     // onTransition should not have been called
	    Assert.assertFalse("dispatchGeneralStateChanged method should have been called", _dispatchGeneralStateChangedCalled );
         // test properties have been reset
        Assert.assertNull( "The cachedPayload property should be null (2)", cachedPayload );
	    Assert.assertNull( "The cancellationReason property should be null (2)", cancellationReason );
        Assert.assertFalse( "The isCanceled property should be false (2)", isCanceled );
    }

    override protected function onTransition(target:IState, payload:Object):void {
	    // marked as called
	    _onTransitionCalled = true;
	    // test arguments
	    Assert.assertStrictlyEquals( "The target parameter should be the one passed in the transition method", _baseState, target );
	    Assert.assertStrictlyEquals( "The payload parameter should be the one passed in the transition method", _payload, payload );
	    // test assumptions
	    Assert.assertNull( "The cachedPayload property should be null (1)", cachedPayload );
	    Assert.assertNull( "The cancellationReason property should be null (1)", cancellationReason );
	    Assert.assertFalse( "The isCanceled property should be false (1)", isCanceled );
	    // cancel
	    handleCancel( _cancellationReason, _cancellationPayload );
	    // test super properties
	    Assert.assertEquals("The cancelationReason property should equal that passed in the handleCancel method", _cancellationReason, cancellationReason);
        Assert.assertStrictlyEquals("The cachedPayload property should equal that passed in the handleCancel method", _cancellationPayload, cachedPayload);
        Assert.assertTrue("The isCanceled flag should be set to true", isCanceled);
    }

	// this method should not be called
	override protected function dispatchGeneralStateChanged():void{
		// marked as called
		_dispatchGeneralStateChangedCalled = true;
	}
}
}