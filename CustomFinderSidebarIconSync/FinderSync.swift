import Cocoa
import FinderSync

class FinderSync: FIFinderSync {

    override init() {
        super.init()
        
        if let path = Bundle.main.path(forResource: "URLs", ofType: nil),
           let fileString = try? String(contentsOfFile: path) {
            
            let urlStrings = fileString.split(separator: "\n")
            var myFolderURLs: Set<URL> = Set(urlStrings.map { URL(fileURLWithPath: String($0)) })
            FIFinderSyncController.default().directoryURLs = myFolderURLs
            
        }
    }
}
