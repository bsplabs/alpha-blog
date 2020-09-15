module ApplicationHelper
    def gravatar(user, options = {size: 80})
        email_address = user.email.downcase
        hash = Digest::MD5.hexdigest(email_address)
        size = options[:size]
        gravatar_url = "https://www.gravatar.com/avatar/#{hash}?s=#{size}"
        image_tag(gravatar_url, class: "rounded shadow mx-auto d-block", alt: user.username)
    end
end
