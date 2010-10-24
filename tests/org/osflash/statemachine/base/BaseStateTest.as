package org.osflash.statemachine.base {
import org.flexunit.Assert;

public class BaseStateTest extends BaseState {
	public function BaseStateTest(){
		super( "TestStateName" )
	}

	[Test]
	public function test():void{
		//test name
		Assert.assertEquals("Name as defined in constructor", "TestStateName", name );
		//test initial assumptions are correct
		Assert.assertFalse( "No transitions have been defined (1)", hasTrans("action/next") );
		Assert.assertFalse( "No transitions have been defined (2)", hasTrans("action/error") );
		Assert.assertFalse( "No transitions have been defined (3)", hasTrans("action/previous") );
		//add some transitions
		Assert.assertTrue( "Defining transition should succeed (1)", defineTrans("action/next", "state/starting") );
		Assert.assertTrue( "Defining transition should succeed (2)", defineTrans("action/error", "state/erroring") );
		Assert.assertTrue( "Defining transition should succeed (3)", defineTrans("action/previous", "state/idling" ) );
		//test they are now defined
		Assert.assertTrue( "Transition should exist (1)", hasTrans("action/next") );
		Assert.assertTrue( "Transition should exist (2)", hasTrans("action/error") );
		Assert.assertTrue( "Transition should exist (3)", hasTrans("action/previous") );
		// add them again, but assert false, as they should fail
		Assert.assertFalse( "Defining existing transition should fail (1)", defineTrans("action/next", "state/starting") );
		Assert.assertFalse( "Defining existing transition should fail (2)", defineTrans("action/error", "state/erroring") );
		Assert.assertFalse( "Defining existing transition should fail (3)", defineTrans("action/previous", "state/idling" ) );
		//get the targets
		Assert.assertEquals( "Target should match from definition (1)", "state/starting", getTarget("action/next") );
		Assert.assertEquals( "Target should match from definition (2)", "state/erroring", getTarget("action/error") );
		Assert.assertEquals( "Target should match from definition (3)", "state/idling", getTarget("action/previous") );
		//remove the transitions
		Assert.assertTrue( "Removing existing transition should succeed (1)", removeTrans("action/next") );
		Assert.assertTrue( "Removing existing transition should succeed (2)", removeTrans("action/error") );
		Assert.assertTrue( "Removing existing transition should succeed (3)", removeTrans("action/previous") );
		//test that they have been removed
		Assert.assertFalse( "Transition should not exist (1)", hasTrans("action/next") );
		Assert.assertFalse( "Transition should not exist (2)", hasTrans("action/error") );
		Assert.assertFalse( "Transition should not exist (3)", hasTrans("action/previous") );
		//remove them again, but asserting false as it should fail
		Assert.assertFalse( "Removing non-existent transition should fail (1)", removeTrans("action/next") );
		Assert.assertFalse( "Removing non-existent transition should fail (2)", removeTrans("action/error") );
		Assert.assertFalse( "Removing non-existent transition should fail (3)", removeTrans("action/previous") );
		//
		destroy();
		// test transitions is null
		Assert.assertNull( "Transition property should be null after calling destroy()", _transitions );
	}

}
}
