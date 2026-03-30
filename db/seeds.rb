Situation.destroy_all

situation = Situation.create!(
  title: "タイトル",
  overview: "概要",
  scenario: "シナリオ",
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
    { body: "選択肢D", is_correct: false, feedback: "不正解の解説文" },
  ])
end