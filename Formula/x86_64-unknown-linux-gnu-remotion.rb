# frozen_string_literal: true

require_relative "../lib/toolchain"

class X8664UnknownLinuxGnuRemotion < Toolchain
  desc "x86_64 Linux GNU toolchain"
  version "0.1.0"

  defconfig <<~EOS
    CT_ARCH_64=y
    CT_ARCH_X86=y
  EOS
  glibc_version "2.26"
  linux_version "3.10"

  def test_signature(sig)
    assert_match "ELF 64-bit LSB executable, x86-64, version 1 (SYSV)", sig
    assert_match "GNU/Linux 3.10.108", sig
  end
end
