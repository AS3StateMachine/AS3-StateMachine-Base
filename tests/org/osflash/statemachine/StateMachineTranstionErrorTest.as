package org.osflash.statemachine {
import org.osflash.statemachine.base.BaseState;
import org.osflash.statemachine.base.BaseTransitionController;
import org.osflash.statemachine.supporting.IsTransitionTrueTransitionController;

public class StateMachineTranstionErrorTest extends StateMachine {
	public function StateMachineTranstionErrorTest(){
		super(new IsTransitionTrueTransitionController());
	}

	[Before]
	public function before():void{
	}

	[After]
	public function after():void{
	}

	[Test (expects="org.osflash.statemachine.errors.StateTransitionError")]
	public function test():void{
		// the TransitionController is mocked up to return isTransitioning = true
		// which should throw the expected error
		transitionTo( new BaseState("state/target"));
	}
}
}