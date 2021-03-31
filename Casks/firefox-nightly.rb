cask "firefox-nightly" do
  version :latest
  sha256 :no_check

  language "cs" do
    "cs"
  end
  language "de" do
    "de"
  end
  language "en-CA" do
    "en-CA"
  end
  language "en-GB" do
    "en-GB"
  end
  language "en", default: true do
    "en-US"
  end
  language "eo" do
    "eo"
  end
  language "es-AR" do
    "es-AR"
  end
  language "es-CL" do
    "es-CL"
  end
  language "es-ES" do
    "es-ES"
  end
  language "fi" do
    "fi"
  end
  language "fr" do
    "fr"
  end
  language "gl" do
    "gl"
  end
  language "in" do
    "hi-IN"
  end
  language "it" do
    "it"
  end
  language "ja" do
    "ja-JP-mac"
  end
  language "ko" do
    "ko"
  end
  language "nl" do
    "nl"
  end
  language "pl" do
    "pl"
  end
  language "pt-BR" do
    "pt-BR"
  end
  language "pt" do
    "pt"
  end
  language "ru" do
    "ru"
  end
  language "tr" do
    "tr"
  end
  language "uk" do
    "uk"
  end
  language "zh-TW" do
    "zh-TW"
  end
  language "zh" do
    "zh-CN"
  end

  url "https://download-installer.cdn.mozilla.net/pub/firefox/nightly/latest-mozilla-central#{language == "en-US" ? "" : "-l10n"}/" do |page|
    file_path = page.scan(%r{<td><a href="(/pub/firefox/nightly/[^"]+\.mac\.dmg)">}).flatten.grep(/\.#{language}\.mac\.dmg/).max
    [URI.join(page.url, file_path), { verified: "mozilla.net" }]
  end
  name "Mozilla Firefox Nightly"
  desc "Web browser"
  homepage "https://www.mozilla.org/firefox/channel/desktop/#nightly"

  depends_on macos: ">= :sierra"

  app "Firefox Nightly.app"

  zap trash: [
    "/Library/Logs/DiagnosticReports/firefox_*",
    "~/Library/Application Support/Firefox",
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/org.mozilla.firefox.sfl*",
    "~/Library/Application Support/CrashReporter/firefox_*",
    "~/Library/Caches/Firefox",
    "~/Library/Caches/Mozilla/updates/Applications/Firefox",
    "~/Library/Caches/org.mozilla.firefox",
    "~/Library/Preferences/org.mozilla.firefox.plist",
    "~/Library/Saved Application State/org.mozilla.firefox.savedState",
    "~/Library/WebKit/org.mozilla.firefox",
  ],
      rmdir: [
        "~/Library/Application Support/Mozilla", #  May also contain non-Firefox data
        "~/Library/Caches/Mozilla/updates/Applications",
        "~/Library/Caches/Mozilla/updates",
        "~/Library/Caches/Mozilla",
      ]
end
