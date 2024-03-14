# frozen_string_literal: true

# Copyright 2024. Puppet, Inc., a Perforce company. 

require 'spec_helper'

describe 'teched_hello_world::website' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }
      it { is_expected.to contain_class('teched_hello_world::website') }
      it { is_expected.to contain_class('apache') }
      it { is_expected.to contain_apache__vhost('hello_world') }
      it { is_expected.to contain_file('index.html') }
      it { is_expected.to contain_file('css-directory') }
      it { is_expected.to contain_file('img-directory') }
      it { is_expected.to contain_file('js-directory') }

      it "contains a directory named /var/www/" do
        is_expected.to contain_file('/var/www/')
          .with_ensure('directory')
          .that_comes_before([
            'File[index.html]', 
            'File[css-directory]', 
            'File[img-directory]', 
            'File[js-directory]'
          ])
      end
    end
  end
end
