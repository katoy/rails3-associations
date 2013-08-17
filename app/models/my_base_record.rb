class MyBaseRecord < ActiveRecord::Base

  self.abstract_class = true


  alias_method :original_save, :save
  def save(*args)
    begin
      original_save(*args)
    rescue ActiveRecord::StaleObjectError
      add_error
      false
    end
  end

  alias_method :original_save!, :save!
  def save!(*args)
    begin
      original_save!(*args)
    rescue ActiveRecord::StaleObjectError => e
      add_error
      raise e
    end
  end

  alias_method :original_update_attributes, :update_attributes
  def update_attributes(*args)
    begin
      original_update_attributes(*args)
    rescue ActiveRecord::StaleObjectError
      add_error
      false
    end
  end

  alias_method :original_update_attributes!, :update_attributes!
  def update_attributes!(*args)
    begin
      original_update_attributes!(*args)
    rescue ActiveRecord::StaleObjectError => e
      add_error
      raise e
    end
  end

  alias_method :original_destroy, :destroy
  def destroy(*args)
    begin
      original_destroy(*args)
    rescue ActiveRecord::StaleObjectError
      add_error
      false
    end
  end

  alias_method :original_delete, :delete
  def delete(*args)
    begin
      original_delete(*args)
    rescue ActiveRecord::StaleObjectError
      add_error
      false
    end
  end

  private

  def add_error
    errors.add :any, "Someone else already updated this data. Please back and re-edit!"
  end
end
