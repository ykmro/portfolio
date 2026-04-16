Situation.destroy_all

3.times do |j|
  situation = Situation.create!(
    title: "タイトル#{j + 1}",
    overview: "概要#{j + 1}",
    scenario: "シナリオ#{j + 1}",
    thumbnail: ""
  )

  3.times do |i|
    step = situation.steps.create!(
      step_number: i + 1,
      body: "ステップ#{i + 1}の説明文"
    )

    step.choices.create!([
      { body: "選択肢A", is_correct: true,  feedback: "正解の解説文" },
      { body: "選択肢B", is_correct: false, feedback: "不正解の解説文" },
      { body: "選択肢C", is_correct: false, feedback: "不正解の解説文" },
      { body: "選択肢D", is_correct: false, feedback: "不正解の解説文" }
    ])
  end
end
