require 'date'

class MeetupController < ApplicationController
  def check
	  id = params[:id]
	  start_time = Time.parse(params[:start])
	  end_time = Time.parse(params[:end])

	  if not (id and start_time and end_time)
		  return
	  end

	  db = BaseDBModel.new()

	  all_times = Array.new()
	  db.find(:FriendsMapping, {:owner_id => BSON::ObjectId(params[:id])}).each do |friend|
		  db.find(:Meetups, {:owner_id => friend[:friend_id]}).each do |doc|
			  if time_fits(start_time, end_time, doc[:start], doc[:end])
				  user = db.find_one(:Users, {:_id => doc[:owner_id]})
				  all_times << {
							'start'		=> doc[:start],
							'end'		=> doc[:end]  ,
							'owner_id'	=> doc[:owner_id],
							'name'		=> user[:name],
							'meeting_id'	=> doc[:_id]
				  }
			  end
		  end
	  end

	  render :json => all_times.compact
  end

  def time_fits(this_start, this_end, other_start, other_end)
	  if not((this_start >= other_start and this_end <= other_end) or (this_start <= other_start and this_end >= other_end))
		  start_discreptency = ((this_start - other_start) * 24 * 60).to_i
		  end_discreptency = ((this_end - other_end) * 24 * 60).to_i
		  if start_discreptency < 30 and end_discreptency < 30
			  return true
		  end
		  return false
	  else
		  return true
	  end
  end

  def submit
	  id = params[:id]
	  start_time = params[:start]
	  end_time = params[:start]
	  db = BaseDBModel.new()

	  db.create(:Meetups, {"owner_id": BSON::ObjectId(id), "start": Time.parse(start_time), "end": Time.parse(end_time)})
  end
end
