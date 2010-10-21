package org.osflash.statemachine.core
{
/**
 * Contract with FSMInjector to encapsulate creation of concrete IState instances.
 */
public interface IStateDecoder
{
    function setData( value:Object ):void;

    /**
     * This the factory method for decoding the state definition into a concrete IState.
     * @param stateDef the data defining the IState to be created.
     * @return the decoded state.
     */
    function decodeState( stateDef:Object ):IState;

    /**
     * Ascertains whether a state is the initial state.
     * @param stateName the name of the state.
     * @return
     */
    function isInitial( stateName:String ):Boolean;

    function getStateList():Array;

	function destroy():void;
    
}
}