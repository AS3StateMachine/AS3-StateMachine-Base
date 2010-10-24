package org.osflash.statemachine {
import org.flexunit.Assert;
import org.osflash.statemachine.base.BaseTransitionController;
import org.osflash.statemachine.core.IStateDecoder;
import org.osflash.statemachine.core.IStateMachine;
import org.osflash.statemachine.supporting.MockXMLStateDecoder;
import org.osflash.statemachine.supporting.SetCurrentStateTransitionController;
import org.osflash.statemachine.supporting.StateDefinitions;

public class FSMInjectorDestroyTest extends FSMInjector {
	
	
	private var _testDecoder:IStateDecoder;

	public function FSMInjectorDestroyTest() {
		_testDecoder = new MockXMLStateDecoder( new StateDefinitions().data );
		super( _testDecoder );
	}


	[Test]
	public function test ():void	{
		Assert.assertStrictlyEquals( "the stateDecoder, should be the one set in the constructor",_testDecoder, _stateDecoder );
		Assert.assertFalse( "the destroy method in the stateDecoder should not yet have been called", MockXMLStateDecoder(_testDecoder).hasDestroyMethodBeenCalled );
		destroy();
		Assert.assertNull( "the stateDecoder should now be null", _stateDecoder );
		Assert.assertTrue( "the destroy method on the stateDecoder should have been called", MockXMLStateDecoder(_testDecoder).hasDestroyMethodBeenCalled );
	}

	[After]
	public function after():void{
		_testDecoder = null;
	}
}
}