package org.osflash.statemachine {
import org.flexunit.Assert;
import org.osflash.statemachine.base.BaseTransitionController;
import org.osflash.statemachine.core.IStateMachine;
import org.osflash.statemachine.support.MockXMLStateDecoder;
import org.osflash.statemachine.support.SetCurrentStateTransitionController;
import org.osflash.statemachine.support.StateDefinitions;

public class FSMInjectorInjectionTest extends FSMInjector {
	
	private var _sm:IStateMachine;

	public function FSMInjectorInjectionTest() {
		super( new MockXMLStateDecoder( new StateDefinitions().data ) );
	}

	[Before]
	public function before():void {
		_sm = new StateMachine( new SetCurrentStateTransitionController() );
		inject( _sm );
	}

	[Test]
	public function test ():void	{
		// test current state (will test that the onRegister method has been called)
		Assert.assertEquals("The initial state should be the current state", StateDefinitions.CONSTRUCTING, _sm.currentStateName );
		// test all states are registered
		Assert.assertTrue( "The state should be registered (1)", _sm.hasState( StateDefinitions.STARTING ) );
		Assert.assertTrue( "The state should be registered (2)", _sm.hasState( StateDefinitions.CONSTRUCTING ) );
		Assert.assertTrue( "The state should be registered (3)", _sm.hasState( StateDefinitions.NAVIGATING ) );
		Assert.assertTrue( "The state should be registered (4)", _sm.hasState( StateDefinitions.FAILING ) );
	}
}
}