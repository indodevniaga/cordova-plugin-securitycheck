import Foundation
@objc(SecurityCheck) class SecurityCheck : CDVPlugin {
    @objc(coolMethod:)
    func coolMethod(_ command: CDVInvokedUrlCommand) {
        let msg = command.arguments[0] as? String ?? "Error"
        print(msg)
        var pluginResult = CDVPluginResult(
            status: CDVCommandStatus_ERROR,
            messageAs: msg)
        if msg.count > 0 {
            pluginResult = CDVPluginResult(
                status: CDVCommandStatus_OK,
                messageAs: msg)
        }
        self.commandDelegate!.send(
            pluginResult,
            callbackId: command.callbackId)
    }

    @objc(isReverseEngineeringDetected:)
    func isReverseEngineeringDetected(command: CDVInvokedUrlCommand) {
        let isReversedEngineered = IOSSecuritySuite.amIReverseEngineered()
        let pluginResult:CDVPluginResult
        pluginResult = CDVPluginResult.init(status: CDVCommandStatus_OK, messageAs: isReversedEngineered)
        self.commandDelegate.send(pluginResult, callbackId: command.callbackId)
    }

    @objc(isTampered:)
    func isTampered(command: CDVInvokedUrlCommand) {
        var isTampered:Bool
        let bundle = command.arguments[0] as? String ?? "Error"
        if IOSSecuritySuite.amITampered([.bundleID(bundle)]).result {
            isTampered = true
        }
        else {
            isTampered = false
        }
        let pluginResult:CDVPluginResult
        pluginResult = CDVPluginResult.init(status: CDVCommandStatus_OK, messageAs: isTampered)
        self.commandDelegate.send(pluginResult, callbackId: command.callbackId)
    }

    @objc(isEmulationDetected:)
    func isEmulationDetected(command: CDVInvokedUrlCommand) {
        let isEmulated = IOSSecuritySuite.amIRunInEmulator()
        let pluginResult:CDVPluginResult
        pluginResult = CDVPluginResult.init(status: CDVCommandStatus_OK, messageAs: isEmulated)
        self.commandDelegate.send(pluginResult, callbackId: command.callbackId)
    }

    @objc(isJailbrokenDetected:)
    func isJailbrokenDetected(command: CDVInvokedUrlCommand) {
        let isEmulated = IOSSecuritySuite.amIJailbroken()
        let pluginResult:CDVPluginResult
        pluginResult = CDVPluginResult.init(status: CDVCommandStatus_OK, messageAs: isEmulated)
        self.commandDelegate.send(pluginResult, callbackId: command.callbackId)
    }
}
