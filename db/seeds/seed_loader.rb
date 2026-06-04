yaml_dir = File.join(__dir__, "situations")

Dir.glob(File.join(yaml_dir, "*.yml")).sort.each do |file|
  data = YAML.load_file(file)

  # find_or_initialize_by : 条件を指定して初めの1件を取得し1件もなければ作成
  situation = Situation.find_or_initialize_by(slug: data["slug"])
  situation.assign_attributes(
    title:     data["title"],
    overview:  data["overview"],
    scenario:  data["scenario"],
    thumbnail: data["thumbnail"]
  )
  situation.save!

  (data["steps"] || []).each do |step_data|
    step = situation.steps.find_or_initialize_by(step_number: step_data["step_number"])
    step.body = step_data["body"]
    step.save!

    (step_data["choices"] || []).each do |choice_data|
      choice = step.choices.find_or_initialize_by(body: choice_data["body"])
      choice.assign_attributes(
        feedback:   choice_data["feedback"],
        is_correct: choice_data["is_correct"]
      )
      choice.save!
    end
  end
end
