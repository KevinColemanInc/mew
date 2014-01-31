module Archivable

  def archived?
    self.archived_at.present?
  end

  def archive
    self.archived_at = Time.now
  end

  def unarchive
    self.archived_at = nil
  end

end