class Zhtw < Formula
  include Language::Python::Virtualenv

  desc "Traditional Chinese converter for Taiwan - 讓你的程式碼說台灣話"
  homepage "https://github.com/rajatim/zhtw"
  url "https://files.pythonhosted.org/packages/b9/77/29761b3f8388e48cb0e3d3c3bf0b9fb1acdc056e0abbc931a2c9ca6da10a/zhtw-2.8.6.tar.gz"
  sha256 "00c16bf5a33a58408e5bdc587b2015a041acd8b7227dadc11495151d357604dc"
  license "MIT"

  depends_on "python@3.12"

  resource "click" do
    url "https://files.pythonhosted.org/packages/96/d3/f04c7bfcf5c1862a2a5b845c6b2b360488cf47af55dfa79c98f6a6bf98b5/click-8.1.7.tar.gz"
    sha256 "ca9853ad459e787e2192211578cc907e7594e294c7ccc834310722b41b9ca6de"
  end

  resource "pyahocorasick" do
    url "https://files.pythonhosted.org/packages/40/ed/1d10cd5fd5e9da4301bfa0e4c1f668a0c60a0b93fa18e8e5a72e32821857/pyahocorasick-2.1.1.tar.gz"
    sha256 "8fc2c4c30bfca723f9da8ebde0d24bbee13797c4428f53d4edf9e9d6e4422d36"
  end

  resource "charset-normalizer" do
    url "https://files.pythonhosted.org/packages/63/09/c1bc53dab74b1816a00d8d030de5bf98f724c52c1635e07681d312f20be8/charset-normalizer-3.3.2.tar.gz"
    sha256 "f30c3cb33b24454a82faecaf01b19c18562b1e89558fb6c56de4d9118a032fd5"
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
