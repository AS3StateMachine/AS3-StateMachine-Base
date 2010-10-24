package org.osflash.statemachine {
import org.flexunit.Assert;
import org.osflash.statemachine.base.BaseState;
import org.osflash.statemachine.supporting.SetCurrentStateTransitionController;

public class StateMachineDestroyTest extends StateMachine {

	private var _initialState:BaseState;
    private var _currentState:BaseState;

	public function StateMachineDestroyTest(){
		super( new SetCurrentStateTransitionController());
	}

	 [Before]
    public function before():void{

		// REGISTER TWO STATES, ONE WILL BE INITIAL, THE OUTHER THE CURRENT
        _initialState = new BaseState("state/initial");
        _initialState.defineTrans( "action/next", "state/current");
        registerState( _initialState, true );

        _currentState = new BaseState("state/current");
        _currentState.defineTrans( "action/next", "state/test");
        registerState( _currentState );

		// this will load _initialState into the initial property
        onRegister();

		 // this will load _currentState into the currentState
        doAction( "action/next", null );
    }

    [Test]
    public function test():void{
        // check initial assumptions
        Assert.assertStrictlyEquals( "Initial state should be the one passed in the before method", _initialState, _initial );
        Assert.assertEquals(  "Current state should be the one passed in the before method", _currentState.name, currentStateName );
        // do the deed
        destroy();
        // test that all are destroyed
        Assert.assertNull( "transitionController should now be null", _transitionController );
        Assert.assertNull( "initial state should now be null", _initial );
        Assert.assertNull( "states property should now be null", _states );
        Assert.assertFalse( "the states should also be destroyed (1)", _initialState.hasTrans("action/next") );
        Assert.assertFalse( "the states should also be destroyed (2)", _currentState.hasTrans("action/next") );
    }
}
}