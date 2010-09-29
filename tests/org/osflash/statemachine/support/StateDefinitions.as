package org.osflash.statemachine.support {
public class StateDefinitions {
	////////
	// State Machine Constants and Vars
	///////
	public static const STARTING:String              = "state/starting";
	public static const STARTED:String               = "action/completed/start";
	public static const START_FAILED:String          = "action/start/failed";

	public static const CONSTRUCTING:String          = "state/constructing";
	public static const CONSTRUCT:String             = "event/construct";
	public static const CONSTRUCT_ENTERING:String    = "action/construct/entering";
	public static const CONSTRUCTED:String           = "action/completed/construction";
	public static const CONSTRUCTION_EXIT:String     = "event/construction/exit";
	public static const CONSTRUCTION_FAILED:String   = "action/contruction/failed";

	public static const NAVIGATING:String  	      = "state/navigating";
	public static const NAVIGATE:String  			  = "event/navigate";

	public static const FAILING:String  	  		  = "state/failing";
	public static const FAIL:String  	  		  	  = "event/fail";

	public function get data():XML{
		return _test_fsm.copy();
	}


	private var _test_fsm:XML =
			<fsm initial={CONSTRUCTING}>

				<!-- THE INITIAL STATE -->
				<state name={STARTING}>

					<transition action={STARTED}
					target={CONSTRUCTING}/>

					<transition action={START_FAILED}
					target={FAILING}/>
				</state>

				<!-- DOING SOME WORK -->
				<state name={CONSTRUCTING}
				entered={CONSTRUCT}
				exitingGuard={CONSTRUCTION_EXIT}
				enteringGuard={CONSTRUCT_ENTERING}>

					<transition action={CONSTRUCTED}
					target={NAVIGATING}/>

					<transition action={CONSTRUCTION_FAILED}
					target={FAILING}/>

				</state>

				<!-- READY TO ACCEPT BROWSER OR USER NAVIGATION -->
				<state name={NAVIGATING} entered={NAVIGATE}/>

				<!-- REPORT FAILURE FROM ANY STATE -->
				<state name={FAILING} entered={FAIL}/>

			</fsm>;
}
}