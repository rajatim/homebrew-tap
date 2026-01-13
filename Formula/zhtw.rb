class Zhtw < Formula
  include Language::Python::Virtualenv

  desc "Traditional Chinese converter for Taiwan - 讓你的程式碼說台灣話"
  homepage "https://github.com/rajatim/zhtw"
  url "https://files.pythonhosted.org/packages/b9/77/29761b3f8388e48cb0e3d3c3bf0b9fb1acdc056e0abbc931a2c9ca6da10a/zhtw-2.8.6.tar.gz"
  sha256 "00c16bf5a33a58408e5bdc587b2015a041acd8b7227dadc11495151d357604dc"
  license "MIT"

  depends_on "python@3.12"

  resource "click" do
    url "https://files.pythonhosted.org/packages/3d/fa/656b739db8587d7b5dfa22e22ed02566950fbfbcdc20311993483657a5c0/click-8.3.1.tar.gz"
    sha256 "12ff4785d337a1bb490bb7e9c2b1ee5da3112e94a8622f26a6c77f5d2fc6842a"
  end

  resource "pyahocorasick" do
    url "https://files.pythonhosted.org/packages/ad/eb/6bf175a745bdb3b247c0f8bff784745f0b30fdfafb5760d635b45d91c607/pyahocorasick-2.3.0.tar.gz"
    sha256 "2960f5838bbcca4d7765c40478ec56f938e3f161946ff84f00c06d2b3a0ba9dd"
  end

  resource "charset-normalizer" do
    url "https://files.pythonhosted.org/packages/13/69/33ddede1939fdd074bce5434295f38fae7136463422fe4fd3e0e89b98062/charset_normalizer-3.4.4.tar.gz"
    sha256 "94537985111c35f28720e43603b8e7b43a6ecfb2ce1d3058bbe955b73404e21a"
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
