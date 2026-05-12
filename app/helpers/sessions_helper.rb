module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def current_user
    # or equals演算子（変数の値がnilなら変数に代入するが、nilでなければ代入しない）
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    # 二重否定でブール値を返すようになる
    !!current_user
  end
end
