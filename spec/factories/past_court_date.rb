FactoryBot.define do
  factory :past_court_date, class: "PastCourtDate" do
    association :casa_case
  end
end