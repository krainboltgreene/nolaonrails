module AccountsHelper
  POPOVERS = {
    email:  {
      title: "Email Field",
      content: "Just enter your normal email address. It will never be shared or sold." },
    password:  {
      title: "Password Field",
      content: "Your password can be between 8 and 256 numbers, letters, or special characters." },
    confirmation:  {
      title: "Password Confirmation Field" ,
      content: "Just repeat the password above for this field, to make sure you got it right." },
    name: {
      title: "Name Field",
      content: "Enter your full name. This is only for identification purposes." }
  }

  def email_popover
    POPOVERS[:email]
  end

  def password_popover
    POPOVERS[:password]
  end

  def confirmation_popover
    POPOVERS[:confirmation]
  end

  def name_popover
    POPOVERS[:name]
  end
end
