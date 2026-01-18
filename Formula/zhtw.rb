class Zhtw < Formula
  include Language::Python::Virtualenv

  desc "Traditional Chinese converter for Taiwan - 讓你的程式碼說台灣話"
  homepage "https://github.com/rajatim/zhtw"
  url "https://files.pythonhosted.org/packages/a3/4f/90450b327e4797fb460cac65251c7eca3fea99cf80bbb242fa35f972e624/zhtw-2.8.7.tar.gz"
  sha256 "58f73792ad339d326b65116c80164aabb6ad7467d2b7f2327b1606062c45b89e"
  license "MIT"

  depends_on "python@3.12"

  resource "click" do
    url "https://files.pythonhosted.org/packages/3d/fa/656b739db8587d7b5dfa22e22ed02566950fbfbcdc20311993483657a5c0/click-8.3.1.tar.gz"
    sha256 "58f73792ad339d326b65116c80164aabb6ad7467d2b7f2327b1606062c45b89e"
  end

  resource "pyahocorasick" do
    url "https://files.pythonhosted.org/packages/ad/eb/6bf175a745bdb3b247c0f8bff784745f0b30fdfafb5760d635b45d91c607/pyahocorasick-2.3.0.tar.gz"
    sha256 "58f73792ad339d326b65116c80164aabb6ad7467d2b7f2327b1606062c45b89e"
  end

  resource "charset-normalizer" do
    url "https://files.pythonhosted.org/packages/13/69/33ddede1939fdd074bce5434295f38fae7136463422fe4fd3e0e89b98062/charset_normalizer-3.4.4.tar.gz"
    sha256 "58f73792ad339d326b65116c80164aabb6ad7467d2b7f2327b1606062c45b89e"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    # Test version output
    assert_match version.to_s, shell_output("#{bin}/zhtw --version")

    # Test basic conversion check
    (testpath/"test.txt").write("软件测试")
    output = shell_output("#{bin}/zhtw check #{testpath}/test.txt", 1)
    assert_match "軟體", output
  end
end
