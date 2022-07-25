class ShopMailer < ApplicationMailer
  def shop(shop)
    @shop = shop
    email = @shop.store.users.uniq.reject { |u| u.position.name.in? ["Manager", "Crew", "Business Director"]}.map(&:email).push("nstagg@staggrp.com")
    email.push('pruiz@staggrp.com') if @shop.docRequired || @shop.score.to_f > 90
    email = email.join(',')
    mail(from: 'shop@qsrtasks.com', to: email, subject: "#{@shop.store.number} was shopped by #{@shop.user.full_name}")
  end
end
