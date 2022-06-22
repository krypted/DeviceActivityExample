import SwiftUI
import FamilyControls
import ManagedSettings

@main
struct DActivityApp: App {
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate
    
    @StateObject var model = DataModel.shared
    @StateObject var store = ManagedSettingsStore()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(model)
                .environmentObject(store)
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {

        AuthorizationCenter.shared.requestAuthorization { result in
            switch result {
            case .success():
                break
            case .failure(let error):
                print("Error for Family Controls: \(error)")
            }
        }

        ScheduleModel.setSchedule()
        
        return true
    }
}
