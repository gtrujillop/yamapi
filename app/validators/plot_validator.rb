class PlotValidator < ActiveModel::Validator

  PLOT_STRUCTURE_KEYS = %i{
    exposition
    inciting_incident
    rising_action
    crisis
    climax
    falling_action
    resolution
  } 

  def validate(record)
    if record.plot.present?
      validate_synopsis(record)
      validate_acts(record)
    end
  end

  private

  def validate_acts(record)
    acts = record.plot[:acts]
    unless acts.is_a?(Array)
      record.errors.add(:plot, I18n.t('plot.invalid_acts_structure')) 
      return
    end

    record.errors.add(:plot, I18n.t('plot.invalid_acts_structure')) unless acts.any? && acts.all? do |act| 
      PLOT_STRUCTURE_KEYS.include?(act[:type].to_sym) && 
        (act[:min_from].present? && act[:min_from].is_a?(Integer)) &&
          (act[:min_to].present? && act[:min_to].is_a?(Integer)) &&
            act[:description].present?
    end
  end

  def validate_synopsis(record)
    record.errors.add(:plot, I18n.t('plot.synopsis_not_present')) unless record.plot[:synopsis]
  end
end
