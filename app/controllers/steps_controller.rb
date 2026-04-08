class StepsController < ApplicationController
  def show
    @step = Step.find(params[:id])
    @choices = @step.choices
  end

  def next
    @step = Step.find(params[:id])
    @next_step = @step.next_step

    session[:choice_ids] ||= []
    session[:choice_ids] << params[:choice_id]

    if @next_step
      redirect_to @next_step
    else
      redirect_to result_situation_path(id: @step.situation_id)
    end
  end

  def result
  end
end
