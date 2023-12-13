# [P] K'ed by TNT team from https://appstorrent.ru/, modified from: https://github.com/Homebrew/homebrew-cask/blob/HEAD/Casks/a/abbyy-finereader-pdf.rb
cask "abbyy-finereader-pdf" do
  version "1402.18"
  sha256 :no_check

  vers = "15.2.13"

  url "https://vk.com/doc781359414_670983753",
      verified: "vk.com/"
  name "ABBYY FineReader PDF"
  desc "Scan, OCR, and convert documents to searchable PDFs and other formats"
  homepage "https://appstorrent.ru/16-abbyy-finereader-pdf.html"

  livecheck do
    url "https://www.abbyy.com/finereader-pdf-mac-downloads/"
    regex(%r{(?:Part #:.*?\n<td>)(\d+(?:[./]\d+)+)}i)
    strategy :page_match do |page, regex|
      page.scan(regex).map { |match| match[0].tr("/", ".") }
    end
  end

  container nested: "Manual install/ABBYY FineReader PDF #{vers} [TNT].dmg"

  app "ABBYY FineReader PDF.app"

  zap trash: [
    "~/Library/Application Support/ABBYY",
    "~/Library/Preferences/com.abbyy.finereader.pdf.plist",
    "~/Library/Preferences/com.abbyy.FineReader.plist",
    "~/Library/Preferences/com.abbyy.FRPDFViewer.plist",
    "~/Library/Preferences/com.abbyy.ImageProcessService*.plist",
    "~/Library/Saved Application State/com.abbyy.FineReader.savedState",
    "~/Library/Saved Application State/com.abbyy.FRPDFViewer.savedState",
  ]
end
