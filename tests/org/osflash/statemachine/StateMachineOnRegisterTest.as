package org.osflash.statemachine {
import org.flexunit.Assert;
import org.osflash.statemachine.base.BaseState;
import org.osflash.statemachine.support.SetCurrentStateTransitionController;

public class StateMachineOnRegisterTest extends StateMachine {
	public function StateMachineOnRegisterTest(){
		super( new SetCurrentStateTransitionController());
	}

	[Before]
	public function before():void{
		 initial = new BaseState( "state/Initial");
	}

	[After]
	public function after():void{
		 initial = null;
	}

	 [Test]
    public function test():void{
        onRegister();
        Assert.assertEquals( "currentStateName should equal the initial state name", initial.name, currentStateName);
    }
}
}