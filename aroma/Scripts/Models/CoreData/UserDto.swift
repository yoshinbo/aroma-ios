import Foundation

@objc(UserDto)
class UserDto: _UserDto {

    override func willSave() {
        super.willSave()
        setPrimitiveValue(NSDate(), forKey: "savedAt")
    }

    override func awakeFromFetch() {
        super.awakeFromFetch()
        status = UserStatus.build(statusValue?.integerValue)
    }

    override var description: String {
        return "id:\(id), facebookId:\(facebookId), name:\(name), status:\(status), updatedAt:\(updatedAt), createdAt:\(createdAt), \(savedAt)"
    }

    var status: UserStatus = .Active {
        didSet {
            statusValue = status.rawValue
        }
    }

    func isMine() -> Bool {
        return Account.sharedInstance.userId == id
    }

    func fill(user: APIResponse.User) {
        id = user.id
        facebookId = user.facebookId
        name = user.name
        createdAt = user.createdAt
        updatedAt = user.updatedAt
    }
}
