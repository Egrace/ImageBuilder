require_relative 'spec_helper'

describe ImageProcessing::Processors::BannerProcessor do
  let(:convert) { MiniMagick::Tool::Convert.new }

  describe '#process' do
    context 'with empty params' do
      it 'passes nothing to convert' do
        processor = ImageProcessing::Processors::BannerProcessor.new(nil)
        processor.process(convert)
        expect(convert.args).to be_empty
      end
    end

    context 'with not empty params' do
      let(:source) { 'abcd' }
      let(:processor) { ImageProcessing::Processors::BannerProcessor.new(source: source, x: 12, y: 15, width: 25, height: 14) }

      it 'passes correct geometry to convert' do
        processor.process(convert)
        expect(convert.args.join(' ')).to include('-geometry 25x14+12+15')
      end

      it 'passes composite to convert' do
        processor.process(convert)
        expect(convert.args.join(' ')).to include('-composite')
      end

      it 'passes commands at right sequence' do
        processor.process(convert)
        expect(convert.args[0]).to eq source
        expect(convert.args[1]).to eq '-geometry'
        expect(convert.args.last).to eq '-composite'
      end
    end
  end
end
