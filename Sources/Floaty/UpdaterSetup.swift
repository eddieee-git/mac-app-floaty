import Foundation

/// 공통 업데이트(AppUpdater.swift)에 Floaty 정보를 넣는다. AppUpdater.swift는 mac-app/shared에서 복사해 오므로 여기만 고친다.
extension AppUpdater {
    /// scripts/sign-update.swift로 만든 키의 공개 키
    nonisolated static let appPublicKey = "SV2SD+EZzQQtfJZCIsPGgtl6IXnO6NXXaoDEKSp5v2c="
    nonisolated static let appSignatureFormat = SignatureFormat.dmg

    static let shared = AppUpdater(.init(
        appName: "Floaty",
        repo: "eddieee-git/mac-app-floaty",
        publicKey: appPublicKey,
        signatureFormat: appSignatureFormat,
        isEnglish: { Localization.language == .english },
        // 0.2.2까지 쓰던 "새 버전이 있는지 자동으로 확인" 설정
        legacyAutoCheckKey: "checkForUpdates"
    ))
}
