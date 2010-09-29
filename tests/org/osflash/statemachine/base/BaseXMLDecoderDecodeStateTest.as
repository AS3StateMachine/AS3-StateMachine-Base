package org.osflash.statemachine.base {
import org.flexunit.Assert;
import org.osflash.statemachine.core.IState;
import org.osflash.statemachine.support.StateDefinitions;

public class BaseXMLDecoderDecodeStateTest extends BaseXMLStateDecoder {

	public function BaseXMLDecoderDecodeStateTest(){
		super( new StateDefinitions().data )
	}

	
	[Test]
    public function test():void{
       // get list, it will call decodeState below
		var stateList:Array = getStateList();
		// test that all nodes have been iterated through
		Assert.assertEquals("The number of state elements in the data should equal the length of stateList", getData().state.length(), stateList.length);
		// get xmllist of all state names from the data object then test against the stateList items
		var stateNameList:XMLList = getData().state.@name;
		for each (var state:Object in stateList){
			Assert.assertTrue("All items should be IStates", state is IState );
			Assert.assertTrue("The name of the IState should be a child of the stateNameList", stateNameList.contains( state.name  ) );
		}
    }

	override public function decodeState(stateDef:Object):IState {
		// test that the stateDef argument is passed correctly, it should be contained within the data object
		Assert.assertTrue("The stateDef argument should be a child of the data object", getData().state.contains( stateDef ) );
		// create a new IState to return
		return new BaseState(stateDef.@name.toString());
	}
}
}
