package org.osflash.statemachine {
import org.flexunit.Assert;
import org.osflash.statemachine.base.BaseState;
import org.osflash.statemachine.base.BaseTransitionController;

public class StateMachineRegisterStateTest extends StateMachine {
	public function StateMachineRegisterStateTest(){
		super( new BaseTransitionController());
	}

	[Before]
	public function before():void{
	}

	[After]
	public function after():void{
	}

	[Test]
	public function test():void{
		 // test initial assumptions
        Assert.assertFalse( "No states have been registered yet (1)", hasState( "state/first" ) );
        Assert.assertFalse( "No states have been registered yet (2)", hasState( "state/second" ) );
        Assert.assertFalse( "No states have been registered yet (3)", hasState( "state/third" ) );
        // register some states
        Assert.assertTrue( "Registering new state should succeed (1)", registerState( new BaseState("state/first") ) );
        Assert.assertTrue( "Registering new state should succeed (2)", registerState( new BaseState("state/second") ) );
        Assert.assertTrue( "Registering new state should succeed (3)", registerState( new BaseState("state/third") ) );
		 // are they there?
        Assert.assertTrue( "State should be registered (1)", hasState( "state/first" ) );
        Assert.assertTrue( "State should be registered (2)", hasState( "state/second" ) );
        Assert.assertTrue( "State should be registered (3)", hasState( "state/third" ) );
        // and again, but assert false as they should fail
        Assert.assertFalse( "Registering state with existing name should fail (1)", registerState( new BaseState("state/first") ) );
        Assert.assertFalse( "Registering state with existing name should fail (2)", registerState( new BaseState("state/second") ) );
        Assert.assertFalse( "Registering state with existing name should fail (3)", registerState( new BaseState("state/third") ) );
        // remove one
        Assert.assertTrue( "Removal of registered state should succeed (1)", removeState( "state/second" ) );
        // and test
        Assert.assertTrue( "State should still be registered (1)", hasState( "state/first" ) );
		Assert.assertTrue( "State should still be registered (2)", hasState( "state/third" ) );
		Assert.assertFalse( "State should have been removed (1)", hasState( "state/second" ) );
		// remove it again, it should fail
		Assert.assertFalse( "Removal of non-existing state should fail (1)", removeState( "state/second" ) );
        // remove the rest 
        Assert.assertTrue( "Removal of registered state should succeed (2)", removeState( "state/third" ) );
		Assert.assertTrue( "Removal of registered state should succeed (3)", removeState( "state/first" ) );
        // and test
        Assert.assertFalse( "State should have been removed (2)", hasState( "state/first" ) );
        Assert.assertFalse( "State should have been removed (3)", hasState( "state/third" ) );
	}
}
}