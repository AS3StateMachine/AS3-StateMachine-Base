package org.osflash.statemachine.base {
import org.flexunit.Assert;
import org.osflash.statemachine.core.IState;

public class BaseTransitionControllerSetCurrentStateTest extends BaseTransitionController {


	 private var _baseState:IState;

    [Before]
    public function before():void {
        _baseState = new BaseState( "TestState" );
    }

    [After]
    public function after():void {
        _baseState = null;
    }

	[Test]
	public function test():void{
		 // test initial assumptions are correct
        Assert.assertNull( "The current state should be null", currentState );
        // set state
        setCurrentState( _baseState );
        // test success
        Assert.assertStrictlyEquals("The currentState should be the one that was passed up", _baseState, currentState );
        // clean up
        destroy();
        // and test
        Assert.assertNull("The current state should be null after calling destroy()", currentState);
	}
}
}