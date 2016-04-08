require 'spec_helper'
describe 'cloudwatch' do

  context 'with defaults for all parameters' do
    let(:params) {{
      :metric_data  => :undef,
      :metric_alarm => :undef,
      :set_alarm    => :undef,
      :metric_list  => :undef,
    }}

    it { should contain_class('cloudwatch') }
    it { is_expected.to compile }
    it { is_expected.to have_resource_count(0) }
    it { is_expected.to have_class_count(1) }
  end
end
