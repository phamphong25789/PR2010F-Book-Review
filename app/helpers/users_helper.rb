module UsersHelper

def gravatar_for(user, size: 80)
  gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
  gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
  #gravatar_url = image_url("11.jpg");
  image_tag(gravatar_url, alt: user.name, class: "gravatar")
end
end