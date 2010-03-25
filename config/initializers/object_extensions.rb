class Object
  def nonblank?
    self if !blank?
  end
end