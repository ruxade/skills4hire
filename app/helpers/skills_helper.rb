module SkillsHelper
  def categorize_skill(skill)
    case skill.title.downcase
    when /spanish|french|language/
      'Language'
    when /guitar|music|piano/
      'Music'
    when /archery|tennis|sports/
      'Sports'
    when /python|programming|tech/
      'Tech'
    when /yoga|wellness/
      'Wellness'
    when /creative|writing|art/
      'Art'
    when /cooking|culinary/
      'Culinary'
    when /business|finance/
      'Business'
    else
      'Other'
    end
  end
end
