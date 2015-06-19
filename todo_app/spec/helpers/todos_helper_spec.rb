require 'rails_helper'

describe TodosHelper do
  # pending "add some examples to (or delete) #{__FILE__}"

  describe "newlineメソッドは〜" do

    it "改行を〜<br />におきかえる〜" do
      expect(helper.new_line("abc\nxyz\n123")).to eq("abc<br>xyz<br>123")
    end

    it "エスケープする〜" do
      expect(helper.new_line("<table>")).to eq("&lt;table&gt;")
    end

    it "当然しっぱいする" do
      expect(true).to eq false
    end
  end
end
