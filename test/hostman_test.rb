require 'test_helper'

describe Hostman do
  it "has a version" do
    ::Hostman::VERSION.wont_be_nil
  end

  it "can output the current version" do
    result = `hostman --version`.chop
    result.must_equal ::Hostman::VERSION
  end

  it "warns gracefully if both --block and --unblock are set" do
    result = `hostman --block test.com --unblock test.com`.chop
    result.must_equal ::Hostman::BLOCK_UNBLOCK_ERROR
  end

  it "can output the contents of the hosts file" do
    result = `hostman --output-hosts`
    cat_result = `cat /etc/hosts`
    result.must_equal cat_result

    result = `hostman --output-hosts --hosts-file ./test/fixtures/hosts1`.chop
    result.must_equal ::Fixtures::HOSTS_CONTENT
  end

  it "can block and unblock a domain" do
    `hostman --block test.com --hosts-file ./test/fixtures/hosts2`

    result = `hostman --block test2.com --hosts-file ./test/fixtures/hosts2 --output-hosts`.chop
    result.must_equal "#{::Fixtures::HOSTS_CONTENT}\n127.0.0.1\ttest.com\n127.0.0.1\ttest2.com"

    result = `hostman --unblock test.com --hosts-file ./test/fixtures/hosts2 --output-hosts`.chop
    result.must_equal "#{::Fixtures::HOSTS_CONTENT}\n127.0.0.1\ttest2.com"
  end

  it "will not block more than once" do
    `hostman --block test.com --hosts-file ./test/fixtures/hosts2`

    result = `hostman --block test.com --hosts-file ./test/fixtures/hosts2 --output-hosts`.chop
    result.must_equal "#{::Fixtures::HOSTS_CONTENT}\n127.0.0.1\ttest.com"
  end
end
