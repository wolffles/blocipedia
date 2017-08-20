FactoryGirl.define do
  factory :wiki do
    title "title"
    body "MyTextBody"
    private false
    user nil
  end
end
