package org.osflash.statemachine {
import org.flexunit.Assert;
import org.osflash.statemachine.base.BaseState;
import org.osflash.statemachine.supporting.SetCurrentStateTransitionController;

public class StateMachineGetCurrentStateNameTest extends StateMachine {
	public function StateMachineGetCurrentStateNameTest(){
		super(new SetCurrentStateTransitionController());
	}

	[Before]
	public function before():void{
	}

	[After]
	public function after():void{
	}

	[Test]
	public function test():void{
		transitionTo( new BaseState("state/test") );
		Assert.assertEquals ("Should be value passed in transitionTo method", "state/test", currentStateName );
	}
}
}