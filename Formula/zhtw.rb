class Zhtw < Formula
  include Language::Python::Virtualenv

  desc "Traditional Chinese converter for Taiwan - 讓你的程式碼說台灣話"
  homepage "https://github.com/rajatim/zhtw"
  url "https://files.pythonhosted.org/packages/f6/14/2d9399f1ab4236e8ea1c8d6fc0b8a24248c4004d0abf2818552c65ccf482/zhtw-4.0.1.tar.gz"
  sha256 "40a248d0d3321cde9dc0e9c44ee1cee7e6a24ecf4eb4b15263af0dcec30cd24a"
  license "MIT"

  depends_on "python@3.12"

  resource "click" do
    url "https://files.pythonhosted.org/packages/57/75/31212c6bf2503fdf920d87fee5d7a86a2e3bcf444984126f13d8e4016804/click-8.3.2.tar.gz"
    sha256 "14162b8b3b3550a7d479eafa77dfd3c38d9dc8951f6f69c78913a8f9a7540fd5"
  end

  resource "pyahocorasick" do
    url "https://files.pythonhosted.org/packages/ad/eb/6bf175a745bdb3b247c0f8bff784745f0b30fdfafb5760d635b45d91c607/pyahocorasick-2.3.0.tar.gz"
    sha256 "2960f5838bbcca4d7765c40478ec56f938e3f161946ff84f00c06d2b3a0ba9dd"
  end

  resource "charset-normalizer" do
    url "https://files.pythonhosted.org/packages/e7/a1/67fe25fac3c7642725500a3f6cfe5821ad557c3abb11c9d20d12c7008d3e/charset_normalizer-3.4.7.tar.gz"
    sha256 "ae89db9e5f98a11a4bf50407d4363e7b09b31e55bc117b4f7d80aab97ba009e5"
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
