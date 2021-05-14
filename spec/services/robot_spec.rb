require 'rails_helper'

RSpec.describe 'Robot', type: :service do
  subject { Robot.new(0, 0, 'North').help_command }
  describe 'help_command' do
    let(:help_command_text) do
      "Command the robot with:\n" \
      "L - turn left\n" \
      "R - turn right\n" \
      "M - move forward\n" \
      "? - this message\n" \
      "Q - quit\n"
    end
    it { expect { subject }.to output(help_command_text).to_stdout }
  end

  describe 'end_session' do
    let(:end_text) { "Robot shutting down.\n" }
    subject { Robot.new(0, 0, 'North').end_session }
    it { expect { subject }.to output(end_text).to_stdout }
  end

  describe 'turn_left' do
    let(:x) { 1 }
    let(:y) { 1 }
    let(:coordinate) { "(#{x}, #{y})" }
    let(:result) do
      "Robot at #{coordinate} facing #{position}\n"
    end
    subject { Robot.new(x, y, facing).turn_left(x, y) }

    context 'when facing North' do
      let(:facing) { 'North' }
      let(:position) { 'West' }
      it { expect { subject }.to output(result).to_stdout }
    end

    context 'when facing South' do
      let(:facing) { 'South' }
      let(:position) { 'East' }
      it { expect { subject }.to output(result).to_stdout }
    end

    context 'when facing East' do
      let(:facing) { 'East' }
      let(:position) { 'North' }
      it { expect { subject }.to output(result).to_stdout }
    end

    context 'when facing West' do
      let(:facing) { 'West' }
      let(:position) { 'South' }
      it { expect { subject }.to output(result).to_stdout }
    end
  end

  describe 'turn_right' do
    let(:x) { 2 }
    let(:y) { 0 }
    let(:coordinate) { "(#{x}, #{y})" }
    let(:result) do
      "Robot at #{coordinate} facing #{position}\n"
    end
    subject { Robot.new(x, y, facing).turn_right(x, y) }

    context 'when facing North' do
      let(:facing) { 'North' }
      let(:position) { 'East' }
      it { expect { subject }.to output(result).to_stdout }
    end

    context 'when facing South' do
      let(:facing) { 'South' }
      let(:position) { 'West' }
      it { expect { subject }.to output(result).to_stdout }
    end

    context 'when facing East' do
      let(:facing) { 'East' }
      let(:position) { 'South' }
      it { expect { subject }.to output(result).to_stdout }
    end

    context 'when facing West' do
      let(:facing) { 'West' }
      let(:position) { 'North' }
      it { expect { subject }.to output(result).to_stdout }
    end
  end

  describe 'move' do
    let(:x) { 0 }
    let(:y) { 0 }
    let(:coordinate) { "(#{x}, #{y})" }
    let(:result) do
      "Robot at #{expected_cordinate} facing #{facing}\n"
    end
    subject { Robot.new(x, y, facing).move }

    context 'when facing North' do
      let(:facing) { 'North' }
      let(:expected_cordinate) { "(#{x}, #{y + 1})" }
      it { expect { subject }.to output(result).to_stdout }
    end

    context 'when facing South' do
      let(:facing) { 'South' }
      let(:expected_cordinate) { "(#{x}, #{y - 1})" }
      it { expect { subject }.to output(result).to_stdout }
    end

    context 'when facing East' do
      let(:facing) { 'East' }
      let(:expected_cordinate) { "(#{x + 1}, #{y})" }
      it { expect { subject }.to output(result).to_stdout }
    end

    context 'when facing West' do
      let(:facing) { 'West' }
      let(:expected_cordinate) { "(#{x - 1}, #{y})" }
      it { expect { subject }.to output(result).to_stdout }
    end
  end
end
