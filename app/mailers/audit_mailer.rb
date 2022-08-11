class AuditMailer < ApplicationMailer
  default from: 'audit@qsrtasks.com'

  def safe_audit(audit)
    @safe_audit = audit
    email = audit.store.users.where(active: true).uniq.reject { |u| u.position.name.in? ['Manager', 'Crew'] }.map(&:email)
    email.push("ewilmot@staggrp.com").flatten.uniq
    mail(to: email, subject: "Safe Audit has been completed by #{audit.auditor.full_name} at #{audit.store.number}")
  end

  def food_safety_audit(audit)
    @food_safety_audit = audit
    email = audit.store.users.where(active: true).uniq.reject { |u| u.position.name.in? ['Manager', 'Crew'] }.map(&:email)
    mail(to: email, subject: "Food Safety Audit has been completed by #{audit.auditor.full_name} at #{audit.store.number}")
  end

end
