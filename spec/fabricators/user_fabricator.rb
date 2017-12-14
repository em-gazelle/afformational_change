Fabricator(:user) do
  email    { Faker::Internet.email }
  phone    "MyString"
  name     "MyString"
  timezone "MyString"
  password "oops55!!!!"
  password_confirmation "oops55!!!!"
  personal_afformation_focus_area ["career", "health"]
end
