module GoalRewardsHelper
  def goal_reward_stat class_name, stat, label, description = nil, &block
    haml_tag :div, :class => class_name do
      haml_tag :span, :class => 'badge badge-info' do
        haml_concat stat
      end
      haml_tag :strong do
        haml_concat label
      end
      unless description.nil?
        haml_tag :span, :class => :description do
          haml_concat description
        end
      end
      if block_given?
        block.call
      end
    end
  end
end
