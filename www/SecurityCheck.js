var exec = require('cordova/exec');

var SecurityCheck = function () { }; // This just makes it easier for us to export all of the functions at once.
// All of your plugin functions go below this. 
// Note: We are not passing any options in the [] block for this, so make sure you include the empty [] block.
SecurityCheck.coolMethod = function (arg0, onSuccess, onError) {
    exec(onSuccess, onError, "SecurityCheck", "coolMethod", [arg0]);
};
SecurityCheck.isReverseEngineeringDetected = function (onSuccess, onError) {
    exec(onSuccess, onError, 'SecurityCheck', 'isReverseEngineeringDetected', []);
};
SecurityCheck.isTampered = function (bundle, onSuccess, onError) {
    exec(onSuccess, onError, 'SecurityCheck', 'isTampered', [bundle]);
};
SecurityCheck.isEmulationDetected = function (onSuccess, onError) {
    exec(onSuccess, onError, 'SecurityCheck', 'isEmulationDetected', []);
};
module.exports = SecurityCheck;