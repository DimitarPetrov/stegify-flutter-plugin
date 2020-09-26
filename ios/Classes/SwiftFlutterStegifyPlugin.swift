import Flutter
import UIKit
import Steg

public class SwiftFlutterStegifyPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "flutter_stegify", binaryMessenger: registrar.messenger())
        let instance = SwiftFlutterStegifyPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "encode":
            if let args = call.arguments as? [String] {
                if args.count == 3 {
                    DispatchQueue(label: "work-queue").async {
                        var error : NSError?
                        StegEncodeByFileNames(args[0], args[1], args[2], &error)
                        if let errorMessage = error?.userInfo.description {
                            DispatchQueue.main.async {
                                result(FlutterError.init(code: "NATIVE_ERR",
                                                         message: "Error: " + errorMessage,
                                                         details: nil))
                            }
                        } else {
                            DispatchQueue.main.async {
                                result(nil)
                            }
                        }
                    }
                } else {
                    result(FlutterError.init(code: "BAD_ARGS",
                                             message: "Wrong arg count (encode expects 3 args): " + args.count.description,
                                             details: nil))
                }
            } else {
                result(FlutterError.init(code: "BAD_ARGS",
                                         message: "Wrong argument types",
                                         details: nil))
            }
        case "decode":
            if let args = call.arguments as? [String] {
                if args.count == 2 {
                    DispatchQueue(label: "work-queue").async {
                        var error : NSError?
                        StegDecodeByFileNames(args[0], args[1], &error)
                        if let errorMessage = error?.userInfo.description {
                            DispatchQueue.main.async {
                                result(FlutterError.init(code: "NATIVE_ERR",
                                                         message: "Error: " + errorMessage,
                                                         details: nil))
                            }
                        } else {
                            DispatchQueue.main.async {
                                result(nil)
                            }
                        }
                    }
                } else {
                    result(FlutterError.init(code: "BAD_ARGS",
                                             message: "Wrong arg count (decode expects 2 args): " + args.count.description,
                                             details: nil))
                }
            } else {
                result(FlutterError.init(code: "BAD_ARGS",
                                         message: "Wrong argument types",
                                         details: nil))
            }
        default:
            result(FlutterMethodNotImplemented)
        }
    }
}
