require_relative 'spec_helper'

describe ImageProcessing::Processors::InputImageProcessor do
  let(:convert) { MiniMagick::Tool::Convert.new }

  describe '#process' do
    context 'with empty params' do
      it 'passes nothing to convert' do
        processor = ImageProcessing::Processors::InputImageProcessor.new(nil)
        processor.process(convert)
        expect(convert.args).to be_empty
      end
    end

    context 'with not empty params' do
      let(:source) { 'abcd' }
      let(:processor) { ImageProcessing::Processors::InputImageProcessor.new(source: source, width: 25, height: 14) }

      it 'passes correct geometry to convert' do
        processor.process(convert)
        expect(convert.args.join(' ')).to include('-geometry 25x14!+0+0')
      end

      it 'passes composite to convert' do
        processor.process(convert)
        expect(convert.args).to include('-composite')
      end

      it 'passes composite to convert' do
        processor.process(convert)
        expect(convert.args).to_not include('-colorize')
      end

      it 'passes commands in right sequence' do
        processor.process(convert)
        expect(convert.args[0]).to eq source
        expect(convert.args[1]).to eq '-geometry'
        expect(convert.args.last).to eq '-composite'
      end
    end

    context 'with passed darken param' do
      let(:processor) { ImageProcessing::Processors::InputImageProcessor.new(source: 'abcd', width: 25, height: 14, darken: '10%') }

      it 'passes composite to convert' do
        processor.process(convert)
        expect(convert.args.join(' ')).to include('-colorize 10%')
      end
    end
  end
end
