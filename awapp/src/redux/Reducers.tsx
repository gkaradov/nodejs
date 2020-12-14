import { combineReducers } from 'redux';
 
const INITIAL_STATE = {
  current: [],
  all_attributes: [
    'SearchTerm',
    'SelectedLocation',
    'SessionDuration',
    'Accelerometer',
    'Gyroscope',
    'Magnetometer',
    'ProximitySensor',
    'AmbientLightSensor',
    'LastUpdated',
  ],
};
 
const attributeReducer = (state = INITIAL_STATE, action) => {
  switch (action.type) {
    case 'SSELECT_LOCATION':  
      // copy the state 
      const { current,  all_attributes,} = state;
 
      //remove a subject from the all_subjects array
      const addedProperties = all_attributes.splice(action.payload, 1);
 
      // put subject in current array
      current.push(addedProperties);
 
      // update the redux state to reflect the change
      const newState = { current, all_attributes };
       
      //return new state
      return newState;

    default:
      return state
  }
};
 
export default combineReducers({
  subjects: attributeReducer
});