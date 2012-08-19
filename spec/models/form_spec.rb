describe Form do
  it 'should validate uniqueness of name' do
    create(:form, name: 'Form')
    form = build(:form, name: 'Form')
    form.should_not be_valid
  end

  it 'should validate presence of name' do
    form = build(:form, name: ' ')
    form.should_not be_valid
  end
end
